Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 635A5434CE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 15:59:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbhJTOBe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 10:01:34 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:47917 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbhJTOBd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 10:01:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634738359; x=1666274359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wpW8CKetkv7yEzJiDd5WPwlDmBXoqCX0n86BkHlsN+c=;
  b=Kdw5ARZmjeXucNmDtZFg6/tcJMdEe3B7wp8xbmS5ZVAV/tnswN1a955H
   1NQSodLQ4w6xAceZl8z8tKG8fWxa+Md2J4bOOJI85wtjSsQcuwbYh+4UU
   kM0PZojvS5iDgmeDk1a1UCJUyCoaetSDxzIvSe5Agbkfz2vAPWcJcu5Ls
   Q=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 20 Oct 2021 06:59:19 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 20 Oct 2021 06:59:17 -0700
X-QCInternal: smtphost
Received: from mkrishn-linux.qualcomm.com ([10.204.66.35])
  by ironmsg02-blr.qualcomm.com with ESMTP; 20 Oct 2021 19:28:57 +0530
Received: by mkrishn-linux.qualcomm.com (Postfix, from userid 438394)
        id 5DADA22266; Wed, 20 Oct 2021 19:28:56 +0530 (IST)
From:   Krishna Manikandan <quic_mkrishn@quicinc.com>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krishna Manikandan <quic_mkrishn@quicinc.com>,
        kalyan_t@codeaurora.org, sbillaka@codeaurora.org,
        abhinavk@codeaurora.org, robdclark@gmail.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, khsieh@codeaurora.org,
        rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Subject: [PATCH v2 2/4] arm64: dts: qcom: sc7280: add display dt nodes
Date:   Wed, 20 Oct 2021 19:28:51 +0530
Message-Id: <1634738333-3916-2-git-send-email-quic_mkrishn@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com>
References: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add mdss and mdp DT nodes for sc7280.

Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>

Changes in v2:
  - Rename display dt nodes (Stephen Boyd)
  - Add clock names one per line for readability (Stephen Boyd)
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 90 ++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index d74a4c8..4ee7f2f 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2588,6 +2588,96 @@
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,sc7280-mdss";
+			reg = <0 0x0ae00000 0 0x1000>;
+			reg-names = "mdss";
+
+			power-domains = <&dispcc DISP_CC_MDSS_CORE_GDSC>;
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				<&dispcc DISP_CC_MDSS_MDP_CLK>;
+			clock-names = "iface",
+				      "ahb",
+				      "core";
+
+			assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>;
+			assigned-clock-rates = <300000000>;
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "mdp0-mem";
+
+			iommus = <&apps_smmu 0x900 0x402>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdp: display-controller@ae01000 {
+				compatible = "qcom,sc7280-dpu";
+				reg = <0 0x0ae01000 0 0x8f030>,
+					<0 0x0aeb0000 0 0x2008>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					<&gcc GCC_DISP_SF_AXI_CLK>,
+					<&dispcc DISP_CC_MDSS_AHB_CLK>,
+					<&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					<&dispcc DISP_CC_MDSS_MDP_CLK>,
+					<&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+				assigned-clocks = <&dispcc DISP_CC_MDSS_MDP_CLK>,
+						<&dispcc DISP_CC_MDSS_VSYNC_CLK>,
+						<&dispcc DISP_CC_MDSS_AHB_CLK>;
+				assigned-clock-rates = <300000000>,
+							<19200000>,
+							<19200000>;
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmhpd SC7280_CX>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				status = "disabled";
+
+				mdp_opp_table: opp-table {
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
+					opp-380000000 {
+						opp-hz = /bits/ 64 <380000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-506666667 {
+						opp-hz = /bits/ 64 <506666667>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7280-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
-- 
2.7.4

