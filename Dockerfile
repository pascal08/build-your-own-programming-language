FROM php:8.1-cli AS build

WORKDIR /source

COPY . /source

COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN /usr/bin/composer install --no-progress --no-interaction

RUN "vendor/bin/phpunit"

FROM php:8.1-cli
WORKDIR /app
COPY --from=build /source .
