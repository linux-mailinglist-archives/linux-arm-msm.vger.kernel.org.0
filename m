Return-Path: <linux-arm-msm+bounces-34457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7B599EF2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 16:18:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69D892862B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4801D516A;
	Tue, 15 Oct 2024 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cLITH08v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4AD1D5169;
	Tue, 15 Oct 2024 14:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729001867; cv=none; b=Y31kGGDBmGIeHGyrtKMJguR2H5IN/JqAYh6cdPeITv22WfTgOBn3PjsEVMwQV8s8ZJNQ5CTF75WLBU+mF0cb090OkDRHP0/aLIaBuqL1HvXyt6fWQiOcEX9rH+RjpbegwQvM+gsk2U3K07DSc+5qYXL+NVoA5im0WagIZh3Ryu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729001867; c=relaxed/simple;
	bh=1qlEOb3zbkkJKEov99avnQF7hLkBaKYv9MvBZInJLZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ednPHiz+RFy+gcTIynObPGoMUtpYC86M1E9W5wYHl+x+JTDhG7ihZXFBM34gXcXhjCEetCuhaWvfXfKeKnncTBT1O7AhURi0qNXC7fSJyxyHyhjC8niA7xMhHwZ416kfeJ7xxTRYqUg+TG2UYcQHlgwJhDvzMYFeAEepSozV5IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cLITH08v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F9G0eF018012;
	Tue, 15 Oct 2024 14:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ts0jwMYHJkI1bO8vgq2tmi0+ch81vAeX+SlFOBe9DwE=; b=cLITH08vrS+nvSxS
	L9izczB8g0KMBMtBT9alWscmKp6y6qCdJZZ/PCEN/bynbFz9H5FqqapF+Re5bfWb
	gP6zz1vLeQoZoXjz09UDv2Ca8xAagr8gXyCLzS1KqIkaGeDbETDI7rpGfhri/oNZ
	BuvaxjuRM1DlUBwCQqEEXYZUlxV7N+VqDtvyadvhaakmIbpW4QHTjD6NJDjnqro1
	bnWDbpmzaNjxlGK2+izaI3UHOW7OYQJNvcvmL1M2WVq/vW6GHfKJtWi0UC24UoCG
	TRj7s3ifKHk/hbIwHCoFudqroQcwlkD/eLo6bS1WK5GwBO137yiyNIjU+4YY627B
	QfErHA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429nm3grvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 14:17:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FEHZOp024803
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 14:17:35 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 07:17:29 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 15 Oct 2024 22:16:54 +0800
Subject: [PATCH v4 4/4] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241015-qcom_ipq_cmnpll-v4-4-27817fbe3505@quicinc.com>
References: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
In-Reply-To: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729001826; l=2952;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=1qlEOb3zbkkJKEov99avnQF7hLkBaKYv9MvBZInJLZA=;
 b=oyA8fc08TT+z5Bnja3LgdSb+A35A7IwqicwhqURKdmP3t2w0NT4QHlmMLzP2bi1XQAubmCu1L
 DB27IkPXR28DM890R/pq8aXn7wtevXegWTGlaTX4Ozs9kh9cp5bKLud
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s5vBph00RxyfUP-j32AHaCz7UOlAQ2wR
X-Proofpoint-ORIG-GUID: s5vBph00RxyfUP-j32AHaCz7UOlAQ2wR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=867 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410150098

The CMN PLL clock controller allows selection of an input
clock rate from a defined set of input clock rates. It in-turn
supplies fixed rate output clocks to the hardware blocks that
provide ethernet functions such as PPE (Packet Process Engine)
and connected switch or PHY, and to GCC.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 +++++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 20 +++++++++++++++++++-
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 91e104b0f865..77e1e42083f3 100644
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
@@ -164,6 +164,10 @@ &usb3 {
 	status = "okay";
 };
 
+&cmn_pll_ref_clk {
+	clock-frequency = <48000000>;
+};
+
 &xo_board_clk {
 	clock-frequency = <24000000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 14c7b3a78442..93f66bb83c5a 100644
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
@@ -19,6 +20,11 @@ / {
 	#size-cells = <2>;
 
 	clocks {
+		cmn_pll_ref_clk: cmn-pll-ref-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -243,6 +249,18 @@ mdio: mdio@90000 {
 			status = "disabled";
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq9574-cmn-pll";
+			reg = <0x0009b000 0x800>;
+			clocks = <&cmn_pll_ref_clk>,
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


