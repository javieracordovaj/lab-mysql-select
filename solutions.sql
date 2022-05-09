-- CHALLENGE 1

CREATE TABLE challenge_1;
SELECT au_id AS AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, title as TITLE, pub_name as PUBLISHER
FROM authors
JOIN titleauthor
USING (au_id)
JOIN titles
USING (title_id)
JOIN publishers
USING (pub_id);

SELECT COUNT('AUTHOR ID') 
FROM challenge_1;

-- CHALLENGE 2

SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, COUNT(TITLE) AS TITLE_COUNT
FROM challenge_1
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER
ORDER BY AUTHOR_ID DESC, LAST_NAME, FIRST_NAME, PUBLISHER DESC;

-- CHALLENGE 3

SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, SUM(qty) AS TOTAL
FROM challenge_1
JOIN titles
ON challenge_1.TITLE = titles.title
JOIN sales
USING (title_id)
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 5; -- Necesito aprender a poner una condición para que me al poner LIMIT 3 me arroje los 3 autores que vendieron lo mismo y que están en el Top3.

-- CHALLENGE 4

SELECT au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, COALESCE(SUM(qty), 0) AS TOTAL
FROM authors
LEFT JOIN titleauthor
USING (au_id)
LEFT JOIN titles
USING (title_id)
LEFT JOIN sales
USING (title_id)
GROUP BY au_id
ORDER BY TOTAL DESC;