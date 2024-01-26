-- Table: public.Employees_Table

-- DROP TABLE IF EXISTS public."Employees_Table";

CREATE TABLE IF NOT EXISTS public."Employees_Table"
(
    dept_no character varying(4) COLLATE pg_catalog."default" NOT NULL,
    dept_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    emp_no integer NOT NULL,
    emp_title_id character varying(255) COLLATE pg_catalog."default",
    birth_date date,
    first_name character varying(50) COLLATE pg_catalog."default",
    last_name character varying(50) COLLATE pg_catalog."default",
    sex character(1) COLLATE pg_catalog."default",
    hire_date date,
    salary integer,
    title_id character varying(255) COLLATE pg_catalog."default" NOT NULL,
    title character(1) COLLATE pg_catalog."default",
    CONSTRAINT "Foreign Key" PRIMARY KEY (dept_no, emp_no, dept_name, title_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Employees_Table"
    OWNER to postgres;