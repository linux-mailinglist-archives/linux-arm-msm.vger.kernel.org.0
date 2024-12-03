Return-Path: <linux-arm-msm+bounces-40127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9845D9E2AA4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 19:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29B11B60B92
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 16:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEF621F8937;
	Tue,  3 Dec 2024 16:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zQJe5Cud"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FC71F8AFA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 16:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733243261; cv=none; b=iy0rRDATBT3TCqiGzFOUtH8cMPIsSB4zoCASOmBwYxfNKZhc1y4h2M6XL0gBZbDzhjOjmKAduB8tW+3fqeUibyq+K7XnCnE293Sn/SoYRqlxOZp3aVrvyekhBiSvYmM0xr8d9qP2Tm9nxfI5ZrVgzpVY8v7lYvMy0/GXG7Rrn2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733243261; c=relaxed/simple;
	bh=3ilJ60KhZP1gzrR1HYyGW8yGwQLnglqIbeYGm6MINtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=trRfdlmh6FhjksB9qCD+9UO8EIiZbW1grBQqNPIqeFn9qwBEAFVwvKiiceEdbFNHlw59NtNRvw1ql/CSzD3KdaZKDfvtXHgFOE52ySZlwbjkkgPm6x3kvisdv3AyfD+qk/qSVS9YScs0Mhsjzl0Xe7NVYOGkn9dW9cifMOmz+70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zQJe5Cud; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-434a044dce2so70892075e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 08:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733243257; x=1733848057; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T/3G8yPHdtPq2X4oFg8aeUad7hD0nbgD7cFuNqRSr8M=;
        b=zQJe5CudbLWZYIdBmeBwU2YQnuWwV0y4td+wqZ/5rZIu4ltBSo/w6KloezrN8JkhMw
         +6aR9LZJWdLW8Wqev7aZt803OsQn5FA4mC6gxWYQ5TmjsQ5dzj2aKkaYYD1pXm8yXw9L
         T+1AOjGp7t+BpYjif2C5ctIpoAr0llQwGdraFvyw20hiYPqW71KJOH2ahRMetDZud7KS
         5NPYmque5P6kTfJC3v0AE1IHQb5Dm68upVf0WZNWv1voilTdEbYKOuJili3GKkWG1/2Y
         UlCDPE7x2lfSSe7SA0ZzuQyoD3iaTS/Y1E4qynyr22dbJX1y0HAucVDQBV1G2qMMCBOw
         8VsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733243257; x=1733848057;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/3G8yPHdtPq2X4oFg8aeUad7hD0nbgD7cFuNqRSr8M=;
        b=t4xgO5EOBNpL8z10sJ6uqx1IV9A+yTfsES/i5WFJEU9gTmIovyx3srIlpVn6UKhHDf
         EAZJMjAtaRZWyFY/9P9GKmqAG4pSP1Kt6hq19Xq3JsxuOqQqV3f46tPnxVRqHI+jZMw3
         4vZJITMx1RXsKpjlptEwzeteiH8AwbqtJEYkJ8aUayOQC8gYHS9oXAqM/STQpx5Ku8lk
         fAcrNl6XOC+bxwh/IuyLZhnrB4Rr1wL075UOEpsBRVNNVIxzymGq0FvrxUZ+CKkEFbw+
         P65lh8bpw8fkGv4bVQ7RCGOUTbUr2da7FTLETEj0E6HmcaUkYaV0pCpmAXNUk0mNJXkW
         Cnxg==
X-Forwarded-Encrypted: i=1; AJvYcCVgxDU0TlAJZLlhtfPN1kLKqA6Dknb9Ut2CtSTFvpSbXnPw997aNukl5kmLdBFNGWtdeSYvj2rM2FIJkgn0@vger.kernel.org
X-Gm-Message-State: AOJu0YzzbsIJWgaK2IpyTFZltoOoz3hLlDn2Et5GPr0fx64/cgcHHJ+7
	QhOWCjnE17UQtlz8G/zEUpaW8Qc6KtGwFVVjQcW+Rk1tSETyaU8LkA1taW0psNU=
X-Gm-Gg: ASbGncsluFIul82J5GBJ1urRew9XoFV9ayOjcMRr3tp4l90M8KuHkKDE20ZqnetSo95
	VbwlYT/CIIVSXSX3oSgcq09/JPQJx3mqVWK2Jm5b5yQfxt+AgtYOOLKw5gCgr1BIx5uuj9gsaWD
	r3qX9L5raC9l/Qpy7++OuVUoKUrnQrfz5iBfoCa2JXybLSEhRGSxj6SnNdtUKJ0T0Y0hlr7vpaF
	h0ktmDUS/U8m9en/o+6VcL9pagvOzp+1TvlQP3XLz8FU/KhcMcIa/UaLdU=
X-Google-Smtp-Source: AGHT+IGEVUq1Uy9M3ElGXDaZu1Is65FzKHm+BqIdhN2cA4KiN6x31Zrevib2WHFALXQM/9EzR5gM2Q==
X-Received: by 2002:a05:600c:6b71:b0:432:d735:cc71 with SMTP id 5b1f17b1804b1-434d0a0e3c4mr29373885e9.25.1733243256678;
        Tue, 03 Dec 2024 08:27:36 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:da6:821e:40a0:d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd3a4bbsm16111295f8f.48.2024.12.03.08.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 08:27:36 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 03 Dec 2024 17:27:18 +0100
