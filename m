Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B49533D5A86
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 15:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234037AbhGZNCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 09:02:03 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:1859 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234027AbhGZNBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 09:01:37 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 26 Jul 2021 06:42:05 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 Jul 2021 06:42:03 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg02-blr.qualcomm.com with ESMTP; 26 Jul 2021 19:11:37 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id F387221255; Mon, 26 Jul 2021 19:11:36 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V4 2/4] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
Date:   Mon, 26 Jul 2021 19:10:45 +0530
Message-Id: <1627306847-25308-3-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Roja Rani Yarubandi <rojay@codeaurora.org>

Add QUPv3 wrapper_0 DT nodes for SC7280 SoC.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
---
Changes in V4:
 - As per Bjorn's comment, added QUP Wrapper_0 nodes
   other than debug-uart node
 - Dropped interconnect votes for wrapper_0 node

Changes in V3:
 - Broken the huge V2 patch into 3 smaller patches.
   1. QSPI DT nodes
   2. QUP wrapper_0 DT nodes
   3. QUP wrapper_1 DT nodes

Changes in V2:
 - As per Doug's comments removed pinmux/pinconf subnodes.
 - As per Doug's comments split of SPI, UART nodes has been done.
 - Moved QSPI node before aps_smmu as per the order.

 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  84 ++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 720 ++++++++++++++++++++++++++++++++
 2 files changed, 804 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index b0bfd8e..f63cf51 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -358,6 +358,16 @@
 	vdda18-supply = <&vreg_l1c_1p8>;
 };
 
+&uart7 {
+	status = "okay";
+
+	/delete-property/interrupts;
+	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
+				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
+	pinctrl-names = "default", "sleep";
+	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
+};
+
 /* PINCTRL - additions to nodes defined in sc7280.dtsi */
 
 &qspi_cs0 {
@@ -428,3 +438,77 @@
 		bias-pull-up;
 	};
 };
