SELECT au_id AS "ID", 
au_lname AS "Name", 
au_fname AS "Last Name",
title AS "Title",
pub_name AS "Publisher Name"
FROM authors
LEFT JOIN titleauthor
USING(au_id)
LEFT JOIN titles
USING(title_id)
LEFT JOIN publishers
USING(pub_id);

SELECT au_id AS "ID", 
au_lname AS "Name", 
au_fname AS "Last Name",
title AS "Title",
pub_name AS "Publisher Name",
COUNT(*)
FROM authors
LEFT JOIN titleauthor
USING(au_id)
LEFT JOIN titles
USING(title_id)
LEFT JOIN publishers
USING(pub_id)
GROUP BY au_lname
ORDER BY COUNT(pub_name);

SELECT au_id AS "ID", 
au_lname AS "Name", 
au_fname AS "Last Name",
SUM(qty) AS "Quantity"
FROM authors
JOIN titleauthor
USING(au_id)
JOIN sales
USING (title_id)
GROUP BY au_id;

SELECT au_id AS "ID", 
au_lname AS "Name", 
au_fname AS "Last Name",
SUM(qty) AS "Quantity"
FROM authors
JOIN titleauthor
USING(au_id)
JOIN sales
USING (title_id)
GROUP BY au_id
ORDER BY Quantity;
