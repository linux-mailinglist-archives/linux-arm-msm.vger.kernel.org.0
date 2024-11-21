Return-Path: <linux-arm-msm+bounces-38637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A829D49B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 10:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AE9E28230B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 09:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F227F1CEAAF;
	Thu, 21 Nov 2024 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lELQk8Xi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAEE1CBE81;
	Thu, 21 Nov 2024 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732180453; cv=none; b=onZBk9AX6Q5HeGNMoU4zNyCAAd3f/KPTtUiCek2NN94x5xpLFm5CY6QTB3VjmDT7U83IeKHHZGVfGj/QVS24zXf+vnKNXZxFZu4eoDIrZvakNxmnWHJU2tKIzRXcPXPjBfhTNA/s6nMPT0TsX3XBxy4pCMXxgLssbdyrjaRQ+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732180453; c=relaxed/simple;
	bh=BpFQjM3HH1Ofn1dMv6J+QneNAjPELQc641Zgl3w/2K4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=h99rpnivS7Y4yX6xBzmStI8s/+u9r44jIvHWEl97BH1GILGejpkbSVID+/OhJgXk0Ju83Wa48C4/MtC8+ze20BX4W4mL4r//Iv2VEc4U/xHX4GZXYofmhft2q6yXDKFnHWGKKuZL1B32uUBw4qGvVm3L/E5K0YRWfz+S8ey7LTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lELQk8Xi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL95O3o006019;
	Thu, 21 Nov 2024 09:14:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=Qj+HWNoKziSrlMTkVdwwqp8EpZQkwFojf4hm1RV+pMg=; b=lE
	LQk8XieK2TqDnT1sbbyxs1znKsawG27y7yldwA6IoNhtGvS50T45X0jPn6nMqiFn
	VaHG3yc9GdA7O9EqFzEYcin6OhvOzfE6oZB1x+yeeA4+HW2ZqEH4Yc38ipAEBHxo
	YPaN2Z8Ym+1/SFdIuSK0jrFqD+rHkJLCJu2uokpPG+unVVXFa+aKoQvf+9sRuG5y
	/t/0Qk4yGJqdKMk92YrHfE+b1AySsY7YbISuf++aIW2AUhbLMJacNfIAcu8tlUyy
	7M7NxMcd/GszzSR4WooTxc2Q0G5eVbQYdaigaZj7IYeFF0n3nEVtaaUC3WG1F/3w
	uR7ys0iTiJghtnl4+5MQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4317t246sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 09:14:07 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AL99v5s018475;
	Thu, 21 Nov 2024 09:14:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 42xmfmn76f-1;
	Thu, 21 Nov 2024 09:14:04 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4AL9E4qa024138;
	Thu, 21 Nov 2024 09:14:04 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com [10.147.244.250])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4AL9E32M024132;
	Thu, 21 Nov 2024 09:14:04 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
	id 093665009EF; Thu, 21 Nov 2024 14:44:03 +0530 (+0530)
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
Subject: [PATCH v5 1/2] arm64: dts: qcom: sa8775p: add DisplayPort device nodes
Date: Thu, 21 Nov 2024 14:44:00 +0530
Message-Id: <20241121091401.20584-2-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241121091401.20584-1-quic_mukhopad@quicinc.com>
References: <20241121091401.20584-1-quic_mukhopad@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HUvXkN_OIeLO0iV491L2lasHoO-CGjPk
X-Proofpoint-ORIG-GUID: HUvXkN_OIeLO0iV491L2lasHoO-CGjPk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=792 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210071
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add device tree nodes for the DPTX0 and DPTX1 controllers
with their corresponding PHYs found on Qualcomm SA8775P SoC.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 218 +++++++++++++++++++++++++-
 1 file changed, 217 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index f7a9d1684a79..7fd0d89bf7a9 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3343,6 +3343,25 @@
 				interrupt-parent = <&mdss0>;
 				interrupts = <0>;
 
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dpu_intf0_out: endpoint {
+							remote-endpoint = <&mdss0_dp0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dpu_intf4_out: endpoint {
+							remote-endpoint = <&mdss0_dp1_in>;
+						};
+					};
+				};
+
 				mdss0_mdp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
@@ -3367,6 +3386,202 @@
 					};
 				};
 			};
+
+			mdss0_dp0_phy: phy@aec2a00 {
+				compatible = "qcom,sa8775p-edp-phy";
+
+				reg = <0x0 0xaec2a00 0x0 0x200>,
+				      <0x0 0xaec2200 0x0 0xd0>,
+				      <0x0 0xaec2600 0x0 0xd0>,
+				      <0x0 0xaec2000 0x0 0x1c8>;
+
+				clocks =<&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					<&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
+				clock-names = "aux",
+					      "cfg_ahb";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss0_dp1_phy: phy@aec5a00 {
+				compatible = "qcom,sa8775p-edp-phy";
+
+				reg = <0x0 0xaec5a00 0x0 0x200>,
+				      <0x0 0xaec5200 0x0 0xd0>,
+				      <0x0 0xaec5600 0x0 0xd0>,
+				      <0x0 0xaec5000 0x0 0x1c8>;
+
+				clocks =<&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					<&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>;
+				clock-names = "aux",
+					      "cfg_ahb";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss0_dp0: displayport-controller@af54000 {
+				compatible = "qcom,sa8775p-dp";
+
+				reg = <0x0 0xaf54000 0x0 0x104>,
+				      <0x0 0xaf54200 0x0 0x0c0>,
+				      <0x0 0xaf55000 0x0 0x770>,
+				      <0x0 0xaf56000 0x0 0x09c>,
+				      <0x0 0xaf57000 0x0 0x09c>;
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <12>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
+				phys = <&mdss0_dp0_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
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
+						mdss0_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dp0_out: endpoint { };
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
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss0_dp1: displayport-controller@af5c000 {
+				compatible = "qcom,sa8775p-dp";
+
+				reg = <0x0 0xaf5c000 0x0 0x104>,
+				      <0x0 0xaf5c200 0x0 0x0c0>,
+				      <0x0 0xaf5d000 0x0 0x770>,
+				      <0x0 0xaf5e000 0x0 0x09c>,
+				      <0x0 0xaf5f000 0x0 0x09c>;
+
+				interrupt-parent = <&mdss0>;
+				interrupts = <13>;
+
+				clocks = <&dispcc0 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+					 <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel";
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>;
+				phys = <&mdss0_dp1_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp1_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
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
+						mdss0_dp1_in: endpoint {
+							remote-endpoint = <&dpu_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss0_dp1_out: endpoint { };
+					};
+				};
+
+				dp1_opp_table: opp-table {
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
+
+					opp-810000000 {
+						opp-hz = /bits/ 64 <810000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
 		};
 
 		dispcc0: clock-controller@af00000 {
@@ -3376,7 +3591,8 @@
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>,
-				 <0>, <0>, <0>, <0>,
+				 <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>,
+				 <&mdss0_dp1_phy 0>, <&mdss0_dp1_phy 1>,
 				 <0>, <0>, <0>, <0>;
 			power-domains = <&rpmhpd SA8775P_MMCX>;
 			#clock-cells = <1>;
-- 
2.17.1


