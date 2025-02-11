#QUERY 1

SELECT authors.au_id AS "AUTHOR ID",
authors.au_lname AS "AUTHOR NAME", 
authors.au_fname AS "AUTHOR LASTNAME",
titles.title AS "TITLE",
publishers.pub_name AS "PUBLISHER"
FROM
titleauthor
JOIN
authors ON titleauthor.au_id = authors.au_id
JOIN
titles ON titleauthor.title_id = titles.title_id
JOIN
publishers ON titles.pub_id = publishers.pub_id;


#QUERY 2


SELECT authors.au_id AS "AUTHOR ID",
   authors.au_lname AS "AUTHOR NAME", 
   authors.au_fname AS "AUTHOR LASTNAME",
   publishers.pub_name AS "PUBLISHER",
   count(titles.title_id) AS "TITLE COUNT"
  FROM
  authors
  LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
  LEFT JOIN titles ON titleauthor.title_id = titles.title_id
  LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
  GROUP BY authors.au_id, publishers.pub_name
  order by `title count`desc;



#QUERY 3


SELECT authors.au_fname, authors.au_lname, authors.au_id,
sum(sales.qty) as 'TOTAL'
	FROM authors
		LEFT JOIN titleauthor
			ON titleauthor.au_id = authors.au_id
		LEFT JOIN titles
			ON titleauthor.title_id = titles.title_id
		LEFT JOIN sales
			ON sales.title_id = titles.title_id
    GROUP BY authors.au_id, authors.au_lname, authors.au_fname
    ORDER BY `TOTAL` DESC
    LIMIT 3


#QUERY 4

SELECT authors.au_fname, authors.au_lname, authors.au_id,
COALESCE(sum(sales.qty),0) as 'TOTAL'
	FROM authors
		LEFT JOIN titleauthor
			ON titleauthor.au_id = authors.au_id
		LEFT JOIN titles
			ON titleauthor.title_id = titles.title_id
		LEFT JOIN sales
			ON sales.title_id = titles.title_id
    GROUP BY authors.au_id
    ORDER BY `TOTAL` DESC