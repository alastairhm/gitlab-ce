#FROM 761045508220.dkr.ecr.eu-west-2.amazonaws.com/dwp/ucfs/platform/base:ucfs-build-latest
FROM node:current-alpine3.14

RUN apk upgrade --no-cache && \
    apk add --no-cache \
      sudo \
      ruby ruby-bundler ruby-rdoc ruby-rake ruby-bigdecimal ruby-irb \
      postgresql-client \
      tzdata \
      procps \
      nginx \
      patch \
      dcron \
      logrotate \
      git

COPY assets /home/git/assets/

RUN adduser -s /bin/sh -g 'GitLab' -D git; \
    chown -R git:git /home/git; \
    ash -ex /home/git/assets/build/install.sh

ENTRYPOINT ["/home/git/assets/runtime/docker-entrypoint.sh"]

EXPOSE 80/tcp 443/tcp

VOLUME ["/home/git/data","/var/log","/etc/gitlab/"]
