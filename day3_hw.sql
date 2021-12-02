--1. List all customers who live in Texas

select * from address;
select * from customer;

select first_name, last_name
from customer
inner join address
on customer.address_id = address.address_id
where district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name

select * from payment;
select * from customer;

select first_name, last_name, amount
from customer
inner join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- 3. Show all customers names who have made payments over $175 using subqueries
select first_name, last_name
from customer
where customer_id in (
	select payment.customer_id
	from payment
	where amount > 175
);

-- 4. list all customers that live in Nepal
select * from city;
select * from address;

select first_name, last_name
from customer
inner join address
on customer.address_id = address.address_id 
inner join city
on address.city_id = city.city_id 
where city = 'Nepal';

-- 5. Which staff member had the most transactions?
select * from staff;
select * from rental;

select staff_id, COUNT(staff_id)
from payment
group by staff_id
order by COUNT(staff_id) DESC;

-- 6. how many movies of each rating are there
select * from film;

select distinct rating, COUNT(rating)
from film
group by rating
order by COUNT(rating) DESC;

-- 7. Show all customers who have made a single payment above $6.99 using subqueries
select * from customer;
select * from payment;

select first_name, last_name
from customer
where customer_id in(
	select customer_id 
	from payment
	where amount > 6.99
);

-- 8. How many free rentals did our stores give away?
select COUNT(amount)
from payment
where amount = 0.00;



