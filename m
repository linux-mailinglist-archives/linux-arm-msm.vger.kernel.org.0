Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4E93D5A92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 15:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233909AbhGZNCV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 09:02:21 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:52187 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234227AbhGZNBl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 09:01:41 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 26 Jul 2021 06:42:10 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 26 Jul 2021 06:42:08 -0700
X-QCInternal: smtphost
Received: from rajpat-linux.qualcomm.com ([10.206.21.0])
  by ironmsg02-blr.qualcomm.com with ESMTP; 26 Jul 2021 19:11:41 +0530
Received: by rajpat-linux.qualcomm.com (Postfix, from userid 2344945)
        id A0FA421255; Mon, 26 Jul 2021 19:11:40 +0530 (IST)
From:   Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajesh Patil <rajpat@codeaurora.org>
Subject: [PATCH V4 4/4] arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes
Date:   Mon, 26 Jul 2021 19:10:47 +0530
Message-Id: <1627306847-25308-5-git-send-email-rajpat@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Roja Rani Yarubandi <rojay@codeaurora.org>

Add QUPv3 wrapper_1 DT nodes for SC7280 SoC.

Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
---
Changes in V4:
 - Dropped interconnect votes for wrapper_1 node
 - Corrected QUP Wrapper_1 SE node's pin control functions like below
        QUP Wrapper_0: SE0-SE7 uses qup00 - qup07 pin-cntrl functions.
        QUP Wrapper_1: SE0-SE7 uses qup10 - qup17 pin-cntrl functions.

Changes in V3:
 - Broken the huge V2 patch into 3 smaller patches.
   1. QSPI DT nodes
   2. QUP wrapper_0 DT nodes
   3. QUP wrapper_1 DT nodes

Changes in V2:
 - As per Doug's comments removed pinmux/pinconf subnodes.
 - As per Doug's comments split of SPI, UART nodes has been done.
 - Moved QSPI node before aps_smmu as per the order.

 arch/arm64/boot/dts/qcom/sc7280-idp.dts |   4 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 749 ++++++++++++++++++++++++++++++++
 2 files changed, 753 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index a50c9e5..6695a97 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -315,6 +315,10 @@
 	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &uart5 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 951818f..54c0952 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -968,6 +968,435 @@
 			};
 		};
 
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
 		cnoc2: interconnect@1500000 {
 			reg = <0 0x01500000 0 0x1000>;
 			compatible = "qcom,sc7280-cnoc2";
@@ -2019,6 +2448,46 @@
 				function = "qup07";
 			};
 
+			qup_i2c8_data_clk:qup-i2c8-data-clk {
+				pins = "gpio32", "gpio33";
+				function = "qup10";
+			};
+
+			qup_i2c9_data_clk:qup-i2c9-data-clk {
+				pins = "gpio36", "gpio37";
+				function = "qup11";
+			};
+
+			qup_i2c10_data_clk:qup-i2c10-data-clk {
+				pins = "gpio40", "gpio41";
+				function = "qup12";
+			};
+
+			qup_i2c11_data_clk:qup-i2c11-data-clk {
+				pins = "gpio44", "gpio45";
+				function = "qup13";
+			};
+
+			qup_i2c12_data_clk:qup-i2c12-data-clk {
+				pins = "gpio48", "gpio49";
+				function = "qup14";
+			};
+
+			qup_i2c13_data_clk:qup-i2c13-data-clk {
+				pins = "gpio52", "gpio53";
+				function = "qup15";
+			};
+
+			qup_i2c14_data_clk:qup-i2c14-data-clk {
+				pins = "gpio56", "gpio57";
+				function = "qup16";
+			};
+
+			qup_i2c15_data_clk:qup-i2c15-data-clk {
+				pins = "gpio60", "gpio61";
+				function = "qup17";
+			};
+
 			qup_spi0_data_clk: qup-spi0-data-clk {
 				pins = "gpio0", "gpio1", "gpio2";
 				function = "qup00";
@@ -2139,6 +2608,126 @@
 				function = "gpio";
 			};
 
