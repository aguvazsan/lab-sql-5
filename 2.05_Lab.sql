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
ORDER BY active;

-- Hacemos el supueto que 0 es inactivo

   -- Create a table _backup table_ as suggested
   
   
   
   -- Insert the non active users in the table _backup table_
   -- Delete the non active users from the table _customer_
-- SELECT * FROM staff;