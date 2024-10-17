Return-Path: <linux-arm-msm+bounces-34717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B149A1E5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1756F289122
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B431D9339;
	Thu, 17 Oct 2024 09:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q/kiugW3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530B71D90C5;
	Thu, 17 Oct 2024 09:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729157340; cv=none; b=VXJhva0/QHBAg8dRtVqrCYlt5H8FshQZd87v1IrvrZYXG4XjCgFuRHG2ASju/0G5AIbXo3ZAaaFjxhS9zBOetJTdMMMDyDhMeyCSg5Qet3pG9HQdi4QSMo1qaaH7gBYoPpcA8NOo/WqBq4sbXSfuK6iYsZ2uQRmb3SIWXmwqf6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729157340; c=relaxed/simple;
	bh=YVgiHPmTyzr7jdnMo8hfs8zskkamJ/8KlInnP+l4F8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oyPCnuS3OZiW3BpMT2KFFf2cUg7TW2mIBW8fpKVd3NaWfCqEazdgwSnmvxXzCDimLhGTC77PC2/LUQ+nShKojPF0HdHnYGnmyFs6Zw5MLgb+gpxz2PvSw/nTb3uuMlmbn9csKVjsmaiu7/5+3ghAv0PY+5VYRAaqX7fnO+9TfDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q/kiugW3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H9IwnO011201;
	Thu, 17 Oct 2024 09:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSB7EgkVjziLJvsXs8lcRCTOX946FL/93S5iwZwvDdU=; b=Q/kiugW3N2SpCULo
	6iaY8rZ35LPjoJRbQdK6WtCQXG9DwQWNqKtjJ+8oWGaIs2Y0TnWk08y0K9k80+D1
	dfb2PCgUuiX46lf+b9h8PLov/V5hpwWV1F1U8Ox39frjonbzmYoPLqQ9dJ5D3MjC
	HVEH55mk2++K0K9kXR2M/34NGCAUYXP4gaGw1o6V7RxcbknXnovaXhbOgOFyYfFj
	RXkxiMUjh5BXndBLstxOQjqw6BOBeWMvfc0s95rKhRxz2+NkUSCkbf4gPoFKbQhJ
	kr0tASXT704fOdd7TArDVaO1kANmp5g6yIBnsHMFOGllT5Gcyya4DU9uBN2Q0t3C
	ftIDBA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abm5kgb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:28:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H9Spqr010687
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 09:28:51 GMT
Received: from [10.213.98.28] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Oct
 2024 02:28:47 -0700
From: Jagadeesh Kona <quic_jkona@quicinc.com>
Date: Thu, 17 Oct 2024 14:58:31 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: sa8775p: Add CPU OPP tables to scale
 DDR/L3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-2-074e0fb80b33@quicinc.com>
References: <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-0-074e0fb80b33@quicinc.com>
In-Reply-To: <20241017-sa8775p-cpufreq-l3-ddr-scaling-v1-0-074e0fb80b33@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya Kakitapalli" <quic_skakitap@quicinc.com>,
        Jagadeesh Kona
	<quic_jkona@quicinc.com>,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Yjmx31Bx9KRA0xG8vU9YgO9LtN6Qxy97
X-Proofpoint-GUID: Yjmx31Bx9KRA0xG8vU9YgO9LtN6Qxy97
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=901 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170063

From: Shivnandan Kumar <quic_kshivnan@quicinc.com>

Add OPP tables required to scale DDR and L3 per freq-domain
on SA8775P platform.

Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 178 ++++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index d8b90bd4b1f05604185f015929a1f296799ad6a4..47eca50b30ffa38a652706014d35ef9e833003ec 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -48,6 +48,7 @@ CPU0: cpu@0 {
 			next-level-cache = <&L2_0>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
@@ -74,6 +75,7 @@ CPU1: cpu@100 {
 			next-level-cache = <&L2_1>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
@@ -95,6 +97,7 @@ CPU2: cpu@200 {
 			next-level-cache = <&L2_2>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
@@ -116,6 +119,7 @@ CPU3: cpu@300 {
 			next-level-cache = <&L2_3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu0_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3_cl0 MASTER_EPSS_L3_APPS
@@ -137,6 +141,7 @@ CPU4: cpu@10000 {
 			next-level-cache = <&L2_4>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
@@ -164,6 +169,7 @@ CPU5: cpu@10100 {
 			next-level-cache = <&L2_5>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
@@ -185,6 +191,7 @@ CPU6: cpu@10200 {
 			next-level-cache = <&L2_6>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
@@ -206,6 +213,7 @@ CPU7: cpu@10300 {
 			next-level-cache = <&L2_7>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
+			operating-points-v2 = <&cpu4_opp_table>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
 					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 					<&epss_l3_cl1 MASTER_EPSS_L3_APPS
@@ -299,6 +307,176 @@ CLUSTER_SLEEP_APSS_RSC_PC: cluster-sleep-1 {
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


