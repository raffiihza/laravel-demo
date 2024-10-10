FROM raffiihza/docker-laravel

COPY . .

RUN composer install
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]