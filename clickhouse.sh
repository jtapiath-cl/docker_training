docker run \
    --detach \
    --rm \
    --volume "$PWD/db/users.xml:/etc/clickhouse-server/users.xml" \
    --volume "$PWD/db/init.sql:/docker-entrypoint-initdb.d/init.sql" \
    --name some-clickhouse-server \
    --ulimit nofile=262144:262144 \
    yandex/clickhouse-server