+&qup_uart7_cts {
+	/*
+	 * Configure a pull-down on CTS to match the pull of
+	 * the Bluetooth module.
+	 */
+	bias-pull-down;
+};
+
+&qup_uart7_rts {
+	/* We'll drive RTS, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart7_tx {
+	/* We'll drive TX, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart7_rx {
+	/*
+	 * Configure a pull-up on RX. This is needed to avoid
+	 * garbage data when the TX pin of the Bluetooth module is
+	 * in tri-state (module powered off or not driving the
+	 * signal yet).
+	 */
+	bias-pull-up;
+};
+
+&tlmm {
+	qup_uart7_sleep_cts: qup-uart7-sleep-cts {
+		pins = "gpio28";
+		function = "gpio";
+		/*
+		 * Configure a pull-down on CTS to match the pull of
+		 * the Bluetooth module.
+		 */
+		bias-pull-down;
+	};
+
+	qup_uart7_sleep_rts: qup-uart7-sleep-rts {
+		pins = "gpio29";
+		function = "gpio";
+		/*
+		 * Configure pull-down on RTS. As RTS is active low
+		 * signal, pull it low to indicate the BT SoC that it
+		 * can wakeup the system anytime from suspend state by
+		 * pulling RX low (by sending wakeup bytes).
+		 */
+		bias-pull-down;
+	};
+
+	qup_uart7_sleep_tx: qup-uart7-sleep-tx {
+		pins = "gpio30";
+		function = "gpio";
+		/*
+		 * Configure pull-up on TX when it isn't actively driven
+		 * to prevent BT SoC from receiving garbage during sleep.
+		 */
+		bias-pull-up;
+	};
+
+	qup_uart7_sleep_rx: qup-uart7-sleep-rx {
+		pins = "gpio31";
+		function = "gpio";
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module
+		 * is floating which may cause spurious wakeups.
+		 */
+		bias-pull-up;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index ca6e36b..455e58f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -520,6 +520,25 @@
 
 		};
 
+		qup_opp_table: qup-opp-table {
+			compatible = "operating-points-v2";
+
+			opp-75000000 {
+				opp-hz = /bits/ 64 <75000000>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+			};
+
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+				required-opps = <&rpmhpd_opp_svs>;
+			};
+
+			opp-128000000 {
+				opp-hz = /bits/ 64 <128000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+		};
+
 		qupv3_id_0: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0 0x009c0000 0 0x2000>;
@@ -529,8 +548,305 @@
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			iommus = <&apps_smmu 0x123 0x0>;
 			status = "disabled";
 
+			i2c0: i2c@980000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00980000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c0_data_clk>;
+				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
+						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi0: spi@980000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00980000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>, <&qup_spi0_cs_gpio>;
+				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart0: serial@980000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00980000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart0_cts>, <&qup_uart0_rts>, <&qup_uart0_tx>, <&qup_uart0_rx>;
+				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c1: i2c@984000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00984000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c1_data_clk>;
+				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
+						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi1: spi@984000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00984000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>, <&qup_spi1_cs_gpio>;
+				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart1: serial@984000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00984000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart1_cts>, <&qup_uart1_rts>, <&qup_uart1_tx>, <&qup_uart1_rx>;
+				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c2: i2c@988000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00988000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c2_data_clk>;
+				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
+						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi2: spi@988000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00988000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>, <&qup_spi2_cs_gpio>;
+				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart2: serial@988000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00988000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart2_cts>, <&qup_uart2_rts>, <&qup_uart2_tx>, <&qup_uart2_rx>;
+				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c3: i2c@98c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x0098c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c3_data_clk>;
+				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
+						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi3: spi@98c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x0098c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>, <&qup_spi3_cs_gpio>;
+				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart3: serial@98c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x0098c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart3_cts>, <&qup_uart3_rts>, <&qup_uart3_tx>, <&qup_uart3_rx>;
+				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c4: i2c@990000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00990000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c4_data_clk>;
+				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
+						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi4: spi@990000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00990000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>, <&qup_spi4_cs_gpio>;
+				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart4: serial@990000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00990000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart4_cts>, <&qup_uart4_rts>, <&qup_uart4_tx>, <&qup_uart4_rx>;
+				interrupts = <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c5: i2c@994000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00994000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c5_data_clk>;
+				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
+						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi5: spi@994000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00994000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>, <&qup_spi5_cs_gpio>;
+				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
 			uart5: serial@994000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0 0x00994000 0 0x4000>;
@@ -541,6 +857,110 @@
 				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
+
+			i2c6: i2c@998000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00998000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c6_data_clk>;
+				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
+						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi6: spi@998000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00998000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>, <&qup_spi6_cs_gpio>;
+				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart6: serial@998000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00998000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart6_cts>, <&qup_uart6_rts>, <&qup_uart6_tx>, <&qup_uart6_rx>;
+				interrupts = <GIC_SPI 607 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c7: i2c@99c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x0099c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c7_data_clk>;
+				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
+						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi7: spi@99c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x0099c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>, <&qup_spi7_cs_gpio>;
+				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart7: serial@99c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x0099c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart7_cts>, <&qup_uart7_rts>, <&qup_uart7_tx>, <&qup_uart7_rx>;
+				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
 		};
 
 		cnoc2: interconnect@1500000 {
@@ -1554,11 +1974,311 @@
 				function = "qspi_data";
 			};
 
