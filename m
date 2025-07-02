Return-Path: <linux-arm-msm+bounces-63337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B56AF0EA0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6012716C22C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 09:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5179C241682;
	Wed,  2 Jul 2025 09:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LEEZktMm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06232405F5;
	Wed,  2 Jul 2025 09:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446802; cv=none; b=Yq/8MVvHQPCmGd9YCN7zOBrJNCbwqlY504S4G3k1R32vAZIIBQ5y3xvFPbF5v/xXelB05uBplWeFC+DsQJ2Nxh28jD/Fp91mkZNuf5ziwNIrE3D3pcDDmwtnGraSxWwIkKMDo1H3LxPmReiFyiqQcnR6rZHWpzR+a9RHo1hBVrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446802; c=relaxed/simple;
	bh=6amfkd3yDhrtYfbUusm6namEH06wu3J+Y4dxHzI3Bu8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gu76egU5qVslkmqAqK0Y9+A46wQxgPEQ75GNHMO/t4ixufJCivOc3VYS3jAjJxoC3y6O6Lu7XDH94wsWDH32kAGFpv7BfTjGg7Cw69VDIpUSSVM9zPsltTOrx/BMRNOWPKQCDF8j5dC4LmasOPP4+tQaO5fHryk3Iy+5Dg9Tn9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LEEZktMm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561NXMeE017317;
	Wed, 2 Jul 2025 08:59:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L6tRA5enbotpRa9QG/9VYlEs
	Ywm6Wp5pd5Tzifq7ilc=; b=LEEZktMmOfQx/c8X59kfFC7oD/y7HR4XqqNl4Uhp
	bP3glC7CFkuQ4+duQe2M2AH1DdwdNcEsz+oKnJGRCMPeMWa+BJeyHNbJ0+o3IMUH
	Tt9VMGUn/VgwJOLzF/tYllenurlOz3amtGEXyE+raUnHwH4cGOJji/kzB/rUOz3a
	pjOFyxyTWcJCOlIS9v2+i12L/fzZjRMxnI1z1u9ihVbyP40dAsGBh2UjN0iiooPI
	wJvJS4BL7uaQ0J+U8EHiGYqRTWzeE8Gc3xAISR0nJFn5KGevZAJ/d9iBEhRtXTo3
	wCbskoLLqA6GgD83kEERYm2zzvIkBWT+LH3iDvlg1+XYLA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvuvvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 08:59:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5628xv6P013426
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 08:59:57 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 01:59:54 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc-owner@vger.kernel.org>
Subject: [PATCH V3 2/3] arm64: dts: qcom: Add eMMC support for qcs8300
Date: Wed, 2 Jul 2025 14:29:26 +0530
Message-ID: <20250702085927.10370-3-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250702085927.10370-1-quic_sayalil@quicinc.com>
References: <20250702085927.10370-1-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VVBjvHqgFNRmrDltpbkyF16f3ryd-dvG
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6864f50e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=b0ZiFzzozB_clkMI_cEA:9
 a=f5TC0urRpAM8nwuS:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: VVBjvHqgFNRmrDltpbkyF16f3ryd-dvG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MiBTYWx0ZWRfXzryFG2t9rW+I
 Dl9ihEGX6lSamceSWnnZnbA2XztUSpaOcRS9yD6JkMua6QQlK8yWm8w6eXPbFDo2AWhy85fBm3z
 rAiGheKrfnBdklr4T9yEswKAwRQL1rcZzhbk3qSY/99lsfHkev/6OgOzA5hpgEHZcnFhV7rh8fk
 3ulnFhOEAGTLe1InBrXa0OXIzkMjNuXq5/t9tiNoTpLB8loqkHxO2wYUDLI6bd1blQ9+/TbwQHb
 vbM0NnUXbZRmFQsxp3gL/bOUrIgR8QXUVrttsPPq20mp+n++IPo+y2s7xEwjFfeF1JjV8r2QqEI
 Jp5rh+xK+m/SRQEva+7/3FnKK3MvtusMFCGvOLw1bSrYcJsG8An6u8/absEd1A6udHTnI5LWEuE
 Rne6ucSJ+zahy1nYJEtO5JhDdZGdfHOOufZuL8DPmsGVti4AiC0PWukv+r08BfP5oH6xM15V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=817 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020072

Add eMMC support for qcs8300 board.

Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 113 ++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 7ada029c32c1..5bcb0cc65c72 100644
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
+					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
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


