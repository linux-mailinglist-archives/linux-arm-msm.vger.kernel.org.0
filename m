Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B48EE25C441
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 17:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729024AbgICPH2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 11:07:28 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:10653 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729469AbgICPFi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 11:05:38 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 03 Sep 2020 08:05:31 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 03 Sep 2020 08:05:29 -0700
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 03 Sep 2020 20:35:05 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 9D197D83; Thu,  3 Sep 2020 20:35:04 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>, gregkh@linuxfoundation.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V4 1/4] arm64: dts: sc7180: Add wakeup support over UART RX
Date:   Thu,  3 Sep 2020 20:34:55 +0530
Message-Id: <1599145498-20707-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599145498-20707-1-git-send-email-skakit@codeaurora.org>
References: <1599145498-20707-1-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the necessary pinctrl and interrupts to make UART wakeup capable.

If QUP function is selected in sleep state, UART RTS/RFR is pulled high
during suspend and BT SoC not able to send wakeup bytes. So, configure
GPIO mode in sleep state to keep it low during suspend.

Signed-off-by: satya priya <skakit@codeaurora.org>
Reviewed-by: Akash Asthana <akashast@codeaurora.org>
---
Changes in V2:
 - As per Matthias's comment added wakeup support for all the UARTs
   of SC7180.

Changes in V3:
 - No change.

Changes in V4:
 - As per Matthias's comment, added the reason for configuring GPIO
   mode for sleep state in commit text.

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 98 ++++++++++++++++++++++++++++++------
 1 file changed, 84 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d46b383..855b13e 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -793,9 +793,11 @@
 				reg = <0 0x00880000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
-				pinctrl-names = "default";
+				pinctrl-names = "default", "sleep";
 				pinctrl-0 = <&qup_uart0_default>;
-				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-1 = <&qup_uart0_sleep>;
+				interrupts-extended = <&intc GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>,
+							<&tlmm 37 IRQ_TYPE_EDGE_FALLING>;
 				power-domains = <&rpmhpd SC7180_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
@@ -845,9 +847,11 @@
 				reg = <0 0x00884000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
-				pinctrl-names = "default";
+				pinctrl-names = "default", "sleep";
 				pinctrl-0 = <&qup_uart1_default>;
-				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-1 = <&qup_uart1_sleep>;
+				interrupts-extended = <&intc GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
+							<&tlmm 3 IRQ_TYPE_EDGE_FALLING>;
 				power-domains = <&rpmhpd SC7180_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
@@ -931,9 +935,11 @@
 				reg = <0 0x0088c000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
-				pinctrl-names = "default";
+				pinctrl-names = "default", "sleep";
 				pinctrl-0 = <&qup_uart3_default>;
-				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-1 = <&qup_uart3_sleep>;
+				interrupts-extended = <&intc GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
+							<&tlmm 41 IRQ_TYPE_EDGE_FALLING>;
 				power-domains = <&rpmhpd SC7180_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
@@ -1017,9 +1023,11 @@
 				reg = <0 0x00894000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
-				pinctrl-names = "default";
+				pinctrl-names = "default", "sleep";
 				pinctrl-0 = <&qup_uart5_default>;
-				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-1 = <&qup_uart5_sleep>;
+				interrupts-extended = <&intc GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>,
+							<&tlmm 28 IRQ_TYPE_EDGE_FALLING>;
 				power-domains = <&rpmhpd SC7180_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_0 &qup_virt SLAVE_QUP_CORE_0>,
@@ -1084,9 +1092,11 @@
 				reg = <0 0x00a80000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
-				pinctrl-names = "default";
+				pinctrl-names = "default", "sleep";
 				pinctrl-0 = <&qup_uart6_default>;
-				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-1 = <&qup_uart6_sleep>;
+				interrupts-extended = <&intc GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+							<&tlmm 62 IRQ_TYPE_EDGE_FALLING>;
 				power-domains = <&rpmhpd SC7180_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
