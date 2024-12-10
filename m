Return-Path: <linux-arm-msm+bounces-41236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FD29EAACA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 09:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23B971663D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 08:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0693023099D;
	Tue, 10 Dec 2024 08:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ipsr5u3v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030EB230990
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 08:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733819774; cv=none; b=sVlV+m3PKfqmXl5ADlMl/Z5aP8+CvJbZUveBAY8QVbgiHGcnQFL4OwJe3bjIQzV1aPqVJH2sjH/kQlDE44ybeTTvwbLVI3CH7bwX4rpZtymCKjRnsngLFLG9nyyzUN+/xI46q761O849RYjeNkNvj61ffOgvervHl7PxplB/uBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733819774; c=relaxed/simple;
	bh=uow1N9VBwkTBx4xQA1Z6vJux5tMwXu6x8kqawBjy95c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OuneyJCjJ28RQSPrwkAiLT+kRr6krfDvKO+0RY11EOvu5gWJeKd2DLDeQMVQkp8O/xm6YjGzQXxDpRMbuPC2Y7K+gqz95o+6Xau3tvE36zqk0vcmJ1Fwc9F/aJVFvPZYNYHEGGFOR0l73jZW5JzKwCFw3RIiux8nsVMHhnoolq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ipsr5u3v; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso759700966b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 00:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733819771; x=1734424571; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=58qniorQWaWIqV9FaGTtR2lysYb+BUrgZIhD2vCySDU=;
        b=Ipsr5u3vdMSA/9OewO5sB482khT0ViYj8uN3rdBAs60buAf/jfMYnqjP6GJu8ur/jQ
         CSjXNndMVw3PUrWwrulaj1kCZi/efHN15phhQrq45238BAFK8dpNvLwnkiBTdaBFssb/
         QpIYEYXncPM4BD+9bV+k1A6zdDuvJjmmaHBWvPIrAs6lN54cK0Spj4wNUmajlzrgEzy4
         ZHAPP6lAVJk/zqLNQ+yEBzneonMoKrYvIRtFWTKpWpEoJPKdA9b3H27mwoFdIPnAw9AM
         rHaP7GftWWnymqgVvINHqw4zmpJjrfqDbFKcMbl/66+SbiaWL14q/GiOJrd12NzMO/RW
         Cfgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733819771; x=1734424571;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58qniorQWaWIqV9FaGTtR2lysYb+BUrgZIhD2vCySDU=;
        b=a/pdbYmZ04jdm2v+O7P2M27PqkwWd6S88zngsf6LQnmsaE9VRkZQk8zlhmXnJ3mpzJ
         nDPfIXgoGzYn5470ZigEy4jIPCUG8pwY26N6ahMc8oWnn/IQe8sJJ5ZO4Ldm21akWkCA
         O49tp7J7Pt9cIgBP4rgQtUMCCG3mASXIJIAPCy30lJyvA1j1Ag78IkmNX+j0m9yOTPDK
         iDkc8RXo7zdG3bPUsse1vJIgLieNOe2xge9Skg9vIsOGJr+rbQsGPcMht9yUrYHkmG9Y
         7qtmPKFG6uj9gZIuigOBQMlV2kU82sl4aMkuEDMq43Or97KP3RGPWl5/qCJ3bfy5ai+q
         GonA==
X-Forwarded-Encrypted: i=1; AJvYcCVPO1+N4Yvm/hGfTZSmQT4kBBYq6nr9Lu+wPFNCe+TVQo0kzASlvMaRbP4CaPGFXn1uzqagRjwFmrnAMVP0@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp4cXo2KLoQJU9owdqrLkg6x4p5cRr89Kj9vpPVcFgvOdUR7zr
	uUsoqFJUg++7lH/qPolbzpPbut4qbYD8mhwdjzoVsycVPEneGoDEqA9RH1a+tJo=
X-Gm-Gg: ASbGncstKuyl4U+mX3UD4Smms4l9Qsptk1xQlh+Thd+YyqVMhsxrrb1w3eJxRsV+Z2S
	/PeUJNcgLnd3YBxuReXaIcdUlRvcCEAUW/vWRU6CDNfwpBlX0lhNXl9YObOHAGMVy3M6DUClPi/
	S1CskBe3oasSrjzyIDW08LLmUDX/+zf2cPkMDU/rapWcF150Qdqmol2/8esAbHtSP0qUC5i34LO
	UcztB5qr8UW8gdbgGq5ll/a3DdG2YEqR5KB5wO4OlWHdgI03Dcztp3vBk8g9SoIQ1E=
X-Google-Smtp-Source: AGHT+IGQPNbWbY7Am19yEaRzmYLXWQmVwscaAezJ1evdHhKgXkg1An9ckZEBx5n9PUbBDaZlE+eghw==
X-Received: by 2002:a17:907:774e:b0:aa6:79fa:b486 with SMTP id a640c23a62f3a-aa679fabfb7mr667984566b.49.1733819771260;
        Tue, 10 Dec 2024 00:36:11 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:6709:8d26:5167:3c1d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa66c30e99csm438827866b.160.2024.12.10.00.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 00:36:10 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 10 Dec 2024 09:36:01 +0100
Subject: [PATCH v2] arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360
 separately
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-x1e80100-disable-smb2360-v2-1-2449be2eca29@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHD9V2cC/3WNSw6CQBBEr0J67ZjuBvm48h6GxQANdIKMmTEEQ
 7i7I65dvkrVqw2CeJUA12QDL4sGdXMEPiXQjnYexGgXGRg5I+LKrCQlEqLpNNhmEhMeDac5GsZ
 WWsoveexBnD+99Loe6nsdedTwcv59PC30TX9SxvS/dCFDpsQq46boi7Szt0ln693Z+QHqfd8/v
 qH3pcEAAAA=
X-Change-ID: 20241129-x1e80100-disable-smb2360-20cec1656411
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>, 
 "Aiqun Yu (Maria)" <quic_aiquny@quicinc.com>
X-Mailer: b4 0.14.2

At the moment, x1e80100-pmics.dtsi enables two of the SMB2360 PMICs by
default and leaves the other two disabled. The third one was originally
also enabled by default, but then disabled in commit a237b8da413c ("arm64:
dts: qcom: x1e80100: Disable SMB2360_2 by default"). This is inconsistent
and confusing. Some laptops will even need SMB2360_1 disabled by default if
they just have a single USB-C port.

Make this consistent by keeping all SMB2360 disabled in x1e80100-pmics.dtsi
and enable them separately for all boards where needed. That way it is
always clear which ones are available and avoids accidentally trying to
read/write from missing chips when some of the PMICs are not present.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Changes in v2:
- Clarify commit message, there are actually two SMB2360 disabled by
  default (3rd and 4th) and not just the third (Aiqun Yu (Maria))
- Link to v1: https://lore.kernel.org/r/20241203-x1e80100-disable-smb2360-v1-1-80942b7f73da@linaro.org
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
index 2236095023a135d8fb1baaede111a34be54d160c..af8459d38f210fb61536814577e468e6dfc4bb22 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1112,11 +1112,19 @@ &remoteproc_cdsp {
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
base-commit: f2b086fc9f039773445d2606dc65dc091ec1830f
change-id: 20241129-x1e80100-disable-smb2360-20cec1656411

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


