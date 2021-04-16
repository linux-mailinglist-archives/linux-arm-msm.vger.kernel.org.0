Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA767361E00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 12:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239255AbhDPKc6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 06:32:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:32916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238766AbhDPKc5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 06:32:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EF08610CD;
        Fri, 16 Apr 2021 10:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618569153;
        bh=rKJPTHNHJSfN1WDoC8GtP61RFQ1QXszCQcLk2GuDacM=;
        h=From:To:Cc:Subject:Date:From;
        b=k1z2OiPwWjup5o7rxfusmwGWrQ8+NbBVV/Sclgdh7GoUKLJdbi6RNLuOAyg5ing99
         2SefYgK3B6bW+tLujXUKZBscGIa8wCkekcQyAil9+bfvT6dUNtB0rlYhpuvzi93aNz
         wun5jetZeejirdD1ZRALqkElwyJkT3ACny4wOlhwLNiQ4wBgmJBpt31wp0j/so0srE
         fhNcg2Tt+ZPahvM+x+ORFtc4o5NgUkIL2D69gfODY6VUhFJJ4cm5s5qu+/9jV67xN8
         9xL15eDKHE69X9nL+5umjfaooYEzgQ+Ukdif+OsJKmkuoQo0N5JicCoSIhg1Juh5Rb
         /w9LS67DiyBmg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Caleb Connolly <caleb@connolly.tech>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: [PATCH v3] arm64: boot: dts: qcom: sm8150: add SPI nodes
Date:   Fri, 16 Apr 2021 13:32:24 +0300
Message-Id: <20210416103225.1872145-1-balbi@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Felipe Balbi <felipe.balbi@microsoft.com>

Add missing SPI nodes for SM8150.

Signed-off-by: Felipe Balbi <felipe.balbi@microsoft.com>
---

changes since v2:
	- switch to new pinctrl format

Changes since v1:

	- avoid modifying drive strength on i2c. No functional
          changes, just keeping 0x02 instead of 2

 arch/arm64/boot/dts/qcom/sm8150.dtsi | 439 +++++++++++++++++++++++++++
 1 file changed, 439 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 7207a3689d9d..c563f381a138 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -602,6 +602,21 @@ i2c0: i2c@880000 {
 				status = "disabled";
 			};
 
+			spi0: spi@880000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x880000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi0_default>;
+				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c1: i2c@884000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00884000 0 0x4000>;
@@ -615,6 +630,21 @@ i2c1: i2c@884000 {
 				status = "disabled";
 			};
 
+			spi1: spi@884000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x884000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi1_default>;
+				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c2: i2c@888000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00888000 0 0x4000>;
@@ -628,6 +658,21 @@ i2c2: i2c@888000 {
 				status = "disabled";
 			};
 
+			spi2: spi@888000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x888000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi2_default>;
+				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c3: i2c@88c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x0088c000 0 0x4000>;
@@ -641,6 +686,21 @@ i2c3: i2c@88c000 {
 				status = "disabled";
 			};
 
+			spi3: spi@88c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x88c000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi3_default>;
+				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c4: i2c@890000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00890000 0 0x4000>;
@@ -654,6 +714,21 @@ i2c4: i2c@890000 {
 				status = "disabled";
 			};
 
+			spi4: spi@890000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x890000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi4_default>;
+				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c5: i2c@894000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00894000 0 0x4000>;
@@ -667,6 +742,21 @@ i2c5: i2c@894000 {
 				status = "disabled";
 			};
 
+			spi5: spi@894000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x894000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi5_default>;
+				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c6: i2c@898000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00898000 0 0x4000>;
@@ -680,6 +770,21 @@ i2c6: i2c@898000 {
 				status = "disabled";
 			};
 
+			spi6: spi@898000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x898000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi6_default>;
+				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c7: i2c@89c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x0089c000 0 0x4000>;
@@ -693,6 +798,20 @@ i2c7: i2c@89c000 {
 				status = "disabled";
 			};
 
