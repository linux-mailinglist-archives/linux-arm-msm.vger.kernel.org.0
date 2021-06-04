Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01F4139BA55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 15:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230209AbhFDN5M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 09:57:12 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:40637 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhFDN5L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 09:57:11 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 04 Jun 2021 06:55:25 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Jun 2021 06:55:23 -0700
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Jun 2021 19:25:03 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 8AB3A3308; Fri,  4 Jun 2021 19:25:02 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH V3 1/3] arm64: dts: sc7280: Add QSPI node
Date:   Fri,  4 Jun 2021 19:24:37 +0530
Message-Id: <20210604135439.19119-2-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210604135439.19119-1-rojay@codeaurora.org>
References: <20210604135439.19119-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QSPI DT node for SC7280 SoC.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
Changes in V3:
 - Broken the huge V2 patch into 3 smaller patches.
   1. QSPI DT nodes
   2. QUP wrapper_0 DT nodes
   3. QUP wrapper_1 DT nodes

Changes in V2:
 - As per Doug's comments removed pinmux/pinconf subnodes.
 - As per Doug's comments split of SPI, UART nodes has been done.
 - Moved QSPI node before aps_smmu as per the order.

 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 29 ++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 61 +++++++++++++++++++++++++
 2 files changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 3900cfc09562..d0edffc15736 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -268,6 +268,22 @@ pmr735b_die_temp {
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
+
+		/* TODO: Increase frequency after testing */
+		spi-max-frequency = <25000000>;
+		spi-tx-bus-width = <2>;
+		spi-rx-bus-width = <2>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -278,6 +294,19 @@ &uart5 {
 
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
index 6c9d5eb93f93..3047ab802cd2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -1061,6 +1061,42 @@ apss_merge_funnel_in: endpoint {
 			};
 		};
 
+		qspi_opp_table: qspi-opp-table {
+			compatible = "operating-points-v2";
+
+			opp-75000000 {
+				opp-hz = /bits/ 64 <75000000>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+			};
+
+			opp-150000000 {
+				opp-hz = /bits/ 64 <150000000>;
+				required-opps = <&rpmhpd_opp_svs>;
+			};
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+		};
+
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
+		};
+
 		system-cache-controller@9200000 {
 			compatible = "qcom,sc7280-llcc";
 			reg = <0 0x09200000 0 0xd0000>, <0 0x09600000 0 0x50000>;
@@ -1186,6 +1222,31 @@ tlmm: pinctrl@f100000 {
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

