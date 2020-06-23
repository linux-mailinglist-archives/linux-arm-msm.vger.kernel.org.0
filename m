Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1E6206788
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 00:48:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388727AbgFWWsX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 18:48:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388054AbgFWWsV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 18:48:21 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F9BC061795;
        Tue, 23 Jun 2020 15:48:20 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id f18so406658wml.3;
        Tue, 23 Jun 2020 15:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QNsZ7eaqIWwU4dr0S7cmCEAjS9ribEFdecIzspYm6uk=;
        b=Y9O+f07tLsHYMIy4uDKSUeIdw/ZjS2rM8dbcZ1I4EG9+nHruxsLdbLPVh7a+B740kR
         anPBoEmLd0gP2EoDr0DtXXfYFJtwqP9YSk79MtY4VJ4z8APGlTx3b9fC7aybzZtIuRww
         ObBBCgzaXBQnU2hHgn+sFFidAUank/9+7MFDy3IpOhRgtjf04t+r9NWmFyal9sCGyKI/
         Z97IuxdKry09hmvFsH63upTNsCz7eu7GSaIE81mkb800xugtqALffxX4iGxSQu9CEw3x
         dirmHVYvThqh5bZ8JlhSZyIBeIGVFDVUcNp891IdkfBexHRdYhrF6wIUlmMjkBhTnBBe
         9wqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QNsZ7eaqIWwU4dr0S7cmCEAjS9ribEFdecIzspYm6uk=;
        b=ZnN37Y3RArV/ah1PzlNdtRbBd+XtrE7uacqyxNzh0yuGPfLGWsqiqoZ6W+FKLRiG6U
         xJViUmpP0BURUdNFENE/nkcd0BMmkAYjVsbCPOlLAVJm7BJk77JylvLj9hc0svE+Npmv
         jmJmsFa/HRadR9pbqtlCQQe9d42o9htb6Yq/fqd2nRnwCz+dnAoS47Gi1R9hotWLpaDQ
         +zvCcB8yM5JmA8PTcKxhn95NlYVTEA+K0QRMaXLLiSfRWH+80O3od2vzGPdelZtfa70C
         W7FqdOBRNhVDGdi9j9FWg3dVyi9FvU1GehCwIESRbvvkf/cSzlB6rGp32HRf66slA94b
         tH5g==
X-Gm-Message-State: AOAM530TTY5iqaZaxpMxhYmk0OHQNqGcneiPHJtxyCN8U6FULiGeVjOn
        wOi8P4bEh29sKctmzAheHUI=
X-Google-Smtp-Source: ABdhPJzwU89qsop+qDYvXf/ra15nPxMZuC0/lNfnQ5haN223zuXyZqkFnHIdPSoWKqsZrji/tjTKOw==
X-Received: by 2002:a1c:4b0f:: with SMTP id y15mr27798264wma.83.1592952499480;
        Tue, 23 Jun 2020 15:48:19 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id g144sm5671179wme.2.2020.06.23.15.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 15:48:19 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/12] arm64: dts: qcom: msm8994: Modernize the DTS style
Date:   Wed, 24 Jun 2020 00:48:00 +0200
Message-Id: <20200623224813.297077-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200623224813.297077-1-konradybcio@gmail.com>
References: <20200623224813.297077-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Following changes have been made:

- remove name, compatible and msm-id
- wrap clocks in clocks{}
- order nodes by name and by address
- clock_gcc -> gcc
- msmgpio -> tlmm
- qcom,smem -> smem
- remove unit-address from smem
- retire msm8994-pins.dtsi
- add some of the missing pins
- make comments C-style

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi |  30 ---
 arch/arm64/boot/dts/qcom/msm8994.dtsi      | 288 ++++++++++++++++-----
 2 files changed, 224 insertions(+), 94 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8994-pins.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8994-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
