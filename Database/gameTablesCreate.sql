CREATE SCHEMA game;

CREATE  TABLE game.roles ( 
	rname                VARCHAR(100)       ,
	rvalue               INT       ,
	CONSTRAINT unq_roles_rvalue UNIQUE ( rvalue ) 
 ) engine=InnoDB;

CREATE  TABLE game.users ( 
	id                   CHAR(10)  NOT NULL     PRIMARY KEY,
	name                 VARCHAR(100)  NOT NULL     ,
	password             VARCHAR(10)  NOT NULL     ,
	permission           INT  NOT NULL     
 ) engine=InnoDB;

CREATE  TABLE game.admins ( 
	id                   CHAR(20)  NOT NULL     PRIMARY KEY,
	password             VARCHAR(10)  NOT NULL     ,
	name                 VARCHAR(100)  NOT NULL     ,
	permission           INT  NOT NULL     
 ) engine=InnoDB;

ALTER TABLE game.admins ADD CONSTRAINT fk_admins_roles FOREIGN KEY ( permission ) REFERENCES game.roles( rvalue ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE game.users ADD CONSTRAINT fk_users_roles FOREIGN KEY ( permission ) REFERENCES game.roles( rvalue ) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE game.users COMMENT '用户';

ALTER TABLE game.users MODIFY id CHAR(10)  NOT NULL   COMMENT '用户id';
