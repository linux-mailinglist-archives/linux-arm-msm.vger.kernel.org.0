Return-Path: <linux-arm-msm+bounces-49441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F01DBA457C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3B10F7A96A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D5A1E1E16;
	Wed, 26 Feb 2025 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a36gQJNW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633F21D63C6;
	Wed, 26 Feb 2025 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740557475; cv=none; b=aceE5HFJNlq0tNF6M7kYau5T2Nmski8ym3pJ8Me723y3ptdOIWv/8BluhJnemJ41jYrcUjThuQp/Y8WN2hUyadcvT4ahX6+jkfmgDZRchoqth257kYwWVNU6ll16W+s6fo01mo6AeaikpevcgRpHGo3+143z2IgcnKTv1inKCLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740557475; c=relaxed/simple;
	bh=Sz9a6kcpyJGNPsAKUQctkf5iVMAC/ysPUgW1dtPopmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bJmCWFO+vcToXsUlMO992x55HP8mah8iKLu3oR9/JjcDfkY0BqLiOaFhZKBPFysvaxbDB08S5Um4KfGiRq5UwymD7q5ZM7Y2Ez+RtjQMNCkZvoYp9N44fAR0OMMnzzmT3XgQ4Q3MmHvOC7ecA4Rxnl5gHZ2/LtRmOAYfMihhPSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a36gQJNW; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2211cd4463cso131519035ad.2;
        Wed, 26 Feb 2025 00:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740557472; x=1741162272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eEPJ+Nmo8Dho5bWqg2k2GuvWVflNwp8MLzmuWoXwOVs=;
        b=a36gQJNW58i4uwllrfSz7RHF6hM4fGdkuYjc1k9yKnpVtsp6uU5zrtkQbGVELNCx5Y
         iG7MTXiG8PPpzQMi1OXMTbBjTvXlt7Z/M6Y49QEAVll/+/N8+TyN5ZXilOne66SCoEYg
         YWNXmRKar6fO+jEQsRE/xHPPI3u/rbZyUrONclPepT5SYYPxxqorSlTrp3ppGWa7CNoF
         NeGDmqtdUbiiz85dY103XdHAgyR1C1sPFAMq6OGfZUvUDVO/Edntpd1YXRVS4boUgZIn
         9NFoPrUkwwcpCo3ryeIvt9sQVOSLMBtTPw9sub2hZ7kkZYxp0V290YlJxfx7l/Gd4GuK
         F1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740557472; x=1741162272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eEPJ+Nmo8Dho5bWqg2k2GuvWVflNwp8MLzmuWoXwOVs=;
        b=LXEc7PFZfaJutgl55UFeWb/q0Iyt7ZkAGGvAyvvFsjiC6Nf67J5dt9TCbHQ83Ykv+b
         HeZHKQpGNsIE1sVIMvhp4O4xZe2yLAxojtstB88VlBPWPY1TEYVwbrOREGw+vAbUyWd9
         a2Zmm/fAV3pLIs7xBj0gM8/NHdJj6PUii4fdEpHe23pp9hnwxDSsA9cJSHBAd0gX3eCO
         +uD11MTLXL4gQm9+TO5KE8gVsmyLMG3Sl7a1HPZXUDMGxDfK/i7V/7ZT+ZlmEcSU2AGX
         JdaZUua4+tKM3jgYxg1N35e/sZ+RI5LbGIkmUUZdei8TG1GwT25ZFRNcWEa1xKtGcm9Q
         RrwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWifczn9waaxGUvQuC6hon4SHP90QUok+GFDNc4DWMbbnMH7LPijt1jc8iEY1EZZEkpP2YTxd3V/6xlQdmG@vger.kernel.org, AJvYcCXYHUf/9tmcwFf0vZVuMQjHSy8S9fqVflvt0YOP9HHMaFRLS+A8iBRF/ZF83Z2XXtIw/zP7jWxfoTY+@vger.kernel.org
X-Gm-Message-State: AOJu0YzTftLAIOn9a4Ll3v6uvporSek5Ij5ZiadkSUq9cGObBKFlyGHL
	bSFEIS0lWyBprvuRacvqrEo4Pa2HjZ1AvcJZx7UliBc1A3cInkNAcah9pS0Yiqo=
