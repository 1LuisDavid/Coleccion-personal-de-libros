######## Bootstrap sobre los datos de mi biblioteca ------


Sys.setlocale("LC_ALL", "es_ES.UTF-8") # Prevenir problemas con caracteres especiales
options(scipen=999) # Prevenir notación científica

#### Librerías  ------

library(tidyverse)
# library(readr)
library(janitor)
library(ggthemes)
library(patchwork)

#########Pegar datos------
df <-
tibble::tribble(
                                                                          ~Título.del.libro,                                     ~Autor, ~Páginas, ~Páginas.leídas, ~porcentaje.de.avance.de.lectura, ~Calificación.en.escala.del.1.al.10, ~Estado.actual,                     ~Género, ~Fecha.de.inicio.de.lectura, ~Fecha.de.término.de.lectura, ~Fecha.de.compra,                                                                                                                              ~NOta.o.link,
                                                                          "La muerte feliz",                             "Albert Camus",      196,               0,                                0,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,          "<2015",                                                                                                                                        NA,
                                                                             "España libre",                             "Albert Camus",      203,              NA,                                0,                                  NA,  "No iniciado",          "Ensayo literario",                          NA,                           NA,           "2015",                                                                                                   "Lo compré la 1ra vez que fui a España",
                                                                       "Create Dangerously",                             "Albert Camus",       53,              NA,                                0,                                  NA,  "No iniciado",         "Ensayo filosófico",                          NA,                           NA,           "2019",                                                                       "Lo compré en mi 1er viaje a Inglaterra para regalarlo a una tipa.",
                                                                  "Prometeo mal encadenado",                               "André Gide",       75,               0,                                0,                                  NA,  "No iniciado",                    "Teatro",                          NA,                           NA,          "<2015",                                                                                                                                        NA,
                                                                     "El viajero del siglo",                            "Andrés Neuman",      531,               0,                                0,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,           "2015",                                                                                                                                        NA,
                                                                    "El pintor de batallas",                     "Arturo Pérez-Reverte",      301,               0,                                0,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,          "<2015",                                                                                                                                        NA,
                                                                            "Conversations",                         "Borges y Ferrari",      336,               0,                                0,                                  NA,  "No iniciado",               "Entrevistas",                      "2014",                           NA,           "2014",                                                                  "Lo compré la vez que mi familia y yo pasamos el año nuevo en Manhattan",
                                                                               "El jugador",                              "Dostoievski",      232,               0,                                0,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,          "<2015",                                                                                                                                        NA,
                                                                     "La suma de los ceros",                           "Eduardo Rabasa",      329,               0,                                0,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,           "2019",                                                                                                                                        NA,
                                                                  "Creando el mundo social",                              "John Searle",      274,             105,                             0.38,                                   9,   "En lectura",         "Ensayo filosófico",                      "2018",                           NA,           "2018",                                                                                                                                        NA,
                                                   "La maravillosa vida breve de Óscar Wao",                               "Junto Díaz",      330,               0,                                0,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,           "2019",                                                                                                                                        NA,
                                                                         "Inglés Gramática",                                 "Larousse",      255,               0,                                0,                                  NA,   "Abandonado",       "Libro de ejercicios",                          NA,                           NA,           "2016",                                                                                                           "Lo uso como libro de consulta",
                                                                        "Sonata a Kreutzer",                             "León Tolstói",      200,               0,                                0,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,          "<2015",                                                                                                                                        NA,
                                                         "La reforma de las organizaciones",           "Nils Brunsson & Johan P. Olsen",      342,               0,                                0,                                  NA,  "No iniciado", "Teoría de la organización",                          NA,                           NA,           "2018",                                                                                                                                        NA,
                                                                   "Albert Camus. Una Vida",                              "Oliver Todd",      770,               0,                                0,                                  NA,  "No iniciado",                 "Biografía",                          NA,                           NA,           "2015",                                                                                                                                        NA,
                                       "Juegos y problemas de ajedrez para Sherlock Holmes",                         "Raymond Smullyan",      174,               0,                                0,                                  NA,  "No iniciado",       "Libro de ejercicios",                          NA,                           NA,          "<2010",                                                                                                                                        NA,
                                                                "Somos adolescentes ¿Y ke!",                                  "VV. AA.",      177,               0,                                0,                                  NA,  "No iniciado",                   "Cuentos",                          NA,                           NA,           "2016",                                                                                                              "Me lo regaló María Mendoza",
                                                             "Para una filosofía del valor",                    "Augusto Salazar Bondy",      334,               0,                                0,                                  NA,  "No iniciado",         "Ensayo filosófico",                          NA,                           NA,          "<2015",                                                                                                                                        NA,
                                                  "La aventura de un fotógrafo en La Plata",                             "Bioy Casares",      206,               0,                                0,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,          "<2015",                                                                                                                                        NA,
                                                                            "La casa verde",                       "Mario Vargas Llosa",      525,               0,                                0,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,          "<2015",                                                                                                                                        NA,
                                                             "Ahora me rindo y eso es todo",                           "Álvaro Enrigue",      455,               0,                                0,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,           "2019",                                                                                                                                        NA,
                                                                           "Finnegans Wake",                                    "Joyce",      628,               1,                                0,                                  NA,   "Abandonado",                   "Quimera",                          NA,                           NA,          "<2020",                               "No recuerdo si me lo regaló papá una vez que fue a california y pidió libros por paquetería a Nueva York.",
                                                   "The Selected Works of G. K. Chesterton",                               "Chesterton",     1482,              20,                             0.01,                                  NA,   "Abandonado",                   "Cuentos",                          NA,                           NA,          "<2015",                                                                                                                                        NA,
                                                 "Aprender a rezar en la era de la técnica",                       "Gonçalo M. Tavares",      383,              10,                             0.03,                                  NA,   "En lectura",                    "Novela",                   "04-2020",                           NA,        "04-2020",                                                                                                                                        NA,
                                                                     "Después del invierno",                         "Guadalupe Nettel",      268,              10,                             0.04,                                  NA,   "Abandonado",                    "Novela",                          NA,                           NA,           "2015",                                                                                                                                        NA,
                                                                           "Rumoroso Delta",                        "Justine Hernández",       50,               2,                             0.04,                                   1,   "Abandonado",                    "Poesía",                      "2016",                           NA,           "2016",                                                         "Me lo regaló la autora, con dedicatoria genérica, no más que los mismos poemas.",
                                               "The Oxford Anthology of English Literature",                                  "VV. AA.",     2200,             100,                             0.05,                                  NA,   "Abandonado",                 "Antología",                      "2013",                           NA,           "2013",                                                                                                        "Impráctico aunque bonita edición",
                                                                      "Ensayos y discursos",                         "William Faulkner",      369,              20,                             0.05,                                   6,     "En pausa",          "Ensayo literario",                     "<2015",                           NA,          "<2015",                                                                                                           "Lo uso como libro de consulta",
                                                                   "La biblia de Jerusalén",                           "Dios y VV. AA.",     1839,             100,                             0.05,                                  NA,   "En lectura",           "Varia invención",                      "2011",                           NA,           "2011",                                                                                                                "Me lo regaló mi tío Juan",
                                                                        "El Pez en el agua",                       "Mario Vargas Llosa",      593,              36,                             0.06,                                  NA,     "En pausa",             "Autobiografía",                      "2014",                           NA,           "2014",                                                                                                                                        NA,
                                                                                "Antología",                         "Gabriela Mistral",      682,              50,                             0.07,                                  NA,   "Abandonado",                    "Poesía",                          NA,                           NA,          "<2015",                                                                                                                                        NA,
                                                              "Textos recobrados 1919-1986",                                   "Borges",     1330,             100,                             0.08,                                  NA,   "En lectura",           "Varia invención",                     "<2020",                           NA,          "<2020",                                                          "Son 3 tomos, he leído muchos de estos textos en versión electrónica desde 2012",
                                                           "Pablo Neruda Antología General",                                   "Neruda",      636,              50,                             0.08,                                  NA,   "Abandonado",                    "Poesía",                     "<2015",                           NA,          "<2015",                                                                                                               "Edición conmemorativa RAE",
                                                                     "Las trampas de la fe",                              "Octavio Paz",      587,              71,                             0.12,                                   9,   "En lectura",          "Ensayo literario",                   "07-2020",                           NA,           "2017",                                                                                                                                        NA,
                                        "Blood Meridian or the evening redness in the west",                          "Cormac McCarthy",      351,              43,                             0.12,                                 8.5,   "En lectura",                    "Novela",                      "2020",                           NA,           "2017",                                                                                                                                        NA,
                                   "Teoría general de la ocupación, el interés y el dinero",                      "John Maynard Keynes",      392,              50,                             0.13,                                   7,   "Abandonado",          "Teoría económica",                      "2010",                           NA,           "2010",                                                                                                                                        NA,
                                           "Historia de la teoría económica y de su método",                         "Ekelund y Hébert",      750,             100,                             0.13,                                 6.5,   "Abandonado",          "Teoría económica",                          NA,                           NA,           "2008",                                                                                                                                        NA,
                                                                         "Lógica elemental",           "Max Fernández de Castro et al.",      140,              20,                             0.14,                                  NA,   "Abandonado",               "Matemáticas",                          NA,                           NA,           "2018",                                                                                                           "Lo uso como libro de consulta",
                                                                            "Arte y poesía",                                "Heidegger",      124,              20,                             0.16,                                   8,   "Abandonado",          "Ensayo literario",                      "2012",                           NA,           "2012",                                                                                                                "Leí el cap. sobre poesía",
                                                                                  "Palomar",                            "Italo Calvino",      120,              20,                             0.17,                                  NA,   "En lectura",           "Varia invención",                   "02-2020",                           NA,        "02-2020",                                                                                                            "Me lo recomendó David Miklos",
                                                                                  "El muro",                                   "Sartre",      188,              40,                             0.21,                                   6,   "Abandonado",                   "Cuentos",                     "<2015",                           NA,          "<2015",                                                                                                                                        NA,
                                                                                    "Atlas",                       "Gonçalo M. Tavares",      530,             114,                             0.22,                                 8.5,   "En lectura",          "Ensayo literario",                   "04-2020",                           NA,        "04-2020",                                                                                                                                        NA,
                                                                     "El fin de la lectura",                            "Andrés Neuman",      143,              31,                             0.22,                                  NA,     "En pausa",                   "Cuentos",                     "<2015",                           NA,          "<2015",                   "Me decepcionó Neuman en sus cuentos, son planos. A mí me gustan más los efectistas. No usa aquí su prosa encantadora.",
                                            "Revista Anthoropos, número sobre Albert Camus",                                  "VV. AA.",      222,              50,                             0.23,                                   6,   "Abandonado",         "Ensayo filosófico",                     "<2013",                           NA,          "<2013",                                                                         "No me convencieron los artículos sobre Camus en aquel entonces.",
                                                                     "Novelas y novelistas",                             "Harold Bloom",      869,             200,                             0.23,                                  8,   "En lectura",         "Crítica literaria",                     "<2015",                           NA,          "<2015",                                                                                                                                        NA,
                                                    "Borges, la pasión de una cita sin fin",                      "Lisa Block de Behar",      183,              44,                             0.24,                                   7,   "Abandonado",          "Ensayo literario",                     "<2015",                           NA,          "<2015",                                                                                                                                        NA,
                                                          "Diccionario de los sentimientos", "José Antonio Marina y Marisa López Penas",      450,             110,                             0.24,                                   8,   "En lectura",               "Diccionario",                     "<2020",                           NA,          "<2020",                                                                                                              "Me lo prestó María Mendoza",
                                                              "La escuela del aburrimiento",                              "Luigi Amara",      287,              81,                             0.28,                                   7,   "Abandonado",          "Ensayo literario",                          NA,                           NA,          "<2020",                                                                                                            "No recuerdo si fue un regalo",
                                         "Curso de redacción para escritores y periodistas",                        "Beatriz Escalante",      345,             100,                             0.29,                                 6.5,   "Abandonado",       "Libro de ejercicios",                     "<2015",                           NA,          "<2015",                                                                                                           "Lo uso como libro de consulta",
                                                                            "Teatro Vol. 2",                         "Luigi Pirandello",      205,              64,                             0.31,                                   9,     "En pausa",                    "Teatro",                      "2016",                           NA,           "2016",                                                                                                                                        NA,
                                                                       "Voces de Chernóbil",                      "Svetlana Alexiévich",      406,             128,                             0.32,                                 8.5,   "En lectura",                    "Novela",                      "2016",                           NA,           "2016",                                                                                      "Magistral forma de combinar periodismo y narrativa",
                                                                 "Historia de la filosofía",                         "Bertrand Russell",      892,             300,                             0.34,                                 8.5,   "En lectura",         "Ensayo filosófico",                          NA,                           NA,          "<2020",                                                                                                                              "Maravillso",
                                                                             "Pálido fuego",                                  "Nabokov",      308,             106,                             0.34,                                 8.5,   "En lectura",                    "Novela",                      "2017",                           NA,           "2017",                                                                                                                                        NA,
                                                                       "Me río de la plata",                             "Carlos Deday",      130,              50,                             0.38,                                   6,   "En lectura",                   "Cuentos",                   "07-2015",                           NA,        "07-2015",                                                           "Con dedicatoria de Carlos, un argentino amable, agudo y a quien admiro mucho.",
                                                                    "La rebeldía de pensar",                     "Óscar de la Borbolla",      119,              50,                             0.42,                                 6.5,     "En pausa",          "Ensayo literario",                      "2019",                           NA,           "2019",                                                                                                                                        NA,
                                                                         "Huckleberry Finn",                               "Mark Twain",      470,             200,                             0.43,                                 8.5,   "Abandonado",                    "Novela",                          NA,                           NA,           "2015", "Leí la 1ra mitad de la novela en esta hermosa edición y la 2da en una versión de biblioteca. La leí compitiendo con Éleonor, ella ganó.",
                                                                   "Nostalgia de la muerte",                      "Xavier Villaurrutia",      195,              96,                             0.49,                                 8.5,   "Abandonado",                    "Poesía",                     "<2015",                           NA,          "<2015",                                         "No me llama la atención el teatro dentro del libro. Pero Villaurrutia es mi poeta más admirado.",
                                  "Bombas de intuición y otras herramientas de pensamiento",                           "Daniel Dennett",      304,             162,                             0.53,                                   8,   "En lectura",         "Ensayo filosófico",                      "2018",                           NA,           "2018",                                                                                                                                        NA,
                                                             "Walt Whitman ya no vive aquí",                             "Eduardo Lago",      304,             168,                             0.55,                                   6,   "En lectura",          "Ensayo literario",                      "2018",                           NA,           "2018",                                                                                                                                        NA,
                                                 "De los heroes || Hombres representativos",                       "Carlyle || Emerson",      399,             225,                             0.56,                                   8,   "Abandonado",         "Ensayo filosófico",                          NA,                           NA,          "<2010",                                                                                                                                        NA,
                                                                    "Obras completas Vol 1",                             "Albert Camus",     1183,             700,                             0.59,                                   8,     "En pausa",                 "Antología",                          NA,                           NA,          "<2013",                                                                                                           "Editorial Aguilar, pasta dura",
                                                      "Si una noche de invierno un viajero",                            "Italo Calvino",      267,             180,                             0.67,                                   8,   "En lectura",                    "Novela",                      "2015",                           NA,           "2015",                                                                                                                 "Complicado de disfrutar",
                                                                    "Tolstói o Dostoievski",                           "George Steiner",      353,             255,                             0.72,                                   9,   "En lectura",          "Ensayo literario",                     "<2015",                           NA,          "<2015",                                                                                                                                        NA,
                                                                    "Obras completas Vol 2",                             "Albert Camus",     1359,            1000,                             0.74,                                   9,     "En pausa",                 "Antología",                          NA,                           NA,          "<2013",                                                                                                           "Editorial Aguilar, pasta dura",
                                                                        "Cuentos completos",                                   "Borges",      545,             460,                             0.84,                                 9.5,     "En pausa",                   "Cuentos",                          NA,                           NA,          "<2015",                                                                                                                                        NA,
                                                                "El extranjero (Ilustrado)",                             "Albert Camus",       95,              95,                                1,                                   7,    "Terminado",            "Novela gráfica",                     "<2015",                      "<2015",          "<2015",                                                                                                                                        NA,
                                                                              "Barbarismos",                            "Andrés Neuman",      130,             130,                                1,                                   7,    "Terminado",               "Diccionario",                     "<2015",                      "<2015",          "<2015",                                                                                                                                        NA,
                                                                                "Bariloche",                            "Andrés Neuman",      169,             169,                                1,                                   8,    "Terminado",                    "Novela",                     "<2015",                      "<2015",          "<2015",                                                                                                                                        NA,
                                                                    "ABC de la relatividad",                         "Bertrand Russell",      159,             159,                                1,                                   9,    "Terminado", "Divulgación de la ciencia",                      "2016",                       "2016",           "2016",                                                                 "Lo terminé cuando el señor Ricardo convalecía de cáncer en el hospital.",
                                                                             "Siete noches",                                   "Borges",      169,             169,                                1,                                   8,    "Terminado",          "Ensayo literario",                      "2014",                       "2014",           "2014",                                                                                                                                        NA,
                                                              "The garden of forking paths",                                   "Borges",       54,              54,                                1,                                 8.5,    "Terminado",                   "Cuentos",                      "2019",                       "2019",           "2019",                                                                                "Lo compré en mi 1er viaje a Inglaterra. Iba con Julieta.",
                                                                         "La vida es sueño",                     "Calderón de la Barca",      117,             117,                                1,                                 8.5,    "Terminado",                    "Teatro",                     "<2015",                      "<2015",          "<2015",                                                                                                                                        NA,
                                                          "Para entender Jorge Luis Borges",            "Christopher Domínguez Michael",       55,              55,                                1,                                   8,    "Terminado",          "Ensayo literario",                     "<2015",                      "<2015",          "<2015",                                                                                                                                        NA,
                                                                      "100 años de soledad",                   "Gabriel García Márquez",      480,             480,                                1,                                 9.5,     "Prestado",                    "Novela",                          NA,                      "<2015",          "<2015",                                                             "Lo tiene Jana quien trabaja en la cafetería de la casa del estudiante en CU",
                                                                                "Jerusalén",                       "Gonçalo M. Tavares",      225,             225,                                1,                                   8,    "Terminado",                    "Novela",                   "01-2020",                     "1-2020",        "01-2020",                                                                                                                                        NA,
                                                                  "Las ciudades invisibles",                            "Italo Calvino",      171,             171,                                1,                                 9.7,    "Terminado",                   "Cuentos",                      "2017",                       "2017",           "2016",                         "Quizá mi libro de cuentos favorito https://elblogdeluisdavid.wordpress.com/2016/05/15/los-infiernos-invisibles/",
                                                                           "Las mutaciones",                           "Jorge Comensal",      204,             204,                                1,                                   6,    "Terminado",                    "Novela",                      "2017",                       "2017",           "2017",                                                                                        "Lindo con momentos divertidos y otros aburridos.",
                                                                  "El principio del placer",                      "José Emilio Pacheco",      140,             140,                                1,                                   3,    "Terminado",                   "Cuentos",                      "2002",                       "2002",           "2002",                                                                                        "No recuerdo nada de él. Lo leí en la secundaria.",
                                                                          "Dios es redondo",                             "Juan Villoro",      223,             223,                                1,                                 6.5,    "Terminado",          "Ensayo literario",                     "<2013",                      "<2013",          "<2013",                                                                                                               "Autografiado por el autor",
                                                                      "El Señor Presidente",                    "Miguel Ángel Asturias",      408,             408,                                1,                                 7.5,    "Terminado",                    "Novela",                      "2012",                       "2012",           "2012",                                                                                                                                        NA,
                                                                           "La llama doble",                              "Octavio Paz",      165,             165,                                1,                                   8,    "Terminado",          "Ensayo literario",                      "2015",                       "2019",           "2014",                                                                                                                                        NA,
                                                                                     "Ubik",                           "Philip K. Dick",      222,             222,                                1,                                 8.5,    "Terminado",                    "Novela",                      "2014",                       "2014",           "2014",                                                                                                                                        NA,
                                                                                   "Popper",                                      "RBA",      144,             144,                                1,                                   8,    "Terminado",         "Ensayo filosófico",                      "2018",                       "2018",           "2018",                                                                                                                                        NA,
                                                                        "Waiting for Godot",                           "Samuel Beckett",       60,              60,                                1,                                   9,    "Terminado",                    "Teatro",                      "2013",                       "2013",           "2013",                                                                                                   "Fue el primer libro que leí en inglés",
                                                                                   "Proust",                           "Samuel Beckett",      120,             120,                                1,                                   9,    "Terminado",          "Ensayo literario",                   "06-2020",                    "06-2020",           "2019",                                                                                   "Terminado, No iniciado, lectura, relectura, prestado.",
                                                                         "Mientras agonizo",                         "William Faulkner",      240,             240,                                1,                                 8.5,    "Terminado",                    "Novela",                      "2016",                       "2016",           "2016",                                                                                                                                        NA,
                                                                              "Los posesos",                             "Albert Camus",      251,             251,                                1,                                   6,    "Terminado",                    "Teatro",                     "<2015",                      "<2015",          "<2015",                                                                                                                                        NA,
                                                                        "El mito de Sísifo",                             "Albert Camus",      179,             179,                                1,                                 9.5,    "Terminado",         "Ensayo filosófico",                      "2009",                       "2009",           "2009",                                                                                                                    "Mi libro de cabecera",
                                                                            "El extranjero",                             "Albert Camus",      124,             124,                                1,                                   8,    "Terminado",                    "Novela",                      "2009",                       "2009",           "2009",                                                                                                                                        NA,
                                                                                 "La caída",                             "Albert Camus",      127,             127,                                1,                                   9,    "Terminado",                    "Novela",                      "2009",                       "2009",           "2009",                                                                                                             "Mi novela favorita de Camus",
                                                                           "Homero, Iliada",                       "Alessandro Baricco",      187,             187,                                1,                                 7.5,    "Terminado",                    "Novela",                     "<2015",                      "<2015",          "<2015",                                                                                                                                        NA,
                                                                    "La aventura de pensar",                         "Fernando Savater",      301,             301,                                1,                                   7,    "Terminado",         "Ensayo filosófico",                     "<2015",                      "<2015",          "<2015",                                                                                  "Se lo regalé a mi querida Ana G. y después se lo robé.",
                                                     "Cervantes o la crítica de la lectura",                           "Carlos Fuentes",      113,             113,                                1,                                 9.5,    "Terminado",          "Ensayo literario",                     "<2020",                       "2016",          "<2020",                                                                              "El ensayo que más me ha gustado. Lo he leído varias veces.",
                                                                                 "Arrecife",                             "Juan Villoro",      239,             239,                                1,                                   7,    "Terminado",                    "Novela",                     "<2020",                      "<2020",          "<2020",                                                                                                                                        NA,
                                                                          "Poesía completa",                            "César Vallejo",       NA,              NA,                               NA,                                  NA,  "No iniciado",                    "Poesía",                          NA,                           NA,           "2015",                                                                                                                          "Sigue empacado",
                                                                      "Lituma en los Ándes",                       "Mario Vargas Llosa",       NA,              NA,                               NA,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,          "<2015",                                                                                                                          "Sigue empacado",
                                                                          "Gente que baila",                          "Norberto Soares",       NA,              NA,                               NA,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,          "<2015",                                                                                                                          "Sigue empacado",
  "Trilogía americana: Me casé con un comunitsa || La mancha humana || Pastorela americana",                             "Phillip Roth",       NA,              NA,                               NA,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,          "<2015",                                          "Sigue empacado. Vi la película de La mancha humana protagonizada por Nicole Kidman, buenísima.",
                                                                     "Evangelios apócrifos",                                  "VV. AA.",       NA,              NA,                               NA,                                  NA,  "No iniciado",                "Evangelios",                          NA,                           NA,          "<2020",                                                                                                                   "Debería leerlo pronto",
                                                                    "Las palmeras salvajes",                         "William Faulkner",       NA,              NA,                               NA,                                  NA,  "No iniciado",                    "Novela",                          NA,                           NA,          "<2020",                                                                                                   "Sigue empacado. Traducción de Borges."
  )

