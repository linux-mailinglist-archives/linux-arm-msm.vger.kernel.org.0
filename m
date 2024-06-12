Return-Path: <linux-arm-msm+bounces-22505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFF7905AFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 20:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C526BB260CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839CB7E110;
	Wed, 12 Jun 2024 18:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oWWnaHwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C747D3E6;
	Wed, 12 Jun 2024 18:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217087; cv=none; b=QCLbWxlAIp6S7AJpNui/uU92oC+Dm1V+Ycths5wSVAdYURc2Ta4HrYXgXYn1OpKW7ryw4DRO4RVBrzwf+cFi6VWQ0w1odioH30IRpGj6XU7A3PO10BUKhQcIvtC/lBrcgQs6TTI7TpxRt5vtwX064TVTw7n9+bMU+tltc5ef+uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217087; c=relaxed/simple;
	bh=ocVubkKQ96kVzKM4QbkjIdbxB6c4E946f8IIYTiRzhI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kcSdxsOy2iIQpkR5ztCt3jeejJYeKs2Q4bvKF9kq6Qs5ef+3t9BKBCL/66qausZ9m/IXqwxNhUGyFguE2HwGdkvlB+GAxwQojsHkJJNMsIE7+pRshNZ0m24hhi1Gc1V9ItyVxnwZj/ouqktksopMsw6/tR4lZ/iODTaik3eOGWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oWWnaHwE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CDql6L019108;
	Wed, 12 Jun 2024 18:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UayRK+g1ykW09sj34BOBncD2wtsm03055H6q+izTpjU=; b=oWWnaHwEJmBeMbs5
	wz56NWOTSpa41eX8RHFFL309C0Fe4EvXYfuBq94yTwjNTa5GLbzYZHad6zzTAqwT
	x1Dvyqgp3XQrOmCMN5PeyTlPV2lZDlvMaN7uCE5SxxoOh2utfqqXKUJvLCkyKLAy
	FSWtPAkKZvtFVxFAk3RzBDNBMasPz3RAo0idVkIwNIXNwgMrrNjAJTII5CH7xHsL
	NU0I4238rh55IkbAv8HrZGi4/P2/1tFMxQLPLSdedySGQp+SqqgWseR6UICRDgma
	enCyBspCxZTizkncidHI3RjBZH9giQc04L3b5v4mAipI9+2QVAnCoTxL5zQSN29A
	IwfZCA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yqcxtgxng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 18:31:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CIVHFv028515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 18:31:17 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 11:31:13 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <quic_sibis@quicinc.com>, <conor+dt@kernel.org>
Subject: [RFC V2 4/4] arm64: dts: qcom: x1e80100: Enable LLCC/DDR/DDR_QOS dvfs
Date: Thu, 13 Jun 2024 00:00:31 +0530
Message-ID: <20240612183031.219906-5-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240612183031.219906-1-quic_sibis@quicinc.com>
References: <20240612183031.219906-1-quic_sibis@quicinc.com>
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
X-Proofpoint-ORIG-GUID: HTq18ZmtrIq5aVdHg_yquhLO_zgx_AgX
X-Proofpoint-GUID: HTq18ZmtrIq5aVdHg_yquhLO_zgx_AgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_10,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=899 spamscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120132

Enable LLCC/DDR/DDR_QOS dvfs through the Qualcomm's SCMI vendor protocol.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---

V1:
* Use alternate bindings. [Dmitry/Konrad]
* Cleanups/Fixes suggested for the client driver. [Dmitry/Konrad/Cristian]
* Use opp-tables instead of memfreq-tbl. [Dmitry/Konrad]
* Add support for DDR_QOS mem_type.

 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 136 +++++++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index d134dc4c7425..d4f690d6f91e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/soc/qcom,scmi-vendor.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
