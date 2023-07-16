FROM php:8.2-alpine

LABEL maintainer="Ezra Lazuardy <ezralucio@gmail.com>"
LABEL org.opencontainers.image.description "A battery-included CI/CD Environment for Laravel."

ARG WWWGROUP=1000
ARG WWWUSER=1000
ARG NODE_VERSION=18
ARG POSTGRES_VERSION=15

WORKDIR /var/www/html

ENV TZ=UTC

RUN echo $TZ > /etc/timezone
RUN apk add bash zip unzip curl sqlite nginx supervisor git imagemagick nodejs npm
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN chmod +x /usr/local/bin/install-php-extensions
RUN sed -i 's/bin\/ash/bin\/bash/g' /etc/passwd

RUN install-php-extensions \
    mysqli pdo_mysql pdo_pgsql \
    sqlite3 fileinfo xml \
    gd imagick curl \
    imap exif mbstring \
    xml zip bcmath \
    soap intl readline \
    ldap msgpack igbinary \
    redis swoole opcache \
    memcached redis pcov \
    zip json pcntl
RUN ln -s /usr/bin/php82 /usr/bin/php

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN rm -rf composer-setup.php

RUN mkdir -p /etc/supervisor.d/
COPY ./config/supervisord.ini /etc/supervisor.d/supervisord.ini

RUN mkdir -p /run/php/
RUN touch /run/php/php8.2-fpm.pid
COPY ./config/php-fpm.conf /etc/php82/php-fpm.conf
COPY ./config/php.ini /etc/php82/php.ini

#COPY ./config/nginx.conf /etc/nginx/
#COPY ./config/nginx-laravel.conf /etc/nginx/modules/
#RUN mkdir -p /run/nginx/
#RUN touch /run/nginx/nginx.pid
#RUN ln -sf /dev/stdout /var/log/nginx/access.log
#RUN ln -sf /dev/stderr /var/log/nginx/error.log

COPY ./config/start-container /usr/local/bin/start-container
RUN chmod +x /usr/local/bin/start-container

EXPOSE 8000

CMD ["start-container"]
