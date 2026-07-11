-- PARAMÈTRES RESTAURANT Kiros
CREATE TABLE IF NOT EXISTS public.parametres (
  id             INTEGER PRIMARY KEY DEFAULT 1 CHECK (id = 1),
  nom_restaurant TEXT DEFAULT 'Kiros',
  logo_url       TEXT,
  adresse        TEXT DEFAULT '22, Avenue Rép. du Tchad, Gombe, Kinshasa',
  telephone      TEXT DEFAULT '+243 999 123 456',
  whatsapp       TEXT DEFAULT '243999123456',
  horaires       TEXT DEFAULT 'Tous les jours 08h00 - 22h00',
  updated_at     TIMESTAMPTZ DEFAULT NOW()
);
INSERT INTO public.parametres (id, nom_restaurant, adresse, telephone, whatsapp, horaires)
VALUES (1, 'Kiros', '22, Avenue Rép. du Tchad, Gombe, Kinshasa', '+243 999 123 456', '243999123456', 'Tous les jours 08h00 - 22h00')
ON CONFLICT (id) DO NOTHING;
CREATE TRIGGER trg_parametres_updated_at BEFORE UPDATE ON public.parametres FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();
ALTER TABLE public.parametres ENABLE ROW LEVEL SECURITY;
CREATE POLICY "param_select" ON public.parametres FOR SELECT USING (true);
CREATE POLICY "param_update" ON public.parametres FOR UPDATE USING (auth.uid() IN (SELECT id FROM public.admin_profiles));
SELECT 'Kiros — paramètres OK' AS status;
