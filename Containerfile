FROM ghcr.io/cynix/freebsd:static

ARG TARGETARCH

COPY bin/${TARGETARCH}/sing-box /usr/local/bin/sing-box

ENTRYPOINT ["/usr/local/bin/sing-box"]
