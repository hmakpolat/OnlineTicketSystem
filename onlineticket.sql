-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema onlineticket
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema onlineticket
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `onlineticket` DEFAULT CHARACTER SET utf8 ;
USE `onlineticket` ;

-- -----------------------------------------------------
-- Table `onlineticket`.`event_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineticket`.`event_type` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlineticket`.`region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineticket`.`region` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlineticket`.`Member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineticket`.`Member` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `e_mail` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `birth_date` DATE NOT NULL,
  `member_type` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlineticket`.`place`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineticket`.`place` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NULL,
  `city` VARCHAR(45) NOT NULL,
  `postalCode` INT NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `Member_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_place_Member1_idx` (`Member_id` ASC),
  CONSTRAINT `fk_place_Member1`
    FOREIGN KEY (`Member_id`)
    REFERENCES `onlineticket`.`Member` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlineticket`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineticket`.`event` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `info` VARCHAR(45) NOT NULL,
  `date` DATE NOT NULL,
  `capacity` INT NOT NULL,
  `event_type_id` INT NOT NULL,
  `region_id` INT NOT NULL,
  `place_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_event_type1_idx` (`event_type_id` ASC),
  INDEX `fk_event_region1_idx` (`region_id` ASC),
  INDEX `fk_event_place1_idx` (`place_id` ASC),
  CONSTRAINT `fk_event_event_type1`
    FOREIGN KEY (`event_type_id`)
    REFERENCES `onlineticket`.`event_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_region1`
    FOREIGN KEY (`region_id`)
    REFERENCES `onlineticket`.`region` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_event_place1`
    FOREIGN KEY (`place_id`)
    REFERENCES `onlineticket`.`place` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlineticket`.`seat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineticket`.`seat` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `seat_number` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_seat_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_seat_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `onlineticket`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlineticket`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineticket`.`category` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `price` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_category_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_category_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `onlineticket`.`event` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `onlineticket`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `onlineticket`.`city` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `region_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_city_region1_idx` (`region_id` ASC),
  CONSTRAINT `fk_city_region1`
    FOREIGN KEY (`region_id`)
    REFERENCES `onlineticket`.`region` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
