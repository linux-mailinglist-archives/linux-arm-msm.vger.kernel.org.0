Return-Path: <linux-arm-msm+bounces-65179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAD2B070EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 10:52:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 430D33ABC67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 08:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 246F52EFDAA;
	Wed, 16 Jul 2025 08:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="g07jgE1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821E02EF9DF;
	Wed, 16 Jul 2025 08:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752655916; cv=none; b=DiyvhyIWhhrGs9JIDaMybPvCx9owL40456cTrWV6b0GOM05V0Bne3vCJb9eDXmJy6f6koWL9IgtEvkiZcy+R8vwlF1TFtEjzhfwhsPBxt4VujQkNRq+trOk6IvbtQZ/j1ZwfBDWi/GplFMEpnHJ5/amCoeTiTxt/9D9z+hadQLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752655916; c=relaxed/simple;
	bh=6l4mvcW+nA9tFn5J6qlEysjyfoQtWee12jRDL4tk/6I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JOmV0FQinfA4cmVJQMxk3NIl4QOO1u3v0pdBAdTMI/s11eL++Pv/fnTFnTwudw2LL2tHqiOh8/q+nq1eBucLVs+SDNLDSv7wLSSWUkcg5kP9pIBl8PwkKEVbuxTOqTOLvvlggxzJ34F8uH7zGAZXJvOCrQc++O1a3GrqqJTDaTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=g07jgE1/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56G6TpNB025985;
	Wed, 16 Jul 2025 08:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hdlessOD8UwPFp3VGMSmgrnh
	H4csjMRttOzuhAlpmak=; b=g07jgE1/WcCO7wJUo2UbVe0ZkSmjgmX5LeXnmBsw
	awsEypkY5tZ9x8EFCs81i2CBWXVGshoi56V4Q8T/hV3MNg9Q1LkXGNANNyov5IK2
	hA4aHI0OPAirDnxPEoxRHEXzo/Ai35megXmT4X3f4xcEdZucebKMOzZjekL7g0Hk
	2/x6gOxDx0HUXCMVgQ/bwwqgEN90swwB8R8faSbGroz/lGWcN8cRhELCaFqXSUOJ
	XT7FSatBvJ1QkzGpvl/0yTpP94BtwIb7qIlxW7uJ6xz+3Y9DzjILCx6FTg2Ihd9r
	iyvsscFQc1khDE42yyWviP8QrR+D5xuWn6OX8xUo9LDYHA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfca4f2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 08:51:50 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56G8pnAZ003881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Jul 2025 08:51:49 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 16 Jul 2025 01:51:46 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc@vger.kernel.org>
Subject: [PATCH V4 1/2] arm64: dts: qcom: Add eMMC support for qcs8300
Date: Wed, 16 Jul 2025 14:21:24 +0530
Message-ID: <20250716085125.27169-2-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250716085125.27169-1-quic_sayalil@quicinc.com>
References: <20250716085125.27169-1-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDA3OSBTYWx0ZWRfX2zmJcDqabaz+
 kqyRpDXLVUo99DM1nC42GXr4JXWhtvl0moMoPeVb6JUkr7gxZ1fHMB0kP05g1VV8jb6Ma4cj6RL
 TXn+FJEL/6OF+imF5mtV9N5Ok4h6m1n6vACLL+i7DdLi+rSeSdMD1h+o7TrIb6+fkQNYnaQQgwQ
 zeEp9aBRYc0pINCCozz0VPt9S/d8cGc3Db/cdb1XK3d6/PA/7uBB94CKSE/5R/v7Vu9/x89ZFbh
 CDbGE2fZP8x3Yycby5ehN/eQ5TS15oFnFv2ZFFsgF4A1QMef7cSFtps5JFkn91/AJMdveIQOO4H
 ogwrzsp7p59MBgtiJgWbZdCwsWaqPyu2c8r53UXoD9s8/8jeTF5jdIVRqX2VyNYpAic6/5sldE8
 /rhjvQ+dWLv9AGw3M86V9mKWvfgzKptHJZ+tdtJcFNfqWz9NCH2kyzSbN0NNrr8XpdUtmb2l
X-Proofpoint-GUID: R1h_7hz0F2MoF8UurjNbCpowqNKPxA80
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=68776826 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=b0ZiFzzozB_clkMI_cEA:9 a=D6DLMx0A_OsgyBFb:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: R1h_7hz0F2MoF8UurjNbCpowqNKPxA80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_01,2025-07-15_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507160079

Add eMMC support for qcs8300 board.

Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 113 ++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 7ada029c32c1..a82a65a93346 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -3837,6 +3837,69 @@
 			clock-names = "apb_pclk";
 		};
 
+		sdhc_1: mmc@87c4000 {
+			compatible = "qcom,qcs8300-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x087c4000 0x0 0x1000>,
+			      <0x0 0x087c5000 0x0 0x1000>;
+			reg-names = "hc",
+				    "cqhci";
+
+			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			resets = <&gcc GCC_SDCC1_BCR>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc1_opp_table>;
+			iommus = <&apps_smmu 0x0 0x0>;
+			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDC1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			qcom,dll-config = <0x000f64ee>;
+			qcom,ddr-config = <0x80040868>;
+			supports-cqe;
+			dma-coherent;
+
+			status = "disabled";
+
+			sdhc1_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -5042,6 +5105,56 @@
 				pins = "gpio13";
 				function = "qup2_se0";
 			};
+
+			sdc1_state_on: sdc1-on-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc1_state_off: sdc1-off-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					drive-strength = <2>;
+					bias-bus-hold;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-bus-hold;
+				};
+			};
 		};
 
 		sram: sram@146d8000 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


