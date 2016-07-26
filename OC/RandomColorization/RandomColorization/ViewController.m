//
//  ViewController.m
//  RandomColorization
//
//  Created by 梅守强 on 16/7/26.
//  Copyright © 2016年 eshine. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarHidden = YES;
}

- (IBAction)playMusicButtonDidTouch:(id)sender {
    // play bgm
    NSURL *bgMusic = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Ecstasy" ofType:@"mp3"]];
    NSError *error = [NSError new];
    self.audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:bgMusic error:&error];
    if (!error) {
        [self.audioPlayer prepareToPlay];
        [self.audioPlayer play];
    } else {
        NSLog(@"%@", error);
    }
    // 定时改变背景色
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(randomColor) userInfo:nil repeats:YES];
    [timer fire];
    // graditent color
    self.gradientLayer = [CAGradientLayer new];
    self.gradientLayer.frame = self.view.bounds;
    
    // 设定颜色组
    UIColor *color1 = [UIColor colorWithWhite:0.5 alpha:0.2];
    UIColor *color2 = [UIColor colorWithRed:1.0 green:0 blue:0 alpha:0.4];
    UIColor *color3 = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0.3];
    UIColor *color4 = [UIColor colorWithRed:0 green:0 blue:1.0 alpha:0.3];
    UIColor *color5 = [UIColor colorWithWhite:0.4 alpha:0.2];
    
    self.gradientLayer.colors = @[(__bridge id)color1.CGColor, (__bridge id)color2.CGColor, (__bridge id)color3.CGColor, (__bridge id)color4.CGColor, (__bridge id)color5.CGColor];
    self.gradientLayer.locations = @[@(0.10), @(0.30), @(0.50), @(0.70), @(0.90)];
    // 设置渐变颜色方向
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1, 1);
    [self.view.layer addSublayer:self.gradientLayer];
    
}

- (void)randomColor {
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
