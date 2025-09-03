Return-Path: <linux-arm-msm+bounces-71803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6C5B41C52
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 12:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1969056002A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 10:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C922F9C47;
	Wed,  3 Sep 2025 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="prIY2sMy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C60E2F83C9
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 10:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896726; cv=none; b=aYrxC6e09VHkFWJJx8iUn8yhex+uK/VmWh9LkBDO0Qo5rpmxaj5GKvdVkzAT8Ilj3y+D+FmyiA9StC6F1bwdGCghAkRdy+cOM5SmzkRp/oHOnuByQTonKHh1da5bGKjyP7bTzAhubNTVEeEvpGZRNXwuNBlU2Fn+Hzh8crOryOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896726; c=relaxed/simple;
	bh=nKzM8+DhB3mWRo1Uw19AVwyiwRjw8Y1noKAdLwZJkWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNUywpxEYyhkl41yjoqGnLLz47FxbSAjnxsZpRYb4g6FNmSbwD25UEmd6XA3RXB+DZuXXP1oRYM/ScBdlJ1g2SVJXU6IKPHVlDdUu6FkCM+nu16ujIC3Hvo33PoGH3POkxY6iNAcr+VIy+D4skZaq/ZIvb0Kges0k3fef1R/SSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=prIY2sMy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583AWRtc010204
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 10:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0K02dLIrIWIN69se35x4CnkEpVg0hHnCCy6M9lvO6aU=; b=prIY2sMyZbKWgYwH
	GCsQ9fWpeHi++m9j7p4EAr0OQ7ac6bg8gv8N22jr8AUMwlswT+yn065udi/SJlBO
	Gn20Fo1Vw5ieHnEI8OKtw+p/E0Z1WPR1QNVSZlpDGjz8IxWAESeYipCwDaI6FtCg
	iHuzu2uCY42YgbLBOYMy3d1mX40pHY54nrRTvE3kfo+L5hnTdQNf7yHotv6qRE2g
	bIT9N+Vyde2LaNj9ekzjWCY/eC1mSAKZ8bPleTVGRLFK8E1YDesB6QcikgYYfQSJ
	gA0Fm9Y0f3huA51qgSuqPHlngoMZM9go95VSFXYVJX16qIeo22NIimnHnislbNrj
	4smD7Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0ekfup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 10:52:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-329ccb59ef6so2297989a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 03:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756896723; x=1757501523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0K02dLIrIWIN69se35x4CnkEpVg0hHnCCy6M9lvO6aU=;
        b=WGdlr2DBid0ns9bisEBsKtG0D0uRIcfgIGXbWl9pwHQ6o27uRSKYWRhB8905ew+JoR
         FR2iWuVYMBMFijcz7Akk8ole472BG/l4pH/OdtaTP5XqBi/OEIrwfzcUK2Gm/6PTl+X4
         Q3Zk6QiWlJHK5AhrO16q9FYgOUOGvY+hd/EiOVLOV0dLjLMk1wi4KbS6vithhCMH9Doz
         yk84W8BS9VhkiUCq7dOeeHoX4I5GkvOjnlOGYPfo+J+BFeDXoRtskNlyHV11NuGCOA7W
         qz54boSjNfeJxVW0s8LzXdQrMMpAKdI+LPMXW6byyfPdglcuFFXO2gxfeqqUJ73Gso57
         1t+Q==
X-Gm-Message-State: AOJu0YwFt45LaUW/evMAo3wEZNcexRfiEFxzjZEKtCHPiI1gnsGrgud3
	YzC9zLzOaUq9gTKtuEGfHSwgsyXZ5DyzP/B8V/B09lPaNZviWmCqthf+DXXvZM9GLBLcu2BSCe9
	mATZ/RoP4xNLzGleBovKrFgc7qeSkAE586HFeAJUS/evHqqe33OlYdTnNWj07BHSqsPfW
X-Gm-Gg: ASbGnctfu7ft38ZQ6cD01WVDTz50c1Sk+olXRQVB+qMh22j5Yck3pvSZvvMGd+zaLpm
	2KJFJf7A31VGF2JVN0dUgFPaaPmVtz4N8RAjwDWX1ncuMBk9CeA1QjLzrHJ1tZAGkPRQtX1R1Ma
	P5AVC1tbHLZs3NR0x+tAS2BHWDCWX5ucVdJ+5ZoW7jwQqrcD+0qGaSoZK7QgyN3M8S0OoPPRDUO
	fVmNoUONYJAQCNzPJySSSTERUCsaeLOLMo77rC0aMmEG659VvbrORzI/qntUuCLAtsD80Epi/FE
	mgVvQAtu9mNbv6KaGaz4iAeblb85y7Q/YAxAevRvplQHl9Fp37N99U4ScjMT+2kxpFhSI27XUmJ
	fOpxvGQJduE+wId5G0CtMfMV2DZb49Q/W2W/hhoEdphWzSrKnbje2CxLI
X-Received: by 2002:a17:90b:1848:b0:327:6de3:24b6 with SMTP id 98e67ed59e1d1-3281541223dmr18814947a91.8.1756896722886;
        Wed, 03 Sep 2025 03:52:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHzZzZ6b8RjjgvGoFeQd4E+IrJe/7VCVvhzz++1+LGXDEpaAQ+0Bgxwr1THYhd550qoHz+tg==
