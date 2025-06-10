Return-Path: <linux-arm-msm+bounces-60754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5294CAD33BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 12:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA9013AD6D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 10:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29B328DB62;
	Tue, 10 Jun 2025 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZvRImnaZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DD628CF42;
	Tue, 10 Jun 2025 10:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551746; cv=none; b=oePdqGIxQqwAcIvsR8BDU4F25pjDvd4tVAl7TOOq7FUdCpzGoH4vUI5amTuF7BnA6RtGYgedFlPK2L+ZdBmuDfxMEZYxx59XlAaox9xOPfkyT8tI0LY6G4C0yMWYX68CnOCZaG+XscTnRgzi2ncNANB41G6wgGr9c4HHr1FXHaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551746; c=relaxed/simple;
	bh=CeA+t2Zms0YzSPqR7M2cDQpZt3lN6O1i9ku047TqTL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=YGpBC0d7JJShHW4GhFsRRMXS2NYmXJ6xpCBb2T36riNP8c/B2ZGwIzkHGQgM+p3Ic0b2tVmu8uzYrRRKHrJ+1xNDPSLbFm7yyUGU2ma+KRx4J3orhsiAxk/IOGowGKCzUolMHx9EScgS5doexOk9SWbsFy9s5ozdKMR9oJUfZBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZvRImnaZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A6eJJP021153;
	Tue, 10 Jun 2025 10:35:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dmA/Gy/a2gTIwd23vkroLw/HWVIKWi48pcG9Jjyi4gA=; b=ZvRImnaZuxlaVfg4
	7OZxiWfxkmNYQjT69+Uwa0ph2OGZdYnpGWiZmKOHqkgR3Nah8upMDko4tmNHyHIF
	zGx1RKcqfSQrsR++jEpHo8NsR5BBluSS9Ozl1rTVymU7HdXFdeueSYUtC4u9GUml
	gY4V3I0veQah4PZDZimXWjPlhnCgqBc1+xB5IGCpz72NWKO9yCXn2fnLzf+OE4PV
	aIqk4jg2xTYzFCLByHUwd3vJeMxenwYlhXFtGRN+jSI7C9iLoC7E+BO/bSxKonL4
	yeq+JCyyfO6S2wSpvJtAQMeEts5uoEoHhPmLELtmdFNJhCZJ6AX2i0pGFSeRPuLA
	3vFqdQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476fmn8nu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 10:35:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55AAZfiG025998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 10:35:41 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Jun 2025 03:35:37 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 10 Jun 2025 18:35:20 +0800
Subject: [PATCH v3 3/4] arm64: dts: ipq5424: Add CMN PLL node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250610-qcom_ipq5424_cmnpll-v3-3-ceada8165645@quicinc.com>
References: <20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com>
In-Reply-To: <20250610-qcom_ipq5424_cmnpll-v3-0-ceada8165645@quicinc.com>
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
        <quic_leiwei@quicinc.com>, Luo Jie <quic_luoj@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749551725; l=3495;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=CeA+t2Zms0YzSPqR7M2cDQpZt3lN6O1i9ku047TqTL8=;
 b=fzsfk1llxfZ7rVmYrlPlmHcpXqJJ/tLDY6n+DtmsxW5fzZ68BAzeovSbf8i4aoVwxYBetAQGE
 Tz9koYaZDQHDreN18BJc97G7rUOwIyRcwcR50mvk33eggylaptxhCCX
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: xWIU6cd3w5arv81cwI75H-kPHDCLVssa
X-Proofpoint-GUID: xWIU6cd3w5arv81cwI75H-kPHDCLVssa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4MiBTYWx0ZWRfX0z91/cq0mBeW
 Dbvb9N8WXWURdHcGVYvPaqQpN8/alAXyS2s3mVhIRNOwolPN4NbAMvsD0+ubETiJNl9us6kcq+O
 jTQOdJI9SvUw7R+91E7bY4FZdyr0vZK4B1iMbwzr3Q5ZiysV/HQCvUPtT1nn38UJqp6B735JYOm
 bBcm2HAnTMuJ465uLOtTuACIx5ofcMPQ3eIkB8XcBE4yn0Ro2JVO6Ihl1S9qIXzSswa03rtovSX
 jU1Q541SOAPoOx545JMdh5Q+mJeXBNhNiq/EQPXlzQ8Fpx0z5sBg16qp71Xxg85j09EnXBXMnBr
 /aq6kg6UBdZla6KPPH4QQVKUDFTg9HNP/BfgTpB/3NWV7eF7ZgH8bCBDDB+MAjads9zmXaqOaCE
 BS64mLa6HoEQ0MjXtug//U2BWxUaexUsduRPhmCvm+pAz0/I2pvSom97X5CeamtDQRR/I0Dt
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68480a7d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=ZqNuGyRfsUGKOhbEu44A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100082

Add CMN PLL node for enabling output clocks to the networking
hardware blocks on IPQ5424 devices.

The reference clock of CMN PLL is routed from XO to the CMN PLL
through the internal WiFi block.
.XO (48 MHZ or 96 MHZ or 192 MHZ)-->WiFi (multiplier/divider)-->
48 MHZ to CMN PLL.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 17 ++++++++++++++++-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 26 +++++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index 1f89530cb035..5ca578904f85 100644
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
@@ -253,6 +253,21 @@ &usb3 {
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
+
+&xo_clk {
+	clock-frequency = <48000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 66bd2261eb25..13c641fced8f 100644
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
+#include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-gcc.h>
 #include <dt-bindings/reset/qcom,ipq5424-gcc.h>
 #include <dt-bindings/interconnect/qcom,ipq5424.h>
@@ -18,6 +19,12 @@ / {
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
@@ -27,6 +34,11 @@ xo_board: xo-board-clk {
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
@@ -210,6 +222,18 @@ pcie1_phy: phy@8c000 {
 			status = "disabled";
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq5424-cmn-pll";
+			reg = <0 0x0009b000 0 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll IPQ5424_CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+		};
+
 		efuse@a4000 {
 			compatible = "qcom,ipq5424-qfprom", "qcom,qfprom";
 			reg = <0 0x000a4000 0 0x741>;

-- 
2.34.1


