//
//  CustomView.m
//  RoundShapeLayer
//
//  Created by xiaowei on 16/7/1.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import "CustomView.h"

@interface CustomView ()

@property(nonatomic,strong)CAShapeLayer *shapeLayer1;
@property (nonatomic,strong)CAShapeLayer *shapeLayer2;

@end

@implementation CustomView

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self){
        
    }
    return self;
}


- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    [_shapeLayer1 removeAllAnimations];	
    [_shapeLayer2 removeAllAnimations];
    [_shapeLayer1 removeFromSuperlayer];
    _shapeLayer1 = nil;
    [_shapeLayer2 removeFromSuperlayer];
    _shapeLayer2 = nil;
    
    _shapeLayer1 = [CAShapeLayer layer];
    _shapeLayer2 = [CAShapeLayer layer];
    CGFloat pAngle = (M_PI*2)*progress;
    if(pAngle>M_PI){
        pAngle = M_PI*2 - (pAngle-M_PI);
    }else{
        pAngle = M_PI - pAngle;
    }
    if(progress >= 1.0){
        pAngle = -M_PI;
    }
    UIBezierPath *path1 = [UIBezierPath bezierPathWithArcCenter:self.center radius:self.frame.size.width/2-40 startAngle:(M_PI) endAngle:pAngle clockwise:NO];
    _shapeLayer1.path = path1.CGPath;
    _shapeLayer1.lineWidth = 20;
    _shapeLayer1.strokeColor = [UIColor greenColor].CGColor;
    _shapeLayer1.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:_shapeLayer1];
    
    
    CGFloat rAngle = M_PI*2*(1.0-progress);
    if(rAngle>M_PI){
        rAngle = rAngle - M_PI;
    }else{
        rAngle = M_PI + rAngle;
    }
    if(progress <= 0){
        rAngle = M_PI*7/2;
    }
    UIBezierPath *path2 = [UIBezierPath bezierPathWithArcCenter:self.center radius:self.frame.size.width/2-40 startAngle:M_PI endAngle:rAngle clockwise:YES];
    _shapeLayer2.path = path2.CGPath;
    _shapeLayer2.lineWidth = 20;
    _shapeLayer2.strokeColor = [UIColor orangeColor].CGColor;
    _shapeLayer2.fillColor = [UIColor clearColor].CGColor;
    [self.layer addSublayer:_shapeLayer2];
    
    CABasicAnimation *base1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    base1.fromValue = @0;
    base1.toValue = @1.0;
    base1.duration = 1.0;
    [_shapeLayer1 addAnimation:base1 forKey:@""];
    
    CABasicAnimation *base2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    
    base2.fromValue = @0.0;
    base2.toValue = @1.0;
    base2.duration = 1.0;
    [_shapeLayer2 addAnimation:base2 forKey:@""];
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