df <- clean_names(df)
df <- df %>% rename(nota_o_link = n_ota_o_link)

###### gráficas exploratorias ------
hist(df$porcentaje_de_avance_de_lectura)

df %>% 
  ggplot(aes(x = porcentaje_de_avance_de_lectura))+
  geom_histogram()



df %>% select(genero, paginas_leidas) %>% 
  group_by(genero) %>%
  summarise(pags_leidas_por_genero = sum(na.omit(paginas_leidas))) %>% 
  
  ggplot(aes(x = reorder(genero, pags_leidas_por_genero), 
             y = pags_leidas_por_genero,
             label = pags_leidas_por_genero))+
  geom_col()+
  geom_text(color = "white", hjust = 1)+
  coord_flip()+
  
  labs(title = "Páginas leídas por tipo de género", 
       subtitle = "Colección personal", 
       y = "Páginas leídas", x = " ",
       caption = "[muestra de los primeros 100 libros capturados]\nElaboración: @1LuisDavid")


  
  
df %>%
  select(genero, estado_actual) %>%
  group_by(genero) %>%
  count(estado_actual) %>% 
   
  ggplot(aes(x = reorder(genero, n), y = n, label = n)) +
  geom_col()+
  geom_text(color = "white", hjust = 1, size = 3)+
  coord_flip()+
  facet_wrap(~ estado_actual)+
  
  labs(title = "Status de lectura por tipo de género", 
       subtitle = "Colección personal", 
       y = "Número de libros", x = " ",
       caption = "[muestra de los primeros 100 libros capturados]\nElaboración: @1LuisDavid")


  


