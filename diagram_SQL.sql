CREATE TABLE contact_person (
 id INT NOT NULL,
 full_name VARCHAR(50),
 adress VARCHAR(500),
 person_number VARCHAR(12)
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (id);


CREATE TABLE contact_phone (
 phone_number VARCHAR(50) NOT NULL,
 contact_id INT NOT NULL
);

ALTER TABLE contact_phone ADD CONSTRAINT PK_contact_phone PRIMARY KEY (phone_number,contact_id);


CREATE TABLE email (
 id INT NOT NULL,
 email VARCHAR(50) NOT NULL
);

ALTER TABLE email ADD CONSTRAINT PK_email PRIMARY KEY (id);


CREATE TABLE instructor (
 id INT NOT NULL,
 full_Name VARCHAR(500),
 person_number VARCHAR(12),
 emplyment_ID   VARCHAR(500),
 adress VARCHAR(500)
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE instructor_email (
 instructor_id INT NOT NULL,
 email VARCHAR(50) NOT NULL
);

ALTER TABLE instructor_email ADD CONSTRAINT PK_instructor_email PRIMARY KEY (instructor_id,email);


CREATE TABLE instructor_phone (
 phone_number VARCHAR(50) NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instructor_phone ADD CONSTRAINT PK_instructor_phone PRIMARY KEY (phone_number,instructor_id);


CREATE TABLE instrument_type_teaches (
 instrument_type_teaches VARCHAR(500) NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instrument_type_teaches ADD CONSTRAINT PK_instrument_type_teaches PRIMARY KEY (instrument_type_teaches,instructor_id);


CREATE TABLE phone (
 id INT NOT NULL,
 phone_number VARCHAR(50) NOT NULL
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (id);


CREATE TABLE pricecatorgy (
 id INT NOT NULL,
 lesson_typ_price VARCHAR(500),
 sibling_discount VARCHAR(50),
 InstructorSalary VARCHAR(500)
);

ALTER TABLE pricecatorgy ADD CONSTRAINT PK_pricecatorgy PRIMARY KEY (id);


CREATE TABLE student (
 id INT NOT NULL,
 fullName  NOT NULL VARCHAR(500),
 personNumber   NOT NULL VARCHAR(12),
 level VARCHAR(50),
 Adress VARCHAR(500)
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE student_email (
 student_id INT NOT NULL,
 email_id INT NOT NULL
);

ALTER TABLE student_email ADD CONSTRAINT PK_student_email PRIMARY KEY (student_id,email_id);


CREATE TABLE student_phone (
 student_id INT NOT NULL,
 phone_id INT NOT NULL
);

ALTER TABLE student_phone ADD CONSTRAINT PK_student_phone PRIMARY KEY (student_id,phone_id);


CREATE TABLE student_relates (
 contact_person_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE student_relates ADD CONSTRAINT PK_student_relates PRIMARY KEY (contact_person_id,student_id);


CREATE TABLE contact_email (
 contact_id INT NOT NULL,
 email VARCHAR(50) NOT NULL
);

ALTER TABLE contact_email ADD CONSTRAINT PK_contact_email PRIMARY KEY (contact_id,email);


CREATE TABLE instrument (
 id INT NOT NULL,
 type  NOT NULL VARCHAR(50),
 availability VARCHAR(50),
 place VARCHAR(500),
 rental_time VARCHAR(50),
 student_id INT NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (id);


CREATE TABLE instrument_takes (
 instrument_uses VARCHAR(50) NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE instrument_takes ADD CONSTRAINT PK_instrument_takes PRIMARY KEY (instrument_uses,student_id);


CREATE TABLE lesson (
 id INT NOT NULL,
 maxNumberOfStudent VARCHAR(500),
 minNumberOfStudent VARCHAR(500),
 genre  NOT NULL VARCHAR(50),
 level VARCHAR(500),
 lesson_typ VARCHAR(500),
 time TIME(10),
 pricecatorgy_id INT NOT NULL,
 instrument_id INT NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);


CREATE TABLE lesson_teaches (
 lesson_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE lesson_teaches ADD CONSTRAINT PK_lesson_teaches PRIMARY KEY (lesson_id,instructor_id);


CREATE TABLE sibling (
 number_of_sibling VARCHAR(50) NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (number_of_sibling,student_id);


CREATE TABLE classroom (
 id INT NOT NULL,
 adress VARCHAR(50),
 lesson_id INT NOT NULL,
 schedual_time VARCHAR(50)
);

ALTER TABLE classroom ADD CONSTRAINT PK_classroom PRIMARY KEY (id);


ALTER TABLE contact_phone ADD CONSTRAINT FK_contact_phone_0 FOREIGN KEY (contact_id) REFERENCES contact_person (id);


ALTER TABLE instructor_email ADD CONSTRAINT FK_instructor_email_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE instructor_phone ADD CONSTRAINT FK_instructor_phone_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE instrument_type_teaches ADD CONSTRAINT FK_instrument_type_teaches_0 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE student_email ADD CONSTRAINT FK_student_email_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_email ADD CONSTRAINT FK_student_email_1 FOREIGN KEY (email_id) REFERENCES email (id);


ALTER TABLE student_phone ADD CONSTRAINT FK_student_phone_0 FOREIGN KEY (student_id) REFERENCES student (id);
ALTER TABLE student_phone ADD CONSTRAINT FK_student_phone_1 FOREIGN KEY (phone_id) REFERENCES phone (id);


ALTER TABLE student_relates ADD CONSTRAINT FK_student_relates_0 FOREIGN KEY (contact_person_id) REFERENCES contact_person (id);
ALTER TABLE student_relates ADD CONSTRAINT FK_student_relates_1 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE contact_email ADD CONSTRAINT FK_contact_email_0 FOREIGN KEY (contact_id) REFERENCES contact_person (id);


ALTER TABLE instrument ADD CONSTRAINT FK_instrument_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE instrument_takes ADD CONSTRAINT FK_instrument_takes_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (pricecatorgy_id) REFERENCES pricecatorgy (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (instrument_id) REFERENCES instrument (id);


ALTER TABLE lesson_teaches ADD CONSTRAINT FK_lesson_teaches_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);
ALTER TABLE lesson_teaches ADD CONSTRAINT FK_lesson_teaches_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE classroom ADD CONSTRAINT FK_classroom_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


