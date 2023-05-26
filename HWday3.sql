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
select first_name, last_name
from customer 
where customer_id in (
	select customer_id
	from payment
	group by customer_id
	having sum(amount) > 175
);

-- Question 4
select *
from customer;

select *
from city;

select c.first_name, c.last_name
from customer c
join address a 
on c.address_id = a.address_id
join city ci
on a.city_id = ci.city_id
join country co 
on ci.country_id = co.country_id 
where co.country = 'Argentina';


-- Question 5

select fc.category_id, c.name, count(film_id)
from film_category fc
join category c 
on fc.category_id = c.category_id 
group by c.name, fc.category_id 
order by count(film_id) desc;


-- Question 6

select f.film_id, count(*) as num_actors, title
from film_actor fa
join film f
on fa.film_id = f.film_id
group by f.film_id, title
order by num_actors desc
limit 1;


-- Question 7

select a.actor_id, a.first_name, a.last_name, count(*) as num_movies
from actor a
join film_actor as fa 
on a.actor_id = fa.actor_id
group by a.actor_id, a.first_name, a.last_name 
order by num_movies asc 
limit 1;


-- Question 8

select cnt.country, count(c.city) as num_cities
from city c
join country cnt 
on cnt.country_id  = c.country_id
group by cnt.country 
order by num_cities desc
limit 1;


-- Question 9

select a.first_name, a.last_name, count(*) as total
from film_actor fa
join actor a 
on a.actor_id  = fa.actor_id 
group by a.actor_id
having count(*) between 20 and 25;

-- In-class 

select film_actor.actor_id, actor.first_name, actor.last_name, count(*) as total_films
from film_actor
join actor 
on film_actor.actor_id = actor.actor_id
group by film_actor.actor_id, actor.first_name, actor.last_name
having count(*) between 20 and 25;