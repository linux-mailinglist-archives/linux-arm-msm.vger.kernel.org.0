Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 132D144F0D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 03:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235619AbhKMCnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 21:43:09 -0500
Received: from linux.microsoft.com ([13.77.154.182]:54536 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235548AbhKMCnG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 21:43:06 -0500
Received: from thelio.attlocal.net (107-203-255-60.lightspeed.sntcca.sbcglobal.net [107.203.255.60])
        by linux.microsoft.com (Postfix) with ESMTPSA id 03E7B20C363C;
        Fri, 12 Nov 2021 18:40:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 03E7B20C363C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1636771215;
        bh=3N0jTWVNqDUGeznUgcu3a1mMoAj5D2LXPy8anmUFsvU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LEarzjoEC5XAdC2wKnsjka3fKHFumDa4v0alAe+Jmw424m6tyWI0eSAgUteIZnQuV
         cl5g7WiRNDZcCBh5bFtVB3diX80eOZfRa0N6xuOPUDb/CfY48nzm72cPew7pOzugey
         PcMRgpemGC13YpqjWf/9lc954zmtuP5fqhSOQh/4=
From:   Katherine Perez <kaperez@linux.microsoft.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 3/4] arm64: dts: qcom: sm8150: add DSI display nodes
Date:   Fri, 12 Nov 2021 18:39:54 -0800
Message-Id: <20211113023955.105989-4-kaperez@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211113023955.105989-1-kaperez@linux.microsoft.com>
References: <20211113023955.105989-1-kaperez@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add DSI controller and PHY nodes to sm8150.

Signed-off-by: Katherine Perez <kaperez@linux.microsoft.com>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 183 ++++++++++++++++++++++++++-
 1 file changed, 179 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 38dbc39103ba..afa612daefa1 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3261,6 +3261,35 @@ camnoc_virt: interconnect@ac00000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		dsi_opp_table: dsi-opp-table {
+			compatible = "operating-points-v2";
+
+			opp-19200000 {
+				opp-hz = /bits/ 64 <19200000>;
+				required-opps = <&rpmhpd_opp_min_svs>;
+			};
+
+			opp-180000000 {
+				opp-hz = /bits/ 64 <180000000>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+			};
+
+			opp-275000000 {
+				opp-hz = /bits/ 64 <275000000>;
+				required-opps = <&rpmhpd_opp_svs>;
+			};
+
+			opp-328580000 {
+				opp-hz = /bits/ 64 <328580000>;
+				required-opps = <&rpmhpd_opp_svs_l1>;
+			};
+
+			opp-358000000 {
+				opp-hz = /bits/ 64 <358000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+		};
+
 		mdss: mdss@ae00000 {
 			compatible = "qcom,sm8150-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;
@@ -3351,6 +3380,152 @@ opp-460000000 {
 					};
 				};
 			};
+
+			dsi0: dsi@ae94000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0 0x0ae94000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SM8150_MMCX>;
+
+				phys = <&dsi0_phy>;
+				phy-names = "dsi";
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi0_phy: dsi-phy@ae94400 {
+				compatible = "qcom,dsi-phy-7nm-8150";
+				reg = <0 0x0ae94400 0 0x200>,
+				      <0 0x0ae94600 0 0x280>,
+				      <0 0x0ae94900 0 0x260>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			dsi1: dsi@ae96000 {
+				compatible = "qcom,mdss-dsi-ctrl";
+				reg = <0 0x0ae96000 0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmhpd SM8150_CX>;
+
+				phys = <&dsi1_phy>;
+				phy-names = "dsi";
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dsi1_out: endpoint {
+						};
+					};
+				};
+			};
+
+			dsi1_phy: dsi-phy@ae96400 {
+				compatible = "qcom,dsi-phy-7nm-8150";
+				reg = <0 0x0ae96400 0 0x200>,
+				      <0 0x0ae96600 0 0x280>,
+				      <0 0x0ae96900 0 0x260>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
 		};
 
 		dispcc: clock-controller@af00000 {
@@ -3359,10 +3534,10 @@ dispcc: clock-controller@af00000 {
 			power-domains = <&rpmhpd SM8150_MMCX>;
 			required-opps = <&rpmhpd_opp_low_svs>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
-				 <0>,
-				 <0>,
-				 <0>,
-				 <0>,
+				 <&dsi0_phy 0>,
+				 <&dsi0_phy 1>,
+				 <&dsi1_phy 0>,
+				 <&dsi1_phy 1>,
 				 <0>,
 				 <0>;
 			clock-names = "bi_tcxo",
-- 
2.31.1