+			qup_spi8_data_clk: qup-spi8-data-clk {
+				pins = "gpio32", "gpio33", "gpio34";
+				function = "qup10";
+			};
+
+			qup_spi8_cs: qup-spi8-cs {
+				pins = "gpio35";
+				function = "qup10";
+			};
+
+			qup_spi8_cs_gpio: qup-spi8-cs_gpio {
+				pins = "gpio35";
+				function = "gpio";
+			};
+
+			qup_spi9_data_clk: qup-spi9-data-clk {
+				pins = "gpio36", "gpio37", "gpio38";
+				function = "qup11";
+			};
+
+			qup_spi9_cs: qup-spi9-cs {
+				pins = "gpio39";
+				function = "qup11";
+			};
+
+			qup_spi9_cs_gpio: qup-spi9-cs_gpio {
+				pins = "gpio39";
+				function = "gpio";
+			};
+
+			qup_spi10_data_clk: qup-spi10-data-clk {
+				pins = "gpio40", "gpio41", "gpio42";
+				function = "qup12";
+			};
+
+			qup_spi10_cs: qup-spi10-cs {
+				pins = "gpio43";
+				function = "qup12";
+			};
+
+			qup_spi10_cs_gpio: qup-spi10-cs_gpio {
+				pins = "gpio43";
+				function = "gpio";
+			};
+
+			qup_spi11_data_clk: qup-spi11-data-clk {
+				pins = "gpio44", "gpio45", "gpio46";
+				function = "qup13";
+			};
+
+			qup_spi11_cs: qup-spi11-cs {
+				pins = "gpio47";
+				function = "qup13";
+			};
+
+			qup_spi11_cs_gpio: qup-spi11-cs_gpio {
+				pins = "gpio47";
+				function = "gpio";
+			};
+
+			qup_spi12_data_clk: qup-spi12-data-clk {
+				pins = "gpio48", "gpio49", "gpio50";
+				function = "qup14";
+			};
+
+			qup_spi12_cs: qup-spi12-cs {
+				pins = "gpio51";
+				function = "qup14";
+			};
+
+			qup_spi12_cs_gpio: qup-spi12-cs_gpio {
+				pins = "gpio51";
+				function = "gpio";
+			};
+
+			qup_spi13_data_clk: qup-spi13-data-clk {
+				pins = "gpio52", "gpio53", "gpio54";
+				function = "qup15";
+			};
+
+			qup_spi13_cs: qup-spi13-cs {
+				pins = "gpio55";
+				function = "qup15";
+			};
+
+			qup_spi13_cs_gpio: qup-spi13-cs_gpio {
+				pins = "gpio55";
+				function = "gpio";
+			};
+
+			qup_spi14_data_clk: qup-spi14-data-clk {
+				pins = "gpio56", "gpio57", "gpio58";
+				function = "qup16";
+			};
+
+			qup_spi14_cs: qup-spi14-cs {
+				pins = "gpio59";
+				function = "qup16";
+			};
+
+			qup_spi14_cs_gpio: qup-spi14-cs_gpio {
+				pins = "gpio59";
+				function = "gpio";
+			};
+
+			qup_spi15_data_clk: qup-spi15-data-clk {
+				pins = "gpio60", "gpio61", "gpio62";
+				function = "qup17";
+			};
+
+			qup_spi15_cs: qup-spi15-cs {
+				pins = "gpio63";
+				function = "qup17";
+			};
+
+			qup_spi15_cs_gpio: qup-spi15-cs_gpio {
+				pins = "gpio63";
+				function = "gpio";
+			};
+
 			qup_uart0_cts: qup-uart0-cts {
 				pins = "gpio0";
 				function = "qup00";
@@ -2379,6 +2968,166 @@
 					bias-bus-hold;
 				};
 			};