Subject: [PATCH] arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360
 separately
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-x1e80100-disable-smb2360-v1-1-80942b7f73da@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGUxT2cC/x2MywqDQAwAf0VybiCJdqn+SvGga7QBX2ygCOK/u
 3gcmJkTXJOpQ1OckPRvbtuagV8FxF+3Too2ZAYhqZilxoP1Q0yEg3nXz4q+9FIGQqGokcM7ZA9
 yvicd7XjW3/a6br+PE/5qAAAA
X-Change-ID: 20241129-x1e80100-disable-smb2360-20cec1656411
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

At the moment, x1e80100-pmics.dtsi enables two of the SMB2360 PMICs by
default and only leaves the third disabled. This was introduced in commit
a237b8da413c ("arm64: dts: qcom: x1e80100: Disable SMB2360_2 by default").
This is inconsistent and confusing. Some laptops will even need SMB2360_1
disabled by default if they just have a single USB-C port.

Make this consistent by keeping all SMB2360 disabled in x1e80100-pmics.dtsi
and enable them separately for all boards where needed. That way it is
always clear which ones are available and avoids accidentally trying to
read/write from missing chips when some of the PMICs are not present.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts               | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts    | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts                  | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts      | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts   | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi   | 8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi               | 4 ++++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                  | 8 ++++++++
 9 files changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index c9db6298d528ed505bae08e91bf4da02faef7d76..c3ec0bb2c42dfed9f5e9f56f18874b4ae6c0632c 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1062,11 +1062,19 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2360_0 {
+	status = "okay";
+};
+
 &smb2360_0_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l2b_3p0>;
 };
 
+&smb2360_1 {
+	status = "okay";
+};
+
 &smb2360_1_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l14b_3p0>;
diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index 975550139e1024420ed335a2a46e4d54df7ee423..4097d2677285757ce67eef76d8d17669c7130001 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -635,11 +635,19 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2360_0 {
+	status = "okay";
+};
+
 &smb2360_0_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l2b_3p0>;
 };
 
+&smb2360_1 {
+	status = "okay";
+};
+
 &smb2360_1_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l14b_3p0>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index f25991b887de3fca0092c5f81c881c5d8bd71aac..10f140ed08f47f2cd96e953d4ad3c75f3aad002a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -501,11 +501,19 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2360_0 {
+	status = "okay";
+};
+
 &smb2360_0_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l2b_3p0>;
 };
 
+&smb2360_1 {
+	status = "okay";
+};
+
 &smb2360_1_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l14b_3p0>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 39f9d9cdc10d8e79824b72288e2529536144fa9e..81c519e690f325f2d4d36c4a99061649da65ec87 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -932,11 +932,19 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2360_0 {
+	status = "okay";
+};
+
 &smb2360_0_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l2b_3p0>;
 };
 
+&smb2360_1 {
+	status = "okay";
+};
+
 &smb2360_1_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l14b_3p0>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index b112092fbb9fd955adca1ae8a76294c776fa2d1e..288e818961670be0d25b696730e7186a8d61b56e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -905,11 +905,19 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2360_0 {
+	status = "okay";
+};
+
 &smb2360_0_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l2b_3p0>;
 };
 
+&smb2360_1 {
+	status = "okay";
+};
+
 &smb2360_1_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l14b_3p0>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index ca5a808f2c7df66a861a933df407fd4bdaea3fe1..3d7e0230dc0381a2c2a3b0c5b766f5b854777937 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -717,11 +717,19 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2360_0 {
+	status = "okay";
+};
+
 &smb2360_0_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l2b_3p0>;
 };
 
+&smb2360_1 {
+	status = "okay";
+};
+
 &smb2360_1_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l14b_3p0>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 6835fdeef3aec10206e8b2839d23e4f3494afe1e..6941945b2f9a7e7b11598705fa22d3a6f2cc01c7 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -718,11 +718,19 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2360_0 {
+	status = "okay";
+};
+
 &smb2360_0_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d>;
 	vdd3-supply = <&vreg_l2b>;
 };
 
+&smb2360_1 {
+	status = "okay";
+};
+
 &smb2360_1_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d>;
 	vdd3-supply = <&vreg_l14b>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
index 5b54ee79f048e3208cbcd6f91e0cec073420fe63..d7a2a2b8fc6c30bdb10df81eac7d92306998838f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
@@ -491,6 +491,8 @@ smb2360_0: pmic@7 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		status = "disabled";
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;
@@ -504,6 +506,8 @@ smb2360_1: pmic@a {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		status = "disabled";
+
 		smb2360_1_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 5ef030c60abe2998d093ee60a6754a90cd5aaf72..ffd28fd8059895ec345f4ee8fe6a2c37e7989747 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -731,11 +731,19 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2360_0 {
+	status = "okay";
+};
+
 &smb2360_0_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l2b_3p0>;
 };
 
+&smb2360_1 {
+	status = "okay";
+};
+
 &smb2360_1_eusb2_repeater {
 	vdd18-supply = <&vreg_l3d_1p8>;
 	vdd3-supply = <&vreg_l14b_3p0>;

---
base-commit: 12b080aaf4275c579c91106ed926044b4d5df0af
change-id: 20241129-x1e80100-disable-smb2360-20cec1656411

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


