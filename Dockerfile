FROM docker.io/pihole/pihole

LABEL maintainer="Jeroen Beerstra <jeroen@beerstra.org>"

ARG CLOUDFLARE_UID=1001
ARG CLOUDFLARE_GID=1001

ENV CLOUDFLARE_USER=cloudflare

RUN curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /usr/bin/cloudflared \
  && chmod 0755 /usr/bin/cloudflared \
  && addgroup -S cloudflare -g ${CLOUDFLARE_GID} && adduser -S cloudflare -G cloudflare -u ${CLOUDFLARE_UID}
    
COPY ./config.yml /etc/cloudflared/config.yml
COPY --chmod=0755 ./start.sh /usr/bin/start.sh

ENTRYPOINT ["start.sh"]
