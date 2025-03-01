--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor (
    id_autor integer NOT NULL,
    nume character varying(50)
);


ALTER TABLE public.autor OWNER TO postgres;

--
-- Name: carte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carte (
    id_carte integer NOT NULL,
    denumire character varying(50),
    pret double precision,
    an_aparitie integer,
    numar_pagini integer,
    gen character varying(20),
    numar_exemplare integer,
    id_promotie integer
);


ALTER TABLE public.carte OWNER TO postgres;

--
-- Name: carte_autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carte_autor (
    id_carte integer NOT NULL,
    id_autor integer NOT NULL
);


ALTER TABLE public.carte_autor OWNER TO postgres;

--
-- Name: carte_editura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carte_editura (
    id_carte integer NOT NULL,
    id_editura integer NOT NULL
);


ALTER TABLE public.carte_editura OWNER TO postgres;

--
-- Name: comanda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comanda (
    id_comanda integer NOT NULL,
    id_utilizator integer,
    data_plasarii date,
    status character varying(15),
    metoda_plata character varying(5)
);


ALTER TABLE public.comanda OWNER TO postgres;

--
-- Name: detalii_comanda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalii_comanda (
    id_detalii integer NOT NULL,
    id_carte integer,
    id_comanda integer,
    numar_exemplare integer,
    pret_per_carte double precision,
    id_promotie integer
);


ALTER TABLE public.detalii_comanda OWNER TO postgres;

--
-- Name: editura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.editura (
    id_editura integer NOT NULL,
    nume character varying(50),
    adresa_email character varying(30),
    telefon character varying(10)
);


ALTER TABLE public.editura OWNER TO postgres;

--
-- Name: promotie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotie (
    id_promotie integer NOT NULL,
    reducere integer,
    inceputul_perioadei date,
    sfarsitul_perioadei date
);


ALTER TABLE public.promotie OWNER TO postgres;

--
-- Name: utilizator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilizator (
    id_utilizator integer NOT NULL,
    adresa_email character varying(30),
    data_inregistrarii date
);


ALTER TABLE public.utilizator OWNER TO postgres;

--
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autor (id_autor, nume) FROM stdin;
1	Elena Ferrante
2	Sally Rooney
3	Fredrik Backman
4	Colleen Hoover
5	Taylor Jenkins Reid
6	Matt Haig
7	Delia Owens
\.


--
-- Data for Name: carte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carte (id_carte, denumire, pret, an_aparitie, numar_pagini, gen, numar_exemplare, id_promotie) FROM stdin;
1	Prietena mea geniala	45.99	2011	350	Roman	20	1
2	Conversa?ii cu prieteni	39.5	2017	320	Fic?iune	15	\N
3	Un barbat pe nume Ove	42	2012	350	Fic?iune	30	2
4	Ugly Love	36.99	2014	320	Romance	25	3
5	Daisy Jones & The Six	41	2019	400	Roman	18	\N
6	Motivul pentru care sa traie?ti	33.99	2015	280	Memoir	12	4
7	Acolo unde cƒnta racii	48.5	2018	400	Mister	20	5
\.


--
-- Data for Name: carte_autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carte_autor (id_carte, id_autor) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
\.


--
-- Data for Name: carte_editura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carte_editura (id_carte, id_editura) FROM stdin;
1	1
2	2
3	3
4	4
5	5
6	6
7	7
\.


--
-- Data for Name: comanda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comanda (id_comanda, id_utilizator, data_plasarii, status, metoda_plata) FROM stdin;
1	1	2025-01-05	Platita	Card
2	2	2025-01-06	Procesare	Card
4	4	2025-01-08	Anulata	Card
5	5	2025-01-09	Platita	Card
6	6	2025-01-10	Procesare	Card
7	7	2025-01-11	Livrata	Card
3	3	2025-01-07	Livrata	Card
\.


--
-- Data for Name: detalii_comanda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalii_comanda (id_detalii, id_carte, id_comanda, numar_exemplare, pret_per_carte, id_promotie) FROM stdin;
1	1	1	1	45.99	1
2	2	2	2	39.5	\N
3	3	3	1	42	2
4	4	4	1	36.99	3
5	5	5	3	41	\N
6	6	6	2	33.99	4
7	7	7	1	48.5	5
\.


