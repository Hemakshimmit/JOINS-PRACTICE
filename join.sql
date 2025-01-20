mysql> -- Step 1: Create the Database
mysql> CREATE DATABASE JoinPractice;
Query OK, 1 row affected (0.01 sec)

mysql> USE JoinPractice;
Database changed
mysql>
mysql> -- Step 2: Create the Employees Table
mysql> CREATE TABLE Employees (
    ->     EmpID INT PRIMARY KEY,
    ->     Name VARCHAR(50),
    ->     DeptID INT,
    ->     Salary INT
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql>
mysql> -- Step 3: Insert Data into Employees Table
mysql> INSERT INTO Employees (EmpID, Name, DeptID, Salary) VALUES
    -> (1, 'Amit', 101, 50000),
    -> (2, 'Priya', 102, 60000),
    -> (3, 'Rahul', NULL, 70000),
    -> (4, 'Sneha', 101, 80000);
Query OK, 4 rows affected (0.00 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Step 4: Create the Departments Table
mysql> CREATE TABLE Departments (
    ->     DeptID INT PRIMARY KEY,
    ->     DeptName VARCHAR(50),
    ->     Location VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.20 sec)

mysql>
mysql> -- Step 5: Insert Data into Departments Table
mysql> INSERT INTO Departments (DeptID, DeptName, Location) VALUES
    -> (101, 'Human Resources', 'Mumbai'),
    -> (102, 'Engineering', 'Bengaluru'),
    -> (103, 'Marketing', 'Delhi');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql>
mysql> -- Step 6: Perform INNER JOIN
mysql> SELECT Employees.EmpID, Employees.Name, Departments.DeptName, Employees.Salary
    -> FROM Employees
    -> INNER JOIN Departments ON Employees.DeptID = Departments.DeptID;
+-------+-------+-----------------+--------+
| EmpID | Name  | DeptName        | Salary |
+-------+-------+-----------------+--------+
|     1 | Amit  | Human Resources |  50000 |
|     2 | Priya | Engineering     |  60000 |
|     4 | Sneha | Human Resources |  80000 |
+-------+-------+-----------------+--------+
3 rows in set (0.00 sec)

mysql>
mysql> -- Step 7: Perform LEFT JOIN
mysql> SELECT Employees.EmpID, Employees.Name, Departments.DeptName, Employees.Salary
    -> FROM Employees
    -> LEFT JOIN Departments ON Employees.DeptID = Departments.DeptID;
+-------+-------+-----------------+--------+
| EmpID | Name  | DeptName        | Salary |
+-------+-------+-----------------+--------+
|     1 | Amit  | Human Resources |  50000 |
|     2 | Priya | Engineering     |  60000 |
|     3 | Rahul | NULL            |  70000 |
|     4 | Sneha | Human Resources |  80000 |
+-------+-------+-----------------+--------+
4 rows in set (0.00 sec)

mysql>
mysql> -- Step 8: Perform RIGHT JOIN
mysql> SELECT Employees.EmpID, Employees.Name, Departments.DeptName, Employees.Salary
    -> FROM Employees
    -> RIGHT JOIN Departments ON Employees.DeptID = Departments.DeptID;
+-------+-------+-----------------+--------+
| EmpID | Name  | DeptName        | Salary |
+-------+-------+-----------------+--------+
|     4 | Sneha | Human Resources |  80000 |
|     1 | Amit  | Human Resources |  50000 |
|     2 | Priya | Engineering     |  60000 |
|  NULL | NULL  | Marketing       |   NULL |
+-------+-------+-----------------+--------+
4 rows in set (0.00 sec)

mysql>
mysql> -- Step 9: Perform FULL JOIN
mysql> -- MySQL does not support FULL JOIN directly; we can emulate it using UNION
mysql> SELECT Employees.EmpID, Employees.Name, Departments.DeptName, Employees.Salary
    -> FROM Employees
    -> LEFT JOIN Departments ON Employees.DeptID = Departments.DeptID
    -> UNION
    -> SELECT Employees.EmpID, Employees.Name, Departments.DeptName, Employees.Salary
    -> FROM Employees
    -> RIGHT JOIN Departments ON Employees.DeptID = Departments.DeptID;
+-------+-------+-----------------+--------+
| EmpID | Name  | DeptName        | Salary |
+-------+-------+-----------------+--------+
|     1 | Amit  | Human Resources |  50000 |
|     2 | Priya | Engineering     |  60000 |
|     3 | Rahul | NULL            |  70000 |
|     4 | Sneha | Human Resources |  80000 |
|  NULL | NULL  | Marketing       |   NULL |
+-------+-------+-----------------+--------+
5 rows in set (0.00 sec)

mysql>