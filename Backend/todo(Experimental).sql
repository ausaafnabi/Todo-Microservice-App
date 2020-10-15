CREATE TABLE `user` (
  `uid` int PRIMARY KEY,
  `username` varchar(255) UNIQUE NOT NULL,
  `full_name` type NOT NULL,
  `region` varchar[6],
  `signup_date` date,
  `last_activity` timestamp
);

CREATE TABLE `collaborators` (
  `collab_ID` hash,
  `user_ID` int
);

CREATE TABLE `notebook` (
  `notebook_id` int PRIMARY KEY,
  `author` int,
  `collab` int,
  `Todos` int,
  `created_at` date,
  PRIMARY KEY (`notebook_id`, `author`)
);

CREATE TABLE `TODO` (
  `Todo_id` int PRIMARY KEY,
  `username` varchar(255),
  `todo` message,
  `ischeck` bool,
  `posting_time` timestamp
);

CREATE TABLE `todo_jobs` (
  `id` integer,
  `status` ENUM ('created', 'running', 'done', 'failure')
);

ALTER TABLE `user` ADD FOREIGN KEY (`last_activity`) REFERENCES `TODO` (`posting_time`);

ALTER TABLE `collaborators` ADD FOREIGN KEY (`user_ID`) REFERENCES `user` (`uid`);

ALTER TABLE `notebook` ADD FOREIGN KEY (`author`) REFERENCES `user` (`uid`);

ALTER TABLE `notebook` ADD FOREIGN KEY (`collab`) REFERENCES `collaborators` (`collab_ID`);

ALTER TABLE `TODO` ADD FOREIGN KEY (`Todo_id`) REFERENCES `notebook` (`Todos`);

ALTER TABLE `TODO` ADD FOREIGN KEY (`username`) REFERENCES `user` (`username`);

CREATE INDEX `notebook_index_0` ON `notebook` (`created_at`) USING HASH;

CREATE INDEX `notebook_index_1` ON `notebook` ((id*2), (getdate()));
