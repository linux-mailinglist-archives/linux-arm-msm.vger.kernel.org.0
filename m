Return-Path: <linux-arm-msm+bounces-61092-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB38CAD6C0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 11:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FFA416A74A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 09:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F28322B8A1;
	Thu, 12 Jun 2025 09:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hU28X8hg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82E21DDC1B;
	Thu, 12 Jun 2025 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720141; cv=none; b=o5x/SpzFEod4X/JSrrGob17trh0vuBBk+l9KkrunyfyLl7yJ1Ff/HXjQMqkuEDYyJPpKQtxmtPvQTgrKzUgyReH26jm6S69dp3GER9lonDwUCHxBMe3eeVEva7/sfLAE+OOz6JThJL9ctpCDZ+MzMeuVZpOQhyYQsVGwZ+IRqqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720141; c=relaxed/simple;
	bh=7XNS1aUJRbfoWDN0coF9pdHz0tVuNeMUvOe6Q83QQpQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WRH+MRJlZm+6ay545YQx1GGviADmqiAivZ7wKTUQk/CWX0GRIC9pXcTnGWZYAJClAh0e4luDwZmG7hxaxXX4Jpn776ILbP/4EQoL8LPqtSm2w2s1nWV1FWlB5BuobEWyd2v/CGNnTMKSBlHe4ohwThDEYXxY/wACcZ0+7OyIKVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hU28X8hg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C8DWjp002500;
	Thu, 12 Jun 2025 09:22:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=c7KhTzx2OvQ3vzPsYNmpMR+r
	FbrDC1nhaTUKZXLXpJ4=; b=hU28X8hgNLDzQ9uIaKzN01n2SfiDctT3SKnVWDHC
	sPabzlidyZtK6a0aJOACEooBELYukWu6DktUrW7wYjGtlxtzHaruQStH974w4JyW
	TgCfaSdWri07PeKsDtn4GFnoX2y3E2lkkTH2SAq4k1serVEe5UOtZhnw3gSUzww0
	P11NiF7hdNr27RyMIh91O+voiRmQWmV7Gd+wpgB+h8MXAWEoFAz82Si6MwR0E0JR
	zhRnvekN4/0/NJc6ov+NKye92n9SD4O8aRU2Tt+gGDDC+hwRE5V0xMpkV2gbC9aL
	nJGJbCNBpwfLF8ttUD4DnMeSCXKF1+a8IutdEblcqqoxTg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgy07gr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 09:22:14 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55C9MD23004696
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 09:22:13 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Jun 2025 02:22:09 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mmc-owner@vger.kernel.org>
Subject: [PATCH 1/1] arm64: dts: msm: Add eMMC support for qcs8300
Date: Thu, 12 Jun 2025 14:51:46 +0530
Message-ID: <20250612092146.5170-2-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250612092146.5170-1-quic_sayalil@quicinc.com>
References: <20250612092146.5170-1-quic_sayalil@quicinc.com>
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
X-Proofpoint-GUID: Y54kBDnqBbsdVGxPtqTYif4I0csf8zhd
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684a9c46 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=mS0N-vkzNUTjQwVmwkwA:9
 a=dK27cBEjEv8H6vpz:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Y54kBDnqBbsdVGxPtqTYif4I0csf8zhd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3MSBTYWx0ZWRfX/h8qeNc3am9r
 NuoqXp2fb8qjirRdOgmEyWklGURhg1QnU/brTHlpCsK3q2nBMRsHOYXdxBR39F1pj2MmOy0qxeO
 TDkZ/conbUE0ST+RW8Mm5RYjMDhmBwDu4YazCobnUB2klMHNJzXFRX7rungv2Uu9vmpmPdesZv8
 h27PooXPLx9OtdVUnr9aLR6Cz+8rNsrBNUy3JrFFXxDR0TaLsH9T3yXldU85zXgA//2mut1NvHo
 xYTxoQYgPXmsDbJcYeNMG2DtfAHjha84GCHaNa9JCY7pzkWaGvNUcQ1ozloqO5qSkF+9bd36S0/
 WpYi2tkVXgfNLRHWovqOiRiLyucyhGVxTvV1x0cBkNKw3Xoxt/lUWVMUgtsVKc1bZE90EwFTE/y
 q7+2oFcfwbivBQ10zC4ZOTKC6wGl5v/pAtoFVqrhLXQk1B/oXoA6YLeMxxGf7AdWVT2K9HOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=691 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120071

