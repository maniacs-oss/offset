#![crate_type = "lib"] 
#![feature(futures_api, pin, async_await, await_macro, arbitrary_self_types)]
#![feature(nll)]
#![feature(try_from)]
#![feature(generators)]
#![feature(never_type)]
#![feature(dbg_macro)]
#![feature(map_get_key_value)]


#[macro_use]
extern crate log;

mod server;
mod graph;
mod hash_clock;
mod verifier;