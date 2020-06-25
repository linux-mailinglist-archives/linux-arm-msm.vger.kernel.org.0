Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396C620A499
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 20:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407014AbgFYSNO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 14:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405949AbgFYSNM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 14:13:12 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E9B3C08C5C1;
        Thu, 25 Jun 2020 11:13:12 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id d15so4921097edm.10;
        Thu, 25 Jun 2020 11:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iJGympPKw67tO36mbXPcyOIl3ANw6uW2ZpXFsuV8doQ=;
        b=AF6KOhNd8+Z498lcTZkzkHuRc8HYGLg+ra4HJY8xScZGERcE3yEo9z477NmntN/HXO
         EZpNii7Mz0AhODAF5OufTL/YX5ArQz0Wk7yAcDKDz8Z/5e7qyIx6an382mTpJTKvD1L6
         Tm7vp7IA5az1Z5R8cjYyHDYsFjbY11Hug0yAAd5Xwp1mIwT47X0L4A6sxHvJ48dgrKbP
         /iUjBjD4dCjV9UwUxKbR2LyxOSUIdlNl2fl5OS/a6yuf/MedtlM9FouTxxWCkyRZJS//
         8o+ssx4GyvfHlHZ8E6QgDt00t2D40rtcEyMFv5bdAk7Qol8XN1wnBt7zVxxgB3tvJAOZ
         Az2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iJGympPKw67tO36mbXPcyOIl3ANw6uW2ZpXFsuV8doQ=;
        b=By1awWqk4ihs0WxwCRl+13vmGBrhsL8JELvg53/GsTr2L8X+MjhEPCYUAp223NjQkU
         xJUN/xPi+XAeiQFYK3IU6ZhRnpEB+Dk5B2sHR2iT8x1lQf9SoWOiimU4FR64Elby/wJt
         /NZlqHuoDFvh0n+NU4v5Ka/i5o3zeJ9iVNW6X96/ZYDtlWjmd0lSNywy8FZafzO7Gp0k
         91vjTbX2pw6q2SZM2gEe1BVpLp1+LbSA1MFSGY0uZjED8WGHCqgva7GrTKkEOo+KwuqC
         ubMmzv6VcKm/lOmVLWhxGCjWIoRfbI5c4pHRBM5tO5wfR3QdFR2tcK0BoDXGv29pXu0g
         0BnQ==
X-Gm-Message-State: AOAM532R89wz9TkZeoOuxWs1hiofS94ZntfzH7yULNxS7CwyqHGOurRx
        6+9hZmwws1u95lYuZNVzbpg=
X-Google-Smtp-Source: ABdhPJxliXIU8SFDcw276rmMUQPABFANCc7oYCRao+mRQ9u8Exq4XVExljsDoF/TPVLb3qzwHOVisA==
X-Received: by 2002:aa7:c341:: with SMTP id j1mr3855343edr.197.1593108789491;
        Thu, 25 Jun 2020 11:13:09 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id p4sm19511112edj.64.2020.06.25.11.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 11:13:09 -0700 (PDT)
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
Subject: [PATCH v2 01/13] arm64: dts: qcom: msm8992: Modernize the DTS style
Date:   Thu, 25 Jun 2020 20:12:49 +0200
Message-Id: <20200625181303.129874-2-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625181303.129874-1-konradybcio@gmail.com>
References: <20200625181303.129874-1-konradybcio@gmail.com>
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
- retire msm8992-pins.dtsi
- add some of the missing pins
- make comments C-style
- make apcs a mailbox

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi |  90 --------
 arch/arm64/boot/dts/qcom/msm8992.dtsi      | 246 ++++++++++++++-------
 2 files changed, 168 insertions(+), 168 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8992-pins.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8992-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8992-pins.dtsi