+			qup_i2c0_data_clk:qup-i2c0-data-clk {
+				pins = "gpio0", "gpio1";
+				function = "qup00";
+			};
+
+			qup_i2c1_data_clk:qup-i2c1-data-clk {
+				pins = "gpio4", "gpio5";
+				function = "qup01";
+			};
+
+			qup_i2c2_data_clk:qup-i2c2-data-clk {
+				pins = "gpio8", "gpio9";
+				function = "qup02";
+			};
+
+			qup_i2c3_data_clk:qup-i2c3-data-clk {
+				pins = "gpio12", "gpio13";
+				function = "qup03";
+			};
+
+			qup_i2c4_data_clk:qup-i2c4-data-clk {
+				pins = "gpio16", "gpio17";
+				function = "qup04";
+			};
+
+			qup_i2c5_data_clk:qup-i2c5-data-clk {
+				pins = "gpio20", "gpio21";
+				function = "qup05";
+			};
+
+			qup_i2c6_data_clk:qup-i2c6-data-clk {
+				pins = "gpio24", "gpio25";
+				function = "qup06";
+			};
+
+			qup_i2c7_data_clk:qup-i2c7-data-clk {
+				pins = "gpio28", "gpio29";
+				function = "qup07";
+			};
+
+			qup_spi0_data_clk: qup-spi0-data-clk {
+				pins = "gpio0", "gpio1", "gpio2";
+				function = "qup00";
+			};
+
+			qup_spi0_cs: qup-spi0-cs {
+				pins = "gpio3";
+				function = "qup00";
+			};
+
+			qup_spi0_cs_gpio: qup-spi0-cs_gpio {
+				pins = "gpio3";
+				function = "gpio";
+			};
+
+			qup_spi1_data_clk: qup-spi1-data-clk {
+				pins = "gpio4", "gpio5", "gpio6";
+				function = "qup01";
+			};
+
+			qup_spi1_cs: qup-spi1-cs {
+				pins = "gpio7";
+				function = "qup01";
+			};
+
+			qup_spi1_cs_gpio: qup-spi1-cs_gpio {
+				pins = "gpio7";
+				function = "gpio";
+			};
+
+			qup_spi2_data_clk: qup-spi2-data-clk {
+				pins = "gpio8", "gpio9", "gpio10";
+				function = "qup02";
+			};
+
+			qup_spi2_cs: qup-spi2-cs {
+				pins = "gpio11";
+				function = "qup02";
+			};
+
+			qup_spi2_cs_gpio: qup-spi2-cs_gpio {
+				pins = "gpio11";
+				function = "gpio";
+			};
+
+			qup_spi3_data_clk: qup-spi3-data-clk {
+				pins = "gpio12", "gpio13", "gpio14";
+				function = "qup03";
+			};
+
+			qup_spi3_cs: qup-spi3-cs {
+				pins = "gpio15";
+				function = "qup03";
+			};
+
+			qup_spi3_cs_gpio: qup-spi3-cs_gpio {
+				pins = "gpio15";
+				function = "gpio";
+			};
+
+			qup_spi4_data_clk: qup-spi4-data-clk {
+				pins = "gpio16", "gpio17", "gpio18";
+				function = "qup04";
+			};
+
+			qup_spi4_cs: qup-spi4-cs {
+				pins = "gpio19";
+				function = "qup04";
+			};
+
+			qup_spi4_cs_gpio: qup-spi4-cs_gpio {
+				pins = "gpio19";
+				function = "gpio";
+			};
+
+			qup_spi5_data_clk: qup-spi5-data-clk {
+				pins = "gpio20", "gpio21", "gpio22";
+				function = "qup05";
+			};
+
+			qup_spi5_cs: qup-spi5-cs {
+				pins = "gpio23";
+				function = "qup05";
+			};
+
+			qup_spi5_cs_gpio: qup-spi5-cs_gpio {
+				pins = "gpio23";
+				function = "gpio";
+			};
+
+			qup_spi6_data_clk: qup-spi6-data-clk {
+				pins = "gpio24", "gpio25", "gpio26";
+				function = "qup06";
+			};
+
+			qup_spi6_cs: qup-spi6-cs {
+				pins = "gpio27";
+				function = "qup06";
+			};
+
+			qup_spi6_cs_gpio: qup-spi6-cs_gpio {
+				pins = "gpio27";
+				function = "gpio";
+			};
+
+			qup_spi7_data_clk: qup-spi7-data-clk {
+				pins = "gpio28", "gpio29", "gpio30";
+				function = "qup07";
+			};
+
+			qup_spi7_cs: qup-spi7-cs {
+				pins = "gpio31";
+				function = "qup07";
+			};
+
+			qup_spi7_cs_gpio: qup-spi7-cs_gpio {
+				pins = "gpio31";
+				function = "gpio";
+			};
+
+			qup_uart0_cts: qup-uart0-cts {
+				pins = "gpio0";
+				function = "qup00";
+			};
+
+			qup_uart0_rts: qup-uart0-rts {
+				pins = "gpio1";
+				function = "qup00";
+			};
+
+			qup_uart0_tx: qup-uart0-tx {
+				pins = "gpio2";
+				function = "qup00";
+			};
+
+			qup_uart0_rx: qup-uart0-rx {
+				pins = "gpio3";
+				function = "qup00";
+			};
+
+			qup_uart1_cts: qup-uart1-cts {
+				pins = "gpio4";
+				function = "qup01";
+			};
+
+			qup_uart1_rts: qup-uart1-rts {
+				pins = "gpio5";
+				function = "qup01";
+			};
+
+			qup_uart1_tx: qup-uart1-tx {
+				pins = "gpio6";
+				function = "qup01";
+			};
+
+			qup_uart1_rx: qup-uart1-rx {
+				pins = "gpio7";
+				function = "qup01";
+			};
+
+			qup_uart2_cts: qup-uart2-cts {
+				pins = "gpio8";
+				function = "qup02";
+			};
+
+			qup_uart2_rts: qup-uart2-rts {
+				pins = "gpio9";
+				function = "qup02";
+			};
+
+			qup_uart2_tx: qup-uart2-tx {
+				pins = "gpio10";
+				function = "qup02";
+			};
+
+			qup_uart2_rx: qup-uart2-rx {
+				pins = "gpio11";
+				function = "qup02";
+			};
+
+			qup_uart3_cts: qup-uart3-cts {
+				pins = "gpio12";
+				function = "qup03";
+			};
+
+			qup_uart3_rts: qup-uart3-rts {
+				pins = "gpio13";
+				function = "qup03";
+			};
+
+			qup_uart3_tx: qup-uart3-tx {
+				pins = "gpio14";
+				function = "qup03";
+			};
+
+			qup_uart3_rx: qup-uart3-rx {
+				pins = "gpio15";
+				function = "qup03";
+			};
+
+			qup_uart4_cts: qup-uart4-cts {
+				pins = "gpio16";
+				function = "qup04";
+			};
+
+			qup_uart4_rts: qup-uart4-rts {
+				pins = "gpio17";
+				function = "qup04";
+			};
+
+			qup_uart4_tx: qup-uart4-tx {
+				pins = "gpio18";
+				function = "qup04";
+			};
+
+			qup_uart4_rx: qup-uart4-rx {
+				pins = "gpio19";
+				function = "qup04";
+			};
+
 			qup_uart5_default: qup-uart5-default {
 				pins = "gpio46", "gpio47";
 				function = "qup13";
 			};
 
+			qup_uart6_cts: qup-uart6-cts {
+				pins = "gpio24";
+				function = "qup06";
+			};
+
+			qup_uart6_rts: qup-uart6-rts {
+				pins = "gpio25";
+				function = "qup06";
+			};
+
+			qup_uart6_tx: qup-uart6-tx {
+				pins = "gpio26";
+				function = "qup06";
+			};
+
+			qup_uart6_rx: qup-uart6-rx {
+				pins = "gpio27";
+				function = "qup06";
+			};
+
+			qup_uart7_cts: qup-uart7-cts {
+				pins = "gpio28";
+				function = "qup07";
+			};
+
+			qup_uart7_rts: qup-uart7-rts {
+				pins = "gpio29";
+				function = "qup07";
+			};
+
+			qup_uart7_tx: qup-uart7-tx {
+				pins = "gpio30";
+				function = "qup07";
+			};
+
+			qup_uart7_rx: qup-uart7-rx {
+				pins = "gpio31";
+				function = "qup07";
+			};
+
 			sdc1_on: sdc1-on {
 				clk {
 					pins = "sdc1_clk";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

