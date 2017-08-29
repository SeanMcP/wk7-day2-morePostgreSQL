-- Sean McPherson
-- Use a PostgreSQL database

CREATE TABLE todos (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  details TEXT,
  priority INTEGER NOT NULL DEFAULT 1,
  created_at timestamp NOT NULL,
  completed_at timestamp NULL
);

INSERT INTO todos (title, created_at) VALUES ('Get the girl', TIMESTAMP '1985-09-14 21:52:12');

INSERT INTO todos (title, created_at) VALUES ('Sand the floor', TIMESTAMP '1985-09-15 16:44:23');

INSERT INTO todos (title, details, created_at) VALUES ('Paint the fence', 'Up and down', TIMESTAMP '1985-09-17 18:41:07');

INSERT INTO todos (title, details, created_at) VALUES ('Wax the floor', 'Wax on; wax off', TIMESTAMP '1985-09-21 19:23:16');

INSERT INTO todos (title, details, created_at, completed_at) VALUES ('Catch a fly with chopsticks', 'Concentration', TIMESTAMP '1985-09-22 17:36:23', TIMESTAMP '1985-09-15 17:37:12');

INSERT INTO todos (title, priority, created_at) VALUES
  ('Eat a frog', 1, 'now'),
  ('Eat a grog', 2, 'now'),
  ('Eat a hog', 3, 'now'),
  ('Eat a clog', 5, 'now'),
  ('Eat a flog', 9, 'now'),
  ('Eat a brog', 6, 'now'),
  ('Eat a blog', 3, 'now'),
  ('Eat a trog', 2, 'now'),
  ('Eat a plog', 3, 'now'),
  ('Eat a shog', 7, 'now');

INSERT INTO todos (title, priority, created_at, completed_at) VALUES
  ('Write a book', 5, 'yesterday', 'now'),
  ('Read a book', 6, 'yesterday', 'now'),
  ('Write a poem', 4, 'yesterday', 'now'),
  ('Read a poem', 3, 'yesterday', 'now'),
  ('Sing a song', 5, 'yesterday', 'now');

-- Write a SELECT statement to find all incomplete todos with priority 3.
SELECT * FROM todos WHERE completed_at IS NULL AND priority = 3;

-- Write a SELECT statement to find the number of incomplete todos by priority.
SELECT COUNT(id), priority FROM todos WHERE completed_at IS NULL GROUP BY priority;

-- Write a SELECT statement to find the number of todos by priority created in the last 30 days.
SELECT COUNT(id), priority FROM todos WHERE created_at > NOW() - INTERVAL '30 days' GROUP BY priority;

-- Write a SELECT statement to find the next todo you should work on. This is the todo with the highest priority that was created first.
SELECT title, created_at, priority FROM todos ORDER BY created_at ASC, priority ASC LIMIT 1;
