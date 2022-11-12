# caddy-ionos-dns
[caddyserver/caddy](https://github.com/caddyserver/caddy) with the Caddy [DNS Module for Ionos](https://github.com/caddy-dns/ionos)

## Github Repository / Dockerfile
https://github.com/Glopix/caddy-ionos-dns

## Usage
For further information and more detailed instructions on the use of this container/caddy-module, please refer to the https://github.com/caddyserver/caddy and https://github.com/caddy-dns/ionos on how to use the DNS module.

### Docker Compose Example (excluding backend/reverse proxy target)
docker-compose.yml
```
version: "3.8"

services:
  caddy:
    image: glopix/caddy-ionos-dns
    restart: unless-stopped
    ports:
      - 80:80
      - 443:443
    environment:
      - CADDY_INGRESS_NETWORKS=caddy
# if you want an additional Caddyfile:
# (e.g. if you dont want to configure the ACME-DNS module via labels)
#      - CADDY_DOCKER_CADDYFILE_PATH=/data/Caddyfile

    networks:
      - caddy
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - caddy_data:/data
# if you want an additional  Caddyfile:      
#      - ./Caddyfile:/data/Caddyfile

networks:
  caddy:
    name: caddy
    driver: bridge

# persistant storage for certs etc.
volumes:
  caddy_data:
```

### Caddyfile Example
Caddyfile
```
your.domain.com {
  respond "Hello World"	# replace with whatever config you need...
  tls {
    dns ionos {env.YOUR_IONOS_AUTH_API_TOKEN}
  }
}
```
