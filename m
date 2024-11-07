Return-Path: <linux-arm-msm+bounces-37215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A4C9C0178
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 10:52:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C854B22AC1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 09:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAA3B1EE00C;
	Thu,  7 Nov 2024 09:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JBtf5inL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830821DFE24;
	Thu,  7 Nov 2024 09:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730973068; cv=none; b=QF6F+nGY+GL49WhxcOzWsdU+rP8of79NDLMmcBPjnnFNz+/U6vYjxCX6uI87dvwZn1IexGiO8kLVZ3b+dEjQEj21gjL4l4e7sN5Yz8/f0/vzXegIfl9x6a3yrvuXJ0VnfSttTyuvSc7BubaexDu5+3UOqgHLIxbJ3jESQzEwLgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730973068; c=relaxed/simple;
	bh=/WDvojlj2mcpFyiCGayq35c6ymsFrEnUVMEInolKWrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sTeg46QIK7etFwTUV81NKy+F1ctCy5O9tkz5hhcYhDMMpCRYBu0rfERzKFgKevDuEInUEtDaAoAZeGvV0YM6k8buRDLjRf8k5malj28ZbveKhUAMSPFZYRhHbQoJy6ZEIOY7Uigeq1K43VBqQESn3PBKDmjp0mLvMzo/2W+ORWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JBtf5inL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6Nqtcl017106;
	Thu, 7 Nov 2024 09:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IWdGK6Qz7RBo5iaI1L2C2XmMfKLdmtEYdBJuTgI8fwk=; b=JBtf5inLA3Kk1Uhj
	dkEanUqQ4bNlbLgpTIXYE5gsjDXbG+qMyR5Aa8x+q+fYsOI+4B7isPS1Od63G8ES
	winHbejjjuQS7EiGjwf9RQkeIKarTseIa7ZE9JDT1AMGvnY6DNc1uzHK1bK68r/I
	jxMvm6XwL+wJ9GnMyXB0gMitNFHIm1IlebFBEl5H7VdEp+9r70hCc8ClMLXNRb7C
	tXf/oc00VWmoNRtDx/idlXDki1pmD71RBaHRTva1Uagq5HqIP8e5B37ZvyTdKZ+d
	LALGhdJfHD5s7u4zQNnmGRmLJKwj/lv/OOAqFRtmTnHYHsSdXBQdqzdxp0OroiJZ
	utjKPQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42q5n8rg7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 09:50:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A79osxI016730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Nov 2024 09:50:54 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 01:50:49 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 7 Nov 2024 17:50:25 +0800
Subject: [PATCH v6 4/5] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241107-qcom_ipq_cmnpll-v6-4-a5cfe09de485@quicinc.com>
References: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
In-Reply-To: <20241107-qcom_ipq_cmnpll-v6-0-a5cfe09de485@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>,
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730973028; l=3971;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=/WDvojlj2mcpFyiCGayq35c6ymsFrEnUVMEInolKWrI=;
 b=cpYeAkAtQ402QESW3PvyPbMBtjd2HZI6G4ZgGYdsEtJeUMT/3kK9p7bv70FTgPct6Tgo+kO7X
 ToCMHhinJXPA9DTNvGbnJ6sAMlvocHmx7IhOUpE+5TjRwnU37BCPN7j
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: A1pzE9L8Hnvuk9XpipgPYOlQYGsZHI6s
X-Proofpoint-ORIG-GUID: A1pzE9L8Hnvuk9XpipgPYOlQYGsZHI6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070074

The CMN PLL clock controller allows selection of an input clock rate
from a defined set of input clock rates. It in-turn supplies fixed
rate output clocks to the hardware blocks that provide the ethernet
functions such as PPE (Packet Process Engine) and connected switch or
PHY, and to GCC.

The reference clock of CMN PLL is routed from XO to the CMN PLL through
the internal WiFi block.
.XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)-->48 MHZ to CMN PLL.

The reference input clock from WiFi to CMN PLL is fully controlled by
the bootstrap pins which select the XO frequency (48 MHZ or 96 MHZ).
Based on this frequency, the divider in the internal Wi-Fi block is
automatically configured by hardware (1 for 48 MHZ, 2 for 96 MHZ), to
ensure output clock to CMN PLL is 48 MHZ.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 16 ++++++++++++++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 26 +++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 91e104b0f865..78f6a2e053d5 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -3,7 +3,7 @@
  * IPQ9574 RDP board common device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 /dts-v1/;
@@ -164,6 +164,20 @@ &usb3 {
 	status = "okay";
 };
 
+/*
+ * The bootstrap pins for the board select the XO clock frequency,
+ * which automatically enables the right dividers to ensure the
+ * reference clock output from WiFi is 48 MHZ.
+ */
+&ref_48mhz_clk {
+	clock-div = <1>;
+	clock-mult = <1>;
+};
+
 &xo_board_clk {
 	clock-frequency = <24000000>;
 };
+
+&xo_clk {
+	clock-frequency = <48000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 14c7b3a78442..8246a00a3e3e 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -3,10 +3,11 @@
  * IPQ9574 SoC device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
+#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
 #include <dt-bindings/interconnect/qcom,ipq9574.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -19,6 +20,12 @@ / {
 	#size-cells = <2>;
 
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
@@ -28,6 +35,11 @@ xo_board_clk: xo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
+
+		xo_clk: xo-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
 	};
 
 	cpus {
@@ -243,6 +255,18 @@ mdio: mdio@90000 {
 			status = "disabled";
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq9574-cmn-pll";
+			reg = <0x0009b000 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+		};
+
 		qfprom: efuse@a4000 {
 			compatible = "qcom,ipq9574-qfprom", "qcom,qfprom";
 			reg = <0x000a4000 0x5a1>;

-- 
2.34.1


