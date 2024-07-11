Return-Path: <linux-arm-msm+bounces-25957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CA792E57B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 13:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E245A1F2569E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 11:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A266C15990E;
	Thu, 11 Jul 2024 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IbVJL0qa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B8F168493
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 11:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720696057; cv=none; b=BmTPt6nA/FgdwXSAD0tqCMqAVGtw6TX5fmzU2xO6+luPC7q7upJfr9ZtUhnj7x4hIjCHYRluOGR/X8pLcYxlo7DRWArNsz4ZwvQAzQiXzbim1SQojihAjcBXPwDXKugE/xygzSTyQX5eOR4tobhNzs/psIwh3Vl319o5XUv7W3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720696057; c=relaxed/simple;
	bh=kqJX76Mn8cDxykgVLWz/CyHYEjNIdrVDrQ8i+8Fsnl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hW2gs9QBs+g9isAtpWalqlazl9cS8jIGYKq61savQC1DdEugjro4TMVfVJMqvb3z0Bg8CWcBimOSbvvUKXAsHqHd8qe8wemoF2m5wA711CdbOiRxNFQB+/kq4EW/CpgCad7TEVe0VvBF5c4zElpa4tXuxAbCGQX0z3ap0ulMWfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IbVJL0qa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-426717a2d12so4690635e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 04:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720696053; x=1721300853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkwYmQe+vZGY2hDDPre+UOvj5tCpzJQ0BK04WwUrAsU=;
        b=IbVJL0qacZsoNIRMR40g7Lmt8RKkUydeNxtU3pbuSSt5bNrYgctKzFXh2FIquBgDHZ
         FnkJwcauM3t6rP8ibUqRduooByjT429qN8HUK3sDz6FHXqlx4vJosvlxenTm7NbU6GBf
         7c4EJtvK0Q2KWq3L/Sx1IRm1xabN5ZD4HK7elIgI1owXugQK/XbJ/pChcew3UO2UaJsX
         tjNLE4AmuXDHziU42w9bB1P20jkLdjgXRvt2Xqc8FQn+oBwm7kqvkE8Xx9ocGnijRtvo
         24oR2g3LFvYpCqXbMkAyzRQhjHMIFeEOB10BuwBvLf7K7vbCE71Xrts8MP6cSLc62XwW
         RSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696053; x=1721300853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkwYmQe+vZGY2hDDPre+UOvj5tCpzJQ0BK04WwUrAsU=;
        b=LxgK5sB9RKwrwR4bwa6veSvtHiUklDroWSAHhLiW45plTjOMAI6Md7Hd4DTFdbqPtf
         mv90ihLVh2BaED1QTFs+TRKmsvljCBr9bKDaf28UhwgeBdk5pwoOeJs3Oi1MUhNfNQAD
         IK/DrvALc/JxxEWBrWiD/Yir+F/BtfTWKjmNoPuq5V9r+VpTPULQgEH485G6m9fZZbal
         ccJgB7C/0iaZ6W/UWNSnocPqTS/gAjiLp3KHJ2c2pTmyO3j/Hr58w51VfJgAKJQWJAym
         aPyYa/+kD6gYKr/eI1W0hdrYisjvHaVbnnoGy/vDO3hgOqWYXw42BrH3MK0mzFx+UJUv
         TnyQ==
X-Gm-Message-State: AOJu0YwArEoCbimkTRzjH7e1MIBjzTx+zEljudD/xvDa+UCH1eR1NL4l
	li6ci3EgFpeK0DoxpNttUHUdyyXXzZz2f58WkIK5Lj9OLQdVss4pyPzPvHTiEoOk5PVKjICGqfr
	A
X-Google-Smtp-Source: AGHT+IHBh4dHMyrCPLkP/FOL2l52pUNwR1mMtGgYmKjbhR9sjU223yVx+aIwcwtw9asdHQA6+droqA==
X-Received: by 2002:a05:600c:3516:b0:424:aa83:ef27 with SMTP id 5b1f17b1804b1-427981b2222mr20837385e9.1.1720696053510;
        Thu, 11 Jul 2024 04:07:33 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e097bsm115686685e9.6.2024.07.11.04.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:07:33 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: linux-arm-msm@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 3/5] ARM: dts: qcom: apq8064: adhere to pinctrl dtschema
