Return-Path: <linux-arm-msm+bounces-25786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F9792CD5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 10:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79436286C63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 08:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D10C146017;
	Wed, 10 Jul 2024 08:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypoI9GOS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8467113E022
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 08:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720601075; cv=none; b=DTQROokfT6v1n/n3OKuppTTFDCPd4DlrLGsiFJP0TtpkypxMAgmYPxEDrsU8/OjH9V5nNgohEaI099yURPwazWDBmlarb1xA4CW2yrUpgLTmPBPYdqSru7xaUsOQevYUrSGKzsox8tYjoN4ZNCYh+7B1Qofh5xLgrfZc5R6muDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720601075; c=relaxed/simple;
	bh=3PIe7piaWVFGpw8MubkhAAz6xi+0WnfUt+cBmrfaOkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJavjaJZ0JmUzsoXAzpoFFAN6BrIWcNzQvMoir7WsqgCa3/hoFhO5Jh59s4MckHnxro71qhx/oUCQqIjyPx5ZLKMIgeQza3laFh5w3Z80uBgNB8RbdXW6NQMkaS/ogGcr3aj+ran/ZkISMdZ5HTjVeKr7DehxmXJXUTUarfpw90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypoI9GOS; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52e9a920e73so7353298e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720601070; x=1721205870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47Gk9uLeoKD+iHQflXhvTs6O72DyKgkXk5UBuYrhpP4=;
        b=ypoI9GOSikdvijyrTWPNuwc7xK3stFudFHMVqtMcwHUNtfmr94SAHrzCW1KKMOS2KD
         IqlZPeB1DQ4hBQYNZ57nnkZ4JYTOVuNS5BXzvqZivvh9ro/aa6kyanJAHws9jPbYDWum
         DvqyC82zJuPBtMdhmK0lXrDevAN9n1wTzqRQVEGfoX7bfapULH90utXZEmijeBTyCbDs
         WQ7S3KdoVOlUcGb35Cd6LCixXlXI7hPQ+TT5sFn4H6eBXNAJvjlhCoeWbWHaascOQLKg
         nHzwpWPwtlvlxyPYott7u5eIEjPqo7QDyZSmNZmcrxbSbla841n5VR2DdV8THW/F3FST
         kGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720601070; x=1721205870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47Gk9uLeoKD+iHQflXhvTs6O72DyKgkXk5UBuYrhpP4=;
        b=ve8Q+XRff3ThbpA3D3zbgFjGeiZviUyxUJNMT2Or2YGCM5Pz2ji2O7YGEqlhDL8Yu1
         03mVyU7ujRQ6bloZ68+CEWDa4J6fQdk8aEEMjEN+kyKVC7aiV34bWkDJ475jvHTSn9VH
         w2kQfNnfyW/+zzldFg0eOg7XW597Z9PuoPMsmyJkk+dArsC9jGGeESRw5fc0D7z6liPA
         2mEl1sPBGyzr/0hPtzLhPE0E5bWswbU2pgUwgZ8mjIKwV0xMN6JMPZp+jwzGiqCK9oib
         sZCKrYtMjPn51aVrdB9Bovog8DevzSB/qlxjewiQBFWkJpQhWCiRVZKDKViGI9G6nNCg
         qYdg==
X-Gm-Message-State: AOJu0Yyvfgx3NAqFLG+HXagFls/nMdf1MxVyQ8SRbg7CnacXOUuQ+v1y
	s9kTDlEZTxCgQ84aet7VvPDR81MQOVC+U5FgKDZH5B/RDvnwlXwOElSfWbFS8OuQLsE19cguwwS
	w
X-Google-Smtp-Source: AGHT+IFOVpXXsCfwrwmObjem3DaqnWGhUl8p+VXfPqdcHT1FuMo/8WZ/pkPJhrg21nrbgAJMh2dJfw==
X-Received: by 2002:a19:644b:0:b0:52c:e0ce:2d32 with SMTP id 2adb3069b0e04-52eb99a0790mr2219255e87.36.1720601070408;
        Wed, 10 Jul 2024 01:44:30 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfa06ffsm4700403f8f.77.2024.07.10.01.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 01:44:30 -0700 (PDT)
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
Subject: [PATCH 3/3] ARM: dts: qcom: ipq4019: adhere to pinctrl dtschema
Date: Wed, 10 Jul 2024 09:41:11 +0100
Message-ID: <20240710084250.11342-4-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710084250.11342-1-rayyan.ansari@linaro.org>
References: <20240710084250.11342-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass dt_binding_check for qcom,ipq4019-pinctrl.yaml.

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
---
 .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi | 34 ++++++++-----------
 .../boot/dts/qcom/qcom-ipq4018-jalapeno.dts   | 27 ++++++---------
 .../boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi | 26 +++++---------
 .../boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi | 14 ++++----
 .../dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts    |  8 ++---
 .../dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dts    |  2 +-
 .../boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi |  6 ++--
 7 files changed, 50 insertions(+), 67 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