deleted file mode 100644
index 2e118d967f53..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8994-pins.dtsi
+++ /dev/null
@@ -1,30 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
- */
-
-&msmgpio {
-	blsp1_uart2_default: blsp1_uart2_default {
-		pinmux {
-			function = "blsp_uart2";
-			pins = "gpio4", "gpio5";
-		};
-		pinconf {
-			pins = "gpio4", "gpio5";
-			drive-strength = <16>;
-			bias-disable;
-		};
-	};
-
-	blsp1_uart2_sleep: blsp1_uart2_sleep {
-		pinmux {
-			function = "gpio";
-			pins = "gpio4", "gpio5";
-		};
-		pinconf {
-			pins = "gpio4", "gpio5";
-			drive-strength = <2>;
-			bias-pull-down;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index b1c2d7d6a0f2..79e6e46798c8 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -6,12 +6,6 @@
 #include <dt-bindings/clock/qcom,gcc-msm8994.h>
 
 / {
-	model = "Qualcomm Technologies, Inc. MSM 8994";
-	compatible = "qcom,msm8994";
-	// msm-id and pmic-id are required by bootloader for
-	// proper selection of dt blob
-	qcom,msm-id = <207 0x20000>;
-	qcom,pmic-id = <0x10009 0x1000A 0x0 0x0>;
 	interrupt-parent = <&intc>;
 
 	#address-cells = <2>;
@@ -19,6 +13,20 @@ / {
 
 	chosen { };
 
+	clocks {
+		xo_board: xo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+		};
+
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -42,12 +50,27 @@ L2_0: l2-cache {
 		};
 	};
 
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts = <1 2 0xff08>,
-			     <1 3 0xff08>,
-			     <1 4 0xff08>,
-			     <1 1 0xff08>;
+	memory {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0 0 0>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		smem_mem: smem_region@6a00000 {
+			reg = <0x0 0x6a00000 0x0 0x200000>;
+			no-map;
+		};
+	};
+
+	smem {
+		compatible = "qcom,smem";
+		memory-region = <&smem_mem>;
+		hwlocks = <&tcsr_mutex 3>;
 	};
 
 	soc: soc {
@@ -123,72 +146,209 @@ frame@f9028000 {
 			};
 		};
 
+		blsp1_uart2: serial@f991e000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0xf991e000 0x1000>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+		};
+
+		gcc: clock-controller@fc400000 {
+			compatible = "qcom,gcc-msm8994";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+			reg = <0xfc400000 0x2000>;
+		};
+
 		restart@fc4ab000 {
 			compatible = "qcom,pshold";
 			reg = <0xfc4ab000 0x4>;
 		};
 
-		msmgpio: pinctrl@fd510000 {
+		tcsr_mutex_regs: syscon@fd484000 {
+			compatible = "syscon";
+			reg = <0xfd484000 0x2000>;
+		};
+
+		tlmm: pinctrl@fd510000 {
 			compatible = "qcom,msm8994-pinctrl";
 			reg = <0xfd510000 0x4000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
-			gpio-ranges = <&msmgpio 0 0 146>;
+			gpio-ranges = <&tlmm 0 0 146>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-		};
 
-		blsp1_uart2: serial@f991e000 {
-			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
-			reg = <0xf991e000 0x1000>;
-			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			status = "disabled";
-			clock-names = "core", "iface";
-			clocks = <&clock_gcc GCC_BLSP1_UART2_APPS_CLK>,
-				 <&clock_gcc GCC_BLSP1_AHB_CLK>;
-		};
+			blsp1_uart2_default: blsp1-uart2-default {
+				function = "blsp_uart2";
+				pins = "gpio4", "gpio5";
+				drive-strength = <16>;
+				bias-disable;
+			};
 
-		tcsr_mutex_regs: syscon@fd484000 {
-			compatible = "syscon";
-			reg = <0xfd484000 0x2000>;
-		};
+			blsp1_uart2_sleep: blsp1-uart2-sleep {
+				function = "gpio";
+				pins = "gpio4", "gpio5";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
 
-		clock_gcc: clock-controller@fc400000 {
-			compatible = "qcom,gcc-msm8994";
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-			reg = <0xfc400000 0x2000>;
-		};
-	};
+			blsp2_uart2_default: blsp2-uart2-default {
+				function = "blsp_uart8";
+				pins = "gpio45", "gpio46";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-	memory {
-		device_type = "memory";
-		// We expect the bootloader to fill in the reg
-		reg = <0 0 0 0>;
-	};
+			blsp2_uart2_sleep: blsp2-uart2-sleep {
+				function = "gpio";
+				pins = "gpio45", "gpio46";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
 
-	xo_board: xo_board {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <19200000>;
-	};
+			i2c1_default: i2c1-default {
+				function = "blsp_i2c1";
+				pins = "gpio2", "gpio3";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-	sleep_clk: sleep_clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <32768>;
-	};
+			i2c1_sleep: i2c1-sleep {
+				function = "gpio";
+				pins = "gpio2", "gpio3";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
+			i2c2_default: i2c2-default {
+				function = "blsp_i2c2";
+				pins = "gpio6", "gpio7";
+				drive-strength = <2>;
+				bias-disable;
+			};
 
-		smem_mem: smem_region@6a00000 {
-			reg = <0x0 0x6a00000 0x0 0x200000>;
-			no-map;
+			i2c2_sleep: i2c2-sleep {
+				function = "gpio";
+				pins = "gpio6", "gpio7";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c4_default: i2c4-default {
+				function = "blsp_i2c4";
+				pins = "gpio19", "gpio20";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c4_sleep: i2c4-sleep {
+				function = "gpio";
+				pins = "gpio19", "gpio20";
+				drive-strength = <2>;
+				bias-pull-down;
+				input-enable;
+			};
+
+			i2c5_default: i2c5-default {
+				function = "blsp_i2c5";
+				pins = "gpio23", "gpio24";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c5_sleep: i2c5-sleep {
+				function = "gpio";
+				pins = "gpio23", "gpio24";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c6_default: i2c6-default {
+				function = "blsp_i2c6";
+				pins = "gpio28", "gpio27";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c6_sleep: i2c6-sleep {
+				function = "gpio";
+				pins = "gpio28", "gpio27";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_spi0_default: blsp1-spi0-default {
+				default {
+					function = "blsp_spi1";
+					pins = "gpio0", "gpio1", "gpio3";
+					drive-strength = <10>;
+					bias-pull-down;
+				};
+				cs {
+					function = "gpio";
+					pins = "gpio8";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
+			blsp1_spi0_sleep: blsp1-spi0-sleep {
+				pins = "gpio0", "gpio1", "gpio3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			sdc1_clk_on: clk-on {
+				pins = "sdc1_clk";
+				bias-disable;
+				drive-strength = <16>;
+			};
+
+			sdc1_clk_off: clk-off {
+				pins = "sdc1_clk";
+				bias-disable;
+				drive-strength = <2>;
+			};
+
+			sdc1_cmd_on: cmd-on {
+				pins = "sdc1_cmd";
+				bias-pull-up;
+				drive-strength = <8>;
+			};
+
+			sdc1_cmd_off: cmd-off {
+				pins = "sdc1_cmd";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+
+			sdc1_data_on: data-on {
+				pins = "sdc1_data";
+				bias-pull-up;
+				drive-strength = <8>;
+			};
+
+			sdc1_data_off: data-off {
+				pins = "sdc1_data";
+				bias-pull-up;
+				drive-strength = <2>;
+			};
+
+			sdc1_rclk_on: rclk-on {
+				pins = "sdc1_rclk";
+				bias-pull-down;
+			};
+
+			sdc1_rclk_off: rclk-off {
+				pins = "sdc1_rclk";
+				bias-pull-down;
+			};
 		};
 	};
 
@@ -198,12 +358,12 @@ tcsr_mutex: hwlock {
 		#hwlock-cells = <1>;
 	};
 
-	qcom,smem@6a00000 {
-		compatible = "qcom,smem";
-		memory-region = <&smem_mem>;
-		hwlocks = <&tcsr_mutex 3>;
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <1 2 0xff08>,
+					<1 3 0xff08>,
+					<1 4 0xff08>,
+					<1 1 0xff08>;
 	};
 };
 
-
-#include "msm8994-pins.dtsi"
-- 
2.27.0

