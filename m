Return-Path: <linux-arm-msm+bounces-73379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEC0B554F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 18:47:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2A1F5C4D62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 16:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C036F322C63;
	Fri, 12 Sep 2025 16:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQ+rVbXf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EB2320A28
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 16:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757695634; cv=none; b=c20EaCpibd6mI+AmtINR3GkORBRmoVvMLejaKttN7YUVTIgIJbr8FggyDKirvj1p3OxT0v/GxrlcEy85AgJ5Qtd4ZOwArH7EAY1w1VzQ86fJH599sx5JlVXDD77gQbv4ySBNhPfp1alzameP9egpW3dIjnB53HmT8/CQoKaddCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757695634; c=relaxed/simple;
	bh=Wdm08EMxHowe+0+mJzP63NKr1uwq70hOA6Ki2Hqxf6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uxOfeqYuQezVFm6fsFeOg+oZcAbGVLIk/4mMhg1bYSODlklNt8Jfkly7WS15EpLOfdbGYwriHdvYVI3j3lnb6/zO4xxYwV47G6NZfmGhr+75spAa/10UMBAgXGQioGN6iD2VUoNMOTbPhq5c8XO0OQ7LzfitIq02a9W9qJJM3sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQ+rVbXf; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b07e081d852so7959766b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 09:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757695631; x=1758300431; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCrSKGvrSXO/1u+T49T9VdCRelfEs5H7YngBK1sc9bQ=;
        b=KQ+rVbXf1sFo5QxHET9dAKm4t6JuUCFgFChTn5xHufWoWfTacOOoGbYDzJ0wRIryCO
         eKTsnXE4O2T0Q5aVcFyXs4mV5ScsXyQqz5NYkvMreVmjo89Q9NtmBUqJ9oRDB+OneedQ
         dTl+ikRtsG1HunB2yY6aTCbcxQ1yzdI6VmbVJuLzcXmTlkv7M6kMmSngGvHcBLhe6pg5
         aJv+JpsDjr67oOLteR6iDnRvIPlTh8uz7fY7ukX7ZRUfJUnnF7KEIyoMpVwXf2pFA3hg
         6zEStMaQ4UAVHz1i17swDV5q7latgszhOcfiubDb3TZZFDqN/KnBC1DHmT6VUudY18uT
         POcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757695631; x=1758300431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCrSKGvrSXO/1u+T49T9VdCRelfEs5H7YngBK1sc9bQ=;
        b=SiLyaWMCd6ay9o46j7bDN0gFE54pbOwXj6yb4+Jvgof1OjfdT31ry8+uBNLSu02XOe
         UpxWhHhwRI2ijX2CLggpy2gFwBaEARWksOa6W0Na9eaC6w250CEMExT77DDM/7ijvD4O
         YyGvXDQpYDpb/w21E3MKtwXsNUcYWprCTwdZmqZ4rSNKDlFCNlHmWoKT7ZNfJq5NU+ko
         qHUaS6VyDeca69IPjJyC8Aut6cqcEwyGcjVxa35WpaesvkJrlrTpbHqeNs9gPI44TEc4
         t0I18l994maDUDxmFTOMb6cO3gNZDBOUgbU5NiKaQhn61zzqBqHI0ac1a8hkj05xNDpk
         O/0A==
X-Forwarded-Encrypted: i=1; AJvYcCUm09AyMBdqqoSn94Gv+u7jkfQsZUM2EeFVfSTgEjWheHa/dS7HDwGrkuKEkZQv723YwGTDSDhwwRhTqoKP@vger.kernel.org
X-Gm-Message-State: AOJu0YwR8eJwuDU2B5Q0BWdGz7RoTMQMsn/icgw47of+iHMd945B9v+Z
	VzGnq+di3ertdKiFmdfng1tNuaRlZKyLgn2gUrW0TukIOT+7RgFe0YCl
