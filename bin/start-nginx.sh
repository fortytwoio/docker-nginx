#!/usr/bin/env bash
set -eu # exit on error or undefined variable

# Defaults
export NGINX_WORKERS=${NGINX_WORKERS:-"$(nproc)"}
export NGINX_ROOT=${NGINX_ROOT:-"/srv/www"}
export NGINX_SERVER_NAME=${NGINX_SERVER_NAME:-"localhost"}

# Config file template from environment variables
envsubst < /etc/nginx/nginx.conf.tpl > /etc/nginx/nginx.conf
mkdir -p /var/log/nginx

# Launch
exec /usr/sbin/nginx $@
