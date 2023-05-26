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
taiko_image = Image.load('picture/taiko.jpg')
note_image = Image.load('picture/pomu.jpg')
background_image = Image.load('picture/haikei.png')

# 太鼓の位置とノーツの速度
taiko_y = Window.height - taiko_image.height
note_x = Window.width
note_y = Window.height - note_image.height
note_speed = 5

# ゲームループ
Window.loop do
  # 背景の描画
  Window.draw(0, 0, background_image)

  # 太鼓の描画
  Window.draw(100, taiko_y, taiko_image)

  # ノーツの描画
  notes.each do |note|
    if note == 1
      Window.draw(note_x, note_y, note_image)
    end
    note_x -= note_speed

    if note_x <= 0
      note_x = Window.width
    end

    # キー入力の受け付けと判定
    if Input.key_push?(K_SPACE) && note_y >= taiko_y && note_y <= taiko_y + taiko_image.height
      score += 100
    end
  end

  # ゲーム情報の描画
  Window.draw_font(10, 10, '太鼓の達人', Font.default)
  Window.draw_font(10, 40, 'ノーツの数：' + notes.size.to_s, Font.default)
  Window.draw_font(10, 70, '現在のスコア：' + score.to_s, Font.default)
end
