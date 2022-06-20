FROM rust as builder

ADD . /ropr
WORKDIR /ropr


RUN cargo build --release

FROM ubuntu:20.04

COPY --from=builder /ropr/target/release/ropr /
COPY --from=builder /ropr/tests /testsuite