index da67d55fa557..0d23c03fae33 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi
@@ -28,46 +28,42 @@ key-reset {
 };
 
 &tlmm {
-	i2c0_pins: i2c0_pinmux {
-		mux_i2c {
-			function = "blsp_i2c0";
-			pins = "gpio58", "gpio59";
-			drive-strength = <16>;
-			bias-disable;
-		};
+	i2c0_pins: i2c0-state {
+		function = "blsp_i2c0";
+		pins = "gpio58", "gpio59";
+		drive-strength = <16>;
+		bias-disable;
 	};
 
-	mdio_pins: mdio_pinmux {
-		mux_mdio {
+	mdio_pins: mdio-state {
+		mdio-pins {
 			pins = "gpio53";
 			function = "mdio";
 			bias-pull-up;
 		};
 
-		mux_mdc {
+		mdc-pins {
 			pins = "gpio52";
 			function = "mdc";
 			bias-pull-up;
 		};
 	};
 
-	serial0_pins: serial0_pinmux {
-		mux_uart {
-			pins = "gpio60", "gpio61";
-			function = "blsp_uart0";
-			bias-disable;
-		};
+	serial0_pins: serial0-state {
+		pins = "gpio60", "gpio61";
+		function = "blsp_uart0";
+		bias-disable;
 	};
 
-	spi0_pins: spi0_pinmux {
-		mux_spi {
+	spi0_pins: spi0-state {
+		spi0-pins {
 			function = "blsp_spi0";
 			pins = "gpio55", "gpio56", "gpio57";
 			drive-strength = <12>;
 			bias-disable;
 		};
 
-		mux_cs {
+		spi0-cs-pins {
 			function = "gpio";
 			pins = "gpio54", "gpio4";
 			drive-strength = <2>;
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts b/arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts
index 365fbac417fd..ac3b30072a22 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts
@@ -11,40 +11,35 @@ / {
 };
 
 &tlmm {
-	mdio_pins: mdio_pinmux {
-		pinmux_1 {
+	mdio_pins: mdio-state {
+		mdio-pins {
 			pins = "gpio53";
 			function = "mdio";
+			bias-pull-up;
 		};
 
-		pinmux_2 {
+		mdc-pins {
 			pins = "gpio52";
 			function = "mdc";
-		};
-
-		pinconf {
-			pins = "gpio52", "gpio53";
 			bias-pull-up;
 		};
 	};
 
-	serial_pins: serial_pinmux {
-		mux {
-			pins = "gpio60", "gpio61";
-			function = "blsp_uart0";
-			bias-disable;
-		};
+	serial_pins: serial-state{
+		pins = "gpio60", "gpio61";
+		function = "blsp_uart0";
+		bias-disable;
 	};
 
-	spi_0_pins: spi_0_pinmux {
-		pin {
+	spi_0_pins: spi-0-state {
+		spi0-pins {
 			function = "blsp_spi0";
 			pins = "gpio55", "gpio56", "gpio57";
 			drive-strength = <2>;
 			bias-disable;
 		};
 
-		pin_cs {
+		spi0-cs-pins {
 			function = "gpio";
 			pins = "gpio54", "gpio59";
 			drive-strength = <2>;
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi
index f7ac8f9d0b6f..efbe89dd4793 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi
@@ -34,30 +34,22 @@ &prng {
 };
 
 &tlmm {
-	serial_pins: serial_pinmux {
-		mux {
-			pins = "gpio60", "gpio61";
-			function = "blsp_uart0";
-			bias-disable;
-		};
+	serial_pins: serial-state {
+		pins = "gpio60", "gpio61";
+		function = "blsp_uart0";
+		bias-disable;
 	};
 
-	spi_0_pins: spi_0_pinmux {
-		pinmux {
-			function = "blsp_spi0";
-			pins = "gpio55", "gpio56", "gpio57";
-		};
-		pinmux_cs {
-			function = "gpio";
-			pins = "gpio54";
-		};
-		pinconf {
+	spi_0_pins: spi-0-state {
+		spi0-pins {
 			pins = "gpio55", "gpio56", "gpio57";
+			function = "blsp_spi0";
 			drive-strength = <12>;
 			bias-disable;
 		};
-		pinconf_cs {
+		spi0-cs-pins {
 			pins = "gpio54";
+			function = "gpio";
 			drive-strength = <2>;
 			bias-disable;
 			output-high;
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi
index 374af6dd360a..91e296d2ea82 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi
@@ -24,26 +24,26 @@ memory {
 
 	soc {
 		pinctrl@1000000 {
-			serial_0_pins: serial0-pinmux {
+			serial_0_pins: serial0-state {
 				pins = "gpio16", "gpio17";
 				function = "blsp_uart0";
 				bias-disable;
 			};
 
-			serial_1_pins: serial1-pinmux {
+			serial_1_pins: serial1-state {
 				pins = "gpio8", "gpio9",
 					"gpio10", "gpio11";
 				function = "blsp_uart1";
 				bias-disable;
 			};
 
-			spi_0_pins: spi-0-pinmux {
-				pinmux {
+			spi_0_pins: spi-0-state {
+				spi0-pins {
 					function = "blsp_spi0";
 					pins = "gpio13", "gpio14", "gpio15";
 					bias-disable;
 				};
-				pinmux_cs {
+				spi0-cs-pins {
 					function = "gpio";
 					pins = "gpio12";
 					bias-disable;
@@ -51,13 +51,13 @@ pinmux_cs {
 				};
 			};
 
-			i2c_0_pins: i2c-0-pinmux {
+			i2c_0_pins: i2c-0-state {
 				pins = "gpio20", "gpio21";
 				function = "blsp_i2c0";
 				bias-disable;
 			};
 
-			nand_pins: nand-pins {
+			nand_pins: nand-state {
 				pins = "gpio53", "gpio55", "gpio56",
 					"gpio57", "gpio58", "gpio59",
 					"gpio60", "gpio62", "gpio63",
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts
index ea2987fcbff8..41c5874f6f97 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts
@@ -19,20 +19,20 @@ spi@78b6000 {
 		};
 
 		pinctrl@1000000 {
-			serial_1_pins: serial1-pinmux {
+			serial_1_pins: serial1-state {
 				pins = "gpio8", "gpio9",
 					"gpio10", "gpio11";
 				function = "blsp_uart1";
 				bias-disable;
 			};
 
-			spi_0_pins: spi-0-pinmux {
-				pinmux {
+			spi_0_pins: spi-0-state {
+				spi0-pins {
 					function = "blsp_spi0";
 					pins = "gpio13", "gpio14", "gpio15";
 					bias-disable;
 				};
-				pinmux_cs {
+				spio-cs-pins {
 					function = "gpio";
 					pins = "gpio12";
 					bias-disable;
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dts b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dts
index bd3553dd2070..67ee99d69757 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dts
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1-c2.dts
@@ -9,7 +9,7 @@ / {
 
 	soc {
 		pinctrl@1000000 {
-			serial_1_pins: serial1-pinmux {
+			serial_1_pins: serial1-state {
 				pins = "gpio8", "gpio9";
 				function = "blsp_uart1";
 				bias-disable;
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi
index 7ef635997efa..cc88cf5f0d9b 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi
@@ -24,19 +24,19 @@ chosen {
 
 	soc {
 		pinctrl@1000000 {
-			serial_0_pins: serial0-pinmux {
+			serial_0_pins: serial0-state {
 				pins = "gpio16", "gpio17";
 				function = "blsp_uart0";
 				bias-disable;
 			};
 
-			i2c_0_pins: i2c-0-pinmux {
+			i2c_0_pins: i2c-0-state {
 				pins = "gpio20", "gpio21";
 				function = "blsp_i2c0";
 				bias-disable;
 			};
 
-			nand_pins: nand-pins {
+			nand_pins: nand-state {
 				pins = "gpio53", "gpio55", "gpio56",
 				       "gpio57", "gpio58", "gpio59",
 				       "gpio60", "gpio62", "gpio63",
-- 
2.45.2