X-Gm-Gg: ASbGncvTZeBYog04VCpMEJzCbk1fC52vcepzxN2eB5x8xa5VoaGB+BaPbc/ktGU9fpk
	HpEhFRzZImnZSTs00pyr9g2/lKjH7BZKiArIMNE0OoWrPE7T7yubBl2pc1XlrBd7xEB7J7xgYU/
	sQSwBH+Bd1G8w56OOq0w68jFdIuakRIx6NWtO4DdHhUxhtxZe29bhgpY20NW+qiyWIgbpMaJuQC
	1hr7vvCyVlZAzAozCr17QWP4sHB6Sl9UKdaUSFKVS4qBCZYxO67p/eORoaI2n0YVMmXcSSYoYA3
	7kKD5D7ia7jjxH+46HnyqCdDmtAiMmcxKwsuc00YgRV1/PPoaZJKsmY7bNoQm4pCa8c6OOnGG+i
	VqFXQ+poUNB11CcOsqwpI
X-Google-Smtp-Source: AGHT+IH73PoZ9AsNM7yN3WLzZHMfT8u8MH3s4/O9P15wmePlr1s/VAEZRYPX6YG/6Qb7831rsSTCjA==
X-Received: by 2002:a17:907:6e8b:b0:b04:2452:e267 with SMTP id a640c23a62f3a-b07c3a76f4emr385412166b.56.1757695631157;
        Fri, 12 Sep 2025 09:47:11 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b07c337e785sm229786066b.25.2025.09.12.09.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 09:47:10 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Fri, 12 Sep 2025 19:47:03 +0300
Subject: [PATCH v3 3/3] arch: arm64: dts: qcom: sdm845-starqltechn: fix
 max77705 interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250912-starqltechn-correct_max77705_nodes-v3-3-4ce9f694ecd9@gmail.com>
References: <20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com>
In-Reply-To: <20250912-starqltechn-correct_max77705_nodes-v3-0-4ce9f694ecd9@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757695624; l=2075;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=Wdm08EMxHowe+0+mJzP63NKr1uwq70hOA6Ki2Hqxf6o=;
 b=hS4I7dnxRbG+ysuZp6N+mtNFzY53m0BYtow1zdjEfzBBPBfwa+tB2dc4pGnbdHjShwDLHhT1x
 ZaELJes2HjNB6ft/Y/pHGx5raoRUYJNMuLxrQ4uajCAYMsrE3AdMjNI
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Since max77705 has a register, which indicates interrupt source, it acts
as an interrupt controller.

Direct MAX77705's subdevices to use the IC's internal interrupt
controller, instead of listening to every interrupt fired by the
chip towards the host device.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes for v2:
- fix commit message to be more clear

Changes for v2:
- fix commit msg header prefix to 'arm64: dts: qcom: sdm845-starqltechn:'
- remove binding header for interrupt numbers
- make interrupt-cells 1, because irq trigger type is not used
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 8a1e4c76914c..597e25d27d76 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -584,13 +584,15 @@ &uart9 {
 &i2c14 {
 	status = "okay";
 
-	pmic@66 {
+	max77705: pmic@66 {
 		compatible = "maxim,max77705";
 		reg = <0x66>;
 		interrupt-parent = <&pm8998_gpios>;
 		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
 		pinctrl-0 = <&pmic_int_default>;
 		pinctrl-names = "default";
+		#interrupt-cells = <1>;
 
 		leds {
 			compatible = "maxim,max77705-rgb";
@@ -629,8 +631,8 @@ max77705_charger: charger@69 {
 		reg = <0x69>;
 		compatible = "maxim,max77705-charger";
 		monitored-battery = <&battery>;
-		interrupt-parent = <&pm8998_gpios>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&max77705>;
+		interrupts = <0>;
 	};
 
 	fuel-gauge@36 {
@@ -638,8 +640,8 @@ fuel-gauge@36 {
 		compatible = "maxim,max77705-battery";
 		power-supplies = <&max77705_charger>;
 		maxim,rsns-microohm = <5000>;
-		interrupt-parent = <&pm8998_gpios>;
-		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-parent = <&max77705>;
+		interrupts = <2>;
 	};
 };
 

-- 
2.39.5


