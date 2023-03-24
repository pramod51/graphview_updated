part of graphview;

class SugiyamaConfiguration {
  static const ORIENTATION_TOP_BOTTOM = 1;
  static const ORIENTATION_BOTTOM_TOP = 2;
  static const ORIENTATION_LEFT_RIGHT = 3;
  static const ORIENTATION_RIGHT_LEFT = 4;
  static const DEFAULT_ORIENTATION = 1;
  static const int DEFAULT_ITERATIONS = 10;

  static const int X_SEPARATION = 100;
  static const int Y_SEPARATION = 100;

  int levelSeparation = Y_SEPARATION;
  int nodeSeparation = X_SEPARATION;
  int orientation = DEFAULT_ORIENTATION;
  int iterations = DEFAULT_ITERATIONS;
  BendPointShape bendPointShape = SharpBendPointShape();

  int getLevelSeparation() {
    return levelSeparation;
  }

  int getNodeSeparation() {
    return nodeSeparation;
  }

  int getOrientation() {
    return orientation;
  }
}

abstract class BendPointShape {}

class SharpBendPointShape extends BendPointShape {}

class MaxCurvedBendPointShape extends BendPointShape {}

class CurvedBendPointShape extends BendPointShape {
  final double curveLength;

  CurvedBendPointShape({
    required this.curveLength,
  });
}
