require 'dxruby'

# 太鼓の達人のゲームデータ（仮）
notes = [1, 0, 1, 1, 0, 1, 0, 1, 1, 1]  # 1がノーツあり、0がノーツなし

# ゲームの初期化
score = 0
index = 0

# ゲームウィンドウの設定
Window.caption = '太鼓の達人'
Window.width = 800
Window.height = 600

# 画像の読み込み
taiko_image = Image.load('picture/taiko2.jpeg')
note_image = Image.load('picture/pomu2.jpeg')
background_image = Image.load('picture/haikei2.jpeg')

# 太鼓の位置とノーツの速度
taiko_y = 200
note_speed = 7
note_x = Window.width
note_y = taiko_y - note_image.height

# ゲームループ
Window.loop do
  # 背景の描画
  Window.draw(0, 0, background_image)

  # 太鼓の描画
  Window.draw(200, taiko_y, taiko_image)

  # ノーツの描画
  if index < 100
    note = notes[index]
    if note == 1
      Window.draw(note_x, note_y, note_image)
    end
    note_x -= note_speed

    if note_x <= 0
      note_x = Window.width
      index += 1  # 次のノーツへ進む
    end

    # キー入力の受け付けと判定
    if Input.key_push?(K_SPACE) && note_x <= 200 && note_x >= 200 - note_image.width
      score += 100
    end
  end

  # ゲーム情報の描画
  Window.draw_font(10, 10, '太鼓の達人', Font.default, color:[0,0,0])
  Window.draw_font(10, 40, 'ノーツの数：' + notes.size.to_s, Font.default)
  Window.draw_font(10, 70, '現在のスコア：' + score.to_s, Font.default)
end