X-Gm-Gg: ASbGncu3Zp97hBIfjd1drhNuXe7rrVa4LRJL+UUHzmeRAMfWf3qoZQ+c6T1RrOuYGVX
	Lfpg9slEdEHseAY/TeQCe6eCyGWEWeDI45OwkQvUcaXMH49sb5c5ge2YJLdNkumYpA1cwSoV2wD
	d72niQwl9pvfK44yPz1EcRkk7jXb14Ug5W6Wd7U0Pw9gWTgGLARreCDT2OtULB0fb75GG8MF6M+
	tHzoHyhvE+SsIB9W9y2s0Es0D6WrAyJ7nUdMg9eql39ZN/FoL2wzulzNnG2KsHtOoGVVR0fQhGm
	wMCaiGDB1cYjzVlfSUWRu/CUgjQ=
X-Google-Smtp-Source: AGHT+IFXmvOR05agO7wnP/tG8AN8+MqoxIr/BEqL0thenXK6y8DKV5KdnXd11IlrWaMH+5iCWZZTOw==
X-Received: by 2002:a17:902:dad0:b0:220:fe51:1aab with SMTP id d9443c01a7336-22307e675camr111271795ad.38.1740557472565;
        Wed, 26 Feb 2025 00:11:12 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:3de5:6339:3d24:b93b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2231fa8a570sm10641625ad.58.2025.02.26.00.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 00:11:12 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Date: Wed, 26 Feb 2025 00:11:09 -0800
Subject: [PATCH v2 2/2] ARM: dts: qcom: msm8960: Add tsens
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-expressatt-tsens-v2-2-7a4ce3a91f27@gmail.com>
References: <20250226-expressatt-tsens-v2-0-7a4ce3a91f27@gmail.com>
In-Reply-To: <20250226-expressatt-tsens-v2-0-7a4ce3a91f27@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 wctrl <wctrl@proton.me>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740557468; l=2628;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=Sz9a6kcpyJGNPsAKUQctkf5iVMAC/ysPUgW1dtPopmA=;
 b=F2o+qlITAXyn11CTd9zgXc+JSgv8SuSE7lmaLTgts9sMC96zLJg1tAlIHkxKM4m0OSIucr1vn
 eB6t4oPlRDjApzH6RJ+/7phUj69m1SgCAMEr9hVxq4Juhuoa48Su6pS
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Copy tsens node from ap8064 and adjust some values

Co-developed-by: wctrl <wctrl@proton.me>
Signed-off-by: wctrl <wctrl@proton.me>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 59 +++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 865fe7cc39511d7cb9ec5c4b12100404f77e2989..155d6aba61e390dabca6b72160543b5aa134b219 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -52,6 +52,36 @@ memory@80000000 {
 		reg = <0x80000000 0>;
 	};
 
+	thermal-zones {
+		cpu0-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 0>;
+
+			trips {
+				cpu_alert0: trip0 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+			};
+		};
+
+		cpu1-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tsens 1>;
+
+			trips {
+				cpu_alert1: trip0 {
+					temperature = <60000>;
+					hysteresis = <10000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	cpu-pmu {
 		compatible = "qcom,krait-pmu";
 		interrupts = <GIC_PPI 10 0x304>;
@@ -115,6 +145,21 @@ timer@200a000 {
 			cpu-offset = <0x80000>;
 		};
 
+		qfprom: efuse@700000 {
+			compatible = "qcom,msm8960-qfprom", "qcom,qfprom";
+			reg = <0x00700000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			tsens_calib: calib@404 {
+				reg = <0x404 0x10>;
+			};
+
+			tsens_backup: backup-calib@414 {
+				reg = <0x414 0x10>;
+			};
+		};
+
 		msmgpio: pinctrl@800000 {
 			compatible = "qcom,msm8960-pinctrl";
 			gpio-controller;
@@ -127,7 +172,7 @@ msmgpio: pinctrl@800000 {
 		};
 
 		gcc: clock-controller@900000 {
-			compatible = "qcom,gcc-msm8960";
+			compatible = "qcom,gcc-msm8960", "syscon";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			reg = <0x900000 0x4000>;
@@ -135,6 +180,18 @@ gcc: clock-controller@900000 {
 				 <&pxo_board>,
 				 <&lcc PLL4>;
 			clock-names = "cxo", "pxo", "pll4";
+
+			tsens: thermal-sensor {
+				compatible = "qcom,msm8960-tsens";
+
+				nvmem-cells = <&tsens_calib>, <&tsens_backup>;
+				nvmem-cell-names = "calib", "calib_backup";
+				interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "uplow";
+
+				#qcom,sensors = <5>;
+				#thermal-sensor-cells = <1>;
+			};
 		};
 
 		lcc: clock-controller@28000000 {

-- 
2.45.2


