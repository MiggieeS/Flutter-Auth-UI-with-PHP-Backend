import 'package:flutter/material.dart';

double adaptiveFontSize(BuildContext context, double baseSize) {
  final screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 400) {
    return baseSize * 0.8;
  } else if (screenWidth > 700) {
    return baseSize * 1.2;
  } else {
    return baseSize;
  }
}

int adaptiveGridColumnCount(BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;

  if (screenWidth < 400) {
    return 1;
  } else if (screenWidth > 700) {
    return 3;
  } else {
    return 2;
  }
}

class FrostedCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const FrostedCard({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final cardWidth = screenWidth > 700 ? 600.0 : screenWidth * 0.8;
    final cardPadding =
        padding ?? EdgeInsets.all(screenWidth < 400 ? 16.0 : 32.0);

    return Container(
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: cardPadding,
      child: child,
    );
  }
}
