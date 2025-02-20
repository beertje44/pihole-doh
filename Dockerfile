FROM docker.io/pihole/pihole

MAINTAINER Jeroen Beerstra <jeroen@beerstra.org>

RUN curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -o /usr/bin/cloudflared
RUN chmod 0755 /usr/bin/cloudflared
    
COPY ./config.yml /etc/cloudflared/config.yml
COPY --chmod=0755 ./start.sh /usr/bin/start.sh

ENTRYPOINT ["start.sh"]
