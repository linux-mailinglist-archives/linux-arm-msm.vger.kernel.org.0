Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FDA03682F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Apr 2021 17:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236975AbhDVPHD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Apr 2021 11:07:03 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:39873 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237421AbhDVPHD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Apr 2021 11:07:03 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 22 Apr 2021 08:06:28 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Apr 2021 08:06:25 -0700
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 22 Apr 2021 20:36:00 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id ED9FF3253; Thu, 22 Apr 2021 20:35:58 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH V2] arm64: dts: sc7280: Add qspi, qupv3_0 and qupv3_1 nodes
Date:   Thu, 22 Apr 2021 20:35:56 +0530
Message-Id: <20210422150556.450-1-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QSPI and QUP SE instances configuration for sc7280.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
---
Changes in V2:
 - As per Doug's comments removed pinmux/pinconf subnodes.
 - As per Doug's comments split of SPI, UART nodes has been done.
 - Moved QSPI node before aps_smmu as per the order.

This patch depends on interconnect changes [1]
[1] https://lore.kernel.org/patchwork/project/lkml/list/?series=488429

 arch/arm64/boot/dts/qcom/sc7280-idp.dts |  131 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 2377 +++++++++++++++++++----
 2 files changed, 2089 insertions(+), 419 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 54d2cb365b71..b1e948a72eb1 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -15,6 +15,7 @@ / {
 
 	aliases {
 		serial0 = &uart5;
+		hsuart0 = &uart7;
 	};
 
 	chosen {
@@ -234,26 +235,140 @@ vreg_l6e_0p8: ldo6 {
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
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &uart5 {
 	status = "okay";
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
 
-&qup_uart5_default {
-	tx {
-		pins = "gpio46";
-		drive-strength = <2>;
-		bias-disable;
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
+&qup_uart5_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart5_rx {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
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
 	};
 
-	rx {
-		pins = "gpio47";
-		drive-strength = <2>;
+	qup_uart7_sleep_rx: qup-uart7-sleep-rx {
+		pins = "gpio31";
+		function = "gpio";
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module
+		 * is floating which may cause spurious wakeups.
+		 */
 		bias-pull-up;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 2cc478553935..42bb2dda9047 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -293,6 +293,25 @@ ipcc: mailbox@408000 {
 			#mbox-cells = <2>;
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
@@ -302,575 +321,2111 @@ qupv3_id_0: geniqup@9c0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			iommus = <&apps_smmu 0x123 0x0>;
+			interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>;
+			interconnect-names = "qup-core";
 			status = "disabled";
 
-			uart5: serial@994000 {
-				compatible = "qcom,geni-debug-uart";
-				reg = <0 0x00994000 0 0x4000>;
+			i2c0: i2c@980000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00980000 0 0x4000>;
 				clock-names = "se";
-				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
 				pinctrl-names = "default";
-				pinctrl-0 = <&qup_uart5_default>;
-				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				pinctrl-0 = <&qup_i2c0_data_clk>;
+				interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
+						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
 				status = "disabled";
 			};
-		};
 
-		stm@6002000 {
-			compatible = "arm,coresight-stm", "arm,primecell";
-			reg = <0 0x06002000 0 0x1000>,
-			      <0 0x16280000 0 0x180000>;
-			reg-names = "stm-base", "stm-stimulus-base";
-
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
-
-			out-ports {
-				port {
-					stm_out: endpoint {
-						remote-endpoint = <&funnel0_in7>;
-					};
-				};
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
 			};
-		};
-
-		funnel@6041000 {
-			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0 0x06041000 0 0x1000>;
-
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
 
-			out-ports {
-				port {
-					funnel0_out: endpoint {
-						remote-endpoint = <&merge_funnel_in0>;
-					};
-				};
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
 			};
 
-			in-ports {
+			i2c1: i2c@984000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00984000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c1_data_clk>;
+				interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-
-				port@7 {
-					reg = <7>;
-					funnel0_in7: endpoint {
-						remote-endpoint = <&stm_out>;
-					};
-				};
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
+						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
 			};
-		};
-
-		funnel@6042000 {
-			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0 0x06042000 0 0x1000>;
 
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
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
 
-			out-ports {
-				port {
-					funnel1_out: endpoint {
-						remote-endpoint = <&merge_funnel_in1>;
-					};
-				};
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
 			};
 
-			in-ports {
+			i2c2: i2c@988000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00988000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c2_data_clk>;
+				interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
-
-				port@4 {
-					reg = <4>;
-					funnel1_in4: endpoint {
-						remote-endpoint = <&apss_merge_funnel_out>;
-					};
-				};
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
+						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
 			};
-		};
-
-		funnel@6045000 {
-			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0 0x06045000 0 0x1000>;
 
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
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
 
-			out-ports {
-				port {
-					merge_funnel_out: endpoint {
-						remote-endpoint = <&swao_funnel_in>;
-					};
-				};
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
 			};
 
-			in-ports {
+			i2c3: i2c@98c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x0098c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c3_data_clk>;
+				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>,
+						<&aggre1_noc MASTER_QUP_0 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
 
-				port@0 {
-					reg = <0>;
-					merge_funnel_in0: endpoint {
-						remote-endpoint = <&funnel0_out>;
-					};
-				};
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
 
-				port@1 {
-					reg = <1>;
-					merge_funnel_in1: endpoint {
-						remote-endpoint = <&funnel1_out>;
-					};
-				};
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
 			};
-		};
 
-		replicator@6046000 {
-			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
-			reg = <0 0x06046000 0 0x1000>;
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
 
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
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
 
-			out-ports {
-				port {
-					replicator_out: endpoint {
-						remote-endpoint = <&etr_in>;
-					};
-				};
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
 			};
 
-			in-ports {
-				port {
-					replicator_in: endpoint {
-						remote-endpoint = <&swao_replicator_out>;
-					};
-				};
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
 			};
-		};
 
-		etr@6048000 {
-			compatible = "arm,coresight-tmc", "arm,primecell";
-			reg = <0 0x06048000 0 0x1000>;
-			iommus = <&apps_smmu 0x04c0 0>;
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
 
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
-			arm,scatter-gather;
+			uart5: serial@994000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0 0x00994000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart5_cts>, <&qup_uart5_rts>, <&qup_uart5_tx>, <&qup_uart5_rx>;
+				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
 
-			in-ports {
-				port {
-					etr_in: endpoint {
-						remote-endpoint = <&replicator_out>;
-					};
-				};
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
 			};
-		};
 
-		funnel@6b04000 {
-			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0 0x06b04000 0 0x1000>;
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
 
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
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
 
-			out-ports {
-				port {
-					swao_funnel_out: endpoint {
-						remote-endpoint = <&etf_in>;
-					};
-				};
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
 			};
 
-			in-ports {
+			spi7: spi@99c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x0099c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>, <&qup_spi7_cs_gpio>;
+				interrupts = <GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
 
-				port@7 {
-					reg = <7>;
-					swao_funnel_in: endpoint {
-						remote-endpoint = <&merge_funnel_out>;
-					};
-				};
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
 			};
 		};
 
-		etf@6b05000 {
-			compatible = "arm,coresight-tmc", "arm,primecell";
-			reg = <0 0x06b05000 0 0x1000>;
+		qupv3_id_1: geniqup@ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0 0x00ac0000 0 0x2000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			iommus = <&apps_smmu 0x43 0x0>;
+			interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>;
+			interconnect-names = "qup-core";
+			status = "disabled";
+
+			i2c8: i2c@a80000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a80000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c8_data_clk>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
+						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi8: spi@a80000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a80000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>, <&qup_spi8_cs_gpio>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart8: serial@a80000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a80000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart8_cts>, <&qup_uart8_rts>, <&qup_uart8_tx>, <&qup_uart8_rx>;
+				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c9: i2c@a84000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a84000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c9_data_clk>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
+						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi9: spi@a84000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a84000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>, <&qup_spi9_cs_gpio>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart9: serial@a84000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a84000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart9_cts>, <&qup_uart9_rts>, <&qup_uart9_tx>, <&qup_uart9_rx>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c10: i2c@a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a88000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c10_data_clk>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
+						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi10: spi@a88000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a88000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>, <&qup_spi10_cs_gpio>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart10: serial@a88000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a88000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart10_cts>, <&qup_uart10_rts>, <&qup_uart10_tx>, <&qup_uart10_rx>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c11: i2c@a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a8c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c11_data_clk>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
+						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi11: spi@a8c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a8c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>, <&qup_spi11_cs_gpio>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart11: serial@a8c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a8c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart11_cts>, <&qup_uart11_rts>, <&qup_uart11_tx>, <&qup_uart11_rx>;
+				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c12: i2c@a90000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a90000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c12_data_clk>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
+						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi12: spi@a90000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a90000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>, <&qup_spi12_cs_gpio>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart12: serial@a90000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a90000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart12_cts>, <&qup_uart12_rts>, <&qup_uart12_tx>, <&qup_uart12_rx>;
+				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c13: i2c@a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a94000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c13_data_clk>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
+						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi13: spi@a94000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a94000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>, <&qup_spi13_cs_gpio>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart13: serial@a94000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a94000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart13_cts>, <&qup_uart13_rts>, <&qup_uart13_tx>, <&qup_uart13_rx>;
+				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c14: i2c@a98000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a98000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c14_data_clk>;
+				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
+						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi14: spi@a98000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a98000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>, <&qup_spi14_cs_gpio>;
+				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart14: serial@a98000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a98000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart14_cts>, <&qup_uart14_rts>, <&qup_uart14_tx>, <&qup_uart14_rx>;
+				interrupts = <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			i2c15: i2c@a9c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0 0x00a9c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_i2c15_data_clk>;
+				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>,
+						<&aggre2_noc MASTER_QUP_1 0 &mc_virt SLAVE_EBI1 0>;
+				interconnect-names = "qup-core", "qup-config",
+							"qup-memory";
+				status = "disabled";
+			};
+
+			spi15: spi@a9c000 {
+				compatible = "qcom,geni-spi";
+				reg = <0 0x00a9c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>, <&qup_spi15_cs_gpio>;
+				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+
+			uart15: serial@a9c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00a9c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart15_cts>, <&qup_uart15_rts>, <&qup_uart15_tx>, <&qup_uart15_rx>;
+				interrupts = <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
+				power-domains = <&rpmhpd SC7280_CX>;
+				operating-points-v2 = <&qup_opp_table>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
+						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_1 0>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
+		};
+
+		stm@6002000 {
+			compatible = "arm,coresight-stm", "arm,primecell";
+			reg = <0 0x06002000 0 0x1000>,
+			      <0 0x16280000 0 0x180000>;
+			reg-names = "stm-base", "stm-stimulus-base";
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
 
 			out-ports {
 				port {
-					etf_out: endpoint {
-						remote-endpoint = <&swao_replicator_in>;
-					};
-				};
-			};
-
-			in-ports {
-				port {
-					etf_in: endpoint {
-						remote-endpoint = <&swao_funnel_out>;
+					stm_out: endpoint {
+						remote-endpoint = <&funnel0_in7>;
 					};
 				};
 			};
 		};
 
-		replicator@6b06000 {
-			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
-			reg = <0 0x06b06000 0 0x1000>;
+		funnel@6041000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x06041000 0 0x1000>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
-			qcom,replicator-loses-context;
 
 			out-ports {
 				port {
-					swao_replicator_out: endpoint {
-						remote-endpoint = <&replicator_in>;
+					funnel0_out: endpoint {
+						remote-endpoint = <&merge_funnel_in0>;
 					};
 				};
 			};
 
 			in-ports {
-				port {
-					swao_replicator_in: endpoint {
-						remote-endpoint = <&etf_out>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@7 {
+					reg = <7>;
+					funnel0_in7: endpoint {
+						remote-endpoint = <&stm_out>;
 					};
 				};
 			};
 		};
 
-		etm@7040000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0 0x07040000 0 0x1000>;
-
-			cpu = <&CPU0>;
+		funnel@6042000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x06042000 0 0x1000>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
-			arm,coresight-loses-context-with-cpu;
-			qcom,skip-power-up;
 
 			out-ports {
 				port {
-					etm0_out: endpoint {
-						remote-endpoint = <&apss_funnel_in0>;
+					funnel1_out: endpoint {
+						remote-endpoint = <&merge_funnel_in1>;
 					};
 				};
 			};
-		};
 
-		etm@7140000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0 0x07140000 0 0x1000>;
-
-			cpu = <&CPU1>;
-
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
-			arm,coresight-loses-context-with-cpu;
-			qcom,skip-power-up;
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-			out-ports {
-				port {
-					etm1_out: endpoint {
-						remote-endpoint = <&apss_funnel_in1>;
+				port@4 {
+					reg = <4>;
+					funnel1_in4: endpoint {
+						remote-endpoint = <&apss_merge_funnel_out>;
 					};
 				};
 			};
 		};
 
-		etm@7240000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0 0x07240000 0 0x1000>;
-
-			cpu = <&CPU2>;
+		funnel@6045000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x06045000 0 0x1000>;
 
 			clocks = <&aoss_qmp>;
 			clock-names = "apb_pclk";
-			arm,coresight-loses-context-with-cpu;
-			qcom,skip-power-up;
 
 			out-ports {
 				port {
-					etm2_out: endpoint {
+					merge_funnel_out: endpoint {
+						remote-endpoint = <&swao_funnel_in>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					merge_funnel_in0: endpoint {
+						remote-endpoint = <&funnel0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					merge_funnel_in1: endpoint {
+						remote-endpoint = <&funnel1_out>;
+					};
+				};
+			};
+		};
+
+		replicator@6046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0 0x06046000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					replicator_out: endpoint {
+						remote-endpoint = <&etr_in>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					replicator_in: endpoint {
+						remote-endpoint = <&swao_replicator_out>;
+					};
+				};
+			};
+		};
+
+		etr@6048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0 0x06048000 0 0x1000>;
+			iommus = <&apps_smmu 0x04c0 0>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr_in: endpoint {
+						remote-endpoint = <&replicator_out>;
+					};
+				};
+			};
+		};
+
+		funnel@6b04000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x06b04000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					swao_funnel_out: endpoint {
+						remote-endpoint = <&etf_in>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@7 {
+					reg = <7>;
+					swao_funnel_in: endpoint {
+						remote-endpoint = <&merge_funnel_out>;
+					};
+				};
+			};
+		};
+
+		etf@6b05000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0 0x06b05000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					etf_out: endpoint {
+						remote-endpoint = <&swao_replicator_in>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					etf_in: endpoint {
+						remote-endpoint = <&swao_funnel_out>;
+					};
+				};
+			};
+		};
+
+		replicator@6b06000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0 0x06b06000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			qcom,replicator-loses-context;
+
+			out-ports {
+				port {
+					swao_replicator_out: endpoint {
+						remote-endpoint = <&replicator_in>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					swao_replicator_in: endpoint {
+						remote-endpoint = <&etf_out>;
+					};
+				};
+			};
+		};
+
+		etm@7040000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07040000 0 0x1000>;
+
+			cpu = <&CPU0>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm0_out: endpoint {
+						remote-endpoint = <&apss_funnel_in0>;
+					};
+				};
+			};
+		};
+
+		etm@7140000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07140000 0 0x1000>;
+
+			cpu = <&CPU1>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm1_out: endpoint {
+						remote-endpoint = <&apss_funnel_in1>;
+					};
+				};
+			};
+		};
+
+		etm@7240000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07240000 0 0x1000>;
+
+			cpu = <&CPU2>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm2_out: endpoint {
 						remote-endpoint = <&apss_funnel_in2>;
 					};
 				};
 			};
