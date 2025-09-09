Return-Path: <linux-arm-msm+bounces-72870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97718B5065E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 21:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92A4A1BC898C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 19:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FDD736207D;
	Tue,  9 Sep 2025 19:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwHXtEpJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B33352FDC;
	Tue,  9 Sep 2025 19:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757445734; cv=none; b=AeyucgOxtaiqGfPNpaUy35O08Rz/6RbgwbDMM6kLegXNPfWEHRokbDkeD3/iGSUL2qHwC/YMdyPERZ8wIJkodoP11TlOW5KoFHfH3U81Whuhg9G+tHrQwJ1ApVtgDcx5dc+kiNB48MurPt1bcur/xuSnxknLZS+wyqLMSMqf9YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757445734; c=relaxed/simple;
	bh=qdLV6/3+/lrDARwwF4gML3gh+ae10lFxH70/A3U06Tw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oo2mnEyBh27PS3obWL17bRuza9uLpSr8nHZ/aP7rozm27NzsGZYuJB9Y4XP5luiIA64i9X2PqY9gCjhmzsg6mcCzRcGa6IhnnwP0hVFJXv4y/I48WqWxqcyId0nJGKkDBTUkR/0mitv1JAdvca0NDUsCQQsnbTY0ILWiyuAdW9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwHXtEpJ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62bec18abe6so2425016a12.3;
        Tue, 09 Sep 2025 12:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757445731; x=1758050531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aV7GXnC31a6+Cg+cxmDgtlX37//JD5ZC5/oqghxN6v4=;
        b=HwHXtEpJPSY4EOQHoRnD1nybjUnx5C3hRRt2rRyXwk45vEhExol2K0DvU3dhYmotoZ
         edHdwuXkR7T5GNDsspmoiNxB5NoSXFgRbAodxZ4CJzULF0b2V1vqPbyDLTr6YHSN2O7Z
         Q3V5ZgWBWC2g7TiPZeu+xKygLMrnyiayvFQ59HKVfhjZamdi/n8EuF8mCWnD+pC4AxON
         R3lNHXmm2As9XnJuejAQGPKAZyNr8pWE/xrARlNd6JmRYbaosjCFCNY4AZv+hYrl5TRK
         DRf4QcJ8od9Lz95B8KRZUgcxLNjho5J4TktK89MYdiVUnfz12K6mi5yfimKd94KYExDL
         1q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757445731; x=1758050531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aV7GXnC31a6+Cg+cxmDgtlX37//JD5ZC5/oqghxN6v4=;
        b=gf2G9OvwhcqAILIkSiUSBJTvoIsCGbhWCLKaMxBX7qYjKNKIM9t2c8bUjFPp4d9DFJ
         xbZCWKQ6wilMMBubP2o2F/0FiBn9wuSdJ+Wy1+dnM6FiJqmbjvMS8f9S7i8/8eSjtI/Q
         6S6Z2cw23ZUDJI8/sT9iNiQeokB+oHESh6bW3g0VgM8LO5QN7GnnmZlBza+EOMHHMh9p
         N1r2DF+Yyim1iCVp0Ph5f5bjUHfHL4wE4LncArmjnv2OmbKl09jRDguVRdoU6yDjD7Jz
         24XcRNjaQ5PPEbEkTVtZpXo+WJ+We4vtMgzeoJleExb8xyaytyeiv4SNIHVBfEOLnvEg
         owJw==
X-Forwarded-Encrypted: i=1; AJvYcCVesJi4+UmKTDgnea8Hctx+B4yYVceIGybL3d/lQjCYqMi6Mxx4fyAiH1D4xA0tznvTXYns2n7jwkKD@vger.kernel.org, AJvYcCWu6BWwsGNalxi9d6tKkhgG13AqQLMke99MUljVAOVuyJFG2eu+MXsBh0ZyIeC4ipdzWaGDkM9bBQhmCCVQDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRdMQF9XS4PaEty5BGs6eVkw0p2gQev3PV520yQrDNeuwyNF72
	1jBhxk4Z0G417YwnDS6MLQDGmWiHjwUZC17aK5xnofIorTYzQN82dnI2
X-Gm-Gg: ASbGncugfcS8a+65fyvbY+3qllFmxtH0X1NXAYhNKCSV5ZhQ406qfrppRnNp7JE4sJv
	xqcrobhXfKWppv3US161gBfPotw1G4wNW4vU1ekk4HompYOL3YXH1bI9roUYJLEjJqTyILY81Mc
	CCBv0UZekgLtJBtJaw0XT996yN4si9t3T/jUk0jr8o40u1IZVMX3GUwOrUCzlzaGpeu1gIT0C+W
	Vusird3O/2nkk8kd1/9ruvHw/Hajbau26Qbh2I/9CZwCsqgitCiGjPRdfUcUWZN3aIncwYqng8T
	6DoNIi7ZsdNV2KrbmpHptZ9wNpe4eRimoJ5veaXFZq1Y/An2VGZVDtqlUVwU1UJeHzsxY1vUkZJ
	aPJMv2IGV3shMmoSHfegr
X-Google-Smtp-Source: AGHT+IHrwxd77+1kRRdC9c95ipF2nTEJD6C6mWuCBmBnUTAJkbFqzDSJGw7t//aVeZcq2XkrSAq53A==
X-Received: by 2002:a05:6402:26cb:b0:627:c107:842d with SMTP id 4fb4d7f45d1cf-627c1080d8emr8345248a12.4.1757445730676;
        Tue, 09 Sep 2025 12:22:10 -0700 (PDT)
Received: from [127.0.1.1] ([46.53.240.27])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-62c01ae5f75sm1847142a12.46.2025.09.09.12.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 12:22:10 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 09 Sep 2025 22:22:05 +0300
Subject: [PATCH v2 3/3] arch: arm64: dts: qcom: sdm845-starqltechn: fix
 max77705 interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-starqltechn-correct_max77705_nodes-v2-3-e4174d374074@gmail.com>
References: <20250909-starqltechn-correct_max77705_nodes-v2-0-e4174d374074@gmail.com>
In-Reply-To: <20250909-starqltechn-correct_max77705_nodes-v2-0-e4174d374074@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757445725; l=1935;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=qdLV6/3+/lrDARwwF4gML3gh+ae10lFxH70/A3U06Tw=;
 b=OhmJ8WCY0i8ipcbuRaw8IQURN7oYyvqeB9f5BsKdQd8TqvmpZ8O3eDcVib3zPb0KWOVe51/jg
 IJWs1c9x1QzC8agpQnu7sGDSpYLGrOAWVz7ABpXbCsucQ6/joNZbJQt
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Since max77705 has a register, which indicates interrupt source, it acts
as an interrupt controller.

Use max77705 as an interrupt controller for charger and fuelgauge
subdevices.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
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


