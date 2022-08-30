import 'package:intl/intl.dart';

class Val {
  static String? validateTitle(String? val) {
    return (val != null && val != '') ? null : 'Title cannot be empty';
  }

  static String getExpiryStr(String expires) {
    final e = DateUtils.convertToDate(expires);
    final td = DateTime.now();
    if (e != null) {
      final Duration dif = e.difference(td);
      final dd = dif.inDays + 1;
      return (dd > 0) ? dd.toString() : '0';
    }
    return '0';
  }

  static bool strToBool(String str) {
    return (int.parse(str) > 0) ? true : false;
  }

  static bool intToBool(int val) {
    return (val > 0) ? true : false;
  }

  static String boolToStr(bool val) {
    return (val == true) ? "1" : "0";
  }

  static int boolToInt(bool val) {
    return (val == true) ? 1 : 0;
  }
}

class DateUtils {
  static DateTime? convertToDate(String input) {
    try {
      return DateFormat('yyyy-MM-dd').parseStrict(input);
    } catch (_) {
      return null;
    }
  }

  static String? convertToDateFull(String input) {
    try {
      final d = DateFormat("yyyy-MM-dd").parseStrict(input);
      final formatter = DateFormat('dd MMM yyyy');
      return formatter.format(d);
    } catch (_) {
      return null;
    }
  }

  static String? convertToDateFullDt(DateTime input) {
    try {
      return DateFormat('dd MMM yyyy').format(input);
    } catch (_) {
      return null;
    }
  }

  static bool isDate(String dt) {
    try {
      // ignore: unused_local_variable
      final d = DateFormat('yyyy-MM-dd').parseStrict(dt);
      return true;
    } catch (_) {
      return false;
    }
  }

  static bool isValidDate(String dt) {
    if (dt.isEmpty || !dt.contains("-") || dt.length < 10) return false;
    List<String> dtItems = dt.split('-');
    try {
      final d = DateTime(
        int.parse(dtItems[0]),
        int.parse(dtItems[1]),
        int.parse(dtItems[2]),
      );
      return isDate(dt) && d.isAfter(DateTime.now());
    } catch (_) {
      return false;
    }
  }

  static String daysAheadAsStr(int daysAhead) {
    final now = DateTime.now();
    DateTime ft = now.add(Duration(days: daysAhead));
    return ftDateAsStr(ft);
  }

  static String ftDateAsStr(DateTime ft) {
    return "${ft.year.toString()}-${ft.month.toString().padLeft(2, "0")}-${ft.day.toString().padLeft(2, "0")}";
  }

  static String trimDate(String dt) {
    if (dt.contains(' ')) {
      List<String> p = dt.split(' ');
      return p[0];
    } else {
      return dt;
    }
  }
}
