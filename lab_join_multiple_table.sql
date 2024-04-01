# Write a query to display for each store its store ID, city, and country.
 #store; address;city;country;

select s.store_id, ci.city, c.country
from store s
join address a on s.address_id = a.address_id
join city ci on ci.city_id = a.city_id
join country c on c.country_id = ci.country_id;

#Write a query to display how much business, in dollars, each store brought in.
#store ; inventory ; rental ; payment

select s.store_id, sum(p.amount) as total_amount
from store s 
join inventory i on s.store_id = s.store_id
join rental r on i.inventory_id = r.inventory_id
join payment p on  r.rental_id = p.rental_id
group by s.store_id;

# What is the average running time of films by category?
#film ; film_category; category 

select avg(f.length) as average_running_time, c.name as category
from film f 
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
group by c.name;

# Which film categories are longest?
select avg(f.length) as average_running_time, c.name as category
from film f 
join film_category fc on f.film_id = fc.film_id
join category c on fc.category_id = c.category_id
group by c.name
order by average_running_time desc;

# Display the most frequently rented movies in descending order.
#film; inventory; rental 

select f.title, count(r.rental_id) as rental_count
from film f 
join inventory i on i.film_id = f.film_id
join rental r on i.inventory_id = r.inventory_id
group by f.title
order by rental_count desc;

# List the top five genres in gross revenue in descending order.
select sum(p.amount) as total_amount, c.name as genre
from category c
join film_category fc on fc.category_id = c.category_id
join film f on f.film_id = fc.film_id
join inventory i on f.film_id = i.film_id
join rental r on r.inventory_id = i.inventory_id
join payment p on p.rental_id = r.rental_id 
group by c.name
order by total_amount desc ;

# Is "Academy Dinosaur" available for rent from Store 1?

select * from rental;
select * from rental;
select f.title, i.store_id
from film f 
join inventory i on f.film_id = i.film_id
join rental r on r.inventory_id = i.inventory_id
where datediff(r.rental_date, r.return_date) = 0 and i.store_id = 1
order by f.title;

