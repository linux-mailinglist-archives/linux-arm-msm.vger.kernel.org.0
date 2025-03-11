Return-Path: <linux-arm-msm+bounces-50964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC36A5C128
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 13:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3456D1885E91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 12:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBD22580DE;
	Tue, 11 Mar 2025 12:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gineidVz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1524C221F03;
	Tue, 11 Mar 2025 12:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741695917; cv=none; b=umfBJ/RvNI7NNMFTCHAmIiqx4R5lvYm8W8hL41edpWuRTWsfp5heinIfu4k+JdoK1ZUfnu2awKZnA1ANF0DSXtBz61MOPsGkH5PF5xw9dQcAhzoClcdpDrsghye1QEf+PwEDgi26NJNGDSVZQbA5eobpi2U8Wzs7VvetFgKhl8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741695917; c=relaxed/simple;
	bh=MKEykAs8Uo47Fab54lYnG6uQnj0K1i+/SyAl1+iUpHI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SRje60TGMgydmkvXNWH9UCkgKeKu7dUiA82I99LqG25RZ5V0zpc6E5IaFgfKTKJBXAaTWWc+3mBc9JLA+U5GRl9/GFHMNhh6c5ASfYb9+kf63F1A8vYYj1WkB4w3hoxTIKhQdldKgD7GWfpnW/onwCgs6+8vZAcwNblxTDhLZ2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gineidVz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52B788xl025707;
	Tue, 11 Mar 2025 12:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IPc6R0KbbL3
	FySTaON+41nl25NWycMxj86fB+4np2NY=; b=gineidVzXARki2zXqlFPJVsOV+z
	VIyXKsW3wCj8K8GUm2kuU4dJxDb/xSFrNzCjhlsc6IlGTFnmfoWAsKgPW8i/DcS6
	nyt0JDu15b5S+wwoD9LyLU5Z4zP2Lb/mGaW6jAp78jxYI4vnCL/jX4eZ01Ua8kKw
	enF6on4COZb04S6PV666n43uXYwgpmJxNeRABJen2ijciSThAaS0sQEeQ9gDTssL
	k9sOp8W0xRydRszB0zItvf36B8rbs0US1kE8R7K/oPKFLsLw5B/yqqYJimg0CWGt
	QRmbsR2axeex/F1mxeWiZX6viz5UVbYAwO2T8vCO+9sEsEcwvxYzWvqhKGw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewk8ha5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:24:54 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52BCOokI008159;
	Tue, 11 Mar 2025 12:24:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 458yn373wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:24:50 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52BCOo6l008136;
	Tue, 11 Mar 2025 12:24:50 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 52BCOnAZ008129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Mar 2025 12:24:50 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 3D043599; Tue, 11 Mar 2025 17:54:48 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: [PATCH v2 06/10] arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes
Date: Tue, 11 Mar 2025 17:54:41 +0530
Message-Id: <20250311122445.3597100-7-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
References: <20250311122445.3597100-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Tr8chCXh c=1 sm=1 tr=0 ts=67d02b96 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=3nFnvXdk7A2PnE-P1t8A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Wtj6tWyTpQsKVYFBxHDr06a2q-ivFk0N
X-Proofpoint-ORIG-GUID: Wtj6tWyTpQsKVYFBxHDr06a2q-ivFk0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110080

Add device tree nodes for the DSI0 and DSI1 controllers
with their corresponding PHYs found on Qualcomm SA8775P SoC.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 186 +++++++++++++++++++++++++-
 1 file changed, 185 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 3394ae2d1300..edc5130f4bae 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
@@ -3890,6 +3891,22 @@ dpu_intf4_out: endpoint {
 							remote-endpoint = <&mdss0_dp1_in>;
 						};
 					};
+
+					port@2 {
+						reg = <2>;
+
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss0_dsi0_in>;
+						};
+					};
+
+					port@3 {
+						reg = <3>;
+
+						dpu_intf2_out: endpoint {
+							remote-endpoint = <&mdss0_dsi1_in>;
+						};
+					};
 				};
 
 				mdss0_mdp_opp_table: opp-table {
@@ -3917,6 +3934,170 @@ opp-650000000 {
 				};
 			};
 
+			mdss0_dsi0: dsi@ae94000 {
+				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <4>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>;
+				phys = <&mdss0_dsi0_phy>;
+
+				operating-points-v2 = <&dsi0_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
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
+						mdss0_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dsi0_out: endpoint{ };
+					};
+				};
+
+				dsi0_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss0_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0x0 0x0ae94400 0x0 0x200>,
+				      <0x0 0x0ae94600 0x0 0x280>,
+				      <0x0 0x0ae94900 0x0 0x27c>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
+			mdss0_dsi1: dsi@ae96000 {
+				compatible = "qcom,sa8775p-dsi-ctrl", "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae96000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <5>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_ESC1_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
+				phys = <&mdss0_dsi1_phy>;
+
+				operating-points-v2 = <&dsi1_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
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
+						mdss0_dsi1_in: endpoint {
+							remote-endpoint = <&dpu_intf2_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dsi1_out: endpoint { };
+					};
+				};
+
+				dsi1_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss0_dsi1_phy: phy@ae96400 {
+				compatible = "qcom,sa8775p-dsi-phy-5nm";
+				reg = <0x0 0x0ae96400 0x0 0x200>,
+				      <0x0 0x0ae96600 0x0 0x280>,
+				      <0x0 0x0ae96900 0x0 0x27c>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
+
+				status = "disabled";
+			};
+
 			mdss0_dp0_phy: phy@aec2a00 {
 				compatible = "qcom,sa8775p-edp-phy";
 
@@ -4123,7 +4304,10 @@ dispcc0: clock-controller@af00000 {
 				 <&sleep_clk>,
 				 <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>,
 				 <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>,
-				 <0>, <0>, <0>, <0>;
+				 <&mdss0_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss0_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss0_dsi1_phy DSI_PIXEL_PLL_CLK>;
 			power-domains = <&rpmhpd SA8775P_MMCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.34.1


