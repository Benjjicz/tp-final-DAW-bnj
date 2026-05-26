--
-- PostgreSQL database dump
--

\restrict 7vDNbXxR4bb4bmDwNET4Z1cPFiTJJ1u3agVmiwFggebl1aXqszqrDFBo3HO8BAD

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-25 10:21:17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2 (class 3079 OID 16615)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 5105 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- TOC entry 918 (class 1247 OID 17360)
-- Name: clientes_estado_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.clientes_estado_enum AS ENUM (
    'ACTIVO',
    'BAJA'
);


ALTER TYPE public.clientes_estado_enum OWNER TO postgres;

--
-- TOC entry 915 (class 1247 OID 17343)
-- Name: proyectos_estado_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.proyectos_estado_enum AS ENUM (
    'ACTIVO',
    'FINALIZADO',
    'BAJA'
);


ALTER TYPE public.proyectos_estado_enum OWNER TO postgres;

--
-- TOC entry 912 (class 1247 OID 17326)
-- Name: tareas_estado_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.tareas_estado_enum AS ENUM (
    'PENDIENTE',
    'FINALIZADA',
    'BAJA'
);


ALTER TYPE public.tareas_estado_enum OWNER TO postgres;

--
-- TOC entry 909 (class 1247 OID 17311)
-- Name: usuarios_estado_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.usuarios_estado_enum AS ENUM (
    'ACTIVO',
    'BAJA'
);


ALTER TYPE public.usuarios_estado_enum OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 16565)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nombre text NOT NULL,
    estado public.clientes_estado_enum DEFAULT 'ACTIVO'::public.clientes_estado_enum NOT NULL,
    correo character varying(150),
    telefono character varying(50)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16564)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_seq OWNER TO postgres;

--
-- TOC entry 5106 (class 0 OID 0)
-- Dependencies: 222
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 225 (class 1259 OID 16579)
-- Name: proyectos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proyectos (
    id integer NOT NULL,
    nombre text NOT NULL,
    estado public.proyectos_estado_enum DEFAULT 'ACTIVO'::public.proyectos_estado_enum NOT NULL,
    id_cliente integer
);


ALTER TABLE public.proyectos OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16578)
-- Name: proyectos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proyectos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proyectos_id_seq OWNER TO postgres;

--
-- TOC entry 5107 (class 0 OID 0)
-- Dependencies: 224
-- Name: proyectos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proyectos_id_seq OWNED BY public.proyectos.id;


--
-- TOC entry 227 (class 1259 OID 16598)
-- Name: tareas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tareas (
    id integer NOT NULL,
    descripcion text NOT NULL,
    estado public.tareas_estado_enum DEFAULT 'PENDIENTE'::public.tareas_estado_enum NOT NULL,
    id_proyecto integer
);


ALTER TABLE public.tareas OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16597)
-- Name: tareas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tareas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tareas_id_seq OWNER TO postgres;

--
-- TOC entry 5108 (class 0 OID 0)
-- Dependencies: 226
-- Name: tareas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tareas_id_seq OWNED BY public.tareas.id;


--
-- TOC entry 221 (class 1259 OID 16550)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre text NOT NULL,
    clave text NOT NULL,
    estado public.usuarios_estado_enum DEFAULT 'ACTIVO'::public.usuarios_estado_enum NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16549)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 5109 (class 0 OID 0)
-- Dependencies: 220
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 4923 (class 2604 OID 16568)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 4925 (class 2604 OID 16582)
-- Name: proyectos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos ALTER COLUMN id SET DEFAULT nextval('public.proyectos_id_seq'::regclass);


--
-- TOC entry 4927 (class 2604 OID 16601)
-- Name: tareas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tareas ALTER COLUMN id SET DEFAULT nextval('public.tareas_id_seq'::regclass);


--
-- TOC entry 4921 (class 2604 OID 16553)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 5095 (class 0 OID 16565)
-- Dependencies: 223
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nombre, estado, correo, telefono) FROM stdin;
1	Benja Fibiger	ACTIVO	\N	\N
2	Susana Gimenez	ACTIVO	\N	\N
3	karen p	ACTIVO	\N	\N
4	MercadoLibre	ACTIVO	\N	\N
5	cliente de prueba 1	BAJA	\N	\N
6	Nvidea	ACTIVO	\N	\N
7	AMD	ACTIVO	\N	\N
8	Tomas	BAJA	\N	\N
9	Intel	ACTIVO	\N	\N
10	Spiderman	ACTIVO	\N	\N
11	batman	ACTIVO	\N	\N
12	Capitan America	ACTIVO	\N	\N
13	fulano	ACTIVO	fulanito@gmail.com	+54 9 25495494
14	fulano2	ACTIVO	fulanito2@gmail.com	+54 9 25495395
\.


