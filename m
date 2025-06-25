Return-Path: <linux-arm-msm+bounces-62433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCCDAE80B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 13:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D02E16C842
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 11:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14852D12ED;
	Wed, 25 Jun 2025 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Aplsdt3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F9D2C15A5;
	Wed, 25 Jun 2025 11:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750850074; cv=none; b=MiV0FflPfi2OzIjPtZfkBBPnFAFWd6Y6xur+0jAwVoYWZkf2GyZwyMPBcqYnYyaNDT9vogpB7cGiHxteSUWhHZwo85fnPGBWJ9JZHX1gh+Le+8E9LK7gRwCsHbJdUzVy59ht6v304sutPcuFx8xPwoT90Yf+ScTa2EHgTFw1pqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750850074; c=relaxed/simple;
	bh=HrJJ3JhUyZUirc811nOotud2ZD/P9GT2mm5Y6iKcD/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XRrEA8EdZNsn/hMtRIQ2w36iT64ytZ5Kb+9MyFMjTsRMR91qRmDqpS/spxMA88nMEGHg/2pR2HBy6aLxy7t7p2AVygviG8rFhyrnEN1s1/sb3V/Io5QI1P9OkcsmfH+h5ymPzsdccaLrJb3CCw16uzvRIb5P6WqHJILj8hK8Nng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Aplsdt3h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5f3sD023113;
	Wed, 25 Jun 2025 11:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yYhduqxGliAng7+b0P7jdexNVS9R3qkBS9r/wJmsJ+A=; b=Aplsdt3hl1y9PR2a
	AzrC2cm4SVny5UgkQ4WcXp76xPQoPXT6uNVaK9oU7fdVNjQM0ydhGQ31qJbj2hNV
	4qVdFItiNEhWovrJKkbEufKV2dQjjciP/63o2cRyKNgVgHl7v5TQkRgrahcB7KuB
	guXYFtSmd3N/DEbQsKA1wFTnMY17EuGKoD3wJ4k9Hk5N/uYEHnTaYnq/IEqS/KT1
	9KTM+vpxlPP/suEIPoWdTgE42xyrtNgYPCvv95H1FMkrmQStAeMQTtU9zlwBdfjz
	FfoIMpMJJpQdk/SQ1DxnvmeC8+Ao9tN2KYQub+daapReI7pbmidu93Ki4TFK/+TC
	NWCH4w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgfns7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 11:14:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PBESKI022406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 11:14:28 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Jun 2025 04:14:25 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 25 Jun 2025 16:44:01 +0530
Subject: [PATCH v4 2/2] arm64: dts: qcom: qcs615: Add CPU scaling clock
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-qcs615-mm-cpu-dt-v4-v4-2-9ca880c53560@quicinc.com>
References: <20250625-qcs615-mm-cpu-dt-v4-v4-0-9ca880c53560@quicinc.com>
In-Reply-To: <20250625-qcs615-mm-cpu-dt-v4-v4-0-9ca880c53560@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hUlwJ-mA8VJV28XPdSN5k4g14IwFgDPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4MyBTYWx0ZWRfXwrt7UhRjROXf
 nho0yOUW47O+csGPgkH7qjyWNEKbFxSn4SMvn4Rt/r2BAJSjyFBFOHE+L3ulOqMv2uAqQW8C0/f
 DQwRCXyaM+aU8rC4ztNzC4j9vYU+lbu2Y4hfkHL5q8Nm/vO/J8GM3GvfKrpDn4jJ3Hkdwe0wtr3
 1DRcFwywiW7pat6nc5l552Y/PFfwpfQa6uoT+Xd5T7V9DbEijgVHyV8EBpK7f7kgettZLvZDh8e
 HKPMtaaSXJI66z35ldpU9JHLPfXWF3Ikic12r6NWH2v+w8njh4Bs3S31+zkIutkJAltd84a39s3
 hoso1JSm/U8Pfk7rp0rxgn3uk7L+oqhaM08ZAtZzFscys9jIXW8FeDN7rxmCCHQhde9cQhJH57d
 N6qL3KvROjKKUIC9bIoDAYHeissha7ogLfRFBOIUHaJf09W3YiU7joILwUpcniAVkyq533Wh
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685bda15 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=glh6sAxJXOJWtZD9WfkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: hUlwJ-mA8VJV28XPdSN5k4g14IwFgDPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=895 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250083

Add cpufreq-hw node to support CPU frequency scaling.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 5adf409d7ce7226042c759cc83ceca331097ae37..d06fc1c157454f635389ff0645fcf4b378270dbc 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -36,6 +36,8 @@ cpu0: cpu@0 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_0>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
@@ -56,6 +58,8 @@ cpu1: cpu@100 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 
 			l2_100: l2-cache {
 			      compatible = "cache";
@@ -75,6 +79,8 @@ cpu2: cpu@200 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_200>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 
 			l2_200: l2-cache {
 			      compatible = "cache";
@@ -94,6 +100,8 @@ cpu3: cpu@300 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_300>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 
 			l2_300: l2-cache {
 			      compatible = "cache";
@@ -113,6 +121,8 @@ cpu4: cpu@400 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_400>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 
 			l2_400: l2-cache {
 			      compatible = "cache";
@@ -132,6 +142,8 @@ cpu5: cpu@500 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_500>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 
 			l2_500: l2-cache {
 			      compatible = "cache";
@@ -151,6 +163,8 @@ cpu6: cpu@600 {
 			capacity-dmips-mhz = <1740>;
 			dynamic-power-coefficient = <404>;
 			next-level-cache = <&l2_600>;
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 
 			l2_600: l2-cache {
@@ -171,6 +185,8 @@ cpu7: cpu@700 {
 			capacity-dmips-mhz = <1740>;
 			dynamic-power-coefficient = <404>;
 			next-level-cache = <&l2_700>;
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 
 			l2_700: l2-cache {
 			      compatible = "cache";
@@ -3891,6 +3907,19 @@ glink_edge: glink-edge {
 				qcom,remote-pid = <2>;
 			};
 		};
+
+		cpufreq_hw: cpufreq@18323000 {
+			compatible = "qcom,sc7180-cpufreq-hw", "qcom,cpufreq-hw";
+			reg = <0 0x18323000 0 0x1400>, <0 0x18325800 0 0x1400>;
+			reg-names = "freq-domain0", "freq-domain1";
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#freq-domain-cells = <1>;
+			#clock-cells = <1>;
+		};
+
 	};
 
 	arch_timer: timer {

-- 
2.34.1


