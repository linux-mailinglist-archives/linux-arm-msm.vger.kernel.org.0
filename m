Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C802E3D5A93
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 15:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234390AbhGZNCV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 09:02:21 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:1859 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234330AbhGZNBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 09:01:41 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 26 Jul 2021 06:42:09 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 Jul 2021 06:42:07 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg02-blr.qualcomm.com with ESMTP; 26 Jul 2021 19:11:39 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id CD9D021255; Mon, 26 Jul 2021 19:11:38 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V4 3/4] arm64: dts: sc7280: Update QUPv3 Debug UART DT node
Date:   Mon, 26 Jul 2021 19:10:46 +0530
Message-Id: <1627306847-25308-4-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Roja Rani Yarubandi <rojay@codeaurora.org>

Update QUPv3 Debug UART DT node with the interconnect names and
functions for SC7280 SoC.

Split the Debug UART pin control functions.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
---
Changes in V4:
 - As per Bjorn's comment, posting this debug-uart node update
   as seperate patch

 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 18 +++++++-----------
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 28 ++++++++++++++++++++++++----
 2 files changed, 31 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index f63cf51..a50c9e5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -383,18 +383,14 @@
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
index 455e58f..951818f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -853,8 +853,13 @@
 				clock-names = "se";
 				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
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
 
@@ -2234,9 +2239,24 @@
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