df %>% mutate(autor_y_titulo = str_c(autor, titulo_del_libro, sep ="||")) %>% 
  ggplot(aes(x = reorder(autor_y_titulo, porcentaje_de_avance_de_lectura),
             y = porcentaje_de_avance_de_lectura, 
             label = autor_y_titulo))+
  geom_col(fill = "black")+
  geom_text(color = "white", size = 3)+
  coord_flip()+
  
  scale_y_continuous(limits = c(-.12, 1.2), breaks = seq(0, 1, .1))+
  
  labs(title = "Porcentaje de avance de lectura, por libro", 
       subtitle = "Colección personal", 
       y = "Porcentaje de avnce", x = " ",
       caption = "[muestra de los primeros 100 libros capturados]\nElaboración: @1LuisDavid")+
  
  theme(axis.text.y = element_text(size = 0),
        panel.background = element_rect(fill = "gray50"),
        panel.grid.major = element_line(size = 0),
        panel.grid.minor = element_line(size = 0),
        axis.ticks.y = element_line(linetype = "blank"))+
  
  ggsave("Porcentaje de avance de lectura, por libro.png",
         width = 12, height = 20, dpi = 200)

  

names(df)







  ###### comenzar el boostrap ------
df1 <-
df %>% 
  mutate(pct_lectura = 
           replace_na(porcentaje_de_avance_de_lectura, 0))
          
