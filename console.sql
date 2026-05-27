-- 1
CREATE TABLE KhoaHoc (
    MaKH VARCHAR(20) PRIMARY KEY,
    TenKH VARCHAR(150) NOT NULL,
    MoTa TEXT,
    HocPhi NUMERIC(12, 2) NOT NULL CHECK (HocPhi >= 0)
);

-- 2
CREATE TABLE GiangVien (
    MaGV VARCHAR(20) PRIMARY KEY,
    HoTen VARCHAR(100) NOT NULL,
    ChuyenNganh VARCHAR(100),
    SoDT VARCHAR(15)
);

-- 3
CREATE TABLE HocVien (
    MaHV VARCHAR(20) PRIMARY KEY,
    HoTen VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    NgayDangKy DATE DEFAULT CURRENT_DATE
);

-- 4
CREATE TABLE LopHoc (
    MaLop VARCHAR(20) PRIMARY KEY,
    ThoiGianHoc VARCHAR(100),
    MaKH VARCHAR(20) NOT NULL,
    MaGV VARCHAR(20),
    
    CONSTRAINT fk_lophoc_khoahoc 
        FOREIGN KEY (MaKH) REFERENCES KhoaHoc(MaKH) 
        ON DELETE RESTRICT,
        
    CONSTRAINT fk_lophoc_giangvien 
        FOREIGN KEY (MaGV) REFERENCES GiangVien(MaGV) 
        ON DELETE SET NULL
);

-- 5
CREATE TABLE ChiTietLopHoc (
    MaLop VARCHAR(20),
    MaHV VARCHAR(20),
    NgayGhiDanh DATE DEFAULT CURRENT_DATE,
    
    PRIMARY KEY (MaLop, MaHV),
    
    CONSTRAINT fk_chitiet_lophoc 
        FOREIGN KEY (MaLop) REFERENCES LopHoc(MaLop) 
        ON DELETE CASCADE,
        
    CONSTRAINT fk_chitiet_hocvien 
        FOREIGN KEY (MaHV) REFERENCES HocVien(MaHV) 
        ON DELETE CASCADE
);
