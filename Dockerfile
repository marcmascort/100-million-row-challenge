#Vendor
FROM composer:2 AS vendor
WORKDIR /app
COPY ./composer.json composer.json
COPY ./composer.lock composer.lock
RUN composer install \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --no-dev \
    --prefer-dist \
    --ignore-platform-reqs
RUN composer dump-autoload

# PHP
FROM php:8.5-cli-alpine AS php
COPY --from=vendor app/vendor/ ./vendor/

