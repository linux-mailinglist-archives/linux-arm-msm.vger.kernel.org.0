Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 874313E9F98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 09:42:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234880AbhHLHnP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 03:43:15 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:34292 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234862AbhHLHnO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 03:43:14 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 12 Aug 2021 00:42:50 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Aug 2021 00:42:48 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg01-blr.qualcomm.com with ESMTP; 12 Aug 2021 13:12:19 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id 8DABA21507; Thu, 12 Aug 2021 13:12:18 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        msavaliy@qti.qualcomm.com, skakit@codeaurora.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V5 4/7] arm64: dts: sc7280: Update QUPv3 UART5 DT node
Date:   Thu, 12 Aug 2021 13:11:15 +0530
Message-Id: <1628754078-29779-5-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
References: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Roja Rani Yarubandi <rojay@codeaurora.org>

Update the compatible string as "qcom,geni-uart".
Add interconnects and power-domains. Split the pinctrl
functions and correct the gpio pins.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index e461395..2dc7e8c 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -861,13 +861,18 @@
 			};
 
 			uart5: serial@994000 {
-				compatible = "qcom,geni-debug-uart";
+				compatible = "qcom,geni-uart";
 				reg = <0 0x00994000 0 0x4000>;
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

