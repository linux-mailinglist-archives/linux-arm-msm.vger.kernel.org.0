Return-Path: <linux-arm-msm+bounces-86621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C881CDDE6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 16:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEE16302B108
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Dec 2025 15:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5958732C92F;
	Thu, 25 Dec 2025 15:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fF+guX6/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4B932B9A4;
	Thu, 25 Dec 2025 15:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766676118; cv=none; b=FEDPu3bDokLebYAaPD1tn+nGA2D6MvrjXz5qbXXtoV2XFctVkOUjivWlRYhtwu5L+L1jN0UFy8MALc0SUDaovXr6GIk/slj6jEc9pJ4RNjtur63IgOOh9Iauaag0EJ/Q20ZLMonL6Ke4nMels0ku1XpfwxDNlAyCZge5+BQZrWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766676118; c=relaxed/simple;
	bh=iuvC3oSmiW5o3z+jW9/Zvqecu3n7l+PJZQfv7+BObYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KFEPwqcPQDmTGWtiX4BSHktbTvPWnZ1O8DdGd/JxjrZyKfxzsDkkM/1vL2UviKjL4Fgzwoy6SMkCLzuENDTdBkKchd75LcrZ2ZgSF20YLYEWZrlYepOBw6WXDerbKPr/9NJl+ZKEy3sz7LpSTog2hoXyRsg2AWZj8fFnMbxulfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fF+guX6/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BPESLf82755720;
	Thu, 25 Dec 2025 15:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sfuY8T7VrKl
	Zy68Jw/cc6ox0Gb6pOHktkw2m8HOhcaI=; b=fF+guX6/gC8+erGYhF6MeU7dsM/
	xAsBO5cNdSKgiCxmg3xeeOErC4we7Hom+0YQB2w7FMmggf6zmmxOaKoL8XoUvtkD
	8EfuAderuVYSHgj/4Oiv2qkzadbWbExuhpnDwl1uLJKoyqvW1Mmy0x9s8zGR+UJb
	BM+UPXucgdJg4zq1Vu11nHDSQRnx0VWDbFj1vz7noJNYz1IMgkPx+8bx9ir6VL/j
	Q2RcTYMEOmgOBGtFw87Csu6LstZhABw1vCngLllULCPGI61ppAze9u9i40ZR5ydW
	i/4cSa54Iyn7T5MPX8T/h5Cee7KkjqVA7xiuM4Wfy8nBvW3hAklNGqYbIdA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b8kbusw0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Dec 2025 15:21:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BPFLbZ8006283;
	Thu, 25 Dec 2025 15:21:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4b5mvn0fw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Dec 2025 15:21:37 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BPFLang006255;
	Thu, 25 Dec 2025 15:21:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BPFLaqO006247
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Dec 2025 15:21:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 911655A4; Thu, 25 Dec 2025 20:51:35 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: [PATCH v4 4/5] arm64: dts: qcom: qcs8300: add Display Serial Interface device nodes
Date: Thu, 25 Dec 2025 20:51:33 +0530
Message-Id: <20251225152134.2577701-5-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
References: <20251225152134.2577701-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI1MDE0NyBTYWx0ZWRfX8eNbVeLxS+dM
 JJVjDf1yjLHD6ADi6/WLQpEykJw3iEFK6UjTqSy5i5/CmDd+28HdMDM5Pel33XqnvqZUhB9g2ll
 wL0tEn70wmP+v1OSWOfSHl19I2xynnLysPXE5OE2UW+a+4CtRAH5riTmH3yAzycsOWxHtqnObth
 wd2YTwyZ8CtWHGJLntW5gEqKtDZsvbSf2yj6HUS5iUd88g2xFQfqB6Grqk/f35qXs1/e1xqo3N6
 X9XoRr+X5SEs+riksfRLINpOWJoEisggNPueKlB7EjM3ktNVxYZ61NLhtoqgfwx/9jN+VpT+PkE
 qgrIp4TN1PXWvOYnUXTRH6ta1kgGk5OUJySgk6zDMsewbda0XV36425/Sg4pe1Lf1ACHG/8TX6H
 TPDRbd+sSv3yQxEtTIFxoxISGfY+6oZ1vDUoALkiYPnc+NCe4G0bZdGRylfWcYthgzqnuXG4DXT
 1mx8jAJ8wIbKh4VDHUg==
X-Authority-Analysis: v=2.4 cv=Vtguwu2n c=1 sm=1 tr=0 ts=694d5684 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=1g-yL74UmBKldWw2PtEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pb8OqV3zf-8S55jw3WmiNN_2eVz7nlyw
X-Proofpoint-GUID: pb8OqV3zf-8S55jw3WmiNN_2eVz7nlyw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-25_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512250147

Add device tree nodes for the DSI0 controller with their corresponding
PHY found on Qualcomm QCS8300 SoC.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 102 ++++++++++++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e44fd5c33816..052ccfa6a147 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcs8300-gcc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
@@ -4858,9 +4859,18 @@ port@0 {
 						reg = <0>;
 
 						dpu_intf0_out: endpoint {
+
 							remote-endpoint = <&mdss_dp0_in>;
 						};
 					};
+
+					port@1 {
+						reg = <1>;
+						dpu_intf1_out: endpoint {
+
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -4888,6 +4898,94 @@ opp-650000000 {
 				};
 			};
 
+			mdss_dsi0: dsi@ae94000 {
+				compatible = "qcom,qcs8300-dsi-ctrl",
+					     "qcom,sa8775p-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x0ae94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				phys = <&mdss_dsi0_phy>;
+
+				operating-points-v2 = <&mdss_dsi_opp_table>;
+				power-domains = <&rpmhpd RPMHPD_MMCX>;
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
+						mdss_dsi0_in: endpoint {
+
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+
+				mdss_dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-358000000 {
+						opp-hz = /bits/ 64 <358000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@ae94400 {
+				compatible = "qcom,qcs8300-dsi-phy-5nm",
+					     "qcom,sa8775p-dsi-phy-5nm";
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
+				clocks = <&dispcc MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface",
+					      "ref";
+
+				status = "disabled";
+			};
+
 			mdss_dp0_phy: phy@aec2a00 {
 				compatible = "qcom,qcs8300-edp-phy", "qcom,sa8775p-edp-phy";
 
@@ -5015,7 +5113,9 @@ dispcc: clock-controller@af00000 {
 				 <&mdss_dp0_phy 0>,
 				 <&mdss_dp0_phy 1>,
 				 <0>, <0>,
-				 <0>, <0>, <0>, <0>;
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <0>, <0>;
 			power-domains = <&rpmhpd RPMHPD_MMCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
-- 
2.34.1


