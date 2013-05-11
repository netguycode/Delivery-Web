
ALTER TABLE  `support` ADD  `status` ENUM(  'open',  'closed' ) NOT NULL DEFAULT  'open' AFTER  `id_support` ,
ADD INDEX (  `status` );
ALTER TABLE  `support` CHANGE  `date`  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE  `support` CHANGE  `timestamp`  `timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;


CREATE TABLE `support_rep` (
 `id_support_rep` int(10) unsigned NOT NULL AUTO_INCREMENT,
 `name` varchar(50) DEFAULT NULL,
 `phone` varchar(50) DEFAULT NULL,
 PRIMARY KEY (`id_support_rep`),
 UNIQUE KEY `name` (`name`,`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO `crunchbutton`.`support_rep` (`id_support_rep`, `name`, `phone`) VALUES (NULL, 'david', '_PHONE_'), (NULL, 'nick', '_PHONE_'), (NULL, 'judd', '_PHONE_'), (NULL, 'devin', '_PHONE_'), (NULL, 'adam', '_PHONE_');
ALTER TABLE  `support_rep` ADD UNIQUE (
`id_support_rep`
);

ALTER TABLE `support` DROP `rep_name`;
ALTER TABLE `support` ADD  `id_support_rep` INT( 10 ) UNSIGNED NULL DEFAULT NULL AFTER  `id_user`;
ALTER TABLE `support` ADD INDEX (  `id_support_rep` );
ALTER TABLE `support`
  ADD CONSTRAINT fk_id_support_rep
  FOREIGN KEY (id_support_rep) 
  REFERENCES `support_rep`(id_support_rep);


