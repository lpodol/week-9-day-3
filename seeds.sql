CREATE TABLE dwarves
(id INTEGER PRIMARY KEY,
name TEXT, color TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);

CREATE TRIGGER dwarfs BEFORE UPDATE ON dwarfs BEGIN
  UPDATE dwarfs SET updated_at = CURRENT_TIMESTAMP WHERE id = new.id;
END;

INSERT INTO dwarves (name, color) VALUES ('Happy', 'yellow'),
('Dopey', 'purple'), ('Sneezy', 'yellow'), ('Grumpy', 'brown'),
('Doc', 'brown'), ('Sleepy', 'blue'), ('Bashful', 'blue');