--
-- Data for Name: editura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.editura (id_editura, nume, adresa_email, telefon) FROM stdin;
1	Penguin Books	info@penguin.com	0741123456
2	HarperCollins	contact@harpercollins.com	0742123456
3	Bloomsbury	sales@bloomsbury.com	0743123456
4	Simon & Schuster	support@simonandschuster.com	0744123456
5	Crown Publishing	office@crownpublishing.com	0745123456
6	Flatiron Books	info@flatironbooks.com	0746123456
7	G.P. Putnams Sons	contact@putnamsons.com	0747123456
\.


--
-- Data for Name: promotie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotie (id_promotie, reducere, inceputul_perioadei, sfarsitul_perioadei) FROM stdin;
1	10	2025-01-01	2025-01-31
2	15	2025-02-01	2025-02-28
3	20	2025-03-01	2025-03-31
4	25	2025-04-01	2025-04-30
5	30	2025-05-01	2025-05-31
6	5	2025-06-01	2025-06-30
7	50	2025-07-01	2025-07-31
\.


--
-- Data for Name: utilizator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilizator (id_utilizator, adresa_email, data_inregistrarii) FROM stdin;
1	john.doe@gmail.com	2023-10-01
2	jane.smith@yahoo.com	2023-11-15
3	peter.parker@hotmail.com	2024-01-20
4	emma.johnson@gmail.com	2024-03-10
5	clark.kent@gmail.com	2024-05-05
6	lois.lane@outlook.com	2024-07-07
7	bruce.wayne@gmail.com	2024-09-09
\.


--
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id_autor);


--
-- Name: carte_autor carte_autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carte_autor
    ADD CONSTRAINT carte_autor_pkey PRIMARY KEY (id_carte, id_autor);


--
-- Name: carte_editura carte_editura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carte_editura
    ADD CONSTRAINT carte_editura_pkey PRIMARY KEY (id_carte, id_editura);


--
-- Name: carte carte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carte
    ADD CONSTRAINT carte_pkey PRIMARY KEY (id_carte);


--
-- Name: comanda comanda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comanda
    ADD CONSTRAINT comanda_pkey PRIMARY KEY (id_comanda);


--
-- Name: detalii_comanda detalii_comanda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalii_comanda
    ADD CONSTRAINT detalii_comanda_pkey PRIMARY KEY (id_detalii);


--
-- Name: editura editura_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.editura
    ADD CONSTRAINT editura_pkey PRIMARY KEY (id_editura);


--
-- Name: promotie promotie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotie
    ADD CONSTRAINT promotie_pkey PRIMARY KEY (id_promotie);


--
-- Name: utilizator utilizator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilizator
    ADD CONSTRAINT utilizator_pkey PRIMARY KEY (id_utilizator);


--
-- Name: carte_autor carte_autor_id_autor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carte_autor
    ADD CONSTRAINT carte_autor_id_autor_fkey FOREIGN KEY (id_autor) REFERENCES public.autor(id_autor);


--
-- Name: carte_autor carte_autor_id_carte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carte_autor
    ADD CONSTRAINT carte_autor_id_carte_fkey FOREIGN KEY (id_carte) REFERENCES public.carte(id_carte);


--
-- Name: carte_editura carte_editura_id_carte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carte_editura
    ADD CONSTRAINT carte_editura_id_carte_fkey FOREIGN KEY (id_carte) REFERENCES public.carte(id_carte);


--
-- Name: carte_editura carte_editura_id_editura_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carte_editura
    ADD CONSTRAINT carte_editura_id_editura_fkey FOREIGN KEY (id_editura) REFERENCES public.editura(id_editura);


--
-- Name: carte carte_id_promotie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carte
    ADD CONSTRAINT carte_id_promotie_fkey FOREIGN KEY (id_promotie) REFERENCES public.promotie(id_promotie);


--
-- Name: comanda comanda_id_utilizator_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comanda
    ADD CONSTRAINT comanda_id_utilizator_fkey FOREIGN KEY (id_utilizator) REFERENCES public.utilizator(id_utilizator);


--
-- Name: detalii_comanda detalii_comanda_id_carte_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalii_comanda
    ADD CONSTRAINT detalii_comanda_id_carte_fkey FOREIGN KEY (id_carte) REFERENCES public.carte(id_carte);


--
-- Name: detalii_comanda detalii_comanda_id_comanda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalii_comanda
    ADD CONSTRAINT detalii_comanda_id_comanda_fkey FOREIGN KEY (id_comanda) REFERENCES public.comanda(id_comanda);


--
-- Name: detalii_comanda detalii_comanda_id_promotie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalii_comanda
    ADD CONSTRAINT detalii_comanda_id_promotie_fkey FOREIGN KEY (id_promotie) REFERENCES public.promotie(id_promotie);


--
-- PostgreSQL database dump complete
--

