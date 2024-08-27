Return-Path: <linux-arm-msm+bounces-29633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6B2960ADF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 14:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 525541C22942
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 12:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2417E1BFDEF;
	Tue, 27 Aug 2024 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nv6Vk8Jp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCCB1BFDFA;
	Tue, 27 Aug 2024 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724762807; cv=none; b=tivbONYSOXeIQeS7PW4xKclSACXyyCyKkZOFytPUY6Bjk+L4VHVnWKkpIDkuQppCFpRo96hh9/OPqCEv4gx8MDEjDtJ8MRilxDSl2rOfEp4l2gCsDg9AlMxccMIsP9jb+LoSrfJ7wwWbHlDGgi4mBM5Dlz68cSJTJVUueGqAJMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724762807; c=relaxed/simple;
	bh=iDYNmkH1rPO+EIARm3K+77l72Di1gKix5GvJkXPMc0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PDrxujTtpQl1GddGSWN71q7ldgcBDiKYdkiHpkAwfB7YMMqq33AoD8p1wYyMewbJ/3vs0hk3jYWRsXJlAknPPtVTXI9LLKtmZVvqeg9szop5hdMb7pbN+69mbSLmGtgyUK36apK/Qs2a1AVz1aR5T9v7E0To5KmX6IuOpk7jkC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nv6Vk8Jp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R6ut3R020213;
	Tue, 27 Aug 2024 12:46:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ESduTgCKaYaSicTMZdeVrT3MA2TZqs7Q9YHb0gZCcVA=; b=Nv6Vk8JpVrtYXrKz
	sFWleSYCatE+uJnouUUnvtDYVRqeTQU+Ll00rthU5MMHji/W2oZ2c2eOV6SCpH6P
	jNpgJRk8bksHgkVCucZuar6syoFEwf1CFlCYYT3owvGwWryd5WUOih/Wo86RZzEA
	kX5YyeM7LAKF4IYa5ObGVCJYVR4uuVmTStym8WiMZoN4a0JljA2FXxBjPwzM3akF
	FVyPEERMUAzUp3p5KevybYRIdfzO6SXcbt+IuvQUJMTzjBbZZYmfW7orAGw1SDvD
	BP4WnvrwKbVvRanX+VHlozUuT92y8h4ASqfWd38vaknd6A3vbIDt7OxhRonKGkq7
	sh6PhA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4199yt0wrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 12:46:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RCkaYY020111
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 12:46:36 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 05:46:31 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 27 Aug 2024 20:46:02 +0800
Subject: [PATCH v3 4/4] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240827-qcom_ipq_cmnpll-v3-4-8e009cece8b2@quicinc.com>
References: <20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com>
In-Reply-To: <20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724762769; l=2601;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=iDYNmkH1rPO+EIARm3K+77l72Di1gKix5GvJkXPMc0E=;
 b=mgPDBtJ7N+wVevHu96PkxIDWtrbKNl0oRyrTMyB9Ihe2j5hYh0HoeVfqzR4VhEdAK5APuwvmB
 sJKiJv8XpcdCRjMpGQSIPInh8m+i9+readAA7tfvrQN/g9dhVu5bMTA
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ecxqiTF1FRSmdkZ6N_ZxvdQGlJcj1M21
X-Proofpoint-ORIG-GUID: ecxqiTF1FRSmdkZ6N_ZxvdQGlJcj1M21
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 mlxscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270094

The CMN PLL clock controller allows selection of an input
clock rate from a defined set of input clock rates. It in-turn
supplies fixed rate output clocks to the hardware blocks that
provide ethernet functions, such as PPE (Packet Process Engine)
and connected switch or PHY.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 +++++-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 17 ++++++++++++++++-
 2 files changed, 21 insertions(+), 2 deletions(-)

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
index 48dfafea46a7..1d7c863018c0 100644
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
@@ -19,6 +19,11 @@ / {
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
@@ -226,6 +231,16 @@ rpm_msg_ram: sram@60000 {
 			reg = <0x00060000 0x6000>;
 		};
 
+		clock-controller@9b000 {
+			compatible = "qcom,ipq9574-cmn-pll";
+			reg = <0x0009b000 0x800>;
+			clocks = <&cmn_pll_ref_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+		};
+
 		rng: rng@e3000 {
 			compatible = "qcom,prng-ee";
 			reg = <0x000e3000 0x1000>;

-- 
2.34.1


