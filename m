Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D115319DBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 12:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230204AbhBLL7D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 06:59:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:48108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230353AbhBLL5o (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 06:57:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C68764E92;
        Fri, 12 Feb 2021 11:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613130959;
        bh=1zM+YAaUNx/tKQm4lACoXEGNavAL6zvyw26UsWjD0F0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=edACfUbmQyhI0AueB7TdhmlRYYLqqMUzRESc/PWs43BxSBJbsRfb6Yc9VJulYcZqF
         swaRicg8XNqSwt5W+SWwS63WmSCsKZvD1ZzVMMNPqFotPJSQI9QXSjdb6ZuxeVNujl
         UbIIAH+c+lmYJ9Ov74gxl76xiPBLcfecClgJBKwfIQJtxM266LrAgQqY84wcjeKfJk
         3pthorP0li0fYH6BE8zOFylmtP8+ViCp7AcJ5621Ggpg8Fx5fTW5t2V86ZHGctz6ug
         YLrAet6X1GNmB2S/s/u3/tlDwNZsnBs1yI1kQ9POWWgzq68OVk2XLnKiD+h+YU4r4X
         p/kheuOA/IslQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: qcom: sm8350: Use enums for GCC
Date:   Fri, 12 Feb 2021 17:25:32 +0530
Message-Id: <20210212115532.1339942-8-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210212115532.1339942-1-vkoul@kernel.org>
References: <20210212115532.1339942-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that we have GCC define, use the enums instead of numbers in the DTS

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 91 ++++++++++++++--------------
 1 file changed, 46 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 6e366653eeab..d19ed7b5aae0 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-aoss-qmp.h>
@@ -430,8 +431,8 @@ qupv3_id_1: geniqup@9c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x009c0000 0x0 0x6000>;
 			clock-names = "m-ahb", "s-ahb";
-			clocks = <&gcc 121>,
-				 <&gcc 122>;
+			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -441,7 +442,7 @@ uart2: serial@98c000 {
 				compatible = "qcom,geni-debug-uart";
 				reg = <0 0x0098c000 0 0x4000>;
 				clock-names = "se";
-				clocks = <&gcc 83>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&qup_uart3_default_state>;
 				interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
@@ -797,10 +798,10 @@ ufs_mem_hc: ufshc@1d84000 {
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
-			resets = <&gcc 25>;
+			resets = <&gcc GCC_UFS_PHY_BCR>;
 			reset-names = "rst";
 
-			power-domains = <&gcc 3>;
+			power-domains = <&gcc UFS_PHY_GDSC>;
 
 			iommus = <&apps_smmu 0xe0 0x0>;
 
@@ -816,14 +817,14 @@ ufs_mem_hc: ufshc@1d84000 {
 				"rx_lane1_sync_clk";
 			clocks =
 				<&rpmhcc RPMH_CXO_CLK>,
-				<&gcc 155>,
-				<&gcc 16>,
-				<&gcc 154>,
-				<&gcc 170>,
+				<&gcc GCC_UFS_PHY_AXI_CLK>,
+				<&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				<&gcc GCC_UFS_PHY_AHB_CLK>,
+				<&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
 				<&rpmhcc RPMH_CXO_CLK>,
-				<&gcc 168>,
-				<&gcc 164>,
-				<&gcc 166>;
+				<&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				<&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
 			freq-table-hz =
 				<75000000 300000000>,
 				<75000000 300000000>,
@@ -847,7 +848,7 @@ ufs_mem_phy: phy@1d87000 {
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc 161>;
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
 
 			resets = <&ufs_mem_hc 0>;
 			reset-names = "ufsphy";
@@ -953,7 +954,7 @@ usb_1_hsphy: phy@88e3000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "ref";
 
-			resets = <&gcc 20>;
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
 		};
 
 		usb_2_hsphy: phy@88e4000 {
@@ -966,7 +967,7 @@ usb_2_hsphy: phy@88e4000 {
 			clocks = <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "ref";
 
-			resets = <&gcc 21>;
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
 		};
 
 		usb_1_qmpphy: phy-wrapper@88e9000 {
@@ -980,13 +981,13 @@ usb_1_qmpphy: phy-wrapper@88e9000 {
 			#size-cells = <2>;
 			ranges;
 
-			clocks = <&gcc 187>,
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc 189>;
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
 			clock-names = "aux", "ref_clk_src", "com_aux";
 
-			resets = <&gcc 28>,
-				 <&gcc 30>;
+			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
 			reset-names = "phy", "common";
 
 			usb_1_ssphy: phy@88e9200 {
@@ -998,7 +999,7 @@ usb_1_ssphy: phy@88e9200 {
 				      <0 0x088e9a00 0 0x100>;
 				#phy-cells = <0>;
 				#clock-cells = <1>;
-				clocks = <&gcc 190>;
+				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
 				clock-names = "pipe0";
 				clock-output-names = "usb3_phy_pipe_clk_src";
 			};
@@ -1013,14 +1014,14 @@ usb_2_qmpphy: phy-wrapper@88eb000 {
 			#size-cells = <2>;
 			ranges;
 
-			clocks = <&gcc 193>,
+			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
-				 <&gcc 192>,
-				 <&gcc 195>;
+				 <&gcc GCC_USB3_SEC_CLKREF_EN>,
+				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
 			clock-names = "aux", "ref_clk_src", "ref", "com_aux";
 
-			resets = <&gcc 33>,
-				 <&gcc 31>;
+			resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
+				 <&gcc GCC_USB3_PHY_SEC_BCR>;
 			reset-names = "phy", "common";
 
 			usb_2_ssphy: phy@88ebe00 {
@@ -1029,7 +1030,7 @@ usb_2_ssphy: phy@88ebe00 {
 				      <0 0x088eb200 0 0x1100>;
 				#phy-cells = <0>;
 				#clock-cells = <1>;
-				clocks = <&gcc 196>;
+				clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
 				clock-names = "pipe0";
 				clock-output-names = "usb3_uni_phy_pipe_clk_src";
 			};
@@ -1043,16 +1044,16 @@ usb_1: usb@a6f8800 {
 			#size-cells = <2>;
 			ranges;
 
-			clocks = <&gcc 23>,
-				 <&gcc 173>,
-				 <&gcc 18>,
-				 <&gcc 176>,
-				 <&gcc 179>;
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
 			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
 				      "sleep";
 
-			assigned-clocks = <&gcc 176>,
-					  <&gcc 173>;
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
 			interrupts-extended = <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
@@ -1062,9 +1063,9 @@ usb_1: usb@a6f8800 {
 			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
 					  "dm_hs_phy_irq", "ss_phy_irq";
 
-			power-domains = <&gcc 4>;
+			power-domains = <&gcc USB30_PRIM_GDSC>;
 
-			resets = <&gcc 26>;
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
 			usb_1_dwc3: dwc3@a600000 {
 				compatible = "snps,dwc3";
@@ -1086,17 +1087,17 @@ usb_2: usb@a8f8800 {
 			#size-cells = <2>;
 			ranges;
 
-			clocks = <&gcc 24>,
-				 <&gcc 180>,
-				 <&gcc 19>,
-				 <&gcc 183>,
-				 <&gcc 186>,
-				 <&gcc 192>;
+			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
+				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
+				 <&gcc GCC_USB3_SEC_CLKREF_EN>;
 			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
 				      "sleep", "xo";
 
-			assigned-clocks = <&gcc 183>,
-					  <&gcc 180>;
+			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
 			interrupts-extended = <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
@@ -1106,9 +1107,9 @@ usb_2: usb@a8f8800 {
 			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
 					  "dm_hs_phy_irq", "ss_phy_irq";
 
-			power-domains = <&gcc 5>;
+			power-domains = <&gcc USB30_SEC_GDSC>;
 
-			resets = <&gcc 27>;
+			resets = <&gcc GCC_USB30_SEC_BCR>;
 
 			usb_2_dwc3: dwc3@a800000 {
 				compatible = "snps,dwc3";
-- 
2.26.2

