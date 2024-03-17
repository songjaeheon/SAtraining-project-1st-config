-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema footballmania
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `footballmania` ;

-- -----------------------------------------------------
-- Schema footballmania
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `footballmania` DEFAULT CHARACTER SET utf8mb4 ;
USE `footballmania` ;

-- -----------------------------------------------------
-- Table `footballmania`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `footballmania`.`user` ;

CREATE TABLE IF NOT EXISTS `footballmania`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(36) NOT NULL,
  `name` VARCHAR(64) NOT NULL,
  `email` VARCHAR(64) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `footballmania`.`post`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `footballmania`.`post` ;

CREATE TABLE IF NOT EXISTS `footballmania`.`post` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(36) NOT NULL,
  `title` VARCHAR(64) NOT NULL,
  `text` VARCHAR(1024) NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_post_user_idx` (`user_id` ASC) VISIBLE,
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC) VISIBLE,
  CONSTRAINT `fk_post_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `footballmania`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `footballmania`.`payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `footballmania`.`payment` ;

CREATE TABLE IF NOT EXISTS `footballmania`.`payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
