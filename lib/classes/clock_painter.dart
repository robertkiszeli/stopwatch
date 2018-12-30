import 'package:flutter/material.dart';
import 'dart:math' as math;

class ClockPainter extends CustomPainter {
  final hourTickMarkLength = 10.0;
  final minuteTickMarkLength = 5.0;

  final hourTickMarkWidth = 3.0;
  final minuteTickMarkWidth = 1.5;

  Color lineColor;
  Color completeColor;
  int hundreds;
  int seconds;
  int minutes;
  int hours;
  double width;
  Paint linePaint;

  ClockPainter(
      {this.lineColor,
      this.completeColor,
      this.hundreds,
      this.seconds,
      this.minutes,
      this.hours,
      this.width,
      this.linePaint});

  @override
  void paint(Canvas canvas, Size size) {
    final double actualCenter = size.width / 2;

    linePaint.color = Colors.black;
    linePaint.strokeWidth = 3.0;
    linePaint.style = PaintingStyle.stroke;
    linePaint.strokeCap = StrokeCap.round;
    canvas.translate(actualCenter, actualCenter);

    double tickMarkLength;

    for (int i = 0; i < 60; i++) {
      if (i % 5 == 0) {
        tickMarkLength = hourTickMarkLength;
        linePaint.strokeWidth = hourTickMarkWidth;
      } else {
        tickMarkLength = minuteTickMarkLength;
        linePaint.strokeWidth = minuteTickMarkWidth;
      }
      canvas.drawLine(
          new Offset(0, -(actualCenter) + width * 4),
          new Offset(0, -(actualCenter) + width * 4 + tickMarkLength),
          linePaint);
      canvas.rotate((2 * math.pi) / 60);
    }
    canvas.translate(-actualCenter, -actualCenter);

    Offset center = new Offset(actualCenter, actualCenter);

    double radiusSecond = (actualCenter) - (width * 3);
    double radiusMin = (actualCenter) - (width * 1.5);
    double radiusHour = (actualCenter);

    double radian = math.pi / 180;

    Paint line = new Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    double arcAngleSeconds = (radian) * ((seconds + (hundreds / 100)) * 6);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radiusSecond),
        -math.pi / 2, arcAngleSeconds, false, line);

    line.color = Colors.green;
    double arcAngleMinutes = (radian) * (minutes * 6);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radiusMin),
        -math.pi / 2, arcAngleMinutes, false, line);

    line.color = Colors.red;
    double arcAngleHours = (radian) * (hours * 30);
    canvas.drawArc(new Rect.fromCircle(center: center, radius: radiusHour),
        -math.pi / 2, arcAngleHours, false, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
