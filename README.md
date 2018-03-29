# nginx

配合php-fpm使用，后台启动并链接php-fpm:
  docker run --name=nginx --link=php-fpm -itd -p 80:80 fengiyu/nginx:1.13.10

php-fpm: https://github.com/fengiyu/php
