class Eleve {
  final String prenom;
  final String nom;
  bool abs;

  Eleve({this.prenom, this.nom, this.abs});

  factory Eleve.fromJson(Map<String, dynamic> json) {
    return new Eleve(
      prenom: json['prenom'] as String,
      nom: json['nom'] as String,
      abs: false
    );
  }

}