--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_name character varying(22),
    best_game integer DEFAULT 0,
    games_played integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('ösldf', 9, 1);
INSERT INTO public.users VALUES ('user_1713976626328', 597, 2);
INSERT INTO public.users VALUES ('user_1713977666756', 885, 2);
INSERT INTO public.users VALUES ('user_1713976626329', 64, 5);
INSERT INTO public.users VALUES ('user_1713977666757', 54, 5);
INSERT INTO public.users VALUES ('user_1713977021288', 26, 2);
INSERT INTO public.users VALUES ('user_1713977021289', 168, 5);
INSERT INTO public.users VALUES ('David', 7, 3);
INSERT INTO public.users VALUES ('user_1713977672298', 37, 2);
INSERT INTO public.users VALUES ('user_1713977672299', 39, 5);
INSERT INTO public.users VALUES ('user_1713977351094', 235, 2);
INSERT INTO public.users VALUES ('user_1713977351095', 9, 5);
INSERT INTO public.users VALUES ('user_1713977418558', 86, 2);
INSERT INTO public.users VALUES ('user_1713977674641', 51, 2);
INSERT INTO public.users VALUES ('user_1713977418559', 85, 5);
INSERT INTO public.users VALUES ('user_1713977674642', 358, 5);
INSERT INTO public.users VALUES ('user_1713977508495', 32, 2);
INSERT INTO public.users VALUES ('user_1713977508496', 467, 5);


--
-- PostgreSQL database dump complete
--

