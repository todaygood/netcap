FROM openeuler22-go:1.21.13 AS  go-base

ENV GOOS=linux GOARCH=amd64

ENV GOCACHE=/tmp/.go/cache
ENV GOMODCACHE=/tmp/.go/modcache
ENV GOTMPDIR=/tmp/.go/tmp
ENV CGO_ENABLED=0

RUN mkdir -p /tmp/.go/cache /tmp/.go/modcache /tmp/.go/tmp /app

RUN go env -w GOPROXY='https://goproxy.io,direct'

RUN yum install -y bcc bcc-devel libpcap-devel

WORKDIR /app

ADD . netcap


RUN cd netcap &&  make