--
-- TOC entry 5097 (class 0 OID 16579)
-- Dependencies: 225
-- Data for Name: proyectos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proyectos (id, nombre, estado, id_cliente) FROM stdin;
3	app mobil	ACTIVO	1
4	pagina web	ACTIVO	2
2	sdasda	FINALIZADO	\N
5	proyecto 1	ACTIVO	1
6	proyecto 2	ACTIVO	2
8	proyecto 3	ACTIVO	3
10	proyecto 4	ACTIVO	\N
11	rediseño web	ACTIVO	\N
1	Una nueva seccion en la pagina web	FINALIZADO	1
7	qsyo	BAJA	4
13	RX 6700xt	ACTIVO	\N
14	Nueva Intel ARC A580	ACTIVO	\N
16	rx 480	FINALIZADO	\N
9	probando	BAJA	3
17	proyecto 5	ACTIVO	\N
15	Actualizacion de drivers	BAJA	7
18	Implementacion FSR	ACTIVO	7
12	rtx 6050	FINALIZADO	6
19	Desarrollar un nuevo traje	ACTIVO	10
20	Nueva grafica	ACTIVO	6
21	Nuevo traje para batman	ACTIVO	11
22	Nuevo escudo	ACTIVO	12
23	asdadsd	ACTIVO	4
\.


--
-- TOC entry 5099 (class 0 OID 16598)
-- Dependencies: 227
-- Data for Name: tareas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tareas (id, descripcion, estado, id_proyecto) FROM stdin;
19	Hacer nueva version de drivers	FINALIZADA	12
20	Actualizar drivers 	PENDIENTE	13
21	Actualizar los drivers de la grafica	PENDIENTE	14
22	FSR 4	PENDIENTE	18
\.


--
-- TOC entry 5093 (class 0 OID 16550)
-- Dependencies: 221
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id, nombre, clave, estado) FROM stdin;
1	usuario	$2a$10$IOFs2YMqXygxB6FbVpw1Z.lXjO2OTz2brx3BihmnFQ6vtbDsSjweu	ACTIVO
\.


--
-- TOC entry 5110 (class 0 OID 0)
-- Dependencies: 222
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 14, true);


--
-- TOC entry 5111 (class 0 OID 0)
-- Dependencies: 224
-- Name: proyectos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proyectos_id_seq', 23, true);


--
-- TOC entry 5112 (class 0 OID 0)
-- Dependencies: 226
-- Name: tareas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tareas_id_seq', 22, true);


--
-- TOC entry 5113 (class 0 OID 0)
-- Dependencies: 220
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 2, true);


--
-- TOC entry 4934 (class 2606 OID 16577)
-- Name: clientes clientes_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_nombre_key UNIQUE (nombre);


--
-- TOC entry 4936 (class 2606 OID 16575)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 4938 (class 2606 OID 16591)
-- Name: proyectos proyectos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos
    ADD CONSTRAINT proyectos_nombre_key UNIQUE (nombre);


--
-- TOC entry 4940 (class 2606 OID 16589)
-- Name: proyectos proyectos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos
    ADD CONSTRAINT proyectos_pkey PRIMARY KEY (id);


--
-- TOC entry 4942 (class 2606 OID 16609)
-- Name: tareas tareas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tareas
    ADD CONSTRAINT tareas_pkey PRIMARY KEY (id);


--
-- TOC entry 4930 (class 2606 OID 16563)
-- Name: usuarios usuarios_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_nombre_key UNIQUE (nombre);


--
-- TOC entry 4932 (class 2606 OID 16561)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 4944 (class 2606 OID 17375)
-- Name: tareas FK_14c3d06854635977033ed82536f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tareas
    ADD CONSTRAINT "FK_14c3d06854635977033ed82536f" FOREIGN KEY (id_proyecto) REFERENCES public.proyectos(id);


--
-- TOC entry 4943 (class 2606 OID 17380)
-- Name: proyectos FK_4a72954620c7d7746cf547f3307; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proyectos
    ADD CONSTRAINT "FK_4a72954620c7d7746cf547f3307" FOREIGN KEY (id_cliente) REFERENCES public.clientes(id);


-- Completed on 2026-05-25 10:21:17

--
-- PostgreSQL database dump complete
--

\unrestrict 7vDNbXxR4bb4bmDwNET4Z1cPFiTJJ1u3agVmiwFggebl1aXqszqrDFBo3HO8BAD

