FROM raffiihza/docker-laravel

WORKDIR /usr/app
COPY . .

RUN composer install && npm install && npm run build

### Please modify these commands as per your requirements and remove comment characters below
ENV APP_ENV=local
## Optional if you want to use some variables from the .env.example file without adding them manually to environment variables
RUN cp .env.example .env
## Optional if you don't want to add APP_KEY env var manually (it needs the RUN command above to work properly)
RUN php artisan key:generate
## Optional if you want to use local SQLite
RUN php artisan migrate -q
## Optional if you need a new storage link
# RUN php artisan storage:link

EXPOSE 8080
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]
