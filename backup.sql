--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: assessment_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.assessment_status_enum AS ENUM (
    'ACTIVE',
    'INACTIVE'
);


ALTER TYPE public.assessment_status_enum OWNER TO postgres;

--
-- Name: question-group_level_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."question-group_level_enum" AS ENUM (
    'HIGH',
    'MEDIUM',
    'LOW'
);


ALTER TYPE public."question-group_level_enum" OWNER TO postgres;

--
-- Name: question-group_status_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."question-group_status_enum" AS ENUM (
    'ACTIVE',
    'INACTIVE'
);


ALTER TYPE public."question-group_status_enum" OWNER TO postgres;

--
-- Name: question-group_type_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."question-group_type_enum" AS ENUM (
    'GENERAL',
    'GRADE'
);


ALTER TYPE public."question-group_type_enum" OWNER TO postgres;

--
-- Name: question_language_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.question_language_enum AS ENUM (
    'HINDI',
    'ENGLISH'
);


ALTER TYPE public.question_language_enum OWNER TO postgres;

--
-- Name: user_usertype_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.user_usertype_enum AS ENUM (
    'SUPER-ADMIN',
    'ADMIN',
    'BUSINESS',
    'SUB_BUSINESS',
    'TEACHER',
    'STUDENT'
);


ALTER TYPE public.user_usertype_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activity-log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."activity-log" (
    "logId" integer NOT NULL,
    "timeReceived" timestamp with time zone NOT NULL,
    "userId" integer NOT NULL,
    action character varying NOT NULL,
    description character varying NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."activity-log" OWNER TO postgres;

--
-- Name: activity-log_logId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."activity-log_logId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."activity-log_logId_seq" OWNER TO postgres;

--
-- Name: activity-log_logId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."activity-log_logId_seq" OWNED BY public."activity-log"."logId";


--
-- Name: assessment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assessment (
    "assessmentId" integer NOT NULL,
    name character varying NOT NULL,
    status public.assessment_status_enum DEFAULT 'ACTIVE'::public.assessment_status_enum NOT NULL,
    instruction character varying NOT NULL,
    duration integer NOT NULL,
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public.assessment OWNER TO postgres;

--
-- Name: assessmentAnswer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."assessmentAnswer" (
    "assessmentAnswerId" integer NOT NULL,
    "attendAssessmentId" integer NOT NULL,
    "questionId" integer NOT NULL,
    answer integer,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."assessmentAnswer" OWNER TO postgres;

--
-- Name: assessmentAnswerGeneral; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."assessmentAnswerGeneral" (
    "assessmentAnswerId" integer NOT NULL,
    "attendAssessmentId" integer NOT NULL,
    "questionId" integer NOT NULL,
    answer integer,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."assessmentAnswerGeneral" OWNER TO postgres;

--
-- Name: assessmentAnswerGeneral_assessmentAnswerId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."assessmentAnswerGeneral_assessmentAnswerId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."assessmentAnswerGeneral_assessmentAnswerId_seq" OWNER TO postgres;

--
-- Name: assessmentAnswerGeneral_assessmentAnswerId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."assessmentAnswerGeneral_assessmentAnswerId_seq" OWNED BY public."assessmentAnswerGeneral"."assessmentAnswerId";


--
-- Name: assessmentAnswer_assessmentAnswerId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."assessmentAnswer_assessmentAnswerId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."assessmentAnswer_assessmentAnswerId_seq" OWNER TO postgres;

--
-- Name: assessmentAnswer_assessmentAnswerId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."assessmentAnswer_assessmentAnswerId_seq" OWNED BY public."assessmentAnswer"."assessmentAnswerId";


--
-- Name: assessmentGeneralCategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."assessmentGeneralCategory" (
    "assesmentGeneralCategoryId" integer NOT NULL,
    "assessmentId" integer NOT NULL,
    "generalCategoryId" integer NOT NULL,
    "questionCount" integer NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."assessmentGeneralCategory" OWNER TO postgres;

--
-- Name: assessmentGeneralCategory_assesmentGeneralCategoryId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."assessmentGeneralCategory_assesmentGeneralCategoryId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."assessmentGeneralCategory_assesmentGeneralCategoryId_seq" OWNER TO postgres;

--
-- Name: assessmentGeneralCategory_assesmentGeneralCategoryId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."assessmentGeneralCategory_assesmentGeneralCategoryId_seq" OWNED BY public."assessmentGeneralCategory"."assesmentGeneralCategoryId";


--
-- Name: assessmentGradeSubject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."assessmentGradeSubject" (
    "assessmentGradeSubjectId" integer NOT NULL,
    "assessmentId" integer NOT NULL,
    "gradeId" integer NOT NULL,
    "subjectId" integer NOT NULL,
    "questionCount" integer NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."assessmentGradeSubject" OWNER TO postgres;

--
-- Name: assessmentGradeSubject_assessmentGradeSubjectId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."assessmentGradeSubject_assessmentGradeSubjectId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."assessmentGradeSubject_assessmentGradeSubjectId_seq" OWNER TO postgres;

--
-- Name: assessmentGradeSubject_assessmentGradeSubjectId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."assessmentGradeSubject_assessmentGradeSubjectId_seq" OWNED BY public."assessmentGradeSubject"."assessmentGradeSubjectId";


--
-- Name: assessment_assessmentId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."assessment_assessmentId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."assessment_assessmentId_seq" OWNER TO postgres;

--
-- Name: assessment_assessmentId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."assessment_assessmentId_seq" OWNED BY public.assessment."assessmentId";


--
-- Name: attendAssessment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."attendAssessment" (
    "attendAssessmentId" integer NOT NULL,
    "teacherId" integer NOT NULL,
    "assessmentId" integer NOT NULL,
    attended boolean DEFAULT true NOT NULL,
    "startTime" time without time zone NOT NULL,
    "endTime" time without time zone,
    "markScored" integer,
    status character varying,
    "totalAssessmentMark" integer,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."attendAssessment" OWNER TO postgres;

--
-- Name: attendAssessment-general; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."attendAssessment-general" (
    "attendAssessmentId" integer NOT NULL,
    "userId" integer NOT NULL,
    "assessmentId" integer NOT NULL,
    attended boolean DEFAULT true NOT NULL,
    "startTime" time without time zone NOT NULL,
    "endTime" time without time zone,
    "markScored" integer,
    status character varying,
    "totalAssessmentMark" integer,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."attendAssessment-general" OWNER TO postgres;

--
-- Name: attendAssessment-general_attendAssessmentId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."attendAssessment-general_attendAssessmentId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."attendAssessment-general_attendAssessmentId_seq" OWNER TO postgres;

--
-- Name: attendAssessment-general_attendAssessmentId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."attendAssessment-general_attendAssessmentId_seq" OWNED BY public."attendAssessment-general"."attendAssessmentId";


--
-- Name: attendAssessment_attendAssessmentId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."attendAssessment_attendAssessmentId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."attendAssessment_attendAssessmentId_seq" OWNER TO postgres;

--
-- Name: attendAssessment_attendAssessmentId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."attendAssessment_attendAssessmentId_seq" OWNED BY public."attendAssessment"."attendAssessmentId";


--
-- Name: business; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.business (
    "businessId" integer NOT NULL,
    name character varying NOT NULL,
    "businessAdminName" character varying NOT NULL,
    "businessTypeId" integer NOT NULL,
    description character varying NOT NULL,
    address character varying NOT NULL,
    state character varying NOT NULL,
    district character varying NOT NULL,
    city character varying NOT NULL,
    pincode character varying NOT NULL,
    "userId" integer NOT NULL,
    email character varying NOT NULL,
    contact character varying NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public.business OWNER TO postgres;

--
-- Name: business-admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."business-admin" (
    "subBusinessId" integer NOT NULL,
    "businessId" integer NOT NULL,
    name character varying NOT NULL,
    department character varying NOT NULL,
    address character varying NOT NULL,
    state character varying NOT NULL,
    district character varying NOT NULL,
    city character varying NOT NULL,
    pincode character varying NOT NULL,
    "userId" integer NOT NULL,
    email character varying NOT NULL,
    contact character varying NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."business-admin" OWNER TO postgres;

--
-- Name: business-admin_subBusinessId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."business-admin_subBusinessId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."business-admin_subBusinessId_seq" OWNER TO postgres;

--
-- Name: business-admin_subBusinessId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."business-admin_subBusinessId_seq" OWNED BY public."business-admin"."subBusinessId";


--
-- Name: business-type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."business-type" (
    "businessTypeId" integer NOT NULL,
    caption character varying NOT NULL,
    is_delete boolean DEFAULT false NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."business-type" OWNER TO postgres;

--
-- Name: business-type_businessTypeId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."business-type_businessTypeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."business-type_businessTypeId_seq" OWNER TO postgres;

--
-- Name: business-type_businessTypeId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."business-type_businessTypeId_seq" OWNED BY public."business-type"."businessTypeId";


--
-- Name: business_businessId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."business_businessId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."business_businessId_seq" OWNER TO postgres;

--
-- Name: business_businessId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."business_businessId_seq" OWNED BY public.business."businessId";


--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    "cityId" integer NOT NULL,
    name character varying NOT NULL,
    "districtId" integer NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_cityId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."city_cityId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."city_cityId_seq" OWNER TO postgres;

--
-- Name: city_cityId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."city_cityId_seq" OWNED BY public.city."cityId";


--
-- Name: district; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.district (
    "districtId" integer NOT NULL,
    name character varying NOT NULL,
    "stateId" integer NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public.district OWNER TO postgres;

--
-- Name: district_districtId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."district_districtId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."district_districtId_seq" OWNER TO postgres;

--
-- Name: district_districtId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."district_districtId_seq" OWNED BY public.district."districtId";


--
-- Name: generalCategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."generalCategory" (
    "generalCategoryId" integer NOT NULL,
    caption character varying NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."generalCategory" OWNER TO postgres;

--
-- Name: generalCategory_generalCategoryId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."generalCategory_generalCategoryId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."generalCategory_generalCategoryId_seq" OWNER TO postgres;

--
-- Name: generalCategory_generalCategoryId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."generalCategory_generalCategoryId_seq" OWNED BY public."generalCategory"."generalCategoryId";


--
-- Name: grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade (
    "gradeId" integer NOT NULL,
    caption character varying NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public.grade OWNER TO postgres;

--
-- Name: grade_gradeId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."grade_gradeId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."grade_gradeId_seq" OWNER TO postgres;

--
-- Name: grade_gradeId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."grade_gradeId_seq" OWNED BY public.grade."gradeId";


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: option; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.option (
    "optionId" integer NOT NULL,
    "questionId" integer NOT NULL,
    "isCorrect" boolean DEFAULT false NOT NULL,
    option character varying NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public.option OWNER TO postgres;

--
-- Name: option_optionId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."option_optionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."option_optionId_seq" OWNER TO postgres;

--
-- Name: option_optionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."option_optionId_seq" OWNED BY public.option."optionId";


--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question (
    "questionId" integer NOT NULL,
    "questionGroupId" integer NOT NULL,
    language public.question_language_enum NOT NULL,
    question character varying NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: question-group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."question-group" (
    "questionGroupId" integer NOT NULL,
    type public."question-group_type_enum" NOT NULL,
    "subjectId" integer,
    "gradeId" integer,
    "generalCategoryId" integer,
    level public."question-group_level_enum" NOT NULL,
    mark integer NOT NULL,
    status public."question-group_status_enum" DEFAULT 'ACTIVE'::public."question-group_status_enum" NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."question-group" OWNER TO postgres;

--
-- Name: question-group_questionGroupId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."question-group_questionGroupId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."question-group_questionGroupId_seq" OWNER TO postgres;

--
-- Name: question-group_questionGroupId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."question-group_questionGroupId_seq" OWNED BY public."question-group"."questionGroupId";


--
-- Name: question_questionId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."question_questionId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."question_questionId_seq" OWNER TO postgres;

--
-- Name: question_questionId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."question_questionId_seq" OWNED BY public.question."questionId";


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    "roleId" integer NOT NULL,
    caption character varying NOT NULL,
    type character varying NOT NULL,
    permissions text,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: role_roleId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."role_roleId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."role_roleId_seq" OWNER TO postgres;

--
-- Name: role_roleId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."role_roleId_seq" OWNED BY public.role."roleId";


--
-- Name: state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.state (
    "stateId" integer NOT NULL,
    name character varying NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public.state OWNER TO postgres;

--
-- Name: state_stateId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."state_stateId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."state_stateId_seq" OWNER TO postgres;

--
-- Name: state_stateId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."state_stateId_seq" OWNED BY public.state."stateId";


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    "studentId" integer NOT NULL,
    name character varying NOT NULL,
    college character varying,
    course character varying,
    address character varying,
    state character varying,
    district character varying,
    city character varying,
    pincode character varying,
    "userId" integer NOT NULL,
    email character varying NOT NULL,
    contact character varying NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: student_studentId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."student_studentId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."student_studentId_seq" OWNER TO postgres;

--
-- Name: student_studentId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."student_studentId_seq" OWNED BY public.student."studentId";


--
-- Name: sub-admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."sub-admin" (
    "subAdminId" integer NOT NULL,
    name character varying NOT NULL,
    department character varying NOT NULL,
    address character varying NOT NULL,
    state character varying NOT NULL,
    district character varying NOT NULL,
    city character varying NOT NULL,
    pincode character varying NOT NULL,
    "userId" integer NOT NULL,
    email character varying NOT NULL,
    contact character varying NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."sub-admin" OWNER TO postgres;

--
-- Name: sub-admin_subAdminId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."sub-admin_subAdminId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."sub-admin_subAdminId_seq" OWNER TO postgres;

--
-- Name: sub-admin_subAdminId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."sub-admin_subAdminId_seq" OWNED BY public."sub-admin"."subAdminId";


--
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    "subjectId" integer NOT NULL,
    caption character varying NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- Name: subject_subjectId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."subject_subjectId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."subject_subjectId_seq" OWNER TO postgres;

--
-- Name: subject_subjectId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."subject_subjectId_seq" OWNED BY public.subject."subjectId";


--
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tag (
    "tagId" integer NOT NULL,
    caption character varying NOT NULL,
    "tagGRoupId" integer NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- Name: tagGroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."tagGroup" (
    "tagGroupId" integer NOT NULL,
    caption character varying NOT NULL,
    is_delete boolean DEFAULT false NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."tagGroup" OWNER TO postgres;

--
-- Name: tagGroup_tagGroupId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tagGroup_tagGroupId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."tagGroup_tagGroupId_seq" OWNER TO postgres;

--
-- Name: tagGroup_tagGroupId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tagGroup_tagGroupId_seq" OWNED BY public."tagGroup"."tagGroupId";


--
-- Name: tag_tagId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."tag_tagId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."tag_tagId_seq" OWNER TO postgres;

--
-- Name: tag_tagId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."tag_tagId_seq" OWNED BY public.tag."tagId";


--
-- Name: teacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher (
    "teacherId" integer NOT NULL,
    "businessId" integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    "schoolName" character varying,
    contact character varying NOT NULL,
    address character varying,
    state character varying,
    district character varying,
    city character varying,
    pincode character varying,
    experience integer,
    "profileImage" character varying,
    "userId" integer NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public.teacher OWNER TO postgres;

--
-- Name: teacher-subject-grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."teacher-subject-grade" (
    "gradeSubjectId" integer NOT NULL,
    "gradeId" integer NOT NULL,
    "subjectId" integer NOT NULL,
    "teacherId" integer NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."teacher-subject-grade" OWNER TO postgres;

--
-- Name: teacher-subject-grade_gradeSubjectId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."teacher-subject-grade_gradeSubjectId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."teacher-subject-grade_gradeSubjectId_seq" OWNER TO postgres;

--
-- Name: teacher-subject-grade_gradeSubjectId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."teacher-subject-grade_gradeSubjectId_seq" OWNED BY public."teacher-subject-grade"."gradeSubjectId";


--
-- Name: teacher-tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."teacher-tag" (
    "teacherTagId" integer NOT NULL,
    "teacherId" integer NOT NULL,
    "tagGroup" jsonb NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."teacher-tag" OWNER TO postgres;

--
-- Name: teacher-tag_teacherTagId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."teacher-tag_teacherTagId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."teacher-tag_teacherTagId_seq" OWNER TO postgres;

--
-- Name: teacher-tag_teacherTagId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."teacher-tag_teacherTagId_seq" OWNED BY public."teacher-tag"."teacherTagId";


--
-- Name: teacher_teacherId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."teacher_teacherId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."teacher_teacherId_seq" OWNER TO postgres;

--
-- Name: teacher_teacherId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."teacher_teacherId_seq" OWNED BY public.teacher."teacherId";


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    "userId" integer NOT NULL,
    username character varying NOT NULL,
    password character varying,
    "userType" public.user_usertype_enum NOT NULL,
    "roleId" integer,
    permissions text,
    is_delete boolean DEFAULT false NOT NULL,
    "createdOn" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedOn" timestamp without time zone DEFAULT now() NOT NULL,
    "deletedOn" timestamp without time zone
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_userId_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."user_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."user_userId_seq" OWNER TO postgres;

--
-- Name: user_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."user_userId_seq" OWNED BY public."user"."userId";


--
-- Name: activity-log logId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."activity-log" ALTER COLUMN "logId" SET DEFAULT nextval('public."activity-log_logId_seq"'::regclass);


--
-- Name: assessment assessmentId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessment ALTER COLUMN "assessmentId" SET DEFAULT nextval('public."assessment_assessmentId_seq"'::regclass);


--
-- Name: assessmentAnswer assessmentAnswerId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentAnswer" ALTER COLUMN "assessmentAnswerId" SET DEFAULT nextval('public."assessmentAnswer_assessmentAnswerId_seq"'::regclass);


--
-- Name: assessmentAnswerGeneral assessmentAnswerId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentAnswerGeneral" ALTER COLUMN "assessmentAnswerId" SET DEFAULT nextval('public."assessmentAnswerGeneral_assessmentAnswerId_seq"'::regclass);


--
-- Name: assessmentGeneralCategory assesmentGeneralCategoryId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentGeneralCategory" ALTER COLUMN "assesmentGeneralCategoryId" SET DEFAULT nextval('public."assessmentGeneralCategory_assesmentGeneralCategoryId_seq"'::regclass);


--
-- Name: assessmentGradeSubject assessmentGradeSubjectId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentGradeSubject" ALTER COLUMN "assessmentGradeSubjectId" SET DEFAULT nextval('public."assessmentGradeSubject_assessmentGradeSubjectId_seq"'::regclass);


--
-- Name: attendAssessment attendAssessmentId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."attendAssessment" ALTER COLUMN "attendAssessmentId" SET DEFAULT nextval('public."attendAssessment_attendAssessmentId_seq"'::regclass);


--
-- Name: attendAssessment-general attendAssessmentId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."attendAssessment-general" ALTER COLUMN "attendAssessmentId" SET DEFAULT nextval('public."attendAssessment-general_attendAssessmentId_seq"'::regclass);


--
-- Name: business businessId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business ALTER COLUMN "businessId" SET DEFAULT nextval('public."business_businessId_seq"'::regclass);


--
-- Name: business-admin subBusinessId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."business-admin" ALTER COLUMN "subBusinessId" SET DEFAULT nextval('public."business-admin_subBusinessId_seq"'::regclass);


--
-- Name: business-type businessTypeId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."business-type" ALTER COLUMN "businessTypeId" SET DEFAULT nextval('public."business-type_businessTypeId_seq"'::regclass);


--
-- Name: city cityId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN "cityId" SET DEFAULT nextval('public."city_cityId_seq"'::regclass);


--
-- Name: district districtId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district ALTER COLUMN "districtId" SET DEFAULT nextval('public."district_districtId_seq"'::regclass);


--
-- Name: generalCategory generalCategoryId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."generalCategory" ALTER COLUMN "generalCategoryId" SET DEFAULT nextval('public."generalCategory_generalCategoryId_seq"'::regclass);


--
-- Name: grade gradeId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade ALTER COLUMN "gradeId" SET DEFAULT nextval('public."grade_gradeId_seq"'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: option optionId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option ALTER COLUMN "optionId" SET DEFAULT nextval('public."option_optionId_seq"'::regclass);


--
-- Name: question questionId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question ALTER COLUMN "questionId" SET DEFAULT nextval('public."question_questionId_seq"'::regclass);


--
-- Name: question-group questionGroupId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."question-group" ALTER COLUMN "questionGroupId" SET DEFAULT nextval('public."question-group_questionGroupId_seq"'::regclass);


--
-- Name: role roleId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role ALTER COLUMN "roleId" SET DEFAULT nextval('public."role_roleId_seq"'::regclass);


--
-- Name: state stateId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state ALTER COLUMN "stateId" SET DEFAULT nextval('public."state_stateId_seq"'::regclass);


--
-- Name: student studentId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN "studentId" SET DEFAULT nextval('public."student_studentId_seq"'::regclass);


--
-- Name: sub-admin subAdminId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."sub-admin" ALTER COLUMN "subAdminId" SET DEFAULT nextval('public."sub-admin_subAdminId_seq"'::regclass);


--
-- Name: subject subjectId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject ALTER COLUMN "subjectId" SET DEFAULT nextval('public."subject_subjectId_seq"'::regclass);


--
-- Name: tag tagId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag ALTER COLUMN "tagId" SET DEFAULT nextval('public."tag_tagId_seq"'::regclass);


--
-- Name: tagGroup tagGroupId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tagGroup" ALTER COLUMN "tagGroupId" SET DEFAULT nextval('public."tagGroup_tagGroupId_seq"'::regclass);


--
-- Name: teacher teacherId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher ALTER COLUMN "teacherId" SET DEFAULT nextval('public."teacher_teacherId_seq"'::regclass);


--
-- Name: teacher-subject-grade gradeSubjectId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teacher-subject-grade" ALTER COLUMN "gradeSubjectId" SET DEFAULT nextval('public."teacher-subject-grade_gradeSubjectId_seq"'::regclass);


--
-- Name: teacher-tag teacherTagId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teacher-tag" ALTER COLUMN "teacherTagId" SET DEFAULT nextval('public."teacher-tag_teacherTagId_seq"'::regclass);


--
-- Name: user userId; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN "userId" SET DEFAULT nextval('public."user_userId_seq"'::regclass);


--
-- Data for Name: activity-log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."activity-log" ("logId", "timeReceived", "userId", action, description, "createdOn", "updatedOn", "deletedOn") FROM stdin;
1	2024-07-28 03:14:52.983+00	2	Login	Login Successful	2024-07-28 03:14:52.98571	2024-07-28 03:14:52.98571	\N
2	2024-07-28 03:51:38.323+00	25	Login	Login Successful	2024-07-28 03:51:38.326789	2024-07-28 03:51:38.326789	\N
3	2024-07-28 04:03:12.788+00	40	Login	Login Successful	2024-07-28 04:03:12.789362	2024-07-28 04:03:12.789362	\N
4	2024-07-28 04:05:50.057+00	2	Login	Login Successful	2024-07-28 04:05:50.058196	2024-07-28 04:05:50.058196	\N
5	2024-07-28 04:06:49.612+00	2	Logout	Logout Successful	2024-07-28 04:06:49.613115	2024-07-28 04:06:49.613115	\N
6	2024-07-28 04:19:44.104+00	2	Login	Login Successful	2024-07-28 04:19:44.105363	2024-07-28 04:19:44.105363	\N
7	2024-07-28 04:28:31.974+00	2	Login	Login Successful	2024-07-28 04:28:31.977323	2024-07-28 04:28:31.977323	\N
8	2024-07-28 04:45:11.607+00	44	Login	Login Successful	2024-07-28 04:45:11.608779	2024-07-28 04:45:11.608779	\N
9	2024-07-28 04:47:17.751+00	2	Login	Login Successful	2024-07-28 04:47:17.75198	2024-07-28 04:47:17.75198	\N
10	2024-07-28 04:50:45.545+00	30	Login	Login Successful	2024-07-28 04:50:45.547548	2024-07-28 04:50:45.547548	\N
11	2024-07-28 04:59:27.606+00	2	Logout	Logout Successful	2024-07-28 04:59:27.610028	2024-07-28 04:59:27.610028	\N
12	2024-07-28 05:04:45.547+00	36	Login	Login Successful	2024-07-28 05:04:45.551104	2024-07-28 05:04:45.551104	\N
13	2024-07-28 05:08:56.518+00	51	Login	Login Successful	2024-07-28 05:08:56.525321	2024-07-28 05:08:56.525321	\N
14	2024-07-28 05:08:56.571+00	51	Login	Login Successful	2024-07-28 05:08:56.571855	2024-07-28 05:08:56.571855	\N
15	2024-07-28 05:09:00.222+00	2	Login	Login Successful	2024-07-28 05:09:00.223443	2024-07-28 05:09:00.223443	\N
16	2024-07-28 05:10:19.925+00	2	Logout	Logout Successful	2024-07-28 05:10:19.935356	2024-07-28 05:10:19.935356	\N
17	2024-07-28 05:11:06.101+00	36	Login	Login Successful	2024-07-28 05:11:06.105612	2024-07-28 05:11:06.105612	\N
18	2024-07-28 05:11:06.369+00	36	Login	Login Successful	2024-07-28 05:11:06.370412	2024-07-28 05:11:06.370412	\N
19	2024-07-28 05:11:06.471+00	36	Login	Login Successful	2024-07-28 05:11:06.47272	2024-07-28 05:11:06.47272	\N
20	2024-07-28 05:11:06.516+00	36	Login	Login Successful	2024-07-28 05:11:06.517118	2024-07-28 05:11:06.517118	\N
21	2024-07-28 05:11:06.548+00	36	Login	Login Successful	2024-07-28 05:11:06.548922	2024-07-28 05:11:06.548922	\N
22	2024-07-28 05:11:06.663+00	36	Login	Login Successful	2024-07-28 05:11:06.664181	2024-07-28 05:11:06.664181	\N
23	2024-07-28 05:11:07.07+00	36	Login	Login Successful	2024-07-28 05:11:07.071219	2024-07-28 05:11:07.071219	\N
24	2024-07-28 05:11:07.176+00	36	Login	Login Successful	2024-07-28 05:11:07.176951	2024-07-28 05:11:07.176951	\N
25	2024-07-28 05:11:07.297+00	36	Login	Login Successful	2024-07-28 05:11:07.299108	2024-07-28 05:11:07.299108	\N
26	2024-07-28 05:11:07.332+00	36	Login	Login Successful	2024-07-28 05:11:07.33329	2024-07-28 05:11:07.33329	\N
27	2024-07-28 05:11:07.519+00	36	Login	Login Successful	2024-07-28 05:11:07.519812	2024-07-28 05:11:07.519812	\N
28	2024-07-28 05:11:07.581+00	36	Login	Login Successful	2024-07-28 05:11:07.582552	2024-07-28 05:11:07.582552	\N
29	2024-07-28 05:14:11.998+00	23	Login	Login Successful	2024-07-28 05:14:12.026067	2024-07-28 05:14:12.026067	\N
30	2024-07-28 05:15:08.756+00	36	Login	Login Successful	2024-07-28 05:15:08.757539	2024-07-28 05:15:08.757539	\N
31	2024-07-28 05:15:08.806+00	36	Login	Login Successful	2024-07-28 05:15:08.807583	2024-07-28 05:15:08.807583	\N
32	2024-07-28 05:16:08.985+00	2	Login	Login Successful	2024-07-28 05:16:08.985984	2024-07-28 05:16:08.985984	\N
33	2024-07-28 05:16:28.063+00	49	Login	Login Successful	2024-07-28 05:16:28.065352	2024-07-28 05:16:28.065352	\N
34	2024-07-28 05:17:05.437+00	42	Login	Login Successful	2024-07-28 05:17:05.438952	2024-07-28 05:17:05.438952	\N
35	2024-07-28 05:17:09.998+00	30	Login	Login Successful	2024-07-28 05:17:09.999222	2024-07-28 05:17:09.999222	\N
36	2024-07-28 05:17:12.31+00	49	Logout	Logout Successful	2024-07-28 05:17:12.310836	2024-07-28 05:17:12.310836	\N
37	2024-07-28 05:18:23.291+00	2	Logout	Logout Successful	2024-07-28 05:18:23.301592	2024-07-28 05:18:23.301592	\N
38	2024-07-28 05:26:48.705+00	29	Login	Login Successful	2024-07-28 05:26:48.706942	2024-07-28 05:26:48.706942	\N
39	2024-07-28 05:27:21.742+00	29	Logout	Logout Successful	2024-07-28 05:27:21.742804	2024-07-28 05:27:21.742804	\N
40	2024-07-28 05:28:40.844+00	33	Login	Login Successful	2024-07-28 05:28:40.845562	2024-07-28 05:28:40.845562	\N
41	2024-07-28 05:29:07.655+00	27	Login	Login Successful	2024-07-28 05:29:07.655893	2024-07-28 05:29:07.655893	\N
42	2024-07-28 05:29:17.688+00	4	Login	Login Successful	2024-07-28 05:29:17.689296	2024-07-28 05:29:17.689296	\N
43	2024-07-28 05:30:54.642+00	35	Login	Login Successful	2024-07-28 05:30:54.643276	2024-07-28 05:30:54.643276	\N
44	2024-07-28 05:30:55.126+00	8	Login	Login Successful	2024-07-28 05:30:55.127808	2024-07-28 05:30:55.127808	\N
45	2024-07-28 05:31:09.312+00	6	Login	Login Successful	2024-07-28 05:31:09.312579	2024-07-28 05:31:09.312579	\N
46	2024-07-28 05:31:22.295+00	38	Login	Login Successful	2024-07-28 05:31:22.296093	2024-07-28 05:31:22.296093	\N
47	2024-07-28 05:31:29.042+00	9	Login	Login Successful	2024-07-28 05:31:29.044107	2024-07-28 05:31:29.044107	\N
48	2024-07-28 05:32:07.96+00	13	Login	Login Successful	2024-07-28 05:32:07.962835	2024-07-28 05:32:07.962835	\N
49	2024-07-28 05:32:31.708+00	28	Login	Login Successful	2024-07-28 05:32:31.708761	2024-07-28 05:32:31.708761	\N
50	2024-07-28 05:32:49.431+00	52	Login	Login Successful	2024-07-28 05:32:49.432019	2024-07-28 05:32:49.432019	\N
51	2024-07-28 05:32:50.804+00	45	Login	Login Successful	2024-07-28 05:32:50.805534	2024-07-28 05:32:50.805534	\N
52	2024-07-28 05:33:03.287+00	50	Login	Login Successful	2024-07-28 05:33:03.288308	2024-07-28 05:33:03.288308	\N
53	2024-07-28 05:33:03.828+00	49	Login	Login Successful	2024-07-28 05:33:03.829107	2024-07-28 05:33:03.829107	\N
54	2024-07-28 05:33:19.124+00	30	Login	Login Successful	2024-07-28 05:33:19.12553	2024-07-28 05:33:19.12553	\N
55	2024-07-28 05:34:25.555+00	50	Login	Login Successful	2024-07-28 05:34:25.556272	2024-07-28 05:34:25.556272	\N
56	2024-07-28 05:34:26.812+00	37	Login	Login Successful	2024-07-28 05:34:26.812678	2024-07-28 05:34:26.812678	\N
57	2024-07-28 05:36:25.66+00	30	Login	Login Successful	2024-07-28 05:36:25.660837	2024-07-28 05:36:25.660837	\N
58	2024-07-28 05:38:03.62+00	26	Login	Login Successful	2024-07-28 05:38:03.6207	2024-07-28 05:38:03.6207	\N
59	2024-07-28 05:38:17.184+00	43	Login	Login Successful	2024-07-28 05:38:17.185069	2024-07-28 05:38:17.185069	\N
60	2024-07-28 05:38:21.167+00	43	Logout	Logout Successful	2024-07-28 05:38:21.167431	2024-07-28 05:38:21.167431	\N
61	2024-07-28 05:39:23.937+00	36	Login	Login Successful	2024-07-28 05:39:23.937648	2024-07-28 05:39:23.937648	\N
62	2024-07-28 05:40:19.139+00	10	Login	Login Successful	2024-07-28 05:40:19.140479	2024-07-28 05:40:19.140479	\N
63	2024-07-28 05:42:34.549+00	35	Login	Login Successful	2024-07-28 05:42:34.550109	2024-07-28 05:42:34.550109	\N
64	2024-07-28 05:44:16.312+00	36	Login	Login Successful	2024-07-28 05:44:16.31332	2024-07-28 05:44:16.31332	\N
65	2024-07-28 05:44:50.634+00	46	Login	Login Successful	2024-07-28 05:44:50.635283	2024-07-28 05:44:50.635283	\N
66	2024-07-28 05:49:04.701+00	21	Login	Login Successful	2024-07-28 05:49:04.70236	2024-07-28 05:49:04.70236	\N
67	2024-07-28 05:49:39.457+00	5	Login	Login Successful	2024-07-28 05:49:39.458703	2024-07-28 05:49:39.458703	\N
68	2024-07-28 05:50:23.47+00	14	Login	Login Successful	2024-07-28 05:50:23.471586	2024-07-28 05:50:23.471586	\N
69	2024-07-28 05:54:08.019+00	37	Login	Login Successful	2024-07-28 05:54:08.021427	2024-07-28 05:54:08.021427	\N
70	2024-07-28 06:00:16.599+00	49	Login	Login Successful	2024-07-28 06:00:16.600335	2024-07-28 06:00:16.600335	\N
71	2024-07-28 06:02:27.087+00	7	Login	Login Successful	2024-07-28 06:02:27.088778	2024-07-28 06:02:27.088778	\N
72	2024-07-28 06:05:06.16+00	20	Login	Login Successful	2024-07-28 06:05:06.162725	2024-07-28 06:05:06.162725	\N
73	2024-07-28 06:06:08.984+00	30	Login	Login Successful	2024-07-28 06:06:08.984967	2024-07-28 06:06:08.984967	\N
74	2024-07-28 06:22:25.488+00	38	Login	Login Successful	2024-07-28 06:22:25.489142	2024-07-28 06:22:25.489142	\N
75	2024-07-28 06:48:40.172+00	53	Login	Login Successful	2024-07-28 06:48:40.173975	2024-07-28 06:48:40.173975	\N
76	2024-07-28 06:57:13.517+00	27	Login	Login Successful	2024-07-28 06:57:13.521724	2024-07-28 06:57:13.521724	\N
77	2024-07-28 07:03:01.328+00	53	Login	Login Successful	2024-07-28 07:03:01.329406	2024-07-28 07:03:01.329406	\N
78	2024-07-28 07:03:19.397+00	5	Login	Login Successful	2024-07-28 07:03:19.397947	2024-07-28 07:03:19.397947	\N
79	2024-07-28 07:03:35.486+00	5	Logout	Logout Successful	2024-07-28 07:03:35.497128	2024-07-28 07:03:35.497128	\N
80	2024-07-28 07:25:13.155+00	36	Login	Login Successful	2024-07-28 07:25:13.155984	2024-07-28 07:25:13.155984	\N
81	2024-07-28 07:26:29.235+00	37	Login	Login Successful	2024-07-28 07:26:29.235952	2024-07-28 07:26:29.235952	\N
82	2024-07-28 07:34:12.972+00	12	Login	Login Successful	2024-07-28 07:34:12.973552	2024-07-28 07:34:12.973552	\N
83	2024-07-28 07:40:20.103+00	12	Login	Login Successful	2024-07-28 07:40:20.105482	2024-07-28 07:40:20.105482	\N
84	2024-07-28 07:40:59.914+00	12	Logout	Logout Successful	2024-07-28 07:40:59.91472	2024-07-28 07:40:59.91472	\N
85	2024-07-28 07:43:51.88+00	49	Login	Login Successful	2024-07-28 07:43:51.881101	2024-07-28 07:43:51.881101	\N
86	2024-07-28 08:43:44.29+00	3	Login	Login Successful	2024-07-28 08:43:44.291184	2024-07-28 08:43:44.291184	\N
87	2024-07-28 08:44:05.569+00	3	Logout	Logout Successful	2024-07-28 08:44:05.58737	2024-07-28 08:44:05.58737	\N
88	2024-07-28 08:44:44.793+00	5	Login	Login Successful	2024-07-28 08:44:44.793764	2024-07-28 08:44:44.793764	\N
89	2024-07-28 08:45:08.722+00	5	Logout	Logout Successful	2024-07-28 08:45:08.736006	2024-07-28 08:45:08.736006	\N
90	2024-07-28 08:46:00.283+00	10	Login	Login Successful	2024-07-28 08:46:00.28378	2024-07-28 08:46:00.28378	\N
91	2024-07-28 08:46:19.601+00	10	Logout	Logout Successful	2024-07-28 08:46:19.610264	2024-07-28 08:46:19.610264	\N
92	2024-07-28 08:48:47.729+00	12	Login	Login Successful	2024-07-28 08:48:47.729842	2024-07-28 08:48:47.729842	\N
93	2024-07-28 08:49:10.488+00	12	Logout	Logout Successful	2024-07-28 08:49:10.488486	2024-07-28 08:49:10.488486	\N
94	2024-07-28 08:49:58.038+00	16	Login	Login Successful	2024-07-28 08:49:58.039225	2024-07-28 08:49:58.039225	\N
95	2024-07-28 08:50:11.897+00	16	Logout	Logout Successful	2024-07-28 08:50:11.89831	2024-07-28 08:50:11.89831	\N
96	2024-07-28 08:50:47.055+00	25	Login	Login Successful	2024-07-28 08:50:47.055768	2024-07-28 08:50:47.055768	\N
97	2024-07-28 08:51:02.871+00	25	Logout	Logout Successful	2024-07-28 08:51:02.871543	2024-07-28 08:51:02.871543	\N
98	2024-07-28 08:51:37.235+00	29	Login	Login Successful	2024-07-28 08:51:37.235693	2024-07-28 08:51:37.235693	\N
99	2024-07-28 08:51:51.532+00	29	Logout	Logout Successful	2024-07-28 08:51:51.533034	2024-07-28 08:51:51.533034	\N
100	2024-07-28 08:52:19.637+00	43	Login	Login Successful	2024-07-28 08:52:19.638838	2024-07-28 08:52:19.638838	\N
101	2024-07-28 08:52:31.198+00	43	Logout	Logout Successful	2024-07-28 08:52:31.198776	2024-07-28 08:52:31.198776	\N
102	2024-07-28 08:53:26.412+00	31	Login	Login Successful	2024-07-28 08:53:26.413258	2024-07-28 08:53:26.413258	\N
103	2024-07-28 08:53:41.219+00	31	Logout	Logout Successful	2024-07-28 08:53:41.280303	2024-07-28 08:53:41.280303	\N
104	2024-07-28 08:54:23.753+00	32	Login	Login Successful	2024-07-28 08:54:23.753854	2024-07-28 08:54:23.753854	\N
105	2024-07-28 08:54:40.992+00	32	Logout	Logout Successful	2024-07-28 08:54:41.003488	2024-07-28 08:54:41.003488	\N
106	2024-07-28 08:55:17.545+00	34	Login	Login Successful	2024-07-28 08:55:17.545884	2024-07-28 08:55:17.545884	\N
107	2024-07-28 08:55:29.188+00	34	Logout	Logout Successful	2024-07-28 08:55:29.188849	2024-07-28 08:55:29.188849	\N
108	2024-07-28 08:55:58.241+00	39	Login	Login Successful	2024-07-28 08:55:58.241585	2024-07-28 08:55:58.241585	\N
109	2024-07-28 08:56:10.047+00	39	Logout	Logout Successful	2024-07-28 08:56:10.048295	2024-07-28 08:56:10.048295	\N
110	2024-07-28 08:56:33.279+00	41	Login	Login Successful	2024-07-28 08:56:33.279682	2024-07-28 08:56:33.279682	\N
111	2024-07-28 08:56:58.764+00	41	Logout	Logout Successful	2024-07-28 08:56:58.765445	2024-07-28 08:56:58.765445	\N
112	2024-07-28 08:57:45.183+00	47	Login	Login Successful	2024-07-28 08:57:45.18692	2024-07-28 08:57:45.18692	\N
113	2024-07-28 08:58:06.392+00	47	Logout	Logout Successful	2024-07-28 08:58:06.403425	2024-07-28 08:58:06.403425	\N
114	2024-07-28 09:04:21.961+00	48	Login	Login Successful	2024-07-28 09:04:21.962141	2024-07-28 09:04:21.962141	\N
115	2024-07-28 09:05:06.893+00	48	Logout	Logout Successful	2024-07-28 09:05:06.894204	2024-07-28 09:05:06.894204	\N
116	2024-07-28 09:19:25.6+00	50	Login	Login Successful	2024-07-28 09:19:25.601165	2024-07-28 09:19:25.601165	\N
117	2024-07-28 09:19:32.209+00	47	Login	Login Successful	2024-07-28 09:19:32.209683	2024-07-28 09:19:32.209683	\N
118	2024-07-28 09:20:10.877+00	2	Login	Login Successful	2024-07-28 09:20:10.878182	2024-07-28 09:20:10.878182	\N
119	2024-07-28 09:20:21.325+00	2	Logout	Logout Successful	2024-07-28 09:20:21.325853	2024-07-28 09:20:21.325853	\N
120	2024-07-28 09:39:10.65+00	43	Login	Login Successful	2024-07-28 09:39:10.650568	2024-07-28 09:39:10.650568	\N
121	2024-07-28 09:42:45.165+00	3	Login	Login Successful	2024-07-28 09:42:45.16583	2024-07-28 09:42:45.16583	\N
122	2024-07-28 09:42:54.555+00	12	Login	Login Successful	2024-07-28 09:42:54.555865	2024-07-28 09:42:54.555865	\N
123	2024-07-28 09:48:51.221+00	40	Logout	Logout Successful	2024-07-28 09:48:51.222342	2024-07-28 09:48:51.222342	\N
124	2024-07-28 09:49:08.402+00	47	Logout	Logout Successful	2024-07-28 09:49:08.403106	2024-07-28 09:49:08.403106	\N
125	2024-07-28 09:49:08.482+00	47	Logout	Logout Successful	2024-07-28 09:49:08.482382	2024-07-28 09:49:08.482382	\N
126	2024-07-28 09:50:46.25+00	40	Login	Login Successful	2024-07-28 09:50:46.251027	2024-07-28 09:50:46.251027	\N
127	2024-07-28 09:51:24.362+00	11	Login	Login Successful	2024-07-28 09:51:24.363507	2024-07-28 09:51:24.363507	\N
128	2024-07-28 09:52:44.181+00	11	Logout	Logout Successful	2024-07-28 09:52:44.182126	2024-07-28 09:52:44.182126	\N
129	2024-07-28 09:53:56.239+00	39	Login	Login Successful	2024-07-28 09:53:56.23967	2024-07-28 09:53:56.23967	\N
130	2024-07-28 09:56:08.142+00	32	Login	Login Successful	2024-07-28 09:56:08.143138	2024-07-28 09:56:08.143138	\N
131	2024-07-28 09:58:21.605+00	24	Login	Login Successful	2024-07-28 09:58:21.60614	2024-07-28 09:58:21.60614	\N
132	2024-07-28 10:00:20.169+00	10	Login	Login Successful	2024-07-28 10:00:20.170528	2024-07-28 10:00:20.170528	\N
133	2024-07-28 10:00:28.922+00	10	Logout	Logout Successful	2024-07-28 10:00:28.922839	2024-07-28 10:00:28.922839	\N
134	2024-07-28 10:03:03.946+00	11	Login	Login Successful	2024-07-28 10:03:03.946952	2024-07-28 10:03:03.946952	\N
135	2024-07-28 10:04:47.569+00	37	Login	Login Successful	2024-07-28 10:04:47.569807	2024-07-28 10:04:47.569807	\N
136	2024-07-28 10:05:39.893+00	49	Login	Login Successful	2024-07-28 10:05:39.89464	2024-07-28 10:05:39.89464	\N
137	2024-07-28 10:07:26.958+00	11	Login	Login Successful	2024-07-28 10:07:26.959093	2024-07-28 10:07:26.959093	\N
138	2024-07-28 10:09:29.47+00	31	Login	Login Successful	2024-07-28 10:09:29.474507	2024-07-28 10:09:29.474507	\N
139	2024-07-28 10:10:43.932+00	41	Login	Login Successful	2024-07-28 10:10:43.93388	2024-07-28 10:10:43.93388	\N
140	2024-07-28 10:21:03.409+00	24	Login	Login Successful	2024-07-28 10:21:03.410406	2024-07-28 10:21:03.410406	\N
141	2024-07-28 10:29:00.864+00	24	Login	Login Successful	2024-07-28 10:29:00.865566	2024-07-28 10:29:00.865566	\N
142	2024-07-28 10:34:14.958+00	24	Login	Login Successful	2024-07-28 10:34:14.961273	2024-07-28 10:34:14.961273	\N
143	2024-07-28 10:36:25.924+00	34	Login	Login Successful	2024-07-28 10:36:25.924839	2024-07-28 10:36:25.924839	\N
144	2024-07-28 10:39:10.927+00	48	Login	Login Successful	2024-07-28 10:39:10.927844	2024-07-28 10:39:10.927844	\N
145	2024-07-28 10:42:20.278+00	31	Login	Login Successful	2024-07-28 10:42:20.279024	2024-07-28 10:42:20.279024	\N
146	2024-07-28 10:45:31.771+00	47	Login	Login Successful	2024-07-28 10:45:31.773594	2024-07-28 10:45:31.773594	\N
147	2024-07-28 11:46:46.276+00	54	Login	Login Successful	2024-07-28 11:46:46.277252	2024-07-28 11:46:46.277252	\N
148	2024-07-28 11:48:01.134+00	54	Logout	Logout Successful	2024-07-28 11:48:01.135652	2024-07-28 11:48:01.135652	\N
149	2024-07-28 11:50:32.942+00	54	Login	Login Successful	2024-07-28 11:50:32.942808	2024-07-28 11:50:32.942808	\N
150	2024-07-28 11:50:50.886+00	54	Logout	Logout Successful	2024-07-28 11:50:50.904529	2024-07-28 11:50:50.904529	\N
151	2024-07-28 11:56:34.834+00	54	Login	Login Successful	2024-07-28 11:56:34.835829	2024-07-28 11:56:34.835829	\N
152	2024-07-28 12:10:38.565+00	32	Login	Login Successful	2024-07-28 12:10:38.565824	2024-07-28 12:10:38.565824	\N
153	2024-07-28 12:12:18.747+00	32	Login	Login Successful	2024-07-28 12:12:18.74768	2024-07-28 12:12:18.74768	\N
154	2024-07-28 12:17:44.425+00	47	Login	Login Successful	2024-07-28 12:17:44.426576	2024-07-28 12:17:44.426576	\N
155	2024-07-28 13:40:52.944+00	49	Login	Login Successful	2024-07-28 13:40:52.945975	2024-07-28 13:40:52.945975	\N
156	2024-07-28 14:19:39.146+00	36	Login	Login Successful	2024-07-28 14:19:39.147148	2024-07-28 14:19:39.147148	\N
157	2024-07-28 14:19:39.163+00	36	Login	Login Successful	2024-07-28 14:19:39.163535	2024-07-28 14:19:39.163535	\N
158	2024-07-28 14:28:23.347+00	51	Login	Login Successful	2024-07-28 14:28:23.348897	2024-07-28 14:28:23.348897	\N
159	2024-07-28 15:06:37.631+00	19	Login	Login Successful	2024-07-28 15:06:37.632769	2024-07-28 15:06:37.632769	\N
160	2024-07-28 15:12:37.589+00	49	Login	Login Successful	2024-07-28 15:12:37.589937	2024-07-28 15:12:37.589937	\N
161	2024-07-28 15:12:49.306+00	19	Login	Login Successful	2024-07-28 15:12:49.307959	2024-07-28 15:12:49.307959	\N
162	2024-07-28 15:14:02.776+00	49	Login	Login Successful	2024-07-28 15:14:02.780507	2024-07-28 15:14:02.780507	\N
163	2024-07-28 15:14:31.225+00	19	Login	Login Successful	2024-07-28 15:14:31.226433	2024-07-28 15:14:31.226433	\N
164	2024-07-28 15:16:05.684+00	49	Login	Login Successful	2024-07-28 15:16:05.68548	2024-07-28 15:16:05.68548	\N
165	2024-07-28 15:20:08.151+00	49	Logout	Logout Successful	2024-07-28 15:20:08.152333	2024-07-28 15:20:08.152333	\N
166	2024-07-28 15:20:19.168+00	50	Login	Login Successful	2024-07-28 15:20:19.168977	2024-07-28 15:20:19.168977	\N
167	2024-07-28 15:21:26.596+00	50	Logout	Logout Successful	2024-07-28 15:21:26.606061	2024-07-28 15:21:26.606061	\N
168	2024-07-28 15:29:43.352+00	15	Login	Login Successful	2024-07-28 15:29:43.353562	2024-07-28 15:29:43.353562	\N
169	2024-07-28 16:02:45.876+00	49	Login	Login Successful	2024-07-28 16:02:45.877268	2024-07-28 16:02:45.877268	\N
\.


--
-- Data for Name: assessment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assessment ("assessmentId", name, status, instruction, duration, start, "end", "createdOn", "updatedOn", "deletedOn") FROM stdin;
1	Customer Relationship Management (CRM)	ACTIVE	Overview\n\nThe Customer Relationship Management (CRM) assessment, conducted by Concern India Foundation and Sector Skill Council (SSC), will consist of 50 questions to be completed in 50 minutes. \n\nThe exam will start at 11:00 AM sharp and will conclude at 11:50 AM sharp.\n\n\nLogin Details\n* You should be to log in before 11:00 AM.\n* The login screen will appear after click on start assessment to start the assessment.\n* Ensure you log in within the specified time frame to avoid any delays.\n\n\nTimer and Time Management\n* The clock has been set at the server, and a countdown timer at the top right corner of the screen will display the remaining time.\n* Monitor the countdown timer to manage your time effectively.\n\n\nNavigation Buttons\n* PREVIOUS: Navigate to the previous question and mark it for review at a later stage.\n* NEXT: Save the selected answer and proceed to the next question.\n\n\nAnswering Questions\n* Click one of the answer option buttons to select your answer.\n* To change an answer, simply click the desired option button.\n* To save the answer before moving to the next question, click on NEXT. The next question will automatically be displayed.\n* All answered questions (saved or marked) will be considered for calculating the final score.\n\n\nSubmission Rules\n* Do not click on the SUBMIT Button unless you have completed the exam.\n* In case you click the EXIT button, you will not be permitted to continue.\n\n\nScoring\n* For each correct response, one mark will be awarded.\n* Zero marks will be given for questions not answered.\n* Incorrect answers will entail zero marks.\n\n\n1. Technical rules:\n   * Ensure your device is fully charged or connected to a power source.\n   * Use a reliable internet connection to avoid disruptions.\n\n2. Environment:\n   * Choose a quiet, well-lit environment free from distractions.\n   * Ensure that you are alone in the room to maintain the integrity of the assessment.\n\n3. Conduct:\n   * Do not use any external resources (books, notes, internet searches) during the assessment.\n   * Maintain academic honesty and integrity throughout the exam.\n\n4. Assistance:\n   * If you encounter any technical issues, contact the support team immediately.\n   * The support contact information will be provided on the login screen.\n\n5. Prohibited Actions:\n   * Do not attempt to open other applications or browser windows during the assessment.\n   * Do not engage in any form of communication with others during the assessment.\n\n6. Review:\n   * Use the PREVIOUS button to review and change answers if needed.\n   * Ensure all answers are saved before the timer runs out.\n\n7. Completion:\n   * The exam will automatically submit when the time is up.\n   * Review your answers and ensure all questions are attempted within the given time.	50	2024-07-28 05:30:00+00	2024-07-28 18:29:00+00	2024-07-28 03:22:32.975172	2024-07-28 09:19:07.166004	\N
\.


--
-- Data for Name: assessmentAnswer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."assessmentAnswer" ("assessmentAnswerId", "attendAssessmentId", "questionId", answer, "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: assessmentAnswerGeneral; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."assessmentAnswerGeneral" ("assessmentAnswerId", "attendAssessmentId", "questionId", answer, "createdOn", "updatedOn", "deletedOn") FROM stdin;
19	1	72	288	2024-07-28 05:30:12.867344	2024-07-28 05:37:40.795857	\N
1434	22	56	223	2024-07-28 05:37:55.342779	2024-07-28 05:56:43.160763	\N
4	1	16	62	2024-07-28 05:30:12.867344	2024-07-28 05:59:55.688345	\N
56	2	30	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
57	2	18	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
58	2	58	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
59	2	4	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
60	2	37	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
61	2	75	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
62	2	45	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
63	2	6	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
64	2	5	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
65	2	36	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
66	2	61	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
67	2	67	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
68	2	46	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
69	2	7	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
70	2	31	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
71	2	28	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
72	2	20	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
73	2	68	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
74	2	59	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
75	2	60	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
76	2	15	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
77	2	69	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
78	2	73	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
79	2	17	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
80	2	72	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
81	2	29	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
82	2	74	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
83	2	56	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
84	2	48	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
85	2	40	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
86	2	39	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
87	2	57	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
88	2	38	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
89	2	2	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
90	2	70	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
91	2	16	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
92	2	19	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
93	2	21	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
94	2	87	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
95	2	44	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
96	2	47	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
97	2	89	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
98	2	3	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
99	2	88	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
100	2	71	\N	2024-07-28 05:30:25.804154	2024-07-28 05:30:25.804154	\N
607	13	27	105	2024-07-28 05:32:28.65064	2024-07-28 05:37:41.134446	\N
21	1	3	11	2024-07-28 05:30:12.867344	2024-07-28 05:38:21.815173	\N
117	3	29	115	2024-07-28 05:30:31.110508	2024-07-28 05:38:28.19576	\N
2850	26	58	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
14	1	73	290	2024-07-28 05:30:12.867344	2024-07-28 06:02:26.349627	\N
51	2	90	358	2024-07-28 05:30:25.804154	2024-07-28 05:30:40.94261	\N
2	1	19	76	2024-07-28 05:30:12.867344	2024-07-28 05:30:42.919142	\N
28	1	57	228	2024-07-28 05:30:12.867344	2024-07-28 06:07:02.554351	\N
102	3	7	28	2024-07-28 05:30:31.110508	2024-07-28 05:31:59.26167	\N
52	2	27	107	2024-07-28 05:30:25.804154	2024-07-28 05:32:08.087051	\N
5	1	29	115	2024-07-28 05:30:12.867344	2024-07-28 05:32:10.144097	\N
103	3	86	343	2024-07-28 05:30:31.110508	2024-07-28 05:32:10.748891	\N
6	1	46	181	2024-07-28 05:30:12.867344	2024-07-28 05:32:30.504033	\N
53	2	62	246	2024-07-28 05:30:25.804154	2024-07-28 05:32:34.847578	\N
104	3	61	243	2024-07-28 05:30:31.110508	2024-07-28 05:32:36.65725	\N
105	3	5	20	2024-07-28 05:30:31.110508	2024-07-28 05:32:52.976818	\N
54	2	1	4	2024-07-28 05:30:25.804154	2024-07-28 05:33:03.654778	\N
7	1	37	145	2024-07-28 05:30:12.867344	2024-07-28 05:33:06.005659	\N
55	2	86	343	2024-07-28 05:30:25.804154	2024-07-28 05:33:14.991367	\N
8	1	89	353	2024-07-28 05:30:12.867344	2024-07-28 05:33:18.431338	\N
106	3	15	58	2024-07-28 05:30:31.110508	2024-07-28 05:33:23.596423	\N
9	1	31	122	2024-07-28 05:30:12.867344	2024-07-28 05:33:53.535844	\N
10	1	75	298	2024-07-28 05:30:12.867344	2024-07-28 05:34:08.367207	\N
108	3	72	285	2024-07-28 05:30:31.110508	2024-07-28 05:34:10.438767	\N
11	1	20	79	2024-07-28 05:30:12.867344	2024-07-28 05:34:26.218734	\N
109	3	30	118	2024-07-28 05:30:31.110508	2024-07-28 05:34:29.391899	\N
46	1	30	119	2024-07-28 05:30:12.867344	2024-07-28 06:09:22.699275	\N
110	3	28	112	2024-07-28 05:30:31.110508	2024-07-28 05:34:56.779499	\N
13	1	68	269	2024-07-28 05:30:12.867344	2024-07-28 05:35:01.079704	\N
111	3	73	290	2024-07-28 05:30:31.110508	2024-07-28 05:35:23.111071	\N
112	3	59	233	2024-07-28 05:30:31.110508	2024-07-28 05:36:02.250462	\N
113	3	48	189	2024-07-28 05:30:31.110508	2024-07-28 05:36:31.218333	\N
16	1	15	57	2024-07-28 05:30:12.867344	2024-07-28 05:36:32.952603	\N
17	1	7	26	2024-07-28 05:30:12.867344	2024-07-28 05:37:03.7994	\N
115	3	88	352	2024-07-28 05:30:31.110508	2024-07-28 05:37:36.026673	\N
22	1	36	141	2024-07-28 05:30:12.867344	2024-07-28 05:38:50.743887	\N
118	3	47	188	2024-07-28 05:30:31.110508	2024-07-28 05:38:59.224014	\N
23	1	6	21	2024-07-28 05:30:12.867344	2024-07-28 05:39:04.088827	\N
119	3	2	7	2024-07-28 05:30:31.110508	2024-07-28 05:39:07.84703	\N
25	1	1	4	2024-07-28 05:30:12.867344	2024-07-28 05:39:21.590692	\N
120	3	68	269	2024-07-28 05:30:31.110508	2024-07-28 05:40:15.410482	\N
121	3	75	298	2024-07-28 05:30:31.110508	2024-07-28 05:41:13.934478	\N
27	1	90	358	2024-07-28 05:30:12.867344	2024-07-28 05:41:26.151643	\N
122	3	40	159	2024-07-28 05:30:31.110508	2024-07-28 05:41:49.293335	\N
29	1	40	\N	2024-07-28 05:30:12.867344	2024-07-28 05:50:47.831108	2024-07-28 05:50:47.826548
123	3	56	223	2024-07-28 05:30:31.110508	2024-07-28 05:42:18.07761	\N
124	3	44	174	2024-07-28 05:30:31.110508	2024-07-28 05:42:32.812225	\N
30	1	17	65	2024-07-28 05:30:12.867344	2024-07-28 05:42:36.806035	\N
31	1	88	352	2024-07-28 05:30:12.867344	2024-07-28 05:42:46.254244	\N
32	1	58	232	2024-07-28 05:30:12.867344	2024-07-28 05:43:21.446744	\N
33	1	4	13	2024-07-28 05:30:12.867344	2024-07-28 05:43:27.415462	\N
126	3	39	153	2024-07-28 05:30:31.110508	2024-07-28 05:43:28.608942	\N
127	3	38	152	2024-07-28 05:30:31.110508	2024-07-28 05:43:59.426591	\N
35	1	48	189	2024-07-28 05:30:12.867344	2024-07-28 05:44:06.914296	\N
36	1	67	266	2024-07-28 05:30:12.867344	2024-07-28 05:44:18.094682	\N
128	3	36	141	2024-07-28 05:30:31.110508	2024-07-28 05:44:23.846981	\N
37	1	86	343	2024-07-28 05:30:12.867344	2024-07-28 05:44:28.866522	\N
129	3	74	295	2024-07-28 05:30:31.110508	2024-07-28 05:44:41.551717	\N
38	1	60	238	2024-07-28 05:30:12.867344	2024-07-28 05:44:52.791796	\N
39	1	2	8	2024-07-28 05:30:12.867344	2024-07-28 05:45:13.204164	\N
130	3	16	61	2024-07-28 05:30:31.110508	2024-07-28 05:45:23.907123	\N
40	1	38	151	2024-07-28 05:30:12.867344	2024-07-28 05:45:43.191659	\N
131	3	19	76	2024-07-28 05:30:31.110508	2024-07-28 05:45:45.104221	\N
132	3	67	266	2024-07-28 05:30:31.110508	2024-07-28 05:46:08.384407	\N
133	3	27	108	2024-07-28 05:30:31.110508	2024-07-28 05:46:28.171725	\N
134	3	1	4	2024-07-28 05:30:31.110508	2024-07-28 05:46:33.066858	\N
135	3	70	\N	2024-07-28 05:30:31.110508	2024-07-28 05:46:45.957171	2024-07-28 05:46:45.954778
42	1	69	273	2024-07-28 05:30:12.867344	2024-07-28 05:47:05.603829	\N
136	3	89	355	2024-07-28 05:30:31.110508	2024-07-28 05:47:15.414211	\N
43	1	74	293	2024-07-28 05:30:12.867344	2024-07-28 05:47:28.83167	\N
44	1	70	277	2024-07-28 05:30:12.867344	2024-07-28 05:47:51.841693	\N
45	1	5	18	2024-07-28 05:30:12.867344	2024-07-28 05:48:17.201815	\N
48	1	71	282	2024-07-28 05:30:12.867344	2024-07-28 05:49:02.937334	\N
49	1	45	178	2024-07-28 05:30:12.867344	2024-07-28 05:49:22.339832	\N
50	1	21	84	2024-07-28 05:30:12.867344	2024-07-28 05:49:33.408964	\N
26	1	28	109	2024-07-28 05:30:12.867344	2024-07-28 05:51:25.624428	\N
24	1	59	236	2024-07-28 05:30:12.867344	2024-07-28 05:51:45.189276	\N
20	1	18	72	2024-07-28 05:30:12.867344	2024-07-28 05:52:02.129837	\N
18	1	47	187	2024-07-28 05:30:12.867344	2024-07-28 05:52:52.773444	\N
15	1	61	243	2024-07-28 05:30:12.867344	2024-07-28 05:53:04.320673	\N
47	1	27	107	2024-07-28 05:30:12.867344	2024-07-28 06:09:42.287696	\N
196	4	27	105	2024-07-28 05:30:33.789462	2024-07-28 05:56:46.44453	\N
197	4	40	160	2024-07-28 05:30:33.789462	2024-07-28 05:57:47.366486	\N
198	4	45	178	2024-07-28 05:30:33.789462	2024-07-28 05:59:22.106466	\N
151	4	7	26	2024-07-28 05:30:33.789462	2024-07-28 05:30:42.716703	\N
152	4	87	347	2024-07-28 05:30:33.789462	2024-07-28 05:30:50.124449	\N
153	4	75	298	2024-07-28 05:30:33.789462	2024-07-28 05:30:56.178365	\N
199	4	31	122	2024-07-28 05:30:33.789462	2024-07-28 06:00:37.7951	\N
1312	20	39	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
154	4	19	\N	2024-07-28 05:30:33.789462	2024-07-28 05:31:41.22504	2024-07-28 05:31:41.223001
155	4	88	352	2024-07-28 05:30:33.789462	2024-07-28 05:31:57.507589	\N
156	4	46	181	2024-07-28 05:30:33.789462	2024-07-28 05:32:51.141155	\N
157	4	57	228	2024-07-28 05:30:33.789462	2024-07-28 05:33:48.137676	\N
158	4	29	114	2024-07-28 05:30:33.789462	2024-07-28 05:34:37.811629	\N
159	4	89	353	2024-07-28 05:30:33.789462	2024-07-28 05:36:06.228653	\N
1313	20	6	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1314	20	74	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1315	20	44	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1316	20	90	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1317	20	73	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1318	20	46	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1319	20	61	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1320	20	58	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1321	20	68	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1322	20	88	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1323	20	57	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1324	20	62	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1325	20	86	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1326	20	19	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1328	20	47	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1329	20	27	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1330	20	36	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1331	20	4	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1332	20	37	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1333	20	7	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1334	20	28	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1335	20	15	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1336	20	45	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1337	20	18	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1338	20	59	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1339	20	56	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1340	20	87	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1341	20	16	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1342	20	67	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1343	20	5	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1344	20	40	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1345	20	71	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1346	20	21	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1347	20	3	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1348	20	60	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1349	20	75	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1350	20	72	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1351	20	29	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1352	20	38	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1353	20	89	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1354	20	2	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1355	20	1	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1356	20	20	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1357	20	70	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1358	20	48	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1360	20	31	\N	2024-07-28 05:37:52.274356	2024-07-28 05:37:52.274356	\N
1066	8	38	151	2024-07-28 05:35:09.438829	2024-07-28 05:37:55.844089	\N
116	3	90	358	2024-07-28 05:30:31.110508	2024-07-28 05:37:57.063209	\N
766	16	21	81	2024-07-28 05:33:46.633048	2024-07-28 05:37:57.272799	\N
160	4	5	20	2024-07-28 05:30:33.789462	2024-07-28 05:37:58.701636	\N
1461	23	59	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1462	23	88	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1463	23	90	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1464	23	17	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1465	23	20	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1466	23	31	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1467	23	57	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1468	23	5	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1469	23	38	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1470	23	74	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1471	23	89	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1472	23	68	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
161	4	16	61	2024-07-28 05:30:33.789462	2024-07-28 05:39:20.925777	\N
162	4	74	295	2024-07-28 05:30:33.789462	2024-07-28 05:40:26.997977	\N
163	4	60	238	2024-07-28 05:30:33.789462	2024-07-28 05:41:20.362178	\N
164	4	69	274	2024-07-28 05:30:33.789462	2024-07-28 05:41:29.111391	\N
1327	20	17	66	2024-07-28 05:37:52.274356	2024-07-28 05:42:24.727276	\N
166	4	1	4	2024-07-28 05:30:33.789462	2024-07-28 05:42:30.495062	\N
167	4	86	343	2024-07-28 05:30:33.789462	2024-07-28 05:42:48.347729	\N
168	4	15	57	2024-07-28 05:30:33.789462	2024-07-28 05:43:37.289862	\N
169	4	20	79	2024-07-28 05:30:33.789462	2024-07-28 05:44:26.759633	\N
170	4	72	287	2024-07-28 05:30:33.789462	2024-07-28 05:45:04.217025	\N
171	4	2	7	2024-07-28 05:30:33.789462	2024-07-28 05:45:07.978944	\N
172	4	39	156	2024-07-28 05:30:33.789462	2024-07-28 05:45:32.86481	\N
173	4	67	266	2024-07-28 05:30:33.789462	2024-07-28 05:45:53.32795	\N
174	4	47	187	2024-07-28 05:30:33.789462	2024-07-28 05:46:16.716756	\N
175	4	58	230	2024-07-28 05:30:33.789462	2024-07-28 05:46:44.861124	\N
137	3	21	83	2024-07-28 05:30:31.110508	2024-07-28 05:47:32.032737	\N
176	4	17	66	2024-07-28 05:30:33.789462	2024-07-28 05:47:35.890196	\N
177	4	90	358	2024-07-28 05:30:33.789462	2024-07-28 05:47:40.324835	\N
178	4	68	269	2024-07-28 05:30:33.789462	2024-07-28 05:47:48.480011	\N
139	3	37	148	2024-07-28 05:30:31.110508	2024-07-28 05:47:56.464938	\N
179	4	3	11	2024-07-28 05:30:33.789462	2024-07-28 05:47:59.20342	\N
180	4	70	277	2024-07-28 05:30:33.789462	2024-07-28 05:48:12.859934	\N
140	3	69	274	2024-07-28 05:30:31.110508	2024-07-28 05:48:51.078394	\N
181	4	30	117	2024-07-28 05:30:33.789462	2024-07-28 05:49:17.117016	\N
141	3	57	226	2024-07-28 05:30:31.110508	2024-07-28 05:49:17.140656	\N
182	4	6	21	2024-07-28 05:30:33.789462	2024-07-28 05:49:22.690494	\N
142	3	18	70	2024-07-28 05:30:31.110508	2024-07-28 05:49:29.667648	\N
143	3	45	178	2024-07-28 05:30:31.110508	2024-07-28 05:50:08.923496	\N
183	4	37	147	2024-07-28 05:30:33.789462	2024-07-28 05:50:17.539548	\N
144	3	71	282	2024-07-28 05:30:31.110508	2024-07-28 05:50:27.533857	\N
184	4	28	110	2024-07-28 05:30:33.789462	2024-07-28 05:50:41.540193	\N
145	3	62	248	2024-07-28 05:30:31.110508	2024-07-28 05:51:00.264917	\N
185	4	62	246	2024-07-28 05:30:33.789462	2024-07-28 05:51:13.651123	\N
186	4	21	81	2024-07-28 05:30:33.789462	2024-07-28 05:51:18.232299	\N
147	3	6	21	2024-07-28 05:30:31.110508	2024-07-28 05:51:19.809313	\N
148	3	17	66	2024-07-28 05:30:31.110508	2024-07-28 05:51:41.3365	\N
149	3	20	79	2024-07-28 05:30:31.110508	2024-07-28 05:51:49.570406	\N
150	3	46	\N	2024-07-28 05:30:31.110508	2024-07-28 05:52:04.160911	2024-07-28 05:52:04.1594
187	4	36	141	2024-07-28 05:30:33.789462	2024-07-28 05:52:38.689935	\N
1359	20	69	274	2024-07-28 05:37:52.274356	2024-07-28 05:53:54.011791	\N
188	4	73	290	2024-07-28 05:30:33.789462	2024-07-28 05:53:54.525932	\N
189	4	38	151	2024-07-28 05:30:33.789462	2024-07-28 05:54:08.344601	\N
190	4	61	242	2024-07-28 05:30:33.789462	2024-07-28 05:54:32.055903	\N
191	4	4	13	2024-07-28 05:30:33.789462	2024-07-28 05:54:36.370807	\N
192	4	71	282	2024-07-28 05:30:33.789462	2024-07-28 05:55:21.167523	\N
194	4	18	71	2024-07-28 05:30:33.789462	2024-07-28 05:55:58.937335	\N
195	4	59	235	2024-07-28 05:30:33.789462	2024-07-28 05:56:31.139841	\N
200	4	56	\N	2024-07-28 05:30:33.789462	2024-07-28 06:02:26.279999	2024-07-28 06:02:26.278463
1455	22	31	122	2024-07-28 05:37:55.342779	2024-07-28 06:06:55.764058	\N
1456	22	74	295	2024-07-28 05:37:55.342779	2024-07-28 06:07:18.632449	\N
1457	22	90	358	2024-07-28 05:37:55.342779	2024-07-28 06:07:22.546784	\N
1458	22	58	230	2024-07-28 05:37:55.342779	2024-07-28 06:07:37.728454	\N
1459	22	44	176	2024-07-28 05:37:55.342779	2024-07-28 06:08:07.685417	\N
1460	22	61	242	2024-07-28 05:37:55.342779	2024-07-28 06:09:23.020094	\N
1	1	62	245	2024-07-28 05:30:12.867344	2024-07-28 05:30:34.19773	\N
227	5	37	147	2024-07-28 05:30:42.376796	2024-07-28 05:37:40.608575	\N
228	5	75	298	2024-07-28 05:30:42.376796	2024-07-28 05:37:44.452811	\N
304	7	3	11	2024-07-28 05:30:58.029349	2024-07-28 05:37:46.832268	\N
326	7	17	66	2024-07-28 05:30:58.029349	2024-07-28 05:56:48.393567	\N
327	7	45	178	2024-07-28 05:30:58.029349	2024-07-28 05:56:59.113373	\N
328	7	7	26	2024-07-28 05:30:58.029349	2024-07-28 05:57:09.125844	\N
201	5	4	13	2024-07-28 05:30:42.376796	2024-07-28 05:30:49.585052	\N
251	6	16	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
252	6	58	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
253	6	20	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
254	6	88	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
255	6	90	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
258	6	45	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
259	6	71	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
267	6	57	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
268	6	21	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
270	6	36	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
273	6	17	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
274	6	38	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
275	6	56	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
276	6	72	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
277	6	18	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
278	6	59	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
279	6	7	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
280	6	27	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
282	6	3	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
283	6	74	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
284	6	31	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
285	6	73	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
286	6	1	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
287	6	2	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
288	6	39	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
289	6	47	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
290	6	46	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
292	6	40	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
293	6	70	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
294	6	67	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
295	6	62	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
296	6	29	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
297	6	4	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
298	6	69	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
299	6	89	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
300	6	44	\N	2024-07-28 05:30:51.594114	2024-07-28 05:30:51.594114	\N
329	7	74	295	2024-07-28 05:30:58.029349	2024-07-28 05:58:32.609426	\N
202	5	21	81	2024-07-28 05:30:42.376796	2024-07-28 05:30:58.378366	\N
203	5	57	227	2024-07-28 05:30:42.376796	2024-07-28 05:31:12.57275	\N
205	5	16	64	2024-07-28 05:30:42.376796	2024-07-28 05:31:49.811804	\N
206	5	6	21	2024-07-28 05:30:42.376796	2024-07-28 05:31:53.378805	\N
256	6	6	21	2024-07-28 05:30:51.594114	2024-07-28 05:31:59.605744	\N
207	5	44	176	2024-07-28 05:30:42.376796	2024-07-28 05:32:01.43585	\N
257	6	87	347	2024-07-28 05:30:51.594114	2024-07-28 05:32:17.582419	\N
208	5	62	246	2024-07-28 05:30:42.376796	2024-07-28 05:32:29.498057	\N
209	5	68	269	2024-07-28 05:30:42.376796	2024-07-28 05:32:35.414392	\N
301	7	31	122	2024-07-28 05:30:58.029349	2024-07-28 05:32:36.429961	\N
210	5	69	274	2024-07-28 05:30:42.376796	2024-07-28 05:32:41.608399	\N
211	5	20	78	2024-07-28 05:30:42.376796	2024-07-28 05:32:52.827531	\N
260	6	5	\N	2024-07-28 05:30:51.594114	2024-07-28 05:40:03.945546	2024-07-28 05:40:03.943753
302	7	59	235	2024-07-28 05:30:58.029349	2024-07-28 05:33:33.187105	\N
261	6	28	110	2024-07-28 05:30:51.594114	2024-07-28 05:33:35.569094	\N
303	7	4	13	2024-07-28 05:30:58.029349	2024-07-28 05:33:39.873041	\N
213	5	31	122	2024-07-28 05:30:42.376796	2024-07-28 05:33:55.209514	\N
262	6	75	298	2024-07-28 05:30:51.594114	2024-07-28 05:34:18.204997	\N
214	5	46	181	2024-07-28 05:30:42.376796	2024-07-28 05:34:20.472513	\N
215	5	36	142	2024-07-28 05:30:42.376796	2024-07-28 05:34:40.304211	\N
216	5	7	26	2024-07-28 05:30:42.376796	2024-07-28 05:34:45.984182	\N
217	5	40	159	2024-07-28 05:30:42.376796	2024-07-28 05:35:00.187902	\N
218	5	2	7	2024-07-28 05:30:42.376796	2024-07-28 05:35:05.497133	\N
219	5	88	350	2024-07-28 05:30:42.376796	2024-07-28 05:35:26.599313	\N
220	5	61	242	2024-07-28 05:30:42.376796	2024-07-28 05:35:33.534625	\N
221	5	1	4	2024-07-28 05:30:42.376796	2024-07-28 05:35:41.259748	\N
263	6	60	238	2024-07-28 05:30:51.594114	2024-07-28 05:35:47.819603	\N
222	5	48	189	2024-07-28 05:30:42.376796	2024-07-28 05:35:56.085736	\N
269	6	48	192	2024-07-28 05:30:51.594114	2024-07-28 06:17:14.828045	\N
223	5	60	238	2024-07-28 05:30:42.376796	2024-07-28 05:36:05.710886	\N
266	6	61	242	2024-07-28 05:30:51.594114	2024-07-28 05:36:59.391766	\N
225	5	18	72	2024-07-28 05:30:42.376796	2024-07-28 05:37:16.165965	\N
226	5	45	178	2024-07-28 05:30:42.376796	2024-07-28 05:37:23.927156	\N
305	7	87	347	2024-07-28 05:30:58.029349	2024-07-28 05:38:01.380661	\N
1361	21	7	26	2024-07-28 05:37:53.594278	2024-07-28 05:38:25.369653	\N
306	7	46	181	2024-07-28 05:30:58.029349	2024-07-28 05:38:26.476936	\N
230	5	89	\N	2024-07-28 05:30:42.376796	2024-07-28 05:38:39.011893	2024-07-28 05:38:39.005097
307	7	86	343	2024-07-28 05:30:58.029349	2024-07-28 05:38:43.569403	\N
232	5	38	151	2024-07-28 05:30:42.376796	2024-07-28 05:39:19.884521	\N
233	5	27	107	2024-07-28 05:30:42.376796	2024-07-28 05:39:29.445404	\N
234	5	67	266	2024-07-28 05:30:42.376796	2024-07-28 05:39:39.266586	\N
235	5	17	66	2024-07-28 05:30:42.376796	2024-07-28 05:39:49.12692	\N
236	5	56	222	2024-07-28 05:30:42.376796	2024-07-28 05:40:10.386635	\N
237	5	28	110	2024-07-28 05:30:42.376796	2024-07-28 05:40:13.343304	\N
238	5	39	156	2024-07-28 05:30:42.376796	2024-07-28 05:40:28.764209	\N
239	5	70	277	2024-07-28 05:30:42.376796	2024-07-28 05:40:33.592821	\N
240	5	58	230	2024-07-28 05:30:42.376796	2024-07-28 05:40:41.685802	\N
241	5	47	188	2024-07-28 05:30:42.376796	2024-07-28 05:40:53.892483	\N
242	5	19	76	2024-07-28 05:30:42.376796	2024-07-28 05:40:57.467417	\N
243	5	72	287	2024-07-28 05:30:42.376796	2024-07-28 05:41:05.451779	\N
244	5	59	233	2024-07-28 05:30:42.376796	2024-07-28 05:41:19.032227	\N
308	7	56	223	2024-07-28 05:30:58.029349	2024-07-28 05:41:31.943017	\N
246	5	15	\N	2024-07-28 05:30:42.376796	2024-07-28 05:42:21.563647	2024-07-28 05:42:21.56222
247	5	5	\N	2024-07-28 05:30:42.376796	2024-07-28 05:42:40.873717	2024-07-28 05:42:40.868442
248	5	86	343	2024-07-28 05:30:42.376796	2024-07-28 05:42:50.142465	\N
249	5	71	282	2024-07-28 05:30:42.376796	2024-07-28 05:43:10.193008	\N
309	7	39	155	2024-07-28 05:30:58.029349	2024-07-28 05:43:35.30004	\N
250	5	87	347	2024-07-28 05:30:42.376796	2024-07-28 05:43:21.049779	\N
310	7	37	147	2024-07-28 05:30:58.029349	2024-07-28 05:44:31.740259	\N
311	7	16	63	2024-07-28 05:30:58.029349	2024-07-28 05:45:12.255575	\N
312	7	40	158	2024-07-28 05:30:58.029349	2024-07-28 05:46:38.070426	\N
313	7	69	274	2024-07-28 05:30:58.029349	2024-07-28 05:47:49.513599	\N
272	6	19	76	2024-07-28 05:30:51.594114	2024-07-28 05:47:59.452632	\N
315	7	27	107	2024-07-28 05:30:58.029349	2024-07-28 05:50:32.377953	\N
316	7	89	354	2024-07-28 05:30:58.029349	2024-07-28 05:50:57.094156	\N
317	7	36	141	2024-07-28 05:30:58.029349	2024-07-28 05:51:20.160692	\N
318	7	21	81	2024-07-28 05:30:58.029349	2024-07-28 05:51:47.651483	\N
319	7	44	\N	2024-07-28 05:30:58.029349	2024-07-28 05:52:02.04564	2024-07-28 05:52:02.043689
320	7	20	79	2024-07-28 05:30:58.029349	2024-07-28 05:52:52.160238	\N
321	7	88	352	2024-07-28 05:30:58.029349	2024-07-28 05:53:00.385039	\N
322	7	70	277	2024-07-28 05:30:58.029349	2024-07-28 05:53:42.035779	\N
323	7	6	21	2024-07-28 05:30:58.029349	2024-07-28 05:53:47.601854	\N
324	7	90	358	2024-07-28 05:30:58.029349	2024-07-28 05:54:00.949744	\N
325	7	48	192	2024-07-28 05:30:58.029349	2024-07-28 05:54:56.426351	\N
330	7	75	297	2024-07-28 05:30:58.029349	2024-07-28 05:58:42.395849	\N
332	7	18	72	2024-07-28 05:30:58.029349	2024-07-28 06:01:10.987231	\N
333	7	58	230	2024-07-28 05:30:58.029349	2024-07-28 06:02:25.488911	\N
334	7	30	117	2024-07-28 05:30:58.029349	2024-07-28 06:02:58.365735	\N
291	6	30	117	2024-07-28 05:30:51.594114	2024-07-28 06:07:22.894476	\N
265	6	37	147	2024-07-28 05:30:51.594114	2024-07-28 06:08:45.079476	\N
281	6	86	343	2024-07-28 05:30:51.594114	2024-07-28 06:14:06.45228	\N
264	6	68	\N	2024-07-28 05:30:51.594114	2024-07-28 06:16:22.563825	2024-07-28 06:16:22.562035
271	6	15	58	2024-07-28 05:30:51.594114	2024-07-28 06:17:42.816292	\N
101	3	60	238	2024-07-28 05:30:31.110508	2024-07-28 05:31:18.698226	\N
204	5	73	290	2024-07-28 05:30:42.376796	2024-07-28 05:31:26.942859	\N
3	1	56	\N	2024-07-28 05:30:12.867344	2024-07-28 05:57:42.835934	2024-07-28 05:57:42.833939
385	8	71	284	2024-07-28 05:31:40.570967	2024-07-28 05:39:16.870202	\N
357	8	21	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
358	8	15	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
359	8	67	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
360	8	39	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
361	8	86	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
362	8	68	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
363	8	45	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
364	8	88	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
365	8	38	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
366	8	70	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
367	8	27	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
368	8	61	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
369	8	73	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
370	8	57	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
371	8	72	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
373	8	56	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
374	8	5	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
375	8	75	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
376	8	87	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
377	8	31	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
378	8	58	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
379	8	37	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
380	8	7	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
381	8	30	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
382	8	90	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
383	8	28	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
384	8	1	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
386	8	3	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
387	8	48	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
388	8	2	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
389	8	74	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
390	8	59	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
391	8	19	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
392	8	62	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
393	8	60	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
394	8	69	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
395	8	16	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
396	8	44	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
397	8	6	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
398	8	46	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
399	8	4	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
400	8	40	\N	2024-07-28 05:31:40.570967	2024-07-28 05:31:40.570967	\N
402	9	20	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
372	8	89	355	2024-07-28 05:31:40.570967	2024-07-28 05:39:42.681186	\N
406	9	5	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
409	9	39	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
418	9	37	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
430	9	17	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
431	9	1	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
432	9	46	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
433	9	7	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
434	9	59	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
435	9	18	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
436	9	6	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
437	9	69	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
438	9	72	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
439	9	27	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
440	9	62	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
441	9	30	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
442	9	61	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
443	9	28	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
444	9	86	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
445	9	36	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
446	9	73	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
447	9	2	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
448	9	60	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
449	9	56	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
450	9	21	\N	2024-07-28 05:31:43.716513	2024-07-28 05:31:43.716513	\N
451	4	19	76	2024-07-28 05:31:47.421035	2024-07-28 05:31:47.421035	\N
401	9	40	159	2024-07-28 05:31:43.716513	2024-07-28 05:31:55.146417	\N
452	11	30	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
453	11	21	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
454	11	2	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
455	11	3	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
456	11	7	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
457	11	68	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
458	11	73	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
459	11	59	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
460	11	37	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
461	11	18	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
462	11	36	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
463	11	56	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
464	11	19	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
465	11	47	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
466	11	72	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
467	11	90	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
351	8	36	143	2024-07-28 05:31:40.570967	2024-07-28 05:32:03.823714	\N
352	8	47	187	2024-07-28 05:31:40.570967	2024-07-28 05:32:26.639052	\N
405	9	68	269	2024-07-28 05:31:43.716513	2024-07-28 05:32:39.790625	\N
353	8	17	\N	2024-07-28 05:31:40.570967	2024-07-28 05:32:44.856037	2024-07-28 05:32:44.849698
407	9	88	352	2024-07-28 05:31:43.716513	2024-07-28 05:32:54.373834	\N
408	9	74	295	2024-07-28 05:31:43.716513	2024-07-28 05:33:00.872731	\N
410	9	44	176	2024-07-28 05:31:43.716513	2024-07-28 05:33:18.811438	\N
411	9	87	347	2024-07-28 05:31:43.716513	2024-07-28 05:33:26.431391	\N
335	7	71	282	2024-07-28 05:30:58.029349	2024-07-28 06:03:41.927861	\N
412	9	57	227	2024-07-28 05:31:43.716513	2024-07-28 05:33:39.433833	\N
413	9	38	151	2024-07-28 05:31:43.716513	2024-07-28 05:33:46.107922	\N
355	8	29	114	2024-07-28 05:31:40.570967	2024-07-28 05:33:51.583208	\N
414	9	48	\N	2024-07-28 05:31:43.716513	2024-07-28 05:50:40.733359	2024-07-28 05:50:40.732025
415	9	29	114	2024-07-28 05:31:43.716513	2024-07-28 05:34:14.826149	\N
416	9	75	298	2024-07-28 05:31:43.716513	2024-07-28 05:34:20.855786	\N
417	9	16	64	2024-07-28 05:31:43.716513	2024-07-28 05:34:47.589805	\N
419	9	67	266	2024-07-28 05:31:43.716513	2024-07-28 05:35:28.518431	\N
420	9	47	187	2024-07-28 05:31:43.716513	2024-07-28 05:35:42.179045	\N
421	9	58	230	2024-07-28 05:31:43.716513	2024-07-28 05:35:55.28636	\N
422	9	4	13	2024-07-28 05:31:43.716513	2024-07-28 05:35:57.966936	\N
423	9	3	11	2024-07-28 05:31:43.716513	2024-07-28 05:36:13.58739	\N
424	9	19	76	2024-07-28 05:31:43.716513	2024-07-28 05:36:21.675985	\N
425	9	45	178	2024-07-28 05:31:43.716513	2024-07-28 05:36:31.013766	\N
426	9	31	122	2024-07-28 05:31:43.716513	2024-07-28 05:36:43.234997	\N
427	9	71	282	2024-07-28 05:31:43.716513	2024-07-28 05:36:54.974742	\N
428	9	90	358	2024-07-28 05:31:43.716513	2024-07-28 05:36:58.372624	\N
429	9	70	277	2024-07-28 05:31:43.716513	2024-07-28 05:37:04.679657	\N
336	7	2	7	2024-07-28 05:30:58.029349	2024-07-28 06:03:53.015738	\N
337	7	67	266	2024-07-28 05:30:58.029349	2024-07-28 06:04:12.297068	\N
338	7	15	58	2024-07-28 05:30:58.029349	2024-07-28 06:04:34.854915	\N
339	7	57	227	2024-07-28 05:30:58.029349	2024-07-28 06:06:19.966237	\N
340	7	5	20	2024-07-28 05:30:58.029349	2024-07-28 06:06:30.965956	\N
341	7	68	269	2024-07-28 05:30:58.029349	2024-07-28 06:06:40.227235	\N
342	7	60	238	2024-07-28 05:30:58.029349	2024-07-28 06:07:45.518937	\N
343	7	29	114	2024-07-28 05:30:58.029349	2024-07-28 06:08:40.593717	\N
344	7	47	187	2024-07-28 05:30:58.029349	2024-07-28 06:09:21.285728	\N
345	7	1	1	2024-07-28 05:30:58.029349	2024-07-28 06:11:13.035661	\N
346	7	73	292	2024-07-28 05:30:58.029349	2024-07-28 06:11:24.258772	\N
348	7	62	246	2024-07-28 05:30:58.029349	2024-07-28 06:12:27.588659	\N
349	7	28	112	2024-07-28 05:30:58.029349	2024-07-28 06:13:04.836903	\N
350	7	38	151	2024-07-28 05:30:58.029349	2024-07-28 06:13:23.09854	\N
468	11	31	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
469	11	46	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
470	11	67	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
471	11	60	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
472	11	29	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
473	11	38	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
474	11	87	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
475	11	28	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
476	11	20	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
477	11	88	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
478	11	39	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
479	11	75	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
480	11	27	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
481	11	62	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
482	11	6	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
483	11	74	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
484	11	17	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
485	11	1	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
486	11	15	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
487	11	57	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
488	11	86	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
489	11	45	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
490	11	48	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
491	11	61	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
492	11	40	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
493	11	16	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
494	11	58	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
495	11	5	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
496	11	44	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
497	11	71	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
498	11	69	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
499	11	89	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
500	11	70	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
501	11	4	\N	2024-07-28 05:32:02.677889	2024-07-28 05:32:02.677889	\N
2791	1	56	223	2024-07-28 05:57:43.789357	2024-07-28 05:57:43.789357	\N
509	10	87	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
510	10	45	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
511	10	39	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
512	10	90	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
513	10	74	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
514	10	31	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
515	10	72	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
516	10	48	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
517	10	40	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
518	10	18	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
519	10	60	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
520	10	15	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
521	10	27	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
522	10	67	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
523	10	3	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
524	10	44	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
525	10	86	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
526	10	71	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
527	10	46	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
528	10	5	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
529	10	29	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
530	10	21	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
531	10	38	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
532	10	70	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
533	10	19	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
534	10	75	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
535	10	2	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
536	10	7	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
537	10	17	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
538	10	28	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
539	10	47	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
540	10	30	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
541	10	69	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
542	10	62	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
543	10	88	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
544	10	89	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
545	10	20	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
546	10	61	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
547	10	37	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
548	10	73	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
549	10	36	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
550	10	6	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
551	10	16	\N	2024-07-28 05:32:03.60837	2024-07-28 05:32:03.60837	\N
552	12	72	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
553	12	68	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
554	12	2	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
555	12	37	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
556	12	70	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
557	12	1	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
558	12	44	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
559	12	90	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
560	12	29	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
561	12	18	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
562	12	61	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
563	12	58	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
564	12	75	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
565	12	20	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
566	12	74	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
567	12	57	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
568	12	4	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
569	12	73	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
570	12	31	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
571	12	38	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
572	12	88	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
573	12	7	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
574	12	27	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
575	12	62	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
576	12	86	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
577	12	48	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
578	12	30	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
579	12	56	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
580	12	5	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
581	12	45	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
582	12	87	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
583	12	89	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
584	12	19	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
585	12	6	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
586	12	21	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
587	12	15	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
588	12	59	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
589	12	28	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
590	12	69	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
591	12	16	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
592	12	60	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
593	12	47	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
594	12	36	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
595	12	39	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
596	12	17	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
597	12	71	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
598	12	40	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
599	12	46	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
600	12	3	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
601	12	67	\N	2024-07-28 05:32:04.899962	2024-07-28 05:32:04.899962	\N
502	10	68	270	2024-07-28 05:32:03.60837	2024-07-28 05:34:48.929189	\N
603	13	37	145	2024-07-28 05:32:28.65064	2024-07-28 05:35:24.350282	\N
504	10	1	3	2024-07-28 05:32:03.60837	2024-07-28 05:35:44.162552	\N
505	10	57	227	2024-07-28 05:32:03.60837	2024-07-28 05:36:23.135239	\N
506	10	56	223	2024-07-28 05:32:03.60837	2024-07-28 05:36:48.417218	\N
507	10	59	\N	2024-07-28 05:32:03.60837	2024-07-28 05:37:08.981273	2024-07-28 05:37:08.977513
508	10	4	15	2024-07-28 05:32:03.60837	2024-07-28 05:37:25.951243	\N
639	13	6	21	2024-07-28 05:32:28.65064	2024-07-28 05:56:41.69693	\N
640	13	17	66	2024-07-28 05:32:28.65064	2024-07-28 05:58:18.507644	\N
2792	26	73	289	2024-07-28 05:58:37.268568	2024-07-28 05:58:37.268568	\N
642	13	60	238	2024-07-28 05:32:28.65064	2024-07-28 06:01:00.162715	\N
643	13	90	358	2024-07-28 05:32:28.65064	2024-07-28 06:01:05.541127	\N
644	13	62	246	2024-07-28 05:32:28.65064	2024-07-28 06:01:15.081094	\N
645	13	45	178	2024-07-28 05:32:28.65064	2024-07-28 06:01:57.918163	\N
404	9	89	355	2024-07-28 05:31:43.716513	2024-07-28 05:32:36.057167	\N
702	8	17	\N	2024-07-28 05:32:46.197346	2024-07-28 05:32:49.760675	2024-07-28 05:32:49.756537
703	8	17	66	2024-07-28 05:32:51.275912	2024-07-28 05:32:51.275912	\N
652	14	31	122	2024-07-28 05:32:30.355533	2024-07-28 05:32:54.304978	\N
653	14	70	277	2024-07-28 05:32:30.355533	2024-07-28 05:33:07.945025	\N
212	5	30	\N	2024-07-28 05:30:42.376796	2024-07-28 05:33:26.976659	2024-07-28 05:33:26.975092
704	15	86	343	2024-07-28 05:33:21.11941	2024-07-28 05:33:33.263566	\N
754	5	30	\N	2024-07-28 05:33:31.598954	2024-07-28 05:33:32.587215	2024-07-28 05:33:32.585511
705	15	44	173	2024-07-28 05:33:21.11941	2024-07-28 05:33:55.389705	\N
654	14	3	11	2024-07-28 05:32:30.355533	2024-07-28 05:34:00.44359	\N
706	15	38	151	2024-07-28 05:33:21.11941	2024-07-28 05:34:10.014284	\N
655	14	38	151	2024-07-28 05:32:30.355533	2024-07-28 05:34:14.718434	\N
656	14	61	242	2024-07-28 05:32:30.355533	2024-07-28 05:34:35.487875	\N
707	15	39	156	2024-07-28 05:33:21.11941	2024-07-28 05:34:38.466628	\N
708	15	75	298	2024-07-28 05:33:21.11941	2024-07-28 05:34:43.339228	\N
709	15	4	13	2024-07-28 05:33:21.11941	2024-07-28 05:34:47.459661	\N
710	15	56	223	2024-07-28 05:33:21.11941	2024-07-28 05:35:22.069375	\N
657	14	27	106	2024-07-28 05:32:30.355533	2024-07-28 05:35:27.465487	\N
658	14	18	71	2024-07-28 05:32:30.355533	2024-07-28 05:35:49.867804	\N
711	15	21	83	2024-07-28 05:33:21.11941	2024-07-28 05:35:50.183903	\N
604	13	58	230	2024-07-28 05:32:28.65064	2024-07-28 05:35:51.709519	\N
712	15	27	105	2024-07-28 05:33:21.11941	2024-07-28 05:36:16.116235	\N
713	15	74	295	2024-07-28 05:33:21.11941	2024-07-28 05:36:35.016898	\N
659	14	2	6	2024-07-28 05:32:30.355533	2024-07-28 05:36:35.53902	\N
714	15	45	178	2024-07-28 05:33:21.11941	2024-07-28 05:37:05.694328	\N
605	13	57	227	2024-07-28 05:32:28.65064	2024-07-28 05:37:10.923078	\N
660	14	36	143	2024-07-28 05:32:30.355533	2024-07-28 05:37:18.207895	\N
715	15	48	192	2024-07-28 05:33:21.11941	2024-07-28 05:37:24.069	\N
606	13	2	7	2024-07-28 05:32:28.65064	2024-07-28 05:37:31.272153	\N
661	14	21	81	2024-07-28 05:32:30.355533	2024-07-28 05:37:49.440048	\N
608	13	36	141	2024-07-28 05:32:28.65064	2024-07-28 05:38:03.914277	\N
662	14	20	79	2024-07-28 05:32:30.355533	2024-07-28 05:38:05.985742	\N
716	15	71	281	2024-07-28 05:33:21.11941	2024-07-28 05:38:08.079901	\N
609	13	4	13	2024-07-28 05:32:28.65064	2024-07-28 05:38:14.525078	\N
610	13	5	20	2024-07-28 05:32:28.65064	2024-07-28 05:38:28.330967	\N
663	14	1	4	2024-07-28 05:32:30.355533	2024-07-28 05:38:31.951498	\N
611	13	75	298	2024-07-28 05:32:28.65064	2024-07-28 05:38:37.198111	\N
664	14	5	20	2024-07-28 05:32:30.355533	2024-07-28 05:38:51.485638	\N
612	13	73	290	2024-07-28 05:32:28.65064	2024-07-28 05:38:55.34116	\N
717	15	90	358	2024-07-28 05:33:21.11941	2024-07-28 05:39:01.96731	\N
718	15	70	277	2024-07-28 05:33:21.11941	2024-07-28 05:39:08.540737	\N
665	14	16	63	2024-07-28 05:32:30.355533	2024-07-28 05:39:15.99778	\N
613	13	89	355	2024-07-28 05:32:28.65064	2024-07-28 05:39:18.795613	\N
719	15	59	233	2024-07-28 05:33:21.11941	2024-07-28 05:39:28.20216	\N
720	15	69	274	2024-07-28 05:33:21.11941	2024-07-28 05:39:43.059081	\N
667	14	75	299	2024-07-28 05:32:30.355533	2024-07-28 05:39:49.750551	\N
614	13	71	282	2024-07-28 05:32:28.65064	2024-07-28 05:39:49.794224	\N
721	15	89	355	2024-07-28 05:33:21.11941	2024-07-28 05:39:58.811664	\N
668	14	56	223	2024-07-28 05:32:30.355533	2024-07-28 05:40:29.397923	\N
722	15	29	113	2024-07-28 05:33:21.11941	2024-07-28 05:40:33.090055	\N
615	13	69	274	2024-07-28 05:32:28.65064	2024-07-28 05:40:40.643112	\N
669	14	68	269	2024-07-28 05:32:30.355533	2024-07-28 05:40:42.301671	\N
670	14	6	21	2024-07-28 05:32:30.355533	2024-07-28 05:40:50.12235	\N
671	14	57	227	2024-07-28 05:32:30.355533	2024-07-28 05:41:08.531022	\N
723	15	57	226	2024-07-28 05:33:21.11941	2024-07-28 05:41:20.047962	\N
724	15	62	246	2024-07-28 05:33:21.11941	2024-07-28 05:41:47.513362	\N
672	14	15	57	2024-07-28 05:32:30.355533	2024-07-28 05:41:54.570802	\N
674	14	19	76	2024-07-28 05:32:30.355533	2024-07-28 05:42:23.741376	\N
616	13	70	277	2024-07-28 05:32:28.65064	2024-07-28 05:42:31.647269	\N
725	15	37	145	2024-07-28 05:33:21.11941	2024-07-28 05:42:34.184784	\N
726	15	68	271	2024-07-28 05:33:21.11941	2024-07-28 05:42:45.893453	\N
675	14	67	266	2024-07-28 05:32:30.355533	2024-07-28 05:43:08.382571	\N
617	13	86	343	2024-07-28 05:32:28.65064	2024-07-28 05:43:20.439765	\N
727	15	6	21	2024-07-28 05:33:21.11941	2024-07-28 05:43:28.486351	\N
728	15	87	347	2024-07-28 05:33:21.11941	2024-07-28 05:43:35.263364	\N
618	13	7	26	2024-07-28 05:32:28.65064	2024-07-28 05:43:37.851236	\N
619	13	74	295	2024-07-28 05:32:28.65064	2024-07-28 05:44:11.212054	\N
677	14	40	159	2024-07-28 05:32:30.355533	2024-07-28 05:44:17.549059	\N
620	13	68	269	2024-07-28 05:32:28.65064	2024-07-28 05:44:21.683188	\N
729	15	40	159	2024-07-28 05:33:21.11941	2024-07-28 05:44:22.074289	\N
730	15	2	7	2024-07-28 05:33:21.11941	2024-07-28 05:44:28.782389	\N
621	13	38	151	2024-07-28 05:32:28.65064	2024-07-28 05:44:49.496298	\N
678	14	47	187	2024-07-28 05:32:30.355533	2024-07-28 05:44:58.203167	\N
731	15	47	187	2024-07-28 05:33:21.11941	2024-07-28 05:45:04.828229	\N
622	13	48	192	2024-07-28 05:32:28.65064	2024-07-28 05:45:13.715042	\N
732	15	7	25	2024-07-28 05:33:21.11941	2024-07-28 05:45:23.523429	\N
733	15	19	76	2024-07-28 05:33:21.11941	2024-07-28 05:45:30.436211	\N
623	13	16	63	2024-07-28 05:32:28.65064	2024-07-28 05:45:40.865005	\N
679	14	71	\N	2024-07-28 05:32:30.355533	2024-07-28 05:46:04.646974	2024-07-28 05:46:04.645481
680	14	58	230	2024-07-28 05:32:30.355533	2024-07-28 05:46:35.380042	\N
682	14	44	\N	2024-07-28 05:32:30.355533	2024-07-28 05:47:32.914012	2024-07-28 05:47:32.91163
624	13	40	159	2024-07-28 05:32:28.65064	2024-07-28 05:47:36.890895	\N
683	14	29	114	2024-07-28 05:32:30.355533	2024-07-28 05:47:49.258882	\N
684	14	74	293	2024-07-28 05:32:30.355533	2024-07-28 05:48:21.240772	\N
685	14	72	287	2024-07-28 05:32:30.355533	2024-07-28 05:48:56.619239	\N
625	13	3	11	2024-07-28 05:32:28.65064	2024-07-28 05:49:43.156312	\N
686	14	73	290	2024-07-28 05:32:30.355533	2024-07-28 05:49:51.397079	\N
626	13	20	79	2024-07-28 05:32:28.65064	2024-07-28 05:50:00.869952	\N
687	14	17	66	2024-07-28 05:32:30.355533	2024-07-28 05:50:10.244344	\N
627	13	44	176	2024-07-28 05:32:28.65064	2024-07-28 05:50:33.216237	\N
628	13	18	72	2024-07-28 05:32:28.65064	2024-07-28 05:51:03.163098	\N
688	14	59	235	2024-07-28 05:32:30.355533	2024-07-28 05:51:14.165587	\N
689	14	87	347	2024-07-28 05:32:30.355533	2024-07-28 05:51:20.128832	\N
629	13	47	187	2024-07-28 05:32:28.65064	2024-07-28 05:51:22.671172	\N
630	13	88	352	2024-07-28 05:32:28.65064	2024-07-28 05:51:38.886095	\N
632	13	56	223	2024-07-28 05:32:28.65064	2024-07-28 05:52:44.466049	\N
690	14	86	343	2024-07-28 05:32:30.355533	2024-07-28 05:52:55.713137	\N
691	14	62	\N	2024-07-28 05:32:30.355533	2024-07-28 05:53:16.46418	2024-07-28 05:53:16.462594
692	14	30	117	2024-07-28 05:32:30.355533	2024-07-28 05:53:39.243246	\N
693	14	89	355	2024-07-28 05:32:30.355533	2024-07-28 05:53:52.877877	\N
694	14	60	238	2024-07-28 05:32:30.355533	2024-07-28 05:54:03.42808	\N
695	14	46	181	2024-07-28 05:32:30.355533	2024-07-28 05:54:13.909116	\N
633	13	15	60	2024-07-28 05:32:28.65064	2024-07-28 05:54:19.386566	\N
696	14	39	156	2024-07-28 05:32:30.355533	2024-07-28 05:54:24.558409	\N
634	13	87	347	2024-07-28 05:32:28.65064	2024-07-28 05:54:34.284656	\N
697	14	37	147	2024-07-28 05:32:30.355533	2024-07-28 05:54:36.096403	\N
698	14	28	109	2024-07-28 05:32:30.355533	2024-07-28 05:55:08.49912	\N
636	13	19	76	2024-07-28 05:32:28.65064	2024-07-28 05:55:21.908913	\N
637	13	72	288	2024-07-28 05:32:28.65064	2024-07-28 05:55:37.946624	\N
699	14	88	352	2024-07-28 05:32:30.355533	2024-07-28 05:55:39.161773	\N
700	14	69	\N	2024-07-28 05:32:30.355533	2024-07-28 05:55:56.240784	2024-07-28 05:55:56.239296
638	13	21	81	2024-07-28 05:32:28.65064	2024-07-28 05:56:36.300865	\N
701	14	7	26	2024-07-28 05:32:30.355533	2024-07-28 05:56:33.813779	\N
646	13	29	114	2024-07-28 05:32:28.65064	2024-07-28 06:02:16.733225	\N
647	13	31	122	2024-07-28 05:32:28.65064	2024-07-28 06:02:28.184972	\N
648	13	1	4	2024-07-28 05:32:28.65064	2024-07-28 06:02:32.94282	\N
649	13	28	110	2024-07-28 05:32:28.65064	2024-07-28 06:02:51.768625	\N
650	13	46	181	2024-07-28 05:32:28.65064	2024-07-28 06:03:06.322343	\N
4791	45	28	112	2024-07-28 11:57:18.242346	2024-07-28 11:59:52.779022	\N
755	5	30	117	2024-07-28 05:33:33.073986	2024-07-28 05:33:33.073986	\N
107	3	87	347	2024-07-28 05:30:31.110508	2024-07-28 05:33:39.018483	\N
602	13	59	235	2024-07-28 05:32:28.65064	2024-07-28 05:33:41.460951	\N
1363	21	46	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1364	21	19	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
753	15	5	20	2024-07-28 05:33:21.11941	2024-07-28 05:57:10.565586	\N
804	16	30	119	2024-07-28 05:33:46.633048	2024-07-28 05:58:15.391509	\N
403	9	15	58	2024-07-28 05:31:43.716513	2024-07-28 05:58:45.717189	\N
805	16	57	227	2024-07-28 05:33:46.633048	2024-07-28 05:58:52.629119	\N
756	16	75	298	2024-07-28 05:33:46.633048	2024-07-28 05:33:54.376304	\N
757	16	68	269	2024-07-28 05:33:46.633048	2024-07-28 05:34:07.947669	\N
331	7	19	76	2024-07-28 05:30:58.029349	2024-07-28 05:59:00.587219	\N
4793	45	3	10	2024-07-28 11:57:18.242346	2024-07-28 12:01:10.329835	\N
758	16	27	105	2024-07-28 05:33:46.633048	2024-07-28 05:34:16.292266	\N
356	8	18	72	2024-07-28 05:31:40.570967	2024-07-28 05:34:16.955303	\N
806	17	21	81	2024-07-28 05:34:10.670885	2024-07-28 05:34:20.107682	\N
759	16	86	343	2024-07-28 05:33:46.633048	2024-07-28 05:34:22.55051	\N
856	18	17	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
857	18	72	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
858	18	48	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
859	18	29	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
860	18	67	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
861	18	18	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
862	18	88	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
863	18	7	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
864	18	5	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
865	18	37	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
866	18	58	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
807	17	57	227	2024-07-28 05:34:10.670885	2024-07-28 05:35:01.207347	\N
761	16	40	160	2024-07-28 05:33:46.633048	2024-07-28 05:35:02.248977	\N
808	17	68	269	2024-07-28 05:34:10.670885	2024-07-28 05:35:12.205539	\N
809	17	1	4	2024-07-28 05:34:10.670885	2024-07-28 05:35:22.343713	\N
762	16	70	277	2024-07-28 05:33:46.633048	2024-07-28 05:35:24.181195	\N
763	16	3	11	2024-07-28 05:33:46.633048	2024-07-28 05:35:42.01038	\N
810	17	72	287	2024-07-28 05:34:10.670885	2024-07-28 05:35:59.903679	\N
812	17	88	352	2024-07-28 05:34:10.670885	2024-07-28 05:36:46.225508	\N
811	17	71	281	2024-07-28 05:34:10.670885	2024-07-28 05:36:35.53731	\N
765	16	59	235	2024-07-28 05:33:46.633048	2024-07-28 05:36:57.783266	\N
813	17	18	71	2024-07-28 05:34:10.670885	2024-07-28 05:37:17.296986	\N
767	16	29	114	2024-07-28 05:33:46.633048	2024-07-28 05:38:13.794331	\N
815	17	60	238	2024-07-28 05:34:10.670885	2024-07-28 05:38:36.621966	\N
768	16	20	79	2024-07-28 05:33:46.633048	2024-07-28 05:39:30.109806	\N
817	17	59	235	2024-07-28 05:34:10.670885	2024-07-28 05:39:38.555559	\N
769	16	4	13	2024-07-28 05:33:46.633048	2024-07-28 05:39:39.823437	\N
818	17	40	159	2024-07-28 05:34:10.670885	2024-07-28 05:40:00.975395	\N
819	17	62	246	2024-07-28 05:34:10.670885	2024-07-28 05:40:10.822012	\N
821	17	38	151	2024-07-28 05:34:10.670885	2024-07-28 05:40:31.541252	\N
771	16	71	282	2024-07-28 05:33:46.633048	2024-07-28 05:40:54.373875	\N
822	17	44	176	2024-07-28 05:34:10.670885	2024-07-28 05:40:55.083021	\N
772	16	2	7	2024-07-28 05:33:46.633048	2024-07-28 05:40:58.997463	\N
823	17	86	343	2024-07-28 05:34:10.670885	2024-07-28 05:41:10.277097	\N
773	16	89	353	2024-07-28 05:33:46.633048	2024-07-28 05:41:12.326076	\N
824	17	30	117	2024-07-28 05:34:10.670885	2024-07-28 05:42:00.73607	\N
825	17	74	295	2024-07-28 05:34:10.670885	2024-07-28 05:42:24.238547	\N
826	17	19	76	2024-07-28 05:34:10.670885	2024-07-28 05:42:39.656767	\N
776	16	69	274	2024-07-28 05:33:46.633048	2024-07-28 05:42:55.808455	\N
827	17	37	147	2024-07-28 05:34:10.670885	2024-07-28 05:43:03.169091	\N
777	16	46	181	2024-07-28 05:33:46.633048	2024-07-28 05:43:15.381796	\N
828	17	46	184	2024-07-28 05:34:10.670885	2024-07-28 05:43:33.406845	\N
829	17	6	21	2024-07-28 05:34:10.670885	2024-07-28 05:43:50.063161	\N
830	17	73	290	2024-07-28 05:34:10.670885	2024-07-28 05:44:02.492723	\N
831	17	90	358	2024-07-28 05:34:10.670885	2024-07-28 05:44:09.538942	\N
832	17	29	114	2024-07-28 05:34:10.670885	2024-07-28 05:44:26.077061	\N
833	17	70	277	2024-07-28 05:34:10.670885	2024-07-28 05:44:32.622866	\N
834	17	87	347	2024-07-28 05:34:10.670885	2024-07-28 05:44:40.202741	\N
835	17	4	13	2024-07-28 05:34:10.670885	2024-07-28 05:44:48.190745	\N
778	16	18	72	2024-07-28 05:33:46.633048	2024-07-28 05:45:20.117957	\N
779	16	74	295	2024-07-28 05:33:46.633048	2024-07-28 05:45:28.699519	\N
780	16	44	176	2024-07-28 05:33:46.633048	2024-07-28 05:45:39.254521	\N
837	17	5	20	2024-07-28 05:34:10.670885	2024-07-28 05:45:56.131388	\N
838	17	31	122	2024-07-28 05:34:10.670885	2024-07-28 05:46:23.032245	\N
839	17	75	298	2024-07-28 05:34:10.670885	2024-07-28 05:46:30.493862	\N
734	15	67	266	2024-07-28 05:33:21.11941	2024-07-28 05:46:34.349362	\N
781	16	7	26	2024-07-28 05:33:46.633048	2024-07-28 05:46:35.727414	\N
840	17	27	105	2024-07-28 05:34:10.670885	2024-07-28 05:46:37.893685	\N
782	16	72	287	2024-07-28 05:33:46.633048	2024-07-28 05:46:42.75348	\N
783	16	48	192	2024-07-28 05:33:46.633048	2024-07-28 05:46:57.930349	\N
841	17	39	156	2024-07-28 05:34:10.670885	2024-07-28 05:46:58.691626	\N
842	17	58	230	2024-07-28 05:34:10.670885	2024-07-28 05:47:08.949351	\N
735	15	3	9	2024-07-28 05:33:21.11941	2024-07-28 05:47:15.325821	\N
844	17	7	26	2024-07-28 05:34:10.670885	2024-07-28 05:47:25.13211	\N
736	15	46	181	2024-07-28 05:33:21.11941	2024-07-28 05:47:28.031403	\N
845	17	2	7	2024-07-28 05:34:10.670885	2024-07-28 05:47:30.036646	\N
784	16	37	145	2024-07-28 05:33:46.633048	2024-07-28 05:47:37.325259	\N
846	17	67	266	2024-07-28 05:34:10.670885	2024-07-28 05:47:40.754965	\N
785	16	19	76	2024-07-28 05:33:46.633048	2024-07-28 05:47:45.737614	\N
737	15	28	110	2024-07-28 05:33:21.11941	2024-07-28 05:47:51.213165	\N
847	17	48	192	2024-07-28 05:34:10.670885	2024-07-28 05:47:52.427571	\N
786	16	90	358	2024-07-28 05:33:46.633048	2024-07-28 05:47:54.85464	\N
787	16	56	223	2024-07-28 05:33:46.633048	2024-07-28 05:48:13.918912	\N
788	16	87	347	2024-07-28 05:33:46.633048	2024-07-28 05:48:20.703547	\N
848	17	45	178	2024-07-28 05:34:10.670885	2024-07-28 05:48:23.275642	\N
789	16	15	60	2024-07-28 05:33:46.633048	2024-07-28 05:48:38.989371	\N
738	15	18	71	2024-07-28 05:33:21.11941	2024-07-28 05:48:40.401123	\N
790	16	38	151	2024-07-28 05:33:46.633048	2024-07-28 05:48:58.632881	\N
739	15	30	119	2024-07-28 05:33:21.11941	2024-07-28 05:49:03.66255	\N
850	17	89	355	2024-07-28 05:34:10.670885	2024-07-28 05:49:16.558151	\N
740	15	15	57	2024-07-28 05:33:21.11941	2024-07-28 05:49:25.276227	\N
791	16	5	\N	2024-07-28 05:33:46.633048	2024-07-28 05:49:39.089294	2024-07-28 05:49:39.087266
741	15	88	352	2024-07-28 05:33:21.11941	2024-07-28 05:49:58.80326	\N
792	16	60	238	2024-07-28 05:33:46.633048	2024-07-28 05:50:00.869468	\N
742	15	20	79	2024-07-28 05:33:21.11941	2024-07-28 05:50:14.535658	\N
793	16	88	352	2024-07-28 05:33:46.633048	2024-07-28 05:50:24.237112	\N
851	17	61	242	2024-07-28 05:34:10.670885	2024-07-28 05:50:25.697924	\N
794	16	73	290	2024-07-28 05:33:46.633048	2024-07-28 05:50:27.355435	\N
743	15	17	66	2024-07-28 05:33:21.11941	2024-07-28 05:50:29.836873	\N
744	15	73	290	2024-07-28 05:33:21.11941	2024-07-28 05:50:48.073888	\N
745	15	31	122	2024-07-28 05:33:21.11941	2024-07-28 05:51:10.058461	\N
746	15	1	4	2024-07-28 05:33:21.11941	2024-07-28 05:51:13.945943	\N
747	15	72	285	2024-07-28 05:33:21.11941	2024-07-28 05:51:36.489766	\N
796	16	61	243	2024-07-28 05:33:46.633048	2024-07-28 05:51:53.659548	\N
852	17	16	63	2024-07-28 05:34:10.670885	2024-07-28 05:51:58.672858	\N
853	17	28	110	2024-07-28 05:34:10.670885	2024-07-28 05:52:05.58026	\N
748	15	60	237	2024-07-28 05:33:21.11941	2024-07-28 05:52:06.868849	\N
797	16	16	63	2024-07-28 05:33:46.633048	2024-07-28 05:52:18.666681	\N
854	17	47	187	2024-07-28 05:34:10.670885	2024-07-28 05:52:20.390877	\N
798	16	6	21	2024-07-28 05:33:46.633048	2024-07-28 05:52:22.383831	\N
749	15	16	64	2024-07-28 05:33:21.11941	2024-07-28 05:52:28.601026	\N
855	17	69	274	2024-07-28 05:34:10.670885	2024-07-28 05:52:32.858743	\N
799	16	31	122	2024-07-28 05:33:46.633048	2024-07-28 05:52:37.673802	\N
750	15	36	141	2024-07-28 05:33:21.11941	2024-07-28 05:53:09.010724	\N
801	16	58	230	2024-07-28 05:33:46.633048	2024-07-28 05:53:21.776383	\N
751	15	58	\N	2024-07-28 05:33:21.11941	2024-07-28 05:53:34.696061	2024-07-28 05:53:34.691456
752	15	61	242	2024-07-28 05:33:21.11941	2024-07-28 05:53:50.213969	\N
802	16	62	246	2024-07-28 05:33:46.633048	2024-07-28 05:54:02.999401	\N
803	16	1	4	2024-07-28 05:33:46.633048	2024-07-28 05:54:09.63702	\N
816	17	15	58	2024-07-28 05:34:10.670885	2024-07-28 05:54:21.610838	\N
867	18	2	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
868	18	6	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
869	18	89	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
870	18	90	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
871	18	87	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
872	18	69	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
873	18	57	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
874	18	31	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
875	18	36	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
876	18	74	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
877	18	28	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
878	18	30	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
879	18	61	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
880	18	71	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
881	18	39	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
882	18	15	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
883	18	38	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
884	18	46	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
885	18	4	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
886	18	70	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
887	18	62	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
888	18	60	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
889	18	86	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
890	18	56	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
891	18	40	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
892	18	27	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
893	18	16	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
894	18	73	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
895	18	47	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
896	18	19	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
897	18	20	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
898	18	3	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
899	18	68	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
900	18	1	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
901	18	59	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
902	18	44	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
903	18	75	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
904	18	21	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
905	18	45	\N	2024-07-28 05:34:27.653748	2024-07-28 05:34:27.653748	\N
917	19	39	\N	2024-07-28 05:34:35.14588	2024-07-28 05:34:35.14588	\N
2851	26	3	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
906	19	17	66	2024-07-28 05:34:35.14588	2024-07-28 05:34:54.899774	\N
907	19	20	79	2024-07-28 05:34:35.14588	2024-07-28 05:35:12.939509	\N
908	19	44	173	2024-07-28 05:34:35.14588	2024-07-28 05:35:30.495059	\N
909	19	36	141	2024-07-28 05:34:35.14588	2024-07-28 05:36:00.163111	\N
910	19	70	277	2024-07-28 05:34:35.14588	2024-07-28 05:36:15.019438	\N
911	19	15	57	2024-07-28 05:34:35.14588	2024-07-28 05:36:42.179769	\N
912	19	18	70	2024-07-28 05:34:35.14588	2024-07-28 05:37:19.871168	\N
913	19	4	13	2024-07-28 05:34:35.14588	2024-07-28 05:37:34.475534	\N
914	19	68	269	2024-07-28 05:34:35.14588	2024-07-28 05:37:46.473684	\N
1365	21	69	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1366	21	2	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1367	21	30	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1368	21	21	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1369	21	48	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1370	21	56	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1371	21	68	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1372	21	67	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1373	21	73	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1374	21	87	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1375	21	44	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1376	21	27	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1377	21	6	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1378	21	70	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1379	21	4	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1380	21	16	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1381	21	72	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1382	21	39	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1383	21	60	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1384	21	58	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1385	21	74	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1386	21	45	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1387	21	75	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1388	21	38	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1389	21	18	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1390	21	36	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1391	21	61	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1392	21	71	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1393	21	28	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1394	21	29	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1395	21	1	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1396	21	15	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1397	21	3	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1398	21	47	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1399	21	31	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1400	21	62	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1401	21	90	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1402	21	86	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1403	21	20	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1404	21	5	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1405	21	40	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1406	21	37	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1407	21	89	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1408	21	17	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1409	21	88	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
915	19	59	233	2024-07-28 05:34:35.14588	2024-07-28 05:38:05.674823	\N
916	19	72	287	2024-07-28 05:34:35.14588	2024-07-28 05:38:51.460534	\N
918	19	88	352	2024-07-28 05:34:35.14588	2024-07-28 05:40:14.226664	\N
919	19	21	81	2024-07-28 05:34:35.14588	2024-07-28 05:40:29.898968	\N
920	19	37	147	2024-07-28 05:34:35.14588	2024-07-28 05:41:23.488542	\N
921	19	38	151	2024-07-28 05:34:35.14588	2024-07-28 05:41:35.768087	\N
922	19	56	222	2024-07-28 05:34:35.14588	2024-07-28 05:42:10.801755	\N
923	19	71	281	2024-07-28 05:34:35.14588	2024-07-28 05:42:51.257312	\N
924	19	89	355	2024-07-28 05:34:35.14588	2024-07-28 05:43:16.438365	\N
926	19	1	4	2024-07-28 05:34:35.14588	2024-07-28 05:44:11.18886	\N
927	19	86	341	2024-07-28 05:34:35.14588	2024-07-28 05:44:45.613672	\N
928	19	47	187	2024-07-28 05:34:35.14588	2024-07-28 05:45:14.814696	\N
929	19	75	\N	2024-07-28 05:34:35.14588	2024-07-28 05:45:26.915358	2024-07-28 05:45:26.913841
930	19	61	242	2024-07-28 05:34:35.14588	2024-07-28 05:45:39.528911	\N
931	19	19	76	2024-07-28 05:34:35.14588	2024-07-28 05:45:47.609725	\N
932	19	28	110	2024-07-28 05:34:35.14588	2024-07-28 05:46:04.181565	\N
933	19	90	358	2024-07-28 05:34:35.14588	2024-07-28 05:46:19.23386	\N
934	19	29	114	2024-07-28 05:34:35.14588	2024-07-28 05:46:36.969728	\N
935	19	2	7	2024-07-28 05:34:35.14588	2024-07-28 05:46:49.081331	\N
936	19	3	9	2024-07-28 05:34:35.14588	2024-07-28 05:47:28.408008	\N
937	19	7	26	2024-07-28 05:34:35.14588	2024-07-28 05:47:42.684148	\N
939	19	31	122	2024-07-28 05:34:35.14588	2024-07-28 05:48:17.522824	\N
940	19	30	119	2024-07-28 05:34:35.14588	2024-07-28 05:48:31.568311	\N
941	19	73	290	2024-07-28 05:34:35.14588	2024-07-28 05:48:52.878476	\N
942	19	46	182	2024-07-28 05:34:35.14588	2024-07-28 05:49:06.065937	\N
943	19	5	20	2024-07-28 05:34:35.14588	2024-07-28 05:49:24.159662	\N
944	19	58	231	2024-07-28 05:34:35.14588	2024-07-28 05:49:49.516313	\N
945	19	67	266	2024-07-28 05:34:35.14588	2024-07-28 05:50:06.798695	\N
946	19	74	295	2024-07-28 05:34:35.14588	2024-07-28 05:50:22.620815	\N
947	19	40	159	2024-07-28 05:34:35.14588	2024-07-28 05:50:40.014285	\N
948	19	48	192	2024-07-28 05:34:35.14588	2024-07-28 05:51:00.891575	\N
949	19	57	226	2024-07-28 05:34:35.14588	2024-07-28 05:51:37.461869	\N
950	19	69	274	2024-07-28 05:34:35.14588	2024-07-28 05:51:53.678236	\N
951	19	6	21	2024-07-28 05:34:35.14588	2024-07-28 05:52:02.268818	\N
952	19	45	178	2024-07-28 05:34:35.14588	2024-07-28 05:52:16.444783	\N
954	19	60	238	2024-07-28 05:34:35.14588	2024-07-28 05:52:44.944109	\N
955	19	62	246	2024-07-28 05:34:35.14588	2024-07-28 05:54:39.228157	\N
956	2	87	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
957	2	60	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
958	2	72	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
959	2	68	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
960	2	18	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
963	2	61	242	2024-07-28 05:34:37.459426	2024-07-28 05:37:41.060825	\N
964	2	28	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
965	2	74	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
966	2	88	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
967	2	29	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
968	2	39	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
969	2	73	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
970	2	40	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
971	2	45	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
972	2	89	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
973	2	20	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
974	2	1	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
975	2	90	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
976	2	67	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
977	2	21	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
978	2	15	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
979	2	2	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
980	2	70	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
981	2	71	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
982	2	38	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
983	2	17	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
984	2	59	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
985	2	75	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
986	2	27	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
987	2	56	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
988	2	62	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
989	2	48	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
990	2	3	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
991	2	37	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
992	2	46	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
993	2	19	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
994	2	5	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
995	2	44	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
996	2	31	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
997	2	57	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
998	2	86	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
999	2	47	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
1000	2	36	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
1001	2	30	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
1002	2	58	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
1003	2	4	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
1004	2	7	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
1005	2	69	\N	2024-07-28 05:34:37.459426	2024-07-28 05:34:37.459426	\N
760	16	45	178	2024-07-28 05:33:46.633048	2024-07-28 05:34:38.469256	\N
1006	12	45	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1007	12	4	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1008	12	57	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1009	12	2	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1010	12	15	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1011	12	20	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1012	12	89	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1013	12	28	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1014	12	59	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1015	12	39	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1016	12	38	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1017	12	3	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1018	12	17	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1019	12	61	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1020	12	68	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1021	12	90	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1022	12	86	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1023	12	88	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1024	12	1	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1025	12	5	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1026	12	16	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1027	12	74	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1028	12	46	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1029	12	75	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1030	12	30	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1031	12	44	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1032	12	48	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1033	12	67	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1034	12	29	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1035	12	69	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1036	12	56	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1037	12	7	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1038	12	6	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1039	12	62	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1040	12	71	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1041	12	72	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1042	12	58	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1043	12	47	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1044	12	87	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1045	12	40	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1046	12	73	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1047	12	70	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1048	12	27	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1049	12	60	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1050	12	19	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1051	12	18	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1052	12	37	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1053	12	36	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1054	12	31	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1055	12	21	\N	2024-07-28 05:34:55.721365	2024-07-28 05:34:55.721365	\N
1410	21	59	\N	2024-07-28 05:37:53.594278	2024-07-28 05:37:53.594278	\N
1072	8	28	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1073	8	27	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1074	8	68	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1075	8	47	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1076	8	39	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1077	8	58	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1078	8	29	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1079	8	2	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1080	8	56	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1081	8	46	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1082	8	37	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1083	8	74	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1084	8	31	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1085	8	73	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1086	8	48	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1087	8	40	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1088	8	57	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1089	8	3	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1090	8	60	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1056	8	75	297	2024-07-28 05:35:09.438829	2024-07-28 05:35:31.458008	\N
1057	8	70	277	2024-07-28 05:35:09.438829	2024-07-28 05:35:47.421139	\N
1059	8	45	178	2024-07-28 05:35:09.438829	2024-07-28 05:36:20.444048	\N
962	2	16	61	2024-07-28 05:34:37.459426	2024-07-28 05:36:33.591478	\N
1060	8	44	176	2024-07-28 05:35:09.438829	2024-07-28 05:36:38.672214	\N
1061	8	62	246	2024-07-28 05:35:09.438829	2024-07-28 05:37:12.862541	\N
1062	8	61	242	2024-07-28 05:35:09.438829	2024-07-28 05:37:21.354687	\N
1063	8	21	81	2024-07-28 05:35:09.438829	2024-07-28 05:37:25.233402	\N
1064	8	69	274	2024-07-28 05:35:09.438829	2024-07-28 05:37:29.671462	\N
1065	8	86	343	2024-07-28 05:35:09.438829	2024-07-28 05:37:32.629861	\N
1473	23	47	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1069	8	89	\N	2024-07-28 05:35:09.438829	2024-07-28 05:39:37.343802	2024-07-28 05:39:37.341538
1070	8	67	266	2024-07-28 05:35:09.438829	2024-07-28 05:40:00.112631	\N
1071	8	20	\N	2024-07-28 05:35:09.438829	2024-07-28 05:40:48.580861	2024-07-28 05:40:48.56947
1091	8	90	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1092	8	30	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1093	8	15	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1094	8	1	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1095	8	88	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1096	8	59	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1097	8	6	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1098	8	18	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1099	8	16	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1100	8	17	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1101	8	36	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1102	8	87	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1103	8	19	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1104	8	5	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
1105	8	72	\N	2024-07-28 05:35:09.438829	2024-07-28 05:35:09.438829	\N
961	2	6	21	2024-07-28 05:34:37.459426	2024-07-28 05:35:23.114093	\N
224	5	90	358	2024-07-28 05:30:42.376796	2024-07-28 05:36:11.17346	\N
503	10	58	\N	2024-07-28 05:32:03.60837	2024-07-28 05:35:28.78124	2024-07-28 05:35:28.779589
764	16	39	\N	2024-07-28 05:33:46.633048	2024-07-28 05:36:36.422714	2024-07-28 05:36:36.419576
1106	10	58	\N	2024-07-28 05:35:28.93779	2024-07-28 05:35:35.9311	2024-07-28 05:35:35.928954
1107	10	58	230	2024-07-28 05:35:36.179873	2024-07-28 05:35:36.179873	\N
1058	8	7	26	2024-07-28 05:35:09.438829	2024-07-28 05:36:01.067294	\N
1108	12	58	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1109	12	68	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1110	12	56	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1111	12	31	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1112	12	28	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1113	12	69	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1114	12	19	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1115	12	48	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1116	12	71	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1117	12	59	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1118	12	39	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1119	12	75	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1120	12	38	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1121	12	20	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1122	12	60	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1123	12	89	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1124	12	61	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1125	12	72	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1126	12	86	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1127	12	90	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1128	12	2	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1129	12	74	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1130	12	45	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1131	12	7	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1132	12	18	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1133	12	1	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1134	12	87	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1135	12	21	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1136	12	4	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1137	12	16	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1138	12	3	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1139	12	6	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1140	12	57	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1141	12	47	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1142	12	29	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1143	12	27	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1144	12	30	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1145	12	70	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1146	12	44	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1147	12	46	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1148	12	40	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1149	12	15	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1150	12	36	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1151	12	5	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1152	12	17	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1153	12	73	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1154	12	67	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1155	12	88	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1156	12	37	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1157	12	62	\N	2024-07-28 05:36:04.459106	2024-07-28 05:36:04.459106	\N
1158	12	61	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1159	12	74	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1160	12	59	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1161	12	72	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1162	12	38	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1163	12	39	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1164	12	20	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1165	12	46	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1166	12	47	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1167	12	37	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1168	12	73	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1169	12	17	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1170	12	86	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1171	12	62	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1172	12	45	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1173	12	58	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1174	12	71	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1175	12	40	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1176	12	3	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1177	12	21	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1178	12	28	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1179	12	6	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1180	12	4	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1181	12	36	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1182	12	60	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1183	12	69	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1184	12	1	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1185	12	18	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1186	12	75	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1187	12	48	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1188	12	70	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1189	12	67	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1190	12	15	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1191	12	57	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1192	12	5	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1193	12	89	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1194	12	29	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1195	12	87	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1196	12	7	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1197	12	88	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1198	12	30	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1199	12	90	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1200	12	31	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1201	12	19	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1202	12	27	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1203	12	56	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1204	12	68	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1205	12	44	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1206	12	16	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1207	12	2	\N	2024-07-28 05:36:11.149652	2024-07-28 05:36:11.149652	\N
1208	16	39	156	2024-07-28 05:36:38.237165	2024-07-28 05:36:38.237165	\N
114	3	58	\N	2024-07-28 05:30:31.110508	2024-07-28 05:37:00.313021	2024-07-28 05:37:00.307153
1209	3	58	232	2024-07-28 05:37:00.9328	2024-07-28 05:37:00.9328	\N
1210	10	59	234	2024-07-28 05:37:13.910968	2024-07-28 05:37:13.910968	\N
641	13	39	\N	2024-07-28 05:32:28.65064	2024-07-28 05:59:26.127437	2024-07-28 05:59:26.122956
1212	9	39	156	2024-07-28 05:37:34.719462	2024-07-28 05:42:23.180575	\N
1213	9	29	114	2024-07-28 05:37:34.719462	2024-07-28 05:42:28.020402	\N
1214	9	15	\N	2024-07-28 05:37:34.719462	2024-07-28 05:55:43.397816	2024-07-28 05:55:43.396244
1215	9	69	274	2024-07-28 05:37:34.719462	2024-07-28 05:42:54.619296	\N
1216	9	18	71	2024-07-28 05:37:34.719462	2024-07-28 05:44:12.2677	\N
1217	9	3	11	2024-07-28 05:37:34.719462	2024-07-28 05:44:20.633395	\N
1219	9	70	277	2024-07-28 05:37:34.719462	2024-07-28 05:44:32.439374	\N
1435	22	36	141	2024-07-28 05:37:55.342779	2024-07-28 05:57:05.383037	\N
1310	6	62	246	2024-07-28 05:37:34.819981	2024-07-28 05:57:10.390599	\N
1436	22	18	71	2024-07-28 05:37:55.342779	2024-07-28 05:57:31.941945	\N
1437	22	75	298	2024-07-28 05:37:55.342779	2024-07-28 05:57:41.225585	\N
1438	22	21	81	2024-07-28 05:37:55.342779	2024-07-28 05:57:44.482419	\N
229	5	29	115	2024-07-28 05:30:42.376796	2024-07-28 05:37:54.301137	\N
1439	22	86	343	2024-07-28 05:37:55.342779	2024-07-28 05:57:49.133265	\N
1274	6	21	81	2024-07-28 05:37:34.819981	2024-07-28 05:57:54.913613	\N
1443	22	89	\N	2024-07-28 05:37:55.342779	2024-07-28 05:37:55.342779	\N
1242	9	87	347	2024-07-28 05:37:34.719462	2024-07-28 05:38:21.079903	\N
1411	22	88	352	2024-07-28 05:37:55.342779	2024-07-28 05:38:22.230384	\N
1243	9	56	223	2024-07-28 05:37:34.719462	2024-07-28 05:38:43.736218	\N
1244	9	86	343	2024-07-28 05:37:34.719462	2024-07-28 05:38:48.574544	\N
1245	9	44	176	2024-07-28 05:37:34.719462	2024-07-28 05:38:51.36117	\N
1246	9	7	26	2024-07-28 05:37:34.719462	2024-07-28 05:38:55.095159	\N
1247	9	45	178	2024-07-28 05:37:34.719462	2024-07-28 05:39:03.16726	\N
1278	6	59	234	2024-07-28 05:37:34.819981	2024-07-28 05:39:03.64997	\N
1248	9	89	355	2024-07-28 05:37:34.719462	2024-07-28 05:39:09.165782	\N
1249	9	68	269	2024-07-28 05:37:34.719462	2024-07-28 05:39:11.51518	\N
1250	9	6	21	2024-07-28 05:37:34.719462	2024-07-28 05:39:14.337324	\N
1251	9	20	79	2024-07-28 05:37:34.719462	2024-07-28 05:39:30.076256	\N
1280	6	38	152	2024-07-28 05:37:34.819981	2024-07-28 05:39:39.211273	\N
1252	9	48	\N	2024-07-28 05:37:34.719462	2024-07-28 05:50:39.439373	2024-07-28 05:50:39.438121
1253	9	4	13	2024-07-28 05:37:34.719462	2024-07-28 05:39:48.1459	\N
1254	9	40	159	2024-07-28 05:37:34.719462	2024-07-28 05:39:57.568608	\N
1255	9	73	290	2024-07-28 05:37:34.719462	2024-07-28 05:40:05.058989	\N
1256	9	62	246	2024-07-28 05:37:34.719462	2024-07-28 05:40:17.156903	\N
1283	6	89	355	2024-07-28 05:37:34.819981	2024-07-28 05:40:52.714015	\N
1258	9	38	151	2024-07-28 05:37:34.719462	2024-07-28 05:41:03.955976	\N
1260	9	47	187	2024-07-28 05:37:34.719462	2024-07-28 05:41:18.951646	\N
1412	22	60	238	2024-07-28 05:37:55.342779	2024-07-28 05:42:12.760449	\N
1287	6	29	114	2024-07-28 05:37:34.819981	2024-07-28 05:42:37.003699	\N
1413	22	72	287	2024-07-28 05:37:55.342779	2024-07-28 05:43:12.145377	\N
1290	6	67	266	2024-07-28 05:37:34.819981	2024-07-28 05:44:20.765084	\N
1220	9	30	117	2024-07-28 05:37:34.719462	2024-07-28 05:44:37.839801	\N
1414	22	57	227	2024-07-28 05:37:55.342779	2024-07-28 05:44:38.98128	\N
1221	9	1	4	2024-07-28 05:37:34.719462	2024-07-28 05:44:41.103337	\N
1222	9	72	287	2024-07-28 05:37:34.719462	2024-07-28 05:44:45.415376	\N
1223	9	71	282	2024-07-28 05:37:34.719462	2024-07-28 05:44:50.994851	\N
1291	6	48	\N	2024-07-28 05:37:34.819981	2024-07-28 06:17:14.777168	2024-07-28 06:17:14.774489
1416	22	30	119	2024-07-28 05:37:55.342779	2024-07-28 05:45:19.612678	\N
1224	9	61	242	2024-07-28 05:37:34.719462	2024-07-28 05:45:20.444125	\N
1225	9	67	266	2024-07-28 05:37:34.719462	2024-07-28 05:45:24.777798	\N
1226	9	28	110	2024-07-28 05:37:34.719462	2024-07-28 05:45:32.514876	\N
1227	9	75	\N	2024-07-28 05:37:34.719462	2024-07-28 05:45:37.130199	2024-07-28 05:45:37.126235
1292	6	90	358	2024-07-28 05:37:34.819981	2024-07-28 05:45:54.250538	\N
1228	9	59	235	2024-07-28 05:37:34.719462	2024-07-28 05:46:05.731843	\N
1229	9	74	295	2024-07-28 05:37:34.719462	2024-07-28 05:46:12.414458	\N
1230	9	37	147	2024-07-28 05:37:34.719462	2024-07-28 05:46:41.246158	\N
1231	9	60	238	2024-07-28 05:37:34.719462	2024-07-28 05:46:56.308581	\N
1232	9	21	81	2024-07-28 05:37:34.719462	2024-07-28 05:47:02.197235	\N
1233	9	88	352	2024-07-28 05:37:34.719462	2024-07-28 05:47:09.143945	\N
1234	9	19	76	2024-07-28 05:37:34.719462	2024-07-28 05:47:16.886053	\N
1235	9	27	105	2024-07-28 05:37:34.719462	2024-07-28 05:47:29.828087	\N
1236	9	36	141	2024-07-28 05:37:34.719462	2024-07-28 05:47:50.107006	\N
1295	6	19	\N	2024-07-28 05:37:34.819981	2024-07-28 05:47:58.391815	2024-07-28 05:47:58.390271
1417	22	39	156	2024-07-28 05:37:55.342779	2024-07-28 05:47:57.727433	\N
1237	9	31	122	2024-07-28 05:37:34.719462	2024-07-28 05:48:01.968315	\N
1418	22	6	21	2024-07-28 05:37:55.342779	2024-07-28 05:48:06.671268	\N
1238	9	5	20	2024-07-28 05:37:34.719462	2024-07-28 05:48:15.91622	\N
1239	9	58	230	2024-07-28 05:37:34.719462	2024-07-28 05:48:25.046507	\N
1419	22	16	63	2024-07-28 05:37:55.342779	2024-07-28 05:48:51.570464	\N
1240	9	16	63	2024-07-28 05:37:34.719462	2024-07-28 05:48:51.735661	\N
1421	22	40	159	2024-07-28 05:37:55.342779	2024-07-28 05:49:11.884571	\N
1296	6	31	122	2024-07-28 05:37:34.819981	2024-07-28 05:49:16.321164	\N
1422	22	70	277	2024-07-28 05:37:55.342779	2024-07-28 05:49:22.285446	\N
1297	6	58	230	2024-07-28 05:37:34.819981	2024-07-28 05:49:24.745198	\N
1423	22	7	26	2024-07-28 05:37:55.342779	2024-07-28 05:49:36.295878	\N
1424	22	73	290	2024-07-28 05:37:55.342779	2024-07-28 05:49:58.655614	\N
1425	22	48	192	2024-07-28 05:37:55.342779	2024-07-28 05:50:11.779622	\N
1298	6	47	187	2024-07-28 05:37:34.819981	2024-07-28 05:50:41.986096	\N
1300	6	88	352	2024-07-28 05:37:34.819981	2024-07-28 05:51:14.569966	\N
1257	9	46	181	2024-07-28 05:37:34.719462	2024-07-28 05:51:46.286037	\N
1301	6	70	277	2024-07-28 05:37:34.819981	2024-07-28 05:51:48.375242	\N
1259	9	17	66	2024-07-28 05:37:34.719462	2024-07-28 05:52:08.005278	\N
1303	6	75	298	2024-07-28 05:37:34.819981	2024-07-28 05:52:12.775617	\N
1426	22	5	20	2024-07-28 05:37:55.342779	2024-07-28 05:53:13.713906	\N
1427	22	15	58	2024-07-28 05:37:55.342779	2024-07-28 05:53:37.036349	\N
1428	22	4	13	2024-07-28 05:37:55.342779	2024-07-28 05:53:41.549812	\N
1304	6	69	274	2024-07-28 05:37:34.819981	2024-07-28 05:53:45.298272	\N
1306	6	61	242	2024-07-28 05:37:34.819981	2024-07-28 05:54:03.117809	\N
1429	22	17	\N	2024-07-28 05:37:55.342779	2024-07-28 05:54:27.804653	2024-07-28 05:54:27.803151
1430	22	1	4	2024-07-28 05:37:55.342779	2024-07-28 05:54:47.208976	\N
1431	22	2	7	2024-07-28 05:37:55.342779	2024-07-28 05:55:03.37985	\N
1432	22	68	269	2024-07-28 05:37:55.342779	2024-07-28 05:55:16.949635	\N
1433	22	29	114	2024-07-28 05:37:55.342779	2024-07-28 05:55:32.233005	\N
1308	6	46	181	2024-07-28 05:37:34.819981	2024-07-28 05:56:27.808057	\N
1275	6	87	347	2024-07-28 05:37:34.819981	2024-07-28 05:58:00.635538	\N
1276	6	57	226	2024-07-28 05:37:34.819981	2024-07-28 05:58:05.034995	\N
1440	22	46	181	2024-07-28 05:37:55.342779	2024-07-28 05:58:50.040002	\N
1273	6	44	174	2024-07-28 05:37:34.819981	2024-07-28 05:59:13.544116	\N
1441	22	71	282	2024-07-28 05:37:55.342779	2024-07-28 05:59:54.251586	\N
1442	22	38	151	2024-07-28 05:37:55.342779	2024-07-28 06:00:03.930836	\N
1444	22	67	266	2024-07-28 05:37:55.342779	2024-07-28 06:00:12.073677	\N
1272	6	60	238	2024-07-28 05:37:34.819981	2024-07-28 06:00:33.175631	\N
1445	22	19	76	2024-07-28 05:37:55.342779	2024-07-28 06:00:53.401951	\N
1271	6	2	7	2024-07-28 05:37:34.819981	2024-07-28 06:01:04.118229	\N
1446	22	59	235	2024-07-28 05:37:55.342779	2024-07-28 06:01:21.345065	\N
1447	22	20	79	2024-07-28 05:37:55.342779	2024-07-28 06:01:50.894054	\N
1448	22	28	110	2024-07-28 05:37:55.342779	2024-07-28 06:02:05.744761	\N
1270	6	27	105	2024-07-28 05:37:34.819981	2024-07-28 06:02:16.033328	\N
1268	6	28	110	2024-07-28 05:37:34.819981	2024-07-28 06:02:30.248201	\N
1267	6	37	\N	2024-07-28 05:37:34.819981	2024-07-28 06:03:02.185875	2024-07-28 06:03:02.183674
1449	22	37	147	2024-07-28 05:37:55.342779	2024-07-28 06:03:50.653656	\N
1264	6	6	21	2024-07-28 05:37:34.819981	2024-07-28 06:04:10.371001	\N
1450	22	3	11	2024-07-28 05:37:55.342779	2024-07-28 06:05:19.384445	\N
1262	6	1	4	2024-07-28 05:37:34.819981	2024-07-28 06:05:22.867082	\N
1451	22	47	187	2024-07-28 05:37:55.342779	2024-07-28 06:05:40.030102	\N
1452	22	87	347	2024-07-28 05:37:55.342779	2024-07-28 06:05:53.182493	\N
1453	22	27	105	2024-07-28 05:37:55.342779	2024-07-28 06:06:11.383232	\N
1454	22	45	178	2024-07-28 05:37:55.342779	2024-07-28 06:06:25.747423	\N
1261	6	72	288	2024-07-28 05:37:34.819981	2024-07-28 06:06:36.885446	\N
1266	6	39	156	2024-07-28 05:37:34.819981	2024-07-28 06:08:35.468934	\N
1279	6	56	223	2024-07-28 05:37:34.819981	2024-07-28 06:09:36.763989	\N
1281	6	18	72	2024-07-28 05:37:34.819981	2024-07-28 06:09:58.641385	\N
1284	6	40	157	2024-07-28 05:37:34.819981	2024-07-28 06:10:38.931855	\N
1285	6	16	63	2024-07-28 05:37:34.819981	2024-07-28 06:11:11.113981	\N
1286	6	45	178	2024-07-28 05:37:34.819981	2024-07-28 06:11:36.777593	\N
1288	6	17	66	2024-07-28 05:37:34.819981	2024-07-28 06:12:07.405957	\N
1289	6	36	141	2024-07-28 05:37:34.819981	2024-07-28 06:12:16.137326	\N
1293	6	15	\N	2024-07-28 05:37:34.819981	2024-07-28 06:17:21.425671	2024-07-28 06:17:21.42374
1299	6	3	10	2024-07-28 05:37:34.819981	2024-07-28 06:13:20.59527	\N
1305	6	71	282	2024-07-28 05:37:34.819981	2024-07-28 06:13:31.96111	\N
1309	6	20	79	2024-07-28 05:37:34.819981	2024-07-28 06:14:14.652378	\N
1265	6	73	290	2024-07-28 05:37:34.819981	2024-07-28 06:16:17.93406	\N
1474	23	69	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1475	23	16	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1476	23	86	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1477	23	72	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1478	23	28	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1479	23	3	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1480	23	46	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1481	23	4	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1482	23	48	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1483	23	40	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1484	23	7	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1485	23	37	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1486	23	71	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1487	23	73	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1488	23	62	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1489	23	45	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1490	23	75	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1491	23	29	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1492	23	30	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1493	23	56	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1494	23	67	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1495	23	61	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1496	23	60	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1497	23	87	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1498	23	44	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1499	23	1	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1500	23	18	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1501	23	36	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1502	23	27	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1503	23	15	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1504	23	39	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1505	23	6	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1506	23	70	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1507	23	19	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1508	23	58	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1509	23	2	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1510	23	21	\N	2024-07-28 05:38:14.718625	2024-07-28 05:38:14.718625	\N
1241	9	2	7	2024-07-28 05:37:34.719462	2024-07-28 05:38:16.406606	\N
814	17	3	12	2024-07-28 05:34:10.670885	2024-07-28 05:38:20.819657	\N
1067	8	4	13	2024-07-28 05:35:09.438829	2024-07-28 05:38:21.684253	\N
1311	20	30	117	2024-07-28 05:37:52.274356	2024-07-28 05:38:34.634797	\N
1511	5	89	355	2024-07-28 05:38:39.973609	2024-07-28 05:38:39.973609	\N
1277	6	74	295	2024-07-28 05:37:34.819981	2024-07-28 05:38:42.768881	\N
1512	2	67	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1513	2	44	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1514	2	45	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1515	2	37	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1516	2	16	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1517	2	71	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1518	2	17	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1519	2	28	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1520	2	29	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1521	2	57	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1522	2	74	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1523	2	20	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1525	2	69	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1526	2	3	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1527	2	88	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1528	2	31	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1529	2	58	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1530	2	87	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1531	2	1	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1532	2	38	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1533	2	4	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1534	2	75	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1535	2	15	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1536	2	2	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1537	2	72	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1538	2	73	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1539	2	7	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1540	2	68	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1541	2	48	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1542	2	90	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1543	2	40	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1544	2	39	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1545	2	86	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1546	2	19	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1547	2	70	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1548	2	5	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1549	2	30	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1550	2	27	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1551	2	89	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1552	2	56	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1553	2	60	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1554	2	36	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1555	2	18	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1556	2	62	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1557	2	6	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1558	2	21	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1559	2	59	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1560	2	47	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
1561	2	46	\N	2024-07-28 05:38:51.69762	2024-07-28 05:38:51.69762	\N
231	5	74	\N	2024-07-28 05:30:42.376796	2024-07-28 05:39:01.493907	2024-07-28 05:39:01.488248
1564	23	59	235	2024-07-28 05:39:30.577495	2024-07-28 05:39:58.542477	\N
1562	5	74	\N	2024-07-28 05:39:02.431595	2024-07-28 05:39:03.205013	2024-07-28 05:39:03.203391
1563	5	74	295	2024-07-28 05:39:09.406544	2024-07-28 05:39:09.406544	\N
2793	13	39	154	2024-07-28 05:59:26.880768	2024-07-28 05:59:26.880768	\N
1524	2	61	\N	2024-07-28 05:38:51.69762	2024-07-28 05:39:09.877518	2024-07-28 05:39:09.874871
1068	8	71	\N	2024-07-28 05:35:09.438829	2024-07-28 05:39:13.99597	2024-07-28 05:39:13.994282
666	14	4	13	2024-07-28 05:32:30.355533	2024-07-28 05:39:23.134614	\N
1565	23	16	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1566	23	75	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1567	23	60	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1568	23	87	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1569	23	58	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1570	23	6	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1571	23	68	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1572	23	3	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1573	23	39	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1574	23	19	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1575	23	36	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1576	23	89	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1577	23	71	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1578	23	38	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1579	23	40	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1580	23	90	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1581	23	2	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1582	23	88	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1583	23	27	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1584	23	48	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1585	23	18	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1586	23	46	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1587	23	21	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1588	23	4	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1589	23	28	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1590	23	86	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1591	23	56	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1592	23	31	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1593	23	70	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1594	23	67	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1595	23	45	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
2852	26	1	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2853	26	68	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2854	26	7	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2855	26	16	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
1596	23	72	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1597	23	69	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1598	23	74	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1599	23	61	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1600	23	37	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1601	23	62	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1602	23	44	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1603	23	20	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1604	23	1	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1605	23	30	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1606	23	73	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1607	23	47	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1608	23	15	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1609	23	7	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1610	23	29	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1611	23	5	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1612	23	57	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1613	23	17	\N	2024-07-28 05:39:30.577495	2024-07-28 05:39:30.577495	\N
1614	20	61	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1618	20	16	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1619	20	29	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1620	20	46	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1621	20	4	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1622	20	40	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1623	20	3	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1624	20	7	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1625	20	86	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1626	20	58	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1627	20	6	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1628	20	37	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1629	20	5	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1630	20	30	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1631	20	20	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1632	20	72	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1633	20	39	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1634	20	57	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1635	20	18	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1636	20	19	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1637	20	89	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1638	20	15	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1639	20	38	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1640	20	67	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1641	20	74	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1642	20	87	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1643	20	88	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1645	20	60	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1646	20	36	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1647	20	28	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1648	20	44	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1649	20	48	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1650	20	1	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1651	20	71	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1652	20	70	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1653	20	27	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1654	20	90	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1655	20	73	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1656	20	47	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1657	20	75	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1658	20	45	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1659	20	62	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1660	20	59	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1661	20	68	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1662	20	31	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1663	20	56	\N	2024-07-28 05:39:34.745039	2024-07-28 05:39:34.745039	\N
1616	20	2	7	2024-07-28 05:39:34.745039	2024-07-28 05:40:20.749019	\N
1282	6	5	\N	2024-07-28 05:37:34.819981	2024-07-28 05:40:02.886379	2024-07-28 05:40:02.884454
1664	24	37	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1665	24	68	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1666	24	6	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1667	24	19	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1668	24	89	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1669	24	15	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1670	24	87	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1671	24	90	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1672	24	56	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1673	24	88	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1674	24	47	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1675	24	45	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1676	24	46	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1677	24	69	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1678	24	74	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1679	24	39	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1680	24	61	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1681	24	1	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1682	24	60	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1683	24	28	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1684	24	62	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1685	24	30	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1686	24	75	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1687	24	7	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1688	24	71	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1689	24	16	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1690	24	17	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1691	24	72	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1692	24	36	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1693	24	70	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1694	24	31	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1695	24	86	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1696	24	29	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1697	24	44	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1698	24	57	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1699	24	67	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1700	24	59	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1701	24	4	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1702	24	48	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1703	24	3	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1704	24	20	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1705	24	18	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1706	24	5	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1707	24	58	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1708	24	40	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1709	24	27	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1710	24	73	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1711	24	21	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1712	24	2	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1713	24	38	\N	2024-07-28 05:40:06.21999	2024-07-28 05:40:06.21999	\N
1615	20	21	81	2024-07-28 05:39:34.745039	2024-07-28 05:40:09.086322	\N
1714	6	5	20	2024-07-28 05:40:15.446534	2024-07-28 05:40:15.446534	\N
1362	21	57	227	2024-07-28 05:37:53.594278	2024-07-28 05:40:28.359931	\N
354	8	20	\N	2024-07-28 05:31:40.570967	2024-07-28 05:40:49.113196	2024-07-28 05:40:49.108422
1715	25	3	11	2024-07-28 05:41:01.17252	2024-07-28 05:41:15.790725	\N
1716	25	47	187	2024-07-28 05:41:01.17252	2024-07-28 05:41:30.218727	\N
1717	25	28	110	2024-07-28 05:41:01.17252	2024-07-28 05:41:38.258718	\N
1718	25	57	227	2024-07-28 05:41:01.17252	2024-07-28 05:41:47.259343	\N
1719	25	72	287	2024-07-28 05:41:01.17252	2024-07-28 05:41:52.853256	\N
1720	25	16	63	2024-07-28 05:41:01.17252	2024-07-28 05:42:04.49035	\N
1721	25	48	192	2024-07-28 05:41:01.17252	2024-07-28 05:42:14.686115	\N
1722	25	88	352	2024-07-28 05:41:01.17252	2024-07-28 05:42:21.273982	\N
1723	25	75	298	2024-07-28 05:41:01.17252	2024-07-28 05:42:25.759689	\N
1725	25	86	343	2024-07-28 05:41:01.17252	2024-07-28 05:42:36.032624	\N
1726	25	45	178	2024-07-28 05:41:01.17252	2024-07-28 05:42:49.406606	\N
1727	25	46	181	2024-07-28 05:41:01.17252	2024-07-28 05:42:56.795204	\N
1644	20	69	\N	2024-07-28 05:39:34.745039	2024-07-28 05:53:49.590772	2024-07-28 05:53:49.589188
1765	23	16	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1766	23	21	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1767	23	72	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1768	23	27	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1769	23	67	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1770	23	57	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1771	23	2	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1772	23	40	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1773	23	47	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1774	23	38	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1775	23	4	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1776	23	88	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1777	23	30	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1778	23	46	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1779	23	3	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1780	23	89	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1781	23	1	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1783	23	18	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1784	23	6	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1785	23	28	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1786	23	29	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1787	23	73	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1788	23	36	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1789	23	86	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1790	23	74	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1791	23	69	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1792	23	37	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1793	23	44	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1794	23	31	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1795	23	60	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1796	23	90	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1797	23	87	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1798	23	19	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1799	23	17	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1800	23	15	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1801	23	68	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1802	23	56	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1803	23	70	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1804	23	62	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1805	23	7	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1806	23	45	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1807	23	58	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1808	23	20	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1809	23	48	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1810	23	5	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1811	23	39	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1812	23	61	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1813	23	71	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1814	23	75	\N	2024-07-28 05:41:05.116557	2024-07-28 05:41:05.116557	\N
1782	23	59	235	2024-07-28 05:41:05.116557	2024-07-28 05:41:08.727241	\N
1728	25	58	230	2024-07-28 05:41:01.17252	2024-07-28 05:43:00.10622	\N
1617	20	17	\N	2024-07-28 05:39:34.745039	2024-07-28 05:41:10.944928	2024-07-28 05:41:10.942371
1815	23	72	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1816	23	86	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1817	23	48	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1818	23	90	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1819	23	15	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1820	23	18	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1821	23	27	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1822	23	1	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1823	23	4	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1824	23	28	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1825	23	57	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1826	23	5	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1827	23	74	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1828	23	29	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1829	23	67	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1830	23	56	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1831	23	3	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1832	23	62	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1833	23	2	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1834	23	40	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1835	23	7	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1836	23	36	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1837	23	59	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1838	23	44	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1839	23	30	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1840	23	21	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1841	23	60	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1842	23	38	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1843	23	19	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1844	23	68	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1845	23	16	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1846	23	88	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1847	23	46	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1848	23	31	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1849	23	61	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1850	23	39	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1851	23	20	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1852	23	58	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1853	23	6	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1854	23	17	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1855	23	73	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1856	23	47	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1857	23	45	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1858	23	69	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1729	25	36	141	2024-07-28 05:41:01.17252	2024-07-28 05:43:12.323965	\N
1730	25	44	174	2024-07-28 05:41:01.17252	2024-07-28 05:43:16.961891	\N
1731	25	17	66	2024-07-28 05:41:01.17252	2024-07-28 05:43:28.860076	\N
1732	25	37	147	2024-07-28 05:41:01.17252	2024-07-28 05:43:37.211628	\N
1733	25	30	117	2024-07-28 05:41:01.17252	2024-07-28 05:43:51.472972	\N
1734	25	18	71	2024-07-28 05:41:01.17252	2024-07-28 05:44:00.322382	\N
1735	25	69	274	2024-07-28 05:41:01.17252	2024-07-28 05:44:08.977804	\N
1736	25	40	159	2024-07-28 05:41:01.17252	2024-07-28 05:44:24.191887	\N
1737	25	70	277	2024-07-28 05:41:01.17252	2024-07-28 05:44:31.30568	\N
1738	25	5	20	2024-07-28 05:41:01.17252	2024-07-28 05:44:41.945314	\N
1739	25	7	26	2024-07-28 05:41:01.17252	2024-07-28 05:44:49.120018	\N
1740	25	29	114	2024-07-28 05:41:01.17252	2024-07-28 05:45:00.095019	\N
1741	25	39	156	2024-07-28 05:41:01.17252	2024-07-28 05:45:09.762599	\N
1742	25	60	238	2024-07-28 05:41:01.17252	2024-07-28 05:45:19.129341	\N
1743	25	71	282	2024-07-28 05:41:01.17252	2024-07-28 05:45:37.280343	\N
1744	25	68	269	2024-07-28 05:41:01.17252	2024-07-28 05:45:47.7182	\N
1745	25	38	151	2024-07-28 05:41:01.17252	2024-07-28 05:45:59.252591	\N
1746	25	56	223	2024-07-28 05:41:01.17252	2024-07-28 05:46:13.103233	\N
1747	25	20	79	2024-07-28 05:41:01.17252	2024-07-28 05:46:19.069235	\N
1748	25	2	7	2024-07-28 05:41:01.17252	2024-07-28 05:46:26.703285	\N
1749	25	74	295	2024-07-28 05:41:01.17252	2024-07-28 05:46:33.756125	\N
1750	25	6	21	2024-07-28 05:41:01.17252	2024-07-28 05:46:37.753276	\N
1751	25	87	347	2024-07-28 05:41:01.17252	2024-07-28 05:46:41.620863	\N
1752	25	67	266	2024-07-28 05:41:01.17252	2024-07-28 05:46:54.280669	\N
1753	25	21	81	2024-07-28 05:41:01.17252	2024-07-28 05:46:58.538415	\N
1754	25	4	13	2024-07-28 05:41:01.17252	2024-07-28 05:47:01.939742	\N
1755	25	27	105	2024-07-28 05:41:01.17252	2024-07-28 05:47:14.225259	\N
1756	25	90	358	2024-07-28 05:41:01.17252	2024-07-28 05:47:19.169844	\N
1757	25	15	\N	2024-07-28 05:41:01.17252	2024-07-28 05:47:38.695331	2024-07-28 05:47:38.69361
1758	25	62	246	2024-07-28 05:41:01.17252	2024-07-28 05:48:14.868114	\N
1759	25	89	355	2024-07-28 05:41:01.17252	2024-07-28 05:48:24.014297	\N
1760	25	1	\N	2024-07-28 05:41:01.17252	2024-07-28 05:48:41.366105	2024-07-28 05:48:41.364151
1761	25	31	122	2024-07-28 05:41:01.17252	2024-07-28 05:49:03.878832	\N
1762	25	73	290	2024-07-28 05:41:01.17252	2024-07-28 05:49:11.946013	\N
1763	25	59	235	2024-07-28 05:41:01.17252	2024-07-28 05:49:22.686429	\N
1764	25	19	76	2024-07-28 05:41:01.17252	2024-07-28 05:49:31.311126	\N
1859	23	70	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1860	23	75	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1861	23	87	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1862	23	37	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1863	23	71	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1864	23	89	\N	2024-07-28 05:41:13.527414	2024-07-28 05:41:13.527414	\N
1865	8	20	80	2024-07-28 05:41:34.371007	2024-07-28 05:41:34.371007	\N
165	4	48	\N	2024-07-28 05:30:33.789462	2024-07-28 05:41:37.341744	2024-07-28 05:41:37.339813
1866	24	69	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1867	24	58	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1868	24	20	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1869	24	4	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1870	24	90	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1871	24	17	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1872	24	70	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1873	24	67	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1874	24	47	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1875	24	19	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1876	24	21	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1877	24	28	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1878	24	59	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1879	24	46	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1880	24	1	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1881	24	2	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1882	24	40	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1883	24	38	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1884	24	16	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1885	24	57	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1886	24	30	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1887	24	88	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1888	24	74	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1889	24	56	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1890	24	6	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1891	24	3	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1892	24	31	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1893	24	44	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1894	24	71	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1895	24	72	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1896	24	48	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1897	24	60	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1898	24	75	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1899	24	68	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1900	24	18	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1901	24	87	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1902	24	86	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1903	24	61	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1904	24	37	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1905	24	73	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1906	24	29	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1907	24	27	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1908	24	62	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1909	24	39	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1910	24	7	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1911	24	5	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1912	24	45	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1913	24	15	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1914	24	36	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
1915	24	89	\N	2024-07-28 05:41:53.968754	2024-07-28 05:41:53.968754	\N
245	5	3	\N	2024-07-28 05:30:42.376796	2024-07-28 05:41:54.564727	2024-07-28 05:41:54.558947
1916	5	3	11	2024-07-28 05:41:55.314894	2024-07-28 05:41:55.314894	\N
1919	24	61	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1920	24	90	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1921	24	60	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1922	24	5	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1923	24	88	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1924	24	30	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1925	24	73	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1926	24	58	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1927	24	4	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1928	24	20	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1929	24	68	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1930	24	75	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1931	24	74	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1932	24	16	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1933	24	40	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1934	24	86	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1935	24	89	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1936	24	37	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1937	24	18	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1938	24	29	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1939	24	19	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1940	24	59	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1941	24	17	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1942	24	87	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1943	24	71	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1944	24	47	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1945	24	39	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1946	24	45	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1947	24	38	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1948	24	57	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1949	24	67	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1950	24	2	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1951	24	28	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1952	24	69	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1953	24	72	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1954	24	70	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1955	24	31	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1956	24	44	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1957	24	36	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1958	24	21	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1959	24	46	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1960	24	6	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1961	24	62	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1962	24	27	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1963	24	7	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1964	24	56	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1965	24	1	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1966	24	48	\N	2024-07-28 05:41:57.168075	2024-07-28 05:41:57.168075	\N
1967	8	45	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1968	8	48	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1969	8	44	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1970	8	59	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1971	8	37	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1972	8	89	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1973	8	57	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1974	8	90	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1975	8	6	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1976	8	1	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1977	8	87	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1978	8	61	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1979	8	56	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1980	8	39	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1981	8	29	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1982	8	16	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1983	8	7	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1984	8	2	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1985	8	46	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1986	8	36	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1987	8	28	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1988	8	5	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1989	8	74	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1917	24	3	9	2024-07-28 05:41:57.168075	2024-07-28 05:43:48.350517	\N
1918	24	15	58	2024-07-28 05:41:57.168075	2024-07-28 05:51:41.237624	\N
2794	26	46	\N	2024-07-28 06:00:40.33191	2024-07-28 06:00:41.876865	2024-07-28 06:00:41.875025
1990	8	15	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1991	8	62	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1992	8	19	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1993	8	38	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1994	8	18	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1995	8	17	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1996	8	60	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1997	8	69	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1998	8	73	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1999	8	30	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2000	8	31	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2001	8	3	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2002	8	58	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2003	8	71	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2004	8	70	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2005	8	68	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2006	8	27	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2007	8	21	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2008	8	47	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2009	8	86	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2010	8	75	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2011	8	67	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2012	8	40	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2014	8	72	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2015	8	88	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
2016	8	4	\N	2024-07-28 05:41:57.345678	2024-07-28 05:41:57.345678	\N
1211	9	90	358	2024-07-28 05:37:34.719462	2024-07-28 05:42:00.560122	\N
774	16	47	187	2024-07-28 05:33:46.633048	2024-07-28 05:42:06.352763	\N
673	14	45	178	2024-07-28 05:32:30.355533	2024-07-28 05:42:07.205526	\N
2100	20	17	66	2024-07-28 05:42:57.414288	2024-07-28 05:43:05.236731	\N
2013	8	20	\N	2024-07-28 05:41:57.345678	2024-07-28 05:42:13.99452	2024-07-28 05:42:13.992597
2017	5	15	57	2024-07-28 05:42:22.817366	2024-07-28 05:42:22.817366	\N
2018	4	48	192	2024-07-28 05:42:26.999879	2024-07-28 05:42:26.999879	\N
1724	25	61	242	2024-07-28 05:41:01.17252	2024-07-28 05:42:30.064205	\N
2019	21	57	\N	2024-07-28 05:42:41.06406	2024-07-28 05:42:41.06406	\N
2020	21	15	\N	2024-07-28 05:42:41.06406	2024-07-28 05:42:41.06406	\N
2069	5	5	20	2024-07-28 05:42:41.829549	2024-07-28 05:42:41.829549	\N
2070	20	20	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2071	20	62	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2072	20	29	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2073	20	70	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2074	20	57	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2075	20	48	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2076	20	19	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2077	20	89	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2078	20	46	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2079	20	7	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2080	20	18	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2081	20	36	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2082	20	3	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2083	20	61	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2084	20	39	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2085	20	21	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2086	20	71	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2087	20	87	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2088	20	27	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2089	20	37	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2090	20	47	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2091	20	28	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2092	20	31	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2093	20	45	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2094	20	56	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2095	20	75	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2097	20	6	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2098	20	73	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2099	20	72	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2101	20	1	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2102	20	38	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2103	20	60	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2104	20	30	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2105	20	74	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2106	20	16	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2107	20	4	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2108	20	2	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2109	20	15	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2110	20	5	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2111	20	68	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2112	20	67	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2113	20	90	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2114	20	88	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2115	20	40	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2116	20	59	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2118	20	58	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
2021	21	71	282	2024-07-28 05:42:41.06406	2024-07-28 05:47:32.670591	\N
2022	21	2	7	2024-07-28 05:42:41.06406	2024-07-28 05:47:36.363829	\N
2023	21	17	66	2024-07-28 05:42:41.06406	2024-07-28 05:47:41.344675	\N
2024	21	56	223	2024-07-28 05:42:41.06406	2024-07-28 05:48:18.592146	\N
2025	21	40	159	2024-07-28 05:42:41.06406	2024-07-28 05:49:00.21462	\N
2026	21	6	21	2024-07-28 05:42:41.06406	2024-07-28 05:49:04.987022	\N
2027	21	67	266	2024-07-28 05:42:41.06406	2024-07-28 05:49:17.312163	\N
2028	21	89	355	2024-07-28 05:42:41.06406	2024-07-28 05:49:30.206181	\N
2029	21	68	269	2024-07-28 05:42:41.06406	2024-07-28 05:49:36.271224	\N
2030	21	20	79	2024-07-28 05:42:41.06406	2024-07-28 05:51:13.337909	\N
2031	21	61	242	2024-07-28 05:42:41.06406	2024-07-28 05:52:00.098607	\N
2032	21	75	298	2024-07-28 05:42:41.06406	2024-07-28 05:52:05.463539	\N
2096	20	69	\N	2024-07-28 05:42:57.414288	2024-07-28 05:53:43.625059	2024-07-28 05:53:43.61897
2117	20	44	176	2024-07-28 05:42:57.414288	2024-07-28 05:54:17.669372	\N
2033	21	3	11	2024-07-28 05:42:41.06406	2024-07-28 06:00:05.890935	\N
2034	21	73	290	2024-07-28 05:42:41.06406	2024-07-28 06:00:07.684571	\N
2035	21	45	178	2024-07-28 05:42:41.06406	2024-07-28 06:02:06.661178	\N
2036	21	86	343	2024-07-28 05:42:41.06406	2024-07-28 06:02:10.158463	\N
2037	21	60	238	2024-07-28 05:42:41.06406	2024-07-28 06:03:17.156957	\N
2038	21	47	187	2024-07-28 05:42:41.06406	2024-07-28 06:03:29.795345	\N
2039	21	1	4	2024-07-28 05:42:41.06406	2024-07-28 06:03:36.84231	\N
2040	21	19	76	2024-07-28 05:42:41.06406	2024-07-28 06:03:40.782852	\N
2041	21	29	114	2024-07-28 05:42:41.06406	2024-07-28 06:03:51.32584	\N
2042	21	4	13	2024-07-28 05:42:41.06406	2024-07-28 06:03:58.355395	\N
2043	21	31	122	2024-07-28 05:42:41.06406	2024-07-28 06:04:04.840537	\N
2044	21	70	277	2024-07-28 05:42:41.06406	2024-07-28 06:04:20.450039	\N
2046	21	48	192	2024-07-28 05:42:41.06406	2024-07-28 06:04:42.714033	\N
2047	21	27	105	2024-07-28 05:42:41.06406	2024-07-28 06:05:06.596043	\N
2048	21	72	287	2024-07-28 05:42:41.06406	2024-07-28 06:07:05.338383	\N
2049	21	7	26	2024-07-28 05:42:41.06406	2024-07-28 06:07:13.361391	\N
2050	21	69	274	2024-07-28 05:42:41.06406	2024-07-28 06:07:16.754653	\N
2051	21	39	156	2024-07-28 05:42:41.06406	2024-07-28 06:07:58.301677	\N
2052	21	37	147	2024-07-28 05:42:41.06406	2024-07-28 06:08:53.698973	\N
2053	21	88	352	2024-07-28 05:42:41.06406	2024-07-28 06:08:59.683113	\N
2054	21	87	347	2024-07-28 05:42:41.06406	2024-07-28 06:09:06.822855	\N
2055	21	74	295	2024-07-28 05:42:41.06406	2024-07-28 06:09:34.139799	\N
2056	21	30	117	2024-07-28 05:42:41.06406	2024-07-28 06:09:52.231487	\N
2057	21	44	176	2024-07-28 05:42:41.06406	2024-07-28 06:09:55.621875	\N
2058	21	18	71	2024-07-28 05:42:41.06406	2024-07-28 06:10:21.773714	\N
2059	21	59	235	2024-07-28 05:42:41.06406	2024-07-28 06:10:27.813825	\N
2061	21	21	81	2024-07-28 05:42:41.06406	2024-07-28 06:10:38.015248	\N
2062	21	16	63	2024-07-28 05:42:41.06406	2024-07-28 06:10:54.741166	\N
2063	21	5	20	2024-07-28 05:42:41.06406	2024-07-28 06:11:53.943739	\N
2064	21	28	110	2024-07-28 05:42:41.06406	2024-07-28 06:11:58.250624	\N
2065	21	62	246	2024-07-28 05:42:41.06406	2024-07-28 06:12:01.994062	\N
2066	21	58	230	2024-07-28 05:42:41.06406	2024-07-28 06:12:10.182628	\N
2067	21	36	141	2024-07-28 05:42:41.06406	2024-07-28 06:16:35.827808	\N
2068	21	46	181	2024-07-28 05:42:41.06406	2024-07-28 06:17:37.068426	\N
2119	20	86	\N	2024-07-28 05:42:57.414288	2024-07-28 05:42:57.414288	\N
125	3	31	122	2024-07-28 05:30:31.110508	2024-07-28 05:42:59.55159	\N
2229	16	5	19	2024-07-28 05:49:40.281549	2024-07-28 05:49:40.281549	\N
925	19	27	\N	2024-07-28 05:34:35.14588	2024-07-28 05:43:56.387962	2024-07-28 05:43:56.384979
2120	19	27	106	2024-07-28 05:43:57.775144	2024-07-28 05:43:57.775144	\N
676	14	48	\N	2024-07-28 05:32:30.355533	2024-07-28 05:44:03.766897	2024-07-28 05:44:03.76338
2121	14	48	191	2024-07-28 05:44:04.641389	2024-07-28 05:44:04.641389	\N
1218	9	57	227	2024-07-28 05:37:34.719462	2024-07-28 05:44:28.304089	\N
1415	22	69	274	2024-07-28 05:37:55.342779	2024-07-28 05:44:53.171906	\N
836	17	17	66	2024-07-28 05:34:10.670885	2024-07-28 05:45:07.079713	\N
2184	27	62	246	2024-07-28 05:49:25.990528	2024-07-28 05:56:53.329131	\N
2185	27	31	122	2024-07-28 05:49:25.990528	2024-07-28 05:58:20.871663	\N
2133	26	57	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2134	26	7	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2135	26	36	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2136	26	3	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2137	26	5	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2138	26	28	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2139	26	15	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2140	26	75	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2141	26	31	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2142	26	38	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2143	26	70	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2144	26	16	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2145	26	58	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2146	26	71	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2147	26	27	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2148	26	88	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2149	26	47	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2150	26	18	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2151	26	68	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2152	26	1	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2153	26	56	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2154	26	6	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2155	26	59	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2156	26	17	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2157	26	67	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2158	26	86	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2159	26	74	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2160	26	29	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2161	26	89	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2162	26	72	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2163	26	2	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2164	26	87	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2165	26	69	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2166	26	30	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2167	26	39	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2168	26	90	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2169	26	45	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2170	26	40	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2171	26	62	\N	2024-07-28 05:45:17.728616	2024-07-28 05:45:17.728616	\N
2172	19	75	298	2024-07-28 05:45:28.025303	2024-07-28 05:45:28.025303	\N
2122	26	4	13	2024-07-28 05:45:17.728616	2024-07-28 05:45:43.65575	\N
41	1	87	347	2024-07-28 05:30:12.867344	2024-07-28 05:45:51.039836	\N
2173	14	71	281	2024-07-28 05:46:06.204934	2024-07-28 05:46:06.204934	\N
681	14	90	\N	2024-07-28 05:32:30.355533	2024-07-28 05:47:02.955603	2024-07-28 05:47:02.953712
2174	14	90	358	2024-07-28 05:47:04.040576	2024-07-28 05:47:04.040576	\N
2175	3	70	279	2024-07-28 05:47:04.392278	2024-07-28 05:47:04.392278	\N
1294	6	7	26	2024-07-28 05:37:34.819981	2024-07-28 05:47:05.946251	\N
843	17	20	79	2024-07-28 05:34:10.670885	2024-07-28 05:47:20.838651	\N
2176	14	44	176	2024-07-28 05:47:33.616277	2024-07-28 05:47:33.616277	\N
938	19	87	347	2024-07-28 05:34:35.14588	2024-07-28 05:47:54.086686	\N
138	3	4	13	2024-07-28 05:30:31.110508	2024-07-28 05:47:55.318506	\N
2123	26	61	244	2024-07-28 05:45:17.728616	2024-07-28 05:48:02.393296	\N
2177	25	15	58	2024-07-28 05:48:10.50814	2024-07-28 05:48:10.50814	\N
2178	25	1	2	2024-07-28 05:48:41.878028	2024-07-28 05:48:41.878028	\N
849	17	36	141	2024-07-28 05:34:10.670885	2024-07-28 05:48:53.114442	\N
1420	22	62	246	2024-07-28 05:37:55.342779	2024-07-28 05:49:03.650533	\N
4800	45	19	76	2024-07-28 11:57:18.242346	2024-07-28 12:05:02.915943	\N
314	7	72	288	2024-07-28 05:30:58.029349	2024-07-28 05:50:11.364642	\N
34	1	39	156	2024-07-28 05:30:12.867344	2024-07-28 05:50:32.959036	\N
2230	25	17	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2231	25	31	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2232	25	73	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2233	25	61	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2234	25	58	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2235	25	74	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2236	25	16	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2237	25	75	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2125	26	19	76	2024-07-28 05:45:17.728616	2024-07-28 05:51:19.29025	\N
2179	27	71	283	2024-07-28 05:49:25.990528	2024-07-28 05:51:45.312763	\N
2180	27	30	118	2024-07-28 05:49:25.990528	2024-07-28 05:53:13.754984	\N
2181	27	38	152	2024-07-28 05:49:25.990528	2024-07-28 05:53:28.308131	\N
2127	26	21	81	2024-07-28 05:45:17.728616	2024-07-28 05:53:35.990109	\N
2182	27	2	7	2024-07-28 05:49:25.990528	2024-07-28 05:54:02.27188	\N
2128	26	48	192	2024-07-28 05:45:17.728616	2024-07-28 05:54:12.232629	\N
2129	26	60	238	2024-07-28 05:45:17.728616	2024-07-28 05:56:00.222221	\N
2183	27	36	141	2024-07-28 05:49:25.990528	2024-07-28 05:56:20.694701	\N
2130	26	73	\N	2024-07-28 05:45:17.728616	2024-07-28 05:58:36.439749	2024-07-28 05:58:36.433432
2131	26	20	80	2024-07-28 05:45:17.728616	2024-07-28 05:59:20.775956	\N
2186	27	86	343	2024-07-28 05:49:25.990528	2024-07-28 05:59:39.343549	\N
2132	26	46	\N	2024-07-28 05:45:17.728616	2024-07-28 06:00:38.83773	2024-07-28 06:00:38.83588
2795	26	46	\N	2024-07-28 06:00:47.050499	2024-07-28 06:00:47.782202	2024-07-28 06:00:47.779835
2188	27	21	81	2024-07-28 05:49:25.990528	2024-07-28 06:02:48.200353	\N
2190	27	75	298	2024-07-28 05:49:25.990528	2024-07-28 06:04:27.62179	\N
2191	27	60	237	2024-07-28 05:49:25.990528	2024-07-28 06:05:13.017933	\N
2192	27	90	358	2024-07-28 05:49:25.990528	2024-07-28 06:05:34.527743	\N
2193	27	6	21	2024-07-28 05:49:25.990528	2024-07-28 06:05:39.141708	\N
2194	27	88	352	2024-07-28 05:49:25.990528	2024-07-28 06:05:53.334431	\N
2195	27	61	243	2024-07-28 05:49:25.990528	2024-07-28 06:06:52.545281	\N
2196	27	20	77	2024-07-28 05:49:25.990528	2024-07-28 06:07:56.073639	\N
2197	27	40	157	2024-07-28 05:49:25.990528	2024-07-28 06:08:20.259498	\N
2198	27	18	70	2024-07-28 05:49:25.990528	2024-07-28 06:10:20.465728	\N
2199	27	28	110	2024-07-28 05:49:25.990528	2024-07-28 06:11:08.446993	\N
2201	27	19	76	2024-07-28 05:49:25.990528	2024-07-28 06:13:02.942463	\N
2202	27	74	293	2024-07-28 05:49:25.990528	2024-07-28 06:14:32.170812	\N
2203	27	69	274	2024-07-28 05:49:25.990528	2024-07-28 06:14:48.03572	\N
2204	27	3	9	2024-07-28 05:49:25.990528	2024-07-28 06:15:07.59383	\N
2205	27	87	347	2024-07-28 05:49:25.990528	2024-07-28 06:15:36.18577	\N
2206	27	16	61	2024-07-28 05:49:25.990528	2024-07-28 06:16:47.600461	\N
2207	27	67	266	2024-07-28 05:49:25.990528	2024-07-28 06:16:59.59468	\N
2208	27	70	277	2024-07-28 05:49:25.990528	2024-07-28 06:17:41.833001	\N
2209	27	47	187	2024-07-28 05:49:25.990528	2024-07-28 06:20:02.846868	\N
2210	27	17	66	2024-07-28 05:49:25.990528	2024-07-28 06:21:22.078647	\N
2211	27	44	\N	2024-07-28 05:49:25.990528	2024-07-28 06:21:42.462392	2024-07-28 06:21:42.460911
2212	27	1	3	2024-07-28 05:49:25.990528	2024-07-28 06:22:55.311193	\N
2213	27	4	13	2024-07-28 05:49:25.990528	2024-07-28 06:22:59.439941	\N
2214	27	37	147	2024-07-28 05:49:25.990528	2024-07-28 06:23:13.890808	\N
2215	27	27	106	2024-07-28 05:49:25.990528	2024-07-28 06:24:37.749931	\N
2216	27	48	189	2024-07-28 05:49:25.990528	2024-07-28 06:25:25.060182	\N
2218	27	5	19	2024-07-28 05:49:25.990528	2024-07-28 06:26:29.525916	\N
2219	27	46	181	2024-07-28 05:49:25.990528	2024-07-28 06:27:13.591809	\N
2220	27	56	222	2024-07-28 05:49:25.990528	2024-07-28 06:29:40.04654	\N
2221	27	7	26	2024-07-28 05:49:25.990528	2024-07-28 06:29:49.538901	\N
2222	27	58	232	2024-07-28 05:49:25.990528	2024-07-28 06:31:41.854369	\N
2223	27	68	269	2024-07-28 05:49:25.990528	2024-07-28 06:31:51.786461	\N
2224	27	57	\N	2024-07-28 05:49:25.990528	2024-07-28 06:32:31.552515	2024-07-28 06:32:31.551038
2225	27	73	290	2024-07-28 05:49:25.990528	2024-07-28 06:32:59.161843	\N
2227	27	59	233	2024-07-28 05:49:25.990528	2024-07-28 06:33:53.199931	\N
2228	27	89	355	2024-07-28 05:49:25.990528	2024-07-28 06:34:07.609715	\N
2238	25	38	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2239	25	87	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2240	25	67	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2241	25	20	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2242	25	37	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2243	25	88	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2244	25	47	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2245	25	70	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2246	25	60	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2247	25	19	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2248	25	6	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2249	25	59	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2250	25	18	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2251	25	69	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2252	25	90	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2253	25	36	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2254	25	71	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2255	25	28	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2256	25	72	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2257	25	39	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2258	25	68	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2259	25	3	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2260	25	27	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2261	25	86	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2262	25	40	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2263	25	1	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2264	25	2	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2265	25	89	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2266	25	4	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2267	25	29	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2268	25	48	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2269	25	5	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2270	25	57	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2271	25	21	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2272	25	56	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2273	25	45	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2274	25	15	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2275	25	30	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2276	25	7	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2277	25	62	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2278	25	46	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2279	25	44	\N	2024-07-28 05:50:33.157291	2024-07-28 05:50:33.157291	\N
2280	25	62	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2281	25	18	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2282	25	38	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2283	25	57	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2284	25	89	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2285	25	37	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2286	25	70	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2287	25	5	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2288	25	17	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2289	25	61	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2290	25	86	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2291	25	2	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2292	25	15	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2293	25	75	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2294	25	3	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2295	25	60	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2296	25	6	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2297	25	71	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2298	25	69	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2299	25	58	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2300	25	36	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2301	25	87	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2302	25	90	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2303	25	16	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2304	25	68	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2305	25	4	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2306	25	72	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2307	25	74	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2308	25	45	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2309	25	46	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2310	25	31	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2311	25	1	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2312	25	47	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2313	25	28	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2314	25	48	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2315	25	56	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2316	25	67	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2317	25	7	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2318	25	20	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2319	25	40	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2320	25	29	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2321	25	39	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2322	25	59	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2323	25	73	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2324	25	30	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2325	25	19	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2326	25	44	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2327	25	27	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2328	25	21	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
2329	25	88	\N	2024-07-28 05:50:35.771701	2024-07-28 05:50:35.771701	\N
795	16	67	266	2024-07-28 05:33:46.633048	2024-07-28 05:50:36.459098	\N
2330	9	48	192	2024-07-28 05:50:41.987102	2024-07-28 05:50:41.987102	\N
2340	28	59	235	2024-07-28 05:50:43.929308	2024-07-28 05:56:43.576688	\N
2341	28	72	286	2024-07-28 05:50:43.929308	2024-07-28 05:58:08.050313	\N
2353	28	61	\N	2024-07-28 05:50:43.929308	2024-07-28 05:50:43.929308	\N
2332	28	44	175	2024-07-28 05:50:43.929308	2024-07-28 05:51:37.975498	\N
2333	28	29	114	2024-07-28 05:50:43.929308	2024-07-28 05:51:57.356842	\N
2335	28	70	279	2024-07-28 05:50:43.929308	2024-07-28 05:52:57.009487	\N
2336	28	69	273	2024-07-28 05:50:43.929308	2024-07-28 05:53:12.303879	\N
2337	28	21	83	2024-07-28 05:50:43.929308	2024-07-28 05:53:39.348149	\N
2338	28	2	5	2024-07-28 05:50:43.929308	2024-07-28 05:54:40.08473	\N
2339	28	6	21	2024-07-28 05:50:43.929308	2024-07-28 05:54:59.901197	\N
2342	28	90	358	2024-07-28 05:50:43.929308	2024-07-28 05:58:39.127849	\N
2343	28	87	347	2024-07-28 05:50:43.929308	2024-07-28 05:58:51.243915	\N
2344	28	18	71	2024-07-28 05:50:43.929308	2024-07-28 06:00:10.027932	\N
2345	28	5	20	2024-07-28 05:50:43.929308	2024-07-28 06:00:36.241123	\N
2346	28	67	266	2024-07-28 05:50:43.929308	2024-07-28 06:00:59.527733	\N
2347	28	68	269	2024-07-28 05:50:43.929308	2024-07-28 06:01:11.389984	\N
2348	28	37	147	2024-07-28 05:50:43.929308	2024-07-28 06:02:08.470834	\N
2349	28	86	343	2024-07-28 05:50:43.929308	2024-07-28 06:02:26.515904	\N
2351	28	89	356	2024-07-28 05:50:43.929308	2024-07-28 06:04:24.19231	\N
2352	28	40	157	2024-07-28 05:50:43.929308	2024-07-28 06:06:19.186055	\N
2354	28	3	11	2024-07-28 05:50:43.929308	2024-07-28 06:06:41.044323	\N
2355	28	88	352	2024-07-28 05:50:43.929308	2024-07-28 06:07:00.187597	\N
2356	28	27	105	2024-07-28 05:50:43.929308	2024-07-28 06:07:50.601006	\N
2357	28	15	58	2024-07-28 05:50:43.929308	2024-07-28 06:08:21.909608	\N
2358	28	38	151	2024-07-28 05:50:43.929308	2024-07-28 06:08:42.220875	\N
2359	28	7	26	2024-07-28 05:50:43.929308	2024-07-28 06:09:09.551856	\N
2360	28	16	63	2024-07-28 05:50:43.929308	2024-07-28 06:10:35.961705	\N
2361	28	56	223	2024-07-28 05:50:43.929308	2024-07-28 06:11:07.539511	\N
2362	28	20	78	2024-07-28 05:50:43.929308	2024-07-28 06:12:46.069234	\N
2363	28	17	67	2024-07-28 05:50:43.929308	2024-07-28 06:14:24.098113	\N
2364	28	31	122	2024-07-28 05:50:43.929308	2024-07-28 06:15:23.13699	\N
2365	28	19	76	2024-07-28 05:50:43.929308	2024-07-28 06:15:49.31833	\N
2367	28	73	290	2024-07-28 05:50:43.929308	2024-07-28 06:17:30.262199	\N
2368	28	39	154	2024-07-28 05:50:43.929308	2024-07-28 06:18:27.027073	\N
2369	28	74	295	2024-07-28 05:50:43.929308	2024-07-28 06:18:57.559492	\N
2370	28	36	143	2024-07-28 05:50:43.929308	2024-07-28 06:20:29.844718	\N
2371	28	57	225	2024-07-28 05:50:43.929308	2024-07-28 06:22:19.135323	\N
2372	28	60	238	2024-07-28 05:50:43.929308	2024-07-28 06:23:19.61585	\N
2381	1	40	157	2024-07-28 05:50:48.901727	2024-07-28 05:50:48.901727	\N
2382	25	15	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2383	25	44	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2384	25	68	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2385	25	16	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2386	25	4	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2387	25	58	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2388	25	45	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2389	25	47	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2390	25	39	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2391	25	21	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2392	25	73	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2393	25	30	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2394	25	72	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2395	25	18	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2396	25	56	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2397	25	31	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2398	25	29	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2399	25	86	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2400	25	48	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2401	25	2	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2402	25	62	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2403	25	27	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2404	25	67	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2405	25	90	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2406	25	60	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2407	25	38	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2408	25	57	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2409	25	20	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2410	25	5	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2411	25	3	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2412	25	19	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2413	25	36	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2414	25	28	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2415	25	6	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2416	25	69	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2417	25	89	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2418	25	71	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2419	25	59	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2420	25	46	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2421	25	74	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2422	25	70	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2423	25	1	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2424	25	87	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2425	25	75	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2426	25	7	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2427	25	88	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2428	25	17	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2429	25	40	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2430	25	37	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2431	25	61	\N	2024-07-28 05:50:50.423323	2024-07-28 05:50:50.423323	\N
2124	26	37	147	2024-07-28 05:45:17.728616	2024-07-28 05:50:59.139924	\N
2331	28	28	112	2024-07-28 05:50:43.929308	2024-07-28 05:51:10.409357	\N
146	3	3	11	2024-07-28 05:30:31.110508	2024-07-28 05:51:13.678331	\N
2449	29	15	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2450	29	59	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2451	29	71	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2452	29	5	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2453	29	89	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2454	29	48	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2455	29	68	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2456	29	57	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2457	29	70	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2458	29	7	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2459	29	73	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2460	29	37	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2461	29	86	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2463	29	47	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2464	29	45	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2465	29	46	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2466	29	29	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2467	29	30	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2468	29	6	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2469	29	21	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2470	29	40	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2471	29	17	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2472	29	20	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2473	29	61	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2474	29	58	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2475	29	19	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2476	29	69	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2477	29	44	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2478	29	62	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2480	29	3	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2481	29	2	\N	2024-07-28 05:51:28.979198	2024-07-28 05:51:28.979198	\N
2433	29	39	155	2024-07-28 05:51:28.979198	2024-07-28 05:59:12.383034	\N
2434	29	27	107	2024-07-28 05:51:28.979198	2024-07-28 05:59:43.590581	\N
2490	20	59	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2491	20	46	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2492	20	88	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2493	20	56	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2494	20	18	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2495	20	72	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2496	20	60	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2497	20	90	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2498	20	19	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2499	20	4	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2500	20	70	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2501	20	45	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2502	20	27	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2503	20	37	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2504	20	57	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2505	20	2	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2483	20	47	187	2024-07-28 05:51:56.826142	2024-07-28 05:52:56.340402	\N
2484	20	20	79	2024-07-28 05:51:56.826142	2024-07-28 05:53:13.038252	\N
2486	20	44	\N	2024-07-28 05:51:56.826142	2024-07-28 05:54:16.03606	2024-07-28 05:54:16.033191
2487	20	1	4	2024-07-28 05:51:56.826142	2024-07-28 05:54:47.123402	\N
2488	20	68	269	2024-07-28 05:51:56.826142	2024-07-28 05:55:14.227847	\N
2432	29	74	295	2024-07-28 05:51:28.979198	2024-07-28 05:55:20.98603	\N
2489	20	16	63	2024-07-28 05:51:56.826142	2024-07-28 05:56:03.513742	\N
2435	29	36	144	2024-07-28 05:51:28.979198	2024-07-28 06:00:26.657928	\N
2436	29	72	286	2024-07-28 05:51:28.979198	2024-07-28 06:01:12.850906	\N
2437	29	60	239	2024-07-28 05:51:28.979198	2024-07-28 06:03:04.661007	\N
2438	29	38	151	2024-07-28 05:51:28.979198	2024-07-28 06:03:28.811841	\N
2439	29	1	4	2024-07-28 05:51:28.979198	2024-07-28 06:03:58.092481	\N
2440	29	16	61	2024-07-28 05:51:28.979198	2024-07-28 06:05:28.474751	\N
2375	28	48	192	2024-07-28 05:50:43.929308	2024-07-28 06:25:11.306144	\N
2443	29	28	110	2024-07-28 05:51:28.979198	2024-07-28 06:07:45.353697	\N
2444	29	88	349	2024-07-28 05:51:28.979198	2024-07-28 06:08:28.532289	\N
2445	29	31	122	2024-07-28 05:51:28.979198	2024-07-28 06:09:16.750103	\N
2446	29	87	347	2024-07-28 05:51:28.979198	2024-07-28 06:09:50.8257	\N
2447	29	75	298	2024-07-28 05:51:28.979198	2024-07-28 06:10:10.294995	\N
2448	29	56	222	2024-07-28 05:51:28.979198	2024-07-28 06:11:05.610565	\N
2462	29	18	71	2024-07-28 05:51:28.979198	2024-07-28 06:12:36.238974	\N
2479	29	90	359	2024-07-28 05:51:28.979198	2024-07-28 06:21:37.032511	\N
2373	28	62	246	2024-07-28 05:50:43.929308	2024-07-28 06:23:30.00059	\N
2374	28	4	13	2024-07-28 05:50:43.929308	2024-07-28 06:23:49.222874	\N
2376	28	30	118	2024-07-28 05:50:43.929308	2024-07-28 06:26:16.046527	\N
2377	28	46	181	2024-07-28 05:50:43.929308	2024-07-28 06:27:14.46585	\N
2378	28	1	3	2024-07-28 05:50:43.929308	2024-07-28 06:27:23.380263	\N
2379	28	75	298	2024-07-28 05:50:43.929308	2024-07-28 06:27:42.523696	\N
2380	28	45	178	2024-07-28 05:50:43.929308	2024-07-28 06:28:39.777598	\N
2506	20	62	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2507	20	67	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2508	20	39	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2509	20	5	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2510	20	89	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2511	20	74	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2512	20	15	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2513	20	36	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2514	20	71	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2515	20	21	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2516	20	3	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2517	20	40	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2518	20	7	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2519	20	17	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2520	20	75	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2521	20	86	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2522	20	31	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2523	20	87	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2524	20	6	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2525	20	30	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2526	20	73	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2527	20	48	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2528	20	58	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2529	20	29	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2530	20	28	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2531	20	38	\N	2024-07-28 05:51:56.826142	2024-07-28 05:51:56.826142	\N
2532	7	44	176	2024-07-28 05:52:02.787682	2024-07-28 05:52:02.787682	\N
1302	6	4	13	2024-07-28 05:37:34.819981	2024-07-28 05:52:08.866608	\N
2126	26	44	\N	2024-07-28 05:45:17.728616	2024-07-28 05:52:17.145048	2024-07-28 05:52:17.142925
2535	24	1	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2536	24	40	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2537	24	68	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2538	24	18	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2539	24	20	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2540	24	90	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2541	24	36	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2542	24	70	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2543	24	5	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2544	24	38	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2545	24	29	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2546	24	7	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2547	24	59	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2548	24	62	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2549	24	88	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2550	24	2	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2551	24	19	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2552	24	39	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2553	24	3	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2554	24	67	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2555	24	21	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2556	24	89	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2557	24	61	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2558	24	71	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2559	24	73	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2560	24	46	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2561	24	86	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2562	24	27	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2563	24	16	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2564	24	15	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2565	24	58	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2566	24	75	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2567	24	31	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2568	24	74	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2569	24	28	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2570	24	17	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2571	24	72	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2572	24	44	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2573	24	6	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2574	24	45	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2575	24	47	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2576	24	4	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2577	24	37	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2578	24	30	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2579	24	87	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2580	24	69	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2581	24	57	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2582	24	60	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2583	24	56	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
2584	24	48	\N	2024-07-28 05:52:18.868311	2024-07-28 05:52:18.868311	\N
631	13	30	117	2024-07-28 05:32:28.65064	2024-07-28 05:52:20.211725	\N
2533	3	46	181	2024-07-28 05:52:09.551958	2024-07-28 05:52:20.762201	\N
2621	24	15	58	2024-07-28 05:52:27.414117	2024-07-28 05:52:32.827712	\N
2534	26	44	\N	2024-07-28 05:52:17.895715	2024-07-28 05:52:21.191208	2024-07-28 05:52:21.188428
2334	28	58	232	2024-07-28 05:50:43.929308	2024-07-28 05:52:22.1442	\N
2585	26	44	176	2024-07-28 05:52:22.512249	2024-07-28 05:52:22.512249	\N
2586	24	47	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2587	24	88	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2588	24	39	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2589	24	5	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2590	24	2	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2591	24	21	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2592	24	29	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2593	24	61	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2594	24	27	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2595	24	70	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2596	24	18	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2597	24	67	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2598	24	87	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2599	24	59	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2600	24	46	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2601	24	90	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2602	24	56	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2603	24	6	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2604	24	36	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2605	24	57	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2606	24	16	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2607	24	60	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2608	24	38	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2609	24	48	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2610	24	74	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2611	24	20	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2612	24	19	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2613	24	28	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2614	24	86	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2615	24	1	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2616	24	4	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2617	24	30	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2618	24	3	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2619	24	62	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2620	24	72	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2622	24	17	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2623	24	68	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2624	24	45	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2625	24	31	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2626	24	58	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2627	24	89	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2628	24	73	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2629	24	40	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2630	24	75	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2631	24	71	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2632	24	7	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2633	24	69	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2796	26	46	\N	2024-07-28 06:00:48.404102	2024-07-28 06:00:48.603716	2024-07-28 06:00:48.599342
2797	26	46	\N	2024-07-28 06:00:48.874967	2024-07-28 06:00:49.019117	2024-07-28 06:00:49.017519
2849	26	15	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2634	24	44	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
2635	24	37	\N	2024-07-28 05:52:27.414117	2024-07-28 05:52:27.414117	\N
953	19	16	61	2024-07-28 05:34:35.14588	2024-07-28 05:52:28.954504	\N
2482	20	61	243	2024-07-28 05:51:56.826142	2024-07-28 05:52:37.991627	\N
800	16	28	110	2024-07-28 05:33:46.633048	2024-07-28 05:52:44.653731	\N
2636	24	59	234	2024-07-28 05:52:45.391096	2024-07-28 05:53:07.843123	\N
2686	14	62	246	2024-07-28 05:53:17.851407	2024-07-28 05:53:17.851407	\N
2687	15	58	230	2024-07-28 05:53:35.942936	2024-07-28 05:53:35.942936	\N
2638	24	15	59	2024-07-28 05:52:45.391096	2024-07-28 05:57:17.113991	\N
2485	20	69	\N	2024-07-28 05:51:56.826142	2024-07-28 05:53:41.807196	2024-07-28 05:53:41.804092
2637	24	21	81	2024-07-28 05:52:45.391096	2024-07-28 05:54:02.134617	\N
2688	3	30	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2689	3	20	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2690	3	31	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2691	3	28	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2692	3	3	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2693	3	59	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2694	3	40	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2695	3	58	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2696	3	89	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2697	3	61	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2698	3	73	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2699	3	70	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2700	3	75	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2701	3	2	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2702	3	37	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2703	3	48	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2704	3	62	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2705	3	1	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2706	3	6	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2707	3	69	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2708	3	17	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2709	3	18	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2710	3	7	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2711	3	90	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2712	3	56	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2713	3	39	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2714	3	74	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2715	3	19	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2716	3	16	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2717	3	47	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2718	3	57	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2719	3	21	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2720	3	4	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2721	3	67	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2722	3	38	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2723	3	5	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2724	3	15	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2725	3	27	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2726	3	87	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2727	3	60	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2728	3	36	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2729	3	88	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2730	3	45	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2731	3	72	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2732	3	68	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2733	3	44	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2734	3	46	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2735	3	71	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2736	3	86	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
2737	3	29	\N	2024-07-28 05:54:28.712726	2024-07-28 05:54:28.712726	\N
820	17	56	\N	2024-07-28 05:34:10.670885	2024-07-28 05:54:29.126695	2024-07-28 05:54:29.12514
2738	22	17	66	2024-07-28 05:54:32.061883	2024-07-28 05:54:32.061883	\N
635	13	61	242	2024-07-28 05:32:28.65064	2024-07-28 05:55:14.936236	\N
2739	17	56	223	2024-07-28 05:54:33.188014	2024-07-28 05:55:25.107795	\N
193	4	44	176	2024-07-28 05:30:33.789462	2024-07-28 05:55:36.598732	\N
2740	14	69	274	2024-07-28 05:55:56.660481	2024-07-28 05:55:56.660481	\N
2741	20	46	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2742	20	29	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2743	20	6	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2744	20	30	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2745	20	37	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2746	20	20	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2747	20	4	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2748	20	31	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2749	20	74	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2750	20	62	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2751	20	15	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2752	20	69	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2753	20	5	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2754	20	67	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2755	20	86	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2756	20	61	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2639	24	70	277	2024-07-28 05:52:45.391096	2024-07-28 05:57:39.206862	\N
2640	24	5	17	2024-07-28 05:52:45.391096	2024-07-28 05:59:43.039185	\N
2641	24	16	63	2024-07-28 05:52:45.391096	2024-07-28 06:00:45.650779	\N
2798	26	46	\N	2024-07-28 06:00:49.128663	2024-07-28 06:00:49.128663	\N
2799	26	29	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2800	26	47	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2801	26	69	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2643	24	46	182	2024-07-28 05:52:45.391096	2024-07-28 06:02:32.906753	\N
2802	26	36	141	2024-07-28 06:00:55.968646	2024-07-28 06:04:07.814429	\N
2644	24	37	147	2024-07-28 05:52:45.391096	2024-07-28 06:04:21.83392	\N
2645	24	86	343	2024-07-28 05:52:45.391096	2024-07-28 06:06:53.194991	\N
2646	24	47	187	2024-07-28 05:52:45.391096	2024-07-28 06:07:58.074354	\N
2648	24	56	222	2024-07-28 05:52:45.391096	2024-07-28 06:12:40.68347	\N
2649	24	30	119	2024-07-28 05:52:45.391096	2024-07-28 06:12:58.317586	\N
2650	24	1	4	2024-07-28 05:52:45.391096	2024-07-28 06:13:28.594287	\N
2651	24	38	151	2024-07-28 05:52:45.391096	2024-07-28 06:13:44.814328	\N
2652	24	75	299	2024-07-28 05:52:45.391096	2024-07-28 06:14:25.032065	\N
2653	24	67	266	2024-07-28 05:52:45.391096	2024-07-28 06:15:12.825069	\N
2654	24	58	230	2024-07-28 05:52:45.391096	2024-07-28 06:16:05.303144	\N
2655	24	39	156	2024-07-28 05:52:45.391096	2024-07-28 06:16:26.057444	\N
2656	24	31	122	2024-07-28 05:52:45.391096	2024-07-28 06:16:53.819337	\N
2657	24	60	238	2024-07-28 05:52:45.391096	2024-07-28 06:17:09.306943	\N
2658	24	74	293	2024-07-28 05:52:45.391096	2024-07-28 06:17:33.392107	\N
2659	24	18	72	2024-07-28 05:52:45.391096	2024-07-28 06:18:00.975178	\N
2660	24	29	113	2024-07-28 05:52:45.391096	2024-07-28 06:18:44.858895	\N
2661	24	40	159	2024-07-28 05:52:45.391096	2024-07-28 06:18:55.181572	\N
2663	24	48	192	2024-07-28 05:52:45.391096	2024-07-28 06:19:55.899418	\N
2664	24	20	79	2024-07-28 05:52:45.391096	2024-07-28 06:20:05.298991	\N
2665	24	90	358	2024-07-28 05:52:45.391096	2024-07-28 06:20:21.014235	\N
2666	24	72	287	2024-07-28 05:52:45.391096	2024-07-28 06:20:33.786971	\N
2667	24	28	110	2024-07-28 05:52:45.391096	2024-07-28 06:21:03.774198	\N
2668	24	87	347	2024-07-28 05:52:45.391096	2024-07-28 06:21:30.748482	\N
2669	24	19	76	2024-07-28 05:52:45.391096	2024-07-28 06:21:40.910021	\N
2670	24	45	178	2024-07-28 05:52:45.391096	2024-07-28 06:22:02.003849	\N
2671	24	69	274	2024-07-28 05:52:45.391096	2024-07-28 06:22:27.575637	\N
2672	24	3	10	2024-07-28 05:52:45.391096	2024-07-28 06:23:39.582721	\N
2673	24	17	65	2024-07-28 05:52:45.391096	2024-07-28 06:23:57.598883	\N
2674	24	36	141	2024-07-28 05:52:45.391096	2024-07-28 06:24:44.456501	\N
2675	24	71	282	2024-07-28 05:52:45.391096	2024-07-28 06:25:12.894332	\N
2676	24	4	13	2024-07-28 05:52:45.391096	2024-07-28 06:25:20.462909	\N
2678	24	6	21	2024-07-28 05:52:45.391096	2024-07-28 06:27:43.41409	\N
2679	24	27	105	2024-07-28 05:52:45.391096	2024-07-28 06:28:31.117554	\N
2680	24	7	28	2024-07-28 05:52:45.391096	2024-07-28 06:31:55.941393	\N
2681	24	44	176	2024-07-28 05:52:45.391096	2024-07-28 06:32:19.838116	\N
2682	24	68	269	2024-07-28 05:52:45.391096	2024-07-28 06:32:48.205331	\N
2683	24	62	245	2024-07-28 05:52:45.391096	2024-07-28 06:35:37.386616	\N
2684	24	73	291	2024-07-28 05:52:45.391096	2024-07-28 06:36:19.874939	\N
2685	24	57	228	2024-07-28 05:52:45.391096	2024-07-28 06:36:48.601436	\N
2757	20	47	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2758	20	58	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2759	20	88	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2760	20	7	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2761	20	73	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2763	20	60	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2764	20	21	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2765	20	75	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2766	20	38	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2767	20	87	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2768	20	56	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2769	20	59	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2770	20	17	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2771	20	18	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2772	20	40	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2773	20	90	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2774	20	44	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2775	20	71	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2776	20	57	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2777	20	1	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2778	20	45	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2779	20	72	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2780	20	3	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2781	20	2	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2782	20	27	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2783	20	36	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2784	20	19	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2785	20	39	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2786	20	48	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2787	20	28	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2788	20	68	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2789	20	70	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2790	20	89	\N	2024-07-28 05:56:36.251609	2024-07-28 05:56:36.251609	\N
2762	20	16	63	2024-07-28 05:56:36.251609	2024-07-28 05:56:38.277315	\N
2803	26	62	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2804	26	17	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2805	26	73	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2806	26	45	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2807	26	88	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2808	26	48	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2809	26	31	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2810	26	19	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2811	26	1	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2812	26	20	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2813	26	3	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2814	26	6	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2815	26	38	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2816	26	21	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2817	26	39	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2818	26	5	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2819	26	67	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2820	26	75	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2821	26	61	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2822	26	86	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2823	26	40	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2824	26	37	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2825	26	18	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2826	26	71	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2827	26	46	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2828	26	87	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2829	26	30	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2830	26	59	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2831	26	16	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2832	26	4	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2833	26	74	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2834	26	28	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2835	26	72	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2836	26	70	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2837	26	89	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2838	26	58	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2839	26	15	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2840	26	56	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2841	26	60	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2842	26	68	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2843	26	90	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2844	26	27	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2845	26	57	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2846	26	2	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2847	26	7	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2848	26	44	\N	2024-07-28 06:00:55.968646	2024-07-28 06:00:55.968646	\N
2856	26	20	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2857	26	5	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2858	26	27	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2865	26	38	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2866	26	2	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2867	26	45	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2868	26	74	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2869	26	31	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2870	26	29	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2871	26	69	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2872	26	75	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2873	26	47	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2874	26	37	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2875	26	40	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2876	26	39	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2877	26	60	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2878	26	59	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2879	26	4	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2880	26	87	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2881	26	19	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2882	26	48	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2883	26	28	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2884	26	6	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2885	26	17	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2886	26	89	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2887	26	67	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2888	26	57	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2889	26	73	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2890	26	70	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2891	26	88	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2892	26	90	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2893	26	71	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2894	26	61	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2895	26	56	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2896	26	21	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2897	26	30	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2898	26	62	\N	2024-07-28 06:00:58.555446	2024-07-28 06:00:58.555446	\N
2859	26	44	176	2024-07-28 06:00:58.555446	2024-07-28 06:01:14.839888	\N
2860	26	72	287	2024-07-28 06:00:58.555446	2024-07-28 06:01:34.922645	\N
12	1	44	\N	2024-07-28 05:30:12.867344	2024-07-28 06:01:44.424925	2024-07-28 06:01:44.414998
2899	1	44	176	2024-07-28 06:01:45.409111	2024-07-28 06:01:45.409111	\N
2642	24	61	243	2024-07-28 05:52:45.391096	2024-07-28 06:01:53.074569	\N
2900	27	15	57	2024-07-28 06:02:07.541776	2024-07-28 06:02:07.541776	\N
2187	27	15	\N	2024-07-28 05:49:25.990528	2024-07-28 06:02:04.45963	2024-07-28 06:02:04.458097
2861	26	18	71	2024-07-28 06:00:58.555446	2024-07-28 06:02:44.514938	\N
2862	26	46	183	2024-07-28 06:00:58.555446	2024-07-28 06:02:53.514007	\N
2350	28	71	282	2024-07-28 05:50:43.929308	2024-07-28 06:03:13.62132	\N
651	13	67	266	2024-07-28 05:32:28.65064	2024-07-28 06:03:23.902082	\N
2864	26	86	343	2024-07-28 06:00:58.555446	2024-07-28 06:04:16.067452	\N
2901	4	56	223	2024-07-28 06:02:27.356591	2024-07-28 06:04:32.656952	\N
2902	30	29	114	2024-07-28 06:03:31.729824	2024-07-28 06:05:20.854632	\N
2903	30	86	343	2024-07-28 06:03:31.729824	2024-07-28 06:05:32.063386	\N
2904	30	61	244	2024-07-28 06:03:31.729824	2024-07-28 06:05:58.118143	\N
2923	30	57	\N	2024-07-28 06:03:31.729824	2024-07-28 06:03:31.729824	\N
2930	30	36	\N	2024-07-28 06:03:31.729824	2024-07-28 06:03:31.729824	\N
2931	30	15	\N	2024-07-28 06:03:31.729824	2024-07-28 06:03:31.729824	\N
2933	30	58	\N	2024-07-28 06:03:31.729824	2024-07-28 06:03:31.729824	\N
2935	30	18	\N	2024-07-28 06:03:31.729824	2024-07-28 06:03:31.729824	\N
2936	30	40	\N	2024-07-28 06:03:31.729824	2024-07-28 06:03:31.729824	\N
2943	30	56	\N	2024-07-28 06:03:31.729824	2024-07-28 06:03:31.729824	\N
2946	30	39	\N	2024-07-28 06:03:31.729824	2024-07-28 06:03:31.729824	\N
2905	30	59	233	2024-07-28 06:03:31.729824	2024-07-28 06:07:32.016575	\N
2906	30	17	\N	2024-07-28 06:03:31.729824	2024-07-28 06:09:31.118363	2024-07-28 06:09:31.111709
2907	30	16	63	2024-07-28 06:03:31.729824	2024-07-28 06:10:16.538156	\N
2908	30	62	246	2024-07-28 06:03:31.729824	2024-07-28 06:10:49.001018	\N
2909	30	60	238	2024-07-28 06:03:31.729824	2024-07-28 06:11:38.898882	\N
2910	30	38	151	2024-07-28 06:03:31.729824	2024-07-28 06:12:27.413298	\N
2913	30	87	347	2024-07-28 06:03:31.729824	2024-07-28 06:14:52.055916	\N
2914	30	75	298	2024-07-28 06:03:31.729824	2024-07-28 06:14:57.470749	\N
2915	30	73	290	2024-07-28 06:03:31.729824	2024-07-28 06:15:07.140062	\N
2916	30	70	277	2024-07-28 06:03:31.729824	2024-07-28 06:15:19.440548	\N
2917	30	48	192	2024-07-28 06:03:31.729824	2024-07-28 06:15:59.450965	\N
2918	30	5	20	2024-07-28 06:03:31.729824	2024-07-28 06:17:16.685663	\N
2919	30	30	117	2024-07-28 06:03:31.729824	2024-07-28 06:17:27.440419	\N
2920	30	74	295	2024-07-28 06:03:31.729824	2024-07-28 06:18:06.537919	\N
2921	30	69	274	2024-07-28 06:03:31.729824	2024-07-28 06:18:12.439152	\N
2922	30	2	7	2024-07-28 06:03:31.729824	2024-07-28 06:18:25.94262	\N
2924	30	44	173	2024-07-28 06:03:31.729824	2024-07-28 06:20:14.398897	\N
2927	30	20	80	2024-07-28 06:03:31.729824	2024-07-28 06:23:05.478352	\N
2925	30	31	\N	2024-07-28 06:03:31.729824	2024-07-28 06:25:16.509472	2024-07-28 06:25:16.505874
2928	30	28	110	2024-07-28 06:03:31.729824	2024-07-28 06:26:08.829907	\N
2929	30	45	178	2024-07-28 06:03:31.729824	2024-07-28 06:26:58.746195	\N
2926	30	7	25	2024-07-28 06:03:31.729824	2024-07-28 06:27:48.053919	\N
2932	30	90	358	2024-07-28 06:03:31.729824	2024-07-28 06:29:36.155951	\N
2934	30	71	284	2024-07-28 06:03:31.729824	2024-07-28 06:30:10.90353	\N
2937	30	4	13	2024-07-28 06:03:31.729824	2024-07-28 06:31:18.234144	\N
2938	30	21	81	2024-07-28 06:03:31.729824	2024-07-28 06:31:22.944323	\N
2939	30	27	108	2024-07-28 06:03:31.729824	2024-07-28 06:32:11.802005	\N
2940	30	68	269	2024-07-28 06:03:31.729824	2024-07-28 06:32:23.901617	\N
2941	30	1	4	2024-07-28 06:03:31.729824	2024-07-28 06:32:29.721841	\N
2942	30	19	76	2024-07-28 06:03:31.729824	2024-07-28 06:32:34.299237	\N
2944	30	6	21	2024-07-28 06:03:31.729824	2024-07-28 06:34:17.716656	\N
2945	30	88	352	2024-07-28 06:03:31.729824	2024-07-28 06:34:54.417529	\N
2947	30	3	11	2024-07-28 06:03:31.729824	2024-07-28 06:36:30.688915	\N
2948	30	47	187	2024-07-28 06:03:31.729824	2024-07-28 06:37:30.373059	\N
2949	30	67	266	2024-07-28 06:03:31.729824	2024-07-28 06:37:52.955185	\N
2950	30	46	181	2024-07-28 06:03:31.729824	2024-07-28 06:38:17.273789	\N
2951	30	89	355	2024-07-28 06:03:31.729824	2024-07-28 06:39:28.823577	\N
2912	30	37	147	2024-07-28 06:03:31.729824	2024-07-28 06:47:38.003802	\N
2911	30	72	\N	2024-07-28 06:03:31.729824	2024-07-28 06:50:05.542904	2024-07-28 06:50:05.541484
4787	45	75	298	2024-07-28 11:57:18.242346	2024-07-28 11:57:27.282625	\N
4843	45	73	290	2024-07-28 12:06:26.467529	2024-07-28 12:06:26.467529	\N
4828	45	59	233	2024-07-28 11:57:18.242346	2024-07-28 12:28:35.38397	\N
4931	47	38	151	2024-07-28 15:34:10.203806	2024-07-28 15:34:34.00247	\N
4806	45	58	\N	2024-07-28 11:57:18.242346	2024-07-28 12:12:03.278357	2024-07-28 12:12:03.276842
4807	45	68	269	2024-07-28 11:57:18.242346	2024-07-28 12:12:36.878353	\N
4932	47	36	141	2024-07-28 15:34:10.203806	2024-07-28 15:34:58.753298	\N
4829	45	17	\N	2024-07-28 11:57:18.242346	2024-07-28 12:29:04.75766	2024-07-28 12:29:04.755182
4808	45	61	\N	2024-07-28 11:57:18.242346	2024-07-28 12:13:41.199939	2024-07-28 12:13:41.19807
4809	45	48	192	2024-07-28 11:57:18.242346	2024-07-28 12:14:08.45653	\N
4810	45	67	266	2024-07-28 11:57:18.242346	2024-07-28 12:14:39.944423	\N
4811	45	6	21	2024-07-28 11:57:18.242346	2024-07-28 12:14:49.669448	\N
4830	45	2	7	2024-07-28 11:57:18.242346	2024-07-28 12:29:24.513342	\N
4812	45	45	\N	2024-07-28 11:57:18.242346	2024-07-28 12:15:02.355882	2024-07-28 12:15:02.354271
4831	45	88	352	2024-07-28 11:57:18.242346	2024-07-28 12:29:37.470771	\N
4832	45	90	358	2024-07-28 11:57:18.242346	2024-07-28 12:29:46.264992	\N
4813	45	71	\N	2024-07-28 11:57:18.242346	2024-07-28 12:16:32.629852	2024-07-28 12:16:32.626171
4814	45	4	13	2024-07-28 11:57:18.242346	2024-07-28 12:17:00.357226	\N
4815	45	5	20	2024-07-28 11:57:18.242346	2024-07-28 12:17:07.317919	\N
4933	47	17	66	2024-07-28 15:34:10.203806	2024-07-28 15:35:31.580197	\N
4817	45	29	114	2024-07-28 11:57:18.242346	2024-07-28 12:18:20.474916	\N
4818	45	44	176	2024-07-28 11:57:18.242346	2024-07-28 12:18:52.308972	\N
4934	47	89	355	2024-07-28 15:34:10.203806	2024-07-28 15:36:06.632818	\N
4935	47	87	347	2024-07-28 15:34:10.203806	2024-07-28 15:36:18.598306	\N
4936	47	72	287	2024-07-28 15:34:10.203806	2024-07-28 15:36:33.317923	\N
4820	45	69	\N	2024-07-28 11:57:18.242346	2024-07-28 12:20:15.999444	2024-07-28 12:20:15.99549
4834	45	27	\N	2024-07-28 11:57:18.242346	2024-07-28 12:32:40.559869	2024-07-28 12:32:40.55791
4819	45	16	\N	2024-07-28 11:57:18.242346	2024-07-28 12:20:21.255221	2024-07-28 12:20:21.25364
4821	45	86	343	2024-07-28 11:57:18.242346	2024-07-28 12:21:06.706517	\N
4937	47	3	11	2024-07-28 15:34:10.203806	2024-07-28 15:37:20.288398	\N
4938	47	75	298	2024-07-28 15:34:10.203806	2024-07-28 15:37:37.97915	\N
4822	45	60	\N	2024-07-28 11:57:18.242346	2024-07-28 12:21:45.196146	2024-07-28 12:21:45.193981
4823	45	20	79	2024-07-28 11:57:18.242346	2024-07-28 12:23:16.073634	\N
4824	45	1	4	2024-07-28 11:57:18.242346	2024-07-28 12:24:13.964514	\N
4825	45	57	227	2024-07-28 11:57:18.242346	2024-07-28 12:25:49.392683	\N
4835	45	30	\N	2024-07-28 11:57:18.242346	2024-07-28 12:35:04.864451	2024-07-28 12:35:04.862752
4939	47	45	178	2024-07-28 15:34:10.203806	2024-07-28 15:38:04.319758	\N
4826	45	31	\N	2024-07-28 11:57:18.242346	2024-07-28 12:26:32.590262	2024-07-28 12:26:32.587351
4827	45	62	246	2024-07-28 11:57:18.242346	2024-07-28 12:27:24.592528	\N
4940	47	67	266	2024-07-28 15:34:10.203806	2024-07-28 15:38:35.161668	\N
4836	45	40	\N	2024-07-28 11:57:18.242346	2024-07-28 12:36:52.246515	2024-07-28 12:36:52.244536
4866	45	27	106	2024-07-28 12:40:42.68577	2024-07-28 12:40:42.68577	\N
4941	47	59	235	2024-07-28 15:34:10.203806	2024-07-28 15:38:49.878921	\N
4833	45	36	\N	2024-07-28 11:57:18.242346	2024-07-28 12:40:45.239503	2024-07-28 12:40:45.237932
4942	47	47	187	2024-07-28 15:34:10.203806	2024-07-28 15:39:20.486918	\N
4867	45	36	\N	2024-07-28 12:40:45.331255	2024-07-28 12:40:46.2586	2024-07-28 12:40:46.256111
4943	47	15	58	2024-07-28 15:34:10.203806	2024-07-28 15:40:25.739069	\N
4868	45	36	\N	2024-07-28 12:40:47.154678	2024-07-28 12:40:48.634587	2024-07-28 12:40:48.632832
4869	45	36	\N	2024-07-28 12:40:49.133545	2024-07-28 12:40:49.234285	2024-07-28 12:40:49.215786
4855	45	17	\N	2024-07-28 12:29:16.847936	2024-07-28 12:43:38.860879	2024-07-28 12:43:38.8591
4816	45	70	\N	2024-07-28 11:57:18.242346	2024-07-28 12:47:10.34761	2024-07-28 12:47:10.342874
2189	27	45	178	2024-07-28 05:49:25.990528	2024-07-28 06:04:00.626642	\N
2863	26	36	\N	2024-07-28 06:00:58.555446	2024-07-28 06:04:06.462674	2024-07-28 06:04:06.461063
2045	21	90	358	2024-07-28 05:42:41.06406	2024-07-28 06:04:28.092337	\N
2952	26	74	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2953	26	62	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2954	26	67	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2955	26	90	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2956	26	27	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2957	26	61	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2958	26	46	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2959	26	18	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2960	26	60	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2961	26	29	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2962	26	16	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2963	26	21	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2964	26	40	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2965	26	30	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2966	26	39	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2967	26	5	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2968	26	2	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2969	26	7	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2970	26	57	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2971	26	17	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2972	26	20	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2973	26	31	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2974	26	37	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2976	26	44	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2977	26	70	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2978	26	47	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2979	26	3	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2980	26	71	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2981	26	56	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2982	26	38	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2983	26	28	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2984	26	19	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2985	26	48	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2986	26	87	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2987	26	72	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2988	26	69	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2989	26	45	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2990	26	73	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2991	26	15	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2992	26	88	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2993	26	89	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2994	26	36	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2995	26	58	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2996	26	75	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2997	26	68	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2998	26	59	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2999	26	4	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
3000	26	6	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
3001	26	1	\N	2024-07-28 06:04:55.814429	2024-07-28 06:04:55.814429	\N
2975	26	86	343	2024-07-28 06:04:55.814429	2024-07-28 06:04:58.296041	\N
3006	31	74	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3007	31	59	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3008	31	57	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3009	31	44	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3010	31	15	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3011	31	89	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3012	31	47	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3013	31	58	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3014	31	21	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3015	31	28	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3016	31	60	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3017	31	16	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3018	31	1	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3019	31	56	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3021	31	18	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3022	31	19	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3023	31	61	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3024	31	6	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3025	31	86	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3026	31	3	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3028	31	75	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3029	31	17	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3030	31	7	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3031	31	71	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3032	31	68	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3033	31	72	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3034	31	5	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3035	31	62	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3036	31	29	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3037	31	30	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3038	31	88	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3039	31	2	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3040	31	46	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3041	31	20	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3042	31	38	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3043	31	87	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3044	31	67	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3045	31	90	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3046	31	36	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3048	31	40	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3049	31	69	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3050	31	31	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
3051	31	37	\N	2024-07-28 06:05:49.984231	2024-07-28 06:05:49.984231	\N
2441	29	4	13	2024-07-28 05:51:28.979198	2024-07-28 06:05:51.070997	\N
3002	31	70	277	2024-07-28 06:05:49.984231	2024-07-28 06:06:03.615737	\N
770	16	36	143	2024-07-28 05:33:46.633048	2024-07-28 06:06:08.997789	\N
3003	31	73	290	2024-07-28 06:05:49.984231	2024-07-28 06:06:29.469812	\N
3004	31	45	178	2024-07-28 06:05:49.984231	2024-07-28 06:06:53.592271	\N
3005	31	27	106	2024-07-28 06:05:49.984231	2024-07-28 06:07:15.722046	\N
3052	26	86	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3053	26	29	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3054	26	17	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3055	26	4	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3056	26	58	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3057	26	68	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3058	26	2	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3059	26	60	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3060	26	48	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3061	26	15	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3062	26	21	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3063	26	44	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3064	26	90	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3065	26	38	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3066	26	3	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3067	26	88	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3068	26	75	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3069	26	87	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3070	26	59	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3071	26	57	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3072	26	20	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3073	26	74	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3074	26	62	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3075	26	40	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3020	31	4	13	2024-07-28 06:05:49.984231	2024-07-28 06:10:11.191472	\N
3027	31	39	156	2024-07-28 06:05:49.984231	2024-07-28 06:12:12.884601	\N
3047	31	48	190	2024-07-28 06:05:49.984231	2024-07-28 06:14:27.712204	\N
4788	45	89	355	2024-07-28 11:57:18.242346	2024-07-28 11:57:47.104906	\N
4802	45	37	147	2024-07-28 11:57:18.242346	2024-07-28 12:07:34.756612	\N
4856	45	27	\N	2024-07-28 12:32:41.46708	2024-07-28 12:33:20.628379	2024-07-28 12:33:20.626586
4870	45	36	\N	2024-07-28 12:40:49.922753	2024-07-28 12:41:34.682897	2024-07-28 12:41:34.681041
3076	26	1	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3077	26	36	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3078	26	19	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3079	26	7	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3080	26	69	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3081	26	6	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3082	26	56	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3083	26	5	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3084	26	27	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3085	26	71	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3086	26	70	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3087	26	31	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3088	26	67	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3089	26	28	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3090	26	72	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3091	26	18	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3092	26	30	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3093	26	73	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3094	26	39	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3095	26	37	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3096	26	61	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3097	26	45	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3098	26	47	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3099	26	46	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3100	26	16	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
3101	26	89	\N	2024-07-28 06:07:16.667455	2024-07-28 06:07:16.667455	\N
1263	6	30	\N	2024-07-28 05:37:34.819981	2024-07-28 06:07:22.27499	2024-07-28 06:07:22.273506
3102	31	17	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3103	31	18	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3104	31	38	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3105	31	71	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3121	31	5	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3122	31	47	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3123	31	46	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3124	31	87	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3125	31	90	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3126	31	29	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3127	31	61	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3128	31	70	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3129	31	3	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3130	31	73	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3131	31	19	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3132	31	30	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3133	31	37	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3134	31	68	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3135	31	60	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3136	31	58	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3137	31	44	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3138	31	21	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3139	31	1	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3140	31	20	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3141	31	40	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3142	31	74	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3143	31	86	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3144	31	62	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3145	31	89	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3146	31	88	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3147	31	28	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3148	31	36	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3149	31	75	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3150	31	56	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
3151	31	16	\N	2024-07-28 06:07:37.098289	2024-07-28 06:07:37.098289	\N
775	16	17	\N	2024-07-28 05:33:46.633048	2024-07-28 06:07:52.971647	2024-07-28 06:07:52.969741
3106	31	2	6	2024-07-28 06:07:37.098289	2024-07-28 06:07:57.405965	\N
3107	31	67	266	2024-07-28 06:07:37.098289	2024-07-28 06:08:12.39713	\N
3108	31	57	226	2024-07-28 06:07:37.098289	2024-07-28 06:08:29.302283	\N
3109	31	27	105	2024-07-28 06:07:37.098289	2024-07-28 06:08:51.548399	\N
3152	16	17	65	2024-07-28 06:07:54.014914	2024-07-28 06:08:57.262192	\N
2647	24	88	352	2024-07-28 05:52:45.391096	2024-07-28 06:09:16.270917	\N
3110	31	15	60	2024-07-28 06:07:37.098289	2024-07-28 06:09:35.758175	\N
3171	29	18	\N	2024-07-28 06:11:53.145671	2024-07-28 06:12:04.309029	2024-07-28 06:12:04.307092
3117	31	7	27	2024-07-28 06:07:37.098289	2024-07-28 06:12:45.386065	\N
3111	31	4	\N	2024-07-28 06:07:37.098289	2024-07-28 06:10:04.223886	2024-07-28 06:10:04.222351
3112	31	69	273	2024-07-28 06:07:37.098289	2024-07-28 06:10:30.878034	\N
2060	21	38	151	2024-07-28 05:42:41.06406	2024-07-28 06:10:35.453522	\N
3113	31	45	180	2024-07-28 06:07:37.098289	2024-07-28 06:10:56.178037	\N
3114	31	6	21	2024-07-28 06:07:37.098289	2024-07-28 06:11:01.909288	\N
3115	31	31	122	2024-07-28 06:07:37.098289	2024-07-28 06:11:26.479642	\N
3116	31	39	\N	2024-07-28 06:07:37.098289	2024-07-28 06:12:01.891682	2024-07-28 06:12:01.865396
3154	29	37	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3155	29	61	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3156	29	71	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3157	29	59	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3158	29	70	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3159	29	31	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3160	29	86	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3161	29	44	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3162	29	17	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3163	29	87	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3164	29	74	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3165	29	2	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3166	29	36	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3167	29	38	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3168	29	39	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3169	29	19	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3170	29	6	\N	2024-07-28 06:11:53.145671	2024-07-28 06:11:53.145671	\N
3172	29	3	11	2024-07-28 06:11:53.145671	2024-07-28 06:13:07.888468	\N
3118	31	59	235	2024-07-28 06:07:37.098289	2024-07-28 06:13:47.140535	\N
3173	29	28	112	2024-07-28 06:11:53.145671	2024-07-28 06:13:53.238012	\N
3119	31	72	287	2024-07-28 06:07:37.098289	2024-07-28 06:13:57.406341	\N
3120	31	48	\N	2024-07-28 06:07:37.098289	2024-07-28 06:14:17.353106	2024-07-28 06:14:17.351431
3174	29	7	26	2024-07-28 06:11:53.145671	2024-07-28 06:14:38.995343	\N
3175	29	75	298	2024-07-28 06:11:53.145671	2024-07-28 06:14:52.441766	\N
3176	29	56	222	2024-07-28 06:11:53.145671	2024-07-28 06:15:22.867031	\N
3177	29	57	227	2024-07-28 06:11:53.145671	2024-07-28 06:15:44.136731	\N
3178	29	68	270	2024-07-28 06:11:53.145671	2024-07-28 06:16:14.417094	\N
3179	29	5	17	2024-07-28 06:11:53.145671	2024-07-28 06:16:28.6862	\N
3180	29	72	287	2024-07-28 06:11:53.145671	2024-07-28 06:16:51.951919	\N
3181	29	89	356	2024-07-28 06:11:53.145671	2024-07-28 06:17:16.877758	\N
3182	29	47	185	2024-07-28 06:11:53.145671	2024-07-28 06:17:37.794597	\N
3183	29	48	191	2024-07-28 06:11:53.145671	2024-07-28 06:18:07.007357	\N
3184	29	60	238	2024-07-28 06:11:53.145671	2024-07-28 06:18:17.86979	\N
3185	29	46	181	2024-07-28 06:11:53.145671	2024-07-28 06:19:04.586351	\N
3186	29	30	118	2024-07-28 06:11:53.145671	2024-07-28 06:19:22.505243	\N
3187	29	20	77	2024-07-28 06:11:53.145671	2024-07-28 06:19:37.644553	\N
3188	29	73	292	2024-07-28 06:11:53.145671	2024-07-28 06:20:04.211362	\N
3189	29	69	273	2024-07-28 06:11:53.145671	2024-07-28 06:20:23.631114	\N
3190	29	1	1	2024-07-28 06:11:53.145671	2024-07-28 06:21:07.239828	\N
3191	29	90	\N	2024-07-28 06:11:53.145671	2024-07-28 06:21:27.42045	2024-07-28 06:21:27.418893
4789	45	21	84	2024-07-28 11:57:18.242346	2024-07-28 11:58:33.072684	\N
3153	30	17	\N	2024-07-28 06:09:42.202762	2024-07-28 06:44:01.250555	2024-07-28 06:44:01.243946
4803	45	39	156	2024-07-28 11:57:18.242346	2024-07-28 12:08:34.324236	\N
4857	45	27	\N	2024-07-28 12:33:21.409367	2024-07-28 12:38:09.894689	2024-07-28 12:38:09.887323
4871	45	36	\N	2024-07-28 12:41:49.357028	2024-07-28 12:42:14.083107	2024-07-28 12:42:14.081347
4947	47	30	117	2024-07-28 15:34:10.203806	2024-07-28 15:41:55.122876	\N
4949	47	5	20	2024-07-28 15:34:10.203806	2024-07-28 15:42:46.282867	\N
4950	47	57	227	2024-07-28 15:34:10.203806	2024-07-28 15:43:01.44379	\N
4951	47	44	176	2024-07-28 15:34:10.203806	2024-07-28 15:43:20.900671	\N
4952	47	16	\N	2024-07-28 15:34:10.203806	2024-07-28 15:44:01.710691	2024-07-28 15:44:01.708242
4953	47	70	277	2024-07-28 15:34:10.203806	2024-07-28 15:44:42.751192	\N
347	7	61	242	2024-07-28 05:30:58.029349	2024-07-28 06:12:05.699923	\N
2200	27	29	\N	2024-07-28 05:49:25.990528	2024-07-28 06:12:12.387016	2024-07-28 06:12:12.382247
3204	27	29	115	2024-07-28 06:12:14.310875	2024-07-28 06:12:14.310875	\N
1307	6	86	\N	2024-07-28 05:37:34.819981	2024-07-28 06:13:44.198277	2024-07-28 06:13:44.196607
1269	6	68	\N	2024-07-28 05:37:34.819981	2024-07-28 06:16:22.287727	2024-07-28 06:16:22.284635
3205	6	68	\N	2024-07-28 06:16:24.083412	2024-07-28 06:16:33.905788	2024-07-28 06:16:33.904023
3206	6	68	269	2024-07-28 06:16:34.830296	2024-07-28 06:16:34.830296	\N
2366	28	47	187	2024-07-28 05:50:43.929308	2024-07-28 06:16:37.742508	\N
2662	24	2	7	2024-07-28 05:52:45.391096	2024-07-28 06:19:01.960101	\N
3207	27	44	176	2024-07-28 06:21:44.415988	2024-07-28 06:21:44.415988	\N
3192	29	29	115	2024-07-28 06:11:53.145671	2024-07-28 06:21:57.475623	\N
3193	29	88	350	2024-07-28 06:11:53.145671	2024-07-28 06:22:05.460987	\N
3194	29	21	83	2024-07-28 06:11:53.145671	2024-07-28 06:22:17.92938	\N
3195	29	27	107	2024-07-28 06:11:53.145671	2024-07-28 06:22:41.69014	\N
3196	29	62	246	2024-07-28 06:11:53.145671	2024-07-28 06:23:29.902338	\N
4790	45	15	\N	2024-07-28 11:57:18.242346	2024-07-28 11:59:07.732006	2024-07-28 11:59:07.729453
3197	29	67	\N	2024-07-28 06:11:53.145671	2024-07-28 06:23:53.087734	2024-07-28 06:23:53.086048
2442	29	67	\N	2024-07-28 05:51:28.979198	2024-07-28 06:23:54.112512	2024-07-28 06:23:54.11096
3208	29	67	268	2024-07-28 06:23:55.577472	2024-07-28 06:23:55.577472	\N
3198	29	4	13	2024-07-28 06:11:53.145671	2024-07-28 06:24:11.720332	\N
3199	29	45	178	2024-07-28 06:11:53.145671	2024-07-28 06:24:31.109235	\N
3200	29	15	58	2024-07-28 06:11:53.145671	2024-07-28 06:25:10.958752	\N
4837	45	15	60	2024-07-28 11:59:09.156711	2024-07-28 11:59:09.156711	\N
3209	30	31	\N	2024-07-28 06:25:17.921721	2024-07-28 06:25:29.684419	2024-07-28 06:25:29.682344
3210	30	31	122	2024-07-28 06:25:30.93182	2024-07-28 06:25:30.93182	\N
2217	27	72	287	2024-07-28 05:49:25.990528	2024-07-28 06:25:34.828912	\N
3201	29	16	62	2024-07-28 06:11:53.145671	2024-07-28 06:25:44.230109	\N
3202	29	58	229	2024-07-28 06:11:53.145671	2024-07-28 06:26:06.087274	\N
3211	31	71	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3212	31	27	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3213	31	18	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3214	31	3	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3215	31	17	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3216	31	73	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3217	31	56	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3218	31	31	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3219	31	60	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3220	31	62	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3221	31	88	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3222	31	72	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3224	31	37	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3225	31	61	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3226	31	69	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3227	31	4	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3228	31	19	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3229	31	89	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3230	31	70	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3231	31	40	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3232	31	45	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3233	31	47	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3234	31	57	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3235	31	59	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3236	31	67	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3237	31	29	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3238	31	39	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3239	31	30	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3240	31	21	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3241	31	38	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3242	31	16	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3243	31	44	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3244	31	6	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3245	31	86	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3246	31	15	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3247	31	68	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3248	31	36	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3249	31	20	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3250	31	74	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3251	31	58	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3252	31	2	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3253	31	87	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3254	31	46	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3255	31	5	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3256	31	1	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3257	31	7	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3258	31	90	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3259	31	75	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3260	31	28	\N	2024-07-28 06:26:45.196557	2024-07-28 06:26:45.196557	\N
3223	31	48	190	2024-07-28 06:26:45.196557	2024-07-28 06:26:47.604652	\N
2677	24	89	355	2024-07-28 05:52:45.391096	2024-07-28 06:27:03.271486	\N
3203	29	40	158	2024-07-28 06:11:53.145671	2024-07-28 06:27:04.444293	\N
3261	27	57	228	2024-07-28 06:32:33.543636	2024-07-28 06:32:33.543636	\N
2226	27	39	\N	2024-07-28 05:49:25.990528	2024-07-28 06:33:41.393406	2024-07-28 06:33:41.392045
3262	27	39	156	2024-07-28 06:33:42.613841	2024-07-28 06:33:42.613841	\N
3263	28	45	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3264	28	6	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3265	28	70	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3266	28	87	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3267	28	72	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3268	28	48	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3269	28	38	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3270	28	44	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3271	28	19	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3272	28	40	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3273	28	62	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3274	28	67	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3275	28	5	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3276	28	39	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3277	28	75	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3278	28	2	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3279	28	90	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3280	28	27	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3281	28	58	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3282	28	31	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3283	28	69	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3284	28	21	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3285	28	88	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3286	28	17	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3287	28	37	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3288	28	1	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3289	28	20	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3290	28	74	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3291	28	56	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3292	28	29	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3293	28	3	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3294	28	59	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
4872	45	36	141	2024-07-28 12:42:15.370606	2024-07-28 12:42:15.370606	\N
4804	45	18	\N	2024-07-28 11:57:18.242346	2024-07-28 12:09:30.459698	2024-07-28 12:09:30.457981
4844	45	18	\N	2024-07-28 12:09:31.530654	2024-07-28 12:09:38.648491	2024-07-28 12:09:38.646729
4858	45	30	\N	2024-07-28 12:35:05.807676	2024-07-28 12:35:38.86779	2024-07-28 12:35:38.865348
4955	47	19	76	2024-07-28 15:34:10.203806	2024-07-28 15:45:19.943331	\N
4956	47	28	110	2024-07-28 15:34:10.203806	2024-07-28 15:45:33.690181	\N
4957	47	40	159	2024-07-28 15:34:10.203806	2024-07-28 15:46:01.148528	\N
4959	47	7	26	2024-07-28 15:34:10.203806	2024-07-28 15:46:32.978024	\N
4960	47	20	79	2024-07-28 15:34:10.203806	2024-07-28 15:46:48.054552	\N
4961	47	88	352	2024-07-28 15:34:10.203806	2024-07-28 15:47:03.017103	\N
4962	47	56	223	2024-07-28 15:34:10.203806	2024-07-28 15:47:37.313933	\N
4963	47	73	290	2024-07-28 15:34:10.203806	2024-07-28 15:47:48.695695	\N
4964	47	62	246	2024-07-28 15:34:10.203806	2024-07-28 15:47:57.96486	\N
4965	47	90	358	2024-07-28 15:34:10.203806	2024-07-28 15:48:07.503135	\N
4966	47	46	181	2024-07-28 15:34:10.203806	2024-07-28 15:48:17.831751	\N
4967	47	37	147	2024-07-28 15:34:10.203806	2024-07-28 15:48:48.121128	\N
3295	28	47	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3296	28	7	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3297	28	89	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3298	28	68	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3299	28	73	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3300	28	28	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3301	28	18	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3302	28	57	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3303	28	15	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3304	28	46	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3305	28	86	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3306	28	61	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3307	28	30	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3308	28	4	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3309	28	36	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3310	28	16	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3311	28	71	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3312	28	60	\N	2024-07-28 06:35:29.688667	2024-07-28 06:35:29.688667	\N
3349	30	71	\N	2024-07-28 06:40:15.516984	2024-07-28 06:40:15.516984	\N
3350	30	57	\N	2024-07-28 06:40:15.516984	2024-07-28 06:40:15.516984	\N
3351	30	18	\N	2024-07-28 06:40:15.516984	2024-07-28 06:40:15.516984	\N
3352	30	20	\N	2024-07-28 06:40:15.516984	2024-07-28 06:40:15.516984	\N
3353	30	47	\N	2024-07-28 06:40:15.516984	2024-07-28 06:40:15.516984	\N
3354	30	74	\N	2024-07-28 06:40:15.516984	2024-07-28 06:40:15.516984	\N
3357	30	6	\N	2024-07-28 06:40:15.516984	2024-07-28 06:40:15.516984	\N
3358	30	3	\N	2024-07-28 06:40:15.516984	2024-07-28 06:40:15.516984	\N
3359	30	27	\N	2024-07-28 06:40:15.516984	2024-07-28 06:40:15.516984	\N
3360	30	46	\N	2024-07-28 06:40:15.516984	2024-07-28 06:40:15.516984	\N
3361	30	61	\N	2024-07-28 06:40:15.516984	2024-07-28 06:40:15.516984	\N
3362	30	7	\N	2024-07-28 06:40:15.516984	2024-07-28 06:40:15.516984	\N
3356	30	58	232	2024-07-28 06:40:15.516984	2024-07-28 06:41:13.858937	\N
3363	24	62	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3364	24	3	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3365	24	20	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3366	24	5	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3367	24	60	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3368	24	69	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3369	24	74	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3370	24	40	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3371	24	36	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3372	24	71	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3373	24	72	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3374	24	6	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3375	24	75	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3376	24	16	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3377	24	89	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3378	24	44	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3379	24	73	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3380	24	58	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3381	24	18	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3382	24	30	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3383	24	88	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3384	24	90	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3385	24	46	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3386	24	67	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3387	24	59	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3388	24	39	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3389	24	2	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3390	24	7	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3391	24	37	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3392	24	70	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3393	24	21	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3394	24	17	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3395	24	4	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3396	24	48	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3397	24	38	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3398	24	47	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3399	24	87	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3400	24	27	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3401	24	31	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3402	24	19	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3403	24	61	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3404	24	57	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3405	24	68	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3406	24	15	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3407	24	45	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3408	24	29	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3409	24	1	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3410	24	56	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3411	24	86	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3412	24	28	\N	2024-07-28 06:41:44.568574	2024-07-28 06:41:44.568574	\N
3355	30	48	192	2024-07-28 06:40:15.516984	2024-07-28 06:42:35.373517	\N
3313	30	30	117	2024-07-28 06:40:15.516984	2024-07-28 06:43:18.220568	\N
3314	30	17	\N	2024-07-28 06:40:15.516984	2024-07-28 06:44:00.417569	2024-07-28 06:44:00.415368
3317	30	56	222	2024-07-28 06:40:15.516984	2024-07-28 06:45:28.668109	\N
3413	30	17	65	2024-07-28 06:44:02.857218	2024-07-28 06:44:02.857218	\N
3315	30	87	347	2024-07-28 06:40:15.516984	2024-07-28 06:44:17.368167	\N
3316	30	67	266	2024-07-28 06:40:15.516984	2024-07-28 06:44:48.042651	\N
3318	30	15	60	2024-07-28 06:40:15.516984	2024-07-28 06:46:44.538156	\N
3319	30	69	274	2024-07-28 06:40:15.516984	2024-07-28 06:46:49.228153	\N
3320	30	2	7	2024-07-28 06:40:15.516984	2024-07-28 06:46:53.956963	\N
3321	30	86	343	2024-07-28 06:40:15.516984	2024-07-28 06:46:55.968897	\N
3324	30	88	352	2024-07-28 06:40:15.516984	2024-07-28 06:47:49.187496	\N
3325	30	44	173	2024-07-28 06:40:15.516984	2024-07-28 06:47:52.688536	\N
3322	30	37	\N	2024-07-28 06:40:15.516984	2024-07-28 06:47:36.365587	2024-07-28 06:47:36.363779
3323	30	75	298	2024-07-28 06:40:15.516984	2024-07-28 06:47:42.407443	\N
3326	30	68	269	2024-07-28 06:40:15.516984	2024-07-28 06:47:56.586948	\N
3327	30	45	178	2024-07-28 06:40:15.516984	2024-07-28 06:48:15.856879	\N
3328	30	4	13	2024-07-28 06:40:15.516984	2024-07-28 06:48:18.475556	\N
3329	30	1	4	2024-07-28 06:40:15.516984	2024-07-28 06:48:21.93807	\N
3330	30	62	246	2024-07-28 06:40:15.516984	2024-07-28 06:48:24.938918	\N
3331	30	60	238	2024-07-28 06:40:15.516984	2024-07-28 06:48:34.989376	\N
3332	30	5	20	2024-07-28 06:40:15.516984	2024-07-28 06:49:22.61664	\N
3333	30	31	122	2024-07-28 06:40:15.516984	2024-07-28 06:49:33.151759	\N
3334	30	90	358	2024-07-28 06:40:15.516984	2024-07-28 06:49:39.438526	\N
3414	30	72	287	2024-07-28 06:50:06.918284	2024-07-28 06:50:06.918284	\N
3336	30	19	76	2024-07-28 06:40:15.516984	2024-07-28 06:50:12.507485	\N
3335	30	72	\N	2024-07-28 06:40:15.516984	2024-07-28 06:50:04.454026	2024-07-28 06:50:04.451477
3337	30	36	143	2024-07-28 06:40:15.516984	2024-07-28 06:50:32.073192	\N
3338	30	21	81	2024-07-28 06:40:15.516984	2024-07-28 06:50:35.504297	\N
3339	30	73	290	2024-07-28 06:40:15.516984	2024-07-28 06:50:39.0679	\N
3340	30	70	277	2024-07-28 06:40:15.516984	2024-07-28 06:50:42.529363	\N
3341	30	16	63	2024-07-28 06:40:15.516984	2024-07-28 06:51:08.357911	\N
3342	30	40	159	2024-07-28 06:40:15.516984	2024-07-28 06:51:42.835062	\N
3343	30	28	110	2024-07-28 06:40:15.516984	2024-07-28 06:51:53.159193	\N
3344	30	89	355	2024-07-28 06:40:15.516984	2024-07-28 06:52:30.310059	\N
3345	30	38	151	2024-07-28 06:40:15.516984	2024-07-28 06:52:37.860186	\N
3346	30	29	114	2024-07-28 06:40:15.516984	2024-07-28 06:52:45.912512	\N
3347	30	39	156	2024-07-28 06:40:15.516984	2024-07-28 06:53:09.979478	\N
3348	30	59	233	2024-07-28 06:40:15.516984	2024-07-28 06:53:23.071677	\N
4792	45	46	181	2024-07-28 11:57:18.242346	2024-07-28 12:00:11.815459	\N
3416	32	20	79	2024-07-28 07:04:35.988334	2024-07-28 07:05:01.408154	\N
3417	32	60	238	2024-07-28 07:04:35.988334	2024-07-28 07:05:18.259365	\N
3418	32	5	20	2024-07-28 07:04:35.988334	2024-07-28 07:06:18.711678	\N
3420	32	27	105	2024-07-28 07:04:35.988334	2024-07-28 07:06:42.45913	\N
3421	32	59	235	2024-07-28 07:04:35.988334	2024-07-28 07:06:47.941391	\N
3422	32	90	358	2024-07-28 07:04:35.988334	2024-07-28 07:06:52.78196	\N
3423	32	72	287	2024-07-28 07:04:35.988334	2024-07-28 07:07:03.641069	\N
3424	32	1	4	2024-07-28 07:04:35.988334	2024-07-28 07:07:07.06672	\N
3425	32	2	7	2024-07-28 07:04:35.988334	2024-07-28 07:07:11.044394	\N
3426	32	74	295	2024-07-28 07:04:35.988334	2024-07-28 07:07:23.181726	\N
3427	32	68	269	2024-07-28 07:04:35.988334	2024-07-28 07:07:31.54397	\N
3415	32	30	117	2024-07-28 07:04:35.988334	2024-07-28 07:04:52.460983	\N
3419	32	69	274	2024-07-28 07:04:35.988334	2024-07-28 07:06:25.956271	\N
3428	32	36	142	2024-07-28 07:04:35.988334	2024-07-28 07:08:48.253429	\N
3429	32	4	13	2024-07-28 07:04:35.988334	2024-07-28 07:08:52.572858	\N
3430	32	47	187	2024-07-28 07:04:35.988334	2024-07-28 07:09:15.218252	\N
3431	32	6	21	2024-07-28 07:04:35.988334	2024-07-28 07:09:19.566207	\N
3432	32	17	66	2024-07-28 07:04:35.988334	2024-07-28 07:09:29.816175	\N
3433	32	61	242	2024-07-28 07:04:35.988334	2024-07-28 07:09:35.611696	\N
3434	32	73	290	2024-07-28 07:04:35.988334	2024-07-28 07:09:42.232358	\N
3435	32	16	63	2024-07-28 07:04:35.988334	2024-07-28 07:09:50.602531	\N
3436	32	62	246	2024-07-28 07:04:35.988334	2024-07-28 07:09:53.801346	\N
3437	32	28	110	2024-07-28 07:04:35.988334	2024-07-28 07:10:01.335234	\N
3438	32	89	355	2024-07-28 07:04:35.988334	2024-07-28 07:10:15.205091	\N
3439	32	39	156	2024-07-28 07:04:35.988334	2024-07-28 07:11:28.317428	\N
3440	32	18	71	2024-07-28 07:04:35.988334	2024-07-28 07:11:36.089593	\N
3441	32	48	192	2024-07-28 07:04:35.988334	2024-07-28 07:11:58.154165	\N
3442	32	3	11	2024-07-28 07:04:35.988334	2024-07-28 07:12:06.740361	\N
3443	32	75	298	2024-07-28 07:04:35.988334	2024-07-28 07:12:13.568431	\N
3444	32	15	58	2024-07-28 07:04:35.988334	2024-07-28 07:13:01.418967	\N
3445	32	57	226	2024-07-28 07:04:35.988334	2024-07-28 07:14:02.391426	\N
3446	32	58	230	2024-07-28 07:04:35.988334	2024-07-28 07:14:07.534775	\N
3447	32	87	347	2024-07-28 07:04:35.988334	2024-07-28 07:14:17.317185	\N
3448	32	21	81	2024-07-28 07:04:35.988334	2024-07-28 07:14:22.878715	\N
3449	32	88	352	2024-07-28 07:04:35.988334	2024-07-28 07:14:25.91131	\N
3450	32	56	223	2024-07-28 07:04:35.988334	2024-07-28 07:15:38.771389	\N
3451	32	31	122	2024-07-28 07:04:35.988334	2024-07-28 07:16:06.699626	\N
3452	32	86	343	2024-07-28 07:04:35.988334	2024-07-28 07:16:17.661723	\N
3453	32	38	151	2024-07-28 07:04:35.988334	2024-07-28 07:16:24.949788	\N
3454	32	70	277	2024-07-28 07:04:35.988334	2024-07-28 07:16:30.589043	\N
3455	32	71	282	2024-07-28 07:04:35.988334	2024-07-28 07:16:41.048354	\N
3456	32	19	76	2024-07-28 07:04:35.988334	2024-07-28 07:16:44.044096	\N
3457	32	37	146	2024-07-28 07:04:35.988334	2024-07-28 07:16:58.634148	\N
3458	32	44	176	2024-07-28 07:04:35.988334	2024-07-28 07:17:04.17755	\N
3459	32	67	266	2024-07-28 07:04:35.988334	2024-07-28 07:17:11.948794	\N
3460	32	45	178	2024-07-28 07:04:35.988334	2024-07-28 07:17:17.879061	\N
3461	32	7	26	2024-07-28 07:04:35.988334	2024-07-28 07:17:23.727922	\N
3462	32	46	181	2024-07-28 07:04:35.988334	2024-07-28 07:17:33.608893	\N
3463	32	40	159	2024-07-28 07:04:35.988334	2024-07-28 07:17:43.843306	\N
3465	33	30	117	2024-07-28 09:39:45.423353	2024-07-28 09:39:56.861924	\N
3464	32	29	114	2024-07-28 07:04:35.988334	2024-07-28 07:17:59.482544	\N
3466	33	40	159	2024-07-28 09:39:45.423353	2024-07-28 09:40:58.731188	\N
3467	33	68	269	2024-07-28 09:39:45.423353	2024-07-28 09:41:02.664311	\N
3468	33	27	105	2024-07-28 09:39:45.423353	2024-07-28 09:41:09.934135	\N
3469	33	5	20	2024-07-28 09:39:45.423353	2024-07-28 09:41:32.943673	\N
3470	33	45	178	2024-07-28 09:39:45.423353	2024-07-28 09:41:42.743275	\N
3471	33	57	227	2024-07-28 09:39:45.423353	2024-07-28 09:42:01.557982	\N
3472	33	86	343	2024-07-28 09:39:45.423353	2024-07-28 09:42:04.039685	\N
3473	33	19	76	2024-07-28 09:39:45.423353	2024-07-28 09:42:08.768131	\N
3474	33	44	176	2024-07-28 09:39:45.423353	2024-07-28 09:42:12.187399	\N
3475	33	3	10	2024-07-28 09:39:45.423353	2024-07-28 09:42:24.273529	\N
3476	33	61	242	2024-07-28 09:39:45.423353	2024-07-28 09:43:34.099101	\N
3477	33	29	114	2024-07-28 09:39:45.423353	2024-07-28 09:43:40.490981	\N
3478	33	37	148	2024-07-28 09:39:45.423353	2024-07-28 09:43:58.459158	\N
3479	33	20	79	2024-07-28 09:39:45.423353	2024-07-28 09:44:06.92226	\N
3515	34	58	230	2024-07-28 09:43:11.970459	2024-07-28 09:44:18.25942	\N
3516	34	89	355	2024-07-28 09:43:11.970459	2024-07-28 09:44:40.716555	\N
3480	33	71	282	2024-07-28 09:39:45.423353	2024-07-28 09:45:10.071137	\N
3481	33	7	26	2024-07-28 09:39:45.423353	2024-07-28 09:45:13.745647	\N
3482	33	72	287	2024-07-28 09:39:45.423353	2024-07-28 09:45:17.863503	\N
3483	33	73	290	2024-07-28 09:39:45.423353	2024-07-28 09:45:22.430885	\N
3517	34	60	238	2024-07-28 09:43:11.970459	2024-07-28 09:45:28.394191	\N
3484	33	16	63	2024-07-28 09:39:45.423353	2024-07-28 09:45:49.035049	\N
3485	33	75	298	2024-07-28 09:39:45.423353	2024-07-28 09:45:52.664022	\N
3486	33	58	230	2024-07-28 09:39:45.423353	2024-07-28 09:45:59.06627	\N
3487	33	48	192	2024-07-28 09:39:45.423353	2024-07-28 09:46:04.140379	\N
3488	33	21	81	2024-07-28 09:39:45.423353	2024-07-28 09:46:11.708611	\N
3489	33	59	235	2024-07-28 09:39:45.423353	2024-07-28 09:46:22.312948	\N
3490	33	89	355	2024-07-28 09:39:45.423353	2024-07-28 09:46:33.797266	\N
3491	33	36	141	2024-07-28 09:39:45.423353	2024-07-28 09:46:39.938536	\N
3492	33	4	\N	2024-07-28 09:39:45.423353	2024-07-28 09:46:48.199158	2024-07-28 09:46:48.197518
3493	33	60	238	2024-07-28 09:39:45.423353	2024-07-28 09:46:59.089353	\N
3494	33	15	58	2024-07-28 09:39:45.423353	2024-07-28 09:47:35.825659	\N
3495	33	87	347	2024-07-28 09:39:45.423353	2024-07-28 09:47:43.699674	\N
3496	33	18	71	2024-07-28 09:39:45.423353	2024-07-28 09:48:11.689776	\N
3497	33	88	352	2024-07-28 09:39:45.423353	2024-07-28 09:48:16.456966	\N
3498	33	39	156	2024-07-28 09:39:45.423353	2024-07-28 09:48:34.998503	\N
3499	33	17	66	2024-07-28 09:39:45.423353	2024-07-28 09:48:39.575151	\N
3500	33	70	277	2024-07-28 09:39:45.423353	2024-07-28 09:48:45.501617	\N
3501	33	47	187	2024-07-28 09:39:45.423353	2024-07-28 09:48:55.252308	\N
3502	33	62	246	2024-07-28 09:39:45.423353	2024-07-28 09:48:59.617287	\N
3503	33	1	4	2024-07-28 09:39:45.423353	2024-07-28 09:49:02.931323	\N
3518	34	29	114	2024-07-28 09:43:11.970459	2024-07-28 09:49:29.754966	\N
3519	34	86	343	2024-07-28 09:43:11.970459	2024-07-28 09:49:37.204169	\N
3504	33	46	181	2024-07-28 09:39:45.423353	2024-07-28 09:50:14.998402	\N
3505	33	90	358	2024-07-28 09:39:45.423353	2024-07-28 09:50:18.657745	\N
3520	34	39	156	2024-07-28 09:43:11.970459	2024-07-28 09:50:22.689016	\N
3506	33	31	122	2024-07-28 09:39:45.423353	2024-07-28 09:50:25.00305	\N
3507	33	38	151	2024-07-28 09:39:45.423353	2024-07-28 09:50:31.334327	\N
3521	34	88	352	2024-07-28 09:43:11.970459	2024-07-28 09:50:34.148295	\N
3508	33	69	274	2024-07-28 09:39:45.423353	2024-07-28 09:50:34.380108	\N
3509	33	56	223	2024-07-28 09:39:45.423353	2024-07-28 09:50:45.870595	\N
3510	33	67	266	2024-07-28 09:39:45.423353	2024-07-28 09:50:51.203712	\N
3511	33	28	110	2024-07-28 09:39:45.423353	2024-07-28 09:50:54.452648	\N
3512	33	2	7	2024-07-28 09:39:45.423353	2024-07-28 09:50:58.382961	\N
3513	33	74	295	2024-07-28 09:39:45.423353	2024-07-28 09:51:02.884387	\N
3522	34	17	66	2024-07-28 09:43:11.970459	2024-07-28 09:51:59.333265	\N
3514	33	6	21	2024-07-28 09:39:45.423353	2024-07-28 09:51:13.706087	\N
3523	34	3	11	2024-07-28 09:43:11.970459	2024-07-28 09:55:27.378792	\N
3524	34	71	282	2024-07-28 09:43:11.970459	2024-07-28 09:56:08.622081	\N
3525	34	56	223	2024-07-28 09:43:11.970459	2024-07-28 09:58:17.662572	\N
3526	34	37	147	2024-07-28 09:43:11.970459	2024-07-28 09:59:02.455641	\N
3527	34	74	\N	2024-07-28 09:43:11.970459	2024-07-28 10:00:51.056187	2024-07-28 10:00:51.054463
3528	34	31	122	2024-07-28 09:43:11.970459	2024-07-28 10:01:57.808898	\N
3529	34	62	245	2024-07-28 09:43:11.970459	2024-07-28 10:02:40.069911	\N
3530	34	68	269	2024-07-28 09:43:11.970459	2024-07-28 10:02:55.325663	\N
3531	34	90	358	2024-07-28 09:43:11.970459	2024-07-28 10:03:11.609725	\N
3532	34	67	266	2024-07-28 09:43:11.970459	2024-07-28 10:04:37.606921	\N
3533	34	20	79	2024-07-28 09:43:11.970459	2024-07-28 10:05:55.791558	\N
3534	34	73	290	2024-07-28 09:43:11.970459	2024-07-28 10:07:56.775638	\N
3535	34	5	20	2024-07-28 09:43:11.970459	2024-07-28 10:09:59.54972	\N
3536	34	27	107	2024-07-28 09:43:11.970459	2024-07-28 10:10:40.87715	\N
3537	34	72	\N	2024-07-28 09:43:11.970459	2024-07-28 10:11:17.694655	2024-07-28 10:11:17.693345
3538	34	70	277	2024-07-28 09:43:11.970459	2024-07-28 10:11:33.715986	\N
3539	34	69	274	2024-07-28 09:43:11.970459	2024-07-28 10:12:51.82129	\N
3540	34	48	192	2024-07-28 09:43:11.970459	2024-07-28 10:13:52.298693	\N
3541	34	44	176	2024-07-28 09:43:11.970459	2024-07-28 10:14:16.482815	\N
3542	34	7	26	2024-07-28 09:43:11.970459	2024-07-28 10:15:52.426503	\N
3543	34	21	81	2024-07-28 09:43:11.970459	2024-07-28 10:16:59.886201	\N
3544	34	45	178	2024-07-28 09:43:11.970459	2024-07-28 10:17:11.652107	\N
3545	34	6	21	2024-07-28 09:43:11.970459	2024-07-28 10:17:23.999121	\N
3546	34	19	76	2024-07-28 09:43:11.970459	2024-07-28 10:17:31.802132	\N
3547	34	15	58	2024-07-28 09:43:11.970459	2024-07-28 10:18:54.2784	\N
4794	45	7	26	2024-07-28 11:57:18.242346	2024-07-28 12:01:24.016417	\N
4845	45	18	\N	2024-07-28 12:10:25.466009	2024-07-28 12:10:25.543264	2024-07-28 12:10:25.541319
4859	45	30	\N	2024-07-28 12:35:50.26288	2024-07-28 12:35:50.741819	2024-07-28 12:35:50.740173
4874	45	17	65	2024-07-28 12:43:40.75085	2024-07-28 12:43:40.75085	\N
4873	45	17	\N	2024-07-28 12:43:39.340664	2024-07-28 12:43:39.533922	2024-07-28 12:43:39.531057
3565	35	88	352	2024-07-28 09:43:38.94316	2024-07-28 09:43:46.72838	\N
3566	35	39	156	2024-07-28 09:43:38.94316	2024-07-28 09:43:55.349001	\N
3567	35	89	355	2024-07-28 09:43:38.94316	2024-07-28 09:44:00.715563	\N
3568	35	74	295	2024-07-28 09:43:38.94316	2024-07-28 09:44:08.138844	\N
3569	35	67	266	2024-07-28 09:43:38.94316	2024-07-28 09:44:13.867729	\N
3570	35	4	13	2024-07-28 09:43:38.94316	2024-07-28 09:44:15.835646	\N
3571	35	56	223	2024-07-28 09:43:38.94316	2024-07-28 09:44:29.653127	\N
3572	35	90	358	2024-07-28 09:43:38.94316	2024-07-28 09:44:33.450741	\N
3573	35	46	181	2024-07-28 09:43:38.94316	2024-07-28 09:44:49.926596	\N
3574	35	68	269	2024-07-28 09:43:38.94316	2024-07-28 09:44:56.985614	\N
3575	35	47	187	2024-07-28 09:43:38.94316	2024-07-28 09:45:10.000403	\N
3576	35	58	230	2024-07-28 09:43:38.94316	2024-07-28 09:45:18.905197	\N
3578	35	19	76	2024-07-28 09:43:38.94316	2024-07-28 09:45:46.683599	\N
3579	35	75	298	2024-07-28 09:43:38.94316	2024-07-28 09:45:52.383551	\N
3580	35	29	114	2024-07-28 09:43:38.94316	2024-07-28 09:46:00.995376	\N
3581	35	61	242	2024-07-28 09:43:38.94316	2024-07-28 09:46:10.052113	\N
3615	33	4	13	2024-07-28 09:46:49.425438	2024-07-28 09:46:49.425438	\N
3583	35	44	176	2024-07-28 09:43:38.94316	2024-07-28 09:47:26.235365	\N
3584	35	20	79	2024-07-28 09:43:38.94316	2024-07-28 09:47:30.505327	\N
3585	35	36	141	2024-07-28 09:43:38.94316	2024-07-28 09:47:41.316195	\N
3586	35	28	110	2024-07-28 09:43:38.94316	2024-07-28 09:47:47.99731	\N
3587	35	7	26	2024-07-28 09:43:38.94316	2024-07-28 09:47:51.698255	\N
3588	35	31	122	2024-07-28 09:43:38.94316	2024-07-28 09:48:01.352069	\N
3589	35	6	21	2024-07-28 09:43:38.94316	2024-07-28 09:48:07.735553	\N
3590	35	40	159	2024-07-28 09:43:38.94316	2024-07-28 09:48:18.926718	\N
3591	35	17	66	2024-07-28 09:43:38.94316	2024-07-28 09:48:32.8618	\N
3592	35	38	151	2024-07-28 09:43:38.94316	2024-07-28 09:48:44.355874	\N
3593	35	2	7	2024-07-28 09:43:38.94316	2024-07-28 09:48:52.821772	\N
3594	35	59	235	2024-07-28 09:43:38.94316	2024-07-28 09:48:58.471489	\N
3595	35	15	58	2024-07-28 09:43:38.94316	2024-07-28 09:49:15.51893	\N
3596	35	1	4	2024-07-28 09:43:38.94316	2024-07-28 09:49:18.859323	\N
3598	35	3	11	2024-07-28 09:43:38.94316	2024-07-28 09:49:56.880254	\N
3599	35	57	227	2024-07-28 09:43:38.94316	2024-07-28 09:50:03.165227	\N
3600	35	73	290	2024-07-28 09:43:38.94316	2024-07-28 09:50:15.088588	\N
3602	35	72	287	2024-07-28 09:43:38.94316	2024-07-28 09:50:59.907266	\N
3601	35	16	63	2024-07-28 09:43:38.94316	2024-07-28 09:51:10.128923	\N
3603	35	71	282	2024-07-28 09:43:38.94316	2024-07-28 09:51:17.40118	\N
3604	35	70	277	2024-07-28 09:43:38.94316	2024-07-28 09:51:25.410472	\N
3605	35	21	81	2024-07-28 09:43:38.94316	2024-07-28 09:51:28.876448	\N
3616	33	72	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3617	33	39	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3618	33	3	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3619	33	69	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3620	33	59	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3621	33	17	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3622	33	40	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3623	33	5	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3624	33	90	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3625	33	47	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3626	33	62	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3627	33	75	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3628	33	36	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3629	33	18	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3630	33	48	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3631	33	86	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3632	33	60	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3633	33	70	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3634	33	29	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3635	33	21	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3636	33	31	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3637	33	56	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3638	33	15	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3639	33	68	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3640	33	88	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3641	33	27	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3642	33	7	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3643	33	1	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3644	33	57	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3645	33	28	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3606	35	45	178	2024-07-28 09:43:38.94316	2024-07-28 09:51:45.486543	\N
3607	35	86	343	2024-07-28 09:43:38.94316	2024-07-28 09:51:51.521246	\N
3608	35	27	106	2024-07-28 09:43:38.94316	2024-07-28 09:52:09.64369	\N
3609	35	18	71	2024-07-28 09:43:38.94316	2024-07-28 09:52:18.835032	\N
3610	35	62	246	2024-07-28 09:43:38.94316	2024-07-28 09:52:31.039939	\N
3611	35	30	117	2024-07-28 09:43:38.94316	2024-07-28 09:52:42.082437	\N
3612	35	69	274	2024-07-28 09:43:38.94316	2024-07-28 09:52:48.344134	\N
3613	35	87	347	2024-07-28 09:43:38.94316	2024-07-28 09:52:58.736967	\N
3614	35	60	238	2024-07-28 09:43:38.94316	2024-07-28 09:53:11.15688	\N
3577	35	48	192	2024-07-28 09:43:38.94316	2024-07-28 09:55:06.441786	\N
3582	35	37	147	2024-07-28 09:43:38.94316	2024-07-28 09:56:45.584299	\N
3553	34	59	233	2024-07-28 09:43:11.970459	2024-07-28 10:22:35.447063	\N
3597	35	5	20	2024-07-28 09:43:38.94316	2024-07-28 09:58:34.269956	\N
3554	34	4	13	2024-07-28 09:43:11.970459	2024-07-28 10:22:43.68362	\N
3548	34	57	\N	2024-07-28 09:43:11.970459	2024-07-28 10:19:49.086899	2024-07-28 10:19:49.085095
3549	34	47	187	2024-07-28 09:43:11.970459	2024-07-28 10:20:18.556579	\N
3550	34	46	181	2024-07-28 09:43:11.970459	2024-07-28 10:20:50.122301	\N
4982	47	16	63	2024-07-28 15:44:27.024028	2024-07-28 15:44:27.024028	\N
3555	34	40	\N	2024-07-28 09:43:11.970459	2024-07-28 10:23:38.299151	2024-07-28 10:23:38.296838
3551	34	61	\N	2024-07-28 09:43:11.970459	2024-07-28 10:21:36.048409	2024-07-28 10:21:36.045963
3552	34	36	143	2024-07-28 09:43:11.970459	2024-07-28 10:22:06.672527	\N
3556	34	28	110	2024-07-28 09:43:11.970459	2024-07-28 10:24:20.205182	\N
3557	34	38	151	2024-07-28 09:43:11.970459	2024-07-28 10:24:44.126725	\N
3558	34	75	298	2024-07-28 09:43:11.970459	2024-07-28 10:25:39.441623	\N
3559	34	18	72	2024-07-28 09:43:11.970459	2024-07-28 10:26:21.341688	\N
3560	34	30	117	2024-07-28 09:43:11.970459	2024-07-28 10:26:48.138048	\N
3561	34	2	7	2024-07-28 09:43:11.970459	2024-07-28 10:26:54.433507	\N
3562	34	87	347	2024-07-28 09:43:11.970459	2024-07-28 10:27:03.250876	\N
3563	34	1	4	2024-07-28 09:43:11.970459	2024-07-28 10:28:03.331916	\N
4795	45	72	\N	2024-07-28 11:57:18.242346	2024-07-28 12:01:53.183244	2024-07-28 12:01:53.178649
3564	34	16	63	2024-07-28 09:43:11.970459	2024-07-28 10:28:52.869977	\N
4805	45	56	\N	2024-07-28 11:57:18.242346	2024-07-28 12:10:35.927289	2024-07-28 12:10:35.923442
4968	47	68	269	2024-07-28 15:34:10.203806	2024-07-28 15:48:54.619846	\N
4860	45	30	\N	2024-07-28 12:36:20.552033	2024-07-28 12:37:32.861421	2024-07-28 12:37:32.858834
4853	45	60	\N	2024-07-28 12:21:53.828264	2024-07-28 12:44:55.395043	2024-07-28 12:44:55.392923
4875	45	60	238	2024-07-28 12:44:56.577579	2024-07-28 12:44:56.577579	\N
4970	47	39	\N	2024-07-28 15:34:10.203806	2024-07-28 15:34:10.203806	\N
4971	47	4	\N	2024-07-28 15:34:10.203806	2024-07-28 15:34:10.203806	\N
4972	47	61	\N	2024-07-28 15:34:10.203806	2024-07-28 15:34:10.203806	\N
4973	47	69	\N	2024-07-28 15:34:10.203806	2024-07-28 15:34:10.203806	\N
4974	47	27	\N	2024-07-28 15:34:10.203806	2024-07-28 15:34:10.203806	\N
4975	47	18	\N	2024-07-28 15:34:10.203806	2024-07-28 15:34:10.203806	\N
4976	47	29	\N	2024-07-28 15:34:10.203806	2024-07-28 15:34:10.203806	\N
4977	47	74	\N	2024-07-28 15:34:10.203806	2024-07-28 15:34:10.203806	\N
4978	47	58	\N	2024-07-28 15:34:10.203806	2024-07-28 15:34:10.203806	\N
4979	47	21	\N	2024-07-28 15:34:10.203806	2024-07-28 15:34:10.203806	\N
4980	47	48	\N	2024-07-28 15:34:10.203806	2024-07-28 15:34:10.203806	\N
4969	47	71	282	2024-07-28 15:34:10.203806	2024-07-28 15:49:26.324473	\N
5033	47	3	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5034	47	18	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5035	47	15	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5037	47	44	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5038	47	58	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5039	47	87	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5040	47	16	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5041	47	69	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5042	47	31	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5043	47	74	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5044	47	89	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5045	47	2	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
3646	33	4	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3647	33	2	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3648	33	67	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3649	33	6	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3650	33	20	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3651	33	30	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3652	33	89	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3653	33	73	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3654	33	87	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3655	33	37	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3656	33	46	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3657	33	38	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3658	33	16	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3659	33	19	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3660	33	61	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3661	33	58	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3662	33	71	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3663	33	44	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3664	33	45	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3665	33	74	\N	2024-07-28 09:51:37.826358	2024-07-28 09:51:37.826358	\N
3667	36	20	\N	2024-07-28 09:54:38.004396	2024-07-28 09:54:38.004396	\N
3666	36	2	7	2024-07-28 09:54:38.004396	2024-07-28 09:54:45.190897	\N
3668	36	1	4	2024-07-28 09:54:38.004396	2024-07-28 09:54:50.350684	\N
3669	36	69	274	2024-07-28 09:54:38.004396	2024-07-28 09:54:52.030607	\N
3670	36	89	355	2024-07-28 09:54:38.004396	2024-07-28 09:54:59.594727	\N
3671	36	3	10	2024-07-28 09:54:38.004396	2024-07-28 09:55:07.506256	\N
3672	36	58	230	2024-07-28 09:54:38.004396	2024-07-28 09:55:10.992541	\N
3673	36	29	114	2024-07-28 09:54:38.004396	2024-07-28 09:55:15.682271	\N
3674	36	67	266	2024-07-28 09:54:38.004396	2024-07-28 09:55:18.774772	\N
3675	36	61	242	2024-07-28 09:54:38.004396	2024-07-28 09:55:24.341994	\N
3676	36	18	71	2024-07-28 09:54:38.004396	2024-07-28 09:55:33.180421	\N
3684	36	75	298	2024-07-28 09:54:38.004396	2024-07-28 09:56:28.903135	\N
3685	36	68	269	2024-07-28 09:54:38.004396	2024-07-28 09:56:31.216149	\N
3677	36	16	\N	2024-07-28 09:54:38.004396	2024-07-28 09:55:55.509435	2024-07-28 09:55:55.506868
3716	36	16	63	2024-07-28 09:55:56.344487	2024-07-28 09:55:56.344487	\N
3678	36	47	187	2024-07-28 09:54:38.004396	2024-07-28 09:56:02.668105	\N
3679	36	21	81	2024-07-28 09:54:38.004396	2024-07-28 09:56:05.071151	\N
3680	36	44	176	2024-07-28 09:54:38.004396	2024-07-28 09:56:07.191417	\N
3681	36	27	105	2024-07-28 09:54:38.004396	2024-07-28 09:56:14.061839	\N
3682	36	56	223	2024-07-28 09:54:38.004396	2024-07-28 09:56:22.99696	\N
3683	36	19	76	2024-07-28 09:54:38.004396	2024-07-28 09:56:25.97624	\N
3746	37	30	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3747	37	47	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3748	37	7	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3749	37	46	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3750	37	31	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3751	37	5	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3752	37	16	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3753	37	36	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3754	37	45	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3755	37	72	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3756	37	18	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3757	37	40	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3758	37	27	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3759	37	6	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3760	37	62	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3761	37	90	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3686	36	36	141	2024-07-28 09:54:38.004396	2024-07-28 09:56:38.926042	\N
3687	36	88	352	2024-07-28 09:54:38.004396	2024-07-28 09:56:41.709585	\N
3717	37	68	269	2024-07-28 09:56:28.757221	2024-07-28 09:56:42.423036	\N
3688	36	62	246	2024-07-28 09:54:38.004396	2024-07-28 09:56:44.109339	\N
3689	36	60	238	2024-07-28 09:54:38.004396	2024-07-28 09:56:48.207157	\N
3690	36	57	227	2024-07-28 09:54:38.004396	2024-07-28 09:56:53.092241	\N
3691	36	28	110	2024-07-28 09:54:38.004396	2024-07-28 09:56:55.745196	\N
3692	36	74	295	2024-07-28 09:54:38.004396	2024-07-28 09:56:59.466171	\N
3693	36	72	287	2024-07-28 09:54:38.004396	2024-07-28 09:57:01.639985	\N
3694	36	59	235	2024-07-28 09:54:38.004396	2024-07-28 09:57:03.186174	\N
3695	36	90	358	2024-07-28 09:54:38.004396	2024-07-28 09:57:05.820669	\N
3697	36	73	290	2024-07-28 09:54:38.004396	2024-07-28 09:57:37.329668	\N
3698	36	39	156	2024-07-28 09:54:38.004396	2024-07-28 09:57:45.217678	\N
3696	36	40	\N	2024-07-28 09:54:38.004396	2024-07-28 09:57:34.673337	2024-07-28 09:57:34.670327
3699	36	15	58	2024-07-28 09:54:38.004396	2024-07-28 09:57:51.34416	\N
3700	36	45	178	2024-07-28 09:54:38.004396	2024-07-28 09:57:55.562849	\N
3702	36	4	13	2024-07-28 09:54:38.004396	2024-07-28 09:58:08.992893	\N
3718	37	37	145	2024-07-28 09:56:28.757221	2024-07-28 09:58:03.034721	\N
3703	36	37	147	2024-07-28 09:54:38.004396	2024-07-28 09:58:15.633935	\N
3701	36	48	\N	2024-07-28 09:54:38.004396	2024-07-28 09:58:05.17245	2024-07-28 09:58:05.17086
3719	37	75	298	2024-07-28 09:56:28.757221	2024-07-28 09:58:07.297698	\N
3704	36	38	151	2024-07-28 09:54:38.004396	2024-07-28 09:58:19.216579	\N
3720	37	89	353	2024-07-28 09:56:28.757221	2024-07-28 09:58:21.365227	\N
3721	37	86	343	2024-07-28 09:56:28.757221	2024-07-28 09:58:25.725105	\N
3723	37	20	79	2024-07-28 09:56:28.757221	2024-07-28 09:59:01.825371	\N
3724	37	21	81	2024-07-28 09:56:28.757221	2024-07-28 09:59:06.556094	\N
3722	37	88	\N	2024-07-28 09:56:28.757221	2024-07-28 09:58:31.600766	2024-07-28 09:58:31.599223
3725	37	4	13	2024-07-28 09:56:28.757221	2024-07-28 09:59:10.869954	\N
3705	36	71	282	2024-07-28 09:54:38.004396	2024-07-28 09:59:26.094411	\N
3726	37	48	192	2024-07-28 09:56:28.757221	2024-07-28 09:59:28.578608	\N
3706	36	17	66	2024-07-28 09:54:38.004396	2024-07-28 09:59:30.201051	\N
3727	37	44	173	2024-07-28 09:56:28.757221	2024-07-28 09:59:32.332074	\N
3707	36	86	343	2024-07-28 09:54:38.004396	2024-07-28 09:59:32.838283	\N
3708	36	70	277	2024-07-28 09:54:38.004396	2024-07-28 09:59:35.285792	\N
3709	36	30	117	2024-07-28 09:54:38.004396	2024-07-28 09:59:39.724393	\N
3710	36	7	26	2024-07-28 09:54:38.004396	2024-07-28 09:59:41.401197	\N
3728	37	74	293	2024-07-28 09:56:28.757221	2024-07-28 09:59:41.422426	\N
3711	36	6	21	2024-07-28 09:54:38.004396	2024-07-28 09:59:44.371428	\N
3729	37	19	76	2024-07-28 09:56:28.757221	2024-07-28 09:59:46.8523	\N
3712	36	87	347	2024-07-28 09:54:38.004396	2024-07-28 09:59:47.488332	\N
3713	36	31	122	2024-07-28 09:54:38.004396	2024-07-28 09:59:49.689493	\N
3730	37	17	65	2024-07-28 09:56:28.757221	2024-07-28 09:59:54.263713	\N
3714	36	5	20	2024-07-28 09:54:38.004396	2024-07-28 10:00:06.604494	\N
3731	37	15	58	2024-07-28 09:56:28.757221	2024-07-28 10:00:07.995644	\N
3732	37	28	110	2024-07-28 09:56:28.757221	2024-07-28 10:00:12.492873	\N
3733	37	60	238	2024-07-28 09:56:28.757221	2024-07-28 10:00:20.948531	\N
3734	37	58	\N	2024-07-28 09:56:28.757221	2024-07-28 10:00:26.483417	2024-07-28 10:00:26.481641
3736	37	1	4	2024-07-28 09:56:28.757221	2024-07-28 10:00:40.460073	\N
3735	37	57	227	2024-07-28 09:56:28.757221	2024-07-28 10:00:37.621731	\N
3737	37	38	151	2024-07-28 09:56:28.757221	2024-07-28 10:00:47.822926	\N
3738	37	29	115	2024-07-28 09:56:28.757221	2024-07-28 10:00:55.728024	\N
3739	37	39	156	2024-07-28 09:56:28.757221	2024-07-28 10:01:04.113106	\N
3741	37	73	290	2024-07-28 09:56:28.757221	2024-07-28 10:02:30.177522	\N
3740	37	56	223	2024-07-28 09:56:28.757221	2024-07-28 10:01:14.588469	\N
3715	36	46	181	2024-07-28 09:54:38.004396	2024-07-28 10:01:27.248605	\N
3742	37	69	274	2024-07-28 09:56:28.757221	2024-07-28 10:02:33.770119	\N
3743	37	2	7	2024-07-28 09:56:28.757221	2024-07-28 10:02:38.627003	\N
3744	37	87	347	2024-07-28 09:56:28.757221	2024-07-28 10:02:44.676714	\N
3745	37	71	281	2024-07-28 09:56:28.757221	2024-07-28 10:02:57.410551	\N
4838	45	72	285	2024-07-28 12:01:54.042278	2024-07-28 12:01:54.042278	\N
4846	45	56	223	2024-07-28 12:10:57.210282	2024-07-28 12:10:57.210282	\N
4861	45	40	159	2024-07-28 12:36:54.971756	2024-07-28 12:36:54.971756	\N
4851	45	16	\N	2024-07-28 12:20:22.209442	2024-07-28 12:45:29.827171	2024-07-28 12:45:29.825238
4944	47	6	21	2024-07-28 15:34:10.203806	2024-07-28 15:40:51.838198	\N
4876	45	16	\N	2024-07-28 12:45:30.767344	2024-07-28 12:45:59.470535	2024-07-28 12:45:59.467425
4954	47	2	7	2024-07-28 15:34:10.203806	2024-07-28 15:44:55.355501	\N
5046	47	62	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5047	47	7	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5048	47	90	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5049	47	73	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5050	47	88	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5051	47	20	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
3762	37	70	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3763	37	3	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3764	37	59	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3765	37	61	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3766	37	67	\N	2024-07-28 09:56:28.757221	2024-07-28 09:56:28.757221	\N
3767	36	40	159	2024-07-28 09:57:35.293833	2024-07-28 09:57:35.293833	\N
3768	36	48	192	2024-07-28 09:58:05.813104	2024-07-28 09:58:05.813104	\N
3769	37	88	352	2024-07-28 09:58:34.794751	2024-07-28 09:58:34.794751	\N
3770	37	58	230	2024-07-28 10:00:28.487165	2024-07-28 10:00:28.487165	\N
3771	34	74	296	2024-07-28 10:01:24.049684	2024-07-28 10:01:24.049684	\N
3772	37	87	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3773	37	15	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3774	37	47	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3775	37	60	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3776	37	59	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3777	37	20	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3778	37	3	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3779	37	36	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3780	37	70	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3781	37	29	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3782	37	71	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3783	37	74	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3784	37	5	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3785	37	38	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3786	37	17	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3787	37	27	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3788	37	88	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3789	37	40	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3790	37	21	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3791	37	28	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3792	37	75	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3793	37	58	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3794	37	67	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3795	37	72	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3796	37	89	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3797	37	68	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3798	37	73	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3799	37	90	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3800	37	19	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:04.384517	\N
3801	37	45	178	2024-07-28 10:03:04.384517	2024-07-28 10:03:20.39351	\N
3802	37	39	155	2024-07-28 10:03:04.384517	2024-07-28 10:03:24.835022	\N
3803	37	86	343	2024-07-28 10:03:04.384517	2024-07-28 10:03:29.313789	\N
3804	37	4	13	2024-07-28 10:03:04.384517	2024-07-28 10:03:32.221518	\N
3805	37	56	223	2024-07-28 10:03:04.384517	2024-07-28 10:03:38.419823	\N
3822	38	90	358	2024-07-28 10:08:03.10597	2024-07-28 10:08:14.973069	\N
3823	38	16	63	2024-07-28 10:08:03.10597	2024-07-28 10:08:41.613167	\N
3806	37	48	\N	2024-07-28 10:03:04.384517	2024-07-28 10:03:43.092236	2024-07-28 10:03:43.091017
3807	37	46	183	2024-07-28 10:03:04.384517	2024-07-28 10:03:49.134889	\N
3808	37	61	242	2024-07-28 10:03:04.384517	2024-07-28 10:03:52.222883	\N
3809	37	6	21	2024-07-28 10:03:04.384517	2024-07-28 10:03:54.847888	\N
3824	38	37	147	2024-07-28 10:08:03.10597	2024-07-28 10:09:08.357546	\N
3825	38	7	26	2024-07-28 10:08:03.10597	2024-07-28 10:09:17.185231	\N
3810	37	30	\N	2024-07-28 10:03:04.384517	2024-07-28 10:04:01.073977	2024-07-28 10:04:01.071074
3811	37	2	7	2024-07-28 10:03:04.384517	2024-07-28 10:04:02.673764	\N
3812	37	31	122	2024-07-28 10:03:04.384517	2024-07-28 10:04:08.684701	\N
3813	37	16	62	2024-07-28 10:03:04.384517	2024-07-28 10:04:17.324876	\N
3814	37	69	274	2024-07-28 10:03:04.384517	2024-07-28 10:04:20.260815	\N
3815	37	44	173	2024-07-28 10:03:04.384517	2024-07-28 10:04:23.017294	\N
3816	37	37	147	2024-07-28 10:03:04.384517	2024-07-28 10:04:29.042994	\N
3817	37	18	72	2024-07-28 10:03:04.384517	2024-07-28 10:04:37.868245	\N
3818	37	1	4	2024-07-28 10:03:04.384517	2024-07-28 10:04:40.303943	\N
3819	37	62	246	2024-07-28 10:03:04.384517	2024-07-28 10:04:43.946133	\N
3820	37	57	227	2024-07-28 10:03:04.384517	2024-07-28 10:04:48.265999	\N
3826	38	71	282	2024-07-28 10:08:03.10597	2024-07-28 10:09:55.792971	\N
3821	37	7	26	2024-07-28 10:03:04.384517	2024-07-28 10:05:01.703357	\N
3827	38	4	13	2024-07-28 10:08:03.10597	2024-07-28 10:10:01.236772	\N
3828	38	58	230	2024-07-28 10:08:03.10597	2024-07-28 10:10:56.73221	\N
3829	38	47	187	2024-07-28 10:08:03.10597	2024-07-28 10:11:25.801659	\N
3830	38	31	122	2024-07-28 10:08:03.10597	2024-07-28 10:11:42.606902	\N
3831	38	39	156	2024-07-28 10:08:03.10597	2024-07-28 10:12:00.371246	\N
3832	38	30	117	2024-07-28 10:08:03.10597	2024-07-28 10:12:21.370685	\N
3833	38	74	295	2024-07-28 10:08:03.10597	2024-07-28 10:12:37.546921	\N
3834	38	45	178	2024-07-28 10:08:03.10597	2024-07-28 10:12:52.220344	\N
3835	38	86	343	2024-07-28 10:08:03.10597	2024-07-28 10:13:01.98045	\N
3836	38	88	352	2024-07-28 10:08:03.10597	2024-07-28 10:13:08.898643	\N
3837	38	21	81	2024-07-28 10:08:03.10597	2024-07-28 10:13:24.994093	\N
3838	38	62	246	2024-07-28 10:08:03.10597	2024-07-28 10:13:32.576537	\N
3839	38	46	181	2024-07-28 10:08:03.10597	2024-07-28 10:13:55.330097	\N
3840	38	70	277	2024-07-28 10:08:03.10597	2024-07-28 10:14:06.682113	\N
3841	38	60	238	2024-07-28 10:08:03.10597	2024-07-28 10:14:16.565736	\N
3842	38	19	76	2024-07-28 10:08:03.10597	2024-07-28 10:14:22.063053	\N
3843	38	3	11	2024-07-28 10:08:03.10597	2024-07-28 10:14:31.588803	\N
3844	38	68	269	2024-07-28 10:08:03.10597	2024-07-28 10:14:38.282861	\N
3845	38	5	20	2024-07-28 10:08:03.10597	2024-07-28 10:14:47.109232	\N
3846	38	40	159	2024-07-28 10:08:03.10597	2024-07-28 10:15:01.088554	\N
3847	38	56	223	2024-07-28 10:08:03.10597	2024-07-28 10:15:17.604619	\N
3848	38	38	151	2024-07-28 10:08:03.10597	2024-07-28 10:15:30.694407	\N
3849	38	15	58	2024-07-28 10:08:03.10597	2024-07-28 10:15:44.169395	\N
3850	38	17	66	2024-07-28 10:08:03.10597	2024-07-28 10:16:01.719386	\N
3851	38	67	266	2024-07-28 10:08:03.10597	2024-07-28 10:16:10.78862	\N
3852	38	20	79	2024-07-28 10:08:03.10597	2024-07-28 10:16:24.821469	\N
3853	38	59	235	2024-07-28 10:08:03.10597	2024-07-28 10:16:53.491627	\N
3854	38	18	71	2024-07-28 10:08:03.10597	2024-07-28 10:17:18.177483	\N
3855	38	75	298	2024-07-28 10:08:03.10597	2024-07-28 10:17:23.37597	\N
3856	38	6	21	2024-07-28 10:08:03.10597	2024-07-28 10:17:27.662734	\N
3857	38	69	274	2024-07-28 10:08:03.10597	2024-07-28 10:17:38.353855	\N
3858	38	73	290	2024-07-28 10:08:03.10597	2024-07-28 10:17:43.314945	\N
3859	38	28	110	2024-07-28 10:08:03.10597	2024-07-28 10:18:01.528744	\N
3860	38	44	176	2024-07-28 10:08:03.10597	2024-07-28 10:18:10.902014	\N
3861	38	29	114	2024-07-28 10:08:03.10597	2024-07-28 10:18:17.440214	\N
3862	38	87	347	2024-07-28 10:08:03.10597	2024-07-28 10:18:24.81898	\N
3863	38	61	242	2024-07-28 10:08:03.10597	2024-07-28 10:18:52.13793	\N
3864	38	48	190	2024-07-28 10:08:03.10597	2024-07-28 10:19:09.974852	\N
3865	38	36	141	2024-07-28 10:08:03.10597	2024-07-28 10:19:32.817563	\N
3866	38	72	287	2024-07-28 10:08:03.10597	2024-07-28 10:20:04.55735	\N
3867	38	57	227	2024-07-28 10:08:03.10597	2024-07-28 10:20:48.314974	\N
3868	38	1	2	2024-07-28 10:08:03.10597	2024-07-28 10:20:53.986441	\N
3869	38	89	355	2024-07-28 10:08:03.10597	2024-07-28 10:21:04.935173	\N
3870	38	27	105	2024-07-28 10:08:03.10597	2024-07-28 10:21:15.729501	\N
4796	45	47	187	2024-07-28 11:57:18.242346	2024-07-28 12:02:36.932298	\N
4847	45	58	230	2024-07-28 12:12:04.102269	2024-07-28 12:12:04.102269	\N
4862	45	30	117	2024-07-28 12:37:39.822019	2024-07-28 12:37:39.822019	\N
4879	45	16	63	2024-07-28 12:46:25.185304	2024-07-28 12:46:25.185304	\N
4877	45	16	\N	2024-07-28 12:46:21.661402	2024-07-28 12:46:24.05205	2024-07-28 12:46:24.050344
4945	47	60	238	2024-07-28 15:34:10.203806	2024-07-28 15:41:17.438909	\N
4878	45	16	\N	2024-07-28 12:46:24.135017	2024-07-28 12:46:24.178004	2024-07-28 12:46:24.176538
4958	47	86	343	2024-07-28 15:34:10.203806	2024-07-28 15:46:10.086684	\N
5052	47	4	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5053	47	71	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5054	47	56	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5055	47	68	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5056	47	5	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5057	47	1	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5058	47	59	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5059	47	30	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5060	47	37	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5061	47	57	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5062	47	36	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5063	47	27	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5064	47	38	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
3872	39	30	117	2024-07-28 10:11:01.458401	2024-07-28 10:11:16.968487	\N
3922	34	72	285	2024-07-28 10:11:18.740553	2024-07-28 10:11:18.740553	\N
3873	39	72	286	2024-07-28 10:11:01.458401	2024-07-28 10:11:39.048029	\N
3874	39	17	65	2024-07-28 10:11:01.458401	2024-07-28 10:12:48.972163	\N
3875	39	88	352	2024-07-28 10:11:01.458401	2024-07-28 10:12:56.338946	\N
3912	39	39	156	2024-07-28 10:11:01.458401	2024-07-28 10:29:21.558956	\N
3913	39	19	76	2024-07-28 10:11:01.458401	2024-07-28 10:29:28.023239	\N
3876	39	71	\N	2024-07-28 10:11:01.458401	2024-07-28 10:13:22.361632	2024-07-28 10:13:22.360602
3914	39	20	79	2024-07-28 10:11:01.458401	2024-07-28 10:29:46.368254	\N
3923	39	71	\N	2024-07-28 10:13:44.934725	2024-07-28 10:13:46.031152	2024-07-28 10:13:46.029956
3924	39	71	283	2024-07-28 10:13:50.991978	2024-07-28 10:13:50.991978	\N
3877	39	48	192	2024-07-28 10:11:01.458401	2024-07-28 10:14:43.737197	\N
3878	39	36	143	2024-07-28 10:11:01.458401	2024-07-28 10:15:33.474572	\N
3880	39	62	246	2024-07-28 10:11:01.458401	2024-07-28 10:16:22.37533	\N
3881	39	89	355	2024-07-28 10:11:01.458401	2024-07-28 10:16:36.060157	\N
3882	39	5	20	2024-07-28 10:11:01.458401	2024-07-28 10:17:24.016114	\N
3883	39	74	295	2024-07-28 10:11:01.458401	2024-07-28 10:18:52.387144	\N
3884	39	68	269	2024-07-28 10:11:01.458401	2024-07-28 10:18:56.639405	\N
3885	39	90	358	2024-07-28 10:11:01.458401	2024-07-28 10:19:01.083111	\N
3886	39	37	147	2024-07-28 10:11:01.458401	2024-07-28 10:19:32.20342	\N
3925	34	57	227	2024-07-28 10:19:53.229963	2024-07-28 10:19:53.229963	\N
3888	39	69	273	2024-07-28 10:11:01.458401	2024-07-28 10:20:05.564604	\N
3889	39	4	13	2024-07-28 10:11:01.458401	2024-07-28 10:20:09.127531	\N
3890	39	28	110	2024-07-28 10:11:01.458401	2024-07-28 10:21:07.053149	\N
3915	39	1	4	2024-07-28 10:11:01.458401	2024-07-28 10:29:50.128574	\N
3871	38	2	7	2024-07-28 10:08:03.10597	2024-07-28 10:21:23.735384	\N
3891	39	44	176	2024-07-28 10:11:01.458401	2024-07-28 10:21:27.929279	\N
3926	34	61	242	2024-07-28 10:21:38.04361	2024-07-28 10:21:38.04361	\N
3892	39	18	72	2024-07-28 10:11:01.458401	2024-07-28 10:21:45.023425	\N
3893	39	27	107	2024-07-28 10:11:01.458401	2024-07-28 10:22:18.436339	\N
3894	39	38	151	2024-07-28 10:11:01.458401	2024-07-28 10:22:27.4556	\N
3895	39	75	298	2024-07-28 10:11:01.458401	2024-07-28 10:22:34.442386	\N
3896	39	2	7	2024-07-28 10:11:01.458401	2024-07-28 10:22:39.903551	\N
3897	39	7	26	2024-07-28 10:11:01.458401	2024-07-28 10:22:50.390217	\N
3898	39	56	222	2024-07-28 10:11:01.458401	2024-07-28 10:23:09.691627	\N
3899	39	47	188	2024-07-28 10:11:01.458401	2024-07-28 10:23:25.202777	\N
3916	39	21	81	2024-07-28 10:11:01.458401	2024-07-28 10:30:27.824727	\N
3927	34	40	\N	2024-07-28 10:23:39.183178	2024-07-28 10:23:47.897236	2024-07-28 10:23:47.895201
3928	34	40	159	2024-07-28 10:23:56.365894	2024-07-28 10:23:56.365894	\N
3900	39	73	290	2024-07-28 10:11:01.458401	2024-07-28 10:24:01.781958	\N
3901	39	61	241	2024-07-28 10:11:01.458401	2024-07-28 10:24:50.598316	\N
3902	39	60	238	2024-07-28 10:11:01.458401	2024-07-28 10:25:12.638691	\N
3903	39	6	21	2024-07-28 10:11:01.458401	2024-07-28 10:25:16.639931	\N
3904	39	86	343	2024-07-28 10:11:01.458401	2024-07-28 10:25:21.962634	\N
3905	39	87	347	2024-07-28 10:11:01.458401	2024-07-28 10:25:29.59686	\N
3906	39	45	178	2024-07-28 10:11:01.458401	2024-07-28 10:25:45.502048	\N
3907	39	29	114	2024-07-28 10:11:01.458401	2024-07-28 10:26:00.566519	\N
3908	39	59	235	2024-07-28 10:11:01.458401	2024-07-28 10:27:12.645535	\N
3909	39	16	63	2024-07-28 10:11:01.458401	2024-07-28 10:28:23.418692	\N
3910	39	70	277	2024-07-28 10:11:01.458401	2024-07-28 10:28:28.69817	\N
3911	39	57	226	2024-07-28 10:11:01.458401	2024-07-28 10:28:55.037531	\N
3929	34	47	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3930	34	30	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3931	34	2	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3932	34	48	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3933	34	57	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3934	34	72	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3935	34	59	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3936	34	88	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3937	34	20	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3938	34	18	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3939	34	46	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3940	34	60	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3941	34	19	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3942	34	28	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3943	34	7	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3944	34	40	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3945	34	70	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3946	34	73	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3947	34	38	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3948	34	67	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3949	34	86	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3950	34	61	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3951	34	27	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3952	34	37	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3953	34	6	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3954	34	87	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3955	34	3	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3956	34	36	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3957	34	62	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3958	34	68	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3917	39	3	11	2024-07-28 10:11:01.458401	2024-07-28 10:30:49.598675	\N
3918	39	58	230	2024-07-28 10:11:01.458401	2024-07-28 10:31:10.503607	\N
3919	39	46	181	2024-07-28 10:11:01.458401	2024-07-28 10:31:26.327892	\N
3920	39	31	122	2024-07-28 10:11:01.458401	2024-07-28 10:31:39.976184	\N
3879	39	40	159	2024-07-28 10:11:01.458401	2024-07-28 10:32:48.481751	\N
4797	45	74	\N	2024-07-28 11:57:18.242346	2024-07-28 12:03:45.769638	2024-07-28 12:03:45.762186
3887	39	15	\N	2024-07-28 10:11:01.458401	2024-07-28 10:32:55.80617	2024-07-28 10:32:55.804373
4839	45	74	295	2024-07-28 12:03:46.686192	2024-07-28 12:03:46.686192	\N
3921	39	67	\N	2024-07-28 10:11:01.458401	2024-07-28 10:33:25.474485	2024-07-28 10:33:25.472779
4798	45	87	347	2024-07-28 11:57:18.242346	2024-07-28 12:03:56.784059	\N
4848	45	61	242	2024-07-28 12:13:53.276957	2024-07-28 12:13:53.276957	\N
4863	45	27	\N	2024-07-28 12:38:11.95495	2024-07-28 12:39:06.704397	2024-07-28 12:39:06.702634
4880	45	70	280	2024-07-28 12:47:10.35751	2024-07-28 12:47:10.35751	\N
4946	47	1	\N	2024-07-28 15:34:10.203806	2024-07-28 15:41:41.018094	2024-07-28 15:41:41.014866
4981	47	1	4	2024-07-28 15:41:42.203556	2024-07-28 15:41:42.203556	\N
4983	47	47	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4984	47	57	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4985	47	71	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4986	47	17	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4987	47	61	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4988	47	67	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4989	47	58	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4990	47	28	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4991	47	73	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4992	47	69	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4993	47	38	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4994	47	31	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4995	47	59	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4996	47	1	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4997	47	29	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4998	47	44	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
4999	47	19	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5000	47	4	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5001	47	87	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5002	47	36	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5003	47	21	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5004	47	7	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5005	47	56	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5006	47	39	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5007	47	30	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5008	47	46	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5009	47	75	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5010	47	2	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5011	47	89	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
3959	34	29	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3960	34	15	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3961	34	4	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3962	34	69	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3963	34	1	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3964	34	17	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3965	34	21	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3966	34	56	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3967	34	5	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3968	34	39	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3969	34	89	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3970	34	16	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3971	34	44	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3972	34	71	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3973	34	45	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3974	34	74	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3975	34	75	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3976	34	90	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3977	34	58	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3978	34	31	\N	2024-07-28 10:29:13.293939	2024-07-28 10:29:13.293939	\N
3979	40	68	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3980	40	2	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3981	40	21	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3982	40	15	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3983	40	19	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3984	40	48	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3985	40	5	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3986	40	20	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3987	40	61	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3988	40	17	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3989	40	27	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3990	40	28	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3991	40	62	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3992	40	74	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3993	40	1	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3994	40	6	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3995	40	18	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3996	40	38	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3997	40	88	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3998	40	69	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
3999	40	37	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4000	40	36	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4001	40	39	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4002	40	71	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4003	40	60	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4004	40	3	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4005	40	58	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4006	40	59	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4007	40	31	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4008	40	16	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4009	40	86	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4010	40	4	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4011	40	29	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4012	40	70	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4013	40	73	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4014	40	45	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4015	40	90	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4016	40	75	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4017	40	30	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4018	40	40	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4019	40	46	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4020	40	67	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4021	40	56	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4022	40	89	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4023	40	7	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4024	40	87	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4025	40	44	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4026	40	72	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4027	40	57	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4028	40	47	\N	2024-07-28 10:29:24.044665	2024-07-28 10:29:24.044665	\N
4029	40	36	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4030	40	29	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4031	40	75	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4032	40	31	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4033	40	38	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4034	40	30	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4035	40	4	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4036	40	20	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4037	40	74	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4038	40	3	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4039	40	88	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4040	40	72	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4041	40	89	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4042	40	67	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4043	40	17	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4044	40	70	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4045	40	47	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4046	40	28	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4047	40	45	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4048	40	86	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4049	40	27	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4050	40	7	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4051	40	73	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4052	40	48	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4053	40	56	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4054	40	37	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4055	40	62	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4056	40	57	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4057	40	60	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4058	40	15	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4059	40	5	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4060	40	58	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4061	40	59	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4062	40	21	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4063	40	87	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4064	40	71	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4065	40	61	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4066	40	2	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4067	40	18	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4068	40	16	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4069	40	40	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4070	40	44	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4071	40	6	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4072	40	90	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4073	40	69	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4074	40	39	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4075	40	1	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4076	40	68	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4077	40	46	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4078	40	19	\N	2024-07-28 10:30:00.226367	2024-07-28 10:30:00.226367	\N
4079	40	48	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4080	40	38	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4081	40	88	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4082	40	31	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4083	40	74	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4084	40	27	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4085	40	59	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4086	40	15	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4087	40	57	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4088	40	56	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4089	40	29	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4090	40	39	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4091	40	19	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4092	40	17	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4093	40	20	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4094	40	70	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4095	40	2	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4096	40	5	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4097	40	21	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4098	40	36	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4099	40	40	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4100	40	46	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4101	40	44	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4102	40	16	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4103	40	67	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4104	40	69	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4105	40	87	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4106	40	62	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4107	40	30	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4108	40	37	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4109	40	72	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4110	40	3	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4111	40	6	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4112	40	60	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4113	40	90	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4114	40	89	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4115	40	28	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4116	40	58	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4117	40	75	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4118	40	68	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4119	40	86	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4120	40	4	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4121	40	73	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4122	40	18	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4123	40	45	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4124	40	71	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4125	40	47	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4126	40	7	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4127	40	61	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4128	40	1	\N	2024-07-28 10:30:14.557823	2024-07-28 10:30:14.557823	\N
4129	40	67	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4130	40	57	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4131	40	3	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4132	40	28	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4133	40	2	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4134	40	21	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4135	40	29	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4136	40	71	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4137	40	45	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4138	40	70	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4139	40	90	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4140	40	87	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4141	40	88	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4142	40	86	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4143	40	39	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4144	40	59	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4145	40	18	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4146	40	48	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4147	40	46	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4148	40	38	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4149	40	89	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4150	40	15	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4151	40	7	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4152	40	68	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4153	40	69	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4154	40	61	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4155	40	40	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4156	40	62	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4157	40	72	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4158	40	16	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4159	40	44	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4160	40	47	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4161	40	1	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4162	40	19	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4163	40	56	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4164	40	58	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4165	40	74	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4166	40	30	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4167	40	20	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4168	40	6	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4169	40	27	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4170	40	31	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4171	40	4	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4172	40	5	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4173	40	36	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4174	40	60	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4175	40	75	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4176	40	37	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4177	40	73	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4178	40	17	\N	2024-07-28 10:32:46.3116	2024-07-28 10:32:46.3116	\N
4179	40	71	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4180	40	19	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4181	40	17	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4182	40	72	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4183	40	4	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4184	40	47	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4185	40	86	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4186	40	68	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4187	40	46	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4188	40	29	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4189	40	70	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4190	40	21	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4191	40	62	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4192	40	88	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4193	40	61	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4194	40	6	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4195	40	58	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4196	40	31	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4197	40	2	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4198	40	28	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4199	40	44	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4200	40	20	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4201	40	36	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4202	40	48	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4203	40	16	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4204	40	27	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4205	40	90	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4206	40	56	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4207	40	69	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4208	40	59	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4209	40	87	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4210	40	7	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4211	40	18	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4212	40	89	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4213	40	45	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4214	40	3	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4215	40	75	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4216	40	1	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4217	40	38	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4218	40	67	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4219	40	39	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4220	40	5	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4221	40	15	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4222	40	37	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4223	40	74	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4224	40	57	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4225	40	30	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4226	40	60	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4227	40	73	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4228	40	40	\N	2024-07-28 10:32:48.754271	2024-07-28 10:32:48.754271	\N
4849	45	45	178	2024-07-28 12:15:17.853398	2024-07-28 12:15:17.853398	\N
4881	46	45	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4229	39	15	\N	2024-07-28 10:32:55.873463	2024-07-28 10:32:56.009739	2024-07-28 10:32:56.007319
4230	39	67	266	2024-07-28 10:33:26.86505	2024-07-28 10:33:26.86505	\N
4231	39	15	58	2024-07-28 10:34:20.777251	2024-07-28 10:34:41.397479	\N
4262	41	1	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4263	41	71	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4264	41	21	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4265	41	48	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4266	41	16	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4267	41	28	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4268	41	46	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4270	41	67	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4271	41	31	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4272	41	62	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4273	41	70	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4274	41	87	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4275	41	47	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4276	41	90	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4277	41	17	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4278	41	60	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4279	41	89	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4280	41	18	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4281	41	69	\N	2024-07-28 10:37:53.547585	2024-07-28 10:37:53.547585	\N
4232	41	27	105	2024-07-28 10:37:53.547585	2024-07-28 10:38:21.575644	\N
4233	41	7	26	2024-07-28 10:37:53.547585	2024-07-28 10:38:26.380471	\N
4234	41	19	76	2024-07-28 10:37:53.547585	2024-07-28 10:38:35.626753	\N
4235	41	45	178	2024-07-28 10:37:53.547585	2024-07-28 10:38:58.218381	\N
4236	41	88	352	2024-07-28 10:37:53.547585	2024-07-28 10:39:32.226673	\N
4282	42	67	266	2024-07-28 10:39:33.235614	2024-07-28 10:39:43.168994	\N
4241	41	30	118	2024-07-28 10:37:53.547585	2024-07-28 10:40:53.327623	\N
4287	42	46	183	2024-07-28 10:39:33.235614	2024-07-28 10:40:56.733792	\N
4283	42	45	\N	2024-07-28 10:39:33.235614	2024-07-28 10:39:50.246658	2024-07-28 10:39:50.245219
4332	42	45	178	2024-07-28 10:39:51.235638	2024-07-28 10:39:51.235638	\N
4237	41	72	287	2024-07-28 10:37:53.547585	2024-07-28 10:39:58.262439	\N
4284	42	57	226	2024-07-28 10:39:33.235614	2024-07-28 10:40:01.404175	\N
4238	41	86	343	2024-07-28 10:37:53.547585	2024-07-28 10:40:23.08006	\N
4239	41	4	13	2024-07-28 10:37:53.547585	2024-07-28 10:40:25.754262	\N
4285	42	15	59	2024-07-28 10:39:33.235614	2024-07-28 10:40:35.856544	\N
4240	41	44	174	2024-07-28 10:37:53.547585	2024-07-28 10:40:40.081807	\N
4286	42	40	159	2024-07-28 10:39:33.235614	2024-07-28 10:40:44.59201	\N
4242	41	58	231	2024-07-28 10:37:53.547585	2024-07-28 10:41:10.778508	\N
4288	42	17	66	2024-07-28 10:39:33.235614	2024-07-28 10:41:12.371942	\N
4289	42	39	154	2024-07-28 10:39:33.235614	2024-07-28 10:41:27.080955	\N
4243	41	37	148	2024-07-28 10:37:53.547585	2024-07-28 10:41:36.382004	\N
4290	42	71	282	2024-07-28 10:39:33.235614	2024-07-28 10:41:36.521114	\N
4291	42	37	146	2024-07-28 10:39:33.235614	2024-07-28 10:41:47.068247	\N
4292	42	1	4	2024-07-28 10:39:33.235614	2024-07-28 10:41:50.305396	\N
4293	42	89	355	2024-07-28 10:39:33.235614	2024-07-28 10:41:53.73386	\N
4244	41	56	221	2024-07-28 10:37:53.547585	2024-07-28 10:42:01.640183	\N
4294	42	16	61	2024-07-28 10:39:33.235614	2024-07-28 10:42:07.145429	\N
4295	42	60	238	2024-07-28 10:39:33.235614	2024-07-28 10:42:13.20035	\N
4296	42	61	244	2024-07-28 10:39:33.235614	2024-07-28 10:42:17.21665	\N
4297	42	21	81	2024-07-28 10:39:33.235614	2024-07-28 10:42:19.617871	\N
4245	41	40	158	2024-07-28 10:37:53.547585	2024-07-28 10:42:21.082373	\N
4246	41	6	21	2024-07-28 10:37:53.547585	2024-07-28 10:42:23.320564	\N
4298	42	69	274	2024-07-28 10:39:33.235614	2024-07-28 10:42:23.66457	\N
4299	42	3	11	2024-07-28 10:39:33.235614	2024-07-28 10:42:27.939454	\N
4300	42	6	21	2024-07-28 10:39:33.235614	2024-07-28 10:42:30.664148	\N
4301	42	31	122	2024-07-28 10:39:33.235614	2024-07-28 10:42:37.913968	\N
4302	42	30	117	2024-07-28 10:39:33.235614	2024-07-28 10:42:53.202501	\N
4303	42	18	71	2024-07-28 10:39:33.235614	2024-07-28 10:42:58.304298	\N
4304	42	38	151	2024-07-28 10:39:33.235614	2024-07-28 10:43:02.96261	\N
4305	42	73	290	2024-07-28 10:39:33.235614	2024-07-28 10:43:06.194027	\N
4306	42	62	246	2024-07-28 10:39:33.235614	2024-07-28 10:43:08.744614	\N
4307	42	44	176	2024-07-28 10:39:33.235614	2024-07-28 10:43:13.663337	\N
4308	42	58	230	2024-07-28 10:39:33.235614	2024-07-28 10:43:24.756028	\N
4309	42	4	13	2024-07-28 10:39:33.235614	2024-07-28 10:43:32.628347	\N
4310	42	19	76	2024-07-28 10:39:33.235614	2024-07-28 10:43:35.021436	\N
4311	42	68	269	2024-07-28 10:39:33.235614	2024-07-28 10:43:37.22209	\N
4312	42	88	352	2024-07-28 10:39:33.235614	2024-07-28 10:43:40.858046	\N
4313	42	59	235	2024-07-28 10:39:33.235614	2024-07-28 10:43:43.643246	\N
4247	41	2	7	2024-07-28 10:37:53.547585	2024-07-28 10:43:45.948438	\N
4316	42	87	347	2024-07-28 10:39:33.235614	2024-07-28 10:44:27.063142	\N
4317	42	75	298	2024-07-28 10:39:33.235614	2024-07-28 10:44:35.123246	\N
4248	41	75	\N	2024-07-28 10:37:53.547585	2024-07-28 10:43:55.27542	2024-07-28 10:43:55.273476
4314	42	56	223	2024-07-28 10:39:33.235614	2024-07-28 10:44:08.506493	\N
4315	42	20	79	2024-07-28 10:39:33.235614	2024-07-28 10:44:14.431978	\N
4318	42	2	7	2024-07-28 10:39:33.235614	2024-07-28 10:44:37.710474	\N
4333	41	75	\N	2024-07-28 10:43:56.893577	2024-07-28 10:44:20.192629	2024-07-28 10:44:20.189284
4334	41	75	298	2024-07-28 10:44:20.297733	2024-07-28 10:44:20.297733	\N
4338	43	72	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4339	43	15	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4340	43	48	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4341	43	37	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4342	43	6	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4343	43	74	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4344	43	1	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4345	43	67	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4346	43	20	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4347	43	36	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4348	43	44	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4349	43	40	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4350	43	4	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4351	43	29	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4352	43	7	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4353	43	2	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4249	41	20	80	2024-07-28 10:37:53.547585	2024-07-28 10:44:39.858288	\N
4319	42	29	114	2024-07-28 10:39:33.235614	2024-07-28 10:44:44.586441	\N
4335	43	21	81	2024-07-28 10:44:24.405305	2024-07-28 10:44:56.249653	\N
4250	41	38	151	2024-07-28 10:37:53.547585	2024-07-28 10:44:59.13147	\N
4336	43	62	246	2024-07-28 10:44:24.405305	2024-07-28 10:44:59.667015	\N
4320	42	36	142	2024-07-28 10:39:33.235614	2024-07-28 10:44:59.702959	\N
4321	42	90	358	2024-07-28 10:39:33.235614	2024-07-28 10:45:04.272316	\N
4322	42	28	110	2024-07-28 10:39:33.235614	2024-07-28 10:45:17.3624	\N
4323	42	7	26	2024-07-28 10:39:33.235614	2024-07-28 10:45:23.787564	\N
4251	41	15	58	2024-07-28 10:37:53.547585	2024-07-28 10:45:26.636976	\N
4324	42	27	105	2024-07-28 10:39:33.235614	2024-07-28 10:45:31.308955	\N
4252	41	68	269	2024-07-28 10:37:53.547585	2024-07-28 10:45:35.831018	\N
4325	42	70	277	2024-07-28 10:39:33.235614	2024-07-28 10:45:40.880368	\N
4253	41	59	233	2024-07-28 10:37:53.547585	2024-07-28 10:45:51.71671	\N
4326	42	5	20	2024-07-28 10:39:33.235614	2024-07-28 10:45:58.891738	\N
4327	42	47	187	2024-07-28 10:39:33.235614	2024-07-28 10:46:07.953892	\N
4254	41	3	12	2024-07-28 10:37:53.547585	2024-07-28 10:46:10.301529	\N
4328	42	86	343	2024-07-28 10:39:33.235614	2024-07-28 10:46:10.830197	\N
4329	42	48	192	2024-07-28 10:39:33.235614	2024-07-28 10:46:17.456113	\N
4255	41	39	155	2024-07-28 10:37:53.547585	2024-07-28 10:46:25.801773	\N
4330	42	74	295	2024-07-28 10:39:33.235614	2024-07-28 10:46:26.684011	\N
4256	41	5	18	2024-07-28 10:37:53.547585	2024-07-28 10:46:44.818678	\N
4331	42	72	287	2024-07-28 10:39:33.235614	2024-07-28 10:46:37.002493	\N
4257	41	73	292	2024-07-28 10:37:53.547585	2024-07-28 10:46:58.102202	\N
4258	41	36	142	2024-07-28 10:37:53.547585	2024-07-28 10:47:23.899613	\N
4337	43	18	71	2024-07-28 10:44:24.405305	2024-07-28 10:47:32.993086	\N
4259	41	74	\N	2024-07-28 10:37:53.547585	2024-07-28 10:47:46.952871	2024-07-28 10:47:46.950491
4260	41	57	226	2024-07-28 10:37:53.547585	2024-07-28 10:48:01.666502	\N
4261	41	61	242	2024-07-28 10:37:53.547585	2024-07-28 10:48:05.781105	\N
4269	41	29	113	2024-07-28 10:37:53.547585	2024-07-28 10:52:59.755009	\N
4799	45	38	\N	2024-07-28 11:57:18.242346	2024-07-28 12:04:43.845555	2024-07-28 12:04:43.84324
4840	45	38	151	2024-07-28 12:04:53.788474	2024-07-28 12:04:53.788474	\N
4850	45	71	281	2024-07-28 12:16:54.437021	2024-07-28 12:16:54.437021	\N
4354	43	58	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4356	43	27	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4357	43	46	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4358	43	88	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4359	43	75	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4361	43	57	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4362	43	30	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4363	43	61	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4364	43	70	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4365	43	31	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4366	43	71	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4367	43	87	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4368	43	45	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4370	43	69	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4371	43	59	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4372	43	39	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4373	43	38	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4374	43	89	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4375	43	73	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4376	43	47	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4377	43	3	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4378	43	56	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4379	43	68	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4380	43	60	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4381	43	86	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4382	43	28	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4383	43	19	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4384	43	90	\N	2024-07-28 10:44:24.405305	2024-07-28 10:44:24.405305	\N
4385	42	61	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4386	42	7	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4387	42	72	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4388	42	71	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4389	42	74	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4390	42	21	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4391	42	31	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4392	42	70	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4393	42	6	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4394	42	44	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4395	42	38	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4396	42	62	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4397	42	2	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4398	42	56	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4399	42	39	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4400	42	17	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4401	42	90	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4402	42	73	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4403	42	5	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4404	42	18	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4405	42	45	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4406	42	29	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4407	42	16	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4408	42	57	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4409	42	88	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4410	42	89	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4411	42	69	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4412	42	60	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4413	42	4	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4414	42	58	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4415	42	28	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4416	42	67	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4417	42	87	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4418	42	59	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4419	42	20	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4420	42	40	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4421	42	30	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4422	42	37	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4423	42	15	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4424	42	19	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4425	42	75	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4426	42	86	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4427	42	27	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4428	42	68	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4429	42	48	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4430	42	46	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4431	42	47	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4432	42	36	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4433	42	3	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4434	42	1	\N	2024-07-28 10:47:06.80288	2024-07-28 10:47:06.80288	\N
4355	43	5	17	2024-07-28 10:44:24.405305	2024-07-28 10:58:15.398032	\N
4441	44	1	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4442	44	2	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4443	44	37	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4444	44	46	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4445	44	6	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4446	44	88	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4447	44	40	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4448	44	60	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4449	44	90	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4450	44	45	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4451	44	58	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4452	44	44	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4453	44	89	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4454	44	5	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4455	44	21	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4456	44	73	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4457	44	36	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4458	44	4	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4459	44	17	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4460	44	39	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4461	44	28	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4462	44	68	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4463	44	57	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4464	44	7	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4465	44	48	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4466	44	62	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4467	44	59	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4468	44	19	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4469	44	72	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4470	44	75	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4471	44	16	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4472	44	31	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4473	44	18	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4474	44	29	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4475	44	86	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4476	44	71	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4477	44	3	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4478	44	30	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4479	44	27	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4480	44	74	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4481	44	47	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4482	44	15	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4483	44	70	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4484	44	67	\N	2024-07-28 10:47:18.231961	2024-07-28 10:47:18.231961	\N
4485	43	7	\N	2024-07-28 10:47:33.701069	2024-07-28 10:47:33.701069	\N
4486	43	88	\N	2024-07-28 10:47:33.701069	2024-07-28 10:47:33.701069	\N
4487	43	21	\N	2024-07-28 10:47:33.701069	2024-07-28 10:47:33.701069	\N
4435	44	61	242	2024-07-28 10:47:18.231961	2024-07-28 10:47:54.241638	\N
4489	43	69	274	2024-07-28 10:47:33.701069	2024-07-28 10:47:56.135001	\N
4437	44	38	151	2024-07-28 10:47:18.231961	2024-07-28 10:48:27.347086	\N
4438	44	56	223	2024-07-28 10:47:18.231961	2024-07-28 10:49:04.83682	\N
4439	44	69	274	2024-07-28 10:47:18.231961	2024-07-28 10:49:31.961713	\N
4360	43	17	\N	2024-07-28 10:44:24.405305	2024-07-28 10:50:31.332081	2024-07-28 10:50:31.330543
4440	44	20	80	2024-07-28 10:47:18.231961	2024-07-28 10:50:21.484615	\N
4369	43	16	63	2024-07-28 10:44:24.405305	2024-07-28 10:51:08.950919	\N
4509	43	15	\N	2024-07-28 10:47:33.701069	2024-07-28 10:47:33.701069	\N
4535	41	74	295	2024-07-28 10:47:47.517256	2024-07-28 10:47:47.517256	\N
4488	43	58	230	2024-07-28 10:47:33.701069	2024-07-28 10:47:49.50033	\N
4436	44	87	347	2024-07-28 10:47:18.231961	2024-07-28 10:48:02.000343	\N
4490	43	20	78	2024-07-28 10:47:33.701069	2024-07-28 10:48:59.003685	\N
4491	43	4	13	2024-07-28 10:47:33.701069	2024-07-28 10:49:01.094272	\N
4536	39	87	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4537	39	48	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4538	39	72	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4539	39	70	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4540	39	28	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4541	39	89	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4542	39	60	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4543	39	31	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4544	39	17	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4545	39	71	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4546	39	73	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4547	39	27	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4548	39	90	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4549	39	86	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4550	39	1	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4551	39	44	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4552	39	57	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4553	39	2	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4554	39	3	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4555	39	30	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4556	39	74	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4557	39	40	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4558	39	7	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4559	39	39	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4560	39	21	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4561	39	36	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4562	39	46	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4563	39	88	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4564	39	6	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4565	39	69	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4566	39	75	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4567	39	18	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4568	39	68	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4569	39	58	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4570	39	61	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4571	39	62	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4572	39	59	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4573	39	38	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4574	39	45	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4575	39	19	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4576	39	47	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4577	39	15	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4578	39	4	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4579	39	29	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4580	39	16	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4581	39	67	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4582	39	5	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4583	39	56	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4584	39	37	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4585	39	20	\N	2024-07-28 10:49:06.781296	2024-07-28 10:49:06.781296	\N
4492	43	48	192	2024-07-28 10:47:33.701069	2024-07-28 10:49:09.989756	\N
4493	43	68	269	2024-07-28 10:47:33.701069	2024-07-28 10:49:13.400279	\N
4494	43	28	110	2024-07-28 10:47:33.701069	2024-07-28 10:49:19.544911	\N
4586	41	60	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4587	41	45	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4588	41	74	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4589	41	37	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4590	41	17	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4591	41	89	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4592	41	21	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4593	41	1	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4594	41	59	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4595	41	7	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4596	41	28	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4597	41	48	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4598	41	38	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4599	41	70	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4600	41	46	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4601	41	18	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4602	41	3	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4603	41	30	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4604	41	61	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4605	41	6	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4606	41	36	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4607	41	47	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4608	41	90	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4609	41	75	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4610	41	71	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4611	41	58	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4612	41	5	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4613	41	72	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4614	41	67	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4615	41	86	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4616	41	69	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4495	43	45	180	2024-07-28 10:47:33.701069	2024-07-28 10:49:35.993274	\N
4496	43	57	226	2024-07-28 10:47:33.701069	2024-07-28 10:49:39.74607	\N
4617	41	44	174	2024-07-28 10:49:29.798781	2024-07-28 10:49:40.468816	\N
4497	43	39	153	2024-07-28 10:47:33.701069	2024-07-28 10:49:44.25566	\N
4498	43	17	\N	2024-07-28 10:47:33.701069	2024-07-28 10:49:53.896671	2024-07-28 10:49:53.894668
4618	41	15	58	2024-07-28 10:49:29.798781	2024-07-28 10:49:52.947819	\N
4499	43	70	277	2024-07-28 10:47:33.701069	2024-07-28 10:50:38.492413	\N
4500	43	89	355	2024-07-28 10:47:33.701069	2024-07-28 10:50:51.406473	\N
4501	43	16	\N	2024-07-28 10:47:33.701069	2024-07-28 10:51:07.958138	2024-07-28 10:51:07.956606
4502	43	40	158	2024-07-28 10:47:33.701069	2024-07-28 10:51:15.70297	\N
4503	43	36	141	2024-07-28 10:47:33.701069	2024-07-28 10:51:25.710558	\N
4504	43	87	347	2024-07-28 10:47:33.701069	2024-07-28 10:51:28.972198	\N
4505	43	62	246	2024-07-28 10:47:33.701069	2024-07-28 10:51:36.783677	\N
4506	43	27	106	2024-07-28 10:47:33.701069	2024-07-28 10:52:17.628132	\N
4507	43	90	358	2024-07-28 10:47:33.701069	2024-07-28 10:52:20.773594	\N
4508	43	73	290	2024-07-28 10:47:33.701069	2024-07-28 10:52:26.274225	\N
4510	43	86	343	2024-07-28 10:47:33.701069	2024-07-28 10:52:39.390354	\N
4511	43	46	181	2024-07-28 10:47:33.701069	2024-07-28 10:52:49.284545	\N
4512	43	75	298	2024-07-28 10:47:33.701069	2024-07-28 10:52:52.458628	\N
4513	43	30	117	2024-07-28 10:47:33.701069	2024-07-28 10:54:15.92238	\N
4514	43	67	266	2024-07-28 10:47:33.701069	2024-07-28 10:54:21.186266	\N
4515	43	59	235	2024-07-28 10:47:33.701069	2024-07-28 10:54:27.882594	\N
4516	43	29	114	2024-07-28 10:47:33.701069	2024-07-28 10:55:54.907898	\N
4517	43	71	282	2024-07-28 10:47:33.701069	2024-07-28 10:57:46.832339	\N
4518	43	56	223	2024-07-28 10:47:33.701069	2024-07-28 10:58:00.671036	\N
4519	43	5	\N	2024-07-28 10:47:33.701069	2024-07-28 10:58:14.543221	2024-07-28 10:58:14.541363
4520	43	60	238	2024-07-28 10:47:33.701069	2024-07-28 10:58:21.356916	\N
4521	43	38	151	2024-07-28 10:47:33.701069	2024-07-28 10:58:26.753215	\N
4522	43	72	287	2024-07-28 10:47:33.701069	2024-07-28 10:58:36.714192	\N
4523	43	19	76	2024-07-28 10:47:33.701069	2024-07-28 10:58:44.223735	\N
4524	43	74	295	2024-07-28 10:47:33.701069	2024-07-28 10:58:51.545515	\N
4525	43	31	122	2024-07-28 10:47:33.701069	2024-07-28 10:58:56.932847	\N
4526	43	18	70	2024-07-28 10:47:33.701069	2024-07-28 10:59:05.425867	\N
4527	43	1	4	2024-07-28 10:47:33.701069	2024-07-28 10:59:08.479494	\N
4528	43	2	7	2024-07-28 10:47:33.701069	2024-07-28 10:59:12.083809	\N
4529	43	47	187	2024-07-28 10:47:33.701069	2024-07-28 10:59:26.833265	\N
4530	43	37	145	2024-07-28 10:47:33.701069	2024-07-28 10:59:33.985646	\N
4531	43	44	173	2024-07-28 10:47:33.701069	2024-07-28 10:59:36.972931	\N
4532	43	3	\N	2024-07-28 10:47:33.701069	2024-07-28 10:59:45.908168	2024-07-28 10:59:45.899847
4533	43	6	21	2024-07-28 10:47:33.701069	2024-07-28 10:59:48.287733	\N
4534	43	61	242	2024-07-28 10:47:33.701069	2024-07-28 10:59:56.162902	\N
4852	45	69	274	2024-07-28 12:20:25.470607	2024-07-28 12:20:25.470607	\N
4630	41	2	\N	2024-07-28 10:49:29.798781	2024-07-28 10:49:29.798781	\N
4619	41	88	352	2024-07-28 10:49:29.798781	2024-07-28 10:50:04.710848	\N
4620	41	16	64	2024-07-28 10:49:29.798781	2024-07-28 10:50:21.236008	\N
4621	41	19	76	2024-07-28 10:49:29.798781	2024-07-28 10:50:23.591081	\N
4636	43	17	66	2024-07-28 10:50:32.548238	2024-07-28 10:50:32.548238	\N
4637	44	48	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4638	44	2	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4639	44	67	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4640	44	90	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4641	44	86	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4642	44	17	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4643	44	61	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4644	44	37	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4645	44	56	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4646	44	4	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4647	44	27	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4648	44	31	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4649	44	45	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4650	44	59	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4651	44	46	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4652	44	1	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4653	44	70	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4654	44	73	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4655	44	20	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4656	44	89	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4657	44	7	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4658	44	29	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4659	44	47	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4660	44	38	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4661	44	71	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4662	44	18	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4663	44	40	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4664	44	3	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4665	44	28	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4666	44	72	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4667	44	5	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4668	44	19	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4669	44	39	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4670	44	75	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4671	44	44	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4672	44	60	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4673	44	88	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4674	44	74	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4675	44	68	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4676	44	87	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4677	44	6	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4678	44	16	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4679	44	57	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4680	44	58	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4681	44	21	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4682	44	69	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4683	44	15	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4684	44	62	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4685	44	36	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4686	44	30	\N	2024-07-28 10:50:51.591898	2024-07-28 10:50:51.591898	\N
4687	44	62	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4688	44	1	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4689	44	47	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4690	44	87	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4691	44	89	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4692	44	21	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4693	44	56	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4694	44	38	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4695	44	59	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4696	44	15	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4697	44	7	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4698	44	6	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4699	44	36	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4700	44	70	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4701	44	72	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4702	44	86	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4704	44	28	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4705	44	40	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4706	44	46	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4707	44	75	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4708	44	58	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4709	44	4	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4710	44	69	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4711	44	57	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4712	44	5	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4713	44	48	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4714	44	18	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4715	44	29	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4716	44	30	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4717	44	44	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4718	44	71	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4719	44	16	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4720	44	27	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4721	44	31	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4722	44	67	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4723	44	2	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4724	44	3	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4725	44	73	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4726	44	17	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4727	44	45	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4728	44	60	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4729	44	88	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4730	44	68	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4731	44	39	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4732	44	74	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4733	44	19	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4734	44	90	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4735	44	61	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4736	44	37	\N	2024-07-28 10:50:57.884062	2024-07-28 10:50:57.884062	\N
4703	44	20	80	2024-07-28 10:50:57.884062	2024-07-28 10:50:58.907902	\N
4737	44	40	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4738	44	57	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4739	44	58	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4740	44	68	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4741	44	7	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4742	44	3	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4743	44	89	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4744	44	31	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4745	44	37	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4746	44	56	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4747	44	75	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4748	44	16	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4749	44	90	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4750	44	19	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4622	41	62	246	2024-07-28 10:49:29.798781	2024-07-28 10:51:38.602085	\N
4623	41	87	347	2024-07-28 10:49:29.798781	2024-07-28 10:51:45.612256	\N
4624	41	27	106	2024-07-28 10:49:29.798781	2024-07-28 10:52:04.549266	\N
4625	41	39	155	2024-07-28 10:49:29.798781	2024-07-28 10:52:09.442571	\N
4626	41	56	224	2024-07-28 10:49:29.798781	2024-07-28 10:52:37.30339	\N
4627	41	29	\N	2024-07-28 10:49:29.798781	2024-07-28 10:52:52.737279	2024-07-28 10:52:52.735693
4628	41	68	269	2024-07-28 10:49:29.798781	2024-07-28 10:53:08.98478	\N
4629	41	57	227	2024-07-28 10:49:29.798781	2024-07-28 10:53:26.642144	\N
4631	41	73	292	2024-07-28 10:49:29.798781	2024-07-28 10:53:34.0477	\N
4632	41	31	122	2024-07-28 10:49:29.798781	2024-07-28 10:54:11.980115	\N
4633	41	40	158	2024-07-28 10:49:29.798781	2024-07-28 10:54:21.459853	\N
4634	41	4	13	2024-07-28 10:49:29.798781	2024-07-28 10:54:24.513717	\N
4635	41	20	79	2024-07-28 10:49:29.798781	2024-07-28 10:54:37.79604	\N
4801	45	73	\N	2024-07-28 11:57:18.242346	2024-07-28 12:05:17.925075	2024-07-28 12:05:17.92255
4751	44	67	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4752	44	62	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4753	44	4	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4754	44	48	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4755	44	5	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4756	44	17	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4757	44	71	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4758	44	2	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4759	44	59	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4760	44	74	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4761	44	69	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4762	44	20	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4763	44	36	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4764	44	18	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4765	44	1	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4766	44	21	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4767	44	27	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4768	44	72	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4769	44	88	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4770	44	39	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4771	44	60	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4772	44	47	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4773	44	87	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4774	44	61	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4775	44	15	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4776	44	46	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4777	44	38	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4778	44	30	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4779	44	6	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4780	44	28	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4781	44	73	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4782	44	70	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4783	44	86	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4784	44	29	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4785	44	44	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4786	44	45	\N	2024-07-28 10:51:22.217894	2024-07-28 10:51:22.217894	\N
4841	45	73	\N	2024-07-28 12:05:17.945561	2024-07-28 12:05:18.030009	2024-07-28 12:05:18.027934
4842	45	73	\N	2024-07-28 12:05:18.150514	2024-07-28 12:05:51.577864	2024-07-28 12:05:51.575928
4854	45	31	122	2024-07-28 12:26:33.876981	2024-07-28 12:26:33.876981	\N
4864	45	27	\N	2024-07-28 12:39:26.108151	2024-07-28 12:39:41.10762	2024-07-28 12:39:41.104438
4865	45	27	\N	2024-07-28 12:39:50.756653	2024-07-28 12:40:40.142418	2024-07-28 12:40:40.140325
4882	46	47	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4883	46	19	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4884	46	69	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4885	46	36	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4886	46	72	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4887	46	68	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4888	46	17	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4889	46	44	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4890	46	73	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4891	46	89	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4892	46	4	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4893	46	20	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4894	46	31	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4895	46	59	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4896	46	1	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4897	46	30	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4898	46	58	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4899	46	2	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4900	46	27	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4901	46	38	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4902	46	57	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4903	46	37	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4904	46	90	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4905	46	88	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4906	46	7	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4907	46	40	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4908	46	87	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4909	46	28	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4910	46	75	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4911	46	29	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4912	46	70	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4913	46	74	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4914	46	86	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4915	46	46	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4916	46	5	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4917	46	48	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4918	46	39	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4919	46	60	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4920	46	16	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4921	46	71	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4922	46	67	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4923	46	61	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4924	46	6	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4925	46	3	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4926	46	15	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4927	46	21	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4928	46	18	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4929	46	56	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4930	46	62	\N	2024-07-28 15:08:05.175688	2024-07-28 15:08:05.175688	\N
4948	47	31	122	2024-07-28 15:34:10.203806	2024-07-28 15:42:20.682226	\N
5012	47	62	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5013	47	70	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5014	47	40	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5015	47	5	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5016	47	27	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5017	47	15	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5018	47	18	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5019	47	37	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5020	47	3	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5021	47	16	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5022	47	88	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5023	47	90	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5024	47	20	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5025	47	68	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5028	47	6	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5029	47	72	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5030	47	86	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5031	47	60	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5032	47	74	\N	2024-07-28 15:49:46.1632	2024-07-28 15:49:46.1632	\N
5027	47	48	192	2024-07-28 15:49:46.1632	2024-07-28 15:50:58.680117	\N
5026	47	45	178	2024-07-28 15:49:46.1632	2024-07-28 15:51:30.360713	\N
5065	47	17	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5066	47	48	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5067	47	39	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5068	47	60	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5069	47	72	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5070	47	47	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5071	47	86	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5072	47	70	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5073	47	40	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5074	47	46	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5075	47	61	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5076	47	75	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5077	47	21	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5078	47	67	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5079	47	19	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5080	47	29	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5081	47	28	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5082	47	6	\N	2024-07-28 15:51:45.464561	2024-07-28 15:51:45.464561	\N
5036	47	45	178	2024-07-28 15:51:45.464561	2024-07-28 15:51:47.57732	\N
\.


--
-- Data for Name: assessmentGeneralCategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."assessmentGeneralCategory" ("assesmentGeneralCategoryId", "assessmentId", "generalCategoryId", "questionCount", "createdOn", "updatedOn", "deletedOn") FROM stdin;
1	1	10	5	2024-07-28 03:22:33.160311	2024-07-28 04:14:10.971146	\N
7	1	6	5	2024-07-28 03:22:33.443012	2024-07-28 04:14:11.042423	\N
2	1	9	5	2024-07-28 03:22:33.275388	2024-07-28 04:14:11.156894	\N
3	1	8	4	2024-07-28 03:22:33.342505	2024-07-28 04:14:11.173494	\N
4	1	5	5	2024-07-28 03:22:33.34537	2024-07-28 04:14:11.176818	\N
9	1	2	5	2024-07-28 03:22:33.495467	2024-07-28 04:14:11.178066	\N
6	1	3	7	2024-07-28 03:22:33.438759	2024-07-28 04:14:11.194095	\N
5	1	4	5	2024-07-28 03:22:33.422149	2024-07-28 04:14:11.196162	\N
8	1	7	7	2024-07-28 03:22:33.452587	2024-07-28 04:14:11.226583	\N
10	1	1	2	2024-07-28 03:22:33.501362	2024-07-28 04:14:11.24351	\N
\.


--
-- Data for Name: assessmentGradeSubject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."assessmentGradeSubject" ("assessmentGradeSubjectId", "assessmentId", "gradeId", "subjectId", "questionCount", "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: attendAssessment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."attendAssessment" ("attendAssessmentId", "teacherId", "assessmentId", attended, "startTime", "endTime", "markScored", status, "totalAssessmentMark", "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: attendAssessment-general; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."attendAssessment-general" ("attendAssessmentId", "userId", "assessmentId", attended, "startTime", "endTime", "markScored", status, "totalAssessmentMark", "createdOn", "updatedOn", "deletedOn") FROM stdin;
10	36	1	t	05:32:00	\N	\N	Start	\N	2024-07-28 05:32:01.175805	2024-07-28 05:32:01.175805	\N
11	35	1	t	05:32:00	05:32:00	0	Terminate	50	2024-07-28 05:32:01.605849	2024-07-28 05:32:16.095292	\N
18	30	1	t	05:34:00	05:34:00	0	Terminate	50	2024-07-28 05:34:20.66013	2024-07-28 05:34:35.755396	\N
12	51	1	t	05:32:00	05:36:00	0	Terminate	50	2024-07-28 05:32:02.156532	2024-07-28 05:36:08.4753	\N
2	40	1	t	05:30:00	05:39:00	0	Terminate	50	2024-07-28 05:30:25.349595	2024-07-28 05:39:09.737317	\N
23	37	1	t	05:38:00	05:41:00	0	Terminate	50	2024-07-28 05:38:13.565445	2024-07-28 05:41:08.44651	\N
8	25	1	t	05:31:00	05:42:00	0	Terminate	50	2024-07-28 05:31:39.222902	2024-07-28 05:42:13.69843	\N
40	24	1	t	10:29:00	\N	\N	Start	\N	2024-07-28 10:29:22.891502	2024-07-28 10:29:22.891502	\N
5	23	1	t	05:30:00	05:43:00	37	End	50	2024-07-28 05:30:40.957897	2024-07-28 05:43:20.842658	\N
39	41	1	t	10:11:00	10:34:00	38	End	50	2024-07-28 10:11:00.187858	2024-07-28 10:34:41.14886	\N
25	10	1	t	05:41:00	05:50:00	0	Terminate	50	2024-07-28 05:41:00.581814	2024-07-28 05:50:47.79874	\N
3	4	1	t	05:30:00	05:52:00	29	End	50	2024-07-28 05:30:30.138199	2024-07-28 05:52:20.594341	\N
19	13	1	t	05:34:00	05:54:00	35	End	50	2024-07-28 05:34:34.284595	2024-07-28 05:54:38.940239	\N
17	45	1	t	05:34:00	05:55:00	46	End	50	2024-07-28 05:34:09.495054	2024-07-28 05:55:24.758701	\N
14	8	1	t	05:32:00	05:56:00	40	End	50	2024-07-28 05:32:29.049104	2024-07-28 05:56:33.581009	\N
20	49	1	t	05:37:00	05:56:00	0	Terminate	50	2024-07-28 05:37:51.309151	2024-07-28 05:56:38.010279	\N
15	9	1	t	05:33:00	05:57:00	34	End	50	2024-07-28 05:33:15.459142	2024-07-28 05:57:10.342915	\N
9	6	1	t	05:31:00	05:58:00	49	End	50	2024-07-28 05:31:42.481009	2024-07-28 05:58:45.445243	\N
13	38	1	t	05:32:00	06:03:00	45	End	50	2024-07-28 05:32:27.518815	2024-07-28 06:03:23.488754	\N
4	44	1	t	05:30:00	06:04:00	44	End	50	2024-07-28 05:30:33.156497	2024-07-28 06:04:32.544761	\N
26	46	1	t	05:45:00	06:04:00	0	Terminate	50	2024-07-28 05:45:16.138638	2024-07-28 06:04:58.023605	\N
16	28	1	t	05:33:00	06:08:00	39	End	50	2024-07-28 05:33:45.533428	2024-07-28 06:08:57.018814	\N
22	52	1	t	05:37:00	06:09:00	47	End	50	2024-07-28 05:37:54.055078	2024-07-28 06:09:22.830599	\N
1	42	1	t	05:30:00	06:09:00	26	End	50	2024-07-28 05:30:12.303941	2024-07-28 06:09:42.064531	\N
7	33	1	t	05:30:00	06:13:00	41	End	50	2024-07-28 05:30:57.048024	2024-07-28 06:13:22.891763	\N
21	50	1	t	05:37:00	06:17:00	47	End	50	2024-07-28 05:37:52.037197	2024-07-28 06:17:36.890483	\N
6	27	1	t	05:30:00	06:17:00	41	End	50	2024-07-28 05:30:50.657156	2024-07-28 06:17:42.578496	\N
31	20	1	t	06:05:00	06:26:00	0	Terminate	50	2024-07-28 06:05:49.007828	2024-07-28 06:26:47.380561	\N
29	14	1	t	05:51:00	06:27:00	12	End	50	2024-07-28 05:51:27.323576	2024-07-28 06:27:04.166068	\N
28	5	1	t	05:50:00	06:28:00	32	End	50	2024-07-28 05:50:43.327104	2024-07-28 06:28:39.595676	\N
27	21	1	t	05:49:00	06:34:00	28	End	50	2024-07-28 05:49:24.816124	2024-07-28 06:34:07.47291	\N
24	26	1	t	05:40:00	06:36:00	32	End	50	2024-07-28 05:40:03.02964	2024-07-28 06:36:47.950192	\N
30	7	1	t	06:03:00	06:53:00	30	End	50	2024-07-28 06:03:30.411415	2024-07-28 06:53:36.194617	\N
32	53	1	t	07:04:00	07:17:00	46	End	50	2024-07-28 07:04:34.996837	2024-07-28 07:17:59.261644	\N
33	43	1	t	09:39:00	09:51:00	47	End	50	2024-07-28 09:39:43.805762	2024-07-28 09:51:13.409741	\N
35	12	1	t	09:43:00	09:58:00	48	End	50	2024-07-28 09:43:38.023509	2024-07-28 09:58:34.027424	\N
36	39	1	t	09:54:00	10:01:00	47	End	50	2024-07-28 09:54:36.568976	2024-07-28 10:01:26.862696	\N
37	32	1	t	09:56:00	10:05:00	16	End	50	2024-07-28 09:56:27.535195	2024-07-28 10:05:01.421366	\N
38	11	1	t	10:08:00	10:21:00	47	End	50	2024-07-28 10:08:02.630792	2024-07-28 10:21:23.626071	\N
34	3	1	t	09:43:00	10:28:00	42	End	50	2024-07-28 09:43:10.990036	2024-07-28 10:28:52.516119	\N
42	48	1	t	10:39:00	10:46:00	42	End	50	2024-07-28 10:39:32.086105	2024-07-28 10:46:36.79221	\N
44	47	1	t	10:47:00	10:50:00	0	Terminate	50	2024-07-28 10:47:17.164569	2024-07-28 10:50:58.621378	\N
41	34	1	t	10:37:00	10:54:00	11	End	50	2024-07-28 10:37:52.263254	2024-07-28 10:54:37.606465	\N
43	31	1	t	10:44:00	10:59:00	35	End	50	2024-07-28 10:44:23.571758	2024-07-28 10:59:55.977147	\N
45	54	1	t	11:57:00	12:47:00	38	End	49	2024-07-28 11:57:17.443728	2024-07-28 12:47:22.667415	\N
46	19	1	t	15:08:00	\N	\N	Start	\N	2024-07-28 15:08:04.296346	2024-07-28 15:08:04.296346	\N
47	15	1	t	15:34:00	15:51:00	0	Terminate	50	2024-07-28 15:34:08.705618	2024-07-28 15:51:47.365153	\N
\.


--
-- Data for Name: business; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.business ("businessId", name, "businessAdminName", "businessTypeId", description, address, state, district, city, pincode, "userId", email, contact, "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: business-admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."business-admin" ("subBusinessId", "businessId", name, department, address, state, district, city, pincode, "userId", email, contact, "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: business-type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."business-type" ("businessTypeId", caption, is_delete, "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city ("cityId", name, "districtId", "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.district ("districtId", name, "stateId", "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: generalCategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."generalCategory" ("generalCategoryId", caption, "createdOn", "updatedOn", "deletedOn") FROM stdin;
1	An Introduction to the ITeS Sector	2024-07-28 02:55:58.769428	2024-07-28 02:55:58.769428	\N
2	Capture Query and Identify SLA for Resolution	2024-07-28 02:56:16.476246	2024-07-28 02:56:16.476246	\N
3	Creation of  a process flow from a query initiation to its final resolution	2024-07-28 02:56:47.014201	2024-07-28 02:56:47.014201	\N
4	Different Styles Approaches of Documentation	2024-07-28 02:57:02.254656	2024-07-28 02:57:02.254656	\N
5	Escalate matters which fall out of your authority	2024-07-28 02:57:17.250343	2024-07-28 02:57:17.250343	\N
6	Evaluate Query Resolution	2024-07-28 02:57:32.923548	2024-07-28 02:57:32.923548	\N
7	Identify the Query Domain	2024-07-28 02:57:44.427298	2024-07-28 02:57:44.427298	\N
8	Job Role of a Customer Care Executive – Domestic (Non-Voice)	2024-07-28 02:58:00.172562	2024-07-28 02:58:00.172562	\N
9	Query, Request or Complaint	2024-07-28 02:58:13.963913	2024-07-28 02:58:13.963913	\N
10	Resolve Queries within Your Area of Competence or Authority	2024-07-28 02:58:24.753141	2024-07-28 02:58:24.753141	\N
\.


--
-- Data for Name: grade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grade ("gradeId", caption, "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
\.


--
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.option ("optionId", "questionId", "isCorrect", option, "createdOn", "updatedOn", "deletedOn") FROM stdin;
1	1	f	1989	2024-07-28 02:59:29.559676	2024-07-28 02:59:29.559676	\N
2	1	f	1919	2024-07-28 02:59:29.559676	2024-07-28 02:59:29.559676	\N
3	1	f	1992	2024-07-28 02:59:29.559676	2024-07-28 02:59:29.559676	\N
4	1	t	1990	2024-07-28 02:59:29.559676	2024-07-28 02:59:29.559676	\N
5	2	f	Learning skills	2024-07-28 02:59:29.559676	2024-07-28 02:59:29.559676	\N
6	2	f	Communication skills	2024-07-28 02:59:29.559676	2024-07-28 02:59:29.559676	\N
7	2	t	Culinary skills	2024-07-28 02:59:29.559676	2024-07-28 02:59:29.559676	\N
8	2	f	Interpersonal skills	2024-07-28 02:59:29.559676	2024-07-28 02:59:29.559676	\N
9	3	f	To avoid resolving the issue	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
10	3	f	To prolong the interaction with the customer	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
11	3	t	To inform the customer about the resolution process	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
12	3	f	To delay the resolution of the problem	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
13	4	t	Service Level Agreement	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
14	4	f	Sales and Logistics Association	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
15	4	f	Service Level Assessment	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
16	4	f	Strategic Leadership Analysis	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
17	5	f	Identifying new market opportunities	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
18	5	f	Improving product quality	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
19	5	f	Optimizing production processes	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
20	5	t	Enhancing customer service	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
21	6	t	Special Economic Zone	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
22	6	f	Superior Economic Zone	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
23	6	f	Strategic Export Zone	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
24	6	f	Social Enterprise Zone	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
25	7	f	The process of insourcing certain business operations	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
26	7	t	The practice of subcontracting tasks or processes to external parties	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
27	7	f	The internalization of all business functions	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
28	7	f	The relocation of business operations to another country	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
29	8	f	Inbound communication	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
30	8	t	Outbound communication	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
31	8	f	Informal communication	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
32	8	f	None of these	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
33	9	f	Request for Comment	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
34	9	f	Report for Change	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
35	9	t	Request for Change	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
36	9	f	Request for Communication	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
37	10	f	Fully privatisation of telecommunication	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
38	10	t	Rapid industrialisation	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
39	10	f	High operating cost	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
40	10	f	High tax	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
41	11	f	Excellent written skill	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
42	11	f	Customer centric	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
43	11	f	Excellent knowledge of basic computer skill	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
44	11	t	All of the above	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
45	12	f	Price Comparison	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
46	12	f	Availability of product	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
47	12	f	Product information	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
48	12	t	All of the above	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
49	13	f	Secure	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
50	13	t	Costly	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
51	13	f	Personal	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
52	13	f	Real-time	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
53	14	f	SLAs based on the customer	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
54	14	t	Customer based on SLA	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
55	14	f	Enterprise-level SLA	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
56	14	f	Customer-level SLA	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
57	15	f	Do not disclose customer personal and financial information to anyone other than the account holder	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
58	15	t	Share customer information with other customers for verification purposes	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
59	15	f	Do not disclose unauthorized written or oral information to any customer/competitor	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
60	15	f	Maintain absolute confidentiality of customer information	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
61	16	f	Install unauthorized software on company computers	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
62	16	f	Disregard NDAs from 3rd Parties	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
63	16	t	Work within the organization’s policies and procedures	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
64	16	f	Share confidential information with unauthorized persons	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
65	17	f	Share confidential information with unauthorized persons	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
66	17	t	Sign the Confidentiality Agreement (NDA)	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
67	17	f	Ignore confidentiality provisions in SLAs	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
68	17	f	Use unauthorized storage devices at work	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
69	18	f	Allowing employees to bring any storage devices to work	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
70	18	f	Allowing access to unauthorized sites on the internet	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
71	18	t	Frisking employees at entry and exit points to check for storage devices	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
72	18	f	None of the above	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
73	19	f	Copy of Aadhaar card	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
74	19	f	Copy of voter card	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
75	19	f	Copy of pan card	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
76	19	t	All of the above	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
77	20	f	Increasing revenue	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
78	20	f	Reducing operational costs	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
79	20	t	Improving customer loyalty	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
80	20	f	Enhancing product features	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
81	21	t	Measurable	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
82	21	f	Meaningful	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
83	21	f	Manageable	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
84	21	f	Memorable	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
85	22	f	Providing entertainment to customers	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
86	22	t	Responding to customer queries and requests	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
87	22	f	Selling products aggressively	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
88	22	f	Ignoring customer complaints	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
89	23	f	Detailed product demonstrations	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
90	23	f	Complex problem-solving	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
91	23	t	Simple problem-solving	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
92	23	f	Conducting surveys	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
93	24	f	Generating social media campaigns	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
94	24	t	Tracking and maintaining customer interactions	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
95	24	f	Monitoring employee productivity	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
96	24	f	Managing financial transactions	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
97	25	t	Identifying, segregating, and targeting potential clients	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
98	25	f	Managing financial transactions	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
99	25	f	Generating social media campaigns	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
100	25	f	Analysing employee performance	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
101	26	f	To reduce the number of chat sessions initiated by customers	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
102	26	f	To encourage customers to decline chat offers	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
103	26	t	To increase chat engagement by reaching out to potential customers	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
104	26	f	To limit the availability of chat support to selected customers	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
105	27	t	If the issue is beyond legal scope	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
106	27	f	If the issue requires immediate resolution	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
107	27	f	If the customer is unhappy with the service	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
108	27	f	If the issue is minor and can be resolved quickly	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
109	28	f	A request for a product demonstration	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
110	28	t	A request for information or advice from a user	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
111	28	f	A request for a discount on a purchase	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
112	28	f	A request for additional features in a software	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
113	29	f	Ignore the customer's concerns	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
114	29	t	Share the service request number with the customer	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
115	29	f	Promise a quick resolution without verifying the issue	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
116	29	f	Delete the service request	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
117	30	t	Factual and accurate	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
118	30	f	Exaggerated to provide false hope	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
119	30	f	Random and speculative	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
120	30	f	Unrelated to the issue	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
121	31	f	It wastes time	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
122	31	t	It makes the customer feel valued and understood	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
123	31	f	It confuses the customer	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
124	31	f	It's not necessary	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
125	32	f	Ignore the information and proceed	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
126	32	t	Repeat it to the customer to cross-check	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
127	32	f	Keep the information to oneself	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
128	32	f	End the conversation with the customer	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
129	33	f	OIer the customer a refund for the overcharged amount.	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
130	33	f	Provide the customer with a temporary discount on their subscription.	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
131	33	t	Issue a service request to involve the billing department in resolving the billing error.	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
132	33	f	Instruct the customer to dispute the charge directly with their bank.	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
133	34	t	Remain calm and empathize with the customer's situation	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
134	34	f	Respond with equal frustration to match the customer's energy	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
135	34	f	Ignore the customer's emotions and focus solely on resolving the issue	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
136	34	f	End the conversation immediately to avoid further conflict	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
137	35	f	Assume the customer's issue is simple and provide a quick 1x	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
138	35	f	OIer technical jargon to impress the customer with expertise	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
139	35	t	Listen actively, ask clarifying questions, and patiently guide the customer through troubleshooting steps	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
140	35	f	Dismiss the customer's confusion and assert authority over the situation	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
141	36	t	Offer to send a copy of the transcript via email	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
142	36	f	Prompt customers to record the conversation	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
143	36	f	Provide a summary of the chat session	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
144	36	f	Encourage customers to take screenshots	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
145	37	f	It increases response time	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
146	37	f	It decreases customer satisfaction	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
147	37	t	It reduces wait time for customers initiating chat sessions	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
148	37	f	It limits the number of chat sessions accepted by agents	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
149	38	f	Take it personally and react defensively	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
150	38	f	Say it again to assert authority	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
151	38	t	Be kind, patient, and empathetic	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
152	38	f	Avoid troubleshooting and solving the problem	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
153	39	f	It delays response time	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
154	39	f	It prevents transferring customers to relevant agents	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
155	39	t	It ensures that agents know everything	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
156	39	f	It allows transferring customers to agents with relevant expertise	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
157	40	f	To prolong resolution time for customer issues	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
158	40	f	To ignore previous customer problems	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
159	40	t	To proactively monitor customer issues by staying up-to-date	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
160	40	f	To prevent agents from reviewing previous conversations	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
161	41	f	It helps in deceiving customers	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
162	41	t	It facilitates understanding customer opinions	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
163	41	f	It discourages businesses from improving	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
164	41	f	It encourages dishonesty in business practices	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
165	42	f	It immediately resolves all customer issues	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
166	42	f	It involves transferring issues to another team	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
167	42	t	It follows a chain of command for issue resolution	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
168	42	f	It ignores customer complaints	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
169	43	f	To ignore customer opinions	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
170	43	f	To create a negative image of the company	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
171	43	t	To improve future customer service	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
172	43	f	To discourage customers from providing feedback	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
173	44	f	Mean Time Before Failure	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
174	44	f	Maximum Time Between Failures	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
175	44	f	Median Time Between Failures	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
176	44	t	Mean Time Between Failures	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
177	45	f	To increase paperwork	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
178	45	t	To verify customer identity	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
179	45	f	To discourage customers from using the service	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
180	45	f	To share customer information with competitors	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
181	46	t	By asking for personal details shared during documentation	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
182	46	f	By randomly selecting customers for verification	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
183	46	f	By avoiding any verification process	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
184	46	f	By sharing customer details with colleagues	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
185	47	f	Providing discounts to customers	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
186	47	f	Informing customers about the latest products	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
187	47	t	Reminding customers of due payments	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
188	47	f	Collecting feedback from customers	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
189	48	f	Informing customers of payment status	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
190	48	f	Reminding customers of due dates	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
191	48	f	Collecting payments after the due date	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
192	48	t	Providing updates on product features	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
193	49	f	Keeping customers uninformed about payment status	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
194	49	f	Delaying payment reminders indefinitely	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
195	49	t	Ensuring customers are aware of their payment obligations	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
196	49	f	Ignoring customer queries related to payments	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
197	50	f	The customer's favourite service plan	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
198	50	f	The current balance of the customer's account	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
199	50	t	The current status of the customer’s account	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
200	50	f	The customer's preferred payment method	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
201	51	f	Sympathy	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
202	51	t	Empathy	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
203	51	f	Anger	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
204	51	f	Happy	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
205	52	t	Open probe	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
206	52	f	Closed probe	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
207	52	f	Multiple-choice probe	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
208	52	f	None of the above	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
209	53	t	Open probe	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
210	53	f	Closed probe	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
211	53	f	Multiple-choice probe	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
212	53	f	None of the above	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
213	54	f	Open probe	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
214	54	t	Closed probe	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
215	54	f	Free-form probe	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
216	54	f	Indirect probe	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
217	55	t	At the beginning of the conversation	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
218	55	f	Only when discussing unrelated topics	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
219	55	f	When the customer prefers yes/no responses	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
220	55	f	None of the above	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
221	56	f	Respond with arrogance to assert dominance	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
222	56	f	Ignore the customer's arrogance and focus on completing the call quickly	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
223	56	t	Remain courteous and acknowledge the customer's statements without feeding into their ego	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
224	56	f	End the conversation abruptly to avoid confrontation	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
225	57	f	Increasing errors	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
226	57	f	Standardizing claim processing	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
227	57	t	Decision-making or conditional ramifications	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
228	57	f	Complicating the decision-making process	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
229	58	f	To make the conversation more formal	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
230	58	t	To speed up workflow and standardize claim processing	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
231	58	f	To increase errors in handling customer queries	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
232	58	f	To complicate the process of resolving customer issues	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
233	59	f	Case Studies	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
234	59	f	Rule-based analysis	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
235	59	t	Focus Groups	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
236	59	f	Real-world learning	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
237	60	f	Increases marketing costs	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
238	60	t	Improves satisfaction and loyalty	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
239	60	f	Reduces product quality	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
240	60	f	Delays order processing	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
241	61	f	Acquiring new customers	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
242	61	t	Losing existing customers	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
243	61	f	Increasing customer satisfaction	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
244	61	f	Enhancing product features	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
245	62	f	Motherboard	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
246	62	t	Processor	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
247	62	f	Memory (RAM)	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
248	62	f	Case/chassis	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
249	63	f	Video card	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
250	63	f	Mouse	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
251	63	t	Sound card	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
252	63	f	Floppy drive	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
253	64	f	It controls the information displayed on the monitor	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
254	64	f	It feeds electrical power to every single part in the PC	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
255	64	f	It holds all the programs and data that the processor uses at any given time	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
256	64	t	It connects and controls all other components in the system	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
257	65	f	Printer	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
258	65	f	Monitor	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
259	65	t	Keyboard	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
260	65	f	Speaker	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
261	66	f	Mouse	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
262	66	t	Headset	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
263	66	f	Microphone	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
264	66	f	Monitor	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
265	67	f	Searching for nearby restaurants	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
266	67	t	Searching for emails based on keywords across all Outlook programs	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
267	67	f	Searching for movie reviews	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
268	67	f	Searching for the latest news articles	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
269	68	t	Live chat	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
270	68	f	Phone call	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
271	68	f	E-mail	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
272	68	f	Social media	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
273	69	f	Beginning with "what", "how", or "why"	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
274	69	t	Beginning with "do", "are", or "is"	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
275	69	f	Designed to expand on a topic	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
276	69	f	Used to obtain detailed information	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
277	70	t	M.S. Excel	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
278	70	f	M.S.Outlook	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
279	70	f	M.S.Access	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
280	70	f	M.S.Onenote	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
281	71	f	Regular meetings with clients	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
282	71	t	Solid knowledge base and supporting documents	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
283	71	f	Continuous product development	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
284	71	f	Minimal interaction with customers	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
285	72	f	User Guide	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
286	72	f	Knowledge Base	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
287	72	t	Email communication	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
288	72	f	Issues and workarounds	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
289	73	f	Software upgrade	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
290	73	t	Password reset	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
291	73	f	Network configuration change	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
292	73	f	Hardware replacement	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
293	74	f	Confirmation of resolution	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
294	74	f	False promises	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
295	74	t	Service request number for future reference	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
296	74	f	Refund details	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
297	75	f	National Defense Alliance	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
298	75	t	Non-Disclosure Agreement	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
299	75	f	National Democratic Alliance	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
300	75	f	Nuclear Decommissioning Authority	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
301	76	f	Legal statutes	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
302	76	t	Supporting documents	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
303	76	f	Ethical guidelines	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
304	76	f	Previous cases	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
305	77	f	Revenue	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
306	77	t	Customer satisfaction	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
307	77	f	Management failure	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
308	77	f	Costs	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
309	78	f	To showcase knowledge	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
310	78	t	To establish empathy	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
311	78	f	To demonstrate authority	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
312	78	f	None of the above	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
313	79	t	Building rapport	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
314	79	f	Demonstrating expertise	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
315	79	f	Enforcing rules	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
316	79	f	Maintaining confidentiality	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
317	80	t	Appreciated and valued	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
318	80	f	Ignored and unimportant	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
319	80	f	Confused and frustrated	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
320	80	f	IndiFFerent	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
321	81	t	Save the conversation for future reference	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
322	81	f	Delete the conversation	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
323	81	f	Forget about the customer's issue	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
324	81	f	Ignore updating the CRM	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
325	82	f	Provide incomplete information	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
326	82	t	OIer a viable alternative or escalate the issue	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
327	82	f	Ignore the customer's question	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
328	82	f	End the conversation abruptly	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
329	83	f	It wastes time	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
330	83	t	It makes the margin of error zero	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
331	83	f	It impresses the customer	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
332	83	f	It's not necessary	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
333	84	f	End the conversation abruptly	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
334	84	t	Be grateful and wish the customer a good day	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
335	84	f	Ignore the customer's needs	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
336	84	f	OIer incomplete solutions	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
337	85	f	Promise the customer an immediate replacement for the product.	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
338	85	f	OIer a refund without further investigation into the issue.	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
339	85	t	Issue a service request to escalate the problem to the appropriate technical team.	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
340	85	f	Advise the customer to 1x the issue themselves by following online	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
341	86	f	Blog	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
342	86	f	Twitter	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
343	86	t	Newsletter	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
344	86	f	Indeed	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
345	87	f	Information Technology and Engineering Services	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
346	87	f	Internet Technology and Engineering Solutions	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
347	87	t	Information Technology Enabled Services	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
348	87	f	International Technology and Enterprise Solutions	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
349	88	f	Ability to work independently	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
350	88	f	Ability to work in a team	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
351	88	f	Ability to multitask	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
352	88	t	All of the above	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
353	89	f	Responding to customer queries through chat or email	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
354	89	f	Providing technical support to customers	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
355	89	t	Selling products to customer	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
356	89	f	Handling customer complaints	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
357	90	f	To empathize with him/her	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
358	90	t	To greet him/her	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
359	90	f	To talk freely	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
360	90	f	None of the above	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
361	91	f	M.S.Excel	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
362	91	f	M.S.Powerpoint	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
363	91	f	M.S.Access	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
364	91	t	M.S.Outlook	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
365	92	f	Integrated search function	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
366	92	f	Advanced security	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
367	92	f	Offline access to mail	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
368	92	t	All of the above	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
369	93	f	Service Level Monitoring	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
370	93	f	Sales Line Management	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
371	93	t	Service Level Management	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
372	93	f	Service Line Monetization	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
373	94	t	Enterprise Level SLA	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
374	94	f	Customer Level SLA	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
375	94	f	Service Level SLA	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
376	94	f	None of the above	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
377	95	f	M.S.Excel	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
378	95	f	M.S.Outlook	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
379	95	f	M.S.Powerpoint	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
380	95	t	M.S.Onenote	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
381	96	f	Chat	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
382	96	f	Call	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
383	96	f	E-mail	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
384	96	t	Both (A)& (C)	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
385	97	f	M.S. Excel	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
386	97	f	M.S.Powerpoint	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
387	97	t	M.S. Access	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
388	97	f	M.S.Outlook	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
389	98	f	Enterprise-level SLA	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
390	98	t	Customer-level SLA	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
391	98	f	Service Level SLA	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
392	98	f	None of the above	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
393	99	f	SLAs based on the customer	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
394	99	t	Customer based on SLA	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
395	99	f	Enterprise-level SLA	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
396	99	f	Customer-level SLA	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
397	100	f	Enterprise Level SLA	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
398	100	f	Customer Based on SLA	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
399	100	f	Service Level SLA	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
400	100	t	Both  (A) and  (C)	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question ("questionId", "questionGroupId", language, question, "createdOn", "updatedOn", "deletedOn") FROM stdin;
1	1	ENGLISH	Microsoft Office was developed in the year .......................?	2024-07-28 02:59:29.559676	2024-07-28 02:59:29.559676	\N
2	2	ENGLISH	Which professional skill is NOT required for a CRM role?	2024-07-28 02:59:29.559676	2024-07-28 02:59:29.559676	\N
3	3	ENGLISH	Why is it important for a Customer Relationship Executive to determine the category of a problem and decide on a turnaround time?	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
4	4	ENGLISH	What is the full form of SLA?	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
5	5	ENGLISH	What does CRM data analysis help organisations with?	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
6	6	ENGLISH	What does SEZ stand for?	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
7	7	ENGLISH	What is outsourcing?	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
8	8	ENGLISH	Payment communication is an example for ………………?	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
9	9	ENGLISH	RFC stands for?	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
10	10	ENGLISH	Why is the IT sector growing?	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
11	11	ENGLISH	The skill set required for customer care executive domestic non-voice are?	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
12	12	ENGLISH	The area/s query can be about is/are ………………..:	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
13	13	ENGLISH	What are not the characteristics of live chat?	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
14	14	ENGLISH	An agreement for all customers to use the service provided by the service provider. Which type of SLA is mentioned in the above statement?	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
15	15	ENGLISH	Which of the following is NOT a rule to keep in mind when handling sensitive customer data?	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
16	16	ENGLISH	What should CRMs do to avoid information leaks and security breaches?	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
17	17	ENGLISH	What should new employees do regarding confidentiality?	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
18	18	ENGLISH	What measures are taken to protect data in the office premises according to the provided information?	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
19	19	ENGLISH	What are the documents needed for customer verification?	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
20	20	ENGLISH	What is the primary goal of measuring customer satisfaction?	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
21	21	ENGLISH	What does the "M" in SMART goals emphasize?	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
22	22	ENGLISH	What is the primary responsibility of a Customer Care Executive (CCE)?	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
23	23	ENGLISH	What type of interaction is live chat most suitable for?	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
24	24	ENGLISH	What is the primary function of a CRM system in an organisation?	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
25	25	ENGLISH	What is the primary function of CRM software in an organisation?	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
26	26	ENGLISH	What is the purpose of using targeted proactive chat?	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
27	27	ENGLISH	When should a service request be issued?	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
28	28	ENGLISH	What is a service request?	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
29	29	ENGLISH	What should be done after creating a service request?	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
30	30	ENGLISH	How should information shared with customers regarding service requests be?	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
31	31	ENGLISH	Why is it important to keep the customer engaged with words of empathy while capturing information for a service request?	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
32	32	ENGLISH	What should be done after capturing correct information from the client while raising a service request?	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
33	33	ENGLISH	A customer contacts the customer service department reporting a billing error on their monthly subscription. The representative confirms the discrepancy and realizes it requires investigation from the billing department. What should the representative do next?	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
34	34	ENGLISH	When dealing with a customer who is frustrated and agitated, what is the most appropriate approach?	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
35	35	ENGLISH	What approach should be taken when dealing with a customer who is confused and uncertain about their issue?	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
36	36	ENGLISH	What action should be taken at the end of a live chat session to ensure customers have a record of the conversation?	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
37	37	ENGLISH	How does automatically accepting chat requests benefit customer service?	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
38	38	ENGLISH	How can customer service agents handle angry customers effectively?	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
39	39	ENGLISH	How can chat forwarding be beneficial for customer service?	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
40	40	ENGLISH	What is the purpose of checking chat history for a customer's relevant issue?	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
41	41	ENGLISH	In the context of customer feedback, what is the significance of getting honest reviews?	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
42	42	ENGLISH	What is the main advantage of hierarchical escalation in customer service?	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
43	43	ENGLISH	What is the purpose of taking feedback from customers after resolving their issues?	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
44	44	ENGLISH	What is the full form of MTBF?	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
45	45	ENGLISH	What is the purpose of collecting necessary documents from customers during the contract signing process?	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
46	46	ENGLISH	How can agents verify customers during communications?	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
47	47	ENGLISH	What is the primary focus of outbound communications in the payments department?	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
48	48	ENGLISH	Which of the following is NOT a key purpose of payment communications?	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
49	49	ENGLISH	Which of the following is a crucial aspect of payment communications?	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
50	50	ENGLISH	What does "Account Status" typically refer to in customer service?	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
51	51	ENGLISH	“I know it is not easy to lose weight. I have faced the same problem myself” Which type of feeling is expressed in this sentence?	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
52	52	ENGLISH	What type of probing technique allows a client to freely express themselves?	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
53	53	ENGLISH	Which of the following typically begins with phrases like "what", "how", or "why"?	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
54	54	ENGLISH	Which probing technique limits customer responses to specific alternatives?	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
55	55	ENGLISH	When is it advisable to use open probes in a conversation?	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
56	56	ENGLISH	How can a customer service representative maintain professionalism when dealing with an arrogant customer?	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
57	57	ENGLISH	What is the basis of rule-based analysis on data/information?	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
58	58	ENGLISH	Why are templates important in customer service for recording queries and resolutions?	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
59	59	ENGLISH	Which method is based on group discussions for in-depth topic assessment?	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
60	60	ENGLISH	How does personalised communication affect customer retention?	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
61	61	ENGLISH	What does customer churn refer to in business?	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
62	62	ENGLISH	Which component is considered the "engine" of the computer?	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
63	63	ENGLISH	What component enables the PC to generate complex sounds?	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
64	64	ENGLISH	What is the primary function of the motherboard in a PC system?	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
65	65	ENGLISH	Which of the following devices is considered an input-only device?	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
66	66	ENGLISH	Which device can serve as both an input and output device depending on its function?	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
67	67	ENGLISH	What is the primary function of the integrated search function in Microsoft Outlook?	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
68	68	ENGLISH	Which communication channel is best suited for simple problem-solving and self-service support?	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
69	69	ENGLISH	How are closed probes typically structured?	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
70	70	ENGLISH	…....allows users to enter data into spreadsheets and create calculations and charts?	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
71	71	ENGLISH	What is emphasized as essential for each process or wing within an organization to effectively solve customer problems?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
72	72	ENGLISH	Which of the following is NOT listed as a form of support for solving customer problems?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
73	73	ENGLISH	Which of the following is an example of a standard requirement that does not require the submission of an RFC?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
74	74	ENGLISH	What should be shared with the customer once a service request has been issued?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
75	75	ENGLISH	What does "NDA" stand for?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
76	76	ENGLISH	Moderators should consult and review …......before recommending a solution.?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
77	77	ENGLISH	Accessing your organization’s Knowledge Base for solutions to queries primarily aids in:	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
78	78	ENGLISH	What is the primary reason for emphasizing the greeting part of a communication?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
79	79	ENGLISH	What role does introducing oneself and the company play in conversation?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
80	80	ENGLISH	What impression does a warm closing leave on the customer?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
81	81	ENGLISH	What action should a customer care executive take after concluding a conversation with a customer?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
82	82	ENGLISH	What should a customer care executive do if the customer's question falls outside their area of expertise?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
83	83	ENGLISH	Why is it important for a customer care executive to consult supporting documents before recommending a solution?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
84	84	ENGLISH	How should a customer care executive conclude the conversation with a customer according to the provided guidelines?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
85	85	ENGLISH	A customer contacts the customer service department regarding a malfunctioning product they purchased recently. The customer service representative listens to the issue and determines that it requires technical support beyond their expertise. What should the representative do in this situation?	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
86	86	ENGLISH	The traditional source which is used to stay up to date about the company’s information is………………?	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
87	87	ENGLISH	ITeS stands for?	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
88	88	ENGLISH	What are the important skills for a customer care executive to possess?	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
89	89	ENGLISH	Which of the following is not a responsibility of customer care executive domestic non-voice?	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
90	90	ENGLISH	The first and foremost thing to keep in mind while starting a conversation is?	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
91	91	ENGLISH	A popular choice for email management is?	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
92	92	ENGLISH	The key advantage of M.S. Outlook is/are:	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
93	93	ENGLISH	What is the full form of SLM?	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
94	94	ENGLISH	Less volatile SLA is :	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
95	95	ENGLISH	…………………….allows users to draw and write notes with a pen-on-paper feel ?	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
96	96	ENGLISH	The mode of resolution taken by CRM-domestic-non-voice is/ are:	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
97	97	ENGLISH	…………………allows users to store data across multiple tables:	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
98	98	ENGLISH	……………………covers all the SLM issues related to a specific customer group, regardless of the service used.?	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
99	99	ENGLISH	A service station that provides periodic service to all customers and provides some maintenance as part of a universal fee offer is an example of ……………….?	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
100	100	ENGLISH	What are the tiers of SLAs?	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
\.


--
-- Data for Name: question-group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."question-group" ("questionGroupId", type, "subjectId", "gradeId", "generalCategoryId", level, mark, status, "createdOn", "updatedOn", "deletedOn") FROM stdin;
1	GENERAL	\N	\N	1	LOW	1	ACTIVE	2024-07-28 02:59:29.559676	2024-07-28 02:59:29.559676	\N
2	GENERAL	\N	\N	1	MEDIUM	1	ACTIVE	2024-07-28 02:59:29.559676	2024-07-28 02:59:29.559676	\N
3	GENERAL	\N	\N	2	MEDIUM	1	ACTIVE	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
4	GENERAL	\N	\N	2	MEDIUM	1	ACTIVE	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
5	GENERAL	\N	\N	2	LOW	1	ACTIVE	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
6	GENERAL	\N	\N	2	MEDIUM	1	ACTIVE	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
7	GENERAL	\N	\N	2	MEDIUM	1	ACTIVE	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
8	GENERAL	\N	\N	2	LOW	1	ACTIVE	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
9	GENERAL	\N	\N	2	MEDIUM	1	ACTIVE	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
10	GENERAL	\N	\N	2	MEDIUM	1	ACTIVE	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
11	GENERAL	\N	\N	2	MEDIUM	1	ACTIVE	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
12	GENERAL	\N	\N	2	MEDIUM	1	ACTIVE	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
13	GENERAL	\N	\N	2	LOW	1	ACTIVE	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
14	GENERAL	\N	\N	2	MEDIUM	1	ACTIVE	2024-07-28 03:00:31.562236	2024-07-28 03:00:31.562236	\N
15	GENERAL	\N	\N	3	MEDIUM	1	ACTIVE	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
16	GENERAL	\N	\N	3	MEDIUM	1	ACTIVE	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
17	GENERAL	\N	\N	3	MEDIUM	1	ACTIVE	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
18	GENERAL	\N	\N	3	MEDIUM	1	ACTIVE	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
19	GENERAL	\N	\N	3	MEDIUM	1	ACTIVE	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
20	GENERAL	\N	\N	3	MEDIUM	1	ACTIVE	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
21	GENERAL	\N	\N	3	MEDIUM	1	ACTIVE	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
22	GENERAL	\N	\N	3	MEDIUM	1	ACTIVE	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
23	GENERAL	\N	\N	3	HIGH	1	ACTIVE	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
24	GENERAL	\N	\N	3	MEDIUM	1	ACTIVE	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
25	GENERAL	\N	\N	3	MEDIUM	1	ACTIVE	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
26	GENERAL	\N	\N	3	LOW	1	ACTIVE	2024-07-28 03:01:02.85181	2024-07-28 03:01:02.85181	\N
27	GENERAL	\N	\N	4	MEDIUM	1	ACTIVE	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
28	GENERAL	\N	\N	4	MEDIUM	1	ACTIVE	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
29	GENERAL	\N	\N	4	MEDIUM	1	ACTIVE	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
30	GENERAL	\N	\N	4	MEDIUM	1	ACTIVE	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
31	GENERAL	\N	\N	4	MEDIUM	1	ACTIVE	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
32	GENERAL	\N	\N	4	MEDIUM	1	ACTIVE	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
33	GENERAL	\N	\N	4	MEDIUM	1	ACTIVE	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
34	GENERAL	\N	\N	4	MEDIUM	1	ACTIVE	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
35	GENERAL	\N	\N	4	MEDIUM	1	ACTIVE	2024-07-28 03:01:45.089799	2024-07-28 03:01:45.089799	\N
36	GENERAL	\N	\N	5	MEDIUM	1	ACTIVE	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
37	GENERAL	\N	\N	5	MEDIUM	1	ACTIVE	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
38	GENERAL	\N	\N	5	LOW	1	ACTIVE	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
39	GENERAL	\N	\N	5	MEDIUM	1	ACTIVE	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
40	GENERAL	\N	\N	5	HIGH	1	ACTIVE	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
41	GENERAL	\N	\N	5	HIGH	1	ACTIVE	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
42	GENERAL	\N	\N	5	MEDIUM	1	ACTIVE	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
43	GENERAL	\N	\N	5	MEDIUM	1	ACTIVE	2024-07-28 03:02:27.936312	2024-07-28 03:02:27.936312	\N
44	GENERAL	\N	\N	6	MEDIUM	1	ACTIVE	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
45	GENERAL	\N	\N	6	MEDIUM	1	ACTIVE	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
46	GENERAL	\N	\N	6	LOW	1	ACTIVE	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
47	GENERAL	\N	\N	6	MEDIUM	1	ACTIVE	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
48	GENERAL	\N	\N	6	MEDIUM	1	ACTIVE	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
49	GENERAL	\N	\N	6	MEDIUM	1	ACTIVE	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
50	GENERAL	\N	\N	6	MEDIUM	1	ACTIVE	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
51	GENERAL	\N	\N	6	MEDIUM	1	ACTIVE	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
52	GENERAL	\N	\N	6	MEDIUM	1	ACTIVE	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
53	GENERAL	\N	\N	6	MEDIUM	1	ACTIVE	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
54	GENERAL	\N	\N	6	MEDIUM	1	ACTIVE	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
55	GENERAL	\N	\N	6	MEDIUM	1	ACTIVE	2024-07-28 03:03:03.103321	2024-07-28 03:03:03.103321	\N
56	GENERAL	\N	\N	7	MEDIUM	1	ACTIVE	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
57	GENERAL	\N	\N	7	MEDIUM	1	ACTIVE	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
58	GENERAL	\N	\N	7	MEDIUM	1	ACTIVE	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
59	GENERAL	\N	\N	7	MEDIUM	1	ACTIVE	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
60	GENERAL	\N	\N	7	MEDIUM	1	ACTIVE	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
61	GENERAL	\N	\N	7	MEDIUM	1	ACTIVE	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
62	GENERAL	\N	\N	7	MEDIUM	1	ACTIVE	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
63	GENERAL	\N	\N	7	MEDIUM	1	ACTIVE	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
64	GENERAL	\N	\N	7	MEDIUM	1	ACTIVE	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
65	GENERAL	\N	\N	7	MEDIUM	1	ACTIVE	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
66	GENERAL	\N	\N	7	MEDIUM	1	ACTIVE	2024-07-28 03:04:22.519272	2024-07-28 03:04:22.519272	\N
67	GENERAL	\N	\N	8	LOW	1	ACTIVE	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
68	GENERAL	\N	\N	8	MEDIUM	1	ACTIVE	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
69	GENERAL	\N	\N	8	MEDIUM	1	ACTIVE	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
70	GENERAL	\N	\N	8	MEDIUM	1	ACTIVE	2024-07-28 03:04:49.98783	2024-07-28 03:04:49.98783	\N
71	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
72	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
73	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
74	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
75	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
76	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
77	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
78	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
79	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
80	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
81	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
82	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
83	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
84	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
85	GENERAL	\N	\N	9	MEDIUM	1	ACTIVE	2024-07-28 03:05:34.540165	2024-07-28 03:05:34.540165	\N
86	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
87	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
88	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
89	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
90	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
91	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
92	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
93	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
94	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
95	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
96	GENERAL	\N	\N	10	LOW	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
97	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
98	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
99	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
100	GENERAL	\N	\N	10	MEDIUM	1	ACTIVE	2024-07-28 03:06:42.477091	2024-07-28 03:06:42.477091	\N
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role ("roleId", caption, type, permissions, "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: state; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.state ("stateId", name, "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student ("studentId", name, college, course, address, state, district, city, pincode, "userId", email, contact, "createdOn", "updatedOn", "deletedOn") FROM stdin;
1	Irshad	\N	\N	\N	\N	\N	\N	\N	2	irshadparakkat@gmail.com	9496876366	2024-07-28 03:13:53.253146	2024-07-28 03:13:53.253146	\N
30	Saranya.R.S	\N	\N	\N	\N	\N	\N	\N	31	saranyars120399@gmail.com	9541152507	2024-07-28 03:48:46.349255	2024-07-28 07:24:20.510057	\N
3	Arsha Saji.A	\N	\N	\N	\N	\N	\N	\N	4	arshashaji99arshashaji@gmail.com	8590389170	2024-07-28 03:25:22.137823	2024-07-28 03:25:39.449973	\N
28	Nandana.P	\N	\N	\N	\N	\N	\N	\N	29	nandhanabarbie006@gmail.com	7592027318	2024-07-28 03:47:28.080722	2024-07-28 07:24:55.023956	\N
5	Devika.B	\N	\N	\N	\N	\N	\N	\N	6	devikasachin83@gmail.com	8138971738	2024-07-28 03:26:52.528642	2024-07-28 03:27:04.568859	\N
6	Ganga.S.M	\N	\N	\N	\N	\N	\N	\N	7	gangasm583@gmail.com	9656404062	2024-07-28 03:27:29.496609	2024-07-28 03:27:48.268402	\N
7	Aparna Sunil	\N	\N	\N	\N	\N	\N	\N	8	aparna41756@gmail.com	9645549452	2024-07-28 03:28:16.37057	2024-07-28 03:28:27.110676	\N
8	Reshma.G.R	\N	\N	\N	\N	\N	\N	\N	9	reshmagandhinaghar@gmail.com	7034238009	2024-07-28 03:28:50.333889	2024-07-28 03:29:07.295811	\N
9	Roshini.R.Nair	\N	\N	\N	\N	\N	\N	\N	10	roshinirnair123@gmail.com	7356057267	2024-07-28 03:29:29.617065	2024-07-28 03:29:54.574211	\N
10	Rohini.R.Nair	\N	\N	\N	\N	\N	\N	\N	11	rohinirnair@gmail.com	9567943383	2024-07-28 03:30:24.038845	2024-07-28 09:49:59.480421	\N
12	Akhila Mohan	\N	\N	\N	\N	\N	\N	\N	13	akhila.m.mohan@gmail.com	9744611494	2024-07-28 03:31:30.111925	2024-07-28 03:31:44.980504	\N
13	Arya.H	\N	\N	\N	\N	\N	\N	\N	14	bindhubinu051978@gmail.com	9946794185	2024-07-28 03:32:10.973909	2024-07-28 03:32:22.165244	\N
14	Anaswara.A	\N	\N	\N	\N	\N	\N	\N	15	heradoxx123@gmail.com	9656387827	2024-07-28 03:32:59.896893	2024-07-28 03:33:17.914006	\N
23	Shahudana	\N	\N	\N	\N	\N	\N	\N	24	elminnoor@gmail.com	9072929868	2024-07-28 03:44:53.729946	2024-07-28 09:57:17.962544	\N
16	Arunima.D.R	\N	\N	\N	\N	\N	\N	\N	17	Arunima.D.RArunima.D.R2006@gmail.com	7907627369	2024-07-28 03:36:25.442302	2024-07-28 03:39:22.733859	\N
17	Balamani.M	\N	\N	\N	\N	\N	\N	\N	18	bm667249@gmail.com	7592806951	2024-07-28 03:39:54.904111	2024-07-28 03:40:23.816898	\N
18	Jayasree.M.R	\N	\N	\N	\N	\N	\N	\N	19	jayasreeanish11@gmail.com	9496760035	2024-07-28 03:41:03.611564	2024-07-28 03:41:54.805536	\N
19	Nandana.M.A	\N	\N	\N	\N	\N	\N	\N	20	nandhananandhu670@gmail.com	9539281197	2024-07-28 03:41:33.043862	2024-07-28 03:42:07.154831	\N
20	Noufiya Noushad.B.N	\N	\N	\N	\N	\N	\N	\N	21	noufiyanoufiya543@gmail.com	8921297962	2024-07-28 03:42:34.524138	2024-07-28 03:42:46.03444	\N
21	Archana.M.P	\N	\N	\N	\N	\N	\N	\N	22	archuammu16@gmail.com	9061896968	2024-07-28 03:43:12.453106	2024-07-28 03:43:27.265125	\N
22	Bismi Shajad	\N	\N	\N	\N	\N	\N	\N	23	sajeenashajad@gmail.com	8129593899	2024-07-28 03:44:09.953136	2024-07-28 03:44:23.562085	\N
24	Devika.S.Nair	\N	\N	\N	\N	\N	\N	\N	25	devuzdevu5613@gmail.com	9961694076	2024-07-28 03:45:17.596878	2024-07-28 03:45:26.728119	\N
25	Gopika.L.S	\N	\N	\N	\N	\N	\N	\N	26	atensnew@gmail.com	9947861642	2024-07-28 03:45:46.659164	2024-07-28 03:45:59.896161	\N
26	Arsha.U.S	\N	\N	\N	\N	\N	\N	\N	27	usarshaus@gmail.com	8606197405	2024-07-28 03:46:22.132459	2024-07-28 03:46:31.51087	\N
27	Neha.S	\N	\N	\N	\N	\N	\N	\N	28	nehanehas780@gmail.com	9645753857	2024-07-28 03:46:52.624779	2024-07-28 03:47:00.700387	\N
29	Archa M T	\N	\N	\N	\N	\N	\N	\N	30	archanandhu2005@gmail.com	7511172577	2024-07-28 03:48:06.029429	2024-07-28 03:48:24.121445	\N
32	Athulya Krishna	\N	\N	\N	\N	\N	\N	\N	33	athulyakrishna821@gmail.com	7736885368	2024-07-28 03:50:28.047783	2024-07-28 03:50:43.8395	\N
35	Ameena.H.S	\N	\N	\N	\N	\N	\N	\N	36	amee37357@gmail.com	9074742689	2024-07-28 03:52:22.025183	2024-07-28 03:52:33.394756	\N
36	Deepthi.R.S	\N	\N	\N	\N	\N	\N	\N	37	devikapraveen1810@gmail.com	9562363836	2024-07-28 03:52:52.864145	2024-07-28 03:53:03.537073	\N
37	Gouri Krishna.S.B	\N	\N	\N	\N	\N	\N	\N	38	ammuuu26263@gmail.com	9645481659	2024-07-28 03:53:44.43578	2024-07-28 03:53:58.759556	\N
39	Reshma Mohan	\N	\N	\N	\N	\N	\N	\N	40	reshmamohan15122014@gmail.com	9745922592	2024-07-28 03:55:00.669835	2024-07-28 03:55:09.796849	\N
53	Amina H S	\N	\N	\N	\N	\N	\N	\N	54	arifashiknasa@gmail.com	8921170988	2024-07-28 11:39:49.790376	2024-07-28 11:40:15.642495	\N
41	Soorya Sunil	\N	\N	\N	\N	\N	\N	\N	42	SooryaSunil67@gmail.com	9745876406	2024-07-28 03:57:06.646942	2024-07-28 03:58:42.459079	\N
34	Amina HS(Terminated)	\N	\N	\N	\N	\N	\N	\N	35	thajunnisajamal786@gmail.com	949687900	2024-07-28 03:51:51.066897	2024-07-28 11:59:31.347427	\N
43	Suramya.S	\N	\N	\N	\N	\N	\N	\N	44	suramyaudayan@gmail.com	9496152776	2024-07-28 04:01:44.793494	2024-07-28 04:02:09.660286	\N
44	Sumayya.J.S	\N	\N	\N	\N	\N	\N	\N	45	sumayyajsainu@gmail.com	9526001962	2024-07-28 04:03:25.283462	2024-07-28 04:03:40.655438	\N
45	Sivani.M	\N	\N	\N	\N	\N	\N	\N	46	sivanim23092004@gmail.com	8714229428	2024-07-28 04:04:03.610064	2024-07-28 04:04:17.082489	\N
46	Shamla.S	\N	\N	\N	\N	\N	\N	\N	47	ShibilaShajeer@gmail.com	7034201926	2024-07-28 04:05:09.992559	2024-07-28 04:05:53.384176	\N
47	Nasiya.S	\N	\N	\N	\N	\N	\N	\N	48	nnasiya@075gmail.com	7012847912	2024-07-28 04:06:20.916359	2024-07-28 04:06:36.373667	\N
48	Reshma.U	\N	\N	\N	\N	\N	\N	\N	49	reshmabinukrish@gmail.com	7994920059	2024-07-28 04:06:59.449991	2024-07-28 04:07:09.610475	\N
49	Athira.T.Suresh	\N	\N	\N	\N	\N	\N	\N	50	athira14sivakrishna@gmail.com	9188431633	2024-07-28 04:07:36.508519	2024-07-28 04:07:45.819105	\N
51	Reshma.M	\N	\N	\N	\N	\N	\N	\N	52	reshmashebin35@gmail.com	7561001719	2024-07-28 04:08:43.8989	2024-07-28 04:08:55.040535	\N
52	Bismi Mol.S	\N	\N	\N	\N	\N	\N	\N	53	bismimol2006@gmail.com	9744683540	2024-07-28 04:09:19.301847	2024-07-28 04:09:28.611145	\N
4	Archana.A.S	\N	\N	\N	\N	\N	\N	\N	5	archanavishnudas@gmail.com	9744604427	2024-07-28 03:26:07.658018	2024-07-28 07:02:08.65687	\N
2	Anakha.A.G	\N	\N	\N	\N	\N	\N	\N	3	anakhaharisankar@gmail.com	7593959731	2024-07-28 03:23:59.571413	2024-07-28 07:08:27.082388	\N
11	Silpa.S	\N	\N	\N	\N	\N	\N	\N	12	silpasilpas80@gmail.com	7306526587	2024-07-28 03:30:54.243798	2024-07-28 07:15:14.578198	\N
15	Aswani Krishna.A.S	\N	\N	\N	\N	\N	\N	\N	16	aswaniashok218@gmail.com	7909142549	2024-07-28 03:33:41.234627	2024-07-28 07:16:57.493086	\N
42	Soumya.P	\N	\N	\N	\N	\N	\N	\N	43	saumyakrishna001@gmail.com	9961204579	2024-07-28 04:00:19.022908	2024-07-28 07:20:00.741398	\N
40	Silpa.B.T	\N	\N	\N	\N	\N	\N	\N	41	anusilpa7@gmail.com	9061720935	2024-07-28 03:55:39.46295	2024-07-28 07:21:43.234924	\N
38	Revathi U	\N	\N	\N	\N	\N	\N	\N	39	prevathy061@gmail.com	9497213220	2024-07-28 03:54:29.085	2024-07-28 07:22:19.411891	\N
33	Aneesha.S.A	\N	\N	\N	\N	\N	\N	\N	34	aneeshasa2@gmail.com	9544891871	2024-07-28 03:51:05.696971	2024-07-28 07:22:54.987699	\N
31	Anseena.A	\N	\N	\N	\N	\N	\N	\N	32	anseenaariyas2022@gmail.com	6282138615	2024-07-28 03:49:42.841065	2024-07-28 07:23:38.187109	\N
50	Amina.S	\N	\N	\N	\N	\N	\N	\N	51	aamiamina664@gmail.com	8089685760	2024-07-28 04:08:09.361503	2024-07-28 12:05:32.362244	\N
\.


--
-- Data for Name: sub-admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."sub-admin" ("subAdminId", name, department, address, state, district, city, pincode, "userId", email, contact, "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subject ("subjectId", caption, "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tag ("tagId", caption, "tagGRoupId", "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: tagGroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."tagGroup" ("tagGroupId", caption, is_delete, "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher ("teacherId", "businessId", name, email, "schoolName", contact, address, state, district, city, pincode, experience, "profileImage", "userId", "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: teacher-subject-grade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."teacher-subject-grade" ("gradeSubjectId", "gradeId", "subjectId", "teacherId", "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: teacher-tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."teacher-tag" ("teacherTagId", "teacherId", "tagGroup", "createdOn", "updatedOn", "deletedOn") FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" ("userId", username, password, "userType", "roleId", permissions, is_delete, "createdOn", "updatedOn", "deletedOn") FROM stdin;
1	admin@gmail.com	$2b$10$7YOMqNa25jkCPYMH4MbVW.jjgMRL.7SxhambRxbo/O9SipduTlitC	SUPER-ADMIN	\N	READ,WRITE	f	2024-07-28 02:54:01.284923	2024-07-28 02:54:01.284923	\N
4	arshashaji99arshashaji@gmail.com	$2b$10$1mEkC0f2PXlhWsPKuUG4ZujKyE58xOShud2/vxQZfOHCElHAMU1xW	STUDENT	\N	All	f	2024-07-28 03:25:22.137823	2024-07-28 03:25:22.137823	\N
5	archanavishnudas@gmail.com	$2b$10$PC0HY5iLYMuL0D6D0A8I8.5acIGk6yGZ6Jg7erCy.8VeS4IPZpp56	STUDENT	\N	All	f	2024-07-28 03:26:07.658018	2024-07-28 03:26:07.658018	\N
6	devikasachin83@gmail.com	$2b$10$rg4EpOQ.wLtj7WFyYqhLP.5UoaqDFS0kRS9KzXKX8NaAcHtoueU9S	STUDENT	\N	All	f	2024-07-28 03:26:52.528642	2024-07-28 03:26:52.528642	\N
7	gangasm583@gmail.com	$2b$10$NJXZ0rhp2I2ji3aO/SK8NeZ1NvhzUjVfp7.7htyBlszIc4nmhGJre	STUDENT	\N	All	f	2024-07-28 03:27:29.496609	2024-07-28 03:27:29.496609	\N
8	aparna41756@gmail.com	$2b$10$Rwk0FYM0.a6nfk6D0UbRzuWJPp5oE5afHUrkQ2aYzHVYrn0ADIlu.	STUDENT	\N	All	f	2024-07-28 03:28:16.37057	2024-07-28 03:28:16.37057	\N
9	reshmagandhinaghar@gmail.com	$2b$10$.H2XBx93LpBjK61H2MMejONh4Q.DJcFIPD.IzuzP85dyS/la/k6dy	STUDENT	\N	All	f	2024-07-28 03:28:50.333889	2024-07-28 03:28:50.333889	\N
10	roshinirnair123@gmail.com	$2b$10$3CbZQiUssCNMsq4ngAZGJOikM3YXBgLtTeC/MA6q.A4c6K2Y9VJg6	STUDENT	\N	All	f	2024-07-28 03:29:29.617065	2024-07-28 03:29:29.617065	\N
11	rohinirnair@gmail.com	$2b$10$bvljm38FnL.3dtZISPT7v.yvrDEXcJ1SCJJYoGY0Zp4/B/4zhcw1a	STUDENT	\N	All	f	2024-07-28 03:30:24.038845	2024-07-28 03:30:24.038845	\N
13	akhila.m.mohan@gmail.com	$2b$10$Y010ESm0iTWQBvBREEn8oOa3qGFufMBkp1In4ywgRL0tiTKDpGl9a	STUDENT	\N	All	f	2024-07-28 03:31:30.111925	2024-07-28 03:31:30.111925	\N
14	bindhubinu051978@gmail.com	$2b$10$InaLQRKi1YzXnT0R9Q./v.5p2AgAU2sLgSWZeGGVP.9B1B16BM2v.	STUDENT	\N	All	f	2024-07-28 03:32:10.973909	2024-07-28 03:32:10.973909	\N
15	heradoxx123@gmail.com	$2b$10$fsU4uUgDJ8oAvJOGeQNZsOcLSD5qY0F5mA6tjf0hTzVKm96PcSdJe	STUDENT	\N	All	f	2024-07-28 03:32:59.896893	2024-07-28 03:32:59.896893	\N
17	Arunima.D.RArunima.D.R2006@gmail.com	$2b$10$2tCc0n06tJOoV9xU.R0Htua5liQHts9cyTbOQf13gyPQM93KGjlBC	STUDENT	\N	All	f	2024-07-28 03:36:25.442302	2024-07-28 03:36:25.442302	\N
18	bm667249@gmail.com	$2b$10$YkP3bkSkTfniP0auRbCz/uMJhLXjF2wm7sUvLHpDukvxP1kFgBEZC	STUDENT	\N	All	f	2024-07-28 03:39:54.904111	2024-07-28 03:39:54.904111	\N
19	jayasreeanish11@gmail.com	$2b$10$cIeiAKVxUpj9.ceF4Du7SO4OqqRe0H.uH7aItI5YHhFnjoIZ8L2iO	STUDENT	\N	All	f	2024-07-28 03:41:03.611564	2024-07-28 03:41:03.611564	\N
20	nandhananandhu670@gmail.com	$2b$10$Xm7ZJBBNtZUOhgtHdorPouZwZ4oPL4TCRdj7EILQFFXZ6nWa55PXW	STUDENT	\N	All	f	2024-07-28 03:41:33.043862	2024-07-28 03:41:33.043862	\N
21	noufiyanoufiya543@gmail.com	$2b$10$KdG.PYS.mNnfYrWBsXnkkOa5qMnWNOf2CQg4zgA/awdxQA2U0RHxC	STUDENT	\N	All	f	2024-07-28 03:42:34.524138	2024-07-28 03:42:34.524138	\N
22	archuammu16@gmail.com	$2b$10$MSbAnWv6S1Zga/DhzZGFDetVqko/TrSv429iAQZbPFyjGGGqK74qq	STUDENT	\N	All	f	2024-07-28 03:43:12.453106	2024-07-28 03:43:12.453106	\N
23	sajeenashajad@gmail.com	$2b$10$UiRakLxBBk4HAogfO13Ax.CbBchD0lcHkh3X3CJonDJBWe4HrM9oi	STUDENT	\N	All	f	2024-07-28 03:44:09.953136	2024-07-28 03:44:09.953136	\N
25	devuzdevu5613@gmail.com	$2b$10$zHKpgiF2vB8VjW6ulti/jOdxcdhl8eCW0bwSgAHpt6gXprOGeuxD6	STUDENT	\N	All	f	2024-07-28 03:45:17.596878	2024-07-28 03:45:17.596878	\N
26	atensnew@gmail.com	$2b$10$LyDvTqGwTdWWKDYDYNTPWe2DIXOz9zkctFLdU91smipMUoKJXOp1O	STUDENT	\N	All	f	2024-07-28 03:45:46.659164	2024-07-28 03:45:46.659164	\N
27	usarshaus@gmail.com	$2b$10$oQcvlINOlYgS01Z6daeJjOmJlo/EGslKg22/1MrGgX6sng0a7Cv9.	STUDENT	\N	All	f	2024-07-28 03:46:22.132459	2024-07-28 03:46:22.132459	\N
28	nehanehas780@gmail.com	$2b$10$o6eEmKj1D0lNiYaqxdItm.K5xxF.fXjtCF4llPCwGPWAscIQh1Fuu	STUDENT	\N	All	f	2024-07-28 03:46:52.624779	2024-07-28 03:46:52.624779	\N
30	archanandhu2005@gmail.com	$2b$10$z5Jtedy2JGvQfQZeB.JLH.Gf8QNp.T/9XTtB5PXoDaf5sYMIRT0Ha	STUDENT	\N	All	f	2024-07-28 03:48:06.029429	2024-07-28 03:48:06.029429	\N
33	athulyakrishna821@gmail.com	$2b$10$hgOOQUIiVKUmQpzduj0eHeqPWQD34HgLsZdavS73r1neAucyP7r0e	STUDENT	\N	All	f	2024-07-28 03:50:28.047783	2024-07-28 03:50:28.047783	\N
34	aneeshasa2@gmail.com	$2b$10$DN.5lfcR9p/wP.K0dW4p9.R9TGDib5hiaZdHvkcw.DNPkeZbLwJtu	STUDENT	\N	All	f	2024-07-28 03:51:05.696971	2024-07-28 03:51:05.696971	\N
36	amee37357@gmail.com	$2b$10$Eb1HDfoWO7WPrpY9Yl4oyeuCZc2x1wXz22bN6ERKpgBSmpgKz4.Ji	STUDENT	\N	All	f	2024-07-28 03:52:22.025183	2024-07-28 03:52:22.025183	\N
37	devikapraveen1810@gmail.com	$2b$10$tQnuNOsYVgtY34nMrzc.luQb2GzAAYFzo89jnRB5H.q1./PmgP59u	STUDENT	\N	All	f	2024-07-28 03:52:52.864145	2024-07-28 03:52:52.864145	\N
38	ammuuu26263@gmail.com	$2b$10$5F438HRUdwaf2w3ZQlbTO.DpeK.9mWyOt38hXxpO1DLt9w6Mdauha	STUDENT	\N	All	f	2024-07-28 03:53:44.43578	2024-07-28 03:53:44.43578	\N
42	SooryaSunil67@gmail.com	$2b$10$XMUJo5L9GfHEQ3LeBqDokOIImzEXqMXyocQ4gpYqm7vSv5fNGg01G	STUDENT	\N	All	f	2024-07-28 03:57:06.646942	2024-07-28 03:57:06.646942	\N
44	suramyaudayan@gmail.com	$2b$10$99hFnjP4zZEGjev3uRghwODdIWUM/yu4399x2YTZpLMs3LbP0/Dry	STUDENT	\N	All	f	2024-07-28 04:01:44.793494	2024-07-28 04:01:44.793494	\N
40	reshmamohan15122014@gmail.com	$2b$10$lUOssZF8dkATOcZAHnSpH.qs238fwO0ketuakyykasp37ylk9oTQW	STUDENT	\N	All	f	2024-07-28 03:55:00.669835	2024-07-28 04:03:03.82987	\N
45	sumayyajsainu@gmail.com	$2b$10$wIEYNgsLiyrR0R06pp5AHOydGgty14os8QubPaEQYPuo93/BZlqVW	STUDENT	\N	All	f	2024-07-28 04:03:25.283462	2024-07-28 04:03:25.283462	\N
46	sivanim23092004@gmail.com	$2b$10$uyakpBtr/4YDcbFpGFHCveZBLGAwsqgeu3fXIxneTt4Qil/toQ24.	STUDENT	\N	All	f	2024-07-28 04:04:03.610064	2024-07-28 04:04:03.610064	\N
47	ShibilaShajeer@gmail.com	$2b$10$ka4z5NEvqYj3QinoGcQR/ed09RB1nD//36N4HuVcdsmFm/.A.qX0K	STUDENT	\N	All	f	2024-07-28 04:05:09.992559	2024-07-28 04:05:09.992559	\N
48	nnasiya@075gmail.com	$2b$10$WDDsMOjXCqIbgZ2e0VU0Eubm3JPEYt1dF/ZrX3DW1VEJNWMoz8ssm	STUDENT	\N	All	f	2024-07-28 04:06:20.916359	2024-07-28 04:06:20.916359	\N
49	reshmabinukrish@gmail.com	$2b$10$umZiKyXdDjPvqGUd9yW3QeNjhXjYAURVil3K8TiubNtDU3ahjf0L6	STUDENT	\N	All	f	2024-07-28 04:06:59.449991	2024-07-28 04:06:59.449991	\N
50	athira14sivakrishna@gmail.com	$2b$10$fRi8nUgcyDu1/3Ws/OxB2.ggI6b6hViAKyI3SsNvIQ7PNq25ZVAfO	STUDENT	\N	All	f	2024-07-28 04:07:36.508519	2024-07-28 04:07:36.508519	\N
29	nandhanabarbie006@gmail.com	$2b$10$kaqw9.ypeZMwR6ks/yhqWOGRXJ6w9tmjVMri/7wQFH.BKpgaXdkQ6	STUDENT	\N	All	f	2024-07-28 03:47:28.080722	2024-07-28 05:26:23.897988	\N
31	saranyars120399@gmail.com	$2b$10$C7KBVHroVcUC9ISoLuQhneft.rZJQ6OPThdd7ddmE71gkUzFE/EP2	STUDENT	\N	All	f	2024-07-28 03:48:46.349255	2024-07-28 07:24:20.503785	\N
41	anusilpa7@gmail.com	$2b$10$e6VzYZVtVrA1HW/sto3AuOgAdKcuJ3QzoN/GpZN5IZcRfoiBNTVim	STUDENT	\N	All	f	2024-07-28 03:55:39.46295	2024-07-28 07:21:43.23223	\N
32	anseenaariyas2022@gmail.com	$2b$10$.fMJj6k7ac2L7qThcq110eKN4eaXou0aJejGWEWqAC3qIG/jyOFn2	STUDENT	\N	All	f	2024-07-28 03:49:42.841065	2024-07-28 07:23:38.156616	\N
3	anakhaharisankar@gmail.com	$2b$10$x0QVQOCqijUckbv8RaoVwOI9G6Fhnn5sVbGVfRaMPwrUrNfRN5zTC	STUDENT	\N	All	f	2024-07-28 03:23:59.571413	2024-07-28 07:08:27.079564	\N
12	silpasilpas80@gmail.com	$2b$10$HCemIu935MhwbV7UhPCcsu7A80k16/2yfiBwNMrKg5ELkC5.BQhJK	STUDENT	\N	All	f	2024-07-28 03:30:54.243798	2024-07-28 07:15:14.574533	\N
16	aswaniashok218@gmail.com	$2b$10$9Uk0bZZnI9lMnl4O1fLoUuEueSVe1TjB70In4Ktw9ean5zEJdW/VO	STUDENT	\N	All	f	2024-07-28 03:33:41.234627	2024-07-28 07:16:57.48775	\N
43	saumyakrishna001@gmail.com	$2b$10$v5UxqTNglSGqt1f.9yAX6OWeQ9XTlU8T2nizMihuFYlNfc7WnThYm	STUDENT	\N	All	f	2024-07-28 04:00:19.022908	2024-07-28 07:20:00.734133	\N
39	prevathy061@gmail.com	$2b$10$7tbchJDs9Cvdh.BHwveYteskIrNuW02zvNLhS675AipyGhng5j4qS	STUDENT	\N	All	f	2024-07-28 03:54:29.085	2024-07-28 07:22:19.405644	\N
24	elminnoor@gmail.com	$2b$10$c/7kHCTsXVf18obX5y3N6OS.2wiCIt3DrS55sQEPZszfL8UZAigxm	STUDENT	\N	All	f	2024-07-28 03:44:53.729946	2024-07-28 09:57:17.958564	\N
51	aamiamina664@gmail.com	$2b$10$NPPBTkRasitXIH7Fy3j68.YILvltWqw8xfXxXTUfILXtHOtu6GW8W	STUDENT	\N	All	f	2024-07-28 04:08:09.361503	2024-07-28 12:07:02.411308	\N
35	thajunnisajamal786@gmail.com	$2b$10$xCbZU4TgwAaGKBrJv.oy3OjdJn5O29I6Cy1gswPNT8WjbthB3RQJC	STUDENT	\N	All	f	2024-07-28 03:51:51.066897	2024-07-28 12:10:14.401187	\N
52	reshmashebin35@gmail.com	$2b$10$lMHDsYHJ1JcXEQMqKvklneXeQu4ZCBTWIYn53YDzpnCiGJlCURuAC	STUDENT	\N	All	f	2024-07-28 04:08:43.8989	2024-07-28 04:08:43.8989	\N
53	bismimol2006@gmail.com	$2b$10$TajoHvA1twUZNcYS1JCDcOFrNHOC472FjALASPvijZXp87hsnkHzi	STUDENT	\N	All	f	2024-07-28 04:09:19.301847	2024-07-28 04:09:19.301847	\N
2	irshadparakkat@gmail.com	$2b$10$gyC4UHsp89Ls1ehKZqxdXuTFBT78vKXMgBjcvQCsTylJQDaW9o6AO	STUDENT	\N	All	f	2024-07-28 03:13:53.253146	2024-07-28 04:47:08.744239	\N
54	arifashiknasa@gmail.com	$2b$10$zHrcKth/YWlQk.5CU.vYbe/o6terKKdUux/LBQHMRqdndcqhA4HLa	STUDENT	\N	All	f	2024-07-28 11:39:49.790376	2024-07-28 11:39:49.790376	\N
\.


--
-- Name: activity-log_logId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."activity-log_logId_seq"', 169, true);


--
-- Name: assessmentAnswerGeneral_assessmentAnswerId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."assessmentAnswerGeneral_assessmentAnswerId_seq"', 5082, true);


--
-- Name: assessmentAnswer_assessmentAnswerId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."assessmentAnswer_assessmentAnswerId_seq"', 1, false);


--
-- Name: assessmentGeneralCategory_assesmentGeneralCategoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."assessmentGeneralCategory_assesmentGeneralCategoryId_seq"', 10, true);


--
-- Name: assessmentGradeSubject_assessmentGradeSubjectId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."assessmentGradeSubject_assessmentGradeSubjectId_seq"', 1, false);


--
-- Name: assessment_assessmentId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."assessment_assessmentId_seq"', 1, true);


--
-- Name: attendAssessment-general_attendAssessmentId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."attendAssessment-general_attendAssessmentId_seq"', 47, true);


--
-- Name: attendAssessment_attendAssessmentId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."attendAssessment_attendAssessmentId_seq"', 1, false);


--
-- Name: business-admin_subBusinessId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."business-admin_subBusinessId_seq"', 1, false);


--
-- Name: business-type_businessTypeId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."business-type_businessTypeId_seq"', 1, false);


--
-- Name: business_businessId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."business_businessId_seq"', 1, false);


--
-- Name: city_cityId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."city_cityId_seq"', 1, false);


--
-- Name: district_districtId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."district_districtId_seq"', 1, false);


--
-- Name: generalCategory_generalCategoryId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."generalCategory_generalCategoryId_seq"', 10, true);


--
-- Name: grade_gradeId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."grade_gradeId_seq"', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, false);


--
-- Name: option_optionId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."option_optionId_seq"', 400, true);


--
-- Name: question-group_questionGroupId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."question-group_questionGroupId_seq"', 100, true);


--
-- Name: question_questionId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."question_questionId_seq"', 100, true);


--
-- Name: role_roleId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."role_roleId_seq"', 1, false);


--
-- Name: state_stateId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."state_stateId_seq"', 1, false);


--
-- Name: student_studentId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."student_studentId_seq"', 53, true);


--
-- Name: sub-admin_subAdminId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."sub-admin_subAdminId_seq"', 1, false);


--
-- Name: subject_subjectId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."subject_subjectId_seq"', 1, false);


--
-- Name: tagGroup_tagGroupId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tagGroup_tagGroupId_seq"', 1, false);


--
-- Name: tag_tagId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tag_tagId_seq"', 1, false);


--
-- Name: teacher-subject-grade_gradeSubjectId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."teacher-subject-grade_gradeSubjectId_seq"', 1, false);


--
-- Name: teacher-tag_teacherTagId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."teacher-tag_teacherTagId_seq"', 1, false);


--
-- Name: teacher_teacherId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."teacher_teacherId_seq"', 1, false);


--
-- Name: user_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."user_userId_seq"', 54, true);


--
-- Name: grade PK_0c90a500a7628ad7a658227b5ab; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT "PK_0c90a500a7628ad7a658227b5ab" PRIMARY KEY ("gradeId");


--
-- Name: activity-log PK_21ecb8a835bc3bed3e3c93aad53; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."activity-log"
    ADD CONSTRAINT "PK_21ecb8a835bc3bed3e3c93aad53" PRIMARY KEY ("logId");


--
-- Name: assessmentGeneralCategory PK_2af753e135f0d36eaecbd8f8299; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentGeneralCategory"
    ADD CONSTRAINT "PK_2af753e135f0d36eaecbd8f8299" PRIMARY KEY ("assesmentGeneralCategoryId");


--
-- Name: subject PK_3f443813fabb7e4cb8695777dc2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT "PK_3f443813fabb7e4cb8695777dc2" PRIMARY KEY ("subjectId");


--
-- Name: assessmentAnswerGeneral PK_40e78ea856b9be41e2b7c577488; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentAnswerGeneral"
    ADD CONSTRAINT "PK_40e78ea856b9be41e2b7c577488" PRIMARY KEY ("assessmentAnswerId");


--
-- Name: generalCategory PK_42a3f959d59e2bdfd5b596df500; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."generalCategory"
    ADD CONSTRAINT "PK_42a3f959d59e2bdfd5b596df500" PRIMARY KEY ("generalCategoryId");


--
-- Name: tag PK_42bce6149e744e5cb7b11893348; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT "PK_42bce6149e744e5cb7b11893348" PRIMARY KEY ("tagId");


--
-- Name: question-group PK_442ebcfb7db03518c44f42a8d73; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."question-group"
    ADD CONSTRAINT "PK_442ebcfb7db03518c44f42a8d73" PRIMARY KEY ("questionGroupId");


--
-- Name: assessmentGradeSubject PK_49b1a8ea9dcdf632b4c3a2f5a68; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentGradeSubject"
    ADD CONSTRAINT "PK_49b1a8ea9dcdf632b4c3a2f5a68" PRIMARY KEY ("assessmentGradeSubjectId");


--
-- Name: attendAssessment PK_4c581a746a23840fe6f02979d77; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."attendAssessment"
    ADD CONSTRAINT "PK_4c581a746a23840fe6f02979d77" PRIMARY KEY ("attendAssessmentId");


--
-- Name: business PK_4f3314ee62e24cd6daff2e0655a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT "PK_4f3314ee62e24cd6daff2e0655a" PRIMARY KEY ("businessId");


--
-- Name: teacher PK_5e88d094d0152870a9eb4804aa9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT "PK_5e88d094d0152870a9eb4804aa9" PRIMARY KEY ("teacherId");


--
-- Name: role PK_703705ba862c2bb45250962c9e1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "PK_703705ba862c2bb45250962c9e1" PRIMARY KEY ("roleId");


--
-- Name: option PK_8c13edc70074ba589656874050f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option
    ADD CONSTRAINT "PK_8c13edc70074ba589656874050f" PRIMARY KEY ("optionId");


--
-- Name: business-admin PK_8c1c9b981f3ee6d0598ff1f3bc6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."business-admin"
    ADD CONSTRAINT "PK_8c1c9b981f3ee6d0598ff1f3bc6" PRIMARY KEY ("subBusinessId");


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: student PK_9316abc534487368cfd8527e8df; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT "PK_9316abc534487368cfd8527e8df" PRIMARY KEY ("studentId");


--
-- Name: tagGroup PK_9f58e147cedad924522ede991e0; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."tagGroup"
    ADD CONSTRAINT "PK_9f58e147cedad924522ede991e0" PRIMARY KEY ("tagGroupId");


--
-- Name: city PK_ab4faadf32d1887168156ec8ea9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT "PK_ab4faadf32d1887168156ec8ea9" PRIMARY KEY ("cityId");


--
-- Name: sub-admin PK_bd9c3077f67b715ccb945e57d70; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."sub-admin"
    ADD CONSTRAINT "PK_bd9c3077f67b715ccb945e57d70" PRIMARY KEY ("subAdminId");


--
-- Name: user PK_d72ea127f30e21753c9e229891e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_d72ea127f30e21753c9e229891e" PRIMARY KEY ("userId");


--
-- Name: assessmentAnswer PK_dc47cf64f97af4b9b645776bc12; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentAnswer"
    ADD CONSTRAINT "PK_dc47cf64f97af4b9b645776bc12" PRIMARY KEY ("assessmentAnswerId");


--
-- Name: district PK_dca19338de91cc1f51929ec9710; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district
    ADD CONSTRAINT "PK_dca19338de91cc1f51929ec9710" PRIMARY KEY ("districtId");


--
-- Name: state PK_deae9b96184b8da5706dd404ddf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.state
    ADD CONSTRAINT "PK_deae9b96184b8da5706dd404ddf" PRIMARY KEY ("stateId");


--
-- Name: assessment PK_ee59334f5aeb74f6ae75aaf5120; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assessment
    ADD CONSTRAINT "PK_ee59334f5aeb74f6ae75aaf5120" PRIMARY KEY ("assessmentId");


--
-- Name: question PK_f5c864430d1f3626bc6671d6b8d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT "PK_f5c864430d1f3626bc6671d6b8d" PRIMARY KEY ("questionId");


--
-- Name: teacher-tag PK_f5db9dd1bd7170a60e939638039; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teacher-tag"
    ADD CONSTRAINT "PK_f5db9dd1bd7170a60e939638039" PRIMARY KEY ("teacherTagId");


--
-- Name: attendAssessment-general PK_f95d8119ba3825dd962a6612859; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."attendAssessment-general"
    ADD CONSTRAINT "PK_f95d8119ba3825dd962a6612859" PRIMARY KEY ("attendAssessmentId");


--
-- Name: teacher-subject-grade PK_f962702d225a925a02ff988fcaf; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teacher-subject-grade"
    ADD CONSTRAINT "PK_f962702d225a925a02ff988fcaf" PRIMARY KEY ("gradeSubjectId");


--
-- Name: business-type PK_fd35f1e0500cf1e987cb812459c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."business-type"
    ADD CONSTRAINT "PK_fd35f1e0500cf1e987cb812459c" PRIMARY KEY ("businessTypeId");


--
-- Name: IDX_01d07805a42d3729041e707f5d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_01d07805a42d3729041e707f5d" ON public."generalCategory" USING btree (caption) WHERE ("deletedOn" IS NULL);


--
-- Name: IDX_42e9ba1ab4afc57aa81282b633; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_42e9ba1ab4afc57aa81282b633" ON public.business USING btree (email) WHERE ("deletedOn" IS NULL);


--
-- Name: IDX_4a960605902daa5b452f358c0d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_4a960605902daa5b452f358c0d" ON public.teacher USING btree (email) WHERE ("deletedOn" IS NULL);


--
-- Name: IDX_534148a22622f996806c166a83; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_534148a22622f996806c166a83" ON public.business USING btree (contact) WHERE ("deletedOn" IS NULL);


--
-- Name: IDX_5a0b7ae83b5c784616f6caa988; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_5a0b7ae83b5c784616f6caa988" ON public."sub-admin" USING btree (email) WHERE ("deletedOn" IS NULL);


--
-- Name: IDX_86bf50fb6b71c06ab023c09f53; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_86bf50fb6b71c06ab023c09f53" ON public.subject USING btree (caption) WHERE ("deletedOn" IS NULL);


--
-- Name: IDX_88375f030023da773d54cb3a23; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_88375f030023da773d54cb3a23" ON public.teacher USING btree (contact) WHERE ("deletedOn" IS NULL);


--
-- Name: IDX_886f9c235ccd2424c606d201c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_886f9c235ccd2424c606d201c9" ON public.grade USING btree (caption) WHERE ("deletedOn" IS NULL);


--
-- Name: IDX_a8bfc1716c2e2a3af7baddbf0d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_a8bfc1716c2e2a3af7baddbf0d" ON public.student USING btree (email, contact) WHERE ("deletedOn" IS NULL);


--
-- Name: IDX_ae215fa3d9282a2544304193fb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_ae215fa3d9282a2544304193fb" ON public."business-admin" USING btree (email, contact) WHERE ("deletedOn" IS NULL);


--
-- Name: IDX_dbc5dbcb87618a2ee7f96aca9b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_dbc5dbcb87618a2ee7f96aca9b" ON public."sub-admin" USING btree (contact) WHERE ("deletedOn" IS NULL);


--
-- Name: IDX_e136f8e0f769c85e7778c8c412; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_e136f8e0f769c85e7778c8c412" ON public."user" USING btree (username) WHERE ("deletedOn" IS NULL);


--
-- Name: IDX_e5ff5979fad46ff6e04870fd49; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IDX_e5ff5979fad46ff6e04870fd49" ON public.role USING btree (caption) WHERE ("deletedOn" IS NULL);


--
-- Name: assessmentAnswer FK_08cf88a9aafff3e6661e973d953; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentAnswer"
    ADD CONSTRAINT "FK_08cf88a9aafff3e6661e973d953" FOREIGN KEY (answer) REFERENCES public.option("optionId");


--
-- Name: activity-log FK_22c52e1d980b2cbd5689c3547b1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."activity-log"
    ADD CONSTRAINT "FK_22c52e1d980b2cbd5689c3547b1" FOREIGN KEY ("userId") REFERENCES public."user"("userId");


--
-- Name: assessmentAnswer FK_2b8389237237d6c17a1891c4232; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentAnswer"
    ADD CONSTRAINT "FK_2b8389237237d6c17a1891c4232" FOREIGN KEY ("attendAssessmentId") REFERENCES public."attendAssessment"("attendAssessmentId");


--
-- Name: question-group FK_33b57cecd3058284a9086fff0ed; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."question-group"
    ADD CONSTRAINT "FK_33b57cecd3058284a9086fff0ed" FOREIGN KEY ("subjectId") REFERENCES public.subject("subjectId");


--
-- Name: district FK_34ebf8405ef8c8288a0c1de4f5d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district
    ADD CONSTRAINT "FK_34ebf8405ef8c8288a0c1de4f5d" FOREIGN KEY ("stateId") REFERENCES public.state("stateId");


--
-- Name: teacher-subject-grade FK_350136a5ec71a41adc2c433d87e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teacher-subject-grade"
    ADD CONSTRAINT "FK_350136a5ec71a41adc2c433d87e" FOREIGN KEY ("subjectId") REFERENCES public.subject("subjectId");


--
-- Name: question FK_4278b133eea1c851a65085db9c7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question
    ADD CONSTRAINT "FK_4278b133eea1c851a65085db9c7" FOREIGN KEY ("questionGroupId") REFERENCES public."question-group"("questionGroupId");


--
-- Name: attendAssessment FK_43be4e7a7a2bc0fb032cf158ae1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."attendAssessment"
    ADD CONSTRAINT "FK_43be4e7a7a2bc0fb032cf158ae1" FOREIGN KEY ("teacherId") REFERENCES public.teacher("teacherId");


--
-- Name: attendAssessment FK_4f24202b0fc28829dad1d86dbef; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."attendAssessment"
    ADD CONSTRAINT "FK_4f24202b0fc28829dad1d86dbef" FOREIGN KEY ("assessmentId") REFERENCES public.assessment("assessmentId");


--
-- Name: city FK_5a7315adc2509a8e834edaceb3e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT "FK_5a7315adc2509a8e834edaceb3e" FOREIGN KEY ("districtId") REFERENCES public.district("districtId");


--
-- Name: assessmentAnswerGeneral FK_5c1323008f35cc9201e8952cb64; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentAnswerGeneral"
    ADD CONSTRAINT "FK_5c1323008f35cc9201e8952cb64" FOREIGN KEY ("questionId") REFERENCES public.question("questionId");


--
-- Name: assessmentGeneralCategory FK_5d8aa5eb0906006ea76ee69110f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentGeneralCategory"
    ADD CONSTRAINT "FK_5d8aa5eb0906006ea76ee69110f" FOREIGN KEY ("generalCategoryId") REFERENCES public."generalCategory"("generalCategoryId");


--
-- Name: tag FK_6c8cfeff94a64a8ee6e19ef1468; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tag
    ADD CONSTRAINT "FK_6c8cfeff94a64a8ee6e19ef1468" FOREIGN KEY ("tagGRoupId") REFERENCES public."tagGroup"("tagGroupId");


--
-- Name: assessmentGradeSubject FK_6d9e9b4e045ff5876e25a5e5257; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentGradeSubject"
    ADD CONSTRAINT "FK_6d9e9b4e045ff5876e25a5e5257" FOREIGN KEY ("gradeId") REFERENCES public.grade("gradeId");


--
-- Name: assessmentGeneralCategory FK_7face733fee45d96ba2b5f5f934; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentGeneralCategory"
    ADD CONSTRAINT "FK_7face733fee45d96ba2b5f5f934" FOREIGN KEY ("assessmentId") REFERENCES public.assessment("assessmentId");


--
-- Name: question-group FK_84315bd9f85efc3ed55e0f66e14; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."question-group"
    ADD CONSTRAINT "FK_84315bd9f85efc3ed55e0f66e14" FOREIGN KEY ("generalCategoryId") REFERENCES public."generalCategory"("generalCategoryId");


--
-- Name: assessmentAnswerGeneral FK_89a60db928707922f96c68c46e3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentAnswerGeneral"
    ADD CONSTRAINT "FK_89a60db928707922f96c68c46e3" FOREIGN KEY (answer) REFERENCES public.option("optionId");


--
-- Name: teacher-subject-grade FK_8cba7f8b01f062084993a363cc4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teacher-subject-grade"
    ADD CONSTRAINT "FK_8cba7f8b01f062084993a363cc4" FOREIGN KEY ("gradeId") REFERENCES public.grade("gradeId");


--
-- Name: assessmentGradeSubject FK_8f434b6bdc6f2c998c719927151; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentGradeSubject"
    ADD CONSTRAINT "FK_8f434b6bdc6f2c998c719927151" FOREIGN KEY ("subjectId") REFERENCES public.subject("subjectId");


--
-- Name: teacher FK_9bdbb8fe8ec286a38c589c998ab; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT "FK_9bdbb8fe8ec286a38c589c998ab" FOREIGN KEY ("businessId") REFERENCES public.business("businessId");


--
-- Name: assessmentAnswer FK_a4e3411dbd06e73a580c7370238; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentAnswer"
    ADD CONSTRAINT "FK_a4e3411dbd06e73a580c7370238" FOREIGN KEY ("questionId") REFERENCES public.question("questionId");


--
-- Name: teacher-tag FK_a5061fd061844fda1b7a626860b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teacher-tag"
    ADD CONSTRAINT "FK_a5061fd061844fda1b7a626860b" FOREIGN KEY ("teacherId") REFERENCES public.teacher("teacherId");


--
-- Name: attendAssessment-general FK_a8e7a049711e5cd09eea4fa04d7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."attendAssessment-general"
    ADD CONSTRAINT "FK_a8e7a049711e5cd09eea4fa04d7" FOREIGN KEY ("assessmentId") REFERENCES public.assessment("assessmentId");


--
-- Name: option FK_b94517ccffa9c97ebb8eddfcae3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.option
    ADD CONSTRAINT "FK_b94517ccffa9c97ebb8eddfcae3" FOREIGN KEY ("questionId") REFERENCES public.question("questionId");


--
-- Name: assessmentGradeSubject FK_b962b1dd247bbe688adc53a63ba; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentGradeSubject"
    ADD CONSTRAINT "FK_b962b1dd247bbe688adc53a63ba" FOREIGN KEY ("assessmentId") REFERENCES public.assessment("assessmentId");


--
-- Name: assessmentAnswerGeneral FK_b9ba0a9d2eac6027ab0eb9e4207; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."assessmentAnswerGeneral"
    ADD CONSTRAINT "FK_b9ba0a9d2eac6027ab0eb9e4207" FOREIGN KEY ("attendAssessmentId") REFERENCES public."attendAssessment-general"("attendAssessmentId");


--
-- Name: teacher-subject-grade FK_ca9fd659064f1cdfa026886480f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."teacher-subject-grade"
    ADD CONSTRAINT "FK_ca9fd659064f1cdfa026886480f" FOREIGN KEY ("teacherId") REFERENCES public.teacher("teacherId");


--
-- Name: attendAssessment-general FK_d22cab467a349765e52a3d1d77f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."attendAssessment-general"
    ADD CONSTRAINT "FK_d22cab467a349765e52a3d1d77f" FOREIGN KEY ("userId") REFERENCES public."user"("userId");


--
-- Name: business FK_d2ebc0288329a1485a2afdb10c5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.business
    ADD CONSTRAINT "FK_d2ebc0288329a1485a2afdb10c5" FOREIGN KEY ("businessTypeId") REFERENCES public."business-type"("businessTypeId");


--
-- Name: question-group FK_d8db5fd6a725f5f41ab492cfe73; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."question-group"
    ADD CONSTRAINT "FK_d8db5fd6a725f5f41ab492cfe73" FOREIGN KEY ("gradeId") REFERENCES public.grade("gradeId");


--
-- PostgreSQL database dump complete
--

