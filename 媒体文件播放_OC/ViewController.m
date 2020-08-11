//
//  ViewController.m
//  媒体文件播放_OC
//
//  Created by Space Zhong on 2020/8/5.
//  Copyright © 2020 Space Zhong. All rights reserved.
//

#import "ViewController.h"
#import <AVKit/AVKit.h>
#import "AVPlayViewVC.h"
#import "AVListModel.h"
#import "AVListCell.h"
#import "AVPlayViewVC.h"
#import "AVPlayerVC.h"
//#import <AVFoundation/AVFoundation.h>

static NSString * const AVListCellID = @"AVListCell";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * data;
@property(nonatomic,strong)AVPlayerViewController * playViewVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    UITableView * tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0,64,self.view.frame.size.width,self.view.frame.size.height - 64);
//    tableView.frame = self.view.bounds;
    [tableView registerClass:[AVListCell class] forCellReuseIdentifier:AVListCellID];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    AVListModel * model00 = [[AVListModel alloc] init];
    model00.title = @"利用AVPlayerViewController 播放 mp4 文件";
    AVListModel * model01 = [[AVListModel alloc] init];
    model01.title = @"利用AVPlayer 播放 mp4 文件";
    
    
    [self.data addObject:model00];
    [self.data addObject:model01];
}

#pragma mark UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    AVListCell * cell =  [tableView dequeueReusableCellWithIdentifier:AVListCellID];
    AVListModel * model = self.data[indexPath.row];
    cell.model = model;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        //利用AVPlayerViewController 播放 mp4 文件
        case 0:
        {
            AVPlayViewVC * avViewVC = [[AVPlayViewVC alloc] init];
            [self presentViewController:avViewVC animated:YES completion:nil];
        }
            break;
        case 1:
        {
            AVPlayerVC * playVC = [[AVPlayerVC alloc] init];
            [self presentViewController:playVC animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

#pragma mark lazy-load

-(NSMutableArray *)data
{
    if (_data == nil) {
        _data = [NSMutableArray array];
    }
    return _data;
}




@end
