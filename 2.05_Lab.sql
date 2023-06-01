# Lab | SQL Queries 5

USE sakila;

### Instructions

-- 1. Drop column `picture` from `staff`.

ALTER TABLE staff DROP COLUMN picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

SELECT * FROM customer
WHERE first_name = 'TAMMY' AND last_name = 'SANDERS';

SELECT * FROM staff;

SELECT * FROM store;

SELECT * FROM store WHERE store_id = 3;

UPDATE store
SET manager_staff_id = '3', address_id = '3', last_update = NOW()
WHERE store_id = '3';

INSERT INTO staff
VALUES (3 , 'Tammy', 'Sanders', 79 , 'TAMMY.SANDERS@sakilacustomer.org', 2 ,1, 'Tammy', NULL , NOW());

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. You can use current date for the `rental_date` column in the `rental` table.
 --  **Hint**: Check the columns in the table rental and see what information you would need to add there. You can query those pieces of information. For eg., you would notice that you need `customer_id` information as well. To get that you can use the following query:


INSERT INTO rental 
VALUES (16050 , NOW(), 2 , 130 ,  NULL , 1 , NOW());
SELECT * FROM RENTAL
ORDER BY RENTAL_ID DESC;
  
    -- Use similar method to get `inventory_id`, `film_id`, and `staff_id`.

-- 4. Delete non-active users, but first, create a _backup table_ `deleted_users` to store `customer_id`, `email`, and the `date` for the users that would be deleted. Follow these steps:

 -- Check if there are any non-active users

SELECT * FROM customer
where active= 0;

-- Hacemos el supueto que 0 es inactivo

   -- Create a table _backup table_ as suggested
   
   CREATE TABLE IF NOT EXISTS backup_table (
customer_id int(11) UNIQUE NOT NULL auto_increment,
store_id int(11) DEFAULT NULL,
first_name varchar(20) DEFAULT NULL,
last_name varchar(20) DEFAULT NULL,
email varchar(11) DEFAULT NULL,
address_id int(11) DEFAULT NULL,
active int(11) DEFAULT NULL,
create_date varchar(300) DEFAULT NULL,
last_update varchar(300) DEFAULT NULL,
CONSTRAINT PRIMARY KEY (customer_id)
);

ALTER TABLE backup_table MODIFY COLUMN email varchar(100);

DESCRIBE backup_table;

   -- Insert the non active users in the table _backup table_

INSERT INTO backup_table 
VALUES 
('1', '2', 'HEIDI', 'LARSON', 'HEIDI.LARSON@sakilacustomer.org', '245', '0', '2006-02-14', NOW()),
('2', '1', 'PENNY', 'NEAL', 'PENNY.NEAL@sakilacustomer.org', '276', '0', '2006-02-14', NOW()),
('3', '2', 'KENNETH', 'GOODEN', 'KENNETH.GOODEN@sakilacustomer.org', '320', '0', '2006-02-14', NOW()),
('4', '1', 'HARRY', 'ARCE', 'HARRY.ARCE@sakilacustomer.org', '373', '0', '2006-02-14', NOW()),
('5', '1', 'NATHAN', 'RUNYON', 'NATHAN.RUNYON@sakilacustomer.org', '411', '0', '2006-02-14', NOW()),
('6', '2', 'THEODORE', 'CULP', 'THEODORE.CULP@sakilacustomer.org', '451', '0', '2006-02-14', NOW()),
('7', '1', 'MAURICE', 'CRAWLEY', 'MAURICE.CRAWLEY@sakilacustomer.org', '487', '0', '2006-02-14', NOW()),
('8', '2', 'BEN', 'EASTER', 'BEN.EASTER@sakilacustomer.org', '515', '0', '2006-02-14', NOW()),
('9', '1', 'CHRISTIAN', 'JUNG', 'CHRISTIAN.JUNG@sakilacustomer.org', '540', '0', '2006-02-14', NOW()),
('10', '1', 'JIMMIE', 'EGGLESTON', 'JIMMIE.EGGLESTON@sakilacustomer.org', '564', '0', '2006-02-14', NOW()),
('11', '1', 'TERRANCE', 'ROUSH', 'TERRANCE.ROUSH@sakilacustomer.org', '598', '0', '2006-02-14', NOW());

SELECT * FROM backup_table
ORDER BY customer_id;   
   
   -- Delete the non active users from the table _customer_
   
SELECT * FROM customer
WHERE active= '0';
DELETE FROM customer WHERE active= '0';

-- Tuve que realizarlo a 'mano' porque con la condicion active= '0' no me permitia realizarlo con el modo seguro.
   
-- SELECT * FROM staff;