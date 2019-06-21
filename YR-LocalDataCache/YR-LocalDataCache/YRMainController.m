//
//  YRMainController.m
//  YR-DataCache
//
//  Created by 杨荣 on 2019/6/20.
//  Copyright © 2019年 深圳市乐售云科技有限公司. All rights reserved.
//

#import "YRMainController.h"
#import "YRNSUserDefaultController.h"
#import "YRPlistController.h"
#import "YRNSCodingController.h"
#import "YRNSHomeDictionaryController.h"
#import "YRCoreDataController.h"


@interface YRMainController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation YRMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"本地数据缓存";
    
    [self setupUI];

}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithObjects:@"NSUserDefault",@"plist文件",@"解归档",@"手动存放沙盒",@"CoreData", nil];
    }
    return _dataArray;
}

- (void)setupUI {
    UITableView *tableView = [[UITableView alloc] initWithFrame:(CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)) style:(UITableViewStyleGrouped)];
    tableView.rowHeight = 60;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
}

#pragma mark UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            YRNSUserDefaultController *controller = [[YRNSUserDefaultController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 1:
        {
            YRPlistController *controller = [[YRPlistController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 2:
        {
            YRNSCodingController *controller = [[YRNSCodingController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 3:
        {
            YRNSHomeDictionaryController *controller = [[YRNSHomeDictionaryController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
        case 4:
        {
            YRCoreDataController *controller = [[YRCoreDataController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}
@end
