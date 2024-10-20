FROM ghcr.io/cynix/freebsd:minimal AS builder
RUN pw groupadd -n sing-box -g 360
RUN pw useradd -n sing-box -u 360 -g sing-box

FROM ghcr.io/cynix/freebsd:static
ARG TARGETARCH
COPY bin/${TARGETARCH}/sing-box /usr/local/bin/sing-box
COPY --from=builder /etc/group /etc/master.passwd /etc/passwd /etc/pwd.db /etc/spwd.db /etc/
USER sing-box:sing-box
ENTRYPOINT ["/usr/local/bin/sing-box"]