-		};
+		};
+
+		etm@7340000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07340000 0 0x1000>;
+
+			cpu = <&CPU3>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm3_out: endpoint {
+						remote-endpoint = <&apss_funnel_in3>;
+					};
+				};
+			};
+		};
+
+		etm@7440000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07440000 0 0x1000>;
+
+			cpu = <&CPU4>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm4_out: endpoint {
+						remote-endpoint = <&apss_funnel_in4>;
+					};
+				};
+			};
+		};
+
+		etm@7540000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07540000 0 0x1000>;
+
+			cpu = <&CPU5>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm5_out: endpoint {
+						remote-endpoint = <&apss_funnel_in5>;
+					};
+				};
+			};
+		};
+
+		etm@7640000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07640000 0 0x1000>;
+
+			cpu = <&CPU6>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm6_out: endpoint {
+						remote-endpoint = <&apss_funnel_in6>;
+					};
+				};
+			};
+		};
+
+		etm@7740000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0 0x07740000 0 0x1000>;
+
+			cpu = <&CPU7>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			arm,coresight-loses-context-with-cpu;
+			qcom,skip-power-up;
+
+			out-ports {
+				port {
+					etm7_out: endpoint {
+						remote-endpoint = <&apss_funnel_in7>;
+					};
+				};
+			};
+		};
+
+		funnel@7800000 { /* APSS Funnel */
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x07800000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					apss_funnel_out: endpoint {
+						remote-endpoint = <&apss_merge_funnel_in>;
+					};
+				};
+			};
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					apss_funnel_in0: endpoint {
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					apss_funnel_in1: endpoint {
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					apss_funnel_in2: endpoint {
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					apss_funnel_in3: endpoint {
+						remote-endpoint = <&etm3_out>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					apss_funnel_in4: endpoint {
+						remote-endpoint = <&etm4_out>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					apss_funnel_in5: endpoint {
+						remote-endpoint = <&etm5_out>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+					apss_funnel_in6: endpoint {
+						remote-endpoint = <&etm6_out>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+					apss_funnel_in7: endpoint {
+						remote-endpoint = <&etm7_out>;
+					};
+				};
+			};
+		};
+
+		funnel@7810000 {
+			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+			reg = <0 0x07810000 0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			out-ports {
+				port {
+					apss_merge_funnel_out: endpoint {
+						remote-endpoint = <&funnel1_in4>;
+					};
+				};
+			};
+
+			in-ports {
+				port {
+					apss_merge_funnel_in: endpoint {
+						remote-endpoint = <&apss_funnel_out>;
+					};
+				};
+			};
+		};
+
+		system-cache-controller@9200000 {
+			compatible = "qcom,sc7280-llcc";
+			reg = <0 0x09200000 0 0xd0000>, <0 0x09600000 0 0x50000>;
+			reg-names = "llcc_base", "llcc_broadcast_base";
+			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		pdc: interrupt-controller@b220000 {
+			compatible = "qcom,sc7280-pdc", "qcom,pdc";
+			reg = <0 0x0b220000 0 0x30000>;
+			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,
+					  <55 306 4>, <59 312 3>, <62 374 2>,
+					  <64 434 2>, <66 438 3>, <69 86 1>,
+					  <70 520 54>, <124 609 31>, <155 63 1>,
+					  <156 716 12>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
+		aoss_qmp: power-controller@c300000 {
+			compatible = "qcom,sc7280-aoss-qmp";
+			reg = <0 0x0c300000 0 0x100000>;
+			interrupts-extended = <&ipcc IPCC_CLIENT_AOP
+						     IPCC_MPROC_SIGNAL_GLINK_QMP
+						     IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&ipcc IPCC_CLIENT_AOP
+					IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+			#clock-cells = <0>;
+			#power-domain-cells = <1>;
+		};
+
+		spmi_bus: spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0 0x0c440000 0 0x1100>,
+			      <0 0x0c600000 0 0x2000000>,
+			      <0 0x0e600000 0 0x100000>,
+			      <0 0x0e700000 0 0xa0000>,
+			      <0 0x0c40a000 0 0x26000>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+		};
+
+		tlmm: pinctrl@f100000 {
+			compatible = "qcom,sc7280-pinctrl";
+			reg = <0 0x0f100000 0 0x300000>;
+			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			gpio-ranges = <&tlmm 0 0 175>;
+			wakeup-parent = <&pdc>;
+
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
+			qup_i2c8_data_clk:qup-i2c8-data-clk {
+				pins = "gpio32", "gpio33";
+				function = "qup08";
+			};
+
+			qup_i2c9_data_clk:qup-i2c9-data-clk {
+				pins = "gpio36", "gpio37";
+				function = "qup09";
+			};
+
+			qup_i2c10_data_clk:qup-i2c10-data-clk {
+				pins = "gpio40", "gpio41";
+				function = "qup10";
+			};
+
+			qup_i2c11_data_clk:qup-i2c11-data-clk {
+				pins = "gpio44", "gpio45";
+				function = "qup11";
+			};
+
+			qup_i2c12_data_clk:qup-i2c12-data-clk {
+				pins = "gpio48", "gpio49";
+				function = "qup12";
+			};
+
+			qup_i2c13_data_clk:qup-i2c13-data-clk {
+				pins = "gpio52", "gpio53";
+				function = "qup13";
+			};
+
+			qup_i2c14_data_clk:qup-i2c14-data-clk {
+				pins = "gpio56", "gpio57";
+				function = "qup14";
+			};
+
+			qup_i2c15_data_clk:qup-i2c15-data-clk {
+				pins = "gpio60", "gpio61";
+				function = "qup15";
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
+			qup_spi8_data_clk: qup-spi8-data-clk {
+				pins = "gpio32", "gpio33", "gpio34";
+				function = "qup08";
+			};
+
+			qup_spi8_cs: qup-spi8-cs {
+				pins = "gpio35";
+				function = "qup08";
+			};
+
+			qup_spi8_cs_gpio: qup-spi8-cs_gpio {
+				pins = "gpio35";
+				function = "gpio";
+			};
+
+			qup_spi9_data_clk: qup-spi9-data-clk {
+				pins = "gpio36", "gpio37", "gpio38";
+				function = "qup09";
+			};
+
+			qup_spi9_cs: qup-spi9-cs {
+				pins = "gpio39";
+				function = "qup09";
+			};
+
+			qup_spi9_cs_gpio: qup-spi9-cs_gpio {
+				pins = "gpio39";
+				function = "gpio";
+			};
+
+			qup_spi10_data_clk: qup-spi10-data-clk {
+				pins = "gpio40", "gpio41", "gpio42";
+				function = "qup10";
+			};
+
+			qup_spi10_cs: qup-spi10-cs {
+				pins = "gpio43";
+				function = "qup10";
+			};
+
+			qup_spi10_cs_gpio: qup-spi10-cs_gpio {
+				pins = "gpio43";
+				function = "gpio";
+			};
+
+			qup_spi11_data_clk: qup-spi11-data-clk {
+				pins = "gpio44", "gpio45", "gpio46";
+				function = "qup11";
+			};
+
+			qup_spi11_cs: qup-spi11-cs {
+				pins = "gpio47";
+				function = "qup11";
+			};
+
+			qup_spi11_cs_gpio: qup-spi11-cs_gpio {
+				pins = "gpio47";
+				function = "gpio";
+			};
+
+			qup_spi12_data_clk: qup-spi12-data-clk {
+				pins = "gpio48", "gpio49", "gpio50";
+				function = "qup12";
+			};
+
+			qup_spi12_cs: qup-spi12-cs {
+				pins = "gpio51";
+				function = "qup12";
+			};
+
+			qup_spi12_cs_gpio: qup-spi12-cs_gpio {
+				pins = "gpio51";
+				function = "gpio";
+			};
+
+			qup_spi13_data_clk: qup-spi13-data-clk {
+				pins = "gpio52", "gpio53", "gpio54";
+				function = "qup13";
+			};
+
+			qup_spi13_cs: qup-spi13-cs {
+				pins = "gpio55";
+				function = "qup13";
+			};
+
+			qup_spi13_cs_gpio: qup-spi13-cs_gpio {
+				pins = "gpio55";
+				function = "gpio";
+			};
+
+			qup_spi14_data_clk: qup-spi14-data-clk {
+				pins = "gpio56", "gpio57", "gpio58";
+				function = "qup14";
+			};
+
+			qup_spi14_cs: qup-spi14-cs {
+				pins = "gpio59";
+				function = "qup14";
+			};
+
+			qup_spi14_cs_gpio: qup-spi14-cs_gpio {
+				pins = "gpio59";
+				function = "gpio";
+			};
+
+			qup_spi15_data_clk: qup-spi15-data-clk {
+				pins = "gpio60", "gpio61", "gpio62";
+				function = "qup15";
+			};
+
+			qup_spi15_cs: qup-spi15-cs {
+				pins = "gpio63";
+				function = "qup15";
+			};
+
+			qup_spi15_cs_gpio: qup-spi15-cs_gpio {
+				pins = "gpio63";
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
+			};
 
-		etm@7340000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0 0x07340000 0 0x1000>;
+			qup_uart6_cts: qup-uart6-cts {
+				pins = "gpio24";
+				function = "qup06";
+			};
 
-			cpu = <&CPU3>;
+			qup_uart6_rts: qup-uart6-rts {
+				pins = "gpio25";
+				function = "qup06";
+			};
 
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
-			arm,coresight-loses-context-with-cpu;
-			qcom,skip-power-up;
+			qup_uart6_tx: qup-uart6-tx {
+				pins = "gpio26";
+				function = "qup06";
+			};
 
-			out-ports {
-				port {
-					etm3_out: endpoint {
-						remote-endpoint = <&apss_funnel_in3>;
-					};
-				};
+			qup_uart6_rx: qup-uart6-rx {
+				pins = "gpio27";
+				function = "qup06";
 			};
-		};
 
-		etm@7440000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0 0x07440000 0 0x1000>;
+			qup_uart7_cts: qup-uart7-cts {
+				pins = "gpio28";
+				function = "qup07";
+			};
 
-			cpu = <&CPU4>;
+			qup_uart7_rts: qup-uart7-rts {
+				pins = "gpio29";
+				function = "qup07";
+			};
 
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
-			arm,coresight-loses-context-with-cpu;
-			qcom,skip-power-up;
+			qup_uart7_tx: qup-uart7-tx {
+				pins = "gpio30";
+				function = "qup07";
+			};
 
-			out-ports {
-				port {
-					etm4_out: endpoint {
-						remote-endpoint = <&apss_funnel_in4>;
-					};
-				};
+			qup_uart7_rx: qup-uart7-rx {
+				pins = "gpio31";
+				function = "qup07";
 			};
-		};
 
-		etm@7540000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0 0x07540000 0 0x1000>;
+			qup_uart8_cts: qup-uart8-cts {
+				pins = "gpio32";
+				function = "qup08";
+			};
 
-			cpu = <&CPU5>;
+			qup_uart8_rts: qup-uart8-rts {
+				pins = "gpio33";
+				function = "qup08";
+			};
 
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
-			arm,coresight-loses-context-with-cpu;
-			qcom,skip-power-up;
+			qup_uart8_tx: qup-uart8-tx {
+				pins = "gpio34";
+				function = "qup08";
+			};
 
-			out-ports {
-				port {
-					etm5_out: endpoint {
-						remote-endpoint = <&apss_funnel_in5>;
-					};
-				};
+			qup_uart8_rx: qup-uart8-rx {
+				pins = "gpio35";
+				function = "qup08";
 			};
-		};
 
-		etm@7640000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0 0x07640000 0 0x1000>;
+			qup_uart9_cts: qup-uart9-cts {
+				pins = "gpio36";
+				function = "qup09";
+			};
 
-			cpu = <&CPU6>;
+			qup_uart9_rts: qup-uart9-rts {
+				pins = "gpio37";
+				function = "qup09";
+			};
 
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
-			arm,coresight-loses-context-with-cpu;
-			qcom,skip-power-up;
+			qup_uart9_tx: qup-uart9-tx {
+				pins = "gpio38";
+				function = "qup09";
+			};
 
-			out-ports {
-				port {
-					etm6_out: endpoint {
-						remote-endpoint = <&apss_funnel_in6>;
-					};
-				};
+			qup_uart9_rx: qup-uart9-rx {
+				pins = "gpio39";
+				function = "qup09";
 			};
-		};
 
-		etm@7740000 {
-			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0 0x07740000 0 0x1000>;
+			qup_uart10_cts: qup-uart10-cts {
+				pins = "gpio40";
+				function = "qup10";
+			};
 
-			cpu = <&CPU7>;
+			qup_uart10_rts: qup-uart10-rts {
+				pins = "gpio41";
+				function = "qup10";
+			};
 
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
-			arm,coresight-loses-context-with-cpu;
-			qcom,skip-power-up;
+			qup_uart10_tx: qup-uart10-tx {
+				pins = "gpio42";
+				function = "qup10";
+			};
 
-			out-ports {
-				port {
-					etm7_out: endpoint {
-						remote-endpoint = <&apss_funnel_in7>;
-					};
-				};
+			qup_uart10_rx: qup-uart10-rx {
+				pins = "gpio43";
+				function = "qup10";
 			};
-		};
 
-		funnel@7800000 { /* APSS Funnel */
-			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0 0x07800000 0 0x1000>;
+			qup_uart11_cts: qup-uart11-cts {
+				pins = "gpio44";
+				function = "qup11";
+			};
 
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
+			qup_uart11_rts: qup-uart11-rts {
+				pins = "gpio45";
+				function = "qup11";
+			};
 
-			out-ports {
-				port {
-					apss_funnel_out: endpoint {
-						remote-endpoint = <&apss_merge_funnel_in>;
-					};
-				};
+			qup_uart11_tx: qup-uart11-tx {
+				pins = "gpio46";
+				function = "qup11";
 			};
 
-			in-ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
+			qup_uart11_rx: qup-uart11-rx {
+				pins = "gpio47";
+				function = "qup11";
+			};
 
-				port@0 {
-					reg = <0>;
-					apss_funnel_in0: endpoint {
-						remote-endpoint = <&etm0_out>;
-					};
-				};
+			qup_uart12_cts: qup-uart12-cts {
+				pins = "gpio48";
+				function = "qup12";
+			};
 
-				port@1 {
-					reg = <1>;
-					apss_funnel_in1: endpoint {
-						remote-endpoint = <&etm1_out>;
-					};
-				};
+			qup_uart12_rts: qup-uart12-rts {
+				pins = "gpio49";
+				function = "qup12";
+			};
 
-				port@2 {
-					reg = <2>;
-					apss_funnel_in2: endpoint {
-						remote-endpoint = <&etm2_out>;
-					};
-				};
+			qup_uart12_tx: qup-uart12-tx {
+				pins = "gpio50";
+				function = "qup12";
+			};
 
-				port@3 {
-					reg = <3>;
-					apss_funnel_in3: endpoint {
-						remote-endpoint = <&etm3_out>;
-					};
-				};
+			qup_uart12_rx: qup-uart12-rx {
+				pins = "gpio51";
+				function = "qup12";
+			};
 
-				port@4 {
-					reg = <4>;
-					apss_funnel_in4: endpoint {
-						remote-endpoint = <&etm4_out>;
-					};
-				};
+			qup_uart13_cts: qup-uart13-cts {
+				pins = "gpio52";
+				function = "qup13";
+			};
 
-				port@5 {
-					reg = <5>;
-					apss_funnel_in5: endpoint {
-						remote-endpoint = <&etm5_out>;
-					};
-				};
+			qup_uart13_rts: qup-uart13-rts {
+				pins = "gpio53";
+				function = "qup13";
+			};
 
-				port@6 {
-					reg = <6>;
-					apss_funnel_in6: endpoint {
-						remote-endpoint = <&etm6_out>;
-					};
-				};
+			qup_uart13_tx: qup-uart13-tx {
+				pins = "gpio54";
+				function = "qup13";
+			};
 
-				port@7 {
-					reg = <7>;
-					apss_funnel_in7: endpoint {
-						remote-endpoint = <&etm7_out>;
-					};
-				};
+			qup_uart13_rx: qup-uart13-rx {
+				pins = "gpio55";
+				function = "qup13";
 			};
-		};
 
-		funnel@7810000 {
-			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0 0x07810000 0 0x1000>;
+			qup_uart14_cts: qup-uart14-cts {
+				pins = "gpio56";
+				function = "qup14";
+			};
 
-			clocks = <&aoss_qmp>;
-			clock-names = "apb_pclk";
+			qup_uart14_rts: qup-uart14-rts {
+				pins = "gpio57";
+				function = "qup14";
+			};
 
-			out-ports {
-				port {
-					apss_merge_funnel_out: endpoint {
-						remote-endpoint = <&funnel1_in4>;
-					};
-				};
+			qup_uart14_tx: qup-uart14-tx {
+				pins = "gpio58";
+				function = "qup14";
 			};
 
-			in-ports {
-				port {
-					apss_merge_funnel_in: endpoint {
-						remote-endpoint = <&apss_funnel_out>;
-					};
-				};
+			qup_uart14_rx: qup-uart14-rx {
+				pins = "gpio59";
+				function = "qup14";
 			};
-		};
 
-		system-cache-controller@9200000 {
-			compatible = "qcom,sc7280-llcc";
-			reg = <0 0x09200000 0 0xd0000>, <0 0x09600000 0 0x50000>;
-			reg-names = "llcc_base", "llcc_broadcast_base";
-			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
-		};
+			qup_uart15_cts: qup-uart15-cts {
+				pins = "gpio60";
+				function = "qup15";
+			};
 
-		pdc: interrupt-controller@b220000 {
-			compatible = "qcom,sc7280-pdc", "qcom,pdc";
-			reg = <0 0x0b220000 0 0x30000>;
-			qcom,pdc-ranges = <0 480 40>, <40 140 14>, <54 263 1>,
-					  <55 306 4>, <59 312 3>, <62 374 2>,
-					  <64 434 2>, <66 438 3>, <69 86 1>,
-					  <70 520 54>, <124 609 31>, <155 63 1>,
-					  <156 716 12>;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&intc>;
-			interrupt-controller;
-		};
+			qup_uart15_rts: qup-uart15-rts {
+				pins = "gpio61";
+				function = "qup15";
+			};
 
-		aoss_qmp: power-controller@c300000 {
-			compatible = "qcom,sc7280-aoss-qmp";
-			reg = <0 0x0c300000 0 0x100000>;
-			interrupts-extended = <&ipcc IPCC_CLIENT_AOP
-						     IPCC_MPROC_SIGNAL_GLINK_QMP
-						     IRQ_TYPE_EDGE_RISING>;
-			mboxes = <&ipcc IPCC_CLIENT_AOP
-					IPCC_MPROC_SIGNAL_GLINK_QMP>;
+			qup_uart15_tx: qup-uart15-tx {
+				pins = "gpio62";
+				function = "qup15";
+			};
 
-			#clock-cells = <0>;
-			#power-domain-cells = <1>;
-		};
+			qup_uart15_rx: qup-uart15-rx {
+				pins = "gpio63";
+				function = "qup15";
+			};
 
-		spmi_bus: spmi@c440000 {
-			compatible = "qcom,spmi-pmic-arb";
-			reg = <0 0x0c440000 0 0x1100>,
-			      <0 0x0c600000 0 0x2000000>,
-			      <0 0x0e600000 0 0x100000>,
-			      <0 0x0e700000 0 0xa0000>,
-			      <0 0x0c40a000 0 0x26000>;
-			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
-			interrupt-names = "periph_irq";
-			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
-			qcom,ee = <0>;
-			qcom,channel = <0>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			interrupt-controller;
-			#interrupt-cells = <4>;
 		};
 
-		tlmm: pinctrl@f100000 {
-			compatible = "qcom,sc7280-pinctrl";
-			reg = <0 0x0f100000 0 0x300000>;
-			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
-			gpio-controller;
-			#gpio-cells = <2>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			gpio-ranges = <&tlmm 0 0 175>;
-			wakeup-parent = <&pdc>;
+		qspi_opp_table: qspi-opp-table {
+			compatible = "operating-points-v2";
 
-			qup_uart5_default: qup-uart5-default {
-				pins = "gpio46", "gpio47";
-				function = "qup13";
+			opp-75000000 {
+				opp-hz = /bits/ 64 <75000000>;
+				required-opps = <&rpmhpd_opp_low_svs>;
 			};
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
 		};
 
 		apps_smmu: iommu@15000000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

