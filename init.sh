echo This will initialize the SQL database.
docker compose pull
docker compose up -d mysql
echo This will take a minute...
sleep 60s
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --mysql > initdb.sql
cat initdb.sql | docker compose exec -T mysql mysql -uroot -pguac139 guacdb