+
+			qup_uart8_cts: qup-uart8-cts {
+				pins = "gpio32";
+				function = "qup10";
+			};
+
+			qup_uart8_rts: qup-uart8-rts {
+				pins = "gpio33";
+				function = "qup10";
+			};
+
+			qup_uart8_tx: qup-uart8-tx {
+				pins = "gpio34";
+				function = "qup10";
+			};
+
+			qup_uart8_rx: qup-uart8-rx {
+				pins = "gpio35";
+				function = "qup10";
+			};
+
+			qup_uart9_cts: qup-uart9-cts {
+				pins = "gpio36";
+				function = "qup11";
+			};
+
+			qup_uart9_rts: qup-uart9-rts {
+				pins = "gpio37";
+				function = "qup11";
+			};
+
+			qup_uart9_tx: qup-uart9-tx {
+				pins = "gpio38";
+				function = "qup11";
+			};
+
+			qup_uart9_rx: qup-uart9-rx {
+				pins = "gpio39";
+				function = "qup11";
+			};
+
+			qup_uart10_cts: qup-uart10-cts {
+				pins = "gpio40";
+				function = "qup12";
+			};
+
+			qup_uart10_rts: qup-uart10-rts {
+				pins = "gpio41";
+				function = "qup12";
+			};
+
+			qup_uart10_tx: qup-uart10-tx {
+				pins = "gpio42";
+				function = "qup12";
+			};
+
+			qup_uart10_rx: qup-uart10-rx {
+				pins = "gpio43";
+				function = "qup12";
+			};
+
+			qup_uart11_cts: qup-uart11-cts {
+				pins = "gpio44";
+				function = "qup13";
+			};
+
+			qup_uart11_rts: qup-uart11-rts {
+				pins = "gpio45";
+				function = "qup13";
+			};
+
+			qup_uart11_tx: qup-uart11-tx {
+				pins = "gpio46";
+				function = "qup13";
+			};
+
+			qup_uart11_rx: qup-uart11-rx {
+				pins = "gpio47";
+				function = "qup13";
+			};
+
+			qup_uart12_cts: qup-uart12-cts {
+				pins = "gpio48";
+				function = "qup14";
+			};
+
+			qup_uart12_rts: qup-uart12-rts {
+				pins = "gpio49";
+				function = "qup14";
+			};
+
+			qup_uart12_tx: qup-uart12-tx {
+				pins = "gpio50";
+				function = "qup14";
+			};
+
+			qup_uart12_rx: qup-uart12-rx {
+				pins = "gpio51";
+				function = "qup14";
+			};
+
+			qup_uart13_cts: qup-uart13-cts {
+				pins = "gpio52";
+				function = "qup15";
+			};
+
+			qup_uart13_rts: qup-uart13-rts {
+				pins = "gpio53";
+				function = "qup15";
+			};
+
+			qup_uart13_tx: qup-uart13-tx {
+				pins = "gpio54";
+				function = "qup15";
+			};
+
+			qup_uart13_rx: qup-uart13-rx {
+				pins = "gpio55";
+				function = "qup15";
+			};
+
+			qup_uart14_cts: qup-uart14-cts {
+				pins = "gpio56";
+				function = "qup16";
+			};
+
+			qup_uart14_rts: qup-uart14-rts {
+				pins = "gpio57";
+				function = "qup16";
+			};
+
+			qup_uart14_tx: qup-uart14-tx {
+				pins = "gpio58";
+				function = "qup16";
+			};
+
+			qup_uart14_rx: qup-uart14-rx {
+				pins = "gpio59";
+				function = "qup16";
+			};
+
+			qup_uart15_cts: qup-uart15-cts {
+				pins = "gpio60";
+				function = "qup17";
+			};
+
+			qup_uart15_rts: qup-uart15-rts {
+				pins = "gpio61";
+				function = "qup17";
+			};
+
+			qup_uart15_tx: qup-uart15-tx {
+				pins = "gpio62";
+				function = "qup17";
+			};
+
+			qup_uart15_rx: qup-uart15-rx {
+				pins = "gpio63";
+				function = "qup17";
+			};
 		};
 
 		apps_smmu: iommu@15000000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