deleted file mode 100644
index c543c718c22d..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8992-pins.dtsi
+++ /dev/null
@@ -1,90 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2013-2015, The Linux Foundation. All rights reserved.
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
-
-	/* 0-3 for sdc1 4-6 for sdc2 */
-	/* Order of pins */
-	/* SDC1: CLK -> 0, CMD -> 1, DATA -> 2, RCLK -> 3 */
-	/* SDC2: CLK -> 4, CMD -> 5, DATA -> 6 */
-	sdc1_clk_on: clk-on {
-		pinconf {
-			pins = "sdc1_clk";
-			bias-disable = <0>; /* No pull */
-			drive-strength = <16>; /* 16mA */
-		};
-	};
-
-	sdc1_clk_off: clk-off {
-		pinconf {
-			pins = "sdc1_clk";
-			bias-disable = <0>; /* No pull */
-			drive-strength = <2>; /* 2mA */
-		};
-	};
-
-	sdc1_cmd_on: cmd-on {
-		pinconf {
-			pins = "sdc1_cmd";
-			bias-pull-up;
-			drive-strength = <8>;
-		};
-	};
-
-	sdc1_cmd_off: cmd-off {
-		pinconf {
-			pins = "sdc1_cmd";
-			bias-pull-up = <0x3>; /* same as 3.10 ?? */
-			drive-strength = <2>; /* 2mA */
-		};
-	};
-
-	sdc1_data_on: data-on {
-		pinconf {
-			pins = "sdc1_data";
-			bias-pull-up;
-			drive-strength = <8>; /* 8mA */
-		};
-	};
-
-	sdc1_data_off: data-off {
-		pinconf {
-			pins = "sdc1_data";
-			bias-pull-up;
-			drive-strength = <2>;
-		};
-	};
-
-	sdc1_rclk_on: rclk-on {
-		bias-pull-down; /* pull down */
-	};
-
-	sdc1_rclk_off: rclk-off {
-		bias-pull-down; /* pull down */
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
index d41ba1ef687a..43b2e4cd26f0 100644
--- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
@@ -6,10 +6,6 @@
 #include <dt-bindings/clock/qcom,gcc-msm8994.h>
 
 / {
-	model = "Qualcomm Technologies, Inc. MSM 8992";
-	compatible = "qcom,msm8992";
-	// msm-id needed by bootloader for selecting correct blob
-	qcom,msm-id = <251 0>, <252 0>;
 	interrupt-parent = <&intc>;
 
 	#address-cells = <2>;
@@ -40,35 +36,35 @@ L2_0: l2-cache {
 		};
 	};
 
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
-	};
+	clocks {
+		xo_board: xo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+		};
 
-	xo_board: xo_board {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <19200000>;
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
 	};
 
