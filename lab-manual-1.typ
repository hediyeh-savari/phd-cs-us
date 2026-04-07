

//#set page(numbering: "1", number-align: center)
#set heading(numbering: "1.")
#set text(lang: "en", size: 11pt)
// #set link(style: text.with(fill: blue))
#set list(indent: 1em)
#set enum(indent: 1em)
#set page(margin: 1in)

#set par(justify: true)
#show ref: set text(fill:blue)
#show link: set text(fill:blue)
#show link: underline

//#show quote: set pad(left: 1.5em)
#show quote: set text(style: "italic")

#show heading: set block(above: 1.4em, below: 1em)

#show title:set text(size: 17pt)
#show title: set align(center)
#let title = [Lab Manual]
#let author = [#link("https://roars.dev")[ROARS]]

#let dark-green = rgb("#006400")
#let light-green = rgb("#d4f1d4")

#box(
  stroke: (paint: dark-green, thickness: 3pt),
  inset: 2em,
  width: 100%,
  height: 100%
)[
  #align(center + horizon)[
    #v(0.5fr)
    #text(size: 32pt, weight: "bold")[#title]
    
    #v(0.5fr)
    
    #image("files/dino.png", width: 80%)
    
    #v(1fr)
    
    #text(size: 18pt, weight: "bold")[#author]
    
    #text(size: 14pt)[George Mason University]
  ]
]

// Inline code
#show raw.where(block: false): it => box(fill: rgb("#f0f0f0"), inset: (x: 2pt), radius: 2pt, it)

// Code blocks
#show raw.where(block: true): it => block(fill: rgb("#f0f0f0"), inset: 10pt, radius: 4pt, width: 100%, it)




#pagebreak()

#block(fill: light-green, stroke: dark-green, inset: 1em)[
This manual serves as a guide for prospective and current members of #link("https://roars.dev")[Roars Lab]. It outlines the lab's policies, procedures, and expectations to ensure a productive and collaborative research environment.

*Updating the manual*: This document is a living document in Roars Lab's Github repo at

  #align(center)[
    #link("https://code.roars.dev/phd-cs-us/lab-manual.typ")
  ]


Lab members, who all have write access, are encouraged to provide feedback and suggest changes to improve its clarity and usefulness.

]
#outline()

#pagebreak()

= Publication

== Rebuttal

+ *Thank you note*: Start with a thank you note to the reviewers for their time and feedback. Reviewing is a thankless job and reviewers often put in lots of time and effort to provide feedback. Even if the reviews are harsh and you hate them, *do it anyway*.




#pagebreak()
= Writing Styles and File Organization

Everyone has their own way of organizing files and writing papers. Below is my approach that has worked well for me over the years. If you're my student and write papers with me, #highlight[I expect you follow this approach] so that we can be on the same page and work efficiently together.

#rect[However, if we collaborate with others, we can adapt how we write and organize files as needed. Typically, the main group lead will decide how to organize things and the rest of us will follow their lead. For example, if we lead a paper, then we will follow my approach below. But if we collaborate on a paper led by others, then we will follow their approach.]

== File Organization <sec:file-organization>
+ _Use #highlight[Git control] (e.g., Github) for version control_. This is essential for managing changes to the paper, especially when collaborating with others. Even if we use something like `Overleaf`, link it to a Github repo 
  
+ _Keep it simple_. I prefer a very simple file organization structure for writing papers. #highlight[As few files and directories as possible].
    + `paper.tex`: a _single_ `TeX` file for the entire paper.
        - Some might prefer using multiple files / directories (e.g., `intro.tex`, `eval.tex`, `sections/related.tex`). But I find it easier to just use a single file because I can easily search and replace for things and I don't have to switch between files, which interrupts my flow.
        - Even when sharing or collaborating with others, where conflict edits can arise, a single file still works well because Git is pretty good at resolving conflict issues.
        - I use this approach for all projects, including proposal (`proposal.tex`) and presentation (`slides.tex`) files.
        - Sometimes I append things to the end of the file to indicate the venue (e.g., `paper-cacm26.tex` for a paper submitted to CACM). But the main idea still remains: an entire paper in a single file.
          
    + `paper.bib`: A single `bib` file for bibliography references.
        - I prefer a single bib file because it is easier to manage and search for references. Others might prefer multiple bib files (e.g., `refs1.bib`, `refs2.bib` for different sections).
        - My collaborators sometimes put in their own bib files.
    
    + `figures/`: A directory (folder) containing all figures for the paper.  If there are just a few figures, I might just put them in the same directory as the paper file. But if there are many figures, I prefer to keep them in a separate directory.

