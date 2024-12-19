#import "@preview/fontawesome:0.1.0": *

//------------------------------------------------------------------------------
// Style
//------------------------------------------------------------------------------

// const color
#let color-darknight = rgb("#131A28")
#let color-darkgray = rgb("#333333")
#let color-middledarkgray = rgb("#414141")
#let color-gray = rgb("#5d5d5d")
#let color-lightgray = rgb("#999999")

// Default style
#let color-accent-default = rgb("#dc3522")
#let font-header-default = ("Roboto", "Arial", "Helvetica", "Dejavu Sans")
#let font-text-default = ("Source Sans Pro", "Arial", "Helvetica", "Dejavu Sans")
#let align-header-default = center

// User defined style
#let color-accent = rgb("000fff")
#let font-header = font-header-default
#let font-text = font-text-default

//------------------------------------------------------------------------------
// Helper functions
//------------------------------------------------------------------------------

// icon string parser

#let parse_icon_string(icon_string) = {
  if icon_string.starts-with("fa ") [
    #let parts = icon_string.split(" ")
    #if parts.len() == 2 {
      fa-icon(parts.at(1), fill: color-darknight)
    } else if parts.len() == 3 and parts.at(1) == "brands" {
      fa-icon(parts.at(2), fa-set: "Brands", fill: color-darknight)
    } else {
      assert(false, "Invalid fontawesome icon string")
    }
  ] else if icon_string.ends-with(".svg") [
    #box(image(icon_string))
  ] else {
    assert(false, "Invalid icon string")
  }
}

// contaxt text parser
#let unescape_text(text) = {
  // This is not a perfect solution
  text.replace("\\", "").replace(".~", ". ")
}

// layout utility
#let __justify_align(left_body, right_body) = {
  block[
    #box(width: 4fr)[#left_body]
    #box(width: 1fr)[
      #align(right)[
        #right_body
      ]
    ]
  ]
}

#let __justify_align_3(left_body, mid_body, right_body) = {
  block[
    #box(width: 1fr)[
      #align(left)[
        #left_body
      ]
    ]
    #box(width: 1fr)[
      #align(center)[
        #mid_body
      ]
    ]
    #box(width: 1fr)[
      #align(right)[
        #right_body
      ]
    ]
  ]
}

/// Right section for the justified headers
/// - body (content): The body of the right header
#let secondary-right-header(body) = {
  set text(
    size: 10pt,
    weight: "thin",
    style: "italic",
    fill: color-accent,
  )
  body
}

/// Right section of a tertiaty headers. 
/// - body (content): The body of the right header
#let tertiary-right-header(body) = {
  set text(
    weight: "light",
    size: 9pt,
    style: "italic",
    fill: color-gray,
  )
  body
}

/// Justified header that takes a primary section and a secondary section. The primary section is on the left and the secondary section is on the right.
/// - primary (content): The primary section of the header
/// - secondary (content): The secondary section of the header
#let justified-header(primary, secondary) = {
  set block(
    above: 0.7em,
    below: 0.7em,
  )
  pad[
    #__justify_align[
      #set text(
        size: 12pt,
        weight: "bold",
        fill: color-darkgray,
      )
      #primary
    ][
      #secondary-right-header[#secondary]
    ]
  ]
}

/// Justified header that takes a primary section and a secondary section. The primary section is on the left and the secondary section is on the right. This is a smaller header compared to the `justified-header`.
/// - primary (content): The primary section of the header
/// - secondary (content): The secondary section of the header
#let secondary-justified-header(primary, secondary) = {
  __justify_align[
     #set text(
      size: 10pt,
      weight: "regular",
      fill: color-gray,
    )
    #primary
  ][
    #tertiary-right-header[#secondary]
  ]
}

//------------------------------------------------------------------------------
// Header
//------------------------------------------------------------------------------

#let create-header-name(
  firstname: "",
  lastname: "",
) = {
  
  pad(bottom: 5pt)[
    #block[
      #set text(
        size: 32pt,
        style: "normal",
        font: (font-header),
      )
      #text(fill: color-gray, weight: "thin")[#firstname]
      #text(weight: "bold")[#lastname]
    ]
  ]
}

#let create-header-position(
  position: "",
) = {
  set block(
      above: 0.75em,
      below: 0.75em,
    )
  
  set text(
    color-accent,
    size: 9pt,
    weight: "regular",
  )
    
  smallcaps[
    #position
  ]
}

#let create-header-address(
  address: ""
) = {
  set block(
      above: 0.75em,
      below: 0.75em,
  )
  set text(
    color-lightgray,
    size: 9pt,
    style: "italic",
  )

  block[#address]
}

#let create-header-contacts(
  contacts: (),
) = {
  let separator = box(width: 2pt)
  if(contacts.len() > 1) {
    block[
      #set text(
        size: 9pt,
        weight: "regular",
        style: "normal",
      )
      #align(horizon)[
        #for contact in contacts [
          #set box(height: 9pt)
          #box[#parse_icon_string(contact.icon) #link(contact.url)[#contact.text]]
          #separator
        ]
      ]
    ]
  }
}

