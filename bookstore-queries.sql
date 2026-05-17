

mysql> CREATE DATABASE bookstore_db;
Query OK, 1 row affected (0.01 sec)

mysql> USE bookstore_db;
Database changed
mysql> 
mysql> -- 1. Authors Table
mysql> CREATE TABLE Authors (
    ->     author_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     author_name VARCHAR(100) NOT NULL,
    ->     bio TEXT
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> -- 2. Genres Table
mysql> CREATE TABLE Genres (
    ->     genre_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     genre_name VARCHAR(50) NOT NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> -- 3. Customers Table
mysql> CREATE TABLE Customers (
    ->     customer_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     name VARCHAR(100),
    ->     email VARCHAR(100) UNIQUE,
    ->     city VARCHAR(50),
    ->     join_date DATE
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> 
mysql> -- 4. Books Table
mysql> CREATE TABLE Books (
    ->     book_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     title VARCHAR(150),
    ->     price DECIMAL(10,2),
    ->     stock_quantity INT,
    ->     author_id INT,
    ->     genre_id INT,
    ->     FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    ->     FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> 
mysql> -- 5. Orders Table
mysql> CREATE TABLE Orders (
    ->     order_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     order_date DATE,
    ->     customer_id INT,
    ->     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> 
mysql> -- 6. Order_Details Table
mysql> CREATE TABLE Order_Details (
    ->     detail_id INT AUTO_INCREMENT PRIMARY KEY,
    ->     order_id INT,
    ->     book_id INT,
    ->     quantity_ordered INT,
    ->     price_at_time_of_order DECIMAL(10,2),
    ->     FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    ->     FOREIGN KEY (book_id) REFERENCES Books(book_id)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> 
mysql> -- ========================================================
mysql> -- DATA INSERTION BLOCK (PERFECTLY ALIGNED DATA)
mysql> -- ========================================================
mysql> 
mysql> -- Insert Authors (Original + New)
mysql> INSERT INTO Authors (author_name, bio) VALUES
    -> ('Chetan Bhagat', 'Indian author known for 5 Point Someone.'),
    -> ('Arundhati Roy', 'Winner of the Man Booker Prize.'),
    -> ('R.K. Narayan', 'Creator of Malgudi Days.'),
    -> ('Amish Tripathi', 'Known for the Shiva Trilogy.'),
    -> ('Sudha Murty', 'Famous author known for her inspiring short stories.'),
    -> ('Ruskin Bond', 'Renowned Indian author writing about mountain life.');
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Insert Genres (Original + New)
mysql> INSERT INTO Genres (genre_name) VALUES
    -> ('Fiction'),
    -> ('Mythology'),
    -> ('History'),
    -> ('Romance'),
    -> ('Short Stories');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Insert Books (Original + New)
mysql> -- IDs 1 to 5 are original, 6 to 8 are new additions
mysql> INSERT INTO Books (title, price, stock_quantity, author_id, genre_id) VALUES
    -> ('Five Point Someone', 250.00, 50, 1, 1),       -- book_id = 1
    -> ('2 States', 300.00, 40, 1, 4),                 -- book_id = 2
    -> ('The God of Small Things', 450.00, 20, 2, 1),  -- book_id = 3
    -> ('Malgudi Days', 200.00, 100, 3, 1),            -- book_id = 4
    -> ('The Immortals of Meluha', 399.00, 60, 4, 2),  -- book_id = 5
    -> ('The Wise and Otherwise', 220.00, 15, 5, 5),   -- book_id = 6
    -> ('Grandmas Bag of Stories', 180.00, 85, 5, 5),  -- book_id = 7
    -> ('The Room on the Roof', 299.00, 4, 6, 1);      -- book_id = 8
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Insert Customers (Original + New)
mysql> INSERT INTO Customers (name, email, city, join_date) VALUES
    -> ('Aarav Sharma', 'aarav@gmail.com', 'Mumbai', '2023-01-10'),
    -> ('Diya Patel', 'diya.p@yahoo.com', 'Ahmedabad', '2023-02-15'),
    -> ('Vihaan Reddy', 'vihaan.r@outlook.com', 'Hyderabad', '2023-03-20'),
    -> ('Ananya Gupta', 'ananya.g@gmail.com', 'Delhi', '2023-04-05'),
    -> ('K. Jaisri', 'jaisri.k@gmail.com', 'Visakhapatnam', '2026-05-18'), 
    -> ('S. Rahul', 'rahul.s@gmail.com', 'Visakhapatnam', '2026-05-10');   
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Insert Orders (Original + New)
mysql> INSERT INTO Orders (order_date, customer_id) VALUES
    -> ('2023-05-01', 1), -- order_id = 1
    -> ('2023-05-03', 2), -- order_id = 2
    -> ('2023-05-05', 1), -- order_id = 3
    -> ('2023-06-01', 3), -- order_id = 4
    -> ('2026-05-12', 4), -- order_id = 5
    -> ('2026-05-15', 6); -- order_id = 6
Query OK, 6 rows affected (0.01 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> 
mysql> -- Insert Order_Details (Perfectly connected to valid parent IDs!)
mysql> INSERT INTO Order_Details (order_id, book_id, quantity_ordered, price_at_time_of_order) VALUES
    -> (1, 1, 1, 250.00),
    -> (1, 4, 2, 200.00),
    -> (2, 5, 1, 399.00),
    -> (3, 2, 1, 300.00),
    -> (4, 3, 1, 450.00),
    -> (5, 6, 2, 220.00), -- Connected to valid book_id 6
    -> (6, 7, 3, 180.00), -- Connected to valid book_id 7
    -> (6, 4, 1, 200.00); -- Connected to valid book_id 4
Query OK, 8 rows affected (0.01 sec)
Records: 8  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Authors;
+-----------+----------------+------------------------------------------------------+
| author_id | author_name    | bio                                                  |
+-----------+----------------+------------------------------------------------------+
|         1 | Chetan Bhagat  | Indian author known for 5 Point Someone.             |
|         2 | Arundhati Roy  | Winner of the Man Booker Prize.                      |
|         3 | R.K. Narayan   | Creator of Malgudi Days.                             |
|         4 | Amish Tripathi | Known for the Shiva Trilogy.                         |
|         5 | Sudha Murty    | Famous author known for her inspiring short stories. |
|         6 | Ruskin Bond    | Renowned Indian author writing about mountain life.  |
+-----------+----------------+------------------------------------------------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM Genres;
+----------+---------------+
| genre_id | genre_name    |
+----------+---------------+
|        1 | Fiction       |
|        2 | Mythology     |
|        3 | History       |
|        4 | Romance       |
|        5 | Short Stories |
+----------+---------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM Customers;
+-------------+--------------+----------------------+---------------+------------+
| customer_id | name         | email                | city          | join_date  |
+-------------+--------------+----------------------+---------------+------------+
|           1 | Aarav Sharma | aarav@gmail.com      | Mumbai        | 2023-01-10 |
|           2 | Diya Patel   | diya.p@yahoo.com     | Ahmedabad     | 2023-02-15 |
|           3 | Vihaan Reddy | vihaan.r@outlook.com | Hyderabad     | 2023-03-20 |
|           4 | Ananya Gupta | ananya.g@gmail.com   | Delhi         | 2023-04-05 |
|           5 | K. Jaisri    | jaisri.k@gmail.com   | Visakhapatnam | 2026-05-18 |
|           6 | S. Rahul     | rahul.s@gmail.com    | Visakhapatnam | 2026-05-10 |
+-------------+--------------+----------------------+---------------+------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM Books;
+---------+-------------------------+--------+----------------+-----------+----------+
| book_id | title                   | price  | stock_quantity | author_id | genre_id |
+---------+-------------------------+--------+----------------+-----------+----------+
|       1 | Five Point Someone      | 250.00 |             50 |         1 |        1 |
|       2 | 2 States                | 300.00 |             40 |         1 |        4 |
|       3 | The God of Small Things | 450.00 |             20 |         2 |        1 |
|       4 | Malgudi Days            | 200.00 |            100 |         3 |        1 |
|       5 | The Immortals of Meluha | 399.00 |             60 |         4 |        2 |
|       6 | The Wise and Otherwise  | 220.00 |             15 |         5 |        5 |
|       7 | Grandmas Bag of Stories | 180.00 |             85 |         5 |        5 |
|       8 | The Room on the Roof    | 299.00 |              4 |         6 |        1 |
+---------+-------------------------+--------+----------------+-----------+----------+
8 rows in set (0.00 sec)

mysql> SELECT * FROM Orders;
+----------+------------+-------------+
| order_id | order_date | customer_id |
+----------+------------+-------------+
|        1 | 2023-05-01 |           1 |
|        2 | 2023-05-03 |           2 |
|        3 | 2023-05-05 |           1 |
|        4 | 2023-06-01 |           3 |
|        5 | 2026-05-12 |           4 |
|        6 | 2026-05-15 |           6 |
+----------+------------+-------------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM Order_Details;
+-----------+----------+---------+------------------+------------------------+
| detail_id | order_id | book_id | quantity_ordered | price_at_time_of_order |
+-----------+----------+---------+------------------+------------------------+
|         1 |        1 |       1 |                1 |                 250.00 |
|         2 |        1 |       4 |                2 |                 200.00 |
|         3 |        2 |       5 |                1 |                 399.00 |
|         4 |        3 |       2 |                1 |                 300.00 |
|         5 |        4 |       3 |                1 |                 450.00 |
|         6 |        5 |       6 |                2 |                 220.00 |
|         7 |        6 |       7 |                3 |                 180.00 |
|         8 |        6 |       4 |                1 |                 200.00 |
+-----------+----------+---------+------------------+------------------------+
8 rows in set (0.00 sec)

mysql> -- Easy Queries--
mysql> -- Sort books from highest price to lowest
mysql> SELECT title, price 
    -> FROM Books 
    -> ORDER BY price DESC;
+-------------------------+--------+
| title                   | price  |
+-------------------------+--------+
| The God of Small Things | 450.00 |
| The Immortals of Meluha | 399.00 |
| 2 States                | 300.00 |
| The Room on the Roof    | 299.00 |
| Five Point Someone      | 250.00 |
| The Wise and Otherwise  | 220.00 |
| Malgudi Days            | 200.00 |
| Grandmas Bag of Stories | 180.00 |
+-------------------------+--------+
8 rows in set (0.03 sec)

mysql> -- Find customers with a Gmail address
mysql> SELECT name, email 
    -> FROM Customers 
    -> WHERE email LIKE '%@gmail.com%';
+--------------+--------------------+
| name         | email              |
+--------------+--------------------+
| Aarav Sharma | aarav@gmail.com    |
| Ananya Gupta | ananya.g@gmail.com |
| K. Jaisri    | jaisri.k@gmail.com |
| S. Rahul     | rahul.s@gmail.com  |
+--------------+--------------------+
4 rows in set (0.01 sec)

mysql> -- Find books that have exactly 100 copies left
mysql> SELECT title, stock_quantity 
    -> FROM Books 
    -> WHERE stock_quantity = 100;
+--------------+----------------+
| title        | stock_quantity |
+--------------+----------------+
| Malgudi Days |            100 |
+--------------+----------------+
1 row in set (0.00 sec)

mysql> -- Medium Queries
mysql> -- Join book names with their author
mysql> SELECT Books.title, Authors.author_name
    -> FROM Books
    -> INNER JOIN Authors ON Books.author_id = Authors.author_id;
+-------------------------+----------------+
| title                   | author_name    |
+-------------------------+----------------+
| Five Point Someone      | Chetan Bhagat  |
| 2 States                | Chetan Bhagat  |
| The God of Small Things | Arundhati Roy  |
| Malgudi Days            | R.K. Narayan   |
| The Immortals of Meluha | Amish Tripathi |
| The Wise and Otherwise  | Sudha Murty    |
| Grandmas Bag of Stories | Sudha Murty    |
| The Room on the Roof    | Ruskin Bond    |
+-------------------------+----------------+
8 rows in set (0.00 sec)

mysql> -- Find order IDs and the cities they are going to
mysql> SELECT Orders.order_id, Customers.city
    -> FROM Orders
    -> INNER JOIN Customers ON Orders.customer_id = Customers.customer_id;
+----------+---------------+
| order_id | city          |
+----------+---------------+
|        1 | Mumbai        |
|        3 | Mumbai        |
|        2 | Ahmedabad     |
|        4 | Hyderabad     |
|        5 | Delhi         |
|        6 | Visakhapatnam |
+----------+---------------+
6 rows in set (0.01 sec)

mysql> -- Show the book prices inside the order details
mysql> 
mysql> SELECT Order_Details.order_id, Order_Details.price_at_time_of_order
    -> FROM Order_Details
    -> INNER JOIN Books ON Order_Details.book_id = Books.book_id;
+----------+------------------------+
| order_id | price_at_time_of_order |
+----------+------------------------+
|        1 |                 250.00 |
|        1 |                 200.00 |
|        2 |                 399.00 |
|        3 |                 300.00 |
|        4 |                 450.00 |
|        5 |                 220.00 |
|        6 |                 180.00 |
|        6 |                 200.00 |
+----------+------------------------+
8 rows in set (0.00 sec)

mysql> -- Hard Queries
mysql> SELECT G.genre_name, MAX(B.price) AS max_price
    -> FROM Books B
    -> INNER JOIN Genres G ON B.genre_id = G.genre_id
    -> GROUP BY G.genre_name
    -> HAVING max_price > 250
    -> ORDER BY max_price DESC;
+------------+-----------+
| genre_name | max_price |
+------------+-----------+
| Fiction    |    450.00 |
| Mythology  |    399.00 |
| Romance    |    300.00 |
+------------+-----------+
3 rows in set (0.01 sec)

mysql> -- Find customers who spent more than 300 Rupees total
mysql> SELECT C.name, SUM(OD.price_at_time_of_order * OD.quantity_ordered) AS total_bill
    -> FROM Order_Details OD
    -> INNER JOIN Orders O ON OD.order_id = O.order_id
    -> INNER JOIN Customers C ON O.customer_id = C.customer_id
    -> GROUP BY C.name
    -> HAVING total_bill > 300
    -> ORDER BY total_bill DESC;
+--------------+------------+
| name         | total_bill |
+--------------+------------+
| Aarav Sharma |     950.00 |
| S. Rahul     |     740.00 |
| Vihaan Reddy |     450.00 |
| Ananya Gupta |     440.00 |
| Diya Patel   |     399.00 |
+--------------+------------+
5 rows in set (0.01 sec)

mysql> -- Find books ordered more than once, sorted by popularity
mysql> SELECT B.title, COUNT(OD.order_id) AS times_ordered
    -> FROM Order_Details OD
    -> INNER JOIN Books B ON OD.book_id = B.book_id
    -> GROUP BY B.title
    -> HAVING times_ordered > 1
    -> ORDER BY times_ordered DESC;
+--------------+---------------+
| title        | times_ordered |
+--------------+---------------+
| Malgudi Days |             2 |
+--------------+---------------+
1 row in set (0.01 sec)

mysql> exit
