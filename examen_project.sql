CREATE TABLE members
(id_member INTEGER PRIMARY KEY AUTOINCREMENT ,
firstname VARCHAR(255) NOT NULL,
lastname VARCHAR(255) NOT NULL,
mail VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL,
passwordconfirmation VARCHAR(255) NOT NULL,
admin boolean);

CREATE TABLE curtainorders
(id_order INTEGER PRIMARY KEY AUTOINCREMENT ,
member INTEGER NOT NULL REFERENCES members(id_member),
fabric INTEGER NOT NULL REFERENCES fabrics(id_fabric),
price_m² REAL NOT NULL,
height INTEGER NOT NULL,
width INTEGER NOT NULL,
total REAL NOT NULL,
date TIMESTAMP DEFAULT(DATETIME(CURRENT_TIMESTAMP, 'LOCALTIME'))  NOT NULL,
status VARCHAR(10) NOT NULL CHECK ( status IN ('open','sent','paid')));

CREATE TABLE fabrics
(id_fabric INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(255) NOT NULL,
description VARCHAR(1024) NULL,
price_m² REAL NOT NULL,
color VARCHAR(255) NOT NULL);

CREATE TABLE decoration_items
(decoration_item_id INTEGER PRIMARY KEY AUTOINCREMENT,
name VARCHAR(255) NOT NULL,
price REAL NOT NULL,
description VARCHAR(1024) NOT NULL,
picture_filepath VARCHAR(255) NOT NULL,
date_time_added TIMESTAMP DEFAULT(DATETIME(CURRENT_TIMESTAMP, 'LOCALTIME')) NOT NULL);

CREATE TABLE favorites_decorations (
  id_favorite INTEGER PRIMARY KEY AUTOINCREMENT,
  id_member INTEGER NOT NULL,
  decoration_item_id INTEGER NOT NULL,
  FOREIGN KEY (id_member) REFERENCES members (id_member),
  FOREIGN KEY (decoration_item_id) REFERENCES decoration_items (decoration_item_id)
);
CREATE TABLE tickets
(id_ticket INTEGER PRIMARY KEY AUTOINCREMENT,
subject VARCHAR(255) NOT NULL,
picture VARCHAR(255) NULL,
creation_date TIMESTAMP DEFAULT (DATETIME(CURRENT_TIMESTAMP, 'LOCALTIME')) NOT NULL,
member INTEGER NOT NULL,
 FOREIGN KEY(member) REFERENCES members(id_member)
);

CREATE TABLE messages
(id_message INTEGER PRIMARY KEY AUTOINCREMENT,
member INTEGER NOT NULL REFERENCES  members(id_member),
ticket INTEGER NOT NULL REFERENCES tickets(id_ticket),
firstname VARCHAR(255) NOT NULL,
lastname VARCHAR(255) NOT NULL,
mail VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL,
admin BOOLEAN NOT NULL );

SELECT * FROM members;
SELECT * FROM members WHERE mail;

SELECT * FROM decoration_items;
SELECT * FROM decoration_items ORDER BY price ASC;
SELECT * FROM decoration_items ORDER BY price DESC;
SELECT * FROM decoration_items ORDER BY date_time_added ASC;
SELECT * FROM decoration_items ORDER BY date_time_added DESC;
SELECT * FROM decoration_items WHERE decoration_item_id;
SELECT * FROM decoration_items WHERE decoration_item_id IN (SELECT decoration_item_id FROM favorites_decorations);
SELECT COUNT(*) as count FROM favorites_decorations WHERE decoration_item_id;


