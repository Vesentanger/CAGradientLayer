#CAGradientLayer颜色渐变
*	Gradient：本身就是梯度的意思，所以这里作为渐变色来理解

		1.CAGradientLayer用于处理渐变色的层结构
		2.CAGradientLayer的渐变色可以做隐式动画
		3.CAGradientLayer可以用作PNG的遮罩效果
		
*	关于CAGradientLayer的坐标系统
	
	为什么要提到CAGradientLayer的坐标系统呢？因为渐变色的作用范围，变化梯度的方向，颜色变换的作用点都和CAGradientLayer的坐标系统有关
![image](http://blog.it985.com/wp-content/uploads/2015/02/%E5%B1%8F%E5%B9%95%E5%BF%AB%E7%85%A7-2015-02-23-%E4%B8%8A%E5%8D%8810.06.18.png)

*	根据上图的坐标，设定好起点和终点，渐变色的方向就会根据起点指向终点的方向来渐变了

		1.CAGradientLayer的坐标系统是从（0，0）到（1，1）绘制的矩形
		2.CAGradientLayer的frame值的size不为正方形的话，坐标系统会被拉伸
		3.CAGradientLayer的startPoint和endPoint会直接决定颜色的绘制方向
		4.CAGradientLayer的颜色分割点时以0到1的比例来计算的
##效果图
![image](https://github.com/Vesentanger/CAGradientLayer/blob/master/%E6%95%88%E6%9E%9C%E5%9B%BE.png)
##具体参照文件夹OC代码中的注释