#pagebreak()
== Writing Order for Research Papers

I often write papers in the following order. For a concrete example, see the
#link("https://roars.dev/pubs/ishimwe2021dynaplex.pdf")[`Dynaplex` paper]
published at `OOPSLA'21`.

+ *Overview* section (Section 2).
    - Start with this section, which should contain an #highlight[illustrative or concrete example].
    - After reading this illustrative example (and perhaps the *Introduction*), the readers should have a good understanding of the approach.
    - _The goal is to have the readers (or reviewers) make up their mind whether they like
      or do not like the proposed work after reading this part._
    - A good place to add some #highlight[overview figure] highlighting the architecture and main components of the technique or tool.
  - Can also summarize background or important concepts in this section.
  - Typically contains:
    - An architecture or overview figure of the approach (e.g., Fig 1 in the `Dynaplex` paper)
    - A motivation or illustration example
      - Sec 2.1: Show how `Dynaplex` works at high level on an input program, what results
        does it produce.
    - Main definitions and background (optional)
      - Sec 2.2: General background on dynamic inference and specific
        features/properties of `Dynaplex`

- *Experimental* section (Section 4).
    + Some implementation details. E.g., how the technique is implemented, what tools or libraries are used, etc.
    + Research Questions (RQs). E.g., RQ1: How accurate is the technique? RQ2: How efficient is the technique? RQ3: How does it compare to existing approaches?
  + Benchmark programs: describe benchmarks used to answer the RQs, and why they are good benchmarks for this purpose.
  + Experiment Setup
    - Machine specs
    - How experiments were run (multiple times and report the mean, etc.)
  + Results and Analysis
    - For each RQ, present the results and analyze them. E.g., for RQ1, show the accuracy results and analyze them (e.g., why is it accurate or not accurate? What are the factors that affect accuracy? etc.)
        - Don't just focus on positive results. If there are negative results, report and analyze them as well. E.g., for benchmark X, the technique does not perform well because of reasons Y and Z.

- *Algorithm/Techniques* (Section 3)

- *Related Work* (Section 5)
  - Break into multiple subsections if necessary
  - After each subsection that talks about related work, have a new paragraph and talk about
    why my work is different/related to other work.

- *Conclusion* (Section 6).
  - This should be the _conclusion_ not the _summary_.
  - Future work can also go here

- *Introduction* (Section 1).
  - Write this last, because by the time I write the Intro, I would already have all needed
    info (e.g., so I can summarize the diff with state of the art, technical contributions,
    and results).
  - Typically contains several main things:
    - What is the problem? Why is it important (i.e., if we can solve it, then what do we
      accomplish)?
    - Existing work: basically answering why it is challenging (i.e., why existing work is
      not sufficient)?
    - The proposed approach of this paper: how does it address the limitations of existing
      work listed above? What other benefits does it have?
      - Results: briefly summarize the results.
        
#pagebreak()
== Presentation

