-- Ejercicio 2. Base de Datos Sakila --
-- SCHEMA: sakila

-- 1.Selecciona todos los nombres de las películas sin que aparezcan duplicados.
SELECT DISTINCT f.title AS Título_película
FROM film f
ORDER BY title;

-- 2.Muestra los nombres de todas las películas que tengan una clasificación de "PG-13".
SELECT f.title as Título_película, f.rating AS Clasificación
FROM film f
WHERE rating = 'PG-13'
ORDER BY f.title;

-- 3.Encuentra el título y la descripción de todas las películas que contengan la palabra "amazing" en su descripción.
SELECT f.title AS Película, f.description AS Descripción
from film f
WHERE f.description like '%amazing%'
ORDER BY f.title;

-- 4.Encuentra el título de todas las películas que tengan una duración mayor a 120 minutos. 
SELECT title AS Título_película, length AS Duración_película
FROM film 
WHERE length > 120
ORDER BY length;

-- 5.Recupera los nombres de todos los actores.
SELECT first_name AS Nombre, last_name AS Apellido
FROM actor
ORDER BY first_name;
/* Por si se repite alguno se podría hacer:*/
SELECT DISTINCT first_name, last_name
FROM actor
ORDER BY first_name;

-- 6.Encuentra el nombre y apellido de los actores que tengan "Gibson" en su apellido.
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE 'Gibson'
ORDER BY first_name;

-- 7.Encuentra los nombres de los actores que tengan un actor_id entre 10 y 20.
SELECT first_name, last_name, actor_id
FROM actor
WHERE actor_id BETWEEN 10 AND 20
ORDER BY actor_id;

-- 8.Encuentra el título de las películas en la tabla film que no sean ni "R" ni "PG-13" en cuanto a su clasificación.
SELECT title, rating
FROM film
WHERE rating NOT IN ('R', 'PG-13')
ORDER BY title;

-- 9.Encuentra la cantidad total de películas en cada clasificación de la tabla film y muestra la clasificación junto con el recuento.
SELECT c.name AS Categoría, COUNT(f.film_id) AS Número_de_películas
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
group by Categoría
order by Categoría;

-- 10.Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS Cantidad_películas
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
GROUP BY  c.customer_id, c.first_name, c.last_name
ORDER BY Cantidad_películas DESC;

-- 11.Encuentra la cantidad total de películas alquiladas por categoría y muestra el nombre de la categoríajunto con el recuento de alquileres.
SELECT c.name as Categoría, COUNT(r.rental_id) as Alquileres_total
FROM category c 
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.category_id, c.name
ORDER BY Alquileres_total DESC;

-- 12.Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.
SELECT c.name, ROUND(AVG(F.length)) AS Media_duración
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
INNER JOIN film f ON fc.film_id = f.film_id
GROUP BY c.name
ORDER BY Media_duración DESC;

-- 13.Encuentra el nombre y apellido de los actores que aparecen en la película con title "Indian Love".
SELECT a.first_name, a.last_name, f.title
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
WHERE f.title LIKE '%Indian Love%';

-- 14.Muestra el título de todas las películas que contengan la palabra "dog" o "cat" en su descripción.
SELECT title, description
FROM film
WHERE description LIKE '%dog%'
OR description LIKE '%CAT%';

-- 15.Encuentra el título de todas las películas que fueron lanzadas entre el año 2005 y 2010.
SELECT title, release_year
FROM film 
WHERE release_year BETWEEN 2005 AND 2010;