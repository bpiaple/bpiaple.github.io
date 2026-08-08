---
name: Dossier de Qualifications — Brice Piaple Dada
description: Portfolio personnel comme dossier officiel de qualifications : certificats, sceaux, parchemin et lettrage gravé.
colors:
  paper: "#f5f1e6"
  paper-raised: "#faf7ee"
  paper-muted: "#ece5d2"
  ink: "#1b2233"
  ink-soft: "#4b5264"
  seal: "#8a1c1c"
  seal-deep: "#6b1414"
  gold: "#b8943f"
  gold-deep: "#8a6d1f"
  paper-dark: "#14161f"
  paper-raised-dark: "#191c27"
  paper-muted-dark: "#1d2130"
  ink-dark: "#e8e1cf"
  ink-soft-dark: "#a9a391"
  seal-dark: "#d97a7a"
  seal-deep-dark: "#e8a0a0"
  gold-dark: "#d4b45f"
typography:
  display:
    fontFamily: "Bodoni Moda, Georgia, Times New Roman, serif"
    fontSize: "clamp(2.7rem, 6vw, 4.9rem)"
    fontWeight: 800
    lineHeight: 1.02
    letterSpacing: "-0.015em"
  headline:
    fontFamily: "Bodoni Moda, Georgia, serif"
    fontSize: "clamp(1.9rem, 3.6vw, 2.7rem)"
    fontWeight: 800
    lineHeight: 1.15
  title:
    fontFamily: "Bodoni Moda, Georgia, serif"
    fontSize: "1.3rem"
    fontWeight: 700
    lineHeight: 1.3
  body:
    fontFamily: "Source Serif 4, Georgia, serif"
    fontSize: "1.05rem"
    fontWeight: 400
    lineHeight: 1.7
  label:
    fontFamily: "IBM Plex Mono, ui-monospace, monospace"
    fontSize: "0.72-0.8rem"
    fontWeight: 600
    letterSpacing: "0.12-0.22em"
rounded:
  sm: "2px"
  md: "2px"
spacing:
  xs: "0.8rem"
  sm: "1.4rem"
  md: "2rem"
  lg: "4.5rem"
components:
  button-seal:
    backgroundColor: "{colors.seal}"
    textColor: "{colors.paper-raised}"
    rounded: "{rounded.sm}"
    padding: "0.85rem 1.5rem"
  button-seal-hover:
    backgroundColor: "{colors.seal-deep}"
    textColor: "{colors.paper-raised}"
    rounded: "{rounded.sm}"
    padding: "0.85rem 1.5rem"
  button-ink:
    backgroundColor: "transparent"
    textColor: "{colors.ink}"
    rounded: "{rounded.sm}"
    border: "1px solid var(--rule)"
    padding: "0.85rem 1.5rem"
  tag:
    backgroundColor: "{colors.paper}"
    textColor: "{colors.ink}"
    rounded: "{rounded.sm}"
    border: "1px solid var(--rule)"
    padding: "0.28rem 0.6rem"
---

# Design System: Dossier de Qualifications

## Overview

**Creative North Star: "Le Dossier de Qualifications"**

Le portfolio est traité comme un dossier administratif officiel : chaque compétence, expérience, certification et projet est une pièce datée, scellée et signée, présentée sur du parchemin froid sous une encre marine profonde. Le recruteur n'ouvre pas un site CV — il ouvre un dossier dont chaque document est une preuve.

La première vue est un certificat plein cadre : double filet, monogramme BP doré, portrait encadré, nom gravé en Bodoni Moda, sceau rosacé qui s'imprime à l'arrivée, ligne de signature. Le reste du site décline le monde : registre des services (timeline), registre des chiffres (stats), mesures graduées (compétences), fiches (contact), catalogue (projets).

**Key Characteristics:**
- Angles francs : aucune carte arrondie, rayon de 2px maximum — le papier ne s'arrondit pas.
- L'encre parle d'abord : textes sombres sur parchemin, jamais de gris dérivé — la couleur secondaire est l'encre teintée.
- Le sceau cramoisi est réservé : actions, références de pièces, dates, liens — jamais comme décor général.
- L'or est un instrument de filet : hairlines, losanges, monogramme — jamais un texte courant.
- Un seul moment de motion : le sceau qui s'imprime (scale + rotation + fade), réduit à zéro sous `prefers-reduced-motion`.

## Colors

Palette d'archives : parchemin froid, encre marine, sceau cramoisi, or pour les filets. Le mode sombre est « le dossier lu sous lampe » : même vocabulaire, papier sombre, encre claire, sceau éclairci pour garder le contraste.

