Return-Path: <linux-arm-msm+bounces-71015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF99EB38375
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 15:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4A764630B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 13:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E1435334B;
	Wed, 27 Aug 2025 13:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlpX3Cgq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7106E352FDA
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 13:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756300362; cv=none; b=uGO7W+mnGaFVn1iz/XO/cjnicJqlFWPSFwpvL/kD6DMp1F+JLjuBgyzulXaT3uv+exbWwY1+yq76JzPVnLFvCVq3qZSXVIvhcRWGBTKCJm66o9LNSD9sHqHdUNLf17TJypoGUHOQ2IFR/yOikKNOBNq6RHQvkKiqxZfdPgzK6yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756300362; c=relaxed/simple;
	bh=nKzM8+DhB3mWRo1Uw19AVwyiwRjw8Y1noKAdLwZJkWQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bxCFSTDjQyYwOtXHjpV8WYLwDTtzNEb3BsuYVTOHN2GIW1a29mynerF+OJOJv2CtcHSN4x4ZrO3/tSAHFxeRsFMnqkci/7a94AUHjzon6oXE9UuzXc3iKb5jX0rVun6iTHbcYZUzUA88469BKt51U+gJZeszehWtAgZxD2KhIC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlpX3Cgq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kKK0023046
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 13:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0K02dLIrIWIN69se35x4CnkEpVg0hHnCCy6M9lvO6aU=; b=hlpX3Cgq9PI8Ogtd
	ZnmfYnpQ8xVLGqxxpquvw6T4+YvPRuQAMtm59eS0ObxoENEv7uikORUSbGIvYdwg
	wlfr7RYl6/4dX+lZ2uzUalVqebaBpqVAv9UBRQeDAkBH3r5CNLMtTSfgwl1+KJ6t
	Zd2G9nPqADz+xFNYovJXBRTVA2Jmj1K94w2TddsvcgRQv798DkjWTvC91ofQG43W
	dBNH1598mJJvSATE/ejERQc3psYMuaMIgHk2/KAVkcQb9w4/dTJHB8ipk0dT2e+J
	1MJrMwk0I1OCLgq0g01D29gnroviDUi6DRng/t4faIsyXkMMgq0o8ys8hZbAONb5
	0ccSQg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5y5mh1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 13:12:39 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b49de40e845so2287180a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 06:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756300358; x=1756905158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0K02dLIrIWIN69se35x4CnkEpVg0hHnCCy6M9lvO6aU=;
        b=HaacFje6Z0TDfojmZGJIbMZPHwu/yajFG5MW5rccsaxKrKqSWgpdsCUqVJyKm1S86f
         JgJ3MAZc80H6wx1ciwnKe6Cwj4b2ZQt9/4J9cmss5JliTVYYRvMKpB3E0ul5rjpFNKpp
         tucMzMOLLC1RcpGrwkY9BacK0sVgMHATwGXjFUdJm0FhIKynO/kyhzT8ZfXGuxcCPkZU
         bxwdbt5+Xzpv7XJGjnoByAgp36BLaHVqKh1vH0H5gWypZBEENa/3L7C//zUFDObVnIae
         D1+2OyY4mpazkKdHT6XM1p8akzLBJAyFYzMNOrsyMZ+ouPNVEAWL0wUEaf5hU3MNwbNW
         J6KA==
X-Gm-Message-State: AOJu0Yyfe+ZZWbu/Qpn1BYPHodqu8RU8m+31YPUO+8u+a4bdX6ofSR6A
	lhMX8fzS0BcX0I/YBbdB0+k3P2oP76gpXXhd2q5WC3Qf/f2wPbdv3Fr4V4M7EeOOSH/0f4fIhZy
	q6Xy0VEl9QfXf8YevDm3SmhwOVp8spbwkf3Yqc292hPYOTKPKh9XJ66DsoO3Q8wHmcv3lcFagmR
	nL+N0=