#let create-header-info(
  firstname: "",
  lastname: "",
  position: "",
  address: "",
  contacts: (),
  align-header: center
) = {
  align(align-header)[
    #create-header-name(firstname: firstname, lastname: lastname)
    #create-header-position(position: position)
    #create-header-address(address: address)
    #create-header-contacts(contacts: contacts)
  ]
}

#let create-header-image(
  profile-photo: ""
) = {
  if profile-photo.len() > 0 {
    block(
      above: 15pt,
      stroke: none,
      radius: 9999pt,
      clip: true,
      image(
        fit: "contain",
        profile-photo
      )
    ) 
  }
}

#let create-header(
  firstname: "",
  lastname: "",
  position: "",
  address: "",
  contacts: (),
  profile-photo: "",
) = {
  if profile-photo.len() > 0 {
    block[
      #box(width: 5fr)[
        #create-header-info(
          firstname: firstname,
          lastname: lastname,
          position: position,
          address: address,
          contacts: contacts,
          align-header: left
        )
      ]
      #box(width: 1fr)[
        #create-header-image(profile-photo: profile-photo)
      ]
    ]
  } else {
    
    create-header-info(
      firstname: firstname,
      lastname: lastname,
      position: position,
      address: address,
      contacts: contacts,
      align-header: center
    )

  }
}

//------------------------------------------------------------------------------
// Resume Entries
//------------------------------------------------------------------------------

#let resume-item(body) = {
  set text(
    size: 10pt,
    style: "normal",
    weight: "light",
    fill: color-darknight,
  )
  set par(leading: 0.65em)
  set list(indent: 1em)
  body
}

#let resume-entry(
  title: none,
  location: "",
  date: "",
  description: ""
) = {
  pad[
    #justified-header(title, location)
    #secondary-justified-header(description, date)
  ]
}

//------------------------------------------------------------------------------
// Resume Template
//------------------------------------------------------------------------------

#let resume(
  title: "CV",
  author: (:),
  date: datetime.today().display("[month repr:long] [day], [year]"),
  profile-photo: "",
  body,
) = {
  
  set document(
    author: author.firstname + " " + author.lastname,
    title: title,
  )
  
  set text(
    font: (font-text),
    size: 11pt,
    fill: color-darkgray,
    fallback: true,
  )
  
  set page(
    paper: "a4",
    margin: (left: 15mm, right: 15mm, top: 10mm, bottom: 10mm),
    footer: [
      #set text(
        fill: gray,
        size: 8pt,
      )
      #__justify_align_3[
        #smallcaps[#date]
      ][
        #smallcaps[
          #author.firstname
          #author.lastname
          #sym.dot.c
          CV
        ]
      ][
        #counter(page).display()
      ]
    ],
  )
  
  // set paragraph spacing

  set heading(
    numbering: none,
    outlined: false,
  )
  
  show heading.where(level: 1): it => [
    #set block(
      above: 1.5em,
      below: 1em,
    )
    #set text(
      size: 16pt,
      weight: "regular",
    )
    
    #align(left)[
      #text[#strong[#text(color-accent)[#it.body.text.slice(0, 3)]#text(color-darkgray)[#it.body.text.slice(3)]]]
      #box(width: 1fr, line(length: 100%))
    ]
  ]
  
  show heading.where(level: 2): it => {
    set text(
      color-middledarkgray,
      size: 12pt,
      weight: "thin"
    )
    it.body
  }
  
  show heading.where(level: 3): it => {
    set text(
      size: 10pt,
      weight: "regular",
      fill: color-gray,
    )
    smallcaps[#it.body]
  }
  
  // Contents
  create-header(firstname: author.firstname,
                lastname: author.lastname,
                position: author.position,
                address: author.address,
                contacts: author.contacts,
                profile-photo: profile-photo,)
  body
}

// Typst custom formats typically consist of a 'typst-template.typ' (which is
// the source code for a typst template) and a 'typst-show.typ' which calls the
// template's function (forwarding Pandoc metadata values as required)
//
// This is an example 'typst-show.typ' file (based on the default template  
// that ships with Quarto). It calls the typst function named 'article' which 
// is defined in the 'typst-template.typ' file. 
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-template.typ' entirely. You can find
// documentation on creating typst templates here and some examples here:
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates

#show: resume.with(
  title: [CV de Brice Piaple Dada],
  author: (
    firstname: unescape_text("Brice"),
    lastname: unescape_text("Piaple Dada"),
    address: unescape_text("320 Avenue Saint-Louis, Rimouski, QC, G5L 5L5"),
    position: unescape_text("Technicien en Informatique ・ Étudiant"),
    contacts: ((
      text: unescape_text("epiab002\@cegep-rimouski.qc.ca"),
      url: unescape_text("mailto:epiab002\@cegep-rimouski.qc.ca"),
      icon: unescape_text("fa envelope"),
    ), (
      text: unescape_text("Site Web"),
      url: unescape_text("https:\/\/piaple-dada-brice.click-eats-now.com/"),
      icon: unescape_text("assets/icon/bi-house-fill.svg"),
    ), (
      text: unescape_text("581-246-5763"),
      url: unescape_text("tel:+15812465763"),
      icon: unescape_text("fa brands orcid"),
    ), (
      text: unescape_text("GitHub"),
      url: unescape_text("https:\/\/github.com/bpiaple"),
      icon: unescape_text("fa brands github"),
    ), (
      text: unescape_text("LinkedIn"),
      url: unescape_text("https:\/\/linkedin.com/in/bpiaple"),
      icon: unescape_text("fa brands linkedin"),
    ), (
      text: unescape_text("twitter"),
      url: unescape_text("https:\/\/twitter.com/bpiaple"),
      icon: unescape_text("fa brands x-twitter"),
    )),
  ),
)
= Éducation
<éducation>
#resume-entry(
  title: "Techniques de l'Informatique",
  location: "Cégep de RImouski, Rimouski, Québec",
  date: "2023 - Présent",
  description: "Programme couvrant le développement logiciel, l'administration des réseaux, et la gestion des systèmes informatiques, avec un équilibre entre théorie approfondie et projets pratiques pour préparer efficacement aux exigences du secteur technologique.",
)

#resume-entry(
  title: "Baccalauréat en Informatique, option Génie Logiciel",
  location: "Institut Universitaire de Technologie (IUT), Bandjoun, Cameroun",
  date: "2022 - 2023",
  description: "Programme axé sur la conception et le développement de logiciels, la gestion de projets informatiques et les méthodologies avancées de génie logiciel.",
)

#resume-entry(
  title: "Diplôme Universitaire de Technologie en Informatique",
  location: "IUT, Bandjoun, Cameroun",
  date: "2020 - 2022",
  description: "Formation centrée sur les bases de l'informatique, le développement d'applications et l'administration des systèmes informatiques.",
)
= Expérience de Travail
<expérience-de-travail>
#resume-entry(
  title: "Développeur Logiciel",
  location: "YOCO Sarl Services, Cameroun",
  date: "Janvier 2022 - Juin 2023",
  description: "",
)
#resume-item[
- Identifié et corrigé des bogues, réduisant de 15% le taux d'erreurs dans les logiciels déployés.
- Livré des projets dans les délais tout en respectant les standards de qualité.
- Assuré la maintenance continue et des mises à jour logicielles pour améliorer les performances système.
]

#resume-entry(
  title: "Stagiaire en Informatique",
  location: "YOCO Sarl Services, Cameroun",
  date: "Nov 2020 - Déc 2021",
  description: "",
)

#resume-item[
- Fournit une assistance technique rapide, résolvant 95% des incidents en moins de 24 heures.
- Participé à la conception et maintenance de logiciels, respectant 100% des délais projet.
- Rédigé des documents techniques clairs pour soutenir les équipes projet.
]

#resume-entry(
  title: "Caissier et Service à la Clientèle",
  location: "Tim Hortons, Rimouski, Québec",
  date: "Août 2023 - Présent",
  description: ""
)
#resume-item[
- Optimisé les processus de commande, réduisant le temps d'attente client de 10%.
- Maintenu une caisse équilibrée et géré des transactions avec 100% d’exactitude.
- Assuré une expérience client positive, favorisant une satisfaction client élevée.
]
= Projets
<projets>
#resume-entry(
  title: "Application de reconnaissance faciale",
  description: "Application de reconnaissance faciale utilisant des réseaux de neurones convolutifs pour identifier les visages en temps réel."
)
#resume-entry(
  title: "Site Web Portfolio",
  description: "Site web dynamique pour une entreprise de restauration, avec un design moderne et des fonctionnalités interactives."
)
#resume-entry(
  title: "Site Web Personnel",
  description: "Site web statique présentant mon CV, mes projets et mes compétences, avec un design épuré et une navigation intuitive."
)
= Récompenses
<récompenses>
#resume-entry(
  title: "Bourse d'Excellence du Gouvernement du Québec",
  location: "Cégep de Rimouski",
  date: "2023 - 2026",
  description: "Bourse d'études pour les étudiants, basée sur le mérite académique et les réalisations professionnelles."
)
= Compétences
<compétences>
#resume-entry(
  title: "Langues",
  description: "Fraçais (Natif), English (Intermédiaire)"
)

#resume-entry(
  title: "Languages de Programmation",
  description: "Python, C++, HTML/CSS, PowerShell"
)

#resume-entry(
  title: "Administration Réseaux",
  description: "Windows Server, Linux, Active Directory, DHCP"
)

#resume-entry(
  title: "Frameworks",
  description: "Frameworks de développement d'Intelligence Artificielle et outils de développement de sites web : "
)
#resume-item[
- TensorFlow
- Keras
- PyTorch
- WordPress
]