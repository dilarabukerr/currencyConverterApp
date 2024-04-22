### Bu kod bir para birimi dönüştürme uygulaması için basit bir iOS View Controller'ı içeriyor. İşlevsellik aşağıdaki adımları takip ediyor:

- 1- *URL ve URLSession Oluşturma:* Öncelikle, API'nin URL'sini oluşturuyor ve bir URLSession örneği alıyor. URLSession, web üzerinde veri alma ve gönderme işlemleri için kullanılır.
- 2- *URL'den Veri Alma:* URLSession ile API'den veri almak için dataTask fonksiyonu kullanılır. Bu fonksiyon, veri almak için bir istek yapar ve bu isteğin sonucunu bir closure içinde alır.
- 3- *Hata Kontrolü:* İstek sırasında herhangi bir hata olup olmadığını kontrol eder. Eğer hata varsa, bir UIAlertController kullanarak hatayı kullanıcıya gösterir.
- 4- *Veri Alma ve Ayrıştırma:* Eğer hata yoksa, API'den alınan veriyi ayrıştırmak için JSONSerialization kullanılır. API'den gelen JSON verisi, Dictionary türünde jsonResponse değişkenine ayrıştırılır.
- 5- *Ana İş Parçacığında Güncelleme:* JSON verisi ayrıştırıldıktan sonra, ana iş parçacığında (UI iş parçacığında) çalışan bir asenkron blok içinde UI elemanları güncellenir. Bu, UI'nın donmayacağı ve kullanıcı arayüzünün hızlı bir şekilde güncellenebileceği anlamına gelir.
- 6- *UILabel'ları Güncelleme*: JSON'dan alınan döviz kurları, UILabel'lar aracılığıyla kullanıcıya gösterilir.

- Bu kod, API'den döviz kurlarını almak için basit bir HTTP isteği gönderir, bu isteği işler ve sonucu kullanıcı arayüzünde gösterir. Hata durumunda uygun bir hata mesajı gösterilir.
