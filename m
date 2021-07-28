Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 159573D9872
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232554AbhG1W0H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:26:07 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:57527 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbhG1W0C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:26:02 -0400
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 51F1C1FA14;
        Thu, 29 Jul 2021 00:25:58 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/39] arm64: dts: qcom: sdm630: Fix TLMM node and pinctrl configuration
Date:   Thu, 29 Jul 2021 00:25:11 +0200
Message-Id: <20210728222542.54269-9-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Previous pinctrl configuration was wrong. Fix it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 212 ++++++++++++++++++---------
 1 file changed, 139 insertions(+), 73 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 35ed2e17f8b6..6f251e602996 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -626,14 +626,18 @@ tcsr_mutex_regs: syscon@1f40000 {
 			reg = <0x01f40000 0x20000>;
 		};
 
-		tlmm: pinctrl@3000000 {
+		tlmm: pinctrl@3100000 {
 			compatible = "qcom,sdm630-pinctrl";
-			reg = <0x03000000 0xc00000>;
+			reg = <0x03100000 0x400000>,
+				  <0x03500000 0x400000>,
+				  <0x03900000 0x400000>;
+			reg-names = "south", "center", "north";
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
-			#gpio-cells = <0x2>;
+			gpio-ranges = <&tlmm 0 0 114>;
+			#gpio-cells = <2>;
 			interrupt-controller;
-			#interrupt-cells = <0x2>;
+			#interrupt-cells = <2>;
 
 			blsp1_uart1_default: blsp1-uart1-default {
 				pins = "gpio0", "gpio1", "gpio2", "gpio3";
@@ -653,40 +657,48 @@ blsp1_uart2_default: blsp1-uart2-default {
 				bias-disable;
 			};
 
-			blsp2_uart1_tx_active: blsp2-uart1-tx-active {
-				pins = "gpio16";
-				drive-strength = <2>;
-				bias-disable;
-			};
-
-			blsp2_uart1_tx_sleep: blsp2-uart1-tx-sleep {
-				pins = "gpio16";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
+			blsp2_uart1_default: blsp2-uart1-active {
+				tx-rts {
+					pins = "gpio16", "gpio19";
+					function = "blsp_uart5";
+					drive-strength = <2>;
+					bias-disable;
+				};
 
-			blsp2_uart1_rxcts_active: blsp2-uart1-rxcts-active {
-				pins = "gpio17", "gpio18";
-				drive-strength = <2>;
-				bias-disable;
-			};
+				rx {
+					/*
+					 * Avoid garbage data while BT module
+					 * is powered off or not driving signal
+					 */
+					pins = "gpio17";
+					function = "blsp_uart5";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
 
-			blsp2_uart1_rxcts_sleep: blsp2-uart1-rxcts-sleep {
-				pins = "gpio17", "gpio18";
-				drive-strength = <2>;
-				bias-no-pull;
+				cts {
+					/* Match the pull of the BT module */
+					pins = "gpio18";
+					function = "blsp_uart5";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
 			};
 
-			blsp2_uart1_rfr_active: blsp2-uart1-rfr-active {
-				pins = "gpio19";
-				drive-strength = <2>;
-				bias-disable;
-			};
+			blsp2_uart1_sleep: blsp2-uart1-sleep {
+				tx {
+					pins = "gpio16";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
 
-			blsp2_uart1_rfr_sleep: blsp2-uart1-rfr-sleep {
-				pins = "gpio19";
-				drive-strength = <2>;
-				bias-no-pull;
+				rx-cts-rts {
+					pins = "gpio17", "gpio18", "gpio19";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-no-pull;
+				};
 			};
 
 			i2c1_default: i2c1-default {
@@ -785,50 +797,106 @@ i2c8_sleep: i2c8-sleep {
 				bias-pull-up;
 			};
 
-			sdc1_clk_on: sdc1-clk-on {
-				pins = "sdc1_clk";
-				bias-disable;
-				drive-strength = <16>;
-			};
+			sdc1_state_on: sdc1-on {
+				clk {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
 
-			sdc1_clk_off: sdc1-clk-off {
-				pins = "sdc1_clk";
-				bias-disable;
-				drive-strength = <2>;
-			};
+				cmd {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
 
-			sdc1_cmd_on: sdc1-cmd-on {
-				pins = "sdc1_cmd";
-				bias-pull-up;
-				drive-strength = <10>;
-			};
+				data {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
 
-			sdc1_cmd_off: sdc1-cmd-off {
-				pins = "sdc1_cmd";
-				bias-pull-up;
-				drive-strength = <2>;
+				rclk {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
 			};
 
-			sdc1_data_on: sdc1-data-on {
-				pins = "sdc1_data";
-				bias-pull-up;
-				drive-strength = <8>;
-			};
+			sdc1_state_off: sdc1-off {
+				clk {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
 
-			sdc1_data_off: sdc1-data-off {
-				pins = "sdc1_data";
-				bias-pull-up;
-				drive-strength = <2>;
+				cmd {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				rclk {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
 			};
 
-			sdc1_rclk_on: sdc1-rclk-on {
-				pins = "sdc1_rclk";
-				bias-pull-down;
+			sdc2_state_on: sdc2-on {
+				clk {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				sd-cd {
+					pins = "gpio54";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
 			};
 
-			sdc1_rclk_off: sdc1-rclk-off {
-				pins = "sdc1_rclk";
-				bias-pull-down;
+			sdc2_state_off: sdc2-off {
+				clk {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				sd-cd {
+					pins = "gpio54";
+					bias-disable;
+					drive-strength = <2>;
+				};
 			};
 		};
 
@@ -986,8 +1054,8 @@ sdhc_1: sdhci@c0c4000 {
 			clock-names = "core", "iface", "xo", "ice";
 
 			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&sdc1_clk_on &sdc1_cmd_on &sdc1_data_on &sdc1_rclk_on>;
-			pinctrl-1 = <&sdc1_clk_off &sdc1_cmd_off &sdc1_data_off &sdc1_rclk_off>;
+			pinctrl-0 = <&sdc1_state_on>;
+			pinctrl-1 = <&sdc1_state_off>;
 
 			bus-width = <8>;
 			non-removable;
@@ -1354,10 +1422,8 @@ blsp2_uart1: serial@c1af000 {
 			dmas = <&blsp2_dma 0>, <&blsp2_dma 1>;
 			dma-names = "tx", "rx";
 			pinctrl-names = "default", "sleep";
-			pinctrl-0 = <&blsp2_uart1_tx_active &blsp2_uart1_rxcts_active
-				&blsp2_uart1_rfr_active>;
-			pinctrl-1 = <&blsp2_uart1_tx_sleep &blsp2_uart1_rxcts_sleep
-				&blsp2_uart1_rfr_sleep>;
+			pinctrl-0 = <&blsp2_uart1_default>;
+			pinctrl-1 = <&blsp2_uart1_sleep>;
 			status = "disabled";
 		};
 
-- 
2.32.0

