DROP DATABASE IF EXISTS database_1;

CREATE DATABASE IF NOT EXISTS database_1;

DROP TABLE IF EXISTS database_1.actividad;

DROP TABLE IF EXISTS database_1.predicciones;

CREATE TABLE IF NOT EXISTS database_1.actividad 
(
    clientUUID          UUID NOT NULL,
    clientName          String,
    clientAddress       String,
    clientRegion        String,
    clientCountry       String,
    clientAge           UInt8,
    clientID            String,
    clientGroup         String,
    activityDate        DateTime,
    clientConsumption   UInt16,
    activityCode        UInt8,
    date_ts             String
)
ENGINE = MergeTree()
ORDER BY date_ts
PARTITION BY date_ts
;

CREATE TABLE IF NOT EXISTS database_1.predicciones
(
    clientUUID      UUID NOT NULL,
    clientID        String,
    clientName      String,
    activityDate    DateTime,
    date_ts         String,
    y               Float64,
    yhat            Float64
)
ENGINE = MergeTree()
ORDER BY date_ts
PARTITION BY date_ts
;

CREATE USER IF NOT EXISTS usuario_api 
IDENTIFIED WITH plaintext_password BY 'bad_plaintext_password_1';

GRANT
    SELECT,
    INSERT,
    ALTER,
    CREATE,
    DROP,
    TRUNCATE
ON database_1.*
TO usuario_api
;
