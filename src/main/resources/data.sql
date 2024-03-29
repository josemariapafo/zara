CREATE TABLE IF NOT EXISTS BRANDS (
    BRAND_ID BIGINT PRIMARY KEY,
    BRAND_NAME VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS PRODUCTS (
    PRODUCT_ID BIGINT PRIMARY KEY,
    PRODUCT_NAME VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS "PRICES";

CREATE TABLE IF NOT EXISTS PRICES (
    PRICE_ID BIGINT PRIMARY KEY,
    BRAND_ID BIGINT NOT NULL,
    START_DATE DATETIME NOT NULL,
    END_DATE DATETIME NOT NULL,
    PRICE_LIST BIGINT NOT NULL,
    PRODUCT_ID BIGINT NOT NULL,
    PRIORITY BIGINT NOT NULL,
    PRICE NUMERIC(12, 2) NOT NULL,
    CURR VARCHAR(10) NOT NULL,
    FOREIGN KEY (BRAND_ID) REFERENCES BRANDS (BRAND_ID),
    FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCTS (PRODUCT_ID)
);

CREATE INDEX idx_product_id ON PRICES (PRODUCT_ID);

INSERT INTO BRANDS (BRAND_ID, BRAND_NAME)
VALUES (1, 'BrandA');

INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME)
VALUES (35455, 'Zapatillas');

INSERT INTO PRICES (BRAND_ID, START_DATE, END_DATE, PRICE_LIST, PRODUCT_ID, PRIORITY, PRICE, CURR, PRICE_ID)
VALUES (1, PARSEDATETIME('2020-06-14 00:00:00', 'yyyy-MM-dd HH:mm:ss'), PARSEDATETIME('2020-12-31 23:59:59', 'yyyy-MM-dd HH:mm:ss'), 1, 35455, 0, 35.50, 'EUR', 1);

INSERT INTO PRICES (BRAND_ID, START_DATE, END_DATE, PRICE_LIST, PRODUCT_ID, PRIORITY, PRICE, CURR, PRICE_ID)
VALUES (1, PARSEDATETIME('2020-06-14 15:00:00', 'yyyy-MM-dd HH:mm:ss'), PARSEDATETIME('2020-06-14 18:30:00', 'yyyy-MM-dd HH:mm:ss'), 2, 35455, 1, 25.45, 'EUR', 2);

INSERT INTO PRICES (BRAND_ID, START_DATE, END_DATE, PRICE_LIST, PRODUCT_ID, PRIORITY, PRICE, CURR, PRICE_ID)
VALUES (1, PARSEDATETIME('2020-06-15 00:00:00', 'yyyy-MM-dd HH:mm:ss'), PARSEDATETIME('2020-06-15 11:00:00', 'yyyy-MM-dd HH:mm:ss'), 3, 35455, 1, 30.50, 'EUR', 3);

INSERT INTO PRICES (BRAND_ID, START_DATE, END_DATE, PRICE_LIST, PRODUCT_ID, PRIORITY, PRICE, CURR, PRICE_ID)
VALUES (1, PARSEDATETIME('2020-06-15 16:00:00', 'yyyy-MM-dd HH:mm:ss'), PARSEDATETIME('2020-12-31 23:59:59', 'yyyy-MM-dd HH:mm:ss'), 4, 35455, 1, 38.95, 'EUR', 4);