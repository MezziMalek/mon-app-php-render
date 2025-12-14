FROM php:8.3-cli
WORKDIR /app
COPY ./app

RUN apt-get update && apt-get install -y \
    git \
    unzip \ 
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN composer install --no-dev --optimize-autoloader


CMD php, -S, 0.0.0.0:${PORT:-10000}, -t .
