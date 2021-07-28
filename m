Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB563D98C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 00:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233476AbhG1W1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 18:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233902AbhG1W1X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 18:27:23 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68FE7C0613CF;
        Wed, 28 Jul 2021 15:26:24 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.174.neoplus.adsl.tpnet.pl [83.6.168.174])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 5C5772004C;
        Thu, 29 Jul 2021 00:26:22 +0200 (CEST)
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
Subject: [PATCH 28/39] arm64: dts: qcom: sdm660: Add required nodes for DSI1
Date:   Thu, 29 Jul 2021 00:25:31 +0200
Message-Id: <20210728222542.54269-29-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210728222542.54269-1-konrad.dybcio@somainline.org>
References: <20210728222542.54269-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure the second DSI host/phy and account for them in
the mmcc node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sdm660.dtsi | 101 +++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm660.dtsi b/arch/arm64/boot/dts/qcom/sdm660.dtsi
index 13467e2c708a..eccf6fde16b4 100644
--- a/arch/arm64/boot/dts/qcom/sdm660.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm660.dtsi
@@ -141,12 +141,105 @@ &gpucc {
 	compatible = "qcom,gpucc-sdm660";
 };
 
+&mdp {
+	ports {
+		port@1 {
+			reg = <1>;
+			mdp5_intf2_out: endpoint {
+				remote-endpoint = <&dsi1_in>;
+			};
+		};
+	};
+};
+
+&mdss {
+	dsi1: dsi@c996000 {
+		compatible = "qcom,mdss-dsi-ctrl";
+		reg = <0x0c996000 0x400>;
+		reg-names = "dsi_ctrl";
+
+		/* DSI1 shares the OPP table with DSI0 */
+		operating-points-v2 = <&dsi_opp_table>;
+		power-domains = <&rpmpd SDM660_VDDCX>;
+
+		interrupt-parent = <&mdss>;
+		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+
+		assigned-clocks = <&mmcc BYTE1_CLK_SRC>,
+					<&mmcc PCLK1_CLK_SRC>;
+		assigned-clock-parents = <&dsi1_phy 0>,
+						<&dsi1_phy 1>;
+
+		clocks = <&mmcc MDSS_MDP_CLK>,
+				<&mmcc MDSS_BYTE1_CLK>,
+				<&mmcc MDSS_BYTE1_INTF_CLK>,
+				<&mmcc MNOC_AHB_CLK>,
+				<&mmcc MDSS_AHB_CLK>,
+				<&mmcc MDSS_AXI_CLK>,
+				<&mmcc MISC_AHB_CLK>,
+				<&mmcc MDSS_PCLK1_CLK>,
+				<&mmcc MDSS_ESC1_CLK>;
+		clock-names = "mdp_core",
+					"byte",
+					"byte_intf",
+					"mnoc",
+					"iface",
+					"bus",
+					"core_mmss",
+					"pixel",
+					"core";
+
+		phys = <&dsi1_phy>;
+		phy-names = "dsi";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dsi1_in: endpoint {
+					remote-endpoint = <&mdp5_intf2_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dsi1_out: endpoint {
+				};
+			};
+		};
+	};
+
+	dsi1_phy: dsi-phy@c996400 {
+		compatible = "qcom,dsi-phy-14nm-660";
+		reg = <0x0c996400 0x100>,
+				<0x0c996500 0x300>,
+				<0x0c996800 0x188>;
+		reg-names = "dsi_phy",
+				"dsi_phy_lane",
+				"dsi_pll";
+
+		#clock-cells = <1>;
+		#phy-cells = <0>;
+
+		clocks = <&mmcc MDSS_AHB_CLK>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
+		clock-names = "iface", "ref";
+	};
+};
+
 &mmcc {
 	compatible = "qcom,mmcc-sdm660";
-	/*
-	 * 660 has one more dsi host/phy, which - when implemented
-	 * and tested - should be added to the clocks property.
-	 */
+	clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+			<&sleep_clk>,
+			<&gcc GCC_MMSS_GPLL0_CLK>,
+			<&gcc GCC_MMSS_GPLL0_DIV_CLK>,
+			<&dsi0_phy 1>,
+			<&dsi0_phy 0>,
+			<&dsi1_phy 1>,
+			<&dsi1_phy 0>,
+			<0>,
+			<0>;
 };
 
 &tlmm {
-- 
2.32.0

