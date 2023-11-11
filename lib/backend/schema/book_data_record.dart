import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class BookDataRecord extends FirestoreRecord {
  BookDataRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Bookname" field.
  String? _bookname;
  String get bookname => _bookname ?? '';
  bool hasBookname() => _bookname != null;

  // "Bookimage" field.
  String? _bookimage;
  String get bookimage => _bookimage ?? '';
  bool hasBookimage() => _bookimage != null;

  // "Bookdisc" field.
  String? _bookdisc;
  String get bookdisc => _bookdisc ?? '';
  bool hasBookdisc() => _bookdisc != null;

  // "Isfave" field.
  bool? _isfave;
  bool get isfave => _isfave ?? false;
  bool hasIsfave() => _isfave != null;

  void _initializeFields() {
    _bookname = snapshotData['Bookname'] as String?;
    _bookimage = snapshotData['Bookimage'] as String?;
    _bookdisc = snapshotData['Bookdisc'] as String?;
    _isfave = snapshotData['Isfave'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Book_data');

  static Stream<BookDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookDataRecord.fromSnapshot(s));

  static Future<BookDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookDataRecord.fromSnapshot(s));

  static BookDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BookDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookDataRecordData({
  String? bookname,
  String? bookimage,
  String? bookdisc,
  bool? isfave,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Bookname': bookname,
      'Bookimage': bookimage,
      'Bookdisc': bookdisc,
      'Isfave': isfave,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookDataRecordDocumentEquality implements Equality<BookDataRecord> {
  const BookDataRecordDocumentEquality();

  @override
  bool equals(BookDataRecord? e1, BookDataRecord? e2) {
    return e1?.bookname == e2?.bookname &&
        e1?.bookimage == e2?.bookimage &&
        e1?.bookdisc == e2?.bookdisc &&
        e1?.isfave == e2?.isfave;
  }

  @override
  int hash(BookDataRecord? e) => const ListEquality()
      .hash([e?.bookname, e?.bookimage, e?.bookdisc, e?.isfave]);

  @override
  bool isValidKey(Object? o) => o is BookDataRecord;
}
