/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 16.1 		*/
/*  Created On : 04-led-2024 14:04:54 				*/
/*  DBMS       : PostgreSQL 						*/
/* ---------------------------------------------------- */

/* Drop Sequences for Autonumber Columns */

DROP SEQUENCE IF EXISTS taskstep_taskstepid_seq
;

/* Drop Tables */

DROP TABLE IF EXISTS "Taskstep" CASCADE
;

/* Create Tables */

CREATE TABLE "Taskstep"
(
	"Consume" varchar(100) NULL,
	"Location" varchar(100) NULL,
	"Progress" smallint NULL,
	"TaskstepID" integer NOT NULL   DEFAULT NEXTVAL(('"taskstep_taskstepid_seq"'::text)::regclass),
	"StepsID" integer NOT NULL,
	"TaskID" integer NOT NULL,
	"UserID" integer NULL
)
;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE "Taskstep" ADD CONSTRAINT "PK_Taskstep"
	PRIMARY KEY ("TaskstepID")
;

/* Create Foreign Key Constraints */

ALTER TABLE "Taskstep" ADD CONSTRAINT "FK_Taskstep_Steps"
	FOREIGN KEY ("StepsID") REFERENCES "Steps" ("StepsID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Taskstep" ADD CONSTRAINT "FK_Taskstep_Task"
	FOREIGN KEY ("TaskID") REFERENCES "Task" ("TaskID") ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE "Taskstep" ADD CONSTRAINT "FK_Taskstep_User"
	FOREIGN KEY ("UserID") REFERENCES "User" ("UserID") ON DELETE No Action ON UPDATE No Action
;

/* Create Table Comments, Sequences for Autonumber Columns */

CREATE SEQUENCE taskstep_taskstepid_seq INCREMENT 1 START 1
;