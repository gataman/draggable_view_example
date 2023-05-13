import 'package:draggable_view_example/draggable_item.dart';
import 'package:flutter/material.dart';

class DraggableView extends StatefulWidget {
  const DraggableView({super.key});

  @override
  State<DraggableView> createState() => _DraggableViewState();
}

class _DraggableViewState extends State<DraggableView> {
  late List<Widget> _widgetList;

  @override
  void initState() {
    _widgetList = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black26,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Card(
                color: Colors.white,
                child: Stack(
                  children: _widgetList,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Column(
                children: [
                  DraggableItem(
                    onDragEnd: (details) {
                      setState(() {
                        _createItem(details.offset.dx - 15, details.offset.dy - 30);
                      });
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _createItem(double dx, double dy) {
    _widgetList.add(
      Positioned(
        left: dx,
        top: dy,
        child: const SizedBox(
          width: 200,
          height: 50,
          child: TextField(),
        ),
      ),
    );
  }
}
