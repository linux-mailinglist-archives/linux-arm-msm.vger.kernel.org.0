Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCBD30FC8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 20:23:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238151AbhBDTXG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 14:23:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:56734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237283AbhBDRKY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 12:10:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99BB364F6D;
        Thu,  4 Feb 2021 17:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612458562;
        bh=JHXhqbqCdX1AcnYGavX78IW4Dm7s48Mg0Wmfyr7XqVs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hCS1hZtbIfeIDsYGrg6Pmm4EbC+8SHIbMC5EQaNMjuLSpTJlWJZK0F30piYRAJ7fs
         kW5QDZb1LY2tWShPh9wwujR8zAN7rWayjOzWfTtRY078UConuMDMGNjNEodLX1c8Sg
         9CGmEWRDK893CYUTjwuAcksruhwuz43dWE9oqOktR2o9bBYtmPUdUvTGME4jzT3g65
         ShlaCUD9Z09S4M3L09bwZueI3ircSGtS77ixyqSmgiUfop/xydfWH5Ain5PsdH2VT0
         6d0RGLUnKD01k7DKpGq+7ys701sCPMIE9D5BUGQp0Y362iApTnv2LF7aRwj4YOtaJn
         w1H2nQDNjOHSQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Jack Pham <jackp@codeaurora.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/6] arm64: dts: qcom: sm8350: add USB and PHY device nodes
Date:   Thu,  4 Feb 2021 22:39:03 +0530
Message-Id: <20210204170907.63545-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210204170907.63545-1-vkoul@kernel.org>
References: <20210204170907.63545-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jack Pham <jackp@codeaurora.org>

Add device nodes for the two instances each of USB3 controllers,
QMP SS PHYs and SNPS HS PHYs.

Signed-off-by: Jack Pham <jackp@codeaurora.org>
Message-Id: <20210116013802.1609-2-jackp@codeaurora.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 179 +++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index e3597e2a22ab..e51d9ca0210c 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -592,6 +592,185 @@ rpmhcc: clock-controller {
 			};
 
 		};
+
+		usb_1_hsphy: phy@88e3000 {
+			compatible = "qcom,sm8350-usb-hs-phy",
+				     "qcom,usb-snps-hs-7nm-phy";
+			reg = <0 0x088e3000 0 0x400>;
+			status = "disabled";
+			#phy-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc 20>;
+		};
+
+		usb_2_hsphy: phy@88e4000 {
+			compatible = "qcom,sm8250-usb-hs-phy",
+				     "qcom,usb-snps-hs-7nm-phy";
+			reg = <0 0x088e4000 0 0x400>;
+			status = "disabled";
+			#phy-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc 21>;
+		};
+
+		usb_1_qmpphy: phy-wrapper@88e9000 {
+			compatible = "qcom,sm8350-qmp-usb3-phy";
+			reg = <0 0x088e9000 0 0x200>,
+			      <0 0x088e8000 0 0x20>;
+			reg-names = "reg-base", "dp_com";
+			status = "disabled";
+			#clock-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc 187>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc 189>;
+			clock-names = "aux", "ref_clk_src", "com_aux";
+
+			resets = <&gcc 28>,
+				 <&gcc 30>;
+			reset-names = "phy", "common";
+
+			usb_1_ssphy: phy@88e9200 {
+				reg = <0 0x088e9200 0 0x200>,
+				      <0 0x088e9400 0 0x200>,
+				      <0 0x088e9c00 0 0x400>,
+				      <0 0x088e9600 0 0x200>,
+				      <0 0x088e9800 0 0x200>,
+				      <0 0x088e9a00 0 0x100>;
+				#phy-cells = <0>;
+				#clock-cells = <1>;
+				clocks = <&gcc 190>;
+				clock-names = "pipe0";
+				clock-output-names = "usb3_phy_pipe_clk_src";
+			};
+		};
+
+		usb_2_qmpphy: phy-wrapper@88eb000 {
+			compatible = "qcom,sm8350-qmp-usb3-uni-phy";
+			reg = <0 0x088eb000 0 0x200>;
+			status = "disabled";
+			#clock-cells = <1>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc 193>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc 192>,
+				 <&gcc 195>;
+			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
+
+			resets = <&gcc 33>,
+				 <&gcc 31>;
+			reset-names = "phy", "common";
+
+			usb_2_ssphy: phy@88ebe00 {
+				reg = <0 0x088ebe00 0 0x200>,
+				      <0 0x088ec000 0 0x200>,
+				      <0 0x088eb200 0 0x1100>;
+				#phy-cells = <0>;
+				#clock-cells = <1>;
+				clocks = <&gcc 196>;
+				clock-names = "pipe0";
+				clock-output-names = "usb3_uni_phy_pipe_clk_src";
+			};
+		};
+
+		usb_1: usb@a6f8800 {
+			compatible = "qcom,sm8350-dwc3", "qcom,dwc3";
+			reg = <0 0x0a6f8800 0 0x400>;
+			status = "disabled";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc 23>,
+				 <&gcc 173>,
+				 <&gcc 18>,
+				 <&gcc 176>,
+				 <&gcc 179>;
+			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
+				      "sleep";
+
+			assigned-clocks = <&gcc 176>,
+					  <&gcc 173>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
+					  "dm_hs_phy_irq", "ss_phy_irq";
+
+			power-domains = <&gcc 4>;
+
+			resets = <&gcc 26>;
+
+			usb_1_dwc3: dwc3@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a600000 0 0xcd00>;
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0x0 0x0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
+
+		usb_2: usb@a8f8800 {
+			compatible = "qcom,sm8350-dwc3", "qcom,dwc3";
+			reg = <0 0x0a8f8800 0 0x400>;
+			status = "disabled";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc 24>,
+				 <&gcc 180>,
+				 <&gcc 19>,
+				 <&gcc 183>,
+				 <&gcc 186>,
+				 <&gcc 192>;
+			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
+				      "sleep", "xo";
+
+			assigned-clocks = <&gcc 183>,
+					  <&gcc 180>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
+					  "dm_hs_phy_irq", "ss_phy_irq";
+
+			power-domains = <&gcc 5>;
+
+			resets = <&gcc 27>;
+
+			usb_2_dwc3: dwc3@a800000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a800000 0 0xcd00>;
+				interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0x20 0x0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				phys = <&usb_2_hsphy>, <&usb_2_ssphy>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
 	};
 
 	timer {
-- 
2.26.2

