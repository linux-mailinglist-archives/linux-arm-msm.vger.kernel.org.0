Return-Path: <linux-arm-msm+bounces-80174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 62810C2EC38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 02:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 257DB34C9ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 01:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4C020F079;
	Tue,  4 Nov 2025 01:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RyxqydML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA2F1FCFFC;
	Tue,  4 Nov 2025 01:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762220027; cv=none; b=WS1Pls7K9Ng132pCjEcjZXVxsClfYIxaMoGP9Ka2iu/4Bbo0lvU02gbpgx9rFtkzv0GXzzXwo6BaFSkLW+dmuh76IXjhv53CsARgK7HfNjyRN4WVZJ+vBFQWsuaLyy3a9O/i/PpjPt384kNwWNVR6Qmmi2Pexu8PEtXP6HtoXnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762220027; c=relaxed/simple;
	bh=vZFRSlBnkAbUy3QVpx9sd6MjxR0UuLoqqLPobMHrovY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GMyuqoMYd+tDKTIZZoVyGWj4COxxShmxu+OJIjAKDlh+QG7C/TJ+JgMIoKZhyWu0/kBefNp6rJs5DrGvc4XL+Vz43VrmibEleU70b4zy5hMId97ktx8YoJ6OWCKA3ptMZjkUMHNyeyInhfDFC91f6W0l86dau3mwq3SaUO7Qk+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RyxqydML; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E1E5C19421;
	Tue,  4 Nov 2025 01:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762220027;
	bh=vZFRSlBnkAbUy3QVpx9sd6MjxR0UuLoqqLPobMHrovY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RyxqydMLycEQDoJUWoHffPcnjS9Mtd8k5I9tiiekwYcNdl9ot4dTEsMXknOy4k6vG
	 yVz4WaH/ZBoD4XsiSEXq6hBkKlckFAXeiyibogMv9/BsMS9hkOMm5Ve7exs0pVsfJc
	 avMW8f6Bu/OKBK03Fxf4OlfwJYAb5i/X53g2qoxFmVTNjTQM/dnTVtYZpuEZubuM+a
	 MW+A10XMyAZkE7k8ntT7mPR2707wvKm7VCIJZHPbWaAffJHpOelPA3NCJwEiiGKwVn
	 EV1ALsjbSPIDidARgYRDWFmXNC3FfwiC6IwhhyH3U+/FgImpALka8Xbl2KysEhzK/U
	 3z8XkwBqPzTKg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163E8CCFA07;
	Tue,  4 Nov 2025 01:33:47 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Tue, 04 Nov 2025 09:33:25 +0800
Subject: [PATCH v7 3/4] arm64: dts: qcom: talos: Add DisplayPort and QMP
 USB3-DP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-add-displayport-support-to-qcs615-devicetree-v7-3-e51669170a6f@oss.qualcomm.com>
References: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
In-Reply-To: <20251104-add-displayport-support-to-qcs615-devicetree-v7-0-e51669170a6f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com, 
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762220025; l=4929;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=3EPRbc28Dl/QB/pDfVl4NSaf1ThQc9/OR79KsNbQKV0=;
 b=EH2AAEy9ADoQQyvzNm4EIwHgTM31wez6Myw1X7//bRqBbSOCPi4UfZmL3v+0SuvqYAsiu+Og0
 p1hPBQicpmMCaFVuEt6VVIeLYhfhOxSyArM2+LQTT52a1m2kmETCaG3
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Endpoint-Received: by B4 Relay for xiangxu.yin@oss.qualcomm.com/20241125
 with auth_id=542
X-Original-From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Reply-To: xiangxu.yin@oss.qualcomm.com

From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

Introduce DisplayPort controller node and associated QMP USB3-DP PHY
for SM6150 SoC. Add data-lanes property to the DP endpoint and update
clock assignments for proper DP integration.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 115 +++++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index d1dbfa3bd81c3d999bd79fc92ad85312c2f83087..208344a1a832332912c804735e35219ab1a06a8f 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
@@ -3855,6 +3856,7 @@ port@0 {
 						reg = <0>;
 
 						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss_dp0_in>;
 						};
 					};
 
@@ -3887,6 +3889,89 @@ opp-307200000 {
 				};
 			};
 
+			mdss_dp0: displayport-controller@ae90000 {
+				compatible = "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom,sm8350-dp";
+
+				reg = <0x0 0x0ae90000 0x0 0x200>,
+				      <0x0 0x0ae90200 0x0 0x200>,
+				      <0x0 0x0ae90400 0x0 0x600>,
+				      <0x0 0x0ae90a00 0x0 0x600>,
+				      <0x0 0x0ae91000 0x0 0x600>;
+
+				interrupt-parent = <&mdss>;
+				interrupts = <12>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>,
+					 <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_DP_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&usb_qmpphy_2 QMP_USB43DP_DP_LINK_CLK>,
+							 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>,
+							 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+				phys = <&usb_qmpphy_2 QMP_USB43DP_DP_PHY>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dp0_out: endpoint {
+							data-lanes = <3 2 0 1>;
+						};
+					};
+				};
+
+				dp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-160000000 {
+						opp-hz = /bits/ 64 <160000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-270000000 {
+						opp-hz = /bits/ 64 <270000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-540000000 {
+						opp-hz = /bits/ 64 <540000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
 			mdss_dsi0: dsi@ae94000 {
 				compatible = "qcom,sm6150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0x0 0x0ae94000 0x0 0x400>;
@@ -3982,8 +4067,8 @@ dispcc: clock-controller@af00000 {
 				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
 				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <0>,
-				 <0>,
-				 <0>;
+				 <&usb_qmpphy_2 QMP_USB43DP_DP_LINK_CLK>,
+				 <&usb_qmpphy_2 QMP_USB43DP_DP_VCO_DIV_CLK>;
 
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -4362,6 +4447,32 @@ usb_qmpphy: phy@88e6000 {
 			status = "disabled";
 		};
 
+		usb_qmpphy_2: phy@88e8000 {
+			compatible = "qcom,qcs615-qmp-usb3-dp-phy";
+			reg = <0x0 0x088e8000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_USB2_SEC_PHY_AUX_CLK>,
+				 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
+				 <&gcc GCC_AHB2PHY_WEST_CLK>,
+				 <&gcc GCC_USB2_SEC_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+
+			resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR >,
+				 <&gcc GCC_USB3_DP_PHY_SEC_BCR>;
+			reset-names = "phy_phy",
+				      "dp_phy";
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			qcom,tcsr-reg = <&tcsr 0xbff0 0xb24c>;
+
+			status = "disabled";
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,qcs615-dwc3", "qcom,dwc3";
 			reg = <0x0 0x0a6f8800 0x0 0x400>;

-- 
2.34.1



