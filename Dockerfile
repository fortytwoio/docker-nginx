## Version 1.0.0
FROM fortytwoio/base-image
MAINTAINER Thomas Fritz <thomas.fritz@forty-two.io>

RUN \
    DEBIAN_FRONTEND=noninteractive apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qqy --no-install-recommends nginx-light

ADD ./etc/nginx /etc/nginx 
RUN mkdir -p /var/log/nginx
VOLUME ["/srv/www/"]
EXPOSE 80
CMD ["/usr/sbin/nginx"]