### Primary
- **Sceau Cramoisi** (#8a1c1c, sombre #d97a7a): L'action et l'attestation. Boutons primaires, référence des pièces, dates de registre, liens, bordures de focus, tampons de tags au survol. Le sceau sombre (#d97a7a) est calculé pour ≥4.5:1 sur le papier sombre (#14161f).
- **Sceau Profond** (#6b1414, sombre #e8a0a0): État survol du bouton-sceau et des liens.

### Secondary
- **Or d'Archive** (#b8943f, sombre #d4b45f): Les filets, losanges de fin de pièce, hairlines de mesure. Décoratif uniquement.
- **Or Gravure** (#8a6d1f, sombre #d4b45f): Le monogramme BP et tout or porteur de texte — choisi pour ≥3:1 sur le parchemin (4.34:1 réel).

### Neutral
- **Parchemin** (#f5f1e6, sombre #14161f): Fond de page, avec grain SVG en bruit fractal (opacité 4.5 %).
- **Parchemin Souleve** (#faf7ee, sombre #191c27): Surface des documents (certificat, cartes, fiches).
- **Parchemin Froissé** (#ece5d2, sombre #1d2130): Pistres de mesure, fonds intermédiaires.
- **Encre Marine** (#1b2233, sombre #e8e1cf): Texte courant et titres.
- **Encre Teintée** (#4b5264, sombre #a9a391): Texte secondaire — teintée de l'encre, jamais grise. 6.92:1 en clair, 7.4:1 en sombre.

### Named Rules
**La Règle du Sceau.** Le cramoisi est la couleur de l'acte : actions, preuves, dates, liens. Il ne colore jamais un fond de section entier ni un dégradé décoratif.
**La Règle du Papier.** Chaque surface est un document : angles francs, filet fin, parchemin. Pas de cartes arrondies, pas de verre, pas de dégradés de fond.
**La Règle du Contraste Sombre.** En mode sombre, le sceau passe à #d97a7a — jamais #8a1c1c, qui tombe sous 4.5:1 sur le papier sombre.

## Typography

**Display Font:** Bodoni Moda (avec Georgia, Times New Roman, serif)
**Body Font:** Source Serif 4 (avec Georgia, serif)
**Label/Mono Font:** IBM Plex Mono (avec ui-monospace, monospace)

**Character:** Lettrage gravé pour les titres — une Didone à fort contraste qui rappelle la gravure des diplômes ; une serif textuelle calme et lisible pour la lecture ; un mono administratif pour tout ce qui est référence, date, mesure ou mention. Le contraste des trois voix est le monde lui-même.

### Hierarchy
- **Display** (800, clamp(2.7rem, 6vw, 4.9rem), 1.02): Le nom dans le certificat. Jamais ailleurs.
- **Headline** (800, clamp(1.9rem, 3.6vw, 2.7rem), 1.15): Les titres de pièces (Mes Compétences, Expérience Professionnelle...).
- **Title** (700, 1.3rem, 1.3): Titres de documents (cartes, projets, compétences).
- **Body** (400, 1.05rem, 1.7): Texte courant, mesure 66ch max dans le certificat.
- **Label** (600, 0.72-0.8rem, 1.6, lettres espacées 0.12-0.22em, MAJUSCULES): Références de pièces, dates, champs, numéros de statistiques, footer, nav.

### Named Rules
**La Règle Gravée.** Bodoni Moda ne sert qu'aux titres et au monogramme. Jamais en texte courant — la gravure se respecte de loin.
**La Règle de l'Administratif.** Le mono est la voix du dossier : s'il dit une date, une référence, une mesure ou un tampon, c'est du IBM Plex Mono.

## Layout

Grilles de documents : `repeat(auto-fit, minmax(250px, 1fr))` pour les compétences, `minmax(280px, 1fr)` pour l'exploration, `minmax(320px, 1fr)` pour le catalogue de projets. Le certificat utilise une grille portrait 4/5 (minmax(150px, 230px)) + texte ; les pages sans portrait passent en colonne unique centrée via `.cert-grid:not(:has(.cert-photo))`.

Chaque section est une pièce : en-tête avec référence mono (Pièce N° 1), filet doré terminé par un losange, titre Bodoni, sous-titre. Rythme vertical : 4.5rem au-dessus d'une pièce, plus d'espace au-dessus des titres qu'en dessous. Le certificat porte un double filet (inset 0.55rem, second filet à 0.97 d'échelle).

Responsive : à 820px le certificat passe en colonne centrée, les stats en deux colonnes resserrées, les fiches de contact en une colonne ; à 576px les boutons deviennent pleine largeur, le monogramme disparaît, les pièces resserrent à 3.2rem.

## Elevation & Depth

Profondeur par filets et ombres de papier : les documents portent une ombre courte décalée avec flou (`0 1px 2px` + `0 14px 30px -20px`), qui s'amplifie au survol (`0 22px 44px -22px`). Le double filet du certificat et les hairlines créent la profondeur d'embossage. Pas de tonal layering coloré, pas de verre.

### Shadow Vocabulary
- **Feuille de papier** (`box-shadow: 0 1px 2px rgba(27,34,51,0.07), 0 14px 30px -20px rgba(27,34,51,0.38)`): Les documents au repos (certificat, cartes, fiches, stats).
- **Feuille soulevée** (`box-shadow: 0 1px 2px rgba(27,34,51,0.08), 0 22px 44px -22px rgba(27,34,51,0.45)`): Survol des documents et des boutons. Le déplacement en Y (-2px) accompagne.

### Named Rules
**La Règle du Papier Souleve.** L'ombre n'apparaît que comme réponse à l'état (survol, focus). Au repos, le document ne flotte jamais.

## Shapes

Le monde du papier ne s'arrondit pas : rayon de 2px partout, annulé en CSS (`border-radius: 0` bootstrap surclassé). Les formes récurrentes sont les losanges (tampons de timeline, extrémité des filets) et le carré. Le sceau est une rosace circulaire SVG à dents périphériques, anneaux concentriques et monogramme — le seul élément rond du système, et il est signe, pas surface. Les portraits sont encadrés dans un cadre photo 4/5 avec passe-partout.

## Components

### Buttons
- **Shape:** angles francs (2px), mono MAJUSCULES, lettres espacées 0.14em.
- **Primary (Sceau):** fond #8a1c1c (sombre #d97a7a), texte parchemin soulevé, padding 0.85rem 1.5rem, filet de la couleur du fond.
- **Hover / Focus:** fond sceau profond, ombre de feuille soulevée ; focus global outline 2px sceau, offset 2px.
- **Secondary (Encre):** transparent, filet fin, texte encre ; survol : fond parchemin froissé et filet pleine encre.

### Tags
- **Style:** tampons — mono 0.75rem, MAJUSCULES, fond parchemin, filet fin, aucun rayon. Survole : filet et texte passe au sceau.
- **State:** pas de variante sélectionnée — pure étiquetage.

### Cards / Containers (doc-card, project-card, skill-card)
- **Corner Style:** francs (2px).
- **Background:** parchemin soulevé (#faf7ee, sombre #191c27).
- **Shadow Strategy:** feuille de papier, feuille soulevée au survol (voir Elevation).
- **Border:** filet fin 1px var(--rule) ; au survol, filet teinté sceau et un liseré or apparaît au sommet (2px).
- **Internal Padding:** 1.7rem 1.8rem (cartes), 2rem (projets).

### Navigation
- **Style:** mono 0.82rem, MAJUSCULES, lettres espacées 0.06em, sur fond parchemin avec filet bas 1px.
- **Default / Hover / Active:** liens encre teintée ; au survol et à l'actif, texte sceau + filet or qui se déploie (scaleX de gauche à droite).
- **Mobile:** toggler à filet fin, menu empilé.

### Le Certificat (composant signature)
Document plein cadre à double filet : en-tête avec référence mono (Dossier N° BP-2026-001 · Établi à Rimouski) et monogramme BP en or gravure ; grille portrait 4/5 encadré + nom Bodoni gravé, rôle mono sceau, description 66ch, trois sceaux d'action ; pied avec ligne de signature et sceau rosacé animé (seal-in : scale 2.1 → 0.94, rotation -24° → 0°, cubic-bezier(0.22,1,0.36,1), 0.9s, délai 0.25s, désactivé sous prefers-reduced-motion).

### Mesures (barres de compétences)
Piste à filets gradués (repeating-linear-gradient 25px) avec remplissage sceau hachuré terminé par un trait or de 2px ; étiquette mono avec valeur en pourcentage. Jamais une barre arrondie dégradée.

## Do's and Don'ts

### Do:
- **Do** utiliser le sceau pour toute action primaire et toute date/référence — c'est la voix de l'acte.
- **Do** écrire toute mention administrative (pièces, dates, champs, stats) en IBM Plex Mono MAJUSCULES espacé.
- **Do** garder les angles francs : le papier ne s'arrondit pas (rayon max 2px).
- **Do** vérifier le contraste en mode sombre : le sceau y est #d97a7a, jamais #8a1c1c.
- **Do** utiliser le mono avec retenue : dates, références, mesures, tampons — pas de costumes « tech » gratuits.

### Don't:
- **Don't** utiliser d'emojis comme icônes — le système est bootstrap-icons, dans des cadres 44px.
- **Don't** utiliser de dégradés de texte ou de fond — l'encre est pleine.
- **Don't** mettre d'eyebrow/kicker au-dessus des titres — le titre porte seul, les Pièce N° portent la métaphore du dossier.
- **Don't** arrondir, illuminer au néon ou ajouter du verre : le monde est parchemin, encre et sceau.
- **Don't** fabriquer du contenu : chaque chiffre, attestation et date est une vérité vérifiable du dossier.
