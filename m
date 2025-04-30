Return-Path: <linux-arm-msm+bounces-56193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C50CAA4210
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 06:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 084519C16FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 04:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C33B1D86F7;
	Wed, 30 Apr 2025 04:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZA07BrpB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECC442A8C;
	Wed, 30 Apr 2025 04:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745989168; cv=none; b=Vk9pQrbsADolL73JYERq5e2riMHXt3QiuKDVbwyeprVixCladWGGl4evinxqI9E8RxlMD5btJhqgWe2EAFSJS5UlNkoE4Bi/EKQ1SRHMEAl9x8mGrqbrWRoCmEf07GS8I5UcLwhS2j0WXicpmcmoMNeUs6dWvw9GB5BuSR/TitE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745989168; c=relaxed/simple;
	bh=EzleQfAr8zLTx3jrtU31GlSFfNKIajCq73JzX2gL8Ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=R7/mhE+6s43VFhwoxPrFCani7b5/o/mdcsEq0JTpNj3eYy4lcAxXHFdTuFsQ7WnqDwYX6zOg3Eh36oqCGj858x2WVUg95zu8LpV0aLtQ/0hJiNT1Iktx4l80sC4MyJmTFwIIQhvphXshbjqJme5tROjUbrHUIcrxsSDEhplXpug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZA07BrpB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLb4BL003467;
	Wed, 30 Apr 2025 04:59:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=30PnwYLuPKzWR9ThNKiybh
	848kJ17a/2w9B1dZMpA74=; b=ZA07BrpBY/VeIIfOkFvAqC3gSPVK8DKwAR/OiI
	IjZnRpLIFtu0Egw/Cn5l5vPV7QJ32NhCAn7gkt/5o7A/O5rUviPX6XHZ1MghRmX/
	d4c6frged2eBxSi6WSKLi+dNzh8e59LSYE66LetfdHTCMfdi1SKY7PukOylwCQcm
	zufCEDJD/639ayL8cAqNICh2h2Yb33EQsPDHLpnX0fI3kw3naExbybtAgxM1b6Ed
	HTqIBcWB/OxMbKxeDkYPsp9pntUqlDPB3ovqfitxfbdHzRU3eBHlV5KZLTl6Qj/Q
	SugC2nIZ6rKvQucGeLA8QpBPWycJ73CeAkH6vxGJ3ClHazkQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u88tkb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 04:59:23 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53U4xNkW009892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 04:59:23 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Apr 2025 21:59:19 -0700
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Wed, 30 Apr 2025 10:29:12 +0530
Subject: [PATCH v2] arm64: dts: qcom: qcs8300: Add cpufreq scaling node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250430-qcs8300-cpufreq-scaling-v2-1-ee41566b8c56@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAB+uEWgC/x3MSwqFMAxA0a1IxgZq/SBuRRzEGDUgVRveQxD3b
 nF4BvfeYBJVDLrshih/Nd1Dgs8z4JXCIqhTMnjna1f5Fk+2tnQO+fjNUU40pk3Dgg1TURUyCtE
 IqT6izHp95354nhdo7WKKaQAAAA==
X-Change-ID: 20250428-qcs8300-cpufreq-scaling-6ca141ebeaab
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Imran Shaik
	<quic_imrashai@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=6811ae2b cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=-kjJAZhfdypRAnGlKBgA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: oKXoYbKnsO4yTpnicSXRilw-02rWcmpG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDAzMiBTYWx0ZWRfX1WkKrbqF6Zf7 SI1GUUmJYGWXQgVUGUHuLyPbgm5Or+Mm08n/ZP05X6P2ftJgmkU+WtVjOuu6o5006W6k1rpSamv 07d/Mewj5tSmu0tuQ5c6ges3x1hiQpdxWvFr9hj+UgL6tzvNc6gfpnz3HXU7Ja9xWERN+lQPh8h
 17G7XHU5PTIWarVhHMH+fAycroKTKZuGZflj4niFsNHxj8u53YquzUpGxURdSVac9XsaCVMHOIT Rc9mHPGVDWOmge2Hd62NEmflxD6k2C5R6gWZv+DjcSOcq+VamYAPrKOE4JhN/z/WVmwnaJ62rMX 3fLg6q+ikXu73HhSC2qFTXHxvn3ccqBmMY/TMvuHpcWo7IFcBx1nq9yDQJzVsVAn4q/ljBOn6MQ
 0EuqnRH21Q85PEIm/1JKGG43vDeqLIDOH7td0bOsCprEp1xfXU67N7VUZuilKlGJXW4JUr2H
X-Proofpoint-ORIG-GUID: oKXoYbKnsO4yTpnicSXRilw-02rWcmpG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=804 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300032

Add cpufreq-hw node to support cpufreq scaling on QCS8300.

Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
Changes in v2:
- Drop bindings patch, as it is already applied.
- In DT patch, sorted by address and updated reg-names to vertical list. [Konrad]
- Link to v1: https://lore.kernel.org/r/20250313-qcs8300-cpufreq-scaling-v1-0-d4cd3bd9c018@quicinc.com
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 037cd366a09b4cf83a80264d9cad650698e7132d..9bc6cf9a3495a026cc5b51c2c3ba9f07cbcf5744 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -52,6 +52,7 @@ cpu0: cpu@0 {
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <472>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -71,6 +72,7 @@ cpu1: cpu@100 {
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <472>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 
 			l2_1: l2-cache {
 				compatible = "cache";
@@ -90,6 +92,7 @@ cpu2: cpu@200 {
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <507>;
+			qcom,freq-domain = <&cpufreq_hw 2>;
 
 			l2_2: l2-cache {
 				compatible = "cache";
@@ -109,6 +112,7 @@ cpu3: cpu@300 {
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <507>;
+			qcom,freq-domain = <&cpufreq_hw 2>;
 
 			l2_3: l2-cache {
 				compatible = "cache";
@@ -128,6 +132,7 @@ cpu4: cpu@10000 {
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 
 			l2_4: l2-cache {
 				compatible = "cache";
@@ -147,6 +152,7 @@ cpu5: cpu@10100 {
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 
 			l2_5: l2-cache {
 				compatible = "cache";
@@ -166,6 +172,7 @@ cpu6: cpu@10200 {
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 
 			l2_6: l2-cache {
 				compatible = "cache";
@@ -185,6 +192,7 @@ cpu7: cpu@10300 {
 			power-domain-names = "psci";
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 
 			l2_7: l2-cache {
 				compatible = "cache";
@@ -5279,6 +5287,28 @@ rpmhpd_opp_turbo_l1: opp-9 {
 			};
 		};
 
+		cpufreq_hw: cpufreq@18591000 {
+			compatible = "qcom,qcs8300-cpufreq-epss", "qcom,cpufreq-epss";
+			reg = <0x0 0x18591000 0x0 0x1000>,
+			      <0x0 0x18593000 0x0 0x1000>,
+			      <0x0 0x18594000 0x0 0x1000>;
+			reg-names = "freq-domain0",
+				    "freq-domain1",
+				    "freq-domain2";
+
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dcvsh-irq-0",
+					  "dcvsh-irq-1",
+					  "dcvsh-irq-2";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GCC_GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+		};
+
 		remoteproc_gpdsp: remoteproc@20c00000 {
 			compatible = "qcom,qcs8300-gpdsp-pas", "qcom,sa8775p-gpdsp0-pas";
 			reg = <0x0 0x20c00000 0x0 0x10000>;

---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250428-qcs8300-cpufreq-scaling-6ca141ebeaab

Best regards,
-- 
Imran Shaik <quic_imrashai@quicinc.com>


