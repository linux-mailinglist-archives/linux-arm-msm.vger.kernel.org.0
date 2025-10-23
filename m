Return-Path: <linux-arm-msm+bounces-78439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E64BBFF23D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 06:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 246244EB0EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 04:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85DA622FDEA;
	Thu, 23 Oct 2025 04:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HDpLWlXU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD1242056;
	Thu, 23 Oct 2025 04:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761194344; cv=none; b=L1BJ3rUJtzFjgqSnosKSxgpPS2Ec2QCn+R0W8YIv/EhDqLGYNnPvlwdg9+nJdHGfkhgi5z+rMW1QHw4urTxOpk+xeBxh2NFeoFkTpCbCAckSI7VmevcLTz2rBxiDWEV00l6UOyoQqMI9a6+wgkGxDg+rgsrt6x6SVC8HpC+5e9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761194344; c=relaxed/simple;
	bh=XaI9oEtVDcABxtMUoxY982wQK2o3k7e4KuAE4QIQtR0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L+wWtfJGwj1oxmHPuwUEE5G9eFwPoG8mplXQ/vT1IBuJNEHVbExzDB/mUte0+90dt1l4kwN8y5+6hdHn1so13PZhzW4atp758fJa3EO/B1fSncEWX5AGLgoB/vxazrlUaVbUKbzNYtkT6Z+UmdUZii4Rt8WJYhRyqmdVZQEhYv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HDpLWlXU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIenZ0005711;
	Thu, 23 Oct 2025 04:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9pGU6c2Wo7pZp1Bqgbo7MV
	MH5RLYhNqDyhOre8cd1+o=; b=HDpLWlXUYEutuBOZbiQgGXpvl7HaCE/YaR+elf
	+VFQakmQ5DptolewPHe+8ios3AWoMM/qF6H9gSzsZd0stBhqjytYahxIk/nBxPaM
	GiVYd/BmnInRow6MDU5sWMr3/J/uoOQttJiHnH1Z+9hesAYoKS0bO/f7fH2HTPDa
	xwZZZauhZkN9+clvKLuf3deVPq7OUDCNpo5Du2ZTMVyjK9kO/jg5Yp187ZSSedpl
	FLHmPrpJOHXNS8tapzT/ZBWex/GuCPcNkTeVqrU8rJfzNUYZNR51wcFrLAqOmMNG
	uj0zGpHc1xr1SztkzT6REwFnALI6jl9JD40pNNg3vrV5WMFw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j6xbw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 04:38:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59N4ctl9001823
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Oct 2025 04:38:55 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 22 Oct 2025 21:38:52 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v1] arm64: dts: qcom: ipq5424: add cooling maps for CPU thermal zones
Date: Thu, 23 Oct 2025 10:08:38 +0530
Message-ID: <20251023043838.1603673-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX9FBQOrKINDBP
 p+Q0xXQW5b4zzpsFfkgcFqiMgNKG+FQYea9SkMrpuDBCawD4xVfmiVynh5qtHUtXNAuxGypSrEb
 iRYLSYnBSB+oVz/YvmazIyKIhUbeSOtPejRqjidR2nq0O/LF5N/IqTrVjKkf3JOP78GgW6IPmS/
 uavAyqJO6xTyXTp6OySzJSemu2/JW763VDDj2ztuKe+iAKvuo9EXhimYIVxm7SSloptg2+hciko
 xQgZWftAoYXoURXwNgNh/11w5k6TVH98NsVEEecdmNJSWAunsZ/BFp2uzTlVMtDidscAaVCaUxz
 7oshwfTR6WwQa5nseRXiiNVdfwl7b4i33iBcAUwimpQ0Al0DylqLdSWmZlPjxR4g0FRxs3lU4fG
 yZU5CACayxvVr34hecI5JmVtbK2LAQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f9b160 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=NSMuZBBFxk7u4BXGUtQA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: rPjwKx2VqyLWQXxKCafMdV_k_Ku_18-A
X-Proofpoint-ORIG-GUID: rPjwKx2VqyLWQXxKCafMdV_k_Ku_18-A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

Add cooling-maps to the cpu1, cpu2, and cpu3 thermal zones to associate
passive trip points with CPU cooling devices. This enables proper
thermal mitigation by allowing the thermal framework to throttle CPUs
based on temperature thresholds. Also, label the trip points to allow
referencing them in the cooling maps.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 61 +++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index ef2b52f3597d..e4a51eeefeac 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/qcom,ipq5424-gcc.h>
 #include <dt-bindings/interconnect/qcom,ipq5424.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	#address-cells = <2>;
@@ -57,6 +58,7 @@ cpu0: cpu@0 {
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
 			interconnects = <&apss_clk MASTER_CPU &apss_clk SLAVE_L3>;
+			#cooling-cells = <2>;
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -82,6 +84,7 @@ cpu1: cpu@100 {
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
 			interconnects = <&apss_clk MASTER_CPU &apss_clk SLAVE_L3>;
+			#cooling-cells = <2>;
 
 			l2_100: l2-cache {
 				compatible = "cache";
@@ -101,6 +104,7 @@ cpu2: cpu@200 {
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
 			interconnects = <&apss_clk MASTER_CPU &apss_clk SLAVE_L3>;
+			#cooling-cells = <2>;
 
 			l2_200: l2-cache {
 				compatible = "cache";
@@ -120,6 +124,7 @@ cpu3: cpu@300 {
 			clock-names = "cpu";
 			operating-points-v2 = <&cpu_opp_table>;
 			interconnects = <&apss_clk MASTER_CPU &apss_clk SLAVE_L3>;
+			#cooling-cells = <2>;
 
 			l2_300: l2-cache {
 				compatible = "cache";
@@ -1235,18 +1240,28 @@ cpu0-thermal {
 			thermal-sensors = <&tsens 14>;
 
 			trips {
-				cpu-critical {
+				cpu0_crit: cpu-critical {
 					temperature = <120000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
 
-				cpu-passive {
+				cpu0_alert: cpu-passive {
 					temperature = <110000>;
 					hysteresis = <9000>;
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu0_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu1-thermal {
@@ -1254,18 +1269,28 @@ cpu1-thermal {
 			thermal-sensors = <&tsens 12>;
 
 			trips {
-				cpu-critical {
+				cpu1_crit: cpu-critical {
 					temperature = <120000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
 
-				cpu-passive {
+				cpu1_alert: cpu-passive {
 					temperature = <110000>;
 					hysteresis = <9000>;
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu1_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu2-thermal {
@@ -1273,18 +1298,28 @@ cpu2-thermal {
 			thermal-sensors = <&tsens 11>;
 
 			trips {
-				cpu-critical {
+				cpu2_crit: cpu-critical {
 					temperature = <120000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
 
-				cpu-passive {
+				cpu2_alert: cpu-passive {
 					temperature = <110000>;
 					hysteresis = <9000>;
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu2_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		cpu3-thermal {
@@ -1292,18 +1327,28 @@ cpu3-thermal {
 			thermal-sensors = <&tsens 13>;
 
 			trips {
-				cpu-critical {
+				cpu3_crit: cpu-critical {
 					temperature = <120000>;
 					hysteresis = <9000>;
 					type = "critical";
 				};
 
-				cpu-passive {
+				cpu3_alert: cpu-passive {
 					temperature = <110000>;
 					hysteresis = <9000>;
 					type = "passive";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu3_alert>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		wcss-tile2-thermal {

base-commit: fe45352cd106ae41b5ad3f0066c2e54dbb2dfd70
-- 
2.34.1