avance_medio_muestral <- mean(df1$pct_lectura)

set.seed(567)
sample(df1$pct_lectura, replace = T)

bootstrap <-
replicate(n = 10000, sample(df1$pct_lectura, replace = T))

dim(bootstrap)


# MARGIN 1 Es aplicar a las filas || MARGIN 2 es aplicar a las columnas
promedios_muestrales <- apply(bootstrap, MARGIN = 2, FUN = mean)

library(nortest)
lillie.test(promedios_muestrales) #lillie.test es para establecer normalidad en muestras n > 50

library(PerformanceAnalytics)
kurtosis(promedios_muestrales, na.rm = FALSE,
  method = "moment")

qqnorm(promedios_muestrales)
qqline(promedios_muestrales)

plot(density(promedios_muestrales))
hist(promedios_muestrales)


#obtener la error estandar
se <- sqrt(sum((promedios_muestrales - avance_medio_muestral)^2) / ncol(bootstrap))



ggplot()+
  geom_histogram(aes(x = promedios_muestrales), bins = 15, color = "grey70")+
  geom_vline(xintercept = avance_medio_muestral, size = 1, color = "red")+
  # geom_vline(xintercept = mean(promedios_muestrales), size = 1, color = "blue")+
  
  annotate("text", x =.44, y = 2000,
           label= "Promedio de avance de lectura\nde la muestra original: .413",
           color= "red", size = 3)+
  
  annotate("text", x =.36, y = 1750,
           label= "Intervalo de confianza al 95%:\nde .3309 a .4950",
           color= "darkblue", size = 3)+
   
  geom_vline(xintercept = .3309, size = 1, color = "darkblue")+ #Intervalo al 95%
  geom_vline(xintercept = .4950, size = 1, color = "darkblue")+

  # geom_vline(xintercept = .3398, size = 1, color = "darkred")+ #Intervalo al 90%
  # geom_vline(xintercept = .4785, size = 1, color = "darkred")+
  
  scale_x_continuous(breaks = seq(.28, .6, .02))+
   
  labs(title = "Histograma del remuestreo de 10,000 repeticiones con reemplazo", 
       subtitle = "Se puede ver que de las 10,000 (re)muestras, 2,000 tienen un \nPorcentaje promedio de avance de lectura entre.397 y .419", 
       y = "Número de (re)muestras", x = "Porcentaje promedio de avance de lectura",
       caption = "[muestra de los primeros 100 libros capturados]\nElaboración: @1LuisDavid")





