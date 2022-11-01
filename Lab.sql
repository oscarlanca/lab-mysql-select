SELECT * FROM authors;

CREATE TABLE author_title
AS 
(SELECT au_id, au_lname, au_fname, title_id FROM authors
LEFT JOIN titleauthor
USING (au_id));

SELECT * FROM author_title

CREATE TABLE publisher_id
AS 
(SELECT title, pub_id, title_id,pub_name FROM title
LEFT JOIN titleauthor
USING (pub_id));

SELECT a.au_id AS 'AUTHOR ID', 
a.au_lname AS 'LAST NAME', 
a.au_fname AS 'FIRST NAME',
SUM(s.qty) AS 'TOTAL'
FROM authors a
LEFT JOIN titleauthor ta
ON  a.au_id = ta.au_id
LEFT JOIN sales s
ON s.title_id = ta.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;