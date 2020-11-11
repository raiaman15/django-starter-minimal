#!/bin/sh
echo "CHECKING PORT USAGE"
ss -lntu
echo "COLLECTING STATIC FILES"
python manage.py collectstatic 
echo "MIGRATING DATABASE"
python manage.py migrate
exec "$@"
