
--To count distinct actor from file
SELECT COUNT(DISTINCT actor)from film;
SELECT count(distinct title) FROM film WHERE rental_rate>4 AND replacement_cost >= 19.99 AND rating='R'
SELECT COUNT(*) FROM film;
SELECT email FROM customer WHERE first_name='Nancy' AND last_name='Thomas'
SELECT description FROM film WHERE title='Outlaw Hanky'
SELECT phone FROM address WHERE address='259 Ipoh Drive' OR address2='259 Ipoh Drive'
SELECT store_id,first_name,last_name FROM customer ORDER BY store_id,first_name
SELECT customer_id FROM payment ORDER BY payment_date LIMIT 10
SELECT title FROM film ORDER BY length LIMIT 5
SELECT COUNT(title) FROM film where length<=50
SELECT * FROM customer WHERE first_name LIKE 'J%' (first word)AND last_name LIKE '%S'(last word)
SELECT * FROM customer WHERE first_name ILIKE 'J%' AND last_name LIKE 'S%'
SELECT COUNT(amount) FROM payment WHERE amount>5
SELECT COUNT(*) FROM actor where first_name LIKE 'P%' 
SELECT COUNT(DISTINCT district) FROM address;
SELECT DISTINCT (district) FROM address; 
SELECT COUNT(rating) FROM film WHERE rating='R' AND replacement_cost BETWEEN 5 AND 15
SELECT COUNT(*) FROM film WHERE title LIKE '%Truman%'
select max(replacement_cost) from film;
select Round(avg(replacement_cost),2) from film; --2 is how many decimal digit we need
select customer_id,SUM(amount) from payment group by customer_id order by SUM(amount)
select customer_id,sum(amount) from payment group by customer_id having sum(amount)>100
select rating,round(avg(replacement_cost)) from film group by rating
select customer_id,sum(amount) from payment group by customer_id order by sum(amount) desc limit 5
select customer_id,count(amount) from payment group by customer_id having count(amount)>=40
select contents,username FROM COMMENTS JOIN users on users.id=comments.id
select contents,url FROM COMMENTS JOIN photos on photos.id=comments.photo_id
select url,username FROM photos JOIN users on users.id=photos.user_id
select name from students where marks>75 order by substring(name,-3), id asc
select ceil(avg(salary)-avg(replace(salary,'0',''))) from employees
select url,username FROM photos FULL JOIN users on users.id=photos.user_id or photos.user_id=null;
select url,contents,username FROM COMMENTS INNER JOIN photos on photos.id=COMMENTS.photo_id JOIN users on users.id=comments.user_id AND users.id=photos.user_id
SELECT name,title,rating FROM books JOIN authors on authors.id=books.author_id JOIN reviews on reviews.id=authors.id AND reviews.id=books.author_id WHERE books.author_id=reviews.book_id
SELECT username,title,rating FROM books JOIN authors on authors.id=books.author_id JOIN reviews on reviews.id=authors.id AND reviews.id=books.author_id WHERE books.author_id=reviews.book_id
select name,count(*) from books join authors on authors.id=books.author_id group by name
select photo_id,COUNT(*) FROM COMMENTS GROUP BY photo_id HAVING photo_id<3 AND count(*)>2
select photo_id,COUNT(*) FROM COMMENTS WHERE photo_id<3  GROUP BY photo_id HAVING count(*)>2
select manufacturer from phones where price<170 union select manufacturer from phones group by manufacturer having count(*)>2

					--subqueries

SELECT name,price FROM products WHERE price>(SELECT max(price)FROM products WHERE department='Toys')	
SELECT name,price,(SELECT MAX(price) FROM products)FROM products WHERE price>876-- single value returned
select name,price,price/(select max(price)  from phones) as price_ratio from phones
select name,price from phones where price >(select price from phones where name='S5620 Monte')
SELECT name,department,price FROM products WHERE price>ALL(SELECT price FROM products WHERE department='Industrial')
