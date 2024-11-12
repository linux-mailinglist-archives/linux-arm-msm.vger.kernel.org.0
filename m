Return-Path: <linux-arm-msm+bounces-37608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DB39C5824
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 13:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84B0C283F87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 12:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A578820E325;
	Tue, 12 Nov 2024 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d2ZkF4hl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DDC1FB735;
	Tue, 12 Nov 2024 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415483; cv=none; b=ailT8A49cstggUM65lM8oHKzpC2quY1fCVt2Xj9AHIXSYfc/wIGne9valMCHTm687sd190pxge/m0YAyRwqLVpUEdK6wWwhbohwEdjM5HE0pjJPxRondu7UaOfVh3FnCZqMIyktLsyceRqNMGCBGg7WB4AmeNu7JsCggfCzqsIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415483; c=relaxed/simple;
	bh=oDJRKzyrvF43Xl0rGkUMR6RizqV68/JEIOnWlK2duDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iUU/UhRrFDPL7NdB/QBEgkr8qMSnkKY8GlpyJ7JnydzxIYz2jQB+NQb28xqILd51VMZz9Cqb8JfZgL8Ceht3TwT68jFd+53v0oxctmKN6isvazPU6O6TMQ3iwMqTajk4//RMLyCSS3XfvHb4wNLn7QvtKkwzW5X96NMy2zUgRSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d2ZkF4hl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACCGhBi005745;
	Tue, 12 Nov 2024 12:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KXEQouzGDfBnja1VoWe45zadUr/GB/+58KpHUwXB7nk=; b=d2ZkF4hlN71WuqFl
	YuznjPz9CloMw7FLQYGRqmXj4EMZT2L823wAsXWFJQmde63nixqptjyXkqERKU0N
	h67w0nyBQUl0zjvaB/LIMERQMfmnVeablHArixs6MC3PfBU5E/bTUY+LJVlAQzsO
	la6DBwBe1llRsMxtFIJvW1GHuOBYXyHQnVOVbZvCyx7v4IGX6IgaLAp3TcU7sslp
	VcoIFc5xmVJmBlRC+weZPlBbwexz7GIJfwZBP+cjGSXvbc2UL4nLGlYkjGi3poBn
	kIvUWWg0WFeUEgbf/RNkHcUivzpBYUFPMjNZ9YEv+tzd8txW78hmBuWFHenx8QGy
	m5/9GA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42uwt5hf0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 12:44:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACCicjj007947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 12:44:38 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 04:44:34 -0800
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Tue, 12 Nov 2024 18:14:11 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: sa8775p: Add CPU OPP tables to
 scale DDR/L3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-1-53d256b3f2a7@quicinc.com>
References: <20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-0-53d256b3f2a7@quicinc.com>
In-Reply-To: <20241112-sa8775p-cpufreq-l3-ddr-scaling-v2-0-53d256b3f2a7@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _UbekxXhZwhHXPZ2Sp0mHlq8vSYpN-E1
X-Proofpoint-ORIG-GUID: _UbekxXhZwhHXPZ2Sp0mHlq8vSYpN-E1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=955
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120103

Add OPP tables required to scale DDR and L3 per freq-domain
on SA8775P platform.

Co-developed-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 211 ++++++++++++++++++++++++++++++++++
 1 file changed, 211 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index e790d74de96278389082fc3670765b383fab1e70..1d2b45bde03fa28b47639ce4f4d7c38e352d84de 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -5,6 +5,7 @@
  */
 
 #include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
