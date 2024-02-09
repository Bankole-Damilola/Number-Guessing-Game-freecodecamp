--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: guess_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guess_table (
    guess_table_id integer NOT NULL,
    username_id integer NOT NULL,
    games_trial integer NOT NULL
);


ALTER TABLE public.guess_table OWNER TO freecodecamp;

--
-- Name: guess_table_guess_table_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guess_table_guess_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guess_table_guess_table_id_seq OWNER TO freecodecamp;

--
-- Name: guess_table_guess_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guess_table_guess_table_id_seq OWNED BY public.guess_table.guess_table_id;


--
-- Name: username; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.username (
    username_id integer NOT NULL,
    name character varying(22) NOT NULL
);


ALTER TABLE public.username OWNER TO freecodecamp;

--
-- Name: username_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.username_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.username_username_id_seq OWNER TO freecodecamp;

--
-- Name: username_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.username_username_id_seq OWNED BY public.username.username_id;


--
-- Name: guess_table guess_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guess_table ALTER COLUMN guess_table_id SET DEFAULT nextval('public.guess_table_guess_table_id_seq'::regclass);


--
-- Name: username username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.username ALTER COLUMN username_id SET DEFAULT nextval('public.username_username_id_seq'::regclass);


--
-- Data for Name: guess_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guess_table VALUES (116, 273, 677);
INSERT INTO public.guess_table VALUES (117, 273, 460);
INSERT INTO public.guess_table VALUES (118, 274, 63);
INSERT INTO public.guess_table VALUES (119, 274, 231);
INSERT INTO public.guess_table VALUES (120, 273, 824);
INSERT INTO public.guess_table VALUES (121, 273, 57);
INSERT INTO public.guess_table VALUES (122, 273, 286);
INSERT INTO public.guess_table VALUES (123, 275, 9);
INSERT INTO public.guess_table VALUES (124, 276, 647);
INSERT INTO public.guess_table VALUES (125, 276, 922);
INSERT INTO public.guess_table VALUES (126, 277, 875);
INSERT INTO public.guess_table VALUES (127, 277, 319);
INSERT INTO public.guess_table VALUES (128, 276, 266);
INSERT INTO public.guess_table VALUES (129, 276, 41);
INSERT INTO public.guess_table VALUES (130, 276, 1000);
INSERT INTO public.guess_table VALUES (131, 278, 837);
INSERT INTO public.guess_table VALUES (132, 278, 921);
INSERT INTO public.guess_table VALUES (133, 279, 431);
INSERT INTO public.guess_table VALUES (134, 279, 176);
INSERT INTO public.guess_table VALUES (135, 278, 517);
INSERT INTO public.guess_table VALUES (136, 278, 940);
INSERT INTO public.guess_table VALUES (137, 278, 731);
INSERT INTO public.guess_table VALUES (138, 275, 12);


--
-- Data for Name: username; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.username VALUES (273, 'user_1707478231191');
INSERT INTO public.username VALUES (274, 'user_1707478231190');
INSERT INTO public.username VALUES (275, 'Dammy');
INSERT INTO public.username VALUES (276, 'user_1707478368148');
INSERT INTO public.username VALUES (277, 'user_1707478368147');
INSERT INTO public.username VALUES (278, 'user_1707478477892');
INSERT INTO public.username VALUES (279, 'user_1707478477891');


--
-- Name: guess_table_guess_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guess_table_guess_table_id_seq', 138, true);


--
-- Name: username_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.username_username_id_seq', 279, true);


--
-- Name: guess_table guess_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guess_table
    ADD CONSTRAINT guess_table_pkey PRIMARY KEY (guess_table_id);


--
-- Name: username username_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.username
    ADD CONSTRAINT username_name_key UNIQUE (name);


--
-- Name: username username_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.username
    ADD CONSTRAINT username_pkey PRIMARY KEY (username_id);


--
-- Name: guess_table guess_table_username_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guess_table
    ADD CONSTRAINT guess_table_username_id_fkey FOREIGN KEY (username_id) REFERENCES public.username(username_id);


--
-- PostgreSQL database dump complete
--

