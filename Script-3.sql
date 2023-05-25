-- Question 1

SELECT first_name, last_name, district
FROM customer c
JOIN address a
ON c.address_id = a.address_id
WHERE district = 'Texas';


-- Question 2

SELECT first_name, last_name, amount
FROM customer c
JOIN payment p 
ON c.customer_id = p.customer_id
WHERE amount > 7.00;

-- Question 3

SELECT *
FROM customer;

SELECT *
FROM payment;

SELECT *
FROM film 
WHERE film_id IN (
	SELECT film_id
	FROM film_actor
	GROUP BY film_id
	HAVING COUNT(*) = 12
);


-- Question 4

SELECT *
FROM customer
WHERE last_name = 'Markham';

SELECT *
FROM address;

SELECT *
FROM city;

SELECT *
FROM customer c
JOIN country co
ON c

