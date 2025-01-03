Return-Path: <linux-arm-msm+bounces-43836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FA0A00511
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 08:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD2723A3E98
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 07:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229F51C82E2;
	Fri,  3 Jan 2025 07:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NILiVqkn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139F51CB31D;
	Fri,  3 Jan 2025 07:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735889545; cv=none; b=nu5gCgC57ZIJZjFnw2Y4Y0zSxbyp4+YhWaomBgkIHqAEhJO5bhe3YfVqc42bw2Vxn64uFmjg8lebrCOmvLVA0AhLOCzIRiFp8a5XlhZCZTHh6wKsGAmykLC4wSzSd2gxPYaq+QniJpuqvAdd4KF+O4RlKaIbNdTW/GC1AfOzcmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735889545; c=relaxed/simple;
	bh=kfkmxESePeJMWhHckatKMznX+z5wp0K40Jf+cstqYRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=nccvMb5jmlPI0X5XWfOeHKTXnbalKaRKHt2LeNvRRuCsB6m8tEZt5BDR4OgDSyWBtAgFI2t5SBDTRDAAnboDz6Du2hH3jnVziQsLHf0OLa74iEmRyb8V08XmDrTv9nYs8qaC+Dk4lWHyMMW54sfisMO6gb9lSD6ZCqcgvtgAQ+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NILiVqkn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5036jxtN004605;
	Fri, 3 Jan 2025 07:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xh9LJ1/62I3KjNoGwGJYgqOZ4tA4XB2xFtEinHscPW8=; b=NILiVqknuyWFheUJ
	fsVHd7u39oVyBHL+dh2fGfdik0dqxdA8uWII7hiA8rs7fTFFcEioYm9g9Yb8mb/Y
	J0T5KVJM62CNa/lc3CNhGkXi/WhfuKBp94C/t2N/1BhA1SQNh4KM6lQsexL11+Ic
	e9yS8ugibPiE/aei1egCzytpGutSksBQRju3BsHV82dbTO4+xFOOCrQtTutvUgd9
	0488F28tBxGh8qpoL3/+jdT2U0GnX6pW8BX8PrnOCzMzYiF+FduRGotFOGK58z9G
	6+KaLB8xgWFmK6vlUn/dKyRH0hdoL3SyngaaLyD3gz0V0AgG4PFzrBONMHiRbob1
	43GTFw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43xawj83fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 07:32:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5037W5Ze004421
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 3 Jan 2025 07:32:05 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 Jan 2025 23:32:00 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 3 Jan 2025 15:31:37 +0800
Subject: [PATCH v8 4/5] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250103-qcom_ipq_cmnpll-v8-4-c89fb4d4849d@quicinc.com>
References: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
In-Reply-To: <20250103-qcom_ipq_cmnpll-v8-0-c89fb4d4849d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735889498; l=4053;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=kfkmxESePeJMWhHckatKMznX+z5wp0K40Jf+cstqYRU=;
 b=1LwhopgbTWmEhUx8vFj1JCSgIZSj41aW3mExaMX5gxk7Ft3wn4ogvP/4lr8hbTxHkTdoZOgGB
 pzgEsBIVzumAmTbGpV6ToiSrimcNWahLrVc6audQ5odHe/gduX+WdWK
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DCXNXLhMHKzuVgYqqXEqRf86wLyFtc62
X-Proofpoint-ORIG-GUID: DCXNXLhMHKzuVgYqqXEqRf86wLyFtc62
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501030064

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
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 17 +++++++++++++++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 26 +++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 91e104b0f865..bb1ff79360d3 100644
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
@@ -164,6 +164,21 @@ &usb3 {
 	status = "okay";
 };
 
+/*
+ * The bootstrap pins for the board select the XO clock frequency
+ * (48 MHZ or 96 MHZ used for different RDP type board). This setting
+ * automatically enables the right dividers, to ensure the reference
+ * clock output from WiFi to the CMN PLL is 48 MHZ.
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
index d1fd35ebc4a2..475868a241cc 100644
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