+			spi7: spi@89c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x89c000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi7_default>;
+				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		qupv3_id_1: geniqup@ac0000 {
@@ -720,6 +839,21 @@ i2c8: i2c@a80000 {
 				status = "disabled";
 			};
 
+			spi8: spi@a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0xa80000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi8_default>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c9: i2c@a84000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00a84000 0 0x4000>;
@@ -733,6 +867,21 @@ i2c9: i2c@a84000 {
 				status = "disabled";
 			};
 
+			spi9: spi@a84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0xa84000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi9_default>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c10: i2c@a88000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00a88000 0 0x4000>;
@@ -746,6 +895,21 @@ i2c10: i2c@a88000 {
 				status = "disabled";
 			};
 
+			spi10: spi@a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0xa88000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi10_default>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c11: i2c@a8c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00a8c000 0 0x4000>;
@@ -759,6 +923,21 @@ i2c11: i2c@a8c000 {
 				status = "disabled";
 			};
 
+			spi11: spi@a8c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0xa8c000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi11_default>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			uart2: serial@a90000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0x0 0x00a90000 0x0 0x4000>;
@@ -781,6 +960,21 @@ i2c12: i2c@a90000 {
 				status = "disabled";
 			};
 
+			spi12: spi@a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0xa90000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi12_default>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c16: i2c@94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x0094000 0 0x4000>;
@@ -793,6 +987,21 @@ i2c16: i2c@94000 {
 				#size-cells = <0>;
 				status = "disabled";
 			};
+
+			spi16: spi@a94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0xa94000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi16_default>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		qupv3_id_2: geniqup@cc0000 {
@@ -821,6 +1030,21 @@ i2c17: i2c@c80000 {
 				status = "disabled";
 			};
 
+			spi17: spi@c80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0xc80000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi17_default>;
+				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c18: i2c@c84000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00c84000 0 0x4000>;
@@ -834,6 +1058,21 @@ i2c18: i2c@c84000 {
 				status = "disabled";
 			};
 
+			spi18: spi@c84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0xc84000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi18_default>;
+				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c19: i2c@c88000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00c88000 0 0x4000>;
@@ -847,6 +1086,21 @@ i2c19: i2c@c88000 {
 				status = "disabled";
 			};
 
+			spi19: spi@c88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0xc88000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi19_default>;
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c13: i2c@c8c000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00c8c000 0 0x4000>;
@@ -860,6 +1114,21 @@ i2c13: i2c@c8c000 {
 				status = "disabled";
 			};
 
+			spi13: spi@c8c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0xc8c000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi13_default>;
+				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c14: i2c@c90000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00c90000 0 0x4000>;
@@ -873,6 +1142,21 @@ i2c14: i2c@c90000 {
 				status = "disabled";
 			};
 
+			spi14: spi@c90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0xc90000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi14_default>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+
 			i2c15: i2c@c94000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0 0x00c94000 0 0x4000>;
@@ -885,6 +1169,21 @@ i2c15: i2c@c94000 {
 				#size-cells = <0>;
 				status = "disabled";
 			};
+
+			spi15: spi@c94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0xc94000 0 0x4000>;
+				reg-names = "se";
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi15_default>;
+				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
+				spi-max-frequency = <50000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 
 		config_noc: interconnect@1500000 {
@@ -1222,6 +1521,13 @@ config {
 				};
 			};
 
+			qup_spi0_default: qup-spi0-default {
+				pins = "gpio0", "gpio1", "gpio2", "gpio3";
+				function = "qup0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c1_default: qup-i2c1-default {
 				mux {
 					pins = "gpio114", "gpio115";
@@ -1235,6 +1541,13 @@ config {
 				};
 			};
 
+			qup_spi1_default: qup-spi1-default {
+				pins = "gpio114", "gpio115", "gpio116", "gpio117";
+				function = "qup1";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c2_default: qup-i2c2-default {
 				mux {
 					pins = "gpio126", "gpio127";
@@ -1248,6 +1561,13 @@ config {
 				};
 			};
 
+			qup_spi2_default: qup-spi2-default {
+				pins = "gpio126", "gpio127", "gpio128", "gpio129";
+				function = "qup2";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c3_default: qup-i2c3-default {
 				mux {
 					pins = "gpio144", "gpio145";
@@ -1261,6 +1581,13 @@ config {
 				};
 			};
 
+			qup_spi3_default: qup-spi3-default {
+				pins = "gpio144", "gpio145", "gpio146", "gpio147";
+				function = "qup3";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c4_default: qup-i2c4-default {
 				mux {
 					pins = "gpio51", "gpio52";
@@ -1274,6 +1601,13 @@ config {
 				};
 			};
 
+			qup_spi4_default: qup-spi4-default {
+				pins = "gpio51", "gpio52", "gpio53", "gpio54";
+				function = "qup4";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c5_default: qup-i2c5-default {
 				mux {
 					pins = "gpio121", "gpio122";
@@ -1287,6 +1621,13 @@ config {
 				};
 			};
 
+			qup_spi5_default: qup-spi5-default {
+				pins = "gpio119", "gpio120", "gpio121", "gpio122";
+				function = "qup5";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c6_default: qup-i2c6-default {
 				mux {
 					pins = "gpio6", "gpio7";
@@ -1300,6 +1641,13 @@ config {
 				};
 			};
 
+			qup_spi6_default: qup-spi6_default {
+				pins = "gpio4", "gpio5", "gpio6", "gpio7";
+				function = "qup6";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c7_default: qup-i2c7-default {
 				mux {
 					pins = "gpio98", "gpio99";
@@ -1313,6 +1661,13 @@ config {
 				};
 			};
 
+			qup_spi7_default: qup-spi7_default {
+				pins = "gpio98", "gpio99", "gpio100", "gpio101";
+				function = "qup7";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c8_default: qup-i2c8-default {
 				mux {
 					pins = "gpio88", "gpio89";
@@ -1326,6 +1681,13 @@ config {
 				};
 			};
 
+			qup_spi8_default: qup-spi8-default {
+				pins = "gpio88", "gpio89", "gpio90", "gpio91";
+				function = "qup8";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c9_default: qup-i2c9-default {
 				mux {
 					pins = "gpio39", "gpio40";
@@ -1339,6 +1701,13 @@ config {
 				};
 			};
 
+			qup_spi9_default: qup-spi9-default {
+				pins = "gpio39", "gpio40", "gpio41", "gpio42";
+				function = "qup9";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c10_default: qup-i2c10-default {
 				mux {
 					pins = "gpio9", "gpio10";
@@ -1352,6 +1721,13 @@ config {
 				};
 			};
 
+			qup_spi10_default: qup-spi10-default {
+				pins = "gpio9", "gpio10", "gpio11", "gpio12";
+				function = "qup10";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c11_default: qup-i2c11-default {
 				mux {
 					pins = "gpio94", "gpio95";
@@ -1365,6 +1741,13 @@ config {
 				};
 			};
 
+			qup_spi11_default: qup-spi11-default {
+				pins = "gpio92", "gpio93", "gpio94", "gpio95";
+				function = "qup11";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c12_default: qup-i2c12-default {
 				mux {
 					pins = "gpio83", "gpio84";
@@ -1378,6 +1761,13 @@ config {
 				};
 			};
 
+			qup_spi12_default: qup-spi12-default {
+				pins = "gpio83", "gpio84", "gpio85", "gpio86";
+				function = "qup12";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c13_default: qup-i2c13-default {
 				mux {
 					pins = "gpio43", "gpio44";
@@ -1391,6 +1781,13 @@ config {
 				};
 			};
 
+			qup_spi13_default: qup-spi13-default {
+				pins = "gpio43", "gpio44", "gpio45", "gpio46";
+				function = "qup13";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c14_default: qup-i2c14-default {
 				mux {
 					pins = "gpio47", "gpio48";
@@ -1404,6 +1801,13 @@ config {
 				};
 			};
 
+			qup_spi14_default: qup-spi14-default {
+				pins = "gpio47", "gpio48", "gpio49", "gpio50";
+				function = "qup14";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c15_default: qup-i2c15-default {
 				mux {
 					pins = "gpio27", "gpio28";
@@ -1417,6 +1821,13 @@ config {
 				};
 			};
 
+			qup_spi15_default: qup-spi15-default {
+				pins = "gpio27", "gpio28", "gpio29", "gpio30";
+				function = "qup15";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c16_default: qup-i2c16-default {
 				mux {
 					pins = "gpio86", "gpio85";
@@ -1430,6 +1841,13 @@ config {
 				};
 			};
 
+			qup_spi16_default: qup-spi16-default {
+				pins = "gpio83", "gpio84", "gpio85", "gpio86";
+				function = "qup16";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c17_default: qup-i2c17-default {
 				mux {
 					pins = "gpio55", "gpio56";
@@ -1443,6 +1861,13 @@ config {
 				};
 			};
 
+			qup_spi17_default: qup-spi17-default {
+				pins = "gpio55", "gpio56", "gpio57", "gpio58";
+				function = "qup17";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c18_default: qup-i2c18-default {
 				mux {
 					pins = "gpio23", "gpio24";
@@ -1456,6 +1881,13 @@ config {
 				};
 			};
 
+			qup_spi18_default: qup-spi18-default {
+				pins = "gpio23", "gpio24", "gpio25", "gpio26";
+				function = "qup18";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c19_default: qup-i2c19-default {
 				mux {
 					pins = "gpio57", "gpio58";
@@ -1468,6 +1900,13 @@ config {
 					bias-disable;
 				};
 			};
+
+			qup_spi19_default: qup-spi19-default {
+				pins = "gpio55", "gpio56", "gpio57", "gpio58";
+				function = "qup19";
+				drive-strength = <6>;
+				bias-disable;
+			};
 		};
 
 		remoteproc_mpss: remoteproc@4080000 {
-- 
2.31.1

