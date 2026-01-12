import lottie, { AnimationItem } from '@ohos/lottie';
import { NavigationService } from '../services/NavigationService';
import { ScanPage } from './ScanPage';
import { ListPage } from './ListPage';
import { SongPage } from './SongPage';

@Entry
@Component
struct SearchPage {
  private politeChickyController: CanvasRenderingContext2D = new CanvasRenderingContext2D();
  private politeChicky: string = 'politeChicky';
  private politeChickyPath: string = 'rawfile/tap_scan.json';
  private animateItem?: AnimationItem;
  private onClicked?: boolean = false;

  navigationService: NavigationService = NavigationService.getInstance();

  @Builder
  routeMap(name: string) {
    NavDestination() {
      if (name === 'ScanPage') {
        ScanPage()
      } else if (name === 'ListPage') {
        ListPage();
      } else if (name === 'SongPage') {
        SongPage()
      }
    }
    .onBackPressed( ()=>true )
    .hideTitleBar(true)
  }

  build() {
    Navigation(this.navigationService.pageInfos) {
      Column() {
        Stack() {
          Canvas(this.politeChickyController)
            .width(125)
            .height(125)
            .borderRadius(3)
            .alignSelf(ItemAlign.Center)
            .onReady(() => {
              this.animateItem = lottie.loadAnimation({
                container: this.politeChickyController,
                renderer: 'canvas',
                loop: true,
                autoplay: true,
                name: this.politeChicky,
                path: this.politeChickyPath
              })
            })

          Text('Tap')
            .fontColor(Color.White)
        }
        .width('100%')
        .height('100%')
        .alignSelf(ItemAlign.Center)
        .onClick(() => {
          this.navigationService.pageInfos.pushPath({ name: 'ScanPage' })
        })
      }
      .backgroundColor($r('app.color.app_background_search'))
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .alignSelf(ItemAlign.Center)
      .alignItems(HorizontalAlign.Center)
    }
    .mode(NavigationMode.Stack)
    .navDestination(this.routeMap)
    .ignoreLayoutSafeArea()
    .hideTitleBar(true)
    .width('100%')
    .height('100%')
  }

  onPageHide(): void {
    lottie.destroy();
  }
}