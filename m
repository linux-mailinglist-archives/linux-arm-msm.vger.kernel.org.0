Return-Path: <linux-arm-msm+bounces-25958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D4F92E57F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 13:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7F231F2566B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 11:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D106168493;
	Thu, 11 Jul 2024 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DHD4AxUM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8B15A4B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 11:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720696062; cv=none; b=nI3xC+bJfERvRaUYbsoQJgDuaCxLoyp8A42feefCY06stAQL4G4xF3kJijOZ+nGfh4UgOCOVK/39gszf6Sym3iIrS9ch1rw/njlkV4teD9x/l9tmjRylsznWL0wanDQEvpW3LgjAZWIYFgZF2J6SLShgAIuxOf7oLFqNcLRoNX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720696062; c=relaxed/simple;
	bh=mzZ3pl3dpZ7237y505ghg38RJ2tgoXNWrZaJKF5BE/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WsN1grE/aZxyDIHtRvRUZS7E0aAUu25W5pFwFvREtPjU6tLQkmcDBpkcIruD0u4Cw94q0iNAGank3/lqcjwvP7aQk/loBfobtdjPINSoa+RJUhPJ7QvgrSNXjDRjTLJSkpNogYXOFbiH6hsarxsjaU4OpT3T1JuhNUBH315VmOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DHD4AxUM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4277a5ed48bso5269115e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2024 04:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720696058; x=1721300858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFEhk/0Cl9r39Qwi/jzKq/9WvcZGMOQjiyebCn435tw=;
        b=DHD4AxUMA7E+gN1lua8nemFacUGcsKRbbn9ImHTdXTbMwN0IRfUKL0B6MUBoguDDzj
         +bpqo3kT5gwQb2YvOkMLKSslLojkGRjdtDnXVK81v7kXAHua9WAEu/mTFz1lD9SxStLs
         uv8iZodL02KG9cCeUyevWGRu2Q9wgtYbNKPv388fWEGeqyQTqKKd8+ziwYLmcduRl5PM
         sDDHS/4Dq0sOfMfTJMadTWEYkddF6Sxp0NmFh3dClpLbbj0o06G0+sV6awLNgxRb78Kk
         PObFTa/NtUUhxsOhck95mGy6r2wBwA7wbCZAKmCAUYv/AuunHnaPkInvsk2uKNarr30a
         Xp2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696058; x=1721300858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFEhk/0Cl9r39Qwi/jzKq/9WvcZGMOQjiyebCn435tw=;
        b=M7bWYpE5xbp9wbbuijeoQ6D4IK81Ij8Jn3Wya2rXV8T7a7xmxrI92rgBV+QqDCKeII
         PgE7UNKLkZk4GHscQ5ntgUlWYV6cWpympCpNVhiX+Evim0oo0540FiG/piQRwpOat4Mk
         fV+7CLRbHVOqTAM4/Cm/Zl7wnxmGTcWq8DLIBpKvGSVoamc8w4HQXdpYHb8n3jxeHuU5
         RmytA7AXR7MfmSt7XLmEIvFlms5o8rFD5NQMdpnOec+ZfwmmGEFc3DV7KvBCmPn1s7KT
         DR0HIJApwPVERm/bDlrWjN16d1x5c1JsCakNif7f0fq1qArc4dRQ6Q+6EY7rjiaT3THW
         3sxg==
X-Gm-Message-State: AOJu0YwJPt5iTFZf4GF7tav3ZfTVoYFUWL9jV2RMdVkhSd7+junWmcFI
	zrCP7AZOWhoz4S9bfO7pl+tLGAiF0VV3jqzi66gVQEI0NdOw1Texkdxn35GCfeyYkVGEkDKvu7N
	r
X-Google-Smtp-Source: AGHT+IGOMFiwBzNnDWLV/XwDMxCb/wb02md8RkINWPblrdcbcYdWkUP8pGZq4f9tod7j9F7Ihb2f9g==
X-Received: by 2002:a05:600c:42d3:b0:426:5546:71a with SMTP id 5b1f17b1804b1-426705ce6f0mr50887625e9.2.1720696058214;
        Thu, 11 Jul 2024 04:07:38 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6e097bsm115686685e9.6.2024.07.11.04.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:07:37 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: linux-arm-msm@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 4/5] ARM: dts: qcom: ipq8064: adhere to pinctrl dtschema
