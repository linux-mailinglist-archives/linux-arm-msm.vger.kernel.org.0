Return-Path: <linux-arm-msm+bounces-28086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5927C94A7C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 14:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A051B22760
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 12:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FD91E4F06;
	Wed,  7 Aug 2024 12:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JqdKIgBM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D4A1E2101;
	Wed,  7 Aug 2024 12:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723034152; cv=none; b=GwRFkRr9YUZA80DO/tvxULykUAvAlk9YuLrDpM3ZV5073PJjboKim0kPCHPrZPRg+MBPj0i/GWfDlxcbGetXgx4bBQWv1v3C8M0nBE0T+4fPI3BlsHWT4JzNTLSbpQgmgqNr72u2MmfF7xV005xx4kvjvMuJ6IB2tLWHVa9udlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723034152; c=relaxed/simple;
	bh=XnakSmJSYzdOC65tVi+UeRuR5JsqvisVupHXus9ob5c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=F3FPHcJdH37nDg124NBapC3fQUK1KpxEJjdjuUx5H2C8lF0zGCQoOUZ3WWsMlAJ59RgqDM8AQo1rVM/mxxxXEsoz1mFJxEqY7d9Ve42hk+I1aXAfjGzl7FOhMXVCr99DY+bIMvfKd+JfaOPZL2vNv3j1MxNphA3iSyj7VgTwFio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JqdKIgBM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4775SmUt020305;
	Wed, 7 Aug 2024 12:35:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zoJ3DaLKFdn76VyzYgoUBn
	bpBNojCLHHAe42Ue/3U+I=; b=JqdKIgBMswWiXEgpICdVqBQHyRHtGUN1idWwiv
	TAC4VEabfBSJPy9F/ruBqIUjfM71oNYdhZFsKV3cXEZsXLTp0GpafRNEBc8F0DNz
	vQ1EMO9xoQQHm1TmCZCvPr63qxSt7wWbaxD08UnFPyDXg8LSVgEowHBxKkHhiClx
	jGEEZJz1DHxhxdEqwx5eaqxQv1bMLxkt6r+PMwHTZwrh7YCy6vercHBac9bpHWDL
	9lPwS6I/UQDW4YtL7yUtXulkqa9g57KnrskE4ckJ55CPR+RVvNr6XiQQSjTh0Jd/
	Hf43iFqBKkUB726u799Z/k3X3dalv/crrGU/z0361hBOb3iQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40v2t714k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Aug 2024 12:35:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 477CZhoD008740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 Aug 2024 12:35:43 GMT
Received: from hu-depengs-sha.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 Aug 2024 05:35:38 -0700
From: Depeng Shao <quic_depengs@quicinc.com>
To: <andersson@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bryan.odonoghue@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Depeng Shao
	<quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: sm8550: camss: Add CAMSS block definition
Date: Wed, 7 Aug 2024 18:03:33 +0530
Message-ID: <20240807123333.2056518-1-quic_depengs@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: icuAXYZ0HupTySfM1PJK0g91rD_pHmSh
X-Proofpoint-ORIG-GUID: icuAXYZ0HupTySfM1PJK0g91rD_pHmSh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_08,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=979 impostorscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408070088

Add CAMSS block definition for sm8550.

This drop contains definitions for the following components on sm8550:

VFE * 3
VFE Lite * 2
CSID * 3
CSID Lite * 2
CSIPHY * 8

Co-developed-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Yongsheng Li <quic_yon@quicinc.com>
Signed-off-by: Depeng Shao <quic_depengs@quicinc.com>
---
This dtsi definition has been developed and validated on a AIM300 AIoT
board, the description for this board can be found from below link.
https://lore.kernel.org/lkml/20240618072202.2516025-1-quic_tengfan@quicinc.com/

The driver and bindings change can be found from below link.
https://lore.kernel.org/all/20240709160656.31146-1-quic_depengs@quicinc.com/
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 199 +++++++++++++++++++++++++++
 1 file changed, 199 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 4c9820adcf52..58fc8792953d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2747,6 +2747,205 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: camss@acb7000 {
+			compatible = "qcom,sm8550-camss";
+
+			reg = <0 0x0acb7000 0 0xd00>,
+			      <0 0x0acb9000 0 0xd00>,
+			      <0 0x0acbb000 0 0xd00>,
+			      <0 0x0acca000 0 0xa00>,
+			      <0 0x0acce000 0 0xa00>,
+			      <0 0x0acb6000 0 0x1000>,
+			      <0 0x0ace4000 0 0x2000>,
+			      <0 0x0ace6000 0 0x2000>,
+			      <0 0x0ace8000 0 0x2000>,
+			      <0 0x0acea000 0 0x2000>,
+			      <0 0x0acec000 0 0x2000>,
+			      <0 0x0acee000 0 0x2000>,
+			      <0 0x0acf0000 0 0x2000>,
+			      <0 0x0acf2000 0 0x2000>,
+			      <0 0x0ac62000 0 0xf000>,
+			      <0 0x0ac71000 0 0xf000>,
+			      <0 0x0ac80000 0 0xf000>,
+			      <0 0x0accb000 0 0x1800>,
+			      <0 0x0accf000 0 0x1800>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_top",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "csiphy4",
+				    "csiphy5",
+				    "csiphy6",
+				    "csiphy7",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_2_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY5_CLK>,
+				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY6_CLK>,
+				 <&camcc CAM_CC_CSI6PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY7_CLK>,
+				 <&camcc CAM_CC_CSI7PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_2_CLK>,
+				 <&camcc CAM_CC_IFE_2_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>;
+
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cpas_fast_ahb_clk",
+				      "cpas_ife_lite",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe2",
+				      "csid",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "csiphy5",
+				      "csiphy5_timer",
+				      "csiphy6",
+				      "csiphy6_timer",
+				      "csiphy7",
+				      "csiphy7_timer",
+				      "csiphy_rx",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "gcc_axi_hf";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_CAMERA_CFG 0>,
+					<&mmss_noc MASTER_CAMNOC_HF 0 &mc_virt SLAVE_EBI1 0>,
+					<&mmss_noc MASTER_CAMNOC_ICP 0 &mc_virt SLAVE_EBI1 0>,
+					<&mmss_noc MASTER_CAMNOC_SF 0 &mc_virt SLAVE_EBI1 0>;
+			interconnect-names = "ahb",
+					     "hf_0_mnoc",
+					     "icp_mnoc",
+					     "sf_0_mnoc";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "csiphy4",
+					  "csiphy5",
+					  "csiphy6",
+					  "csiphy7",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			iommus = <&apps_smmu 0x800 0x20>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_IFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,sm8550-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
-- 
2.34.1


