Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEF0B39BA5A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 15:55:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231217AbhFDN5P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 09:57:15 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:41836 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231185AbhFDN5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 09:57:13 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 04 Jun 2021 06:55:27 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Jun 2021 06:55:25 -0700
X-QCInternal: smtphost
Received: from c-rojay-linux.qualcomm.com ([10.206.21.80])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Jun 2021 19:25:13 +0530
Received: by c-rojay-linux.qualcomm.com (Postfix, from userid 88981)
        id 632523308; Fri,  4 Jun 2021 19:25:11 +0530 (IST)
From:   Roja Rani Yarubandi <rojay@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: [PATCH V3 3/3] arm64: dts: sc7280: Add QUPv3 wrapper_1 nodes
Date:   Fri,  4 Jun 2021 19:24:39 +0530
Message-Id: <20210604135439.19119-4-rojay@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210604135439.19119-1-rojay@codeaurora.org>
References: <20210604135439.19119-1-rojay@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add QUPv3 wrapper_1 DT nodes for SC7280 SoC.

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

 arch/arm64/boot/dts/qcom/sc7280-idp.dts |   4 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi    | 751 ++++++++++++++++++++++++
 2 files changed, 755 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index f57458dbe763..bdea9bf4eeca 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -288,6 +288,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &uart5 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index b783f5622a66..348a34f3448e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -881,6 +881,437 @@ uart7: serial@99c000 {
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
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex", "syscon";
 			reg = <0 0x01f40000 0 0x40000>;
@@ -1714,6 +2145,46 @@ qup_i2c7_data_clk:qup-i2c7-data-clk {
 				function = "qup07";
 			};
 
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
 			qup_spi0_data_clk: qup-spi0-data-clk {
 				pins = "gpio0", "gpio1", "gpio2";
 				function = "qup00";
@@ -1834,6 +2305,126 @@ qup_spi7_cs_gpio: qup-spi7-cs_gpio {
 				function = "gpio";
 			};
 
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
 			qup_uart0_cts: qup-uart0-cts {
 				pins = "gpio0";
 				function = "qup00";
@@ -1993,6 +2584,166 @@ qup_uart7_rx: qup-uart7-rx {
 				pins = "gpio31";
 				function = "qup07";
 			};
+
+			qup_uart8_cts: qup-uart8-cts {
+				pins = "gpio32";
+				function = "qup08";
+			};
+
+			qup_uart8_rts: qup-uart8-rts {
+				pins = "gpio33";
+				function = "qup08";
+			};
+
+			qup_uart8_tx: qup-uart8-tx {
+				pins = "gpio34";
+				function = "qup08";
+			};
+
+			qup_uart8_rx: qup-uart8-rx {
+				pins = "gpio35";
+				function = "qup08";
+			};
+
+			qup_uart9_cts: qup-uart9-cts {
+				pins = "gpio36";
+				function = "qup09";
+			};
+
+			qup_uart9_rts: qup-uart9-rts {
+				pins = "gpio37";
+				function = "qup09";
+			};
+
+			qup_uart9_tx: qup-uart9-tx {
+				pins = "gpio38";
+				function = "qup09";
+			};
+
+			qup_uart9_rx: qup-uart9-rx {
+				pins = "gpio39";
+				function = "qup09";
+			};
+
+			qup_uart10_cts: qup-uart10-cts {
+				pins = "gpio40";
+				function = "qup10";
+			};
+
+			qup_uart10_rts: qup-uart10-rts {
+				pins = "gpio41";
+				function = "qup10";
+			};
+
+			qup_uart10_tx: qup-uart10-tx {
+				pins = "gpio42";
+				function = "qup10";
+			};
+
+			qup_uart10_rx: qup-uart10-rx {
+				pins = "gpio43";
+				function = "qup10";
+			};
+
+			qup_uart11_cts: qup-uart11-cts {
+				pins = "gpio44";
+				function = "qup11";
+			};
+
+			qup_uart11_rts: qup-uart11-rts {
+				pins = "gpio45";
+				function = "qup11";
+			};
+
+			qup_uart11_tx: qup-uart11-tx {
+				pins = "gpio46";
+				function = "qup11";
+			};
+
+			qup_uart11_rx: qup-uart11-rx {
+				pins = "gpio47";
+				function = "qup11";
+			};
+
+			qup_uart12_cts: qup-uart12-cts {
+				pins = "gpio48";
+				function = "qup12";
+			};
+
+			qup_uart12_rts: qup-uart12-rts {
+				pins = "gpio49";
+				function = "qup12";
+			};
+
+			qup_uart12_tx: qup-uart12-tx {
+				pins = "gpio50";
+				function = "qup12";
+			};
+
+			qup_uart12_rx: qup-uart12-rx {
+				pins = "gpio51";
+				function = "qup12";
+			};
+
+			qup_uart13_cts: qup-uart13-cts {
+				pins = "gpio52";
+				function = "qup13";
+			};
+
+			qup_uart13_rts: qup-uart13-rts {
+				pins = "gpio53";
+				function = "qup13";
+			};
+
+			qup_uart13_tx: qup-uart13-tx {
+				pins = "gpio54";
+				function = "qup13";
+			};
+
+			qup_uart13_rx: qup-uart13-rx {
+				pins = "gpio55";
+				function = "qup13";
+			};
+
+			qup_uart14_cts: qup-uart14-cts {
+				pins = "gpio56";
+				function = "qup14";
+			};
+
+			qup_uart14_rts: qup-uart14-rts {
+				pins = "gpio57";
+				function = "qup14";
+			};
+
+			qup_uart14_tx: qup-uart14-tx {
+				pins = "gpio58";
+				function = "qup14";
+			};
+
+			qup_uart14_rx: qup-uart14-rx {
+				pins = "gpio59";
+				function = "qup14";
+			};
+
+			qup_uart15_cts: qup-uart15-cts {
+				pins = "gpio60";
+				function = "qup15";
+			};
+
+			qup_uart15_rts: qup-uart15-rts {
+				pins = "gpio61";
+				function = "qup15";
+			};
+
+			qup_uart15_tx: qup-uart15-tx {
+				pins = "gpio62";
+				function = "qup15";
+			};
+
+			qup_uart15_rx: qup-uart15-rx {
+				pins = "gpio63";
+				function = "qup15";
+			};
 		};
 
 		apps_smmu: iommu@15000000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

