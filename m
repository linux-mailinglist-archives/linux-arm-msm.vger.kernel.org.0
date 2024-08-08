Return-Path: <linux-arm-msm+bounces-28166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A67C94BF14
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 16:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74020B24540
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 14:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3352718E764;
	Thu,  8 Aug 2024 14:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lkT/FPDx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA9D18E768;
	Thu,  8 Aug 2024 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723125879; cv=none; b=qBGp6ThF8Rn317LrwQMxu7LiI5wpam4+kNLO8JcoK43No7nOWDETzIaAEkhCOj9ucrj7eKltQcJiAHnjIecu3TdK6/xLbHtYc8JdzUqvstKS6sYEZxMfl7UJ6rewM+gqlIlyYiUVZAz/cE3BuYCtzX9K3j6hMRWyA9Q9pB64qqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723125879; c=relaxed/simple;
	bh=6oUq/Dzs0hO7kZwOks3HUIxjCjlf6sj6hTn2ghPIYtI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NMa0v0sOPQVbUAb9wrQvyugC5fKzPc+v5mOY2WafRL30kHMUYBd+519oCD/UckO5XHe4aw2QQgh8vCwgtGAqFB1BSrJgx5OIh8m8I+2uGFaD7YL1h0ubQqatAch6brlnSh2bYB/bppP+ntqDumUIOfJqxqxcSlK71DsJuj+ViIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lkT/FPDx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47882eRh015930;
	Thu, 8 Aug 2024 14:04:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/lMlXA8r/d43ifs0PdwoQ8yyRuKy5017gxJ94fZy4o=; b=lkT/FPDx1Kp9Asus
	wsnpR9bBvYMFznM1mzQyqWO91rWazAHi7ZsSeDQbVpnGv+g+SWPjKx8ff7llauEw
	SFEIXfMKkhLh+nENPqybtlwaWd/ZT7qS72f30FJcjqF93jQS+9iJZ319QHZkAP4E
	I3/6hsVfi3KrMnAn7K839Q5HlUwTDIax/lnSqbYLn8k2dL/uXddBPfuBdHUT6T3S
	oTOlOWWleu0uhzr+cGC9zhJTcK4JaS5U9J07jhmWFbITJt81WOUQ7zXvhRmF+zBA
	P8h2IgajlE2QxhcUPDmOcfvnVfBAjpXRrzF4tLY6jtyRbO1+JlHlg+BbB0Bw+Lnt
	6LnOJw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vdupjj09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 14:04:19 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 478E4Iic021443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 14:04:18 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 Aug 2024 07:04:13 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 8 Aug 2024 22:03:15 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: Add common PLL node for IPQ9574 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240808-qcom_ipq_cmnpll-v1-4-b0631dcbf785@quicinc.com>
References: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
In-Reply-To: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
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
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723125835; l=2716;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=6oUq/Dzs0hO7kZwOks3HUIxjCjlf6sj6hTn2ghPIYtI=;
 b=lAJMcgS6Z6cKh/npSDbrdnekoDcIdADOLJXTKGiJGyh1/eMoqGuvc0e9z40rz+p5E3NZktyEH
 hln2N4J1e4nCDLuSMjzD6/OIoe9fxWmCSI+pP/BnjQHBR1KQuz5ExFy
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2asR_xadCZBUOqdhFpQvLYRZ1oYI21Yv
X-Proofpoint-GUID: 2asR_xadCZBUOqdhFpQvLYRZ1oYI21Yv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_14,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=945 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408080099

The common PLL clock controller allows selection of an input
clock rate from a defined set of input clock rates. It in-turn
supplies fixed rate output clocks to the hardware blocks that
provide ethernet functions, such as PPE (Packet Process Engine)
and connected switch or PHY.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 +++++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 22 +++++++++++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 91e104b0f865..26bc2de7f99a 100644
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
@@ -167,3 +167,7 @@ &usb3 {
 &xo_board_clk {
 	clock-frequency = <24000000>;
 };
+
+&cmn_pll_ref_clk {
+	clock-frequency = <48000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 48dfafea46a7..ad7789dc686e 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -3,7 +3,7 @@
  * IPQ9574 SoC device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -28,6 +28,11 @@ xo_board_clk: xo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
+
+		cmn_pll_ref_clk: cmn-pll-ref-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+	       };
 	};
 
 	cpus {
@@ -226,6 +231,21 @@ rpm_msg_ram: sram@60000 {
 			reg = <0x00060000 0x6000>;
 		};
 
+		clock-controller@9b000 {
+			compatible = "qcom,ipq9574-cmn-pll";
+			reg = <0x0009b000 0x800>;
+			clocks = <&cmn_pll_ref_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			clock-output-names = "ppe-353mhz",
+					     "eth0-50mhz",
+					     "eth1-50mhz",
+					     "eth2-50mhz",
+					     "eth-25mhz";
+			#clock-cells = <1>;
+		};
+
 		rng: rng@e3000 {
 			compatible = "qcom,prng-ee";
 			reg = <0x000e3000 0x1000>;

-- 
2.34.1


