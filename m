Return-Path: <linux-arm-msm+bounces-40646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 789959E6440
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 03:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 009D818854AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 02:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C343E17B50F;
	Fri,  6 Dec 2024 02:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nDtWiVDA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D712F1552F5;
	Fri,  6 Dec 2024 02:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733452676; cv=none; b=tebpsZVhMT5XwtPhSh1qLOAhuZuFVQMWi6wf0f1P2Tp4d9JrN6kqBenYv4axUPXAtPVLIhJo9P3gKU9twOE+2KkXAE0gINpLUFPBy05JyvFzn7I462AuOS8H5DbJONyCJ0KOO3CS26dRs3xLnMb3FPSWkjzdpBSPWdBHPgR9+ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733452676; c=relaxed/simple;
	bh=ol2cznU1w+j5IiGaoeXajxCkfPG8SZt7i8x99O+g3l4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E91YtOMdz//D7+1r4fm/sbDiJs+ppokyTXQjjRYZGKUqAgmoOy3zJ9WkJb0JVeqSTakTpmxopkwUxwYwloWM0W4JZCfOq2OQqapwNNtVdykIozjSDDEASbRHDXcXRJaf5oS05tNFzV78xxW75PjSwoqkYk0bofDK+yWucE0l1RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nDtWiVDA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaMR4031086;
	Fri, 6 Dec 2024 02:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BgLnD6VMwOw
	RCfwHAC0oCKL7x+TeF6PKi3c+ejwofyk=; b=nDtWiVDAaJk5BOB4HX+mWEncr4C
	Iu0GcCEME+fkU/FROZcObcz7+njcmEQAj8fFRuahCXCZSLJgKE5efIlLDDSz2c+V
	lzx4N65FtLlU3b/NxsZRHx86vWSoRUtq5iTMFItm8VlGojx+gUXUO5wmNHruJxi3
	7HwvADJL+eP/OS/elVXi/r6rYlxnyu2Rx4LzNtZehnqahIQjGuwxAToMxT7T5bo7
	uxCBWKkCXyoB53yFnfNDQeRweaM7bSlmLCQtVK1mNM63Fp9CU1msfjAM+vp9M9oN
	Z7Nk6BDZPwgDVarAZWXyy+CSf1yhJactGuraHPQ63oFgxJ5bhI5g8Zo1Hqw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43be171mtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:37:50 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B62blTZ011449;
	Fri, 6 Dec 2024 02:37:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 437uskw216-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:37:47 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4B62blD7011438;
	Fri, 6 Dec 2024 02:37:47 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (cse-cd02-lnx.qualcomm.com [10.64.75.246])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4B62bkRi011430
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 02:37:47 +0000
Received: by cse-cd02-lnx.ap.qualcomm.com (Postfix, from userid 4571896)
	id 1D9A01A2B; Fri,  6 Dec 2024 10:37:45 +0800 (CST)
From: Yuanjie Yang <quic_yuanjiey@quicinc.com>
To: ulf.hansson@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, bhupesh.sharma@linaro.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Subject: [PATCH v4 1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
Date: Fri,  6 Dec 2024 10:37:10 +0800
Message-Id: <20241206023711.2541716-2-quic_yuanjiey@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241206023711.2541716-1-quic_yuanjiey@quicinc.com>
References: <20241206023711.2541716-1-quic_yuanjiey@quicinc.com>
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
X-Proofpoint-GUID: -WuR37eWUFidyGx-OZ-qAtmUYRVexqf3
X-Proofpoint-ORIG-GUID: -WuR37eWUFidyGx-OZ-qAtmUYRVexqf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060017

Add SDHC1 and SDHC2 support to the QCS615 Ride platform.

Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 209 +++++++++++++++++++++++++++
 1 file changed, 209 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 590beb37f441..e52bf8c77884 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -399,6 +399,72 @@ qfprom: efuse@780000 {
 			#size-cells = <1>;
 		};
 
+		sdhc_1: mmc@7c4000 {
+			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x007c4000 0x0 0x1000>,
+			      <0x0 0x007c5000 0x0 0x1000>,
+			      <0x0 0x007c8000 0x0 0x8000>;
+			reg-names = "hc",
+				    "cqhci",
+				    "ice";
+
+			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo",
+				      "ice";
+
+			resets = <&gcc GCC_SDCC1_BCR>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc1_opp_table>;
+			iommus = <&apps_smmu 0x02c0 0x0>;
+			interconnects = <&aggre1_noc MASTER_SDCC_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			qcom,dll-config = <0x000f642c>;
+			qcom,ddr-config = <0x80040868>;
+			supports-cqe;
+			dma-coherent;
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
 		qupv3_id_0: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x6000>;
@@ -494,6 +560,149 @@ qup_uart0_rx: qup-uart0-rx-state {
 				pins = "gpio17";
 				function = "qup0";
 			};
+
+			sdc1_state_on: sdc1-on-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <10>;
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
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc2_state_on: sdc2-on-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+			};
+
+			sdc2_state_off: sdc2-off-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					bias-disable;
+					drive-strength = <2>;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					bias-pull-up;
+					drive-strength = <2>;
+				};
+			};
+		};
+
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x08804000 0x0 0x1000>;
+			reg-names = "hc";
+
+			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+			iommus = <&apps_smmu 0x02a0 0x0>;
+			resets = <&gcc GCC_SDCC2_BCR>;
+			interconnects = <&aggre1_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			qcom,dll-config = <0x0007642c>;
+			qcom,ddr-config = <0x80040868>;
+			dma-coherent;
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
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
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		dc_noc: interconnect@9160000 {
-- 
2.34.1