@@ -1256,9 +1266,11 @@
 				reg = <0 0x00a90000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
-				pinctrl-names = "default";
+				pinctrl-names = "default", "sleep";
 				pinctrl-0 = <&qup_uart10_default>;
-				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-1 = <&qup_uart10_sleep>;
+				interrupts-extended = <&intc GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+							<&tlmm 89 IRQ_TYPE_EDGE_FALLING>;
 				power-domains = <&rpmhpd SC7180_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
@@ -1308,9 +1320,11 @@
 				reg = <0 0x00a94000 0 0x4000>;
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
-				pinctrl-names = "default";
+				pinctrl-names = "default", "sleep";
 				pinctrl-0 = <&qup_uart11_default>;
-				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-1 = <&qup_uart11_sleep>;
+				interrupts-extended = <&intc GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
+							<&tlmm 56 IRQ_TYPE_EDGE_FALLING>;
 				power-domains = <&rpmhpd SC7180_CX>;
 				operating-points-v2 = <&qup_opp_table>;
 				interconnects = <&qup_virt MASTER_QUP_CORE_1 &qup_virt SLAVE_QUP_CORE_1>,
@@ -1638,6 +1652,14 @@
 				};
 			};
 
+			qup_uart0_sleep: qup-uart0-sleep {
+				pinmux {
+					pins = "gpio34", "gpio35",
+					       "gpio36", "gpio37";
+					function = "gpio";
+				};
+			};
+
 			qup_uart1_default: qup-uart1-default {
 				pinmux {
 					pins = "gpio0", "gpio1",
@@ -1646,6 +1668,14 @@
 				};
 			};
 
+			qup_uart1_sleep: qup-uart1-sleep {
+				pinmux {
+					pins = "gpio0", "gpio1",
+					       "gpio2", "gpio3";
+					function = "gpio";
+				};
+			};
+
 			qup_uart2_default: qup-uart2-default {
 				pinmux {
 					pins = "gpio15", "gpio16";
@@ -1661,6 +1691,14 @@
 				};
 			};
 
+			qup_uart3_sleep: qup-uart3-sleep {
+				pinmux {
+					pins = "gpio38", "gpio39",
+					       "gpio40", "gpio41";
+					function = "gpio";
+				};
+			};
+
 			qup_uart4_default: qup-uart4-default {
 				pinmux {
 					pins = "gpio115", "gpio116";
@@ -1676,6 +1714,14 @@
 				};
 			};
 
+			qup_uart5_sleep: qup-uart5-sleep {
+				pinmux {
+					pins = "gpio25", "gpio26",
+					       "gpio27", "gpio28";
+					function = "gpio";
+				};
+			};
+
 			qup_uart6_default: qup-uart6-default {
 				pinmux {
 					pins = "gpio59", "gpio60",
@@ -1684,6 +1730,14 @@
 				};
 			};
 
+			qup_uart6_sleep: qup-uart6-sleep {
+				pinmux {
+					pins = "gpio59", "gpio60",
+					       "gpio61", "gpio62";
+					function = "gpio";
+				};
+			};
+
 			qup_uart7_default: qup-uart7-default {
 				pinmux {
 					pins = "gpio6", "gpio7";
@@ -1713,6 +1767,14 @@
 				};
 			};
 
+			qup_uart10_sleep: qup-uart10-sleep {
+				pinmux {
+					pins = "gpio86", "gpio87",
+					       "gpio88", "gpio89";
+					function = "gpio";
+				};
+			};
+
 			qup_uart11_default: qup-uart11-default {
 				pinmux {
 					pins = "gpio53", "gpio54",
@@ -1721,6 +1783,14 @@
 				};
 			};
 
+			qup_uart11_sleep: qup-uart11-sleep {
+				pinmux {
+					pins = "gpio53", "gpio54",
+					       "gpio55", "gpio56";
+					function = "gpio";
+				};
+			};
+
 			sdc1_on: sdc1-on {
 				pinconf-clk {
 					pins = "sdc1_clk";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