X-Received: by 2002:a17:90b:1848:b0:327:6de3:24b6 with SMTP id 98e67ed59e1d1-3281541223dmr18814911a91.8.1756896722363;
        Wed, 03 Sep 2025 03:52:02 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e3a6720asm4856888a91.11.2025.09.03.03.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 03:52:01 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 18:49:28 +0800
Subject: [PATCH v8 1/2] arm64: dts: qcom: Add display support for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-add-display-support-for-qcs615-platform-v8-1-7971c05d1262@oss.qualcomm.com>
References: <20250903-add-display-support-for-qcs615-platform-v8-0-7971c05d1262@oss.qualcomm.com>
In-Reply-To: <20250903-add-display-support-for-qcs615-platform-v8-0-7971c05d1262@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        xiangxu.yin@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Li Liu <li.liu@oss.qualcomm.com>,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756896714; l=5827;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=uXlwezLY7U3gqs8X4zeTpdCd9Lux78E+OqnciVI8/Jk=;
 b=nJMMlMxwmLRBPOm8DOtATHaZV3jr336k5oN3dKsp8USIFCY8D7t9Q2Bg+o/o8b1NgUhZCNBc0
 ThYkwUazfukDErkAalcbvZZb8ctAO1ZbyLXAF4qHodyLLWc2GJkgHVP
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-GUID: ivykpjFCr_UkA0D2DvMmooD7rvdOVTlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX10WJrUSx4LQt
 O9VVa51ZieCrEAqbBJBZAKwMhRjdjB0cgXDdqU9pvwkO7gzaI5QpaRTTTJK5DqvMgTI0TSTeemo
 lnXkUjgNr5SWCwTnBiB2eqqHu5mYy8dm5P9iGnFnu/s1IVW1T271x3EF6K9lsXlWZ563iLpUH/j
 JQzu2DIF/uiuA7yNZ+EViI2D3Gf9MU8RltySUo6QX7QMjndr24y1iXEPNcO3IU4/1luQSbay3+L
 azhBHkNZLQppn5uYnk/hE5iUdjDWPifIwNWbGjLqNRsB2cKyK9vTtYRjmzMtDtgaA+PikXTR5AO
 Th9HTVkuZW1Pf6USqk1wbjh7kHecwB3qQMwz6FOfWurT9nZIVBU6mddG5EnaBl9hmy57DMGiiMV
 Pw0SpP8Y
X-Proofpoint-ORIG-GUID: ivykpjFCr_UkA0D2DvMmooD7rvdOVTlD
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b81dd3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Roi-LC9FDB9nNxv02foA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

From: Li Liu <li.liu@oss.qualcomm.com>

Add display MDSS and DSI configuration for QCS615 platform.
QCS615 has a DP port, and DP support will be added in a later patch.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Li Liu <li.liu@oss.qualcomm.com>
Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 182 ++++++++++++++++++++++++++++++++++-
 1 file changed, 180 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index 53496241479a05fec7bffa893b96b2d12b2d7614..c0e6485c148a059f6c0b2d221a9ee34b0220ea06 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcs615-camcc.h>
 #include <dt-bindings/clock/qcom,qcs615-dispcc.h>
 #include <dt-bindings/clock/qcom,qcs615-gcc.h>
@@ -3579,14 +3580,191 @@ camcc: clock-controller@ad00000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@ae00000 {
+			compatible = "qcom,sm6150-mdss";
+			reg = <0x0 0x0ae00000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			power-domains = <&dispcc MDSS_CORE_GDSC>;
+
+			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu 0x800 0x0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdss_mdp: display-controller@ae01000 {
+				compatible = "qcom,sm6150-dpu";
+				reg = <0x0 0x0ae01000 0x0 0x8f000>,
+				      <0x0 0x0aeb0000 0x0 0x2008>;
+				reg-names = "mdp",
+					    "vbif";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "iface",
+					      "bus",
+					      "core",
+					      "vsync";
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				interrupts-extended = <&mdss 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dpu_intf0_out: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-192000000 {
+						opp-hz = /bits/ 64 <192000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-256000000 {
+						opp-hz = /bits/ 64 <256000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-307200000 {
+						opp-hz = /bits/ 64 <307200000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@ae94000 {
+				compatible = "qcom,sm6150-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupts-extended = <&mdss 4>;
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
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi0_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				phys = <&mdss_dsi0_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				dsi0_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-164000000 {
+						opp-hz = /bits/ 64 <164000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,sm6150-dsi-phy-14nm";
+				reg = <0x0 0x0ae94400 0x0 0x100>,
+				      <0x0 0x0ae94500 0x0 0x300>,
+				      <0x0 0x0ae94800 0x0 0x124>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface",
+					      "ref";
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,qcs615-dispcc";
 			reg = <0 0x0af00000 0 0x20000>;
 
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
-				 <0>,
-				 <0>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <0>,
 				 <0>,
 				 <0>;

-- 
2.34.1