# Intervalo de confianza al 95% \\ en este intervalo debería de estar el valor poblacional
avance_medio_muestral + c(-1,1)*qnorm(.975)*se


mean(promedios_muestrales)
sd(promedios_muestrales)

library(visualize)
#¿Cuál es la probabilidad de obtener una muestra con una media <= .35 en 
# porcentaje de lectura, tomada de una distribución normal con una media 
# igual al promedio de las medias muestrales y una SD igual a la SD de los 
# promedios muestrales? R = .0788
visualize.norm(stat = .35,
               mu = mean(promedios_muestrales),
               sd = sd(promedios_muestrales), 
               section = "lower")

pnorm(.35,
      mean = mean(promedios_muestrales),
      sd =  sd(promedios_muestrales),
      lower.tail = T)


#Ahora una probabilidad en intervalo usando mis datos obtenidos manualmente: 
# confirmo que lo hice bien
visualize.norm(stat = c(.3309, .4950),
               mu = mean(promedios_muestrales),
               sd = sd(promedios_muestrales), 
               section = "bounded")

pnorm(.3265,
      mean = mean(promedios_muestrales),
      sd =  sd(promedios_muestrales),
      lower.tail = T) -
  pnorm(.4918,
      mean = mean(promedios_muestrales),
      sd =  sd(promedios_muestrales),
      lower.tail = T)

# El t.test sirve para comparar las medias de las muestras con la media poblacional,
# que en este caso, la inventé en .40
t.test(promedios_muestrales, mu = .40)


##### El otro boostrap -------------------------------------------------------