+ *Title slide* with paper title, authors (highlight or underline the presenter's name), affiliations, conference or event name, date.
+ *Number your slides*. This is useful when people want to ask questions (or give feedback) on specific slides (e.g., #quote[on slide 10, you said ...]).
+ *Every slide takes approximately 1 minute*. Using this rule of thumb, you can estimate how many slides you need for your presentation.
+ *Avoid Technical Stuff*. 
  - Avoid slides that are too technical (e.g., formulae, code snippets, algorithms, etc) unless absolutely necessary.
    - _Focus on motivation and high-level ideas_. #highlight[The goal of the presentation is to get people interested into your work and talk to you and read your paper], which has more technical details. 



//  + Create a separate Github Repo for each _project_.
//   - The reason is that we will likely write multiple papers for the same project (e.g., conference papers, journal papers, workshop papers, etc). Having a single repo per project makes it easier to manage and find things.
//   - Name the repo `paper_projectname`, e.g., `paper_gentree` where `gentree` is the name of the work.

// + Within the repo, create a separate directory (folder) for each _paper_.
//   - Name the directory based on the venue and year, e.g., `icse2025` for a paper submitted to ICSE 2025.


  
= Lab Resources
  
== Web Links
  - *Website*: #link("https://roars.dev/")[roars.dev]. This is the main place for lab news, announcements, etc.
  - *Zoom* for meetings #link("https://meet.roars.dev/")[meet.roars.dev]: general lab meetings.


== Discord Server
  + `#stats`: our most active channel, where we discuss research ideas, projects, papers, and everything else related to research and the lab. This is the main channel for research discussions and announcements.  
  + `#servers`: for all questions regarding lab servers, e.g., how to get an account, how to use the servers, etc. This is the main channel for server-related discussions and announcements.
  + `#general`: where we say hello to new members

== Computer Server Specs
We have _four_ servers (see #link(<pictures>)[pictures]):

+ *Boba*🧋: ideal for AI-based projects, e.g., generative LLMs
  - #link("https://www.nvidia.com/en-us/products/workstations/dgx-spark/")[NVIDIA DGX Spark]
  - CPU: NVidia GB10 Chip, 20 core Arm (10 Cortex-X925 + 10 Cortex-A725 Arm)
  - Unified Memory/Graphic: 128GB RAM
  - OS: NVIDIA DGX OS (based on Ubuntu LTS)

+ *Pizza* 🍕: ideal for projects that can leverage many cores and specialized GPU
  - Custom built
  - CPU: 32 cores, 64 threads, 3.6GHz (AMD Ryzen Threadripper PRO 5975WX)
  - GPU: 2x Nvidia RTX 4090 24GB RAM
  - Memory: 128GB RAM
  - OS: Debian Stable

+ *Sushi* 🐟: high-performance workstation
  - Lenovo ThinkStation P620
  - CPU: 64 cores, 128 threads, 4.3GHz (AMD Ryzen Threadripper PRO 3995WX)
  - GPU: Nvidia RTX 5090 24GB RAM
  - Memory: 128GB RAM
  - OS: Debian Stable

+ *Taco* 🌮: ideal for experiments that need fast CPU (but not lots of cores) and fast GPU
  - Alienware Aurora
  - CPU: 16 cores, 24 threads, 5.20GHz (Intel 12th Gen Core i9-12900KF)
  - GPU: Nvidia RTX 3080 Ti 12GB RAM
  - Memory: 64GB RAM
  - OS: Debian Stable

#block(fill: light-green, stroke: dark-green, inset: 1em)[
  *Warning:* For Debian machines, *DO NOT* install anything other than Debian stable packages to these computers (e.g., *do not mix unstable or new repositories* to `apt` sources list). You can download and install anything in your home (local) directory. If in doubt, contact us.
]

=== Getting an Account

To get an account on the server, send a request and your *SSH public key* (for _password-less_ log in).

=== Miscellaneous

+ You can use an IDE such as `VSCode` to do remote development on these servers (just connect to the server via the builtin remote login method in VSCode). You can also use other editors that support remote development (e.g., `Emacs` + `TRAMP`).

+ Do take advantage of the multicores these machines have. Most programming languages support multiprocessing (e.g., `Python`) and can significantly reduce program runtime.

+ Periodically check `top` and `htop` to make sure *you* are not taking too much CPU or memory.

+ Periodically check `/var/tmp` or `/tmp/` to make sure *you* are not taking too much space there.

=== Pictures <pictures>

#figure(
  image("files/sushi.jpg", width: 80%),
  caption: [🐟 *Sushi*]
)

#figure(
  image("files/sushi-fan.jpg", width: 80%),
  caption: [🐟 *Sushi Cooling System*]
)

