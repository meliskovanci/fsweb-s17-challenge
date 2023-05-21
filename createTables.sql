-- Tasarımını yaptığınız tabloları oluşturan sql ifadeleri buraya yazınız.
-- veri tiplerine, nullable olma durumuna, default değerine ve tablolar arası foreign key kullanımına dikkat.


CREATE TABLE "category"(
    "category_id" BIGINT NOT NULL,
    "category_name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "category" ADD CONSTRAINT "category_category_id_primary" PRIMARY KEY("category_id");
CREATE TABLE "customers"(
    "customer_id" BIGINT NOT NULL,
    "customer_name" VARCHAR(255) NOT NULL,
    "customer_email" VARCHAR(255) NOT NULL,
    "customer_adress" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "customers" ADD CONSTRAINT "customers_customer_id_primary" PRIMARY KEY("customer_id");
CREATE TABLE "orders"(
    "order_id" BIGINT NOT NULL,
    "customer_id" BIGINT NOT NULL,
    "order_date" TIMESTAMP NOT NULL
);
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_order_id_primary" PRIMARY KEY("order_id");
CREATE TABLE "product"(
    "procuct_id" BIGINT NOT NULL,
    "product_name" VARCHAR(255) NOT NULL,
    "product_explanation" VARCHAR(255) NOT NULL,
    "product_price" DECIMAL(8, 2) NOT NULL,
    "product_img" VARCHAR(255) NOT NULL,
    "category_id" BIGINT NOT NULL
);
ALTER TABLE
    "product" ADD CONSTRAINT "product_procuct_id_primary" PRIMARY KEY("procuct_id");
CREATE TABLE "payment"(
    "payment_id" BIGINT NOT NULL,
    "order_id" BIGINT NOT NULL,
    "payment_amount" DECIMAL(8, 2) NOT NULL,
    "payment_date" DATETIME NOT NULL
);
ALTER TABLE
    "payment" ADD CONSTRAINT "payment_payment_id_primary" PRIMARY KEY("payment_id");
CREATE TABLE "adress"(
    "adress_id" BIGINT NOT NULL,
    "customer_id" BIGINT NOT NULL,
    "city" VARCHAR(255) NOT NULL,
    "state" VARCHAR(255) NOT NULL,
    "country" VARCHAR(255) NOT NULL,
    "adress_type" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "adress" ADD CONSTRAINT "adress_adress_id_primary" PRIMARY KEY("adress_id");
ALTER TABLE
    "adress" ADD CONSTRAINT "adress_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "customers"("customer_id");
ALTER TABLE
    "product" ADD CONSTRAINT "product_category_id_foreign" FOREIGN KEY("category_id") REFERENCES "category"("category_id");
ALTER TABLE
    "orders" ADD CONSTRAINT "orders_customer_id_foreign" FOREIGN KEY("customer_id") REFERENCES "customers"("customer_id");
ALTER TABLE
    "payment" ADD CONSTRAINT "payment_order_id_foreign" FOREIGN KEY("order_id") REFERENCES "orders"("order_id");