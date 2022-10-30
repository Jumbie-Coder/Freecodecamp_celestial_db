--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    classification character varying(30),
    num_of_planets integer NOT NULL,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    dis_from_planet_km integer,
    radius_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_visitor; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon_visitor (
    moon_visitor_id integer NOT NULL,
    name character varying(30) NOT NULL,
    spaceship character varying(30),
    year date
);


ALTER TABLE public.moon_visitor OWNER TO freecodecamp;

--
-- Name: moon_visitor_visitor_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_visitor_visitor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_visitor_visitor_id_seq OWNER TO freecodecamp;

--
-- Name: moon_visitor_visitor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_visitor_visitor_id_seq OWNED BY public.moon_visitor.moon_visitor_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mass numeric(10,2),
    diameter_in_km integer,
    is_spherical boolean,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    size integer,
    constellation character varying(30),
    name character varying(50),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon_visitor moon_visitor_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_visitor ALTER COLUMN moon_visitor_id SET DEFAULT nextval('public.moon_visitor_visitor_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 400, 'The galaxy containing the Sun and its Solar System, and therefore Earth.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda', 320, 'Andromeda is the closest big galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Backward Galaxy', 'Centaurus', 240, 'It appears to rotate backwards');
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', 'Coma Berenices', 700, 'It has a spectacular dark band of absorbing dust in front of the galaxys bright nucleus');
INSERT INTO public.galaxy VALUES (5, 'Bodes Galaxy', 'Ursa Major', 320, 'Named for Johann Elert Bode who discovered this galaxy in 1774.');
INSERT INTO public.galaxy VALUES (6, 'Butterfly Galaxies', 'Virgo', 220, 'Looks are similar to a butterfly.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 421313, 461231);
INSERT INTO public.moon VALUES (2, 'Deimos', 3, 321421313, 651461231);
INSERT INTO public.moon VALUES (3, 'Phobos', 3, 32131314, 6132131);
INSERT INTO public.moon VALUES (4, 'Amalthea', 2, 752414, 431671);
INSERT INTO public.moon VALUES (5, 'Callisto', 2, 512315, 12345);
INSERT INTO public.moon VALUES (6, 'Europa', 2, 421387, 12345);
INSERT INTO public.moon VALUES (7, 'Ganymede', 2, 4123415, 12345);
INSERT INTO public.moon VALUES (8, 'Io', 2, 758137, 12345);
INSERT INTO public.moon VALUES (9, 'Dione', 5, 7893123, 46141);
INSERT INTO public.moon VALUES (10, 'Enceladus', 5, 703213, 87312);
INSERT INTO public.moon VALUES (11, 'Hyperion', 5, 98313, 54141);
INSERT INTO public.moon VALUES (12, 'Iapetus', 5, 314223, 45341);
INSERT INTO public.moon VALUES (13, 'Mimas', 5, 42353, 561431);
INSERT INTO public.moon VALUES (14, 'Phoebe', 5, 9323, 244231);
INSERT INTO public.moon VALUES (15, 'Rhea', 5, 98323, 32134);
INSERT INTO public.moon VALUES (16, 'Tethys', 5, 61423, 874213);
INSERT INTO public.moon VALUES (17, 'Titan', 5, 883213, 1243213);
INSERT INTO public.moon VALUES (18, 'Ariel', 14, 54423, 1474213);
INSERT INTO public.moon VALUES (19, 'Miranda', 14, 32134, 321313);
INSERT INTO public.moon VALUES (20, 'Oberon', 14, 542323, 494213);
INSERT INTO public.moon VALUES (21, 'Titania', 14, 39321, 943231);
INSERT INTO public.moon VALUES (22, 'Umbriel', 14, 321323, 93213);


--
-- Data for Name: moon_visitor; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon_visitor VALUES (1, 'Neil A. Armstrong', 'Apollo 11', '1966-03-16');
INSERT INTO public.moon_visitor VALUES (2, 'Charles Pete Conrad', 'Apollo 12', '1967-04-20');
INSERT INTO public.moon_visitor VALUES (3, 'Harrison H. Schmitt', 'Apollo 17', '1972-12-10');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 597360.00, 6378, true, true, NULL);
INSERT INTO public.planet VALUES (2, 'Jupiter', 4213.00, 4378, true, false, NULL);
INSERT INTO public.planet VALUES (3, 'Mars', 5126.00, 43231, true, false, NULL);
INSERT INTO public.planet VALUES (5, 'Saturn', 61234.00, 7125, true, false, NULL);
INSERT INTO public.planet VALUES (6, 'Mercury', 12456.00, 95131, true, false, NULL);
INSERT INTO public.planet VALUES (7, 'Venus', 44431.00, 12855, true, false, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 37331.00, 12855, true, false, NULL);
INSERT INTO public.planet VALUES (9, 'Ceres', 16732.00, 51655, true, false, NULL);
INSERT INTO public.planet VALUES (10, 'Pluto', 213551.00, 93123, true, false, NULL);
INSERT INTO public.planet VALUES (11, 'Planet Nine', 10000042.00, 3132414, true, false, NULL);
INSERT INTO public.planet VALUES (12, 'CoRoT-7b', 1099432.00, 61234, false, false, NULL);
INSERT INTO public.planet VALUES (13, 'HD 209458b', 942313.00, 709321, false, false, NULL);
INSERT INTO public.planet VALUES (14, 'Uranus', 432313.00, 509321, true, false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (10, 200, 'Eridanus', 'Acamar', 3);
INSERT INTO public.star VALUES (11, 520, 'Eridanus', 'Beid', 2);
INSERT INTO public.star VALUES (12, 1250, 'Eridanus', 'Achernar', 2);
INSERT INTO public.star VALUES (13, 950, 'Eridanus', 'Angetenar', 1);
INSERT INTO public.star VALUES (14, 250, 'Leo', 'Regulus', 2);
INSERT INTO public.star VALUES (15, 103, 'Leo', 'Alterf', 3);
INSERT INTO public.star VALUES (16, 135, 'Scorpius', 'Fang', 1);
INSERT INTO public.star VALUES (17, 124, 'Scorpius', 'Lesath', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: moon_visitor_visitor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_visitor_visitor_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 17, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_uni; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_uni UNIQUE (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (moon_id);


--
-- Name: moon_visitor moon_visitor_visitor_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_visitor
    ADD CONSTRAINT moon_visitor_visitor_id_key UNIQUE (moon_visitor_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_primary_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_primary_key PRIMARY KEY (planet_id);


--
-- Name: star star_primary_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_primary_key PRIMARY KEY (star_id);


--
-- Name: star star_uni; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_uni UNIQUE (star_id);


--
-- Name: moon_visitor visitor_prkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon_visitor
    ADD CONSTRAINT visitor_prkey PRIMARY KEY (moon_visitor_id);


--
-- Name: star galaxy_connect; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_connect FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_ref; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_ref FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


