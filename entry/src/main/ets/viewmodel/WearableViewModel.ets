import { DataModel } from '../models/DataModel';
import { SongModel } from '../models/SongModel';
import { NavigationService } from '../services/NavigationService';

export default class WearableViewModel {
  private songList: SongModel[] = [];
  navigationService: NavigationService = NavigationService.getInstance();

  constructor() {
    this.songList = DataModel.SONG_LIST;
  }

  public getSongList(): SongModel[] {
    return this.songList;
  }

  public getSongById(id: number): SongModel | undefined {
    return this.songList[id];
  }

  public navigateToPage(route: string, param: SongModel): void {
    this.navigationService.pageInfos.pushPath({ name: route, param: param})
  }
}