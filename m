Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03E4944F0D1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 03:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbhKMCnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 21:43:09 -0500
Received: from linux.microsoft.com ([13.77.154.182]:54532 "EHLO
        linux.microsoft.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235506AbhKMCnG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 21:43:06 -0500
Received: from thelio.attlocal.net (107-203-255-60.lightspeed.sntcca.sbcglobal.net [107.203.255.60])
        by linux.microsoft.com (Postfix) with ESMTPSA id A6D7220C3606;
        Fri, 12 Nov 2021 18:40:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A6D7220C3606
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1636771214;
        bh=KtYW+RD2BFKkShavkDFUjpCKduJ4u58/g42xv49fHpU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QSnZd0e2zYH1tWlUSULLsHUKgNl/6d5cbiaD/O6zp+OD5vj3k3M2nr1lgKJmPxa4i
         4Ct08YMvXdtG4SvzfI1HRCJCo5TMekTsd1hgCoYHZE3ujGQArxhixn1sXDRGUBuMVS
         TZybV81b4Rhze/9xNb5FOTZCJvAzDgtVOQnwuThc=
From:   Katherine Perez <kaperez@linux.microsoft.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 2/4] arm64: dts: qcom: sm8150: add display nodes
Date:   Fri, 12 Nov 2021 18:39:53 -0800
Message-Id: <20211113023955.105989-3-kaperez@linux.microsoft.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211113023955.105989-1-kaperez@linux.microsoft.com>
References: <20211113023955.105989-1-kaperez@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add MDSS and MDP nodes to sm8150.

Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Katherine Perez <kaperez@linux.microsoft.com>
---

Changes since v1:
- Picked up Konrad's Reviewed-by

 arch/arm64/boot/dts/qcom/sm8150.dtsi | 92 ++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index ee40af469fab..38dbc39103ba 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -3261,6 +3261,98 @@ camnoc_virt: interconnect@ac00000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};

+		mdss: mdss@ae00000 {
+			compatible = "qcom,sm8150-mdss";
+			reg = <0 0x0ae00000 0 0x1000>;
+			reg-names = "mdss";
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+			clock-names = "iface",
+				      "ahb",
+				      "core";
+
+			iommus = <&apps_smmu 0x800 0x420>;
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			status = "disabled";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			mdss_mdp: mdp@ae010000 {
+				compatible = "qcom,sm8150-dpu";
+				reg = <0x0ae01000 0x84208>,
+				      <0x0aeb0000 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "iface", "bus", "core", "vsync";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
+						  <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <460000000>,
+						       <19200000>;
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmhpd SM8150_MMCX>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&dsi0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dpu_intf2_out: endpoint {
+							remote-endpoint = <&dsi1_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: mdp-opp-table {
+					compatible = "operating-points-v2";
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-345000000 {
+						opp-hz = /bits/ 64 <345000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-460000000 {
+						opp-hz = /bits/ 64 <460000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sm8150-dispcc";
 			reg = <0 0x0af00000 0 0x10000>;
--
2.31.1