-	sleep_clk: sleep_clk {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <32768>;
+	memory {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the reg */
+		reg = <0 0 0 0>;
 	};
 
-	vreg_vph_pwr: vreg-vph-pwr {
-		compatible = "regulator-fixed";
-		status = "okay";
-		regulator-name = "vph-pwr";
-
-		regulator-min-microvolt = <3600000>;
-		regulator-max-microvolt = <3600000>;
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
 
-		regulator-always-on;
+		smem_region: smem@6a00000 {
+			reg = <0x0 0x6a00000 0x0 0x200000>;
+			no-map;
+		};
 	};
 
 	sfpb_mutex: hwmutex {
@@ -98,9 +94,10 @@ intc: interrupt-controller@f9000000 {
 				<0xf9002000 0x1000>;
 		};
 
-		apcs: syscon@f900d000 {
-			compatible = "syscon";
+		apcs: mailbox@f900d000 {
+			compatible = "qcom,msm8994-apcs-kpss-global", "syscon";
 			reg = <0xf900d000 0x2000>;
+			#mbox-cells = <1>;
 		};
 
 		timer@f9020000 {
@@ -161,40 +158,6 @@ frame@f9028000 {
 			};
 		};
 
-		restart@fc4ab000 {
-			compatible = "qcom,pshold";
-			reg = <0xfc4ab000 0x4>;
-		};
-
-		msmgpio: pinctrl@fd510000 {
-			compatible = "qcom,msm8994-pinctrl";
-			reg = <0xfd510000 0x4000>;
-			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-controller;
-			gpio-ranges = <&msmgpio 0 0 146>;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-		};
-
-		blsp1_uart2: serial@f991e000 {
-			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
-			reg = <0xf991e000 0x1000>;
-			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_LOW>;
-			status = "disabled";
-			clock-names = "core", "iface";
-			clocks = <&clock_gcc GCC_BLSP1_UART2_APPS_CLK>,
-				<&clock_gcc GCC_BLSP1_AHB_CLK>;
-		};
-
-		clock_gcc: clock-controller@fc400000 {
-			compatible = "qcom,gcc-msm8994";
-			#clock-cells = <1>;
-			#reset-cells = <1>;
-			#power-domain-cells = <1>;
-			reg = <0xfc400000 0x2000>;
-		};
-
 		sdhci1: mmc@f9824900 {
 			compatible = "qcom,sdhci-msm-v4";
 			reg = <0xf9824900 0x1a0>, <0xf9824000 0x800>;
@@ -204,8 +167,8 @@ sdhci1: mmc@f9824900 {
 					<GIC_SPI 138 IRQ_TYPE_NONE>;
 			interrupt-names = "hc_irq", "pwr_irq";
 
-			clocks = <&clock_gcc GCC_SDCC1_APPS_CLK>,
-				<&clock_gcc GCC_SDCC1_AHB_CLK>;
+			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
+				<&gcc GCC_SDCC1_AHB_CLK>;
 			clock-names = "core", "iface";
 
 			pinctrl-names = "default", "sleep";
@@ -220,32 +183,141 @@ sdhci1: mmc@f9824900 {
 			status = "okay";
 		};
 
+		blsp1_uart2: serial@f991e000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0xf991e000 0x1000>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_LOW>;
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
+				<&gcc GCC_BLSP1_AHB_CLK>;
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_uart2_default>;
+			pinctrl-1 = <&blsp1_uart2_sleep>;
+			status = "disabled";
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
 		rpm_msg_ram: memory@fc428000 {
 			compatible = "qcom,rpm-msg-ram";
 			reg = <0xfc428000 0x4000>;
 		};
 
+		restart@fc4ab000 {
+			compatible = "qcom,pshold";
+			reg = <0xfc4ab000 0x4>;
+		};
+
 		sfpb_mutex_regs: syscon@fd484000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			compatible = "syscon";
 			reg = <0xfd484000 0x400>;
 		};
-	};
 
-	memory {
-		device_type = "memory";
-		reg = <0 0 0 0>; // bootloader will update
-	};
+		tlmm: pinctrl@fd510000 {
+			compatible = "qcom,msm8994-pinctrl";
+			reg = <0xfd510000 0x4000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			gpio-ranges = <&tlmm 0 0 146>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 
-	reserved-memory {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
+			blsp1_uart2_default: blsp1-uart2-default {
+				function = "blsp_uart2";
+				pins = "gpio4", "gpio5";
+				drive-strength = <16>;
+				bias-disable;
+			};
 
-		smem_region: smem@6a00000 {
-			reg = <0x0 0x6a00000 0x0 0x200000>;
-			no-map;
+			blsp1_uart2_sleep: blsp1-uart2-sleep {
+				function = "gpio";
+				pins = "gpio4", "gpio5";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			sdc1_clk_on: clk-on {
+				pins = "sdc1_clk";
+				bias-disable;
+				drive-strength = <6>;
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
+				drive-strength = <6>;
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
+				drive-strength = <6>;
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
+
+			i2c2_default: i2c2-default {
+				function = "blsp_i2c2";
+				pins = "gpio6", "gpio7";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			i2c2_sleep: i2c2-sleep {
+				function = "gpio";
+				pins = "gpio6", "gpio7";
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
 		};
 	};
 
@@ -264,6 +336,24 @@ rpm_requests: rpm-requests {
 			};
 		};
 	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 4 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		status = "okay";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
-#include "msm8992-pins.dtsi"
-- 
2.27.0

