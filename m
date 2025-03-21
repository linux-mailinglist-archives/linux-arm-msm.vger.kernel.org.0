Return-Path: <linux-arm-msm+bounces-52178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B13A6BB35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 13:52:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65F1A1B61FEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 12:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC1A22B59A;
	Fri, 21 Mar 2025 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ih61UcCo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7B1221DBA;
	Fri, 21 Mar 2025 12:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742561423; cv=none; b=Qbzcs58cltKNJ/9OKVxhW9RhqoMN4NNMPTjF7iVxfGhJwVszgXlgristMHnyyQo4FVXdT6TCUTjmAsu63a8qKRf9UJxn3x2CTaahOtIC1ng9LIiU8/iSd79JcaysaU2a2sLPZx9wal9bYe6QGrmu6CmGf5g1uFWnaRI/x5jzLSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742561423; c=relaxed/simple;
	bh=7ZtzWxnI+o1EvFXihMZ4o1zzmHsVAbaiaWfi2wRcidQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=hAm1gWMJxenn44Ui1WUbh1tXwPj5Iy3lTdY3ZTvjjLxU6Xuv84CQgcaaLSIRxo+dl9XG7DyuL4TAtE4xsHIkMXHQMbpq66Qip7cYYLZM0XVl+E6VAKuJe+sHPSCJicZWuR84YVWfQp5Az5+8X8vyWkuisZ9lxRPEWKBl+wyaBcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ih61UcCo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52LATBgh022185;
	Fri, 21 Mar 2025 12:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6gqaA9E0QwLAVvE8lSaVaU/HT9tyPh3fLDKoovWQA58=; b=Ih61UcConfZeVV+9
	GoYiTBoYkHeyKpM7TBjfc3XDePnb4tjz299xfO6m0Lo1IO+J57SsFMlGXxsRwrI6
	tvNjM/OgUWkJkTIJm+ewq0Fd14nfI6NnLrInSulTEvbJY5t7F7DljgIDlrPnspkj
	tCkX+5pd1wHViDyrGwc6G2+SB4lJ/DdSJD1WuZQBDCbzT+/1LCFIbTvaa/XpGmn6
	ADpB5DZpAcTGF3W1jRLykV0Vt23Hgpx2HGxqcMp+4xrpFZNYYYcFAYH8kBufCsBM
	TC6uJokhZePNSeUKClVGDjjMtijCqmL+wYt6b0sikzy83PPrMTWK9ZPmJzQHlra1
	t5vAKg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45h4wpgpv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 12:50:16 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52LCoFhn018803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 12:50:15 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Mar 2025 05:50:11 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 21 Mar 2025 20:49:54 +0800
Subject: [PATCH 3/4] arm64: dts: ipq5424: Add CMN PLL node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250321-qcom_ipq5424_cmnpll-v1-3-3ea8e5262da4@quicinc.com>
References: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
In-Reply-To: <20250321-qcom_ipq5424_cmnpll-v1-0-3ea8e5262da4@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_suruchia@quicinc.com>,
        <quic_pavir@quicinc.com>, <quic_linchen@quicinc.com>,
        <quic_leiwei@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742561400; l=3411;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=7ZtzWxnI+o1EvFXihMZ4o1zzmHsVAbaiaWfi2wRcidQ=;
 b=8EFNA8cNNLG0V26aWebt08QPhK+LOnJOzXV7nrs3DvrOziHLR49ZLrZec8clzUUxu/dhs+mXH
 /viHO6TFlbdC7kcqNWnN7u+PduForDEcjJxlJX4Dkd1evOTpspPD1kD
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PdgIuSGrNIlqYF3htLhSGQfyIG7RKvrY
X-Proofpoint-GUID: PdgIuSGrNIlqYF3htLhSGQfyIG7RKvrY
X-Authority-Analysis: v=2.4 cv=ZN3XmW7b c=1 sm=1 tr=0 ts=67dd6088 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=ZqNuGyRfsUGKOhbEu44A:9 a=QEXdDO2ut3YA:10
 a=RVmHIydaz68A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=929 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210094

Add CMN PLL node for enabling output clocks to the networking
hardware blocks on IPQ5424 devices.

The reference clock of CMN PLL is routed from XO to the CMN PLL
through the internal WiFi block.
.XO (48 MHZ or 96 MHZ or 192 MHZ)-->WiFi (multiplier/divider)-->
48 MHZ to CMN PLL.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 16 +++++++++++++++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 26 +++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index 0fd0ebe0251d..b4d1aa00c944 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -2,7 +2,7 @@
 /*
  * IPQ5424 RDP466 board device tree source
  *
- * Copyright (c) 2024 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024-2025 The Linux Foundation. All rights reserved.
  */
 
 /dts-v1/;
@@ -213,7 +213,21 @@ &usb3 {
 	status = "okay";
 };
 
+/*
+ * The bootstrap pins for the board select the XO clock frequency that
+ * supports 48 MHZ, 96 MHZ or 192 MHZ. This setting automatically
+ * enables the right dividers, to ensure the reference clock output
+ * from WiFi to the CMN PLL is 48 MHZ.
+ */
+&ref_48mhz_clk {
+	clock-div = <1>;
+	clock-mult = <1>;
+};
+
 &xo_board {
 	clock-frequency = <24000000>;
 };
 
+&xo_clk {
+	clock-frequency = <48000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5d6ed2172b1b..844788990f43 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -3,10 +3,11 @@
  * IPQ5424 device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-gcc.h>
 #include <dt-bindings/reset/qcom,ipq5424-gcc.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -17,6 +18,12 @@ / {
 	interrupt-parent = <&intc>;
 
 	clocks {
+		ref_48mhz_clk: ref-48mhz-clk {
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -26,6 +33,11 @@ xo_board: xo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
+
+		xo_clk: xo-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
 	};
 
 	cpus: cpus {
@@ -157,6 +169,18 @@ soc@0 {
 		#size-cells = <2>;
 		ranges = <0 0 0 0 0x10 0>;
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq5424-cmn-pll";
+			reg = <0 0x0009b000 0 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+		};
+
 		efuse@a4000 {
 			compatible = "qcom,ipq5424-qfprom", "qcom,qfprom";
 			reg = <0 0x000a4000 0 0x741>;

-- 
2.34.1


