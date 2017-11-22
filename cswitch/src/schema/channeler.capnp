@0xa235992fe59d8f83;

# A custom made 128 bit data structure. This is used to overcome a limitation
# of capnproto to define large fixed sized arrays.
struct CustomUInt128 {
        x0 @0: UInt64;
        x1 @1: UInt64;
}

struct CustomUInt256 {
        x0 @0: UInt64;
        x1 @1: UInt64;
        x2 @2: UInt64;
        x3 @3: UInt64;
}

struct InitChannel {
        channelRandValue @0: CustomUInt128;
}

struct Exchange {
        commPublicKey @0: CustomUInt256;
        # Communication public key (Generated for the new channel)
        # Using diffie-hellman we will use the communication keys to generate a
        # symmetric encryption key for this channel.
        keySalt @1: CustomUInt256;
        # A salt for the generation of a shared symmetric encryption key.
        senderRandValue @2: CustomUInt128;
        # This is the first senderRandValue. It will be used by the remote
        # party to send messages to us on this channel.
        signature @3: CustomUInt256; 
        # Signature over (channelRandValue || commPublicKey || keySalt || senderRandValue)
}

# Contents for a keepalive message:
struct KeepaliveContent {
        recentRecipientRandValue @0: CustomUInt128;
        senderRandValue @1: CustomUInt128;
}

# This is the structure of the encrypted_content of EncMessage:
struct PlainContent {
        recentRecipientRandValue @0: CustomUInt128;
        senderRandValue @1: CustomUInt128;
        messageContent @2: Data;
}

struct EncMessage {
        encryptedContent @0: Data;
}

# Message container:
enum MessageType {
        initChannel @0;
        exchange @1;
        keepaliveMessage @2;
        encMessage @3;
}

struct Message {
        messageType @0: MessageType;
        message @1: Data;
}
