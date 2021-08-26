Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAB83F8885
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 15:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242573AbhHZNQ6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 09:16:58 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:31855 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242503AbhHZNQ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 09:16:58 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 26 Aug 2021 06:16:11 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 Aug 2021 06:16:09 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg02-blr.qualcomm.com with ESMTP; 26 Aug 2021 18:45:47 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id D2D8321288; Thu, 26 Aug 2021 18:45:47 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V6 4/7] arm64: dts: sc7280: Update QUPv3 UART5 DT node
Date:   Thu, 26 Aug 2021 18:45:28 +0530
Message-Id: <1629983731-10595-5-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629983731-10595-1-git-send-email-rajpat@codeaurora.org>
References: <1629983731-10595-1-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Roja Rani Yarubandi <rojay@codeaurora.org>

Update the compatible string as "qcom,geni-uart".
Add interconnects and power-domains. Split the pinctrl
functions and correct the gpio pins.

split the pinctrl functions to match with SoC dt

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 19 ++++++++-----------
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 30 +++++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index c41c2d0..53993b3 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -254,6 +254,7 @@
 };
 
 &uart5 {
+	compatible = "qcom,geni-debug-uart";
 	status = "okay";
 };
 
@@ -311,18 +312,14 @@
 	bias-pull-up;
 };
 
-&qup_uart5_default {
-	tx {
-		pins = "gpio46";
-		drive-strength = <2>;
-		bias-disable;
-	};
+&qup_uart5_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
 
-	rx {
-		pins = "gpio47";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
+&qup_uart5_rx {
+	drive-strength = <2>;
+	bias-pull-up;
 };
 
 &sdc1_on {
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index da3cf19..a3c11b0 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -861,13 +861,18 @@
 			};
 
 			uart5: serial@994000 {
-				compatible = "qcom,geni-debug-uart";
+				compatible = "qcom,geni-uart";
 				reg = <0 0x00994000 0 0x4000>;
 				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
 				clock-names = "se";
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_uart5_default>;
+				pinctrl-0 = <&qup_uart5_cts>, <&qup_uart5_rts>, <&qup_uart5_tx>, <&qup_uart5_rx>;
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
 
@@ -2255,9 +2260,24 @@
 				function = "qup04";
 			};
 
-			qup_uart5_default: qup-uart5-default {
-				pins = "gpio46", "gpio47";
-				function = "qup13";
+			qup_uart5_cts: qup-uart5-cts {
+				pins = "gpio20";
+				function = "qup05";
+			};
+
+			qup_uart5_rts: qup-uart5-rts {
+				pins = "gpio21";
+				function = "qup05";
+			};
+
+			qup_uart5_tx: qup-uart5-tx {
+				pins = "gpio22";
+				function = "qup05";
+			};
+
+			qup_uart5_rx: qup-uart5-rx {
+				pins = "gpio23";
+				function = "qup05";
 			};
 
 			qup_uart6_cts: qup-uart6-cts {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

