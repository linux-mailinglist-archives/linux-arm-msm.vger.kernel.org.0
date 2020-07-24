Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DED922BCA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 05:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgGXD6r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 23:58:47 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:62169 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726493AbgGXD6q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 23:58:46 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 23 Jul 2020 20:58:44 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 23 Jul 2020 20:58:43 -0700
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Jul 2020 09:28:22 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id D9B8B4352; Fri, 24 Jul 2020 09:28:20 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        gregkh@linuxfoundation.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, akashast@codeaurora.org,
        rojay@codeaurora.org, msavaliy@qti.qualcomm.com,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 1/3] arm64: dts: sc7180: Add wakeup support over UART RX
Date:   Fri, 24 Jul 2020 09:28:00 +0530
Message-Id: <1595563082-2353-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
References: <1595563082-2353-1-git-send-email-skakit@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the necessary pinctrl and interrupts to make UART
wakeup capable.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V2:
 - As per Matthias's comment added wakeup support for all the UARTs
   of SC7180.

 arch/arm64/boot/dts/qcom/sc7180.dtsi | 98 ++++++++++++++++++++++++++++++------
 1 file changed, 84 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 16df08d..044a4d0 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -787,9 +787,11 @@
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
@@ -839,9 +841,11 @@
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
@@ -925,9 +929,11 @@
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
@@ -1011,9 +1017,11 @@
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
@@ -1078,9 +1086,11 @@
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
@@ -1250,9 +1260,11 @@
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
@@ -1302,9 +1314,11 @@
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
@@ -1632,6 +1646,14 @@
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
@@ -1640,6 +1662,14 @@
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
@@ -1655,6 +1685,14 @@
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
@@ -1670,6 +1708,14 @@
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
@@ -1678,6 +1724,14 @@
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
@@ -1707,6 +1761,14 @@
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
@@ -1715,6 +1777,14 @@
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

