FROM golang:1.10.2 as builder
ADD . /src
RUN cd /src && go build -o hello-world

FROM ubuntu:16.04
MAINTAINER yuyang <yyangplus@gmail.com>
RUN mkdir -p /kae/app
WORKDIR /kae/app

COPY --from=builder /src/hello-world /kae/app/hello-world

CMD ["./hello-world"]
