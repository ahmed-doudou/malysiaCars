-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 02 mars 2020 à 14:50
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

​
--
-- Base de données : `malysiaCar`
--

-- -----------------------------------------------------

--
-- Schema malysiaCar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `malysiaCar` DEFAULT CHARACTER SET utf8 ;
USE `malysiaCar` ;
​
-- -----------------------------------------------------
-- Table `malysiaCar`.`Ville`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `malysiaCar`.`Ville` (
  `idVille` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  PRIMARY KEY (`idVille`))
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `malysiaCar`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `malysiaCar`.`Client` (
  `idClient` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Prenom` VARCHAR(45) NULL,
  `CIN_OR_Passeport` VARCHAR(45) NULL,
  `CIN_OR_Passeport_Exp` DATE NULL,
  `CIN_OR_Passeport_Ville` VARCHAR(45) NULL,
  `Permis` VARCHAR(45) NULL,
  `Permis_Delivre` DATE NULL,
  `Permis_Ville` VARCHAR(45) NULL,
  `Date_De_Naissance` DATE NULL,
  `Ville_Naissance` VARCHAR(45) NULL,
  `Telephone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `Nationalite` VARCHAR(45) NULL,
  `Ville_Actuelle` VARCHAR(45) NULL,
  `Adresse` VARCHAR(45) NULL,
  `Commentaire` VARCHAR(45) NULL,
  `Ville_idVille` INT NOT NULL,
  PRIMARY KEY (`idClient`, `Ville_idVille`),
  INDEX `fk_Client_Ville1_idx` (`Ville_idVille` ASC),
  CONSTRAINT `fk_Client_Ville1`
    FOREIGN KEY (`Ville_idVille`)
    REFERENCES `malysiaCar`.`Ville` (`idVille`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `malysiaCar`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `malysiaCar`.`Admin` (
  `idAdmin` INT NOT NULL,
  `Nom_Complet` VARCHAR(45) NULL,
  `login` VARCHAR(45) NULL,
  `mot_de_passe` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idAdmin`))
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `malysiaCar`.`Contrat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `malysiaCar`.`Contrat` (
  `idContrat` INT NOT NULL,
  `Heure_Depart` VARCHAR(45) NULL,
  `Heure_Retour` VARCHAR(45) NULL,
  `Date_Depart` DATE NULL,
  `Date_Retour` DATE NULL,
  `Lieu_Depart` VARCHAR(45) NULL,
  `Lieu_Retour` VARCHAR(45) NULL,
  `KM_Depart` INT(11) NULL,
  `KM_Retour` INT(11) NULL,
  `PU` INT(11) NULL,
  `frais_sup` INT(11) NULL,
  `Total_TTC` VARCHAR(45) NULL,
  `Matricule` VARCHAR(45) NULL,
  `avec_Conducteur` TINYINT(1) NULL,
  `Observation` VARCHAR(45) NULL,
  `Client_idClient` INT NOT NULL,
  `Admin_idAdmin` INT NOT NULL,
  PRIMARY KEY (`idContrat`, `Client_idClient`, `Admin_idAdmin`),
  INDEX `fk_Contrat_Client_idx` (`Client_idClient` ASC),
  INDEX `fk_Contrat_Admin1_idx` (`Admin_idAdmin` ASC),
  CONSTRAINT `fk_Contrat_Client`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `malysiaCar`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contrat_Admin1`
    FOREIGN KEY (`Admin_idAdmin`)
    REFERENCES `malysiaCar`.`Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `malysiaCar`.`Voiture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `malysiaCar`.`Voiture` (
  `idVoiture` INT NOT NULL,
  `Matricule` VARCHAR(45) NULL,
  `marque` VARCHAR(45) NULL,
  `Nombre_De_Place` INT(11) NULL,
  `Carburant` VARCHAR(45) NULL,
  `Boite de vitesses` VARCHAR(45) NULL,
  `Couleur` VARCHAR(45) NULL,
  `Prochaine_Visite_Technique` DATE NULL,
  `Options` VARCHAR(45) NULL,
  `Commentaire` VARCHAR(45) NULL,
  `Client_idClient` INT NOT NULL,
  `Admin_idAdmin` INT NOT NULL,
  PRIMARY KEY (`idVoiture`, `Client_idClient`, `Admin_idAdmin`),
  INDEX `fk_Voiture_Client1_idx` (`Client_idClient` ASC),
  INDEX `fk_Voiture_Admin1_idx` (`Admin_idAdmin` ASC),
  CONSTRAINT `fk_Voiture_Client1`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `malysiaCar`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Voiture_Admin1`
    FOREIGN KEY (`Admin_idAdmin`)
    REFERENCES `malysiaCar`.`Admin` (`idAdmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;