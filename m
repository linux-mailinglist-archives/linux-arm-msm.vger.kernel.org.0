Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0333FA5DF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Aug 2021 15:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234496AbhH1NTb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Aug 2021 09:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234417AbhH1NTW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Aug 2021 09:19:22 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62BEC0617A8;
        Sat, 28 Aug 2021 06:18:31 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.105.neoplus.adsl.tpnet.pl [83.6.168.105])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 47ED7201A1;
        Sat, 28 Aug 2021 15:18:29 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Hector Martin <marcan@marcan.st>,
        Vinod Koul <vkoul@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 07/18] arm64: dts: qcom: sm6350: Add USB1 nodes
Date:   Sat, 28 Aug 2021 15:18:02 +0200
Message-Id: <20210828131814.29589-7-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210828131814.29589-1-konrad.dybcio@somainline.org>
References: <20210828131814.29589-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add nodes required for USB1 to function. SM6350 (thankfully) resuses SDM845 and
SC7180 IP, so no additional code porting is required.

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 101 +++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 03f7601457b4..ee28c7cbab81 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -390,12 +390,113 @@ tcsr_mutex: hwlock@1f40000 {
 			#hwlock-cells = <1>;
 		};
 
+		usb_1_hsphy: phy@88e3000 {
+			compatible = "qcom,sm6350-qusb2-phy", "qcom,qusb2-v2-phy";
+			reg = <0 0x088e3000 0 0x400>;
+			status = "disabled";
+			#phy-cells = <0>;
+
+			clocks = <&xo_board>, <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+		};
+
+		usb_1_qmpphy: phy@88e9000 {
+			compatible = "qcom,sc7180-qmp-usb3-dp-phy";
+			reg = <0 0x088e9000 0 0x200>,
+			      <0 0x088e8000 0 0x40>,
+			      <0 0x088ea000 0 0x200>;
+			status = "disabled";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_QLINK_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&xo_board>;
+			clock-names = "aux", "ref", "com_aux", "cfg_ahb";
+
+			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
+			reset-names = "phy", "common";
+
+			usb_1_ssphy: usb3-phy@88e9200 {
+				reg = <0 0x088e9200 0 0x200>,
+				      <0 0x088e9400 0 0x200>,
+				      <0 0x088e9c00 0 0x400>,
+				      <0 0x088e9600 0 0x200>,
+				      <0 0x088e9800 0 0x200>,
+				      <0 0x088e9a00 0 0x100>;
+				#clock-cells = <0>;
+				#phy-cells = <0>;
+				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "usb3_phy_pipe_clk_src";
+			};
+
+			dp_phy: dp-phy@88ea200 {
+				reg = <0 0x088ea200 0 0x200>,
+				      <0 0x088ea400 0 0x200>,
+				      <0 0x088eac00 0 0x400>,
+				      <0 0x088ea600 0 0x200>,
+				      <0 0x088ea800 0 0x200>,
+				      <0 0x088eaa00 0 0x100>;
+				#phy-cells = <0>;
+				#clock-cells = <1>;
+				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+				clock-names = "pipe0";
+				clock-output-names = "usb3_phy_pipe_clk_src";
+			};
+		};
+
 		system-cache-controller@9200000 {
 			compatible = "qcom,sm6350-llcc";
 			reg = <0 0x09200000 0 0x50000>, <0 0x09600000 0 0x50000>;
 			reg-names = "llcc_base", "llcc_broadcast_base";
 		};
 
+		usb_1: usb@a6f8800 {
+			compatible = "qcom,sm6350-dwc3", "qcom,dwc3";
+			reg = <0 0x0a6f8800 0 0x400>;
+			status = "disabled";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>;
+			clock-names = "cfg_noc", "core", "iface", "mock_utmi",
+				      "sleep";
+
+			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
+					  "dm_hs_phy_irq", "ss_phy_irq";
+
+			power-domains = <&gcc USB30_PRIM_GDSC>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			usb_1_dwc3: dwc3@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a600000 0 0xcd00>;
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				snps,has-lpm-erratum;
+				snps,hird-threshold = /bits/ 8 <0x10>;
+				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm6350-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>, <0 0x17c000f0 0 0x64>;
-- 
2.33.0

