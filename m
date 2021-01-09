Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B08262F01A5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 17:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbhAIQbk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 11:31:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbhAIQbj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 11:31:39 -0500
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CD39C0617A5
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Jan 2021 08:30:32 -0800 (PST)
Received: from localhost.localdomain (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id E473D3E8E7;
        Sat,  9 Jan 2021 17:30:29 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: qcom: msm8998: Add I2C pinctrl and fix BLSP2_I2C naming
Date:   Sat,  9 Jan 2021 17:29:57 +0100
Message-Id: <20210109163001.146867-4-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109163001.146867-1-konrad.dybcio@somainline.org>
References: <20210109163001.146867-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The BLSP2-connected interfaces started from 0 which is.. misleading
to say the least.. the clock names corresponding to these started
from 1, so let's align to that so as to reduce confusion.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 216 +++++++++++++++++++++++++-
 1 file changed, 210 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index eadac13ff975..c7d6dbd24f1e 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1177,6 +1177,174 @@ rfr {
 					bias-disable;
 				};
 			};
+
+			blsp1_i2c1_default: blsp1-i2c1-default {
+				pins = "gpio2", "gpio3";
+				function = "blsp_i2c1";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_i2c1_sleep: blsp1-i2c1-sleep {
+				pins = "gpio2", "gpio3";
+				function = "blsp_i2c1";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			blsp1_i2c2_default: blsp1-i2c2-default {
+				pins = "gpio32", "gpio33";
+				function = "blsp_i2c2";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_i2c2_sleep: blsp1-i2c2-sleep {
+				pins = "gpio32", "gpio33";
+				function = "blsp_i2c2";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			blsp1_i2c3_default: blsp1-i2c3-default {
+				pins = "gpio47", "gpio48";
+				function = "blsp_i2c3";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_i2c3_sleep: blsp1-i2c3-sleep {
+				pins = "gpio47", "gpio48";
+				function = "blsp_i2c3";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			blsp1_i2c4_default: blsp1-i2c4-default {
+				pins = "gpio10", "gpio11";
+				function = "blsp_i2c4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_i2c4_sleep: blsp1-i2c4-sleep {
+				pins = "gpio10", "gpio11";
+				function = "blsp_i2c4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			blsp1_i2c5_default: blsp1-i2c5-default {
+				pins = "gpio87", "gpio88";
+				function = "blsp_i2c5";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_i2c5_sleep: blsp1-i2c5-sleep {
+				pins = "gpio87", "gpio88";
+				function = "blsp_i2c5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			blsp1_i2c6_default: blsp1-i2c6-default {
+				pins = "gpio43", "gpio44";
+				function = "blsp_i2c6";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp1_i2c6_sleep: blsp1-i2c6-sleep {
+				pins = "gpio43", "gpio44";
+				function = "blsp_i2c6";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+			/* 6 interfaces per QUP, BLSP2 indexes are numbered (n)+6 */
+			blsp2_i2c1_default: blsp2-i2c1-default {
+				pins = "gpio55", "gpio56";
+				function = "blsp_i2c7";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp2_i2c1_sleep: blsp2-i2c1-sleep {
+				pins = "gpio55", "gpio56";
+				function = "blsp_i2c7";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			blsp2_i2c2_default: blsp2-i2c2-default {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c8";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp2_i2c2_sleep: blsp2-i2c2-sleep {
+				pins = "gpio6", "gpio7";
+				function = "blsp_i2c8";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			blsp2_i2c3_default: blsp2-i2c3-default {
+				pins = "gpio51", "gpio52";
+				function = "blsp_i2c9";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp2_i2c3_sleep: blsp2-i2c3-sleep {
+				pins = "gpio51", "gpio52";
+				function = "blsp_i2c9";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			blsp2_i2c4_default: blsp2-i2c4-default {
+				pins = "gpio67", "gpio68";
+				function = "blsp_i2c10";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp2_i2c4_sleep: blsp2-i2c4-sleep {
+				pins = "gpio67", "gpio68";
+				function = "blsp_i2c10";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			blsp2_i2c5_default: blsp2-i2c5-default {
+				pins = "gpio60", "gpio61";
+				function = "blsp_i2c11";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp2_i2c5_sleep: blsp2-i2c5-sleep {
+				pins = "gpio60", "gpio61";
+				function = "blsp_i2c11";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
+			blsp2_i2c6_default: blsp2-i2c6-default {
+				pins = "gpio83", "gpio84";
+				function = "blsp_i2c12";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			blsp2_i2c6_sleep: blsp2-i2c6-sleep {
+				pins = "gpio83", "gpio84";
+				function = "blsp_i2c12";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
 		};
 
 		remoteproc_mss: remoteproc@4080000 {
@@ -1895,6 +2063,9 @@ blsp1_i2c1: i2c@c175000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp1_dma 6>, <&blsp1_dma 7>;
 			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_i2c1_default>;
+			pinctrl-1 = <&blsp1_i2c1_sleep>;
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -1912,6 +2083,9 @@ blsp1_i2c2: i2c@c176000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp1_dma 8>, <&blsp1_dma 9>;
 			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_i2c2_default>;
+			pinctrl-1 = <&blsp1_i2c2_sleep>;
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -1929,6 +2103,9 @@ blsp1_i2c3: i2c@c177000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp1_dma 10>, <&blsp1_dma 11>;
 			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_i2c3_default>;
+			pinctrl-1 = <&blsp1_i2c3_sleep>;
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -1946,6 +2123,9 @@ blsp1_i2c4: i2c@c178000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp1_dma 12>, <&blsp1_dma 13>;
 			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_i2c4_default>;
+			pinctrl-1 = <&blsp1_i2c4_sleep>;
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -1963,6 +2143,9 @@ blsp1_i2c5: i2c@c179000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp1_dma 14>, <&blsp1_dma 15>;
 			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_i2c5_default>;
+			pinctrl-1 = <&blsp1_i2c5_sleep>;
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -1980,6 +2163,9 @@ blsp1_i2c6: i2c@c17a000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp1_dma 16>, <&blsp1_dma 17>;
 			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp1_i2c6_default>;
+			pinctrl-1 = <&blsp1_i2c6_sleep>;
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -2010,7 +2196,7 @@ blsp2_uart1: serial@c1b0000 {
 			status = "disabled";
 		};
 
-		blsp2_i2c0: i2c@c1b5000 {
+		blsp2_i2c1: i2c@c1b5000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x0c1b5000 0x600>;
 			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
@@ -2020,6 +2206,9 @@ blsp2_i2c0: i2c@c1b5000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp2_dma 6>, <&blsp2_dma 7>;
 			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_i2c1_default>;
+			pinctrl-1 = <&blsp2_i2c1_sleep>;
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -2027,7 +2216,7 @@ blsp2_i2c0: i2c@c1b5000 {
 			#size-cells = <0>;
 		};
 
-		blsp2_i2c1: i2c@c1b6000 {
+		blsp2_i2c2: i2c@c1b6000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x0c1b6000 0x600>;
 			interrupts = <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>;
@@ -2037,6 +2226,9 @@ blsp2_i2c1: i2c@c1b6000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp2_dma 8>, <&blsp2_dma 9>;
 			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_i2c2_default>;
+			pinctrl-1 = <&blsp2_i2c2_sleep>;
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -2044,7 +2236,7 @@ blsp2_i2c1: i2c@c1b6000 {
 			#size-cells = <0>;
 		};
 
-		blsp2_i2c2: i2c@c1b7000 {
+		blsp2_i2c3: i2c@c1b7000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x0c1b7000 0x600>;
 			interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
@@ -2054,6 +2246,9 @@ blsp2_i2c2: i2c@c1b7000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp2_dma 10>, <&blsp2_dma 11>;
 			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_i2c3_default>;
+			pinctrl-1 = <&blsp2_i2c3_sleep>;
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -2061,7 +2256,7 @@ blsp2_i2c2: i2c@c1b7000 {
 			#size-cells = <0>;
 		};
 
-		blsp2_i2c3: i2c@c1b8000 {
+		blsp2_i2c4: i2c@c1b8000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x0c1b8000 0x600>;
 			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
@@ -2071,6 +2266,9 @@ blsp2_i2c3: i2c@c1b8000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp2_dma 12>, <&blsp2_dma 13>;
 			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_i2c4_default>;
+			pinctrl-1 = <&blsp2_i2c4_sleep>;
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -2078,7 +2276,7 @@ blsp2_i2c3: i2c@c1b8000 {
 			#size-cells = <0>;
 		};
 
-		blsp2_i2c4: i2c@c1b9000 {
+		blsp2_i2c5: i2c@c1b9000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x0c1b9000 0x600>;
 			interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
@@ -2088,6 +2286,9 @@ blsp2_i2c4: i2c@c1b9000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp2_dma 14>, <&blsp2_dma 15>;
 			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_i2c5_default>;
+			pinctrl-1 = <&blsp2_i2c5_sleep>;
 			clock-frequency = <400000>;
 
 			status = "disabled";
@@ -2095,7 +2296,7 @@ blsp2_i2c4: i2c@c1b9000 {
 			#size-cells = <0>;
 		};
 
-		blsp2_i2c5: i2c@c1ba000 {
+		blsp2_i2c6: i2c@c1ba000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x0c1ba000 0x600>;
 			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
@@ -2105,6 +2306,9 @@ blsp2_i2c5: i2c@c1ba000 {
 			clock-names = "core", "iface";
 			dmas = <&blsp2_dma 16>, <&blsp2_dma 17>;
 			dma-names = "tx", "rx";
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&blsp2_i2c6_default>;
+			pinctrl-1 = <&blsp2_i2c6_sleep>;
 			clock-frequency = <400000>;
 
 			status = "disabled";
-- 
2.29.2

