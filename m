Return-Path: <linux-arm-msm+bounces-19788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3472F8C3E38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 11:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57E1B1C20F68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 09:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223411487F0;
	Mon, 13 May 2024 09:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Uo/LFc0U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5127715;
	Mon, 13 May 2024 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715593046; cv=none; b=dxnA7gGEHxAV+K9ZTow+KgBt4eeBZGXz7+oBwlCvKeb8j3MVrs0JKx5+eIKtudPNIcBVkxWm2DmSuQiwFVwt8SpFcW476t81GY+zjeaeE7bHWiIgzLjP5PrbL/dyTBN2TJ3udCo466GCGK49CnZq3UbeU2VxdDaUjb5Jepm/ges=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715593046; c=relaxed/simple;
	bh=/E3eWWJbQ0uaMhsmzF3G7p53jcb1FyrAybuUp51QBJA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G7sKluoqkTEpllthDUP9p1idLGc6kqw5zXNc+P7Wb5YrrT05J0RWXxKd4tFr6TucT4upC7ItXnWOwbau/px83d3rsjVpLBUKPAAV3yOWAzjDbPICnqOKtYVhz2VR6ZgiqjMuGEuuD3qQy4aNwvmlX00FXaOt+WLovqTgOOFUh/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Uo/LFc0U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44CL0jAB007289;
	Mon, 13 May 2024 09:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=TuHWsV9
	PNPxFc/y+TG2cKoDXQmb7zhouhYAh/r2ISm8=; b=Uo/LFc0UQTjkVspnObIwtEI
	kGwdZQbC8Mj5bWa4y7VQoTvV0yt2iXk5rZk352DUcmj27Y+lZ25Cf/RNHBap0N4q
	sy2fO4fIbbjFbtaQhkUh8YevutOpndvIEzBv+DDa3SQwP5B9WrMAJBpvrzQtP1Ox
	89hyc3DZXIedc+zHH86E0XAXTFseQRRQcHWhbAISLUiT+onfjr3piyPiiV2yytGA
	rtBfDX9V7f8rnJPX7IhzSQ/XgZADxSdtOgvE6+WMRGm9X1GeSG1smhHACjLyzLGm
	ocSA9jkDSDt6u0BcBiBqZKSkrY3XUSyw3XLhIouqqURrguy7+2vng4txkQkxEow=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y208vu2w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 09:37:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44D9bIio023547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 09:37:18 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 May 2024 02:37:10 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH v2] arm64: dts: qcom: sm4450: Add cpufreq support
Date: Mon, 13 May 2024 17:36:48 +0800
Message-ID: <20240513093648.1746336-1-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9jJnGSpTowranapIe9mUEmoR5ALaofnL
X-Proofpoint-GUID: 9jJnGSpTowranapIe9mUEmoR5ALaofnL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxlogscore=866
 clxscore=1015 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130059

Qualcomm platforms making use of CPUFreq HW Engine (EPSS/OSM) supply
clocks to the CPU cores. But this relationship is not represented in DTS
so far.
So let's make cpufreq node as the clock provider and CPU nodes as the
consumers. The clock index for each CPU node is based on the frequency
domain index.
Also add a description of a SM4450 cpufreq-epss controller and references
to it from CPU nodes.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
v1 -> v2:
  - merged two related patches into one patch
  - updated commit message

previous discussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240424101503.635364-1-quic_tengfan@quicinc.com
---
 arch/arm64/boot/dts/qcom/sm4450.dtsi | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm4450.dtsi b/arch/arm64/boot/dts/qcom/sm4450.dtsi
index 603c962661cc..8d75c4f9731c 100644
--- a/arch/arm64/boot/dts/qcom/sm4450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm4450.dtsi
@@ -29,6 +29,14 @@ sleep_clk: sleep-clk {
 			clock-frequency = <32000>;
 			#clock-cells = <0>;
 		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-factor-clock";
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
 	};
 
 	cpus {
@@ -39,10 +47,12 @@ CPU0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			next-level-cache = <&L2_0>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 
 			L2_0: l2-cache {
@@ -63,10 +73,12 @@ CPU1: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			next-level-cache = <&L2_100>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 
 			L2_100: l2-cache {
@@ -81,10 +93,12 @@ CPU2: cpu@200 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			next-level-cache = <&L2_200>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 
 			L2_200: l2-cache {
@@ -99,10 +113,12 @@ CPU3: cpu@300 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x300>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			next-level-cache = <&L2_300>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 
 			L2_300: l2-cache {
@@ -117,10 +133,12 @@ CPU4: cpu@400 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x400>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			next-level-cache = <&L2_400>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 
 			L2_400: l2-cache {
@@ -135,10 +153,12 @@ CPU5: cpu@500 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x500>;
+			clocks = <&cpufreq_hw 0>;
 			enable-method = "psci";
 			next-level-cache = <&L2_500>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 
 			L2_500: l2-cache {
@@ -153,10 +173,12 @@ CPU6: cpu@600 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a78";
 			reg = <0x0 0x600>;
+			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			next-level-cache = <&L2_600>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 
 			L2_600: l2-cache {
@@ -171,10 +193,12 @@ CPU7: cpu@700 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a78";
 			reg = <0x0 0x700>;
+			clocks = <&cpufreq_hw 1>;
 			enable-method = "psci";
 			next-level-cache = <&L2_700>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 
 			L2_700: l2-cache {
@@ -526,6 +550,19 @@ rpmhcc: clock-controller {
 			};
 		};
 
+		cpufreq_hw: cpufreq@17d91000 {
+			compatible = "qcom,sm4450-cpufreq-epss", "qcom,cpufreq-epss";
+			reg = <0 0x17d91000 0 0x1000>,
+			      <0 0x17d92000 0 0x1000>;
+			reg-names = "freq-domain0", "freq-domain1";
+			clocks = <&bi_tcxo_div2>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dcvsh-irq-0", "dcvsh-irq-1";
+			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

base-commit: 6ba6c795dc73c22ce2c86006f17c4aa802db2a60
-- 
2.25.1