X-Gm-Gg: ASbGncue3DHkK/0n38CCuCMD36Wqq3x8Yc5ZxtxVSnkuRZ1E6qUINgnfgDBQ2eXgov9
	/ONAYr7YmrK3nZwmJh6Fho6ARgCaRrMt9TQLntMJ6nyeYRIGIuU3RD4lCFaunJskx4Zqm3GmSAM
	rLPmsvS1uFh5itxW/qrTVpNMEK66bnXzSyBpPhx+9DoRMHKQG3uQ8POlF70YisdJd9paxcbl1K4
	4Clg34WQbhkqJp2nyJsID1b52eBr0z1psxBMRgEQCIWLQb9OM1OUm22nroMC18TdsLCoVqRwSFA
	RaicuzT7coEM58vgOeMtpZIA7Lu565wwH2Ymb2oYI7hy22CQSp2n1GVIJVd0N67SmHMTOntOVBg
	tx9qUmwku1eCOeISIvTu2PouuXqOtWyu6O4gExrgd1Xs79xVCTPEfy9gx
X-Received: by 2002:a05:6a20:939d:b0:243:78a:8294 with SMTP id adf61e73a8af0-24340e2f1a5mr30724905637.59.1756300357969;
        Wed, 27 Aug 2025 06:12:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBKKDmbMeCpOSy/V169srY8qPeL/qgsPevEwM/hT8H/icksjXaQ5N1HO9nHIp0yrYZozdFGQ==
X-Received: by 2002:a05:6a20:939d:b0:243:78a:8294 with SMTP id adf61e73a8af0-24340e2f1a5mr30724851637.59.1756300357399;
        Wed, 27 Aug 2025 06:12:37 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cbba615csm11432972a12.44.2025.08.27.06.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 06:12:37 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 21:08:38 +0800
Subject: [PATCH v7 1/2] arm64: dts: qcom: Add display support for QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-add-display-support-for-qcs615-platform-v7-1-917c3de8f9ca@oss.qualcomm.com>
References: <20250827-add-display-support-for-qcs615-platform-v7-0-917c3de8f9ca@oss.qualcomm.com>
In-Reply-To: <20250827-add-display-support-for-qcs615-platform-v7-0-917c3de8f9ca@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, xiangxu.yin@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, Li Liu <li.liu@oss.qualcomm.com>,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756300349; l=5827;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=uXlwezLY7U3gqs8X4zeTpdCd9Lux78E+OqnciVI8/Jk=;
 b=4QCsko4TNHA7JgPUEWBuuCeWIgOcS62ypyAm4JzHV39qtIaFzMwkIcz0WAvVQsBP8CBYD02bK
 vipxDCz/ZfyDzndyLIhPVUbiPCd2AGodzIDzFlKfZ+W/c8lhFI30MP6
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX0zB/o+cP+4zJ
 vuz/h/EOgHkNA3Leb32Pweg3UYYUQKv5PvE1rdysYVtlHxeXQP7j3Y3GdnBeYXrjVgidjVLJu3M
 y8QeseOsMClZBLzvK1yY+40Ef9AvP93TD7VZT6WAwOoUzVOrKBI/kHfDRF9L2Bniirbod6DwbBp
 z0znqA+Yd6Ymihv9aGyd5z8tYiP/FGbFVoeU0Ix9JD5c0bxGM6TKpnr/4YEspH0msxtxrfT1o3/
 NlAMGFeudfR1Y8LbX9btF07jodsgYcE2Tl9e73eSPRKLVHzq0apYauJCynjtA9uOZUGq3qg/RQc
 ud0jeTpktttZG913iizGrYz6Rwi22jdmb3GvsdP0tyYRJLEzHUUOZEsiLK5WNk5uM2JGcC9qBCX
 Na7XR8+w
X-Authority-Analysis: v=2.4 cv=Lco86ifi c=1 sm=1 tr=0 ts=68af0447 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Roi-LC9FDB9nNxv02foA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: lFJThdQ_unnFrUCNpcp-wJ_8fH9oAqep
X-Proofpoint-ORIG-GUID: lFJThdQ_unnFrUCNpcp-wJ_8fH9oAqep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_03,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

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


