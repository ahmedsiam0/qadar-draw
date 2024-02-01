/*
ERD: https://mermaid.live/edit#pako:eNp9j7sOwjAMRX8l8tzyAdmQaCdYWrGgLFZjICqJIzcVQm3_nfCSOuHJ8jnS9Z2gY0uggWTn8CLoTVB5jm3VqHnebOZJNdu63ldKK489DSu-cFnyikeU5DoXMf3V7i5kDAV4Eo_O5vTppRtIV_JkQOfVovQGTFiyh2Pi9hE60ElGKmCMNkd8_wV9xtuQr2RdYjl86rxbFRAxnJh_zvIEnj5Mhg
*/

CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `email` VARCHAR(128) NOT NULL UNIQUE,
    `username` VARCHAR(128),
    `password` VARCHAR(128) CHECK(`password` LIKE '______%'),
    PRIMARY KEY(`id`)
);

CREATE TABLE `raffles` (
    `id` INT AUTO_INCREMENT,
    `title` VARCHAR(128) NOT NULL UNIQUE,
    `owner_id` INT NOT NULL UNIQUE,
    `last_participation_number` INT NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`owner_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `wins` (
    `id` INT AUTO_INCREMENT,
    `winner_id` INT NOT NULL,
    `raffle_id` INT NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`winner_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`raffle_id`) REFERENCES `raffles`(`id`)
);

CREATE TABLE `participations` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `raffle_id` INT NOT NULL,
    `participation_number` INT NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`raffle_id`) REFERENCES `raffles`(`id`)
);
