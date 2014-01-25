import 'dart:html';

SelectElement sizeElem = querySelector('#size');
SelectElement lineLengthElem = querySelector('#lineLength');
InputElement contentElem = querySelector('#content');
CanvasElement canvas = querySelector('canvas');
CanvasRenderingContext2D ctx = canvas.context2D;

void main() {
  sizeElem.onChange.listen((event) {
    canvas.context2D.font = '${sizeElem.value}px Verdana';
    update();
  });
  sizeElem.onChange.listen((event) => update());
  contentElem.onKeyUp.listen((event) => update());
  lineLengthElem.onChange.listen((event) {
    querySelector('#container').style.width = '${lineLengthElem.value}px';
    update();
  });

  update();
}

void update() {
  var content = contentElem.value;
  var width = ctx.measureText(content).width;
  var maxWidth = int.parse(lineLengthElem.value);
  canvas..width = maxWidth + 50
        ..height = (double.parse(sizeElem.value) * 1.2 + 0.5).toInt();
  if (width > maxWidth) {
    contentElem.style.backgroundColor = '#CC1234';
  } else {
    contentElem.style.backgroundColor = '#12CC34';
  }
  ctx..clearRect(0, 0, canvas.width, canvas.height)
     ..font = '${sizeElem.value}px Verdana'
     ..textBaseline = 'top'
     ..fillText(content, 0, 0);
}