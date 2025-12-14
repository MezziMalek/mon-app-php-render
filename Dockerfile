FROM php:8.3-cli
WORKDIR /app
COPY . .

RUN apt-get update && apt-get install -y \
    git \
    unzip \ 
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && rm -rf /var/lib/apt/lists/*

RUN composer install --no-dev --optimize-autoloader

EXPOSE 10000

CMD ["sh", "-c" ,"php", -S, 0.0.0.0:${PORT:-10000} -t ."]