@@ -49,6 +50,11 @@ cpu0: cpu@0 {
 			next-level-cache = <&l2_0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			l2_0: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -71,6 +77,11 @@ cpu1: cpu@100 {
 			next-level-cache = <&l2_1>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			l2_1: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -88,6 +99,11 @@ cpu2: cpu@200 {
 			next-level-cache = <&l2_2>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			l2_2: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -105,6 +121,11 @@ cpu3: cpu@300 {
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl0 SLAVE_EPSS_L3_SHARED>;
 			l2_3: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -122,6 +143,11 @@ cpu4: cpu@10000 {
 			next-level-cache = <&l2_4>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			l2_4: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -145,6 +171,11 @@ cpu5: cpu@10100 {
 			next-level-cache = <&l2_5>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			l2_5: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -162,6 +193,11 @@ cpu6: cpu@10200 {
 			next-level-cache = <&l2_6>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			l2_6: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -179,6 +215,11 @@ cpu7: cpu@10300 {
 			next-level-cache = <&l2_7>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu4_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
+					 &epss_l3_cl1 SLAVE_EPSS_L3_SHARED>;
 			l2_7: l2-cache {
 				compatible = "cache";
 				cache-level = <2>;
@@ -268,6 +309,176 @@ cluster_sleep_apss_rsc_pc: cluster-sleep-1 {
 		};
 	};
 
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cpu0_opp_1267mhz: opp-1267200000 {
+			opp-hz = /bits/ 64 <1267200000>;
+			opp-peak-kBps = <6220800 29491200>;
+		};
+
+		cpu0_opp_1363mhz: opp-1363200000 {
+			opp-hz = /bits/ 64 <1363200000>;
+			opp-peak-kBps = <6220800 29491200>;
+		};
+
+		cpu0_opp_1459mhz: opp-1459200000 {
+			opp-hz = /bits/ 64 <1459200000>;
+			opp-peak-kBps = <6220800 29491200>;
+		};
+
+		cpu0_opp_1536mhz: opp-1536000000 {
+			opp-hz = /bits/ 64 <1536000000>;
+			opp-peak-kBps = <6220800 29491200>;
+		};
+
+		cpu0_opp_1632mhz: opp-1632000000 {
+			opp-hz = /bits/ 64 <1632000000>;
+			opp-peak-kBps = <6835200 39321600>;
+		};
+
+		cpu0_opp_1708mhz: opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <6835200 39321600>;
+		};
+
+		cpu0_opp_1785mhz: opp-1785600000 {
+			opp-hz = /bits/ 64 <1785600000>;
+			opp-peak-kBps = <6835200 39321600>;
+		};
+
+		cpu0_opp_1862mhz: opp-1862400000 {
+			opp-hz = /bits/ 64 <1862400000>;
+			opp-peak-kBps = <6835200 39321600>;
+		};
+
+		cpu0_opp_1939mhz: opp-1939200000 {
+			opp-hz = /bits/ 64 <1939200000>;
+			opp-peak-kBps = <6835200 39321600>;
+		};
+
+		cpu0_opp_2016mhz: opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-peak-kBps = <6835200 39321600>;
+		};
+
+		cpu0_opp_2112mhz: opp-2112000000 {
+			opp-hz = /bits/ 64 <2112000000>;
+			opp-peak-kBps = <8371200 49766400>;
+		};
+
+		cpu0_opp_2188mhz: opp-2188800000 {
+			opp-hz = /bits/ 64 <2188800000>;
+			opp-peak-kBps = <8371200 49766400>;
+		};
+
+		cpu0_opp_2265mhz: opp-2265600000 {
+			opp-hz = /bits/ 64 <2265600000>;
+			opp-peak-kBps = <8371200 49766400>;
+		};
+
+		cpu0_opp_2361mhz: opp-2361600000 {
+			opp-hz = /bits/ 64 <2361600000>;
+			opp-peak-kBps = <12787200 51609600>;
+		};
+
+		cpu0_opp_2457mhz: opp-2457600000 {
+			opp-hz = /bits/ 64 <2457600000>;
+			opp-peak-kBps = <12787200 51609600>;
+		};
+
+		cpu0_opp_2553mhz: opp-2553600000 {
+			opp-hz = /bits/ 64 <2553600000>;
+			opp-peak-kBps = <12787200 54681600>;
+		};
+	};
+
+	cpu4_opp_table: opp-table-cpu4 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		cpu4_opp_1267mhz: opp-1267200000 {
+			opp-hz = /bits/ 64 <1267200000>;
+			opp-peak-kBps = <6220800 29491200>;
+		};
+
+		cpu4_opp_1363mhz: opp-1363200000 {
+			opp-hz = /bits/ 64 <1363200000>;
+			opp-peak-kBps = <6220800 29491200>;
+		};
+
+		cpu4_opp_1459mhz: opp-1459200000 {
+			opp-hz = /bits/ 64 <1459200000>;
+			opp-peak-kBps = <6220800 29491200>;
+		};
+
+		cpu4_opp_1536mhz: opp-1536000000 {
+			opp-hz = /bits/ 64 <1536000000>;
+			opp-peak-kBps = <6220800 29491200>;
+		};
+
+		cpu4_opp_1632mhz: opp-1632000000 {
+			opp-hz = /bits/ 64 <1632000000>;
+			opp-peak-kBps = <6835200 39321600>;
+		};
+
+		cpu4_opp_1708mhz: opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <6835200 39321600>;
+		};
+
+		cpu4_opp_1785mhz: opp-1785600000 {
+			opp-hz = /bits/ 64 <1785600000>;
+			opp-peak-kBps = <6835200 39321600>;
+		};
+
+		cpu4_opp_1862mhz: opp-1862400000 {
+			opp-hz = /bits/ 64 <1862400000>;
+			opp-peak-kBps = <6835200 39321600>;
+		};
+
+		cpu4_opp_1939mhz: opp-1939200000 {
+			opp-hz = /bits/ 64 <1939200000>;
+			opp-peak-kBps = <6835200 39321600>;
+		};
+
+		cpu4_opp_2016mhz: opp-2016000000 {
+			opp-hz = /bits/ 64 <2016000000>;
+			opp-peak-kBps = <6835200 39321600>;
+		};
+
+		cpu4_opp_2112mhz: opp-2112000000 {
+			opp-hz = /bits/ 64 <2112000000>;
+			opp-peak-kBps = <8371200 49766400>;
+		};
+
+		cpu4_opp_2188mhz: opp-2188800000 {
+			opp-hz = /bits/ 64 <2188800000>;
+			opp-peak-kBps = <8371200 49766400>;
+		};
+
+		cpu4_opp_2265mhz: opp-2265600000 {
+			opp-hz = /bits/ 64 <2265600000>;
+			opp-peak-kBps = <8371200 49766400>;
+		};
+
+		cpu4_opp_2361mhz: opp-2361600000 {
+			opp-hz = /bits/ 64 <2361600000>;
+			opp-peak-kBps = <12787200 51609600>;
+		};
+
+		cpu4_opp_2457mhz: opp-2457600000 {
+			opp-hz = /bits/ 64 <2457600000>;
+			opp-peak-kBps = <12787200 51609600>;
+		};
+
+		cpu4_opp_2553mhz: opp-2553600000 {
+			opp-hz = /bits/ 64 <2553600000>;
+			opp-peak-kBps = <12787200 54681600>;
+		};
+	};
+
 	dummy-sink {
 		compatible = "arm,coresight-dummy-sink";
 

-- 
2.34.1