Add eMMC support for qcs8300 board.

Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 33 ++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 97 +++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 8c166ead912c..73aabed0f4f9 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -407,3 +407,36 @@
 &usb_2_dwc3 {
 	dr_mode = "host";
 };
+
+&sdc1_clk {
+	bias-disable;
+	drive-strength = <16>;
+};
+
+&sdc1_cmd {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
+&sdc1_data {
+	bias-pull-up;
+	drive-strength = <10>;
+};
+
+&sdc1_rclk {
+	bias-pull-down;
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s4a>;
+
+	no-sd;
+	no-sdio;
+	non-removable;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc1_clk>, <&sdc1_cmd>, <&sdc1_data>;
+	pinctrl-1 = <&sdc1_clk_sleep>, <&sdc1_cmd_sleep>, <&sdc1_data_sleep>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 7ada029c32c1..5dee0b913b88 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -3837,6 +3837,62 @@
 			clock-names = "apb_pclk";
 		};
 
+		sdhc_1: mmc@87C4000 {
+			compatible = "qcom,sdhci-msm-v5";
+			status = "disabled";
+
+			reg = <0x0 0x87C4000 0x0 0x1000>,
+				<0x0 0x87C5000 0x0 0x1000>;
+			reg-names = "hc", "cqhci";
+
+			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+					<&gcc GCC_SDCC1_APPS_CLK>,
+					<&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface", "core", "xo";
+			interconnects = <&aggre1_noc MASTER_SDC 0 &mc_virt SLAVE_EBI1 0>,
+					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDC1 0>;
+			interconnect-names = "sdhc-ddr","cpu-sdhc";
+
+			operating-points-v2 = <&sdhc1_opp_table>;
+			bus-width = <8>;
+			supports-cqe;
+			dma-coherent;
+
+			qcom,dll-config = <0x000F64EE>;
+			qcom,ddr-config = <0x80040868>;
+
+			mmc-ddr-1_8v;
+			mmc-hs200-1_8v;
+			mmc-hs400-1_8v;
+			mmc-hs400-enhanced-strobe;
+
+			iommus = <&apps_smmu 0x0 0x0>;
+
+			resets = <&gcc GCC_SDCC1_BCR>;
+
+			sdhc1_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1800000 400000>;
+					opp-avg-kBps = <100000 0>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <5400000 1600000>;
+					opp-avg-kBps = <390000 0>;
+				};
+			};
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -5042,6 +5098,47 @@
 				pins = "gpio13";
 				function = "qup2_se0";
 			};
+
+			sdc1_clk: sdc1-clk-state {
+				pins = "sdc1_clk";
+
+			};
+
+			sdc1_cmd: sdc1-cmd-state {
+				pins = "sdc1_cmd";
+			};
+
+			sdc1_data: sdc1-data-state {
+				pins = "sdc1_data";
+			};
+
+			sdc1_rclk: sdc1-rclk-state {
+				pins = "sdc1_rclk";
+			};
+
+			sdc1_clk_sleep: sdc1-clk-sleep-state {
+				pins = "sdc1_clk";
+				drive-strength = <2>;
+				bias-bus-hold;
+			};
+
+			sdc1_cmd_sleep: sdc1-cmd-sleep-state {
+				pins = "sdc1_cmd";
+				drive-strength = <2>;
+				bias-bus-hold;
+			};
+
+			sdc1_data_sleep: sdc1-data-sleep-state {
+				pins = "sdc1_data";
+				drive-strength = <2>;
+				bias-bus-hold;
+			};
+
+			sdc1_rclk_sleep: sdc1-rclk-sleep-state {
+				pins = "sdc1_rclk";
+				drive-strength = <2>;
+				bias-bus-hold;
+			};
 		};
 
 		sram: sram@146d8000 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


