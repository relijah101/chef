CREATE TABLE role(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(15) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE users(
	id INT NOT NULL AUTO_INCREMENT,
	firstname VARCHAR(15) NOT NULL,
	surname VARCHAR(15) NOT NULL,
	email VARCHAR(30) NOT NULL,
	phone VARCHAR(15) NOT NULL,
	address VARCHAR(50) NOT NULL,
	username VARCHAR(15) NOT NULL,
	password VARCHAR(60) NOT NULL,
	status INT NOT NULL,
	role INT NOT NULL,
	registered_on DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (role) REFERENCES roles (id) 
);

CREATE TABLE menu(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(15) NOT NULL,
	description TEXT NOT NULL, 
	image VARCHAR(50) NOT NULL,
	price INT NOT NULL,
	available INT NOT NULL, # 0 if the menu is currently unavailable, 1 if menu is available
	added_on DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE TABLE orders(
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	menu_id VARCHAR(15) NOT NULL,
	quantity INT NOT NULL,
	reference VARCHAR(15) NOT NULL,
	order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES users (id) 
	FOREIGN KEY (menu_id) REFERENCES menu (id) 
);

CREATE TABLE comments(
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	comment TEXT NOT NULL,
	comment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES users (id) 
);