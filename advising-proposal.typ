
#set page(numbering: "1", number-align: center)
#set heading(numbering: "1.")
#set text(lang: "en", size: 11pt)
#set list(indent: 1em)
#set enum(indent: 1em)
#set document(
    title: "Advisor Guide: Answers to Common Questions",
    author: "ThanhVu Nguyen"
)
#set par(justify: true)

#rect[These notes are accumulated from my experience and reflections. I usually work on it when I am writing my own proposal or reviewing other proposals, and just want to write down my thoughts as they are still fresh in my mind.]

= General Issues in Proposals

== Assumption that the reviewers are knowledgeable

Usually experienced proposal writers do not have this problem, but new proposal writers sometimes assume that the reviewers are knowledgeable about the topic or field. The truth is reviewers, while work in your general area, might not be familiar with your specific topic.  For example, they work in the area of _Software Engineering_ or _Formal Methods_, but they might be familiar with topics such as _gradual refinement type_ or _neural network verification_.

Thus, your job is not to convince the small group of people who work in your topic (well they probably already like your work, or hate it), but to convince the more general reviewers who are not experts in your topic that your work is important and worth funding (now imagine those reviewers in turn need to convince the NSF program officers who are also not experts in your topic, who in turn need to convince the NSF director who is even less familiar with your topic).  

#highlight[So motivate, use examples to demonstrate, and explain your work in a way that is accessible to a general audience. Better yet, have someone who is not an expert in your topic read your proposal and give you feedback on whether they understand the motivation, the problem, and the proposed solution. Usualy they just need to read the introduction to give you this feedback.
].


#rect[In my experience, proposals that are a bit heavy on foundations and theories often have this problem.  This could be a cultural issue in some research communities (e.g., theoretical papers often start with some very technical theorem or definition and the reviewers are expected to understand and able to follow them).]

== Lack of clear motivation or problem statement.


== Lack of convincing prior work or preliminary results or PIs' expertise in the area.
- Get collaborators (and include letters of support from them)

=== Wall of text or tons of formulae

== Insufficient Evaluation Plan


== Generic Broader Impacts or Education Plan
  - be specific ! give concrete examples ! numbers, stats, names, etc  . You are more responsible and credible when you are specific.




Most of the stated issues appear to be commonly faced problems in gen AI (e.g., only part of the media is AI generated,  updating existing detectors to handle new data etc)  and there should be many work on these; yet the proposal only briefly cite some work but didn't discuss why they fail or how the proposed work is different
While  the zero-shot gen ai video detection section in Aim 1.1 explicitly mentioned videos are quite different than images a and proposed work specifically for video, most other aims/tasks treat them as equivalent and essentially apply the same techniques to both images and videos, which is not convincing.  