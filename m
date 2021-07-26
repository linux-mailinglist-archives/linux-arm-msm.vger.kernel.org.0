Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BAD13D5A89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 15:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234094AbhGZNCH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 09:02:07 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:52187 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234306AbhGZNBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 09:01:37 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 26 Jul 2021 06:42:06 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 Jul 2021 06:42:05 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg02-blr.qualcomm.com with ESMTP; 26 Jul 2021 19:11:36 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id C4B3F21255; Mon, 26 Jul 2021 19:11:34 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V4 1/4] arm64: dts: sc7280: Add QSPI node
Date:   Mon, 26 Jul 2021 19:10:44 +0530
Message-Id: <1627306847-25308-2-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Roja Rani Yarubandi <rojay@codeaurora.org>

Add QSPI DT node for SC7280 SoC.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
---
Changes in V4:
 - As per Stephen's comment updated spi-max-frequency to 37.5MHz, moved
   qspi_opp_table from /soc to / (root).
   
Changes in V3:
 - Broken the huge V2 patch into 3 smaller patches.
   1. QSPI DT nodes
   2. QUP wrapper_0 DT nodes
   3. QUP wrapper_1 DT nodes
   
Changes in V2:
 - As per Doug's comments removed pinmux/pinconf subnodes.
 - As per Doug's comments split of SPI, UART nodes has been done.
 - Moved QSPI node before aps_smmu as per the order.

 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 27 ++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 62 +++++++++++++++++++++++++++++++++
 2 files changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 73225e3..b0bfd8e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -269,6 +269,20 @@
 		};
 };
 
+&qspi {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_clk>, <&qspi_cs0>, <&qspi_data01>;
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <37500000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -346,6 +360,19 @@
 
 /* PINCTRL - additions to nodes defined in sc7280.dtsi */
 
+&qspi_cs0 {
+	bias-disable;
+};
+
+&qspi_clk {
+	bias-disable;
+};
+
+&qspi_data01 {
+	/* High-Z when no transfers; nice to park the lines */
+	bias-pull-up;
+};
+
 &qup_uart5_default {
 	tx {
 		pins = "gpio46";
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 5764c5b..ca6e36b 100644
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
@@ -1301,6 +1320,24 @@
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
@@ -1492,6 +1529,31 @@
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

