FROM uqlibrary/php73-fpm:20210212

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV BUILD_DEPS file re2c autoconf make g++ gcc groff less php7-dev libmemcached-dev cyrus-sasl-dev zlib-dev musl pcre-dev

RUN apk add --update --no-cache $BUILD_DEPS \
    && pear config-set temp_dir /root/tmp \
    && pecl install pcov \
    && printf "extension=pcov.so" > /etc/php7/conf.d/pcov.ini \
    && apk del --purge $BUILD_DEPS
