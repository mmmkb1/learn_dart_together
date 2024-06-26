import 'constants.dart';
import 'keytype.dart';

class StrongBox<E> {
  E? _item;
  final Keytype _keytype;
  int _count;

  StrongBox({required Keytype keytype})
      : _keytype = keytype,
        _count = 0 {
    switch (_keytype) {
      case Keytype.padlock:
        _count = padlockMaxCount;
      case Keytype.button:
        _count = buttonMaxCount;
      case Keytype.dial:
        _count = dialMaxCount;
      case Keytype.finger:
        _count = fingerMaxCount;
    }
  }

  void put(E item) {
    _item = item;
  }

  E? get() => _count-- > 0 ? null : _item;
}
