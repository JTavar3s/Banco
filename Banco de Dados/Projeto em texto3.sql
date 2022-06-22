-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`AtendenteDB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AtendenteDB` (
  `id` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Idade` INT NULL,
  `Setor` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CadastroDB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CadastroDB` (
  `IdCadastro` INT NOT NULL ,
  PRIMARY KEY (`IdCadastro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PacienteDB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PacienteDB` (
  `idPaciente` INT NOT NULL,
  `Sintomas` VARCHAR(45) NULL,
  `NomePaciente` VARCHAR(45) NOT NULL,
  `Idade` INT NULL,
  `AtendenteDB_idAtendenteDB` INT NULL,
  `CadastroDB_IdCadastro` INT NULL,
  PRIMARY KEY (`idPaciente`),
  INDEX `fk_PacienteDB_AtendenteDB1_idx` (`AtendenteDB_idAtendenteDB` ASC) INVISIBLE,
  INDEX `fk_PacienteDB_CadastroDB1_idx` (`CadastroDB_IdCadastro` ASC) INVISIBLE,
  CONSTRAINT `fk_PacienteDB_AtendenteDB1`
    FOREIGN KEY (`AtendenteDB_idAtendenteDB`)
    REFERENCES `mydb`.`AtendenteDB` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_PacienteDB_CadastroDB1`
    FOREIGN KEY (`CadastroDB_IdCadastro`)
    REFERENCES `mydb`.`CadastroDB` (`IdCadastro`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MedicoDB`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MedicoDB` (
  `id` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Idade` INT NULL,
  `Setor` VARCHAR(45) NULL,
  INDEX `idMedico` (`id` ASC) VISIBLE,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

select * from pacientedb;
select * from atendentedb;
select * from medicodb;
select * from cadastrodb;
-- -----------------------------------------------------
-- Table `mydb`.`Medico_has_Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medico_has_Paciente` (
  `Medico_idMedico` INT NOT NULL,
  `Paciente_idPaciente` INT NOT NULL,
  PRIMARY KEY (`Medico_idMedico`, `Paciente_idPaciente`),
  INDEX `fk_Medico_has_Paciente_Paciente1_idx` (`Paciente_idPaciente` ASC) VISIBLE,
  INDEX `fk_Medico_has_Paciente_Medico_idx` (`Medico_idMedico` ASC) VISIBLE,
  CONSTRAINT `fk_Medico_has_Paciente_Medico`
    FOREIGN KEY (`Medico_idMedico`)
    REFERENCES `mydb`.`MedicoDB` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Medico_has_Paciente_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente`)
    REFERENCES `mydb`.`PacienteDB` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
