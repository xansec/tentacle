# Build Stage
FROM --platform=linux/amd64 rustlang/rust:nightly as builder

## Add source code to the build stage.
ADD . /tentacle
WORKDIR /tentacle

## Build instructions
RUN cargo build --example simple
EXPOSE 1337
ENTRYPOINT cargo run --example simple --features ws -- server
