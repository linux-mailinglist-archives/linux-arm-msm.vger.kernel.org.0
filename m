Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF30B3D989D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233179AbhG1W0p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:26:45 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:42991 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232972AbhG1W00 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:26:26 -0400
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 38CB820045;
        Thu, 29 Jul 2021 00:26:21 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 27/39] arm64: dts: qcom: sdm630: Configure the camera subsystem
Date:   Thu, 29 Jul 2021 00:25:30 +0200
Message-Id: <20210728222542.54269-28-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Add nodes for camss, cci and its pinctrl in order to bring up
camera functionality.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 215 +++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 5b31b594e787..1247140b6ac1 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1032,6 +1032,32 @@ i2c8_sleep: i2c8-sleep {
 				bias-pull-up;
 			};
 
+			cci0_default: cci0_default {
+				pinmux {
+					pins = "gpio36","gpio37";
+					function = "cci_i2c";
+				};
+
+				pinconf {
+					pins = "gpio36","gpio37";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
+			cci1_default: cci1_default {
+				pinmux {
+					pins = "gpio38","gpio39";
+					function = "cci_i2c";
+				};
+
+				pinconf {
+					pins = "gpio38","gpio39";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+
 			sdc1_state_on: sdc1-on {
 				clk {
 					pins = "sdc1_clk";
@@ -1938,6 +1964,195 @@ pil-reloc@94c {
 			};
 		};
 
+		camss: camss@ca00000 {
+			compatible = "qcom,sdm660-camss";
+			reg = <0x0c824000 0x1000>,
+			      <0x0ca00120 0x4>,
+			      <0x0c825000 0x1000>,
+			      <0x0ca00124 0x4>,
+			      <0x0c826000 0x1000>,
+			      <0x0ca00128 0x4>,
+			      <0x0ca30000 0x100>,
+			      <0x0ca30400 0x100>,
+			      <0x0ca30800 0x100>,
+			      <0x0ca30c00 0x100>,
+			      <0x0ca31000 0x500>,
+			      <0x0ca00020 0x10>,
+			      <0x0ca10000 0x1000>,
+			      <0x0ca14000 0x1000>;
+			reg-names = "csiphy0",
+				    "csiphy0_clk_mux",
+				    "csiphy1",
+				    "csiphy1_clk_mux",
+				    "csiphy2",
+				    "csiphy2_clk_mux",
+				    "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid3",
+				    "ispif",
+				    "csi_clk_mux",
+				    "vfe0",
+				    "vfe1";
+			interrupts = <GIC_SPI 78 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 79 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 314 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 315 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid3",
+					  "ispif",
+					  "vfe0",
+					  "vfe1";
+			clocks = <&mmcc CAMSS_TOP_AHB_CLK>,
+				<&mmcc THROTTLE_CAMSS_AXI_CLK>,
+				<&mmcc CAMSS_ISPIF_AHB_CLK>,
+				<&mmcc CAMSS_CSI0PHYTIMER_CLK>,
+				<&mmcc CAMSS_CSI1PHYTIMER_CLK>,
+				<&mmcc CAMSS_CSI2PHYTIMER_CLK>,
+				<&mmcc CAMSS_CSI0_AHB_CLK>,
+				<&mmcc CAMSS_CSI0_CLK>,
+				<&mmcc CAMSS_CPHY_CSID0_CLK>,
+				<&mmcc CAMSS_CSI0PIX_CLK>,
+				<&mmcc CAMSS_CSI0RDI_CLK>,
+				<&mmcc CAMSS_CSI1_AHB_CLK>,
+				<&mmcc CAMSS_CSI1_CLK>,
+				<&mmcc CAMSS_CPHY_CSID1_CLK>,
+				<&mmcc CAMSS_CSI1PIX_CLK>,
+				<&mmcc CAMSS_CSI1RDI_CLK>,
+				<&mmcc CAMSS_CSI2_AHB_CLK>,
+				<&mmcc CAMSS_CSI2_CLK>,
+				<&mmcc CAMSS_CPHY_CSID2_CLK>,
+				<&mmcc CAMSS_CSI2PIX_CLK>,
+				<&mmcc CAMSS_CSI2RDI_CLK>,
+				<&mmcc CAMSS_CSI3_AHB_CLK>,
+				<&mmcc CAMSS_CSI3_CLK>,
+				<&mmcc CAMSS_CPHY_CSID3_CLK>,
+				<&mmcc CAMSS_CSI3PIX_CLK>,
+				<&mmcc CAMSS_CSI3RDI_CLK>,
+				<&mmcc CAMSS_AHB_CLK>,
+				<&mmcc CAMSS_VFE0_CLK>,
+				<&mmcc CAMSS_CSI_VFE0_CLK>,
+				<&mmcc CAMSS_VFE0_AHB_CLK>,
+				<&mmcc CAMSS_VFE0_STREAM_CLK>,
+				<&mmcc CAMSS_VFE1_CLK>,
+				<&mmcc CAMSS_CSI_VFE1_CLK>,
+				<&mmcc CAMSS_VFE1_AHB_CLK>,
+				<&mmcc CAMSS_VFE1_STREAM_CLK>,
+				<&mmcc CAMSS_VFE_VBIF_AHB_CLK>,
+				<&mmcc CAMSS_VFE_VBIF_AXI_CLK>,
+				<&mmcc CSIPHY_AHB2CRIF_CLK>,
+				<&mmcc CAMSS_CPHY_CSID0_CLK>,
+				<&mmcc CAMSS_CPHY_CSID1_CLK>,
+				<&mmcc CAMSS_CPHY_CSID2_CLK>,
+				<&mmcc CAMSS_CPHY_CSID3_CLK>;
+			clock-names = "top_ahb",
+				"throttle_axi",
+				"ispif_ahb",
+				"csiphy0_timer",
+				"csiphy1_timer",
+				"csiphy2_timer",
+				"csi0_ahb",
+				"csi0",
+				"csi0_phy",
+				"csi0_pix",
+				"csi0_rdi",
+				"csi1_ahb",
+				"csi1",
+				"csi1_phy",
+				"csi1_pix",
+				"csi1_rdi",
+				"csi2_ahb",
+				"csi2",
+				"csi2_phy",
+				"csi2_pix",
+				"csi2_rdi",
+				"csi3_ahb",
+				"csi3",
+				"csi3_phy",
+				"csi3_pix",
+				"csi3_rdi",
+				"ahb",
+				"vfe0",
+				"csi_vfe0",
+				"vfe0_ahb",
+				"vfe0_stream",
+				"vfe1",
+				"csi_vfe1",
+				"vfe1_ahb",
+				"vfe1_stream",
+				"vfe_ahb",
+				"vfe_axi",
+				"csiphy_ahb2crif",
+				"cphy_csid0",
+				"cphy_csid1",
+				"cphy_csid2",
+				"cphy_csid3";
+			interconnects = <&mnoc 5 &bimc 5>;
+			interconnect-names = "vfe-mem";
+			iommus = <&mmss_smmu 0xc00>,
+				 <&mmss_smmu 0xc01>,
+				 <&mmss_smmu 0xc02>,
+				 <&mmss_smmu 0xc03>;
+			power-domains = <&mmcc CAMSS_VFE0_GDSC>,
+					<&mmcc CAMSS_VFE1_GDSC>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci: cci@ca0c000 {
+			compatible = "qcom,msm8996-cci";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0ca0c000 0x1000>;
+			interrupts = <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>;
+
+			assigned-clocks = <&mmcc CAMSS_CCI_AHB_CLK>,
+					  <&mmcc CAMSS_CCI_CLK>;
+			assigned-clock-rates = <80800000>, <37500000>;
+			clocks = <&mmcc CAMSS_TOP_AHB_CLK>,
+				 <&mmcc CAMSS_CCI_AHB_CLK>,
+				 <&mmcc CAMSS_CCI_CLK>,
+				 <&mmcc CAMSS_AHB_CLK>;
+			clock-names = "camss_top_ahb",
+				      "cci_ahb",
+				      "cci",
+				      "camss_ahb";
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&cci0_default &cci1_default>;
+			power-domains = <&mmcc CAMSS_TOP_GDSC>;
+			status = "disabled";
+
+			cci_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		mmss_smmu: iommu@cd00000 {
 			compatible = "qcom,sdm630-smmu-v2", "qcom,smmu-v2";
 			reg = <0x0cd00000 0x40000>;
-- 
2.32.0

