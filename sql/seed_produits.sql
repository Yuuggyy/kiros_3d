-- ── SEED PRODUITS : Kiros ──────────────────────────────
INSERT INTO public.restaurants (nom, slug)
VALUES ('Kiros', 'kiros')
ON CONFLICT (slug) DO NOTHING;

DO $$
DECLARE rid UUID;
BEGIN
  SELECT id INTO rid FROM public.restaurants WHERE slug = 'kiros';
  INSERT INTO public.produits (restaurant_id, nom, description, prix, categorie, disponible) VALUES
    (rid, 'Petit-dejeuner Complet', 'Oeufs, pain, fromage, jus, cafe', 12.00, 'Petit-dejeuner', true),
    (rid, 'Oeufs Brouilles et Fatteh', 'Oeufs brouilles, pain pita, fatteh', 8.00, 'Petit-dejeuner', true),
    (rid, 'Croissant Beurre', NULL, 1.00, 'Petit-dejeuner', true),
    (rid, 'Croissant Jambon-Fromage', NULL, 3.00, 'Petit-dejeuner', true),
    (rid, 'Cossas ail et piment', 'Crevettes sautees a l ail', 18.00, 'Entrees', true),
    (rid, 'Carpaccio de Boeuf', 'Roquette, parmesan, huile d olive', 24.00, 'Entrees', true),
    (rid, 'Salade Cesar', 'Poulet, parmesan, croutons, sauce Cesar', 20.00, 'Entrees', true),
    (rid, 'Salade Nicoise', 'Thon, oeufs, olives, tomates', 22.00, 'Entrees', true),
    (rid, 'Hummus Maison', 'Pois chiches, tahini, citron, huile', 10.00, 'Entrees', true),
    (rid, 'Spaghetti Bolognaise', 'Viande hachee, sauce tomate maison', 18.00, 'Pates et Risotto', true),
    (rid, 'Penne Carbonara', 'Lardons, creme, parmesan', 19.00, 'Pates et Risotto', true),
    (rid, 'Tagliatelles fruits de mer', 'Crevettes, calamars, sauce tomate', 24.00, 'Pates et Risotto', true),
    (rid, 'Risotto Champignons', 'Champignons sauvages, parmesan, beurre', 22.00, 'Pates et Risotto', true),
    (rid, 'Pizza Margherita', 'Tomate, mozzarella, basilic', 25.00, 'Pizzas', true),
    (rid, 'Pizza 4 Fromages', 'Mozzarella, gorgonzola, parmesan, chevre', 28.00, 'Pizzas', true),
    (rid, 'Pizza Fruits de mer', 'Crevettes, calamars, sauce tomate', 30.00, 'Pizzas', true),
    (rid, 'Pizza Jambon-Champignons', NULL, 26.00, 'Pizzas', true),
    (rid, 'Steak Grille', '250g, frites maison, salade', 28.00, 'Viandes', true),
    (rid, 'Cotes d agneau', 'Grillees, romarin, pommes de terre', 32.00, 'Viandes', true),
    (rid, 'Poulet Roti aux herbes', 'Demi-poulet, legumes rotis', 20.00, 'Viandes', true),
    (rid, 'Boulettes viande sauce tomate', 'Boulettes maison, sauce tomate fraiche', 15.00, 'Viandes', true),
    (rid, 'Tiramisu Maison', NULL, 10.00, 'Desserts', true),
    (rid, 'Creme Brulee', NULL, 9.00, 'Desserts', true),
    (rid, 'Panna Cotta', 'Coulis de fruits rouges', 9.00, 'Desserts', true),
    (rid, 'Cafe Espresso', NULL, 3.00, 'Boissons', true),
    (rid, 'Cappuccino', NULL, 5.00, 'Boissons', true),
    (rid, 'Jus de Fruit Frais', 'Mangue, passion, orange', 6.00, 'Boissons', true),
    (rid, 'Eau Minerale', '75cl', 3.00, 'Boissons', true)
  ON CONFLICT DO NOTHING;
END $$;
