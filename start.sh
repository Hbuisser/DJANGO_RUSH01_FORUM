#!/bin/sh

# python manage.py collectstatic
# python3 manage.py createsuperuser --username=hbuisser --email=hbuisser@gmail.com
# brew services stop nginx
brew install nginx
# brew services start nginx
cp ./config/nginx.conf ~/.brew/etc/nginx/servers/
brew services restart nginx
python3 manage.py makemigrations
python3 manage.py migrate
# python3 manage.py runserver
python3 -m pip install gunicorn
gunicorn -c ./config/gunicorn_config.py django_project.wsgi 
