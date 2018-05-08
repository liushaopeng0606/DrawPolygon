//
//  AmapViewController.m
//  Test
//
//  Created by 刘少鹏 on 2018/5/4.
//  Copyright © 2018年 刘少鹏. All rights reserved.
//

#import "AmapViewController.h"
#import <Masonry.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>



@interface AmapViewController ()<MAMapViewDelegate>

@property (nonatomic, strong) MAMapView *mapView;


@end

@implementation AmapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createAllView];
    
    
}
#pragma mark  - 创建所有视图
- (void)createAllView {
    
    self.mapView = [[MAMapView alloc] init];
    self.mapView.delegate = self;
    [self.view addSubview:self.mapView];
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    //如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    //地图的缩放级别的范围从3到19级，共17个级别，调用MAMapView的setZoomLevel方法设置地图的缩放级别，用来缩放地图
    [self.mapView setZoomLevel:15 animated:YES];
    
    
    [self drawMultiGraph];
    
}

#pragma makr - 绘制多边形
- (void)drawMultiGraph {

    //34.807668, 113.573765
    //34.807673, 113.577865
    //34.805251, 113.578148
    //34.805071, 113.573865
    
    //根据经纬度坐标数据生成闭合多边形


    CLLocationCoordinate2D points[4];
    
    points[0] =CLLocationCoordinate2DMake(34.807668, 113.573765);
    
    points[1] =CLLocationCoordinate2DMake(34.807673, 113.577865);
    
    points[2] =CLLocationCoordinate2DMake(34.805251, 113.578148);
    
    points[3] =CLLocationCoordinate2DMake(34.805071, 113.573865);
    
    
    MAPolygon* poly = [MAPolygon polygonWithCoordinates:points count:4];
    
    [_mapView addOverlay:poly];
    
    
}
- (MAOverlayRenderer *)mapView:(MAMapView *)mapView rendererForOverlay:(id <MAOverlay>)overlay
{
    if ([overlay isKindOfClass:[MATileOverlay class]])
    {
        MATileOverlayRenderer *tileOverlayRenderer = [[MATileOverlayRenderer alloc] initWithTileOverlay:overlay];
        
        return tileOverlayRenderer;
    }
    
    if([overlay isKindOfClass:[MAPolygon class]])
        
    {
        
        MAPolygonRenderer *polygonview = [[MAPolygonRenderer alloc]initWithPolygon:(MAPolygon*)overlay];
        //笔触宽度
        polygonview.lineWidth = 3;
        //笔触颜色
        polygonview.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
        //填充颜色
        polygonview.fillColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
        return polygonview;
    }
    
    
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
