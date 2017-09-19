CREATE DATABASE lyrics_database;
USE lyrics_database;


CREATE TABLE IF NOT EXISTS `singer` (
  `id`   INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  PRIMARY KEY (`id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `song` (
  `id`          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title`       VARCHAR(50),
  `composer_id` INT(10),
  `lyric`       TEXT DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE(`title`, `composer_id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `singer_song` (
  `id`        INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `singer_id` INT(10) UNSIGNED NOT NULL,
  `song_id`   INT(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE(`singer_id`,`song_id`),
  CONSTRAINT `fk_singer` FOREIGN KEY (`singer_id`) REFERENCES `singer` (`id`)
  ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_song` FOREIGN KEY (`song_id`) REFERENCES `song` (`id`)
  ON DELETE NO ACTION ON UPDATE CASCADE
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `version` (
  `id`      INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` VARCHAR(50),
  PRIMARY KEY (`id`),
  UNIQUE(`version`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `version_song` (
  `song_id` INT(10),
  `version` VARCHAR(50),
  UNIQUE(`song_id`, `version`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

