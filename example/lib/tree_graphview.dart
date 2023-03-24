import 'dart:math';

import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class TreeViewPage extends StatefulWidget {
  @override
  _TreeViewPageState createState() => _TreeViewPageState();
}

class _TreeViewPageState extends State<TreeViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Wrap(
              children: [
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: builder.siblingSeparation.toString(),
                    decoration:
                        InputDecoration(labelText: 'Sibling Separation'),
                    onChanged: (text) {
                      builder.siblingSeparation = int.tryParse(text) ?? 100;
                      this.setState(() {});
                    },
                  ),
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: builder.levelSeparation.toString(),
                    decoration: InputDecoration(labelText: 'Level Separation'),
                    onChanged: (text) {
                      builder.levelSeparation = int.tryParse(text) ?? 100;
                      this.setState(() {});
                    },
                  ),
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: builder.subtreeSeparation.toString(),
                    decoration:
                        InputDecoration(labelText: 'Subtree separation'),
                    onChanged: (text) {
                      builder.subtreeSeparation = int.tryParse(text) ?? 100;
                      this.setState(() {});
                    },
                  ),
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    initialValue: builder.orientation.toString(),
                    decoration: InputDecoration(labelText: 'Orientation'),
                    onChanged: (text) {
                      builder.orientation = int.tryParse(text) ?? 100;
                      this.setState(() {});
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // final node12 = Node.Id(r.nextInt(100));
                    // var edge =
                    //     graph.getNodeAtPosition(r.nextInt(graph.nodeCount()));
                    // print(edge);
                    // graph.addEdge(edge, node12);
                    addNode();
                    setState(() {});
                  },
                  child: Text('Add'),
                )
              ],
            ),
            Expanded(
              child: InteractiveViewer(
                  constrained: false,
                  scaleEnabled: false,
                  panEnabled: true,
                  alignPanAxis: false,
                  // boundaryMargin: EdgeInsets.all(double.infinity),
                  boundaryMargin: EdgeInsets.all(100),
                  minScale: 1,
                  maxScale: 1,
                  child: GraphView(
                    graph: graph,
                    algorithm: BuchheimWalkerAlgorithm(
                        builder, TreeEdgeRenderer(builder)),
                    paint: Paint()
                      ..color = Colors.pinkAccent
                      ..strokeWidth = 1
                      ..style = PaintingStyle.stroke,
                    builder: (Node node) {
                      // I can decide what widget should be shown here based on the id
                      var a = node.key!.value as int?;
                      return rectangleWidget(a, node);
                    },
                  )),
            ),
          ],
        ));
  }

  Random r = Random();

  Widget rectangleWidget(int? a, Node node) {
    return InkWell(
      onTap: () {
        print('clicked--');
      },
      child: Container(
          height: 91,
          width: 204,
          alignment: Alignment.center,
          // padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: Colors.blue[100]!, spreadRadius: 1),
            ],
          ),
          child: Text('Node ${a}')),
    );
  }

  final Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  final node4 = Node.Id(4);
  final node5 = Node.Id(5);
  final node6 = Node.Id(6);
  final node8 = Node.Id(7);
  final node7 = Node.Id(8);
  final node9 = Node.Id(9);
  final node10 = Node.Id(10);
  final node11 = Node.Id(11);
  final node12 = Node.Id(12);
  final node41 = Node.Id(41);
  final node42 = Node.Id(42);
  final node43 = Node.Id(43);
  final node44 = Node.Id(44);
  final node45 = Node.Id(45);

  @override
  void initState() {
    final node1 = Node.Id(1)..nodeType = NodeType.main;
    final node2 = Node.Id(2);
    final node3 = Node.Id(3)..nodeType = NodeType.main;
    final node31 = Node.Id(31)..nodeType = NodeType.main;
    final node32 = Node.Id(32)..nodeType = NodeType.main;
    final node33 = Node.Id(33);
    final node34 = Node.Id(34);
    final node35 = Node.Id(35);
    final node36 = Node.Id(36);

    graph.addEdge(node1, node2);
    graph.addEdge(node1, node3, paint: Paint()..color = Colors.red);
    graph.addEdge(node1, node4, paint: Paint()..color = Colors.blue);

    graph.addEdge(node3, node31);
    graph.addEdge(node3, node35);
    graph.addEdge(node3, node10, paint: Paint()..color = Colors.black);

    graph.addEdge(node31, node32);
    graph.addEdge(node31, node33);
    graph.addEdge(node31, node36);

    graph.addEdge(node32, node34);
    graph.addEdge(node32, node7);

    graph.addEdge(node10, node41);
    graph.addEdge(node10, node42);

    // graph.addEdge(node33, node43);
    // graph.addEdge(node33, node44);
    // graph.addEdge(node43, node45);
    // graph.addEdge(node6, node7, paint: Paint()..color = Colors.red);
    // graph.addEdge(node6, node8, paint: Paint()..color = Colors.red);
    // graph.addEdge(node4, node9);
    // graph.addEdge(node11, node10, paint: Paint()..color = Colors.black);
    // graph.addEdge(node4, node11, paint: Paint()..color = Colors.red);
    // graph.addEdge(node11, node12);

    final map = <Node, int>{};
    graph.edges.forEach((element) {
      map[element.source] = (map[element.source] ?? 0) + 1;
    });

    // graph.nodes.forEach((element) {
    //   print('${element.key}  ${map[element]}');
    //   if ((map[element] ?? 0) == 1 && element.nodeType == NodeType.alternate) {
    //     element.nodeType = NodeType.singleAlter;
    //   }
    // });

    builder
      ..siblingSeparation = (200)
      ..levelSeparation = (40)
      ..subtreeSeparation = (150)
      ..orientation = (BuchheimWalkerConfiguration.ORIENTATION_LEFT_RIGHT);
  }

  void addNode() {
    // graph.addEdge(node11, node12);

    graph.addEdge(node7, node10, paint: Paint()..color = Colors.black);
  }
}
