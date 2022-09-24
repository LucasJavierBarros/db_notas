-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema notas_PG
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema notas_PG
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `notas_PG` DEFAULT CHARACTER SET utf8 ;
USE `notas_PG` ;

-- -----------------------------------------------------
-- Table `notas_PG`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_PG`.`usuarios` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
insert into usuarios (id, nombre, email) values (default, 'Raffarty', 'rmcmeekin0@noaa.gov');
insert into usuarios (id, nombre, email) values (default, 'Cheri', 'cmcboyle1@sciencedaily.com');
insert into usuarios (id, nombre, email) values (default, 'Lorie', 'llinkie2@edublogs.org');
insert into usuarios (id, nombre, email) values (default, 'Borden', 'btabary3@squidoo.com');
insert into usuarios (id, nombre, email) values (default, 'Briny', 'bbrunnen4@storify.com');
insert into usuarios (id, nombre, email) values (default, 'Mathilda', 'mkelston5@ucoz.ru');
insert into usuarios (id, nombre, email) values (default, 'Koral', 'kcowden6@bluehost.com');
insert into usuarios (id, nombre, email) values (default, 'Gabriell', 'gcanedo7@imdb.com');
insert into usuarios (id, nombre, email) values (default, 'Cynthy', 'clackney8@shinystat.com');
insert into usuarios (id, nombre, email) values (default, 'Ban', 'bwinckworth9@webmd.com');

-- -----------------------------------------------------
-- Table `notas_PG`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_PG`.`categorias` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
insert into categorias (id, nombre) values (default, 'Musical');
insert into categorias (id, nombre) values (default, 'Rapida');
insert into categorias (id, nombre) values (default, 'Formula');
insert into categorias (id, nombre) values (default, 'Recordatorio');
insert into categorias (id, nombre) values (default, 'Temporal');
insert into categorias (id, nombre) values (default, 'Numerica');
insert into categorias (id, nombre) values (default, 'Evento');
insert into categorias (id, nombre) values (default, 'Trabajo');
insert into categorias (id, nombre) values (default, 'Hogar');
insert into categorias (id, nombre) values (default, 'Oficina');

-- -----------------------------------------------------
-- Table `notas_PG`.`notas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_PG`.`notas` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `eliminacion` TINYINT NOT NULL DEFAULT 0,
  `id_categoria` INT UNSIGNED NOT NULL,
  `id_usuario` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_notas_usuarios_idx` (`id_usuario` ASC) VISIBLE,
  INDEX `fk_notas_categorias_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_notas_usuarios`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `notas_PG`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notas_categorias`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `notas_PG`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
insert into notas (titulo, descripcion, eliminacion, id_categoria, id_usuario) values ('in', 'Nulla ut erat id mauris vulputate elementum.', 1, 10, 1);
insert into notas (titulo, descripcion, eliminacion, id_categoria, id_usuario) values ('sit', 'Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 0, 1, 6);
insert into notas (titulo, descripcion, eliminacion, id_categoria, id_usuario) values ('dui luctus', 'Nullam varius. Nulla facilisi.', 1, 1, 1);
insert into notas (titulo, descripcion, eliminacion, id_categoria, id_usuario) values ('proin', 'Nullam sit amet turpis elementum ligula vehicula consequat.', 1, 7, 6);
insert into notas (titulo, descripcion, eliminacion, id_categoria, id_usuario) values ('vestibulum sit', 'Etiam faucibus cursus urna. Ut tellus.', 1, 6, 5);
insert into notas (titulo, descripcion, eliminacion, id_categoria, id_usuario) values ('viverra diam vitae', 'Etiam pretium iaculis justo.', 1, 5, 6);
insert into notas (titulo, descripcion, eliminacion, id_categoria, id_usuario) values ('dui vel', 'Integer non velit.', 0, 7, 6);
insert into notas (titulo, descripcion, eliminacion, id_categoria, id_usuario) values ('viverra', 'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 1, 7, 7);
insert into notas (titulo, descripcion, eliminacion, id_categoria, id_usuario) values ('aliquam', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.', 0, 9, 5);
insert into notas (titulo, descripcion, eliminacion, id_categoria, id_usuario) values ('sed magna at', 'Etiam justo.', 0, 3, 6);

-- -----------------------------------------------------
-- Table `notas_PG`.`estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_PG`.`estados` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;
insert into estados (nombre, fecha) values ('Creada', '2021/06/23');
insert into estados (nombre, fecha) values ('Creada', '2021/02/19');
insert into estados (nombre, fecha) values ('Modificada', '2022/08/17');
insert into estados (nombre, fecha) values ('Eliminada', '2022/07/17');
insert into estados (nombre, fecha) values ('Modificada', '2022/06/25');
insert into estados (nombre, fecha) values ('Modificada', '2022/06/02');
insert into estados (nombre, fecha) values ('Modificada', '2021/10/24');
insert into estados (nombre, fecha) values ('Eliminada', '2021/05/05');
insert into estados (nombre, fecha) values ('Eliminada', '2021/11/25');
insert into estados (nombre, fecha) values ('Eliminada', '2022/05/01');
-- -----------------------------------------------------
-- Table `notas_PG`.`notas_estados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `notas_PG`.`notas_estados` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_nota` INT UNSIGNED NOT NULL,
  `id_estado` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_nota_notaestado_idx` (`id_nota` ASC) VISIBLE,
  INDEX `fk_notaestado_estado_idx` (`id_estado` ASC) VISIBLE,
  CONSTRAINT `fk_nota_notaestado`
    FOREIGN KEY (`id_nota`)
    REFERENCES `notas_PG`.`notas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_notaestado_estado`
    FOREIGN KEY (`id_estado`)
    REFERENCES `notas_PG`.`estados` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
insert into notas_estados (id_nota, id_estado) values (2, 6);
insert into notas_estados (id_nota, id_estado) values (5, 9);
insert into notas_estados (id_nota, id_estado) values (3, 5);
insert into notas_estados (id_nota, id_estado) values (7, 5);
insert into notas_estados (id_nota, id_estado) values (6, 7);
insert into notas_estados (id_nota, id_estado) values (4, 8);
insert into notas_estados (id_nota, id_estado) values (9, 1);
insert into notas_estados (id_nota, id_estado) values (1, 8);
insert into notas_estados (id_nota, id_estado) values (1, 9);
insert into notas_estados (id_nota, id_estado) values (5, 5);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
