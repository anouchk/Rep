# Rep
Pour un article listant les <a href="https://recognition.webofscience.com/awards/highly-cited/2020/">Highly cited researchers 2020</a>, c'est-à-dire les chercheurs dont les publications scientifiques sont les plus citées par leurs pairs dans le monde, j'ai récupéré la liste des 160 noms français (plus exactement 158, car 2 chercheurs qui sont dans 2 catégories à la fois : Philippe Ciais et Guido Kroemer).
Mais tout était structuré en une seule colonne, avec 5 lignes par chercheur concerant son nom, sa catégorie, son affiliation primaire, son affiliation secondaire et son profil. J'avais besoin de n'avoir qu'une ligne parchercheur, avec ces 5 information réparties dans 5 colonnes.
Un dcast bête et méchant, donc, dans R. Mais comment faire un dcast sans colonne id ? 

Avec la fonction rep, j'ai pu créer une colonne id qui pour les 5 lignes d'une variable donnée, me mettra le même id.

