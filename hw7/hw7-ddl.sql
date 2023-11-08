# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    tag VARCHAR(50) NOT NULL,
    url VARCHAR(255) DEFAULT NULL,
    time_commitment INT DEFAULT NULL,
    PRIMARY KEY (id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

-- Sample data for skills table
INSERT INTO skills (id, name, description, tag, time_commitment)
VALUES
    (1, 'Coding Wizardry', 'Master the art of coding spells and incantations.', 'Skill 1', 80),
    (2, 'Data Sorcery', 'Harness the power of data manipulation.', 'Skill 2', 60),
    (3, 'Web Enchantment', 'Craft mesmerizing web experiences.', 'Skill 3', 70),
    (4, 'Networking Alchemy', 'Connect devices with the magic of networking.', 'Skill 4', 90),
    (5, 'Cybersecurity Spells', 'Protect against dark cyber forces.', 'Skill 5', 100),
    (6, 'Machine Learning Enigma', 'Uncover the secrets of machine learning.', 'Skill 6', 120),
    (7, 'AI Oracle', 'Channel the wisdom of artificial intelligence.', 'Skill 7', 110),
    (8, 'Cloud Wizard', 'Control the skies of cloud computing.', 'Skill 8', 85);


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id INT NOT NULL,
    first_name VARCHAR(256),
    last_name VARCHAR(256) NOT NULL,
    email VARCHAR(256),
    linkedin_url VARCHAR(256),
    headshot_url VARCHAR(256),
    discord_handle VARCHAR(256),
    brief_bio TEXT,
    date_joined DATE NOT NULL,
    PRIMARY KEY (id)
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.
INSERT INTO people (id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
VALUES
    (1, 'John', 'Person 1', 'john.person1@example.com', 'LinkedIn1', 'Headshot1', 'Discord1', 'Bio1', '2023-01-01'),
    (2, 'Jane', 'Person 2', 'jane.person2@example.com', 'LinkedIn2', 'Headshot2', 'Discord2', 'Bio2', '2023-01-02'),
    (3, 'Alice', 'Person 3', 'alice.person3@example.com', 'LinkedIn3', 'Headshot3', 'Discord3', 'Bio3', '2023-01-03'),
    (4, 'Bob', 'Person 4', 'bob.person4@example.com', 'LinkedIn4', 'Headshot4', 'Discord4', 'Bio4', '2023-01-04'),
    (5, 'Eve', 'Person 5', 'eve.person5@example.com', 'LinkedIn5', 'Headshot5', 'Discord5', 'Bio5', '2023-01-05'),
    (6, 'Charlie', 'Person 6', 'charlie.person6@example.com', 'LinkedIn6', 'Headshot6', 'Discord6', 'Bio6', '2023-01-06');
     (7, 'David', 'Person 7', 'david.person7@example.com', 'LinkedIn7', 'Headshot7', 'Discord7', 'Bio7', '2023-01-07'),
    (8, 'Ella', 'Person 8', 'ella.person8@example.com', 'LinkedIn8', 'Headshot8', 'Discord8', 'Bio8', '2023-01-08'),
    (9, 'Frank', 'Person 9', 'frank.person9@example.com', 'LinkedIn9', 'Headshot9', 'Discord9', 'Bio9', '2023-01-09'),
    (10, 'Grace', 'Person 10', 'grace.person10@example.com', 'LinkedIn10', 'Headshot10', 'Discord10', 'Bio10', '2023-01-10');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT NOT NULL,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (skills_id) REFERENCES skills(id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
 -- Person 1 has skills 1, 3, 6
INSERT INTO peopleskills (skills_id, people_id, date_acquired)
VALUES (1, 1, '2023-01-15'),
       (3, 1, '2023-02-20'),
       (6, 1, '2023-03-25');

-- Person 2 has skills 3, 4, 5
INSERT INTO peopleskills (skills_id, people_id, date_acquired)
VALUES (3, 2, '2023-01-10'),
       (4, 2, '2023-02-15'),
       (5, 2, '2023-03-20');

-- Person 3 has skills 1, 5
INSERT INTO peopleskills (skills_id, people_id, date_acquired)
VALUES (1, 3, '2023-01-05'),
       (5, 3, '2023-02-10');

-- Person 4 has no skills (no INSERT needed).

-- Person 5 has skills 3, 6
INSERT INTO peopleskills (skills_id, people_id, date_acquired)
VALUES (3, 5, '2023-01-15'),
       (6, 5, '2023-02-20');

-- Person 6 has skills 2, 3, 4
INSERT INTO peopleskills (skills_id, people_id, date_acquired)
VALUES (2, 6, '2023-01-10'),
       (3, 6, '2023-02-15'),
       (4, 6, '2023-03-20');

-- Person 7 has skills 3, 5, 6
INSERT INTO peopleskills (skills_id, people_id, date_acquired)
VALUES (3, 7, '2023-01-05'),
       (5, 7, '2023-02-10'),
       (6, 7, '2023-03-15');

-- Person 8 has skills 1, 3, 5, 6
INSERT INTO peopleskills (skills_id, people_id, date_acquired)
VALUES (1, 8, '2023-01-10'),
       (3, 8, '2023-02-15'),
       (5, 8, '2023-03-20'),
       (6, 8, '2023-04-25');

-- Person 9 has skills 2, 5, 6
INSERT INTO peopleskills (skills_id, people_id, date_acquired)
VALUES (2, 9, '2023-01-05'),
       (5, 9, '2023-02-10'),
       (6, 9, '2023-03-15');

-- Person 10 has skills 1, 4, 5
INSERT INTO peopleskills (skills_id, people_id, date_acquired)
VALUES (1, 10, '2023-01-10'),
       (4, 10, '2023-02-15'),
       (5, 10, '2023-03-20');


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    sort_priority INT
);



# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (name, sort_priority) VALUES
    ('Designer', 10),
    ('Developer', 20),
    ('Recruit', 30),
    ('Team Lead', 40),
    ('Boss', 50),
    ('Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE people_roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL
);
# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO people_roles (people_id, role_id)
VALUES
    (1, 2), -- Person 1 (Developer)
    (2, 5), (2, 6), -- Person 2 (Boss, Mentor)
    (3, 2), (3, 4), -- Person 3 (Developer, Team Lead)
    (4, 3), -- Person 4 (Recruit)
    (5, 3), -- Person 5 (Recruit)
    (6, 2), (6, 1), -- Person 6 (Developer, Designer)
    (7, 1), -- Person 7 (Designer)
    (8, 1), (8, 4), -- Person 8 (Designer, Team Lead)
    (9, 2), -- Person 9 (Developer)
    (10, 2), (10, 1); -- Person 10 (Developer, Designer)
