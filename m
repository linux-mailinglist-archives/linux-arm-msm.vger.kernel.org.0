Return-Path: <linux-arm-msm+bounces-33529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAC19946CC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 13:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1FE2B25D59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 11:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D3F1DACBE;
	Tue,  8 Oct 2024 11:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W6s1ErVR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6BA1CFEC3;
	Tue,  8 Oct 2024 11:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728386730; cv=none; b=PWzZ3blxaRt80c+GBsEVafjPIZ/mQp8/wN5o7vHiXtj5Kk4YlItONDWnjyn8HWLQWaDU9JEMq3tLWE1lhkbzfx6Kb7uBEjp9UD1E6OVWhJJNdWPp1Fl4l4uibTXCb/V3FdjY8j8XRZbOmRXB3MMSpYFyhIiTGW800FCa8Sso8Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728386730; c=relaxed/simple;
	bh=a1qO7lqPq4TE0okKrceF3Xdi/UBbj83+hLqxuXcSxMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=jMEFgXOzjs8rZ15hRImPbZ2gPj14DHWEamd6c5W1xS/MS9pBDQCcKTmboyx+/o3RBptGq+YjQJZ4auK9Px/RbUzeCskyrLbGhU4jijW7WCLPGg14itYoFMItgtzwMpZ6MFzSRab16bzNLmxGYl/0IlXWvjf0GKiWFOPXW2bYbig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W6s1ErVR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4984CbwI000565;
	Tue, 8 Oct 2024 11:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=xz1p+kUH1gG3cMmJJ11KXEV/LO0fflitjDmSBUYNZy4=; b=W6
	s1ErVRD9YAx+vtRSs7KwPAW+u2skpfuZdZJVBIWCDlUtuACqBWAQAdGZpuVPoYld
	NixeT8joFnKzZoKb9DkPQqq5gLXx7+wCyyBfce3c2HWPqEscrorn9+yvEJlPeQeV
	kuS6htdZEb6MErVsDI8nYicyOVY/L6nkn4miG+UsPVu2FpmCXij3aV8T1Y1e1lUY
	+IWV2z+nQHg0Ga6hUMy7XjFAze4BhN2tHiAxYx1Wo3WDLVr1B9byClq8Kts0tF/M
	kYFC7Zc1NCVr9ECi11QfkfdKdRKMLGgmBO0uj32bqEOjc0QUf7VP8bZQptPdV23q
	wDart299Xg09cJgvtzEQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424wgs13d1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Oct 2024 11:25:24 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 498BPKL5004167;
	Tue, 8 Oct 2024 11:25:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 422xhm2vae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 08 Oct 2024 11:25:20 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 498BPJSV004154;
	Tue, 8 Oct 2024 11:25:19 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com [10.147.244.250])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 498BPJ0Y004151;
	Tue, 08 Oct 2024 11:25:19 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
	id DDA3F5000AE; Tue,  8 Oct 2024 16:55:18 +0530 (+0530)
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
Subject: [PATCH v2 1/2] arm64: dts: qcom: sa8775p: add DisplayPort device nodes
Date: Tue,  8 Oct 2024 16:55:15 +0530
Message-Id: <20241008112516.17702-2-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241008112516.17702-1-quic_mukhopad@quicinc.com>
References: <20241008112516.17702-1-quic_mukhopad@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QuAh9sCsQRg5jh_3lNsSRDckeDeo-GZg
X-Proofpoint-ORIG-GUID: QuAh9sCsQRg5jh_3lNsSRDckeDeo-GZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=795
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080071
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add device tree nodes for the DPTX0 and DPTX1 controllers
with their corresponding PHYs found on Qualcomm SA8775P SoC.

Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 216 +++++++++++++++++++++++++-
 1 file changed, 215 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 0bf1112a0adb..3b02a80da197 100644
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
+						reg = <0>;
+						dpu_intf4_out: endpoint {
+							remote-endpoint = <&mdss0_dp1_in>;
+						};
+					};
+				};
+
 				mdss0_mdp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
@@ -3367,6 +3386,200 @@
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
+				reg = <0 0xaec5a00 0 0x200>,
+				      <0 0xaec5200 0 0xd0>,
+				      <0 0xaec5600 0 0xd0>,
+				      <0 0xaec5000 0 0x1c8>;
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
+				      <0x0 0xaf56000 0x0 0x09c>;
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
+				reg = <0 0xaf5c000 0 0x104>,
+				      <0 0xaf5c200 0 0x0c0>,
+				      <0 0xaf5d000 0 0x770>,
+				      <0 0xaf5e000 0 0x09c>;
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
@@ -3376,7 +3589,8 @@
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


