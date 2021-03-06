import 'dart:async';
import 'package:chapter_21_contacts/contacts.dart' show MySQLContacts;

void main() {

  // Managing contacts
  var id;
  var myc = new MySQLContacts();

  Future.wait([
    myc.dropDB(),
    myc.add({
      'fname': 'Moises',
      'lname': 'Belchin',
      'address': 'paseo del prado, 28',
      'zip': '28014',
      'city': 'Madrid',
      'country': 'Spain'
    }),
    myc.add({
      'fname': 'Patricia',
      'lname': 'Juberias',
      'address': 'Castellana, 145',
      'zip': '28046',
      'city': 'Madrid',
      'country': 'Spain'
    }),
    myc.add({
      'fname': 'Peter',
      'lname': 'Smith',
      'address': 'Cyphress avenue',
      'zip': '11217',
      'city': 'Brooklyn',
      'country': 'EEUU'
    }),
  ]).then((_) {

    myc.list().then((results) {
      print('Listing records');
      results.forEach((r) => print(r));
      myc.close();
    });

  });
}