@@ -323,6 +324,141 @@ scmi_dvfs: protocol@13 {
 				reg = <0x13>;
 				#power-domain-cells = <1>;
 			};
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+
+				memlat-dvfs {
+					memory-0 {
+						qcom,memory-type = <QCOM_MEM_TYPE_DDR>;
+						freq-table-hz = /bits/ 64 <200000000 4224000000>;
+
+						monitor-0 {
+							qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
+							qcom,ipm-ceil = <20000000>;
+							operating-points-v2 = <&memory0_monitor0_opp_table>;
+
+							memory0_monitor0_opp_table: opp-table {
+								compatible = "operating-points-v2";
+
+								opp-999000000 {
+									opp-hz = /bits/ 64 <999000000 547000000>;
+								};
+
+								opp-1440000000 {
+									opp-hz = /bits/ 64 <1440000000 768000000>;
+								};
+
+								opp-1671000000 {
+									opp-hz = /bits/ 64 <1671000000 1555000000>;
+								};
+
+								opp-2189000000 {
+									opp-hz = /bits/ 64 <2189000000 2092000000>;
+								};
+
+								opp-2516000000 {
+									opp-hz = /bits/ 64 <2516000000 3187000000>;
+								};
+
+								opp-3860000000 {
+									opp-hz = /bits/ 64 <3860000000 4224000000>;
+								};
+							};
+						};
+
+						monitor-1 {
+							qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
+							operating-points-v2 = <&memory0_monitor1_opp_table>;
+							qcom,compute-type;
+
+							memory0_monitor1_opp_table: opp-table {
+								compatible = "operating-points-v2";
+
+								opp-1440000000 {
+									opp-hz = /bits/ 64 <1440000000 200000000>;
+								};
+
+								opp-2189000000 {
+									opp-hz = /bits/ 64 <2189000000 768000000>;
+								};
+
+								opp-2516000000 {
+									opp-hz = /bits/ 64 <2516000000 1555000000>;
+								};
+
+								opp-3860000000 {
+									opp-hz = /bits/ 64 <3860000000 4224000000>;
+								};
+							};
+						};
+					};
+
+					memory-1 {
+						qcom,memory-type = <QCOM_MEM_TYPE_LLCC>;
+						freq-table-hz = /bits/ 64 <300000000 1067000000>;
+
+						monitor-0 {
+							qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
+							qcom,ipm-ceil = <20000000>;
+							operating-points-v2 = <&memory1_monitor0_opp_table>;
+
+							memory1_monitor0_opp_table: opp-table {
+								compatible = "operating-points-v2";
+
+								opp-999000000 {
+									opp-hz = /bits/ 64 <999000000 300000000>;
+								};
+
+								opp-1440000000 {
+									opp-hz = /bits/ 64 <1440000000 466000000>;
+								};
+
+								opp-1671000000 {
+									opp-hz = /bits/ 64 <1671000000 600000000>;
+								};
+
+								opp-2189000000 {
+									opp-hz = /bits/ 64 <2189000000 806000000>;
+								};
+
+								opp-2516000000 {
+									opp-hz = /bits/ 64 <2516000000 933000000>;
+								};
+
+								opp-3860000000 {
+									opp-hz = /bits/ 64 <3860000000 1066000000>;
+								};
+							};
+						};
+					};
+
+					memory-2 {
+						qcom,memory-type = <QCOM_MEM_TYPE_DDR_QOS>;
+						freq-table-hz = /bits/ 64 <QCOM_DDR_LEVEL_AUTO QCOM_DDR_LEVEL_PERF>;
+
+						monitor-0 {
+							qcom,ipm-ceil = <20000000>;
+							qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
+							operating-points-v2 = <&memory2_monitor0_opp_table>;
+
+							memory2_monitor0_opp_table: opp-table {
+								compatible = "operating-points-v2";
+
+								opp-2189000000 {
+									opp-hz = /bits/ 64 <2189000000>;
+									opp-level = <QCOM_DDR_LEVEL_AUTO>;
+								};
+
+								opp-3860000000 {
+									opp-hz = /bits/ 64 <3860000000>;
+									opp-level = <QCOM_DDR_LEVEL_PERF>;
+								};
+							};
+						};
+					};
+				};
+			};
 		};
 	};
 
-- 
2.34.1


