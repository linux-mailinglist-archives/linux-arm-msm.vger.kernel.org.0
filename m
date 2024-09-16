Return-Path: <linux-arm-msm+bounces-31819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CA0979E1C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 11:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBC65283FE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 09:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA2A914A614;
	Mon, 16 Sep 2024 09:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q4/+2iWR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35560149C7B;
	Mon, 16 Sep 2024 09:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726478044; cv=none; b=UXhtQAKD5CVxXAHnip3gXz9TW9VUg0CCTvqEwFygmvSCTaX9lQfgZUx4+CPlc2FZUCga1ElILFpMqdtS/Q/HuV+YbsCrz6LuCLP1HD/+Cci0+eKTiuNyaH7jnC2hUhBmepAiq9b4hfqGRx36Ax6GEDjWLZBrfgrMMvWN5cLAkmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726478044; c=relaxed/simple;
	bh=OdOwhig6iCCWY1Toc4C8OCyQEoSge+5J+6k2mJhQfMw=;
	h=From:To:Cc:Subject:Date:Message-Id; b=omWpUSrrvB7gt5lVmfsnqRwOPcCcGtE5vYd7jTqqmh6E54Rx3useemjdYFaWrit7XbBBKTmI1yBMYqpcZh0FZejd6NeYbQbcEo2z/zXqelUVbmPMWHO7ZFZkgzT8sHH4QBEWfsXP/IRkHFCFZFTPApEoDBbP7tif4Q66WxSV0Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q4/+2iWR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48G0cPjK003623;
	Mon, 16 Sep 2024 09:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=JP2er7mGnj28
	16A6cxYGXb3srmwDQ9P9vqWy71lGMo4=; b=Q4/+2iWRkwoQwdlt8hUoGIyKY3B/
	svwVVNcoFuzvoOYvNwtNVfACdwDqaDpowy6/ZqpYpMU5f6XcmuyWKE9bqIuiDEX0
	XIVbInV0Jn8NNlrEMw/jbAfP0y54Xfs7+LrSV27C73fVUNxrc+2dvWXJjm1I8NiC
	027bm8jDKe/VcgqUV1tc9+CMovds+AQKuxc87QY+pSkJDGWGPx6NOhGzrl8zdhTT
	HllEXIosxSrwwzRnE8s0t4PuI9dAfkTOxWQ4lq7PlfraoySSVD2hmyariNY3L3d6
	t2KkCitYwG8O1lesXPDUZQFMh/5vjrxgf3IjvFvornbTwjtRDvriBrLnIw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4jdkegg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Sep 2024 09:13:59 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 48G9DuaV004380;
	Mon, 16 Sep 2024 09:13:56 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 41n3jkr9jp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 16 Sep 2024 09:13:56 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 48G9CdfA003519;
	Mon, 16 Sep 2024 09:13:55 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-mukhopad-hyd.qualcomm.com [10.147.244.250])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 48G9DtaP004369;
	Mon, 16 Sep 2024 09:13:55 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 3978529)
	id 0E9415000A9; Mon, 16 Sep 2024 14:43:55 +0530 (+0530)
From: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_riteshk@quicinc.com,
        quic_vproddut@quicinc.com, quic_abhinavk@quicinc.com
Subject: [PATCH] arm64: dts: qcom: sa8775p: add DisplayPort device node
Date: Mon, 16 Sep 2024 14:43:44 +0530
Message-Id: <20240916091344.27607-1-quic_mukhopad@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hnURpwja61BbYFTkZ4Zs8SgRMZ7Do1-U
X-Proofpoint-GUID: hnURpwja61BbYFTkZ4Zs8SgRMZ7Do1-U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=772 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409160058
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add device tree node for the DisplayPort controller
and eDP PHY found on the Qualcomm SA8775P SoC.

Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
---
This patch depends on following series:
https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
https://lore.kernel.org/all/20240912071437.1708969-1-quic_mahap@quicinc.com/
https://lore.kernel.org/all/20240913103755.7290-1-quic_mukhopad@quicinc.com/
 
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi |  23 +++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi      | 114 ++++++++++++++++++++-
 2 files changed, 136 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 0c1b21def4b6..728b4cda8353 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -421,6 +421,23 @@
 	status = "okay";
 };
 
+&mdss0 {
+	status = "okay";
+};
+
+&mdss0_dp0 {
+	status = "okay";
+};
+
+&mdss0_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss0_edp_phy0 {
+	status = "okay";
+};
+
 &pmm8654au_0_gpios {
 	gpio-line-names = "DS_EN",
 			  "POFF_COMPLETE",
@@ -527,6 +544,12 @@
 };
 
 &tlmm {
+	dp_hot_plug_det: dp-hot-plug-det-state {
+		pins = "gpio101";
+		function = "edp0_hot";
+		bias-disable;
+	};
+
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {
 			pins = "gpio8";
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 7747965e7e46..a04150c29565 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3339,6 +3339,18 @@
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
+				};
+
 				mdss0_mdp_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
@@ -3363,6 +3375,106 @@
 					};
 				};
 			};
+
+			mdss0_edp_phy0: phy@aec2a00 {
+				compatible = "qcom,sa8775p-edp-phy";
+
+				reg = <0x0 0xaec2a00 0x0 0x200>,
+					<0x0 0xaec2200 0x0 0xd0>,
+					<0x0 0xaec2600 0x0 0xd0>,
+					<0x0 0xaec2000 0x0 0x1c8>;
+
+				clocks = <&rpmhcc RPMH_CXO_CLK>,
+					 <&gcc GCC_EDP_REF_CLKREF_EN>;
+				clock-names = "aux",
+					      "cfg_ahb";
+
+				vdda-phy-supply = <&vreg_l1c>;
+				vdda-pll-supply = <&vreg_l4a>;
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss0_dp0: displayport-controller@af54000 {
+				compatible = "qcom,sa8775p-dp";
+
+				pinctrl-0 = <&dp_hot_plug_det>;
+				pinctrl-names = "default";
+
+				reg = <0x0 0xaf54000 0x0 0x104>,
+					<0x0 0xaf54200 0x0 0x0c0>,
+					<0x0 0xaf55000 0x0 0x770>,
+					<0x0 0xaf56000 0x0 0x09c>;
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
+						"core_aux",
+						"ctrl_link",
+						"ctrl_link_iface",
+						"stream_pixel";
+				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc0 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
+				assigned-clock-parents = <&mdss0_edp_phy0 0>, <&mdss0_edp_phy0 1>;
+				phys = <&mdss0_edp_phy0>;
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
+						mdss0_dp0_in: endpoint {
+							remote-endpoint = <&dpu_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
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
 		};
 
 		dispcc0: clock-controller@af00000 {
@@ -3372,7 +3484,7 @@
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>,
-				 <0>, <0>, <0>, <0>,
+				 <&mdss0_edp_phy0 0>, <&mdss0_edp_phy0 1>, <0>, <0>,
 				 <0>, <0>, <0>, <0>;
 			power-domains = <&rpmhpd SA8775P_MMCX>;
 			#clock-cells = <1>;
-- 
2.17.1


