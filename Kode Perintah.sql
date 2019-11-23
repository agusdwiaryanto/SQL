create database nama;
create tabel nama(id_nahkoda int(3), nahkoda varchar(45), primary key(id_nahkoda));


select *from nahkoda; //menampilkan isi tabel nahkoda
select id_nahkoda, nama_nahkoda from nahkoda; //menampilkan id dan nama nahkoda
select *from nahkoda where rating=3; //menampilkan record dgn rating 3
select nama_nahkoda, umur from nahkoda where rating=3; //menampilkan nama dan umur dengan rating 3
select *from nahkoda where rating=3 or umur=35; //menampilkan record dgn rating 3 atau umur 35

select id_kapal from kapal where nama_kapal like '%jaya%' and warna_kapal like '%merah%'; //menampilkan id_kapal yang bernama jayaloka dan berwarna merah
select nama_training from training where nama_training like '%nahkoda%'; //menampilkan nama training yang terdapat kata nahkoda-nya
select *from mengikuti_training order by id_nahkoda asc/desc; //menampilkan data mengikuti_training diurutkan dari id nahkoda terkecil/terbesar
select nama_nahkoda from nahkoda where umur>/<43; //menampilkan nama nahkoda yang umurnya diatas/dibawah 43
select nama_kapal from kapal where warna_kapal='hijau' and id_kapal=103; //menampilkan nama kapal dari tabel kapal yang memiliki warna kapal hijau dan id kapal 103

select id_kapal, id_job from job where tanggal like '%15%'; //menampilkan idkapal dan id job yang mendapatkan job pada tanggal 15
select *from  nahkoda where rating<=8 and umur>=20; //menampilkan data nahkoda  dengan rating kurang dari sama dengan 8 dan umur lebih dari sama dengan 20
select nama_nahkoda from nahkoda where nama_nahkoda like '%o' order by id_nahkoda asc; //menampilakan nama nahkoda yang memiliki nama belakang O diurutkan id nahkoda terkecil
select *from nahkoda  where rating between 1 and 5 order by id_nahkoda desc; //menampilkan data nahkoda dengan rating 1-5 dan diurutkan idnya dariterbesar

select *from job where tanggal like '%15%' and id_nahkoda<25; //menampilkan record pada tabel job dengan tanggal mengandung angka 15 dan id nahkoda <25
select *from training where id_training like '%4' or nama_training like '%al'; //menampilkan record padatabel training dengan id training 4 atau nama training berakhiran al

select tanggal from job where id_kapal>=103 and id_job like '%14%'; //menampilkan tanggal pada tabel job dengan id kapal>=103 dan id job mengandung angka '14'
select *from job where tanggal like '%11%' group by id_kapal; // menampilkan data job dengan tanggal mengandung '11' dikelompokan berdasarkan id kapal (tidak ada duplikasi id kapal)
/* Pembanding= (umur/rating) */
select *from nahkoda where (umur/rating)=7; //menampilkan data nahkoda dengan nilai pembanding=7
select rating,id_nahkoda from nahkoda where (umur/rating)<=10 order by rating asc; //menampilkan rating, id nahkoda dengan nilai pembanding <= 10 diurutkan sesuai rating terkecil
select id_nahkoda, tanggal from job where id_nahkoda>=35 order by tanggal desc; //menampilkan id nahkoda, tanggal dari tabel job dengan id nahkoda >=35 diurutkan sesuai tanggal pelaksanaan paling akhir

select sum(rating) from nahkoda; //menampilkan total rating
select avg(rating) as rerata_nilai from nahkoda; //menampilkan rata-rata rating dengan alias rerata_nilai di tabel nahkoda
select count(*) from mengikuti_training; //menampilkan jumlah data pada tabel mengikuti_training
select count(*), max(rating) from nahkoda; //menampilkan jumlah data dan rating terbaik pada nahkoda

select distinct rating from nahkoda; //mencegah duplikasi data yang ditampilkan

/* fungsi sistem */
select database(); //menampilkan database yang sdg digunakan
select last_insert_id(); //menampilkan info data terakhir yg digenerate
select session_user(); //menampilakan informasi pemakai




/* menampilkan tanggal n waktu di komputer sistem*/
select dayofmonth(tanggal) from job; //mengambil data tanggalsaja dari tanggal lengkap
select date(tanggal) from job;
select date_format(tanggal, '%M %D %Y') from job; //mnegubah format tampilan tanggal
select curdate(); //menampilkan tanggal sekarang
select curtime(); //menampilkan waktu sekarang
select current_timestamp(); //menampilkan waktu saat ini
select now(); //menampilkan waktu saat ini
select date_format('2012-04-19', '%M %D %Y'); //mengkonversi tangal sesuai yang diingnkan
select dayname('1999-08-17'); //menampilkan nama hari dari tangal
select dayofmonth('2012-04-19'); //menamlikan nomor hari dari tanggal
select month('2012-04-19'); //menampilkan bagian bulan
select year('2012-04-19'); //menampilkan bagian tahun
select hour('10:20:11'); //menampilkan bagian jam
select minute('10:20:11'); //menampilkan bagian menit
select second('10:20:11'); //menampilkan bagian detik

/* menformat tanggal sesuai yg diinginkan */
/* fungsi agregat*/ 
select sum(umur) from nahkoda;
count(x) menghitung jumlah record dari suatu kolom

/*fungsi String*/
select ascii(id_nahkoda) from nahkoda;
select char(id_nahkoda) from nahkoda;
select length(nama_nahkoda) from nahkoda; //menghitung panjang karakter
select concat(id_nahkoda, nama_nahkoda) from nahkoda; //mengabungkan beberapa string
select insert(x, y, z, j) from nahkoda;
select instr(x, y) from nahkoda;
select concat(id_nahkoda, nama_nahkoda) from nahkoda;
select reverse(nama_nahkoda) from nahkoda; //membalikan urutan penulisan agus => suga
select rtrim/ltrim(nama_nahkoda) from nahkoda; //membuang spasi di sebelah kanan/kiri string nama_nahkoda
select mid(x,y,z) //mengambil data string x sejumlah z karakter mulai dari posisi y
select left/right(x,y) //mengambil sejumlah y karakter dari string x dimulai dari posisi pertaa/terakhir
select locate(x,y,z) //memberikan posisi string x didalam string y mulai posisi z

/* nested query */
//atas tampilkan, bawah kondisi
// ada kunci tamu (c = forign key dan primary)

select a from b where c in / not in 
(select c from d where e);

select *from kapal where id_kapal in (select id_kapal from job where warna_kapal like '%hijau%');

tampilkan nama nahkoda 
select nama_nahkoda from nahkoda where id_nahkoda in (select id_nahkoda from tutor_training);

tampilkan nama nahkoda yang tidak menjadi tutor training dan diberi alias mesakke
select nama_nahkoda as mesakke from nahkoda where id_nahkoda not in (select id_nahkoda from tutor_training);

tampilkan id nahkoda yang mengemudikan kapal berwarna biru
select id_nahkoda from job where id_kapal in (select id_kapal from kapal where warna_kapal like '%biru%');

select idjabatan from menjabat_sebagai where idpegawai not in (select idpegawai from pegawai where pegawai_nama like '%a%');
/* menampilkan nama pelangan yang bertransaksi dibawah jam 12 */
select pelanggan_nama from pelanggan where no_polisi in (select no_polisi from faktur where hour(faktur_tgl)<12);
select dayname(faktur_tgl) from faktur where no_polisi in(select no_polisi from pelanggan where pelanggan_km<150000);