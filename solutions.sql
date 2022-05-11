use sakila;

-- Select all the actors with the first name ‘Scarlett’.

select * from actor
where first_name='Scarlett';


-- How many films (movies) are available for rent and how many films have been rented?

select * from rental;
select inventory_id from rental;
select distinct(inventory_id) from rental;
select count(distinct(inventory_id)) from rental;

-- What are the shortest and longest movie duration? Name the values max_duration and min_duration.

select * from film;
select min(length) as min_duration, max(length) as max_duration from film;

-- What's the average movie duration expressed in format (hours, minutes)?

select * from film;
select avg(length) as avg_duration from film;
select concat(floor(avg(length)/60),'h:',floor(avg(length)%60),'m') from film;

-- How many distinct (different) actors' last names are there?

select * from actor;
select last_name from actor;
select distinct(last_name) from actor;
select count(distinct(last_name)) from actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?

select * from rental;
select min(rental_date) from rental;
select max(rental_date) from rental;
select datediff(max(last_update),min(rental_date)) from rental;

-- Show rental info with additional columns month and weekday. Get 20 results.

select * from rental;
select *, date_format(CONVERT(left(issued,6),date), '%M');
select *, CONVERT(left(rental_date,10),date) from rental;
select *, date_format(CONVERT(left(rental_date,10),date),'%M') as 'month' from rental;
select *, date_format(CONVERT(left(rental_date,10),date),'%W') as 'weekday' from rental;
 
select rental_id, rental_date,
date_format(CONVERT(left(rental_date,10),date),'%M') as 'rental_month', 
date_format(CONVERT(left(rental_date,10),date),'%W') as 'rental_weekday',
inventory_id, customer_id, return_date,
date_format(CONVERT(left(return_date,10),date),'%M') as 'return_month', 
date_format(CONVERT(left(return_date,10),date),'%W') as 'return_weekday',
staff_id, last_update
from rental
limit 20;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.


select rental_id, rental_date,
date_format(CONVERT(left(rental_date,10),date),'%M') as 'rental_month', 
date_format(CONVERT(left(rental_date,10),date),'%W') as 'rental_weekday',
case
when date_format(CONVERT(left(rental_date,10),date),'%w') in (1,2,3,4,5) then 'workday'
when date_format(CONVERT(left(rental_date,10),date),'%w') in (6,0) then 'weekend'
end as day_type,
inventory_id, customer_id, return_date,
date_format(CONVERT(left(return_date,10),date),'%M') as 'return_month', 
date_format(CONVERT(left(return_date,10),date),'%W') as 'return_weekday',
staff_id, last_update
from rental
limit 20;

-- Get release years.

select release_year from film;
select distinct(release_year) from film;

-- Get all films with ARMAGEDDON in the title.

select * from film;
select * from film
where title like '%ARMAGEDDON%';

-- Get all films which title ends with APOLLO.

select * from film
where title like '%APOLLO';

-- Get 10 the longest films.

select * from film
order by length desc
limit 10;

-- How many films include Behind the Scenes content?

select count(special_features) from film
where special_features like '%Behind the Scenes%';