Date: Thu, 11 Jul 2024 12:01:41 +0100
Message-ID: <20240711110545.31641-6-rayyan.ansari@linaro.org>
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

Pass dtbs_check for qcom,ipq8064-pinctrl.yaml.
Also remove invalid "bias-none" property, which I have assumed to mean
"bias-disable".

Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v1 -> v2: corrected commit message, added r-b tag

 arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dts |  11 +-
 .../arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts |  76 +++++-------
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi      | 114 ++++++++----------
 3 files changed, 87 insertions(+), 114 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dts
index a654d3c22c4f..5a8bf1a6f559 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dts
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dts
@@ -7,12 +7,11 @@ / {
 
 	soc {
 		pinmux@800000 {
-			buttons_pins: buttons_pins {
-				mux {
-					pins = "gpio54", "gpio65";
-					drive-strength = <2>;
-					bias-pull-up;
-				};
+			buttons_pins: buttons-state {
+				pins = "gpio54", "gpio65";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-up;
 			};
 		};
 
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts b/arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts
index 12e806adcda8..f09da9460c86 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dts
@@ -404,59 +404,49 @@ main@800000 {
 };
 
 &qcom_pinmux {
-	buttons_pins: buttons_pins {
-		mux {
-			pins = "gpio66";
-			drive-strength = <16>;
-			bias-disable;
-		};
+	buttons_pins: buttons-state {
+		pins = "gpio66";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
 	};
 
-	leds_pins: leds_pins {
-		mux {
-			pins = "gpio33";
-			drive-strength = <16>;
-			bias-disable;
-		};
+	leds_pins: leds-state {
+		pins = "gpio33";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
 	};
 
-	mdio1_pins: mdio1_pins {
-		mux {
-			pins = "gpio10", "gpio11";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-disable;
-		};
+	mdio1_pins: mdio1-state {
+		pins = "gpio10", "gpio11";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
 	};
 
-	sw0_reset_pin: sw0_reset_pin {
-		mux {
-			pins = "gpio16";
-			drive-strength = <16>;
-			function = "gpio";
-			bias-disable;
-			input-disable;
-		};
+	sw0_reset_pin: sw0-reset-state {
+		pins = "gpio16";
+		drive-strength = <16>;
+		function = "gpio";
+		bias-disable;
+		input-disable;
 	};
 
-	sw1_reset_pin: sw1_reset_pin {
-		mux {
-			pins = "gpio17";
-			drive-strength = <16>;
-			function = "gpio";
-			bias-disable;
-			input-disable;
-		};
+	sw1_reset_pin: sw1-reset-state {
+		pins = "gpio17";
+		drive-strength = <16>;
+		function = "gpio";
+		bias-disable;
+		input-disable;
 	};
 
-	usb1_pwr_en_pins: usb1_pwr_en_pins {
-		mux {
-			pins = "gpio4";
-			function = "gpio";
-			drive-strength = <16>;
-			bias-disable;
-			output-high;
-		};
+	usb1_pwr_en_pins: usb1-pwr-en-state {
+		pins = "gpio4";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-high;
 	};
 };
 
diff --git a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
index da0fd75f4711..9adefc88c5b4 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi
@@ -399,70 +399,58 @@ qcom_pinmux: pinmux@800000 {
 			#interrupt-cells = <2>;
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 
-			pcie0_pins: pcie0_pinmux {
-				mux {
-					pins = "gpio3";
-					function = "pcie1_rst";
-					drive-strength = <12>;
-					bias-disable;
-				};
+			pcie0_pins: pcie0-state {
+				pins = "gpio3";
+				function = "pcie1_rst";
+				drive-strength = <12>;
+				bias-disable;
 			};
 
-			pcie1_pins: pcie1_pinmux {
-				mux {
-					pins = "gpio48";
-					function = "pcie2_rst";
-					drive-strength = <12>;
-					bias-disable;
-				};
+			pcie1_pins: pcie1-state {
+				pins = "gpio48";
+				function = "pcie2_rst";
+				drive-strength = <12>;
+				bias-disable;
 			};
 
-			pcie2_pins: pcie2_pinmux {
-				mux {
-					pins = "gpio63";
-					function = "pcie3_rst";
-					drive-strength = <12>;
-					bias-disable;
-				};
+			pcie2_pins: pcie2-state {
+				pins = "gpio63";
+				function = "pcie3_rst";
+				drive-strength = <12>;
+				bias-disable;
 			};
 
-			i2c4_pins: i2c4-default {
+			i2c4_pins: i2c4-state {
 				pins = "gpio12", "gpio13";
 				function = "gsbi4";
 				drive-strength = <12>;
 				bias-disable;
 			};
 
-			spi_pins: spi_pins {
-				mux {
-					pins = "gpio18", "gpio19", "gpio21";
-					function = "gsbi5";
-					drive-strength = <10>;
-					bias-none;
-				};
+			spi_pins: spi-state {
+				pins = "gpio18", "gpio19", "gpio21";
+				function = "gsbi5";
+				drive-strength = <10>;
+				bias-disable;
 			};
 
-			leds_pins: leds_pins {
-				mux {
-					pins = "gpio7", "gpio8", "gpio9",
-					       "gpio26", "gpio53";
-					function = "gpio";
-					drive-strength = <2>;
-					bias-pull-down;
-					output-low;
-				};
+			leds_pins: leds-state {
+				pins = "gpio7", "gpio8", "gpio9",
+					"gpio26", "gpio53";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+				output-low;
 			};
 
-			buttons_pins: buttons_pins {
-				mux {
-					pins = "gpio54";
-					drive-strength = <2>;
-					bias-pull-up;
-				};
+			buttons_pins: buttons-state {
+				pins = "gpio54";
+				drive-strength = <2>;
+				bias-pull-up;
 			};
 
-			nand_pins: nand_pins {
-				mux {
+			nand_pins: nand-state {
+				nand-pins {
 					pins = "gpio34", "gpio35", "gpio36",
 					       "gpio37", "gpio38", "gpio39",
 					       "gpio40", "gpio41", "gpio42",
@@ -473,14 +461,14 @@ mux {
 					bias-disable;
 				};
 
-				pullups {
+				nand-pullup-pins {
 					pins = "gpio39";
 					function = "nand";
 					drive-strength = <10>;
 					bias-pull-up;
 				};
 
-				hold {
+				nand-hold-pins {
 					pins = "gpio40", "gpio41", "gpio42",
 					       "gpio43", "gpio44", "gpio45",
 					       "gpio46", "gpio47";
@@ -490,25 +478,21 @@ hold {
 				};
 			};
 
-			mdio0_pins: mdio0-pins {
-				mux {
-					pins = "gpio0", "gpio1";
-					function = "mdio";
-					drive-strength = <8>;
-					bias-disable;
-				};
+			mdio0_pins: mdio0-state {
+				pins = "gpio0", "gpio1";
+				function = "mdio";
+				drive-strength = <8>;
+				bias-disable;
 			};
 
-			rgmii2_pins: rgmii2-pins {
-				mux {
-					pins = "gpio27", "gpio28", "gpio29",
-					       "gpio30", "gpio31", "gpio32",
-					       "gpio51", "gpio52", "gpio59",
-					       "gpio60", "gpio61", "gpio62";
-					function = "rgmii2";
-					drive-strength = <8>;
-					bias-disable;
-				};
+			rgmii2_pins: rgmii2-state {
+				pins = "gpio27", "gpio28", "gpio29",
+					"gpio30", "gpio31", "gpio32",
+					"gpio51", "gpio52", "gpio59",
+					"gpio60", "gpio61", "gpio62";
+				function = "rgmii2";
+				drive-strength = <8>;
+				bias-disable;
 			};
 		};
 
-- 
2.45.2


