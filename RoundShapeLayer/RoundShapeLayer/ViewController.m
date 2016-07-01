//
//  ViewController.m
//  RoundShapeLayer
//
//  Created by xiaowei on 16/7/1.
//  Copyright © 2016年 xiaowei. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
@interface ViewController ()

@end

@implementation ViewController{
    
    CustomView *cView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];

    cView = [[CustomView alloc]initWithFrame:CGRectMake(10, 50, 300, 300)];
    cView.backgroundColor = [UIColor whiteColor];
    cView.progress = 1.0;
    
    [self.view addSubview:cView];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(50, 440, 80, 40);
    btn.backgroundColor = [UIColor grayColor];
    [btn setTitle:@"click me" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}
- (void)clickAction{
    
    CGFloat index = arc4random()%10/10.0;
    NSLog(@"index = %f",index);
    cView.progress = index;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
