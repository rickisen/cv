#!/bin/bash
set -e
docker pull nginx:latest
docker stop cv-nginx
docker rm cv-nginx

docker run --name cv-nginx \
	--restart always \
	-v /home/docka/cv/webcv:/var/www/html:ro \
	-v /etc/nginx/nginx.conf:/etc/nginx/nginx.conf:ro \
	-v /etc/nginx/sites-available/default:/etc/nginx/conf.d/webcv.conf:ro \
	-v /etc/letsencrypt:/etc/letsencrypt:ro \
	-p 80:80 \
	-p 443:443 \
	-d nginx
