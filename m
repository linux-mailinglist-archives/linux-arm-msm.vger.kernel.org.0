Return-Path: <linux-arm-msm+bounces-37329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D16939C1674
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 07:25:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 846C3281DF8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 06:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12281D14E0;
	Fri,  8 Nov 2024 06:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bFqXrRVn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4A31D0E2F;
	Fri,  8 Nov 2024 06:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731047078; cv=none; b=VIAEvM5WBJP8G3KC6Co+CY+11W86yRPMHiVFOH+jwT4e2PJWxpMZmhNuGNsKjhNolcHe3xmultXh2MUgAkMZJkFeBAj0+MdAJeHmCWe7QvjtguQ8vtX+5eolZu0MmPtTM+nmdsUcvWbjRJGOJp2qVVo6OAvKwNvJtqdLkvQ3iVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731047078; c=relaxed/simple;
	bh=J5ZLbNEA1mH6e/RNeRajxijLN2eGIPoBR7qTL6dxUgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=KUvPCtMrP5U64P52ayIJz2AcM3hoQkPsXSuOMPoActpJqv7eU59TrwNuJOsttn0h2neXR5nyNdN/WlNTh7qP6EQoOhF9licgPe8ygsFHO8fU+Fs/j1oIbp0FscI10P9EfefaFQ3RPgK2Z4rL9XicB+ikvTLmC7f5WAEnTtvQfA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bFqXrRVn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7MbB7v000731;
	Fri, 8 Nov 2024 06:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PokxoMwl0oQrhT2uzhIzx6o6ghev3LAIYhDcBM33eqU=; b=bFqXrRVndV5spWrg
	Tll+tnMugqPa95LJ35EX2SD1Lzh1OoH1gi9HRKmHAz+HXxRduTkwxgNrVgc3eBaE
	vEnSIBEygX+xlvs82QbtHXCIS/z4nP2m8ff18NyE9nytCgh79V/cwr81eQLbMeJd
	NfvK1sK4kp+9Ia47UGTXIj195wzJ0MsoxmqVGlSWWvVpjw1ObOpIAqF4FGlPRXwh
	6N1wNRdeqxWYSt7MCA2iANQMBvRTer1nXY5RoUFOd3JxN+v2EBUcLXLo5kpKm1yf
	pslOzkdT4xFcZd/C4+Ag89sjzkEmCnzwFYIJNC603Ibg8EUnkBFe9Pnpork5A+hs
	h+TfTw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gkru5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 06:24:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A86OYa6016639
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Nov 2024 06:24:34 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 22:24:30 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 8 Nov 2024 11:54:05 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: Add cpu scaling clock node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241108-qcs615-mm-dt-nodes-v1-2-b2669cac0624@quicinc.com>
References: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
In-Reply-To: <20241108-qcs615-mm-dt-nodes-v1-0-b2669cac0624@quicinc.com>
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
X-Proofpoint-ORIG-GUID: uRyXLx9HEutV4gfJpzu526Ud4ljaiHOb
X-Proofpoint-GUID: uRyXLx9HEutV4gfJpzu526Ud4ljaiHOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=797 suspectscore=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411080052

Add cpufreq-hw node to support cpu frequency scaling.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 8c98ac77dc5c665ef296e65ac76c1b59be485abb..2c61da790e78b131e454991c968ece40dd5ca56d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -33,6 +33,8 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
 			next-level-cache = <&l2_0>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
@@ -51,6 +53,8 @@ cpu1: cpu@100 {
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
 			next-level-cache = <&l2_100>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 
 			l2_100: l2-cache {
 			      compatible = "cache";
@@ -68,6 +72,8 @@ cpu2: cpu@200 {
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
 			next-level-cache = <&l2_200>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 
 			l2_200: l2-cache {
 			      compatible = "cache";
@@ -85,6 +91,8 @@ cpu3: cpu@300 {
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
 			next-level-cache = <&l2_300>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 
 			l2_300: l2-cache {
 			      compatible = "cache";
@@ -102,6 +110,8 @@ cpu4: cpu@400 {
 			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
 			next-level-cache = <&l2_400>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 
 			l2_400: l2-cache {
 			      compatible = "cache";
@@ -119,6 +129,8 @@ cpu5: cpu@500 {
 			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
 			next-level-cache = <&l2_500>;
+			clocks = <&cpufreq_hw 0>;
+			qcom,freq-domain = <&cpufreq_hw 0>;
 
 			l2_500: l2-cache {
 			      compatible = "cache";
@@ -136,6 +148,8 @@ cpu6: cpu@600 {
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
 			next-level-cache = <&l2_600>;
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 			#cooling-cells = <2>;
 
 			l2_600: l2-cache {
@@ -154,6 +168,8 @@ cpu7: cpu@700 {
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
 			next-level-cache = <&l2_700>;
+			clocks = <&cpufreq_hw 1>;
+			qcom,freq-domain = <&cpufreq_hw 1>;
 
 			l2_700: l2-cache {
 			      compatible = "cache";
@@ -729,6 +745,19 @@ rpmhpd_opp_turbo_l1: opp-9 {
 		};
 	};
 
+	cpufreq_hw: cpufreq@18323000 {
+		compatible = "qcom,cpufreq-hw";
+		reg = <0 0x18323000 0 0x1400>,
+		      <0 0x18325800 0 0x1400>;
+		reg-names = "freq-domain0", "freq-domain1";
+
+		clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
+		clock-names = "xo", "alternate";
+
+		#freq-domain-cells = <1>;
+		#clock-cells = <1>;
+	};
+
 	arch_timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,

-- 
2.45.2


