FROM caddy:builder AS builder
RUN xcaddy build \
--with github.com/caddy-dns/ionos \
--with github.com/mholt/caddy-l4

FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
