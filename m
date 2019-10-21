Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F37B3DE4E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 08:56:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfJUG4N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 02:56:13 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34830 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfJUG4M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 02:56:12 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4CF0A6076A; Mon, 21 Oct 2019 06:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571640971;
        bh=IC1OxMnAN5HXXH41kmB97JRZmkHq7ikb9+EBNXDKQdM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EW+RXNxCHOEpIggiDcQ8vMJbSe8//XLGp2wfWtLvJUZqfdd0gY7zICxEiVE68+fvl
         yZ4XBr1ZapyHdY//3t3UhqIC5C6K4Fcdo695fwfi70z+1dBfnc/2F+3Y+yynNMvpaX
         SLuCQpnDhFm05K9lGHYvLWRaDuoqhf9qL/c7rAmE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3CB6860610;
        Mon, 21 Oct 2019 06:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571640969;
        bh=IC1OxMnAN5HXXH41kmB97JRZmkHq7ikb9+EBNXDKQdM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PDiCu0KEkLxuM33J4IQjIkDfvO5wUAz5u/I4MWq/BBvaGxQY0NhPYyd+F459j8Ojb
         TfY1l2gqzNsOotIxBvj1ujisJUBXW6C24hbiFGSSzTQ8GxW8Uf6aQz0/CrB997WebC
         /YdqmomUm7cc7pm58k7cnnD85YmbJWhSyOXtfZeE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3CB6860610
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 02/13] arm64: dts: sc7180: Add minimal dts/dtsi files for SC7180 soc
Date:   Mon, 21 Oct 2019 12:25:11 +0530
Message-Id: <20191021065522.24511-3-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021065522.24511-1-rnayak@codeaurora.org>
References: <20191021065522.24511-1-rnayak@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add skeletal sc7180 SoC dtsi and idp board dts files.

Co-developed-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Taniya Das <tdas@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
v2:
* Sorted the nodes in alphabetical order
* Dropped the bi_tcxo/bi_tcxo_ao nodes

 arch/arm64/boot/dts/qcom/Makefile       |   1 +
 arch/arm64/boot/dts/qcom/sc7180-idp.dts |  47 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 300 ++++++++++++++++++++++++
 3 files changed, 348 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-idp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180.dtsi

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6498a1ec893f..7a5c2f7fe37f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-lenovo-miix-630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
new file mode 100644
index 000000000000..f8b7e098f5b4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * SC7180 IDP board device tree source
+ *
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sc7180.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SC7180 IDP";
+	compatible = "qcom,sc7180-idp";
+
+	aliases {
+		serial0 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+/* PINCTRL - additions to nodes defined in sc7180.dtsi */
+
+&qup_uart2_default {
+	pinconf-tx {
+		pins = "gpio44";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pinconf-rx {
+		pins = "gpio45";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
new file mode 100644
index 000000000000..82bf7cdce6b8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * SC7180 SoC device tree source
+ *
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#include <dt-bindings/clock/qcom,gcc-sc7180.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	interrupt-parent = <&intc>;
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	chosen { };
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			clock-output-names = "xo_board";
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			clock-output-names = "sleep_clk";
+			#clock-cells = <0>;
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		CPU0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+			L2_0: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+				L3_0: l3-cache {
+					compatible = "cache";
+				};
+			};
+		};
+
+		CPU1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+			next-level-cache = <&L2_100>;
+			L2_100: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x200>;
+			enable-method = "psci";
+			next-level-cache = <&L2_200>;
+			L2_200: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x300>;
+			enable-method = "psci";
+			next-level-cache = <&L2_300>;
+			L2_300: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x400>;
+			enable-method = "psci";
+			next-level-cache = <&L2_400>;
+			L2_400: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x500>;
+			enable-method = "psci";
+			next-level-cache = <&L2_500>;
+			L2_500: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x600>;
+			enable-method = "psci";
+			next-level-cache = <&L2_600>;
+			L2_600: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+
+		CPU7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,armv8";
+			reg = <0x0 0x700>;
+			enable-method = "psci";
+			next-level-cache = <&L2_700>;
+			L2_700: l2-cache {
+				compatible = "cache";
+				next-level-cache = <&L3_0>;
+			};
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* We expect the bootloader to fill in the size */
+		reg = <0 0x80000000 0 0>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	soc: soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0 0 0 0x10 0>;
+		dma-ranges = <0 0 0 0  0x10 0>;
+		compatible = "simple-bus";
+
+		gcc: clock-controller@100000 {
+			compatible = "qcom,gcc-sc7180";
+			reg = <0 0x00100000 0 0x1f0000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		qupv3_id_0: geniqup@ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0 0x00ac0000 0 0x6000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			uart2: serial@a88000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0 0x00a88000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart2_default>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
+
+		tlmm: pinctrl@3500000 {
+			compatible = "qcom,sc7180-pinctrl";
+			reg = <0 0x03500000 0 0x300000>,
+			      <0 0x03900000 0 0x300000>,
+			      <0 0x03d00000 0 0x300000>;
+			reg-names = "west", "north", "south";
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 120>;
+
+			qup_uart2_default: qup-uart2-default {
+				pinmux {
+					pins = "gpio44", "gpio45";
+					function = "qup12";
+				};
+			};
+		};
+
+		intc: interrupt-controller@17a00000 {
+			compatible = "arm,gic-v3";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			#interrupt-cells = <3>;
+			interrupt-controller;
+			reg = <0 0x17a00000 0 0x10000>,     /* GICD */
+			      <0 0x17a60000 0 0x100000>;    /* GICR * 8 */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+
+			gic-its@17a40000 {
+				compatible = "arm,gic-v3-its";
+				msi-controller;
+				#msi-cells = <1>;
+				reg = <0 0x17a40000 0 0x20000>;
+				status = "disabled";
+			};
+		};
+
+		timer@17c20000{
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			compatible = "arm,armv7-timer-mem";
+			reg = <0 0x17c20000 0 0x1000>;
+
+			frame@17c21000 {
+				frame-number = <0>;
+				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0 0x17c21000 0 0x1000>,
+				      <0 0x17c22000 0 0x1000>;
+			};
+
+			frame@17c23000 {
+				frame-number = <1>;
+				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0 0x17c23000 0 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c25000 {
+				frame-number = <2>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0 0x17c25000 0 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c27000 {
+				frame-number = <3>;
+				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0 0x17c27000 0 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c29000 {
+				frame-number = <4>;
+				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0 0x17c29000 0 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2b000 {
+				frame-number = <5>;
+				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0 0x17c2b000 0 0x1000>;
+				status = "disabled";
+			};
+
+			frame@17c2d000 {
+				frame-number = <6>;
+				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+				reg = <0 0x17c2d000 0 0x1000>;
+				status = "disabled";
+			};
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 1 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 2 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 3 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

