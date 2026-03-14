CREATE database SQL_Proj_Inno;
use SQL_Proj_Inno;
-- 1. Supplier Table
CREATE TABLE IF NOT EXISTS supplier (
    sup_id TINYINT PRIMARY KEY auto_increment,
    sup_name VARCHAR(255),
    address TEXT
);

-- 2. Categories Table
CREATE TABLE IF NOT EXISTS categories (
    cat_id TINYINT PRIMARY KEY auto_increment,
    cat_name VARCHAR(255)
);
-- 3. Employees Table
CREATE TABLE IF NOT EXISTS employees (
    emp_id TINYINT PRIMARY KEY auto_increment,
    emp_name VARCHAR(255),
    hire_date VARCHAR(255)
);

-- 4. Customers Table
CREATE TABLE IF NOT EXISTS customers (
    cust_id SMALLINT PRIMARY KEY auto_increment,
    cust_name VARCHAR(255),
    address TEXT
);

-- 5. Products Table
CREATE TABLE IF NOT EXISTS products (
    prod_id TINYINT PRIMARY KEY auto_increment,
    prod_name VARCHAR(255),
    sup_id TINYINT,
    cat_id TINYINT,
    price DECIMAL(10,2),
    FOREIGN KEY (sup_id) REFERENCES supplier(sup_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (cat_id) REFERENCES categories(cat_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- 6. Orders Table
CREATE TABLE IF NOT EXISTS orders (
    ord_id SMALLINT PRIMARY KEY auto_increment,
    cust_id SMALLINT,
    emp_id TINYINT,
    order_date VARCHAR(255),
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);
-- 7. Order_Details Table
CREATE TABLE IF NOT EXISTS order_details (
    ord_detID SMALLINT AUTO_INCREMENT PRIMARY KEY auto_increment,
    ord_id SMALLINT,
    prod_id TINYINT,
    quantity TINYINT,
    each_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    FOREIGN KEY (ord_id) REFERENCES orders(ord_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (prod_id) REFERENCES products(prod_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);