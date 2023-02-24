-- HOMEWORK QUESTIONS 2/23/23


-- 1. List all customers who live in Texas (use JOINs)

SELECT COUNT(*) AS texans
FROM customer c 
JOIN address a 
ON c.address_id = a.address_id
WHERE district = 'Texas';

-- ANSWER: 5

-- 2. Get all payments above $6.99 with the Customer's Full Name

SELECT first_name, last_name, amount 
FROM payment p
JOIN customer c 
ON p.customer_id = c.customer_id 
WHERE amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)

SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id 
	FROM payment 
	GROUP BY customer_id 
	HAVING sum(amount) > 175
);	


SELECT *
FROM payment;


-- 4. List all customers that live in Nepal (use the city table)

SELECT *
FROM customer c
JOIN address a 
ON c.address_id = a.address_id 
JOIN city c2 
ON c2.city_id = a.city_id
JOIN country c3 
ON c2.country_id = c3.country_id
WHERE country = 'Nepal';

-- ANSWER: 1 customer: Kevin Schuler

-- 5. Which staff member had the most transactions?

SELECT p.staff_id, count(*) AS transactions
FROM staff s 
JOIN payment p 
ON p.staff_id = s.staff_id
GROUP BY p.staff_id;

-- ANSWER: Staff ID 2: Jon Stephens 7,304 transactions

-- 6. How many movies of each rating are there?

SELECT rating, count(rating) AS "number"
FROM film
GROUP BY rating
ORDER BY number DESC;

-- 7. Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT DISTINCT concat(first_name, last_name)AS full_name
FROM customer c
WHERE customer_id IN (
	SELECT customer_id
	FROM payment p
	WHERE amount > 6.99
	GROUP BY customer_id
);

-- 8. How many free rentals did our stores give away?

SELECT count(*) AS free_movies
FROM payment
WHERE amount = 0;

-- Answer: 24