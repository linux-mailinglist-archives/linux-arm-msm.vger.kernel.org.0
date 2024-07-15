Return-Path: <linux-arm-msm+bounces-26166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9266793143F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48F1928360D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F1218C18A;
	Mon, 15 Jul 2024 12:32:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6DA18734F;
	Mon, 15 Jul 2024 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721046720; cv=none; b=cEXTO43i58inCkg5ojneSdb59AclGcM7AB0Ud6WdkTTv4zecausnla57eHyNDicAc0aDRWKTXYLPtiLzMCs2hhQ2rzLAyiDOzN+/kYy102+io5bK5QxwFRVlK0JJQ1wGzCSVXg1+oEkqm9pbEYTw/8n9oAJiAIY4cvKB5lNnP/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721046720; c=relaxed/simple;
	bh=Wjyz8D8/D3A/C9E780ZPmjPslb45XEEVH6kywxgSNtQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZVgOPRuHfIgskKJkNkGd1XLC704bjr0rGkGj+2ywnUE0fP6/3voziZNvLrYs84NmsSUtY4PJyTaLwYLKrGVX/D1NP+olNVJ4i97XO60ok4s3AvSLbjr5ZDqCEzrXHT/vA1RJMD8baD8JFTkEaV/PfZh+SScEk10g6vaQvcbBHjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 2E76520BAE;
	Mon, 15 Jul 2024 14:22:14 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 2241820C73;
	Mon, 15 Jul 2024 14:22:14 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Date: Mon, 15 Jul 2024 14:21:19 +0200
Subject: [PATCH v6 6/6] arm64: dts: qcom: add HDMI nodes for msm8998
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240715-hdmi-tx-v6-6-d27f029627ad@freebox.fr>
References: <20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr>
In-Reply-To: <20240715-hdmi-tx-v6-0-d27f029627ad@freebox.fr>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0

From: Arnaud Vrac <avrac@freebox.fr>

Port device nodes from vendor code.

Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 100 +++++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index ba5e873f0f35f..417c12534823f 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2785,7 +2785,7 @@ mmcc: clock-controller@c8c0000 {
 				 <&mdss_dsi0_phy 0>,
 				 <&mdss_dsi1_phy 1>,
 				 <&mdss_dsi1_phy 0>,
-				 <0>,
+				 <&hdmi_phy 0>,
 				 <0>,
 				 <0>,
 				 <&gcc GCC_MMSS_GPLL0_DIV_CLK>;
@@ -2890,6 +2890,14 @@ dpu_intf2_out: endpoint {
 							remote-endpoint = <&mdss_dsi1_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf3_out: endpoint {
+							remote-endpoint = <&hdmi_in>;
+						};
+					};
 				};
 			};
 
@@ -3045,6 +3053,96 @@ mdss_dsi1_phy: phy@c996400 {
 
 				status = "disabled";
 			};
+
+			hdmi: hdmi-tx@c9a0000 {
+				compatible = "qcom,hdmi-tx-8998";
+				reg =	<0x0c9a0000 0x50c>,
+					<0x00780000 0x6220>,
+					<0x0c9e0000 0x2c>;
+				reg-names = "core_physical",
+					    "qfprom_physical",
+					    "hdcp_physical";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <8>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_HDMI_CLK>,
+					 <&mmcc MDSS_HDMI_DP_AHB_CLK>,
+					 <&mmcc MDSS_EXTPCLK_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MNOC_AHB_CLK>,
+					 <&mmcc MISC_AHB_CLK>;
+				clock-names =
+					"mdp_core",
+					"iface",
+					"core",
+					"alt_iface",
+					"extp",
+					"bus",
+					"mnoc",
+					"iface_mmss";
+
+				phys = <&hdmi_phy>;
+				#sound-dai-cells = <1>;
+
+				pinctrl-0 = <&hdmi_hpd_default>,
+					    <&hdmi_ddc_default>,
+					    <&hdmi_cec_default>;
+				pinctrl-1 = <&hdmi_hpd_sleep>,
+					    <&hdmi_ddc_default>,
+					    <&hdmi_cec_default>;
+				pinctrl-names = "default", "sleep";
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						hdmi_in: endpoint {
+							remote-endpoint = <&dpu_intf3_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						hdmi_out: endpoint {
+						};
+					};
+				};
+			};
+
+			hdmi_phy: hdmi-phy@c9a0600 {
+				compatible = "qcom,hdmi-phy-8998";
+				reg = <0x0c9a0600 0x18b>,
+				      <0x0c9a0a00 0x38>,
+				      <0x0c9a0c00 0x38>,
+				      <0x0c9a0e00 0x38>,
+				      <0x0c9a1000 0x38>,
+				      <0x0c9a1200 0x0e8>;
+				reg-names = "hdmi_pll",
+					    "hdmi_tx_l0",
+					    "hdmi_tx_l1",
+					    "hdmi_tx_l2",
+					    "hdmi_tx_l3",
+					    "hdmi_phy";
+
+				#clock-cells = <0>;
+				#phy-cells = <0>;
+
+				clocks = <&mmcc MDSS_AHB_CLK>,
+					 <&gcc GCC_HDMI_CLKREF_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface",
+					      "ref",
+					      "xo";
+
+				status = "disabled";
+			};
 		};
 
 		venus: video-codec@cc00000 {

-- 
2.34.1


