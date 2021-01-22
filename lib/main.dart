import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() => runApp(CellBuilder());

class CellBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
          child: SfCalendar(
            view: CalendarView.month,
            monthCellBuilder: monthCellBuilder,
            dataSource: _getCalendarDataSource(),
          ),
        )));
  }

  Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
    var length = details.appointments.length;
    if (details.appointments.isNotEmpty) {
      return Container(
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  details.date.day.toString(),
                  textAlign: TextAlign.center,
                ),
                Divider(color: Colors.transparent,),
                Text(
                  '$length',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.deepPurple),
                ),
                Divider(color: Colors.transparent,),
                Icon(
                  Icons.event_available_rounded,
                  color: Colors.red,
                  size: 20,
                ),
              ],
            )
          ],
        ),
      );
    }
    return Container(
      child: Text(
        details.date.day.toString(),
        textAlign: TextAlign.center,
      ),
    );
  }

  _AppointmentDataSource _getCalendarDataSource() {
    List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'Meeting',
      color: Colors.blue,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'Restrospective',
      color: Colors.blue,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(Duration(hours: 1)),
      subject: 'Planning',
      color: Colors.blue,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -5)),
      endTime: DateTime.now().add(Duration(days: -5)),
      subject: 'Planning',
      color: Colors.deepOrangeAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -9)),
      endTime: DateTime.now().add(Duration(days: -9)),
      subject: 'Consulting',
      color: Colors.pink,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -9, hours: 1)),
      endTime: DateTime.now().add(Duration(days: -9, hours: 1)),
      subject: 'Holiday support',
      color: Colors.pink,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -15)),
      endTime: DateTime.now().add(Duration(days: -15)),
      subject: 'Retrospective',
      color: Colors.purpleAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: 5)),
      endTime: DateTime.now().add(Duration(days: 5)),
      subject: 'Sprint Plan',
      color: Colors.lightGreenAccent,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: 9)),
      endTime: DateTime.now().add(Duration(days: 9)),
      subject: 'Weekly Report',
      color: Colors.lime,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: 3)),
      endTime: DateTime.now().add(Duration(days: 3)),
      subject: 'Meeting',
      color: Colors.cyan,
    ));

    return _AppointmentDataSource(appointments);
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
