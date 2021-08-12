Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB7D63E9FA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Aug 2021 09:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234960AbhHLHnW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Aug 2021 03:43:22 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:30646 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234910AbhHLHnS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Aug 2021 03:43:18 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 12 Aug 2021 00:42:53 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Aug 2021 00:42:52 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg01-blr.qualcomm.com with ESMTP; 12 Aug 2021 13:12:19 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id 4AF0F21255; Thu, 12 Aug 2021 13:12:18 +0530 (IST)
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
Subject: [PATCH V5 1/7] arm64: dts: sc7280: Add QSPI node
Date:   Thu, 12 Aug 2021 13:11:12 +0530
Message-Id: <1628754078-29779-2-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
References: <1628754078-29779-1-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Roja Rani Yarubandi <rojay@codeaurora.org>

Add QSPI DT node and qspi_opp_table for SC7280 SoC.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 62 ++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 53a21d0..f8dd5ff 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -415,6 +415,25 @@
 		method = "smc";
 	};
 
+	qspi_opp_table: qspi-opp-table {
+		compatible = "operating-points-v2";
+
+		opp-75000000 {
+			opp-hz = /bits/ 64 <75000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-150000000 {
+			opp-hz = /bits/ 64 <150000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+
 	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -1318,6 +1337,24 @@
 			};
 		};
 
+		qspi: spi@88dc000 {
+			compatible = "qcom,qspi-v1";
+			reg = <0 0x088dc000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+				 <&gcc GCC_QSPI_CORE_CLK>;
+			clock-names = "iface", "core";
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0
+					&cnoc2 SLAVE_QSPI_0 0>;
+			interconnect-names = "qspi-config";
+			power-domains = <&rpmhpd SC7280_CX>;
+			operating-points-v2 = <&qspi_opp_table>;
+			status = "disabled";
+
+		};
+
 		dc_noc: interconnect@90e0000 {
 			reg = <0 0x090e0000 0 0x5080>;
 			compatible = "qcom,sc7280-dc-noc";
@@ -1513,6 +1550,31 @@
 			gpio-ranges = <&tlmm 0 0 175>;
 			wakeup-parent = <&pdc>;
 
+			qspi_clk: qspi-clk {
+				pins = "gpio14";
+				function = "qspi_clk";
+			};
+
+			qspi_cs0: qspi-cs0 {
+				pins = "gpio15";
+				function = "qspi_cs";
+			};
+
+			qspi_cs1: qspi-cs1 {
+				pins = "gpio19";
+				function = "qspi_cs";
+			};
+
+			qspi_data01: qspi-data01 {
+				pins = "gpio12", "gpio13";
+				function = "qspi_data";
+			};
+
+			qspi_data12: qspi-data12 {
+				pins = "gpio16", "gpio17";
+				function = "qspi_data";
+			};
+
 			qup_uart5_default: qup-uart5-default {
 				pins = "gpio46", "gpio47";
 				function = "qup13";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

