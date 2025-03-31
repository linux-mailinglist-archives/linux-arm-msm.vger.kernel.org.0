Return-Path: <linux-arm-msm+bounces-52874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2457A7656F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 14:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D2BB164AA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 12:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18471BC073;
	Mon, 31 Mar 2025 12:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kHsdGu7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0CF1D89FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 12:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743423050; cv=none; b=hkJAy21YegqqrZ+EznGzJb0MTliGrt51xyBLz2xG6UaCJJrt8zroafhFPzpLF/AdHaC4kLciPpA066Ys9NWUHPZiZ5Oyoe59AGbfhV+h+AidPIxdWOY4v1A1i3KAtwHwLbB7sfXdfhKqZLWw4osxMBa2pNJMp1pv7M/DzlNDjuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743423050; c=relaxed/simple;
	bh=5FQq6G6CcDVX/WJRqrI0CJelfhamUp2ah6wu3/cOoYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bqAMD+/EElHSqlv8BE9iNtSrlFy0lL3hQTQiEOpABVCuHg94n+JjHexz0FE4sbf2tIyvuTAjoglKN+ItW1JIUBZ6giiH9e+0Etm7Ny+mYCNKgKSX7si5I8I1q3KaPkrMSpo2LzhULm/6rfrO6EHTJ9UYyWuBLxync6T1uVvlLb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kHsdGu7m; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso49264485e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Mar 2025 05:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743423046; x=1744027846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=okpqta+/WuV57s9p5DTEKrgVp2I+VFSDY0MRg0XoSnw=;
        b=kHsdGu7mW5rF1LggZgXF+ue/tM5+Zj60JKkP7iQJCphZbIT4exo5MZHuRExOuOnjz9
         zK/uN9E04CmloSW9YPr+q501Hz2WtU5Bcy2eem5uR5Yb98qB1HEgnGRQs5phG2dklGKK
         R1Y8CY7ara0EX7m0lrN+iZ378HREqJE2oMHPZcoVEQEdIW9BjAQwQArWZrXONNOmbfDi
         H5Xv8Z5FA2Edcsu+ytOoA81RxLFSTU/OygDxqjk87IiIrkNNYlz4Jpgcqvum/yfceaq+
         kGe2sQM3tfv6PL4u+jyHOTPZdA29f5NnmdSV18VFu63g31nOObiq2XqCYfR9wcoIcLze
         QH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743423046; x=1744027846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=okpqta+/WuV57s9p5DTEKrgVp2I+VFSDY0MRg0XoSnw=;
        b=To+QF1hffC+sz0ZBE/UXKCQvaNOCw+wpYiwHNY6e0njM1Bk2yRvLtGPobvXaEGAuKC
         nisF4AglRG9VjeynbqDnfJkvUCQlOygK8IdE+iXyYmHBOmzFDYSDJvlUzUcaa6XtN748
         ZKfp5kTTF7OysEGIHYmNj4v4LKwRldoND6aW4L5QA4VuicoAfKc7gSiMmEL98EFX5iT8
         MxWqInULL7Dim0ypvBPvTHwTHdHXjajKaXigUfcEysCWJ5uvFUQbCPgV9up1Y25rWfGl
         hEpxraAunaiPUf1hNgtKPnb6Vx6o7sV1+HhEPSygnMP435pz682Mxso6iw3RFEPb2Pd5
         B8tg==
X-Forwarded-Encrypted: i=1; AJvYcCWMq+by/WQZWQftXvHPSe+G4TMVk8P4Z0Wz30mbEgt9YT90hMYg42oRSPD/M77ODI+VM4FSg/ZSt4613zdK@vger.kernel.org
X-Gm-Message-State: AOJu0YywGcUA8gLbLC7m1Aen6PQj4Zif3/Yhyb83OCgZEPYBOpiwIH8M
	QlKQCV+A9qainWt9Y9/hQso7D5r6AXkOQ8PtReg0vzQ2usBsuEE7vzKun7VMaTw=
X-Gm-Gg: ASbGncvqco39N0p9notKgyfq7GIP7sof1p59ha1T0yb0ZyWF0hOWE2mYr6qvZB7aCpR
	VkDSVlaRhuaXtKUc4odwMKpek2mgoHNvthQxMCRNlApJxlLaWt40eJ5R0y4zZUQ34mOBtB1wxcL
	9MjkIRUG4elNVhpiGNieNGJUvzBI5bZpkh0+KngZ1zb4h8CyN2rjqYQDNZS8PCMiKsHP/QmobQ3
	SpzwWnLFb139FhoJOIh6c2Rjtkjw1zz0jrPbZqnc4BdYEIUNUfyvxcT9T14SksHwo9+yVEhgcZc
	Ww76+4rWcwmxSho8xGXyv+A2lWb+T0EnaHS/LXNJK+WKOCH51Mklc1gBSlewWKB8TveJ58C5xeu
	tAEYXNZGVOFgA9LMIUiWBBwI=