Date: Thu, 11 Jul 2024 12:01:40 +0100
Message-ID: <20240711110545.31641-5-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711110545.31641-2-rayyan.ansari@linaro.org>
References: <20240711110545.31641-2-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass dtbs_check for qcom,apq8064-pinctrl.yaml.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
v1 -> v2: split previous 2 commits from this patch, corrected commit message

 .../boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |  25 +-
 .../boot/dts/qcom/qcom-apq8064-ifc6410.dts    |  25 +-
 arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi | 350 +++++++-----------
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   |  10 +-
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      |  34 +-
 5 files changed, 166 insertions(+), 278 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
index 671d58cc2741..178c55c1efeb 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
@@ -188,24 +188,17 @@ &sdcc4 {
 };
 
 &tlmm_pinmux {
-	card_detect: card_detect {
-		mux {
-			pins = "gpio26";
-			function = "gpio";
-			bias-disable;
-		};
+	card_detect: card-detect-state {
+		pins = "gpio26";
+		function = "gpio";
+		bias-disable;
 	};
 
-	pcie_pins: pcie_pinmux {
-		mux {
-			pins = "gpio27";
-			function = "gpio";
-		};
-		conf {
-			pins = "gpio27";
-			drive-strength = <12>;
-			bias-disable;
-		};
+	pcie_pins: pcie-state {
+		pins = "gpio27";
+		function = "gpio";
+		drive-strength = <12>;
+		bias-disable;
 	};
 };
 
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
index ed86b24119c9..b3ff8010b149 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
@@ -321,24 +321,17 @@ &sdcc4 {
 };
 
 &tlmm_pinmux {
-	card_detect: card_detect {
-		mux {
-			pins = "gpio26";
-			function = "gpio";
-			bias-disable;
-		};
+	card_detect: card-detect-state {
+		pins = "gpio26";
+		function = "gpio";
+		bias-disable;
 	};
 
-	pcie_pins: pcie_pinmux {
-		mux {
-			pins = "gpio27";
-			function = "gpio";
-		};
-		conf {
-			pins = "gpio27";
-			drive-strength = <12>;
-			bias-disable;
-		};
+	pcie_pins: pcie-state {
+		pins = "gpio27";
+		function = "gpio";
+		drive-strength = <12>;
+		bias-disable;
 	};
 };
 
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
index 107fc19f1331..e53de709e9d1 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
@@ -1,318 +1,218 @@
 // SPDX-License-Identifier: GPL-2.0
 
 &tlmm_pinmux {
-	sdc4_gpios: sdc4-gpios {
-		pios {
-			pins = "gpio63", "gpio64", "gpio65", "gpio66", "gpio67", "gpio68";
-			function = "sdc4";
-		};
-	};
-
-	sdcc1_pins: sdcc1-pin-active {
-		clk {
+	sdcc1_default_state: sdcc1-default-state {
+		clk-pins {
 			pins = "sdc1_clk";
 			drive-strength = <16>;
 			bias-disable;
 		};
 
-		cmd {
+		cmd-pins {
 			pins = "sdc1_cmd";
 			drive-strength = <10>;
 			bias-pull-up;
 		};
 
-		data {
+		data-pins {
 			pins = "sdc1_data";
 			drive-strength = <10>;
 			bias-pull-up;
 		};
 	};
 
-	sdcc3_pins: sdcc3-pin-active {
-		clk {
+	sdcc3_default_state: sdcc3-default-state {
+		clk-pins {
 			pins = "sdc3_clk";
 			drive-strength = <8>;
 			bias-disable;
 		};
 
-		cmd {
+		cmd-pins {
 			pins = "sdc3_cmd";
 			drive-strength = <8>;
 			bias-pull-up;
 		};
 
-		data {
+		data-pins {
 			pins = "sdc3_data";
 			drive-strength = <8>;
 			bias-pull-up;
 		};
 	};
 
-	ps_hold: ps_hold {
-		mux {
-			pins = "gpio78";
-			function = "ps_hold";
-		};
+	sdc4_default_state: sdc4-default-state {
+		pins = "gpio63", "gpio64", "gpio65", "gpio66", "gpio67", "gpio68";
+		function = "sdc4";
 	};
 
-	i2c1_pins: i2c1 {
-		mux {
-			pins = "gpio20", "gpio21";
-			function = "gsbi1";
-		};
+	gsbi1_uart_2pins: gsbi1-uart-2pins-state {
+		pins = "gpio18", "gpio19";
+		function = "gsbi1";
+	};
 
-		pinconf {
-			pins = "gpio20", "gpio21";
-			drive-strength = <16>;
-			bias-disable;
-		};
+	gsbi1_uart_4pins: gsbi1-uart-4pins-state {
+		pins = "gpio18", "gpio19", "gpio20", "gpio21";
+		function = "gsbi1";
 	};
 
-	i2c1_pins_sleep: i2c1_pins_sleep {
-		mux {
-			pins = "gpio20", "gpio21";
-			function = "gpio";
-		};
-		pinconf {
-			pins = "gpio20", "gpio21";
+	gsbi4_uart_pin_a: gsbi4-uart-pin-active-state {
+		rx-pins {
+			pins = "gpio11";
+			function = "gsbi4";
 			drive-strength = <2>;
 			bias-disable;
 		};
-	};
 
-	gsbi1_uart_2pins: gsbi1_uart_2pins {
-		mux {
-			pins = "gpio18", "gpio19";
-			function = "gsbi1";
+		tx-pins {
+			pins = "gpio10";
+			function = "gsbi4";
+			drive-strength = <4>;
+			bias-disable;
 		};
 	};
 
-	gsbi1_uart_4pins: gsbi1_uart_4pins {
-		mux {
-			pins = "gpio18", "gpio19", "gpio20", "gpio21";
-			function = "gsbi1";
-		};
+	gsbi6_uart_2pins: gsbi6-uart-2pins-state {
+		pins = "gpio14", "gpio15";
+		function = "gsbi6";
 	};
 
-	i2c2_pins: i2c2 {
-		mux {
-			pins = "gpio24", "gpio25";
-			function = "gsbi2";
-		};
-
-		pinconf {
-			pins = "gpio24", "gpio25";
-			drive-strength = <16>;
-			bias-disable;
-		};
+	gsbi6_uart_4pins: gsbi6-uart-4pins-state {
+		pins = "gpio14", "gpio15", "gpio16", "gpio17";
+		function = "gsbi6";
 	};
 
-	i2c2_pins_sleep: i2c2_pins_sleep {
-		mux {
-			pins = "gpio24", "gpio25";
-			function = "gpio";
-		};
-
-		pinconf {
-			pins = "gpio24", "gpio25";
-			drive-strength = <2>;
-			bias-disable;
-		};
+	gsbi7_uart_2pins: gsbi7-uart-2pins-state {
+		pins = "gpio82", "gpio83";
+		function = "gsbi7";
 	};
 
-	i2c3_pins: i2c3 {
-		mux {
-			pins = "gpio8", "gpio9";
-			function = "gsbi3";
-		};
-
-		pinconf {
-			pins = "gpio8", "gpio9";
-			drive-strength = <16>;
-			bias-disable;
-		};
+	gsbi7_uart_4pins: gsbi7_uart_4pins-state {
+		pins = "gpio82", "gpio83", "gpio84", "gpio85";
+		function = "gsbi7";
 	};
 
-	i2c3_pins_sleep: i2c3_pins_sleep {
-		mux {
-			pins = "gpio8", "gpio9";
-			function = "gpio";
-		};
-		pinconf {
-			pins = "gpio8", "gpio9";
-			drive-strength = <2>;
-			bias-disable;
-		};
+	i2c1_default_state: i2c1-default-state {
+		pins = "gpio20", "gpio21";
+		function = "gsbi1";
+		drive-strength = <16>;
+		bias-disable;
 	};
 
-	i2c4_pins: i2c4 {
-		mux {
-			pins = "gpio12", "gpio13";
-			function = "gsbi4";
-		};
-
-		pinconf {
-			pins = "gpio12", "gpio13";
-			drive-strength = <16>;
-			bias-disable;
-		};
+	i2c1_sleep_state: i2c1-sleep-state {
+		pins = "gpio20", "gpio21";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
 	};
 
-	i2c4_pins_sleep: i2c4_pins_sleep {
-		mux {
-			pins = "gpio12", "gpio13";
-			function = "gpio";
-		};
-		pinconf {
-			pins = "gpio12", "gpio13";
-			drive-strength = <2>;
-			bias-disable;
-		};
+	i2c2_default_state: i2c2-default-state {
+		pins = "gpio24", "gpio25";
+		function = "gsbi2";
+		drive-strength = <16>;
+		bias-disable;
 	};
 
-	spi5_default: spi5_default {
-		pinmux {
-			pins = "gpio51", "gpio52", "gpio54";
-			function = "gsbi5";
-		};
-
-		pinmux_cs {
-			function = "gpio";
-			pins = "gpio53";
-		};
-
-		pinconf {
-			pins = "gpio51", "gpio52", "gpio54";
-			drive-strength = <16>;
-			bias-disable;
-		};
-
-		pinconf_cs {
-			pins = "gpio53";
-			drive-strength = <16>;
-			bias-disable;
-			output-high;
-		};
+	i2c2_sleep_state: i2c2-sleep-state {
+		pins = "gpio24", "gpio25";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
 	};
 
-	spi5_sleep: spi5_sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio51", "gpio52", "gpio53", "gpio54";
-		};
-
-		pinconf {
-			pins = "gpio51", "gpio52", "gpio53", "gpio54";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
+	i2c3_default_state: i2c3-default-state {
+		pins = "gpio8", "gpio9";
+		function = "gsbi3";
+		drive-strength = <16>;
+		bias-disable;
 	};
 
-	i2c6_pins: i2c6 {
-		mux {
-			pins = "gpio16", "gpio17";
-			function = "gsbi6";
-		};
-
-		pinconf {
-			pins = "gpio16", "gpio17";
-			drive-strength = <16>;
-			bias-disable;
-		};
+	i2c3_sleep_state: i2c3-sleep-state {
+		pins = "gpio8", "gpio9";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
 	};
 
-	i2c6_pins_sleep: i2c6_pins_sleep {
-		mux {
-			pins = "gpio16", "gpio17";
-			function = "gpio";
-		};
-		pinconf {
-			pins = "gpio16", "gpio17";
-			drive-strength = <2>;
-			bias-disable;
-		};
+	i2c4_default_state: i2c4-default-state {
+		pins = "gpio12", "gpio13";
+		function = "gsbi4";
+		drive-strength = <16>;
+		bias-disable;
 	};
 
-	gsbi4_uart_pin_a: gsbi4-uart-pin-active-state {
-		rx-pins {
-			pins = "gpio11";
-			function = "gsbi4";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		tx-pins {
-			pins = "gpio10";
-			function = "gsbi4";
-			drive-strength = <4>;
-			bias-disable;
-		};
+	i2c4_sleep_state: i2c4-sleep-state {
+		pins = "gpio12", "gpio13";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
 	};
 
-	gsbi6_uart_2pins: gsbi6_uart_2pins {
-		mux {
-			pins = "gpio14", "gpio15";
-			function = "gsbi6";
-		};
+	i2c6_default_state: i2c6-default-state {
+		pins = "gpio16", "gpio17";
+		function = "gsbi6";
+		drive-strength = <16>;
+		bias-disable;
 	};
 
-	gsbi6_uart_4pins: gsbi6_uart_4pins {
-		mux {
-			pins = "gpio14", "gpio15", "gpio16", "gpio17";
-			function = "gsbi6";
-		};
+	i2c6_sleep_state: i2c6-sleep-state {
+		pins = "gpio16", "gpio17";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
 	};
 
-	gsbi7_uart_2pins: gsbi7_uart_2pins {
-		mux {
-			pins = "gpio82", "gpio83";
-			function = "gsbi7";
-		};
+	i2c7_default_state: i2c7-default-state {
+		pins = "gpio84", "gpio85";
+		function = "gsbi7";
+		drive-strength = <16>;
+		bias-disable;
 	};
 
-	gsbi7_uart_4pins: gsbi7_uart_4pins {
-		mux {
-			pins = "gpio82", "gpio83", "gpio84", "gpio85";
-			function = "gsbi7";
-		};
+	i2c7_sleep_state: i2c7-sleep-state {
+		pins = "gpio84", "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
 	};
 
-	i2c7_pins: i2c7 {
-		mux {
-			pins = "gpio84", "gpio85";
-			function = "gsbi7";
+	spi5_default_state: spi5-default-state {
+		spi5-pins {
+			pins = "gpio51", "gpio52", "gpio54";
+			function = "gsbi5";
+			drive-strength = <16>;
+			bias-disable;
 		};
 
-		pinconf {
-			pins = "gpio84", "gpio85";
+		spi5-cs-pins {
+			pins = "gpio53";
+			function = "gpio";
 			drive-strength = <16>;
 			bias-disable;
+			output-high;
 		};
 	};
 
-	i2c7_pins_sleep: i2c7_pins_sleep {
-		mux {
-			pins = "gpio84", "gpio85";
+	spi5_sleep_state: spi5-sleep-state {
+		spi5-pins {
+			pins = "gpio51", "gpio52", "gpio53", "gpio54";
 			function = "gpio";
-		};
-		pinconf {
-			pins = "gpio84", "gpio85";
 			drive-strength = <2>;
-			bias-disable;
+			bias-pull-down;
 		};
 	};
 
-	riva_fm_pin_a: riva-fm-active {
+	riva_fm_pin_a: riva-fm-active-state {
 		pins = "gpio14", "gpio15";
 		function = "riva_fm";
 	};
 
-	riva_bt_pin_a: riva-bt-active {
+	riva_bt_pin_a: riva-bt-active-state {
 		pins = "gpio16", "gpio17";
 		function = "riva_bt";
 	};
 
-	riva_wlan_pin_a: riva-wlan-active {
+	riva_wlan_pin_a: riva-wlan-active-state {
 		pins = "gpio64", "gpio65", "gpio66", "gpio67", "gpio68";
 		function = "riva_wlan";
 
@@ -320,22 +220,24 @@ riva_wlan_pin_a: riva-wlan-active {
 		bias-pull-down;
 	};
 
-	hdmi_pinctrl: hdmi-pinctrl {
-		mux {
-			pins = "gpio70", "gpio71", "gpio72";
-			function = "hdmi";
-		};
-
-		pinconf_ddc {
+	hdmi_pinctrl: hdmi-pinctrl-state {
+		ddc-pins {
 			pins = "gpio70", "gpio71";
+			function = "hdmi";
 			bias-pull-up;
 			drive-strength = <2>;
 		};
 
-		pinconf_hpd {
+		hpd-pins {
 			pins = "gpio72";
+			function = "hdmi";
 			bias-pull-down;
 			drive-strength = <16>;
 		};
 	};
+
+	ps_hold_default_state: ps-hold-default-state {
+		pins = "gpio78";
+		function = "ps_hold";
+	};
 };
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
index 2412aa3e3e8d..7752f07973f9 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
@@ -373,21 +373,21 @@ &sdcc3 {
 	cd-gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
 
 	pinctrl-names = "default";
-	pinctrl-0 = <&sdcc3_pins>, <&sdcc3_cd_pin_a>;
+	pinctrl-0 = <&sdcc3_default_state>, <&sdcc3_cd_pin_a>;
 
 	status = "okay";
 };
 
 &tlmm_pinmux {
-	gsbi5_uart_pin_a: gsbi5-uart-pin-active {
-		rx {
+	gsbi5_uart_pin_a: gsbi5-uart-pin-active-state {
+		rx-pins {
 			pins = "gpio52";
 			function = "gsbi5";
 			drive-strength = <2>;
 			bias-pull-up;
 		};
 
-		tx {
+		tx-pins {
 			pins = "gpio51";
 			function = "gsbi5";
 			drive-strength = <4>;
@@ -396,7 +396,7 @@ tx {
 	};
 
 
-	sdcc3_cd_pin_a: sdcc3-cd-pin-active {
+	sdcc3_cd_pin_a: sdcc3-cd-pin-active-state {
 		pins = "gpio26";
 		function = "gpio";
 
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 769e151747c3..00f273ffea9c 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -302,7 +302,7 @@ tlmm_pinmux: pinctrl@800000 {
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 
 			pinctrl-names = "default";
-			pinctrl-0 = <&ps_hold>;
+			pinctrl-0 = <&ps_hold_default_state>;
 		};
 
 		sfpb_wrapper_mutex: syscon@1200000 {
@@ -435,8 +435,8 @@ gsbi1_serial: serial@12450000 {
 
 			gsbi1_i2c: i2c@12460000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
-				pinctrl-0 = <&i2c1_pins>;
-				pinctrl-1 = <&i2c1_pins_sleep>;
+				pinctrl-0 = <&i2c1_default_state>;
+				pinctrl-1 = <&i2c1_sleep_state>;
 				pinctrl-names = "default", "sleep";
 				reg = <0x12460000 0x1000>;
 				interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
@@ -465,8 +465,8 @@ gsbi2: gsbi@12480000 {
 			gsbi2_i2c: i2c@124a0000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
 				reg = <0x124a0000 0x1000>;
-				pinctrl-0 = <&i2c2_pins>;
-				pinctrl-1 = <&i2c2_pins_sleep>;
+				pinctrl-0 = <&i2c2_default_state>;
+				pinctrl-1 = <&i2c2_sleep_state>;
 				pinctrl-names = "default", "sleep";
 				interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&gcc GSBI2_QUP_CLK>, <&gcc GSBI2_H_CLK>;
@@ -489,8 +489,8 @@ gsbi3: gsbi@16200000 {
 			ranges;
 			gsbi3_i2c: i2c@16280000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
-				pinctrl-0 = <&i2c3_pins>;
-				pinctrl-1 = <&i2c3_pins_sleep>;
+				pinctrl-0 = <&i2c3_default_state>;
+				pinctrl-1 = <&i2c3_sleep_state>;
 				pinctrl-names = "default", "sleep";
 				reg = <0x16280000 0x1000>;
 				interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
@@ -528,8 +528,8 @@ gsbi4_serial: serial@16340000 {
 
 			gsbi4_i2c: i2c@16380000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
-				pinctrl-0 = <&i2c4_pins>;
-				pinctrl-1 = <&i2c4_pins_sleep>;
+				pinctrl-0 = <&i2c4_default_state>;
+				pinctrl-1 = <&i2c4_sleep_state>;
 				pinctrl-names = "default", "sleep";
 				reg = <0x16380000 0x1000>;
 				interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
@@ -565,8 +565,8 @@ gsbi5_spi: spi@1a280000 {
 				compatible = "qcom,spi-qup-v1.1.1";
 				reg = <0x1a280000 0x1000>;
 				interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
-				pinctrl-0 = <&spi5_default>;
-				pinctrl-1 = <&spi5_sleep>;
+				pinctrl-0 = <&spi5_default_state>;
+				pinctrl-1 = <&spi5_sleep_state>;
 				pinctrl-names = "default", "sleep";
 				clocks = <&gcc GSBI5_QUP_CLK>, <&gcc GSBI5_H_CLK>;
 				clock-names = "core", "iface";
@@ -599,8 +599,8 @@ gsbi6_serial: serial@16540000 {
 
 			gsbi6_i2c: i2c@16580000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
-				pinctrl-0 = <&i2c6_pins>;
-				pinctrl-1 = <&i2c6_pins_sleep>;
+				pinctrl-0 = <&i2c6_default_state>;
+				pinctrl-1 = <&i2c6_sleep_state>;
 				pinctrl-names = "default", "sleep";
 				reg = <0x16580000 0x1000>;
 				interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
@@ -635,8 +635,8 @@ gsbi7_serial: serial@16640000 {
 
 			gsbi7_i2c: i2c@16680000 {
 				compatible = "qcom,i2c-qup-v1.1.1";
-				pinctrl-0 = <&i2c7_pins>;
-				pinctrl-1 = <&i2c7_pins_sleep>;
+				pinctrl-0 = <&i2c7_default_state>;
+				pinctrl-1 = <&i2c7_sleep_state>;
 				pinctrl-names = "default", "sleep";
 				reg = <0x16680000 0x1000>;
 				interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
@@ -945,7 +945,7 @@ sdcc4: mmc@121c0000 {
 			dmas = <&sdcc4bam 2>, <&sdcc4bam 1>;
 			dma-names = "tx", "rx";
 			pinctrl-names = "default";
-			pinctrl-0 = <&sdc4_gpios>;
+			pinctrl-0 = <&sdc4_default_state>;
 		};
 
 		sdcc4bam: dma-controller@121c2000 {
@@ -962,7 +962,7 @@ sdcc1: mmc@12400000 {
 			status = "disabled";
 			compatible = "arm,pl18x", "arm,primecell";
 			pinctrl-names = "default";
-			pinctrl-0 = <&sdcc1_pins>;
+			pinctrl-0 = <&sdcc1_default_state>;
 			arm,primecell-periphid = <0x00051180>;
 			reg = <0x12400000 0x2000>;
 			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.45.2