#figure(
  image("files/pizzabox.jpg", width: 80%),
  caption: [🍕 *Pizza*]
)

#figure(
  image("files/boba.jpg", width: 80%),
  caption: [🧋 *Boba*]
)

#pagebreak()

== External Resources

=== VPN for Lab Servers
You will need VPN and Computing access to log into lab servers remotely. Send an email to #link("mailto:cechelp@gmu.edu")[cechelp\@gmu.edu] and also CC the PI.

#block(fill: rgb("#fff3cd"), stroke: rgb("#ffc107"), inset: 1em)[
  *Subject*: VPN and Computing Access (Mesa AD Groups)
  
  Dear CECHelp,
  
  I am writing to request that my NetID (*your_user_name*) be added to the Active Directory groups listed below.
  
  Groups requested for addition:
  - `CN=VS-GRA,OU=HelpDeskManagement,OU=VolgenauSchool...`
  - `CN=VS-SR-VPN,OU=HelpDeskManagement,OU=VolgenauSchool...`
  
  I have copied my advisor/supervisor, Professor Thanhvu Nguyen, on this email should you require confirmation that this access is necessary.
  
  Thank you for your time and assistance with this.
]

=== Connecting to Wifi `eduroam`

#link("https://its.gmu.edu/knowledge-base/eduroam/")[ITS Eduroam Documentation]

*Linux Setup:*

+ Select `eduroam` from the list of available wireless networks
+ Configure the following settings:
  - Wi-Fi security: `WPA & WPA2 Enterprise`
  - Authentication: `Protected EAP (PEAP)`
  - Anonymous identity: leave blank
  - Domain: `gmu.edu`
  - Check `No CA certificate is required`
  - PEAP version: `Automatic`
  - Inner Authentication: `MSCHAPv2`
  - Username: Your full George Mason email (e.g., `netid@gmu.edu`)
  - Password: Your Patriot Password
+ Click `Connect` to establish connection




= Conference Registration and Travel

== Reimbursement Process
=== General Process

- *PI Pay*: I can pay for your *conference registration* and *airline* in advance using the lab's *P-card*. Usually we do this together for efficiency.
- *You Pay (and get reimbursed)*: Everything else (e.g., hotel, food, local transport) you pay yourself (e.g., using your own credit card) and then submit reimbursement requests to the university.
  - You need to save all receipts for reimbursement (except for meals, which is per diem see below @meals).
  - You need to do this after you return from the conference and within 60 (?) days of the expense date.

=== Meals <meals>

+ *Per Diem*: We are paid per diem for meals when we travel for conferences. This means you don't need to save or submit receipts for meals. If you don't eat anything (do not do this)!, you will still get the per diem amount.

+ The per diem rates depend on the city we are visiting and are determined by the US General Services Administration (GSA) website: #link("https://www.gsa.gov/travel/plan-book/per-diem-rates"). When you submit reimbursement requests for meals, you will select the location and the system will automatically calculate the per diem amount for you.

+ The first day and the last day of travel, they will not pay the full per diem rate because you are not there for the full day.

= Comprehensive Exam and Defense

== Defense

Chair: 
- In the beginning 
  - Once all the committee members are present, chair will ask the student to step out of the room (virtually) at the beginning of the meeting.
  - Chair then give a brief summary of the student's progress in the PhD program, talk about their published and under-review papers,  and answer any questions the committee may have. - Chair then call the student back and give the presentation. 
 
- End of the meeting
  - the student briefly step out so that the committee can discuss the decision
  - Then the student can be invited and informed about the decision.



= Contact information

+ Lab website: #link("https://roars.dev")
+ Email: #link("mailto:info@roars.dev")[info\@roars.dev]
+ Address (PI's office):

  #rect()[
    ```
  George Mason University
  Nguyen Engineering Building #4430
  4400 University Drive
  Fairfax, VA 22030
  ```
  ]

+ Address (package delivery, e.g., from Amazon)

  #rect()[
    ```
  4511 Patriot CIR
  Nguyen Engineering STE 4300
  Fairfax, VA 22030-4469
  United States
  ```
  ]
  
