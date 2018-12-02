import 'package:bullseye/bullseye.dart';
import 'package:source_span/source_span.dart';
import 'node.dart';

abstract class Expression extends Node {
  Expression(List<Token> comments, FileSpan span) : super(comments, span);

  Expression get innermost => this;
}

class Identifier extends Expression {
  final Token token;

  Identifier(List<Token> comments, FileSpan span, this.token)
      : super(comments, span);

  String get name => token.span.text;
}

class ParenthesizedExpression extends Expression {
  final Expression innermost;

  ParenthesizedExpression(List<Token> comments, FileSpan span, this.innermost)
      : super(comments, span);
}

class AwaitedExpression extends Expression {
  final Expression target;

  AwaitedExpression(List<Token> comments, FileSpan span, this.target)
      : super(comments, span);
}

class NonNullCoercedExpression extends Expression {
  final Expression target;

  NonNullCoercedExpression(List<Token> comments, FileSpan span, this.target)
      : super(comments, span);
}
