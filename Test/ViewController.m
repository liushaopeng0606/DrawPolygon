//
//  ViewController.m
//  Test
//
//  Created by 刘少鹏 on 2017/12/11.
//  Copyright © 2017年 刘少鹏. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>
#import "AmapViewController.h"



@interface ViewController ()

@property (nonatomic, strong) UIButton *nextBtn;

@end

@implementation ViewController

#pragma mark - 视图加载完成
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextBtn.backgroundColor = [UIColor blueColor];
    [self.nextBtn setTitle:@"高德地图" forState:UIControlStateNormal];
    [self.nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.nextBtn addTarget:self action:@selector(nextBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextBtn];
    [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(120, 50));
    }];
    

    
    
}
#pragma mark - 按钮点击事件
- (void)nextBtnAction:(UIButton *)sender {
    
    AmapViewController *amapVC = [[AmapViewController alloc] init];
    [self.navigationController pushViewController:amapVC animated:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
