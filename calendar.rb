
# Dateクラスは組み込みではないため、requireする必要がある。
require 'date'


# 月ごとの出力用メソッド
def calendar_month(year: Date.today.year, month: Date.today.month)

	# 初日を取得
	firstday = Date.new(year, month, 1)
	# 月末を取得
	lastday = Date.new(year, month, -1)


	# 月の全ての日を取得し、string型に変換(rjustメソッドはstringクラス)で日ごとの幅を指定
	days = (1..lastday.day).map{|n| n.to_s.rjust(4)}

	# 初日の曜日番号を取得
	start = firstday.wday

	# 月を取得
	puts lastday.strftime("%Y" "%B").center(28)

	# 曜日配列に空白を入れて結合し出力
	puts ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Stu"].join(" ")


	# 初日の曜日番号から初日が始まる曜日分右にシフト
	start.times do
		print "    "
	end
	# 一週間ごとに改行を挟み、全ての月を表示
	days.each do |day|
		if (start+1)%7 == 0
			print day + "\n"
		else
			print day
		end
		start +=1
	end

	print "\n"

end


# 1~12月をeachで回し、今年のカレンダーを出力
def calendar(year: Date.today.year)
	(1..12).each do |month|
		calendar_month(year: year, month: month)
	end
end


# calendarメソッドを呼び出す
calendar