INSERT INTO members(firstname, lastname, mail, password,passwordconfirmation,admin) VALUES ('Olivier','Choquet','o.ch@gmail.com','2 $ à 10 $ 2 000 $.. SB9TnLRdosO4GsMPY.s0dETcOTZz81Y0yASQq3d3z.bRisAsW','2 $ à 10 $ 2 000 $.. SB9TnLRdosO4GsMPY.s0dETcOTZz81Y0yASQq3d3z.bRisAsW', false);
INSERT INTO members(firstname, lastname, mail, password,passwordconfirmation, admin) VALUES ('Gregory','Seront','o.se@hotmail.com','2 $ à 10 $. /5N/1CI86jnLyTQafqckOdwxcMDTMirO63och2RW5tTUZuNY5t76','2 $ à 10 $. /5N/1CI86jnLyTQafqckOdwxcMDTMirO63och2RW5tTUZuNY5t76',false);
INSERT INTO members(firstname, lastname, mail, password,passwordconfirmation, admin) VALUES ('Sébastien','Strebelle','s.st@vinci.be','$2a$10$NVDJFHuOjKVfqt4uJ0Zgwe9QW7wF4/8JJE3fatGH3r4iqe9kfMMwC','$2a$10$NVDJFHuOjKVfqt4uJ0Zgwe9QW7wF4/8JJE3fatGH3r4iqe9kfMMwC',true);
INSERT INTO fabrics(name, description, price_m², color) VALUES ('soie','azeazeazeaz','25,99','vert');
INSERT INTO fabrics(name, description, price_m², color) VALUES ('coton','azeazeeazazeaz','35,99','rouge');
INSERT INTO decoration_items(name, price, description,picture_filepath,date_time_added) VALUES ('Coussin bleu',12.99,'Coussin uni bleu – housse 100 % coton','/images/cousssin_bleu.jpg',DATETIME('2023-01-06 10:46:22'));
INSERT INTO decoration_items(name, price, description,picture_filepath,date_time_added) VALUES ('Cadre mural',31.5,'Cadre mural pour photo ou poster','/images/cadre_mural.jpeg',DATETIME('2023-01-06 10:48:33'));
INSERT INTO decoration_items(name, price, description,picture_filepath,date_time_added) VALUES ('Cadre photo',7.99,'Cadre photo à poser contour noir','/images/cadre_photo.jpeg',DATETIME('2023-01-06 11:12:06'));
INSERT INTO decoration_items(name, price, description,picture_filepath,date_time_added) VALUES ('Cache-pot ',24.99,'Cache-pot en pierre naturel.','/images/cache_pot.jpeg',DATETIME('2023-01-30 10:25:23'));
INSERT INTO curtainorders(member, fabric, price_m², height, width, total, status) VALUES (2, 2,'57,99','44','179','266,59', 'sent');
INSERT INTO curtainorders(member, fabric, price_m², height, width, total, status) VALUES (2, 1,'47,56','144','79','366,59', 'open');
INSERT INTO curtainorders(member, fabric, price_m², height, width, total, status) VALUES (1, 1,'47,56','144','79','366,59', 'paid');
INSERT INTO favorites_decorations (id_member,decoration_item_id ) VALUES (1,3);
INSERT INTO favorites_decorations (id_member,decoration_item_id ) VALUES (2,4);
INSERT INTO favorites_decorations (id_member,decoration_item_id ) VALUES (1,4);
INSERT INTO favorites_decorations (id_member,decoration_item_id ) VALUES (1,1);
INSERT INTO tickets(subject, picture, creation_date, member) VALUES ('eaz','zamkjdsq/dslqkzad/dsq.png', 'bonjour bonjour test ticket', 1);
INSERT INTO tickets(subject, picture, creation_date, member) VALUES ('fsqfqseaz','zamkjdsq/dslqkzad/dsqdsqdsq.png', 'bonjour bonjour test dsqdsqticket', 2);
INSERT INTO messages(member, ticket, firstname, lastname, mail, password, admin) VALUES (1,2,'maaz','azr','ezaeaz@gmail.com','azkazkaz213',false);
INSERT INTO messages(member, ticket, firstname, lastname, mail, password, admin) VALUES (2,1,'meaeazaaz','azrfsq','ezfqsaeaz@gmail.com','azkafsqzkaz213',true);