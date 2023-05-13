import 'package:flutter/material.dart';

class DraggableItem extends StatelessWidget {
  const DraggableItem({super.key, required this.onDragEnd});
  final void Function(DraggableDetails)? onDragEnd;

  @override
  Widget build(BuildContext context) {
    return Draggable(
      feedback: const Opacity(
        opacity: .4,
        child: _TextCard(
          color: Colors.grey,
        ),
      ),
      onDragEnd: onDragEnd,
      child: const _TextCard(),
    );
  }
}

class _TextCard extends StatelessWidget {
  const _TextCard({this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 50,
      child: Card(
        color: color ?? Colors.white,
        child: Center(
          child: Text(
            'Text Area',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black87,
                ),
          ),
        ),
      ),
    );
  }
}
