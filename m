Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6244131DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 12:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbhIUKlX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Sep 2021 06:41:23 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:33886 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbhIUKlP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Sep 2021 06:41:15 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 21 Sep 2021 03:39:46 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 21 Sep 2021 03:39:45 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg01-blr.qualcomm.com with ESMTP; 21 Sep 2021 16:09:23 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id 030FB215F2; Tue, 21 Sep 2021 16:09:21 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, sboyd@kernel.org, mka@chromium.org,
        dianders@chromium.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V9 5/8] arm64: dts: sc7280: Update QUPv3 UART5 DT node
Date:   Tue, 21 Sep 2021 16:09:03 +0530
Message-Id: <1632220746-25943-6-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632220746-25943-1-git-send-email-rajpat@codeaurora.org>
References: <1632220746-25943-1-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Roja Rani Yarubandi <rojay@codeaurora.org>

Uart5 is treated as dedicated debug uart.Change the
compatible as "qcom,geni-uart" in SoC DT to make it generic
and later update it as "qcom,geni-debug-uart" in sc7280-idp
Add interconnects and power-domains. Split the pinctrl
functions and correct the gpio pins.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in V9:
 - No changes

Changes in V8:
 - No changes

Changes in V7:
 - As per Matthias comments,
   update commit message regarding UART5 functionality

Changes in V6:
 - As per Matthias' comments,
   Squashed "Update QUPv3 UART5 DT node" and "Configure debug uart for sc7280-idp"


 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi | 19 ++++++++-----------
 arch/arm64/boot/dts/qcom/sc7280.dtsi     | 30 +++++++++++++++++++++++++-----
 2 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 37b8444..cf82301 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -258,6 +258,7 @@
 };
 
 &uart5 {
+	compatible = "qcom,geni-debug-uart";
 	status = "okay";
 };
 
@@ -315,18 +316,14 @@
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
index b65c5da..e1c827c 100644
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
 
@@ -2254,9 +2259,24 @@
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