X-Google-Smtp-Source: AGHT+IEzz4CgTrtL2IjSDR8RRNEQ/kYEnvAi0vIwUY4iCQ9PQ0DHcXncAtiFti+dDMrorBgDi5Zm0g==
X-Received: by 2002:a05:600c:5494:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43db6252fa8mr87142055e9.18.1743423045681;
        Mon, 31 Mar 2025 05:10:45 -0700 (PDT)
Received: from toyger.tail248178.ts.net (i5E863BED.versanet.de. [94.134.59.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fba3b13sm124137345e9.3.2025.03.31.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 05:10:44 -0700 (PDT)
From: Caleb Connolly <caleb.connolly@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: align gpio-keys label format
Date: Mon, 31 Mar 2025 14:10:05 +0200
Message-ID: <20250331121011.385250-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most devices follow the practise of capitilising all words in a label,
this seems to be the standard elsewhere too (e.g. run "evtest" on an x86
ThinkPad).

Adjust the stragglers to follow suite, and standardise on "Volume
Buttons" over "Volume keys" as the label for the entire device where
applicable.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---

This is really a drop in the ocean, a good next step would be to fix the
pm8941-pwrkey driver so your power button doesn't show up as
"pm8941_pwrkey".
---
 arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts    | 6 +++---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts   | 2 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts     | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi       | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi  | 6 +++---
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 +-
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
index e6a69d942a4a..452c455294d0 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
@@ -90,17 +90,17 @@ gpio-keys {
 		pinctrl-names = "default";
 		pinctrl-0 = <&vol_keys_default>;
 
 		button-vol-down {
-			label = "Volume down";
+			label = "Volume Down";
 			gpios = <&pm8998_gpios 5 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
 			debounce-interval = <15>;
 			wakeup-source;
 		};
 
 		button-vol-up {
-			label = "Volume up";
+			label = "Volume Up";
 			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 			debounce-interval = <15>;
 			wakeup-source;
diff --git a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
index 0cac06f25a77..2a62d58195fd 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts
@@ -124,16 +124,16 @@ zap_shader_region: memory@f7900000 {
 	};
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		label = "Volume buttons";
+		label = "Volume Up";
 		autorepeat;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&vol_up_key_default>;
 
 		key-vol-up {
-			label = "Volume up";
+			label = "Volume Up";
 			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 			debounce-interval = <15>;
 			wakeup-source;
@@ -141,9 +141,9 @@ key-vol-up {
 	};
 
 	gpio-hall-sensor {
 		compatible = "gpio-keys";
-		label = "Hall effect sensor";
+		label = "Hall Effect Sensor";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&hall_sensor_default_state>;
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 0f1c83822f66..0333e06227eb 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -54,9 +54,9 @@ gpio-keys {
 		pinctrl-0 = <&volume_down_default>, <&hall_sensor_default>;
 		pinctrl-names = "default";
 
 		key-volume-up {
-			label = "Volume up";
+			label = "Volume Up";
 			gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 712f29fbe85e..1b00fd5b2c89 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -56,9 +56,9 @@ gpio-keys {
 		pinctrl-0 = <&volume_down_default>;
 		pinctrl-names = "default";
 
 		key-volume-up {
-			label = "Volume up";
+			label = "Volume Up";
 			gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 			debounce-interval = <15>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 99dafc6716e7..b60a41f71e29 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -129,9 +129,9 @@ gpio-keys {
 
 		label = "GPIO Buttons";
 
 		key-vol-up {
-			label = "Volume up";
+			label = "Volume Up";
 			linux,code = <KEY_VOLUMEUP>;
 			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 8a0f154bffc3..535b02d1b12c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -48,23 +48,23 @@ event-hall-sensor {
 	};
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		label = "Volume keys";
+		label = "Volume Buttons";
 		autorepeat;
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&volume_down_gpio &volume_up_gpio>;
 
 		key-vol-down {
-			label = "Volume down";
+			label = "Volume Down";
 			linux,code = <KEY_VOLUMEDOWN>;
 			gpios = <&pm8998_gpios 5 GPIO_ACTIVE_LOW>;
 			debounce-interval = <15>;
 		};
 
 		key-vol-up {
-			label = "Volume up";
+			label = "Volume Up";
 			linux,code = <KEY_VOLUMEUP>;
 			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
 			debounce-interval = <15>;
 		};
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index 85a928f98077..a7544d8b4fac 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -68,9 +68,9 @@ gpio-keys {
 		pinctrl-0 = <&kypd_volp_n>;
 		pinctrl-names = "default";
 
 		key-volume-up {
-			label = "Volume up";
+			label = "Volume Up";
 			gpios = <&pm7325_gpios 6 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 	};
-- 
2.49.0


