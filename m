Return-Path: <linux-arm-msm+bounces-33322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F012099244B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 08:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A67FD1F22BD2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 06:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68683185B46;
	Mon,  7 Oct 2024 06:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lLU0qMYw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59C017DFF7;
	Mon,  7 Oct 2024 06:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728281484; cv=none; b=V9FTLSexko15dfscmUWk4nLTotSkzP2nmRz30PPrakyAnqs/HpCrMmKU7t4VmBk3RLwKzosq1KuiILV3Lyno7x1/D03keQMT3lodXs2RPV10aWi9Cpt1eKvdsvxO2EoljreXz04gEPDEelJqkXxqAURQbXbEcq7R6g8ViHivKdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728281484; c=relaxed/simple;
	bh=zCpC649Gw0V0bNMN8vuw8E3p9dvzvqA/OfOrN4EJA5E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DE6ETgHBMN7Po+HBb6W4M3Dv2sASnruzZCESgORbvxBvOxW/l82+jVMvWIJDGeGo7P4sXGT8MjBvOAKZc81y23jRsru1IsexHkxZRyxgPPwVA80v6sd9PZSMiOC2b2kfBJlCNUs13UrqzKh/UB7+iF3ry+0TyCp3+twPJrP4IL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lLU0qMYw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974SkCD026815;
	Mon, 7 Oct 2024 06:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+XsnJmQ6qjXHSljaiwdTrTyOI6pTwJNl2FAkI9q3fwE=; b=lLU0qMYwt3vsj3dp
	BwR843t9iuSbDrILz1mm9EjwB95IDSh4K8h0+40KWSnyB6ckac+dGq8WRRu7pRhx
	2f0ENQ7EQMDx40Jizrw0En9gH0V7+tEhaS7aBOwI6kfEXvWIvOFOf6cWpsieKbh1
	75lKrS/kf3zxAfQBwdDeAvh8Grx8kfieWWcETpKwspPktS3JW/vZzX3hccmY+AU7
	Q9VNDVcBrAKY/lQq1nSdkybXItM3h88M+k9Hol7jXtuzwEPCV8RGyoPvleLf8oGj
	c6N4v0XZ5D8JV9BxL6DCv9fum5ybZTeOn+dj6Fe4EsgDbauAYwc1V3GZDBhC3QFe
	xNmXBQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xq9u5me-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 06:11:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4976B7dk015235
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 06:11:08 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 6 Oct 2024 23:11:03 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <quic_sibis@quicinc.com>, <conor+dt@kernel.org>,
        <arm-scmi@vger.kernel.org>
Subject: [PATCH V4 5/5] arm64: dts: qcom: x1e80100: Enable LLCC/DDR/DDR_QOS dvfs
Date: Mon, 7 Oct 2024 11:40:23 +0530
Message-ID: <20241007061023.1978380-6-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007061023.1978380-1-quic_sibis@quicinc.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WI3ajMQnc0E_pXSm-x2RF5CtWFpd5PyA
X-Proofpoint-GUID: WI3ajMQnc0E_pXSm-x2RF5CtWFpd5PyA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxlogscore=920
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070042

Enable LLCC/DDR/DDR_QOS bus scaling through the QCOM SCMI Generic
Extension protocol.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 138 +++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index aec3ceb502f6..24ebccd8c124 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
 #include <dt-bindings/clock/qcom,x1e80100-tcsr.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scmi-memlat.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -325,6 +326,143 @@ scmi_dvfs: protocol@13 {
 				reg = <0x13>;
 				#power-domain-cells = <1>;
 			};
+
+			scmi_vendor: protocol@80 {
+				reg = <0x80>;
+
+				memory-0 {
+					qcom,memory-type = <QCOM_MEM_TYPE_DDR>;
+					freq-table-hz = /bits/ 64 <200000000 4224000000>;
+
+					monitor-0 {
+						cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6
+							&CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
+						qcom,ipm-ceil = <20000000>;
+						operating-points-v2 = <&memory0_monitor0_opp_table>;
+
+						memory0_monitor0_opp_table: opp-table {
+							compatible = "operating-points-v2";
+
+							opp-999000000 {
+								opp-hz = /bits/ 64 <999000000 547000000>;
+							};
+
+							opp-1440000000 {
+								opp-hz = /bits/ 64 <1440000000 768000000>;
+							};
+
+							opp-1671000000 {
+								opp-hz = /bits/ 64 <1671000000 1555000000>;
+							};
+
+							opp-2189000000 {
+								opp-hz = /bits/ 64 <2189000000 2092000000>;
+							};
+
+							opp-2516000000 {
+								opp-hz = /bits/ 64 <2516000000 3187000000>;
+							};
+
+							opp-3860000000 {
+								opp-hz = /bits/ 64 <3860000000 4224000000>;
+							};
+						};
+					};
+
+					monitor-1 {
+						cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6
+							&CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
+						operating-points-v2 = <&memory0_monitor1_opp_table>;
+						qcom,compute-type;
+
+						memory0_monitor1_opp_table: opp-table {
+							compatible = "operating-points-v2";
+
+							opp-1440000000 {
+								opp-hz = /bits/ 64 <1440000000 200000000>;
+							};
+
+							opp-2189000000 {
+								opp-hz = /bits/ 64 <2189000000 768000000>;
+							};
+
+							opp-2516000000 {
+								opp-hz = /bits/ 64 <2516000000 1555000000>;
+							};
+
+							opp-3860000000 {
+								opp-hz = /bits/ 64 <3860000000 4224000000>;
+							};
+						};
+					};
+				};
+
+				memory-1 {
+					qcom,memory-type = <QCOM_MEM_TYPE_LLCC>;
+					freq-table-hz = /bits/ 64 <300000000 1067000000>;
+
+					monitor-0 {
+						cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6
+							&CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
+						qcom,ipm-ceil = <20000000>;
+						operating-points-v2 = <&memory1_monitor0_opp_table>;
+
+						memory1_monitor0_opp_table: opp-table {
+							compatible = "operating-points-v2";
+
+							opp-999000000 {
+								opp-hz = /bits/ 64 <999000000 300000000>;
+							};
+
+							opp-1440000000 {
+								opp-hz = /bits/ 64 <1440000000 466000000>;
+							};
+
+							opp-1671000000 {
+								opp-hz = /bits/ 64 <1671000000 600000000>;
+							};
+
+							opp-2189000000 {
+								opp-hz = /bits/ 64 <2189000000 806000000>;
+							};
+
+							opp-2516000000 {
+								opp-hz = /bits/ 64 <2516000000 933000000>;
+							};
+
+							opp-3860000000 {
+								opp-hz = /bits/ 64 <3860000000 1066000000>;
+							};
+						};
+					};
+				};
+
+				memory-2 {
+					qcom,memory-type = <QCOM_MEM_TYPE_DDR_QOS>;
+					freq-table-hz = /bits/ 64 <QCOM_DDR_LEVEL_AUTO QCOM_DDR_LEVEL_PERF>;
+
+					monitor-0 {
+						qcom,ipm-ceil = <20000000>;
+						cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6
+							&CPU7 &CPU8 &CPU9 &CPU10 &CPU11>;
+						operating-points-v2 = <&memory2_monitor0_opp_table>;
+
+						memory2_monitor0_opp_table: opp-table {
+							compatible = "operating-points-v2";
+
+							opp-2189000000 {
+								opp-hz = /bits/ 64 <2189000000>;
+								opp-level = <QCOM_DDR_LEVEL_AUTO>;
+							};
+
+							opp-3860000000 {
+								opp-hz = /bits/ 64 <3860000000>;
+								opp-level = <QCOM_DDR_LEVEL_PERF>;
+							};
+						};
+					};
+				};
+			};
 		};
 	};
 
-- 
2.34.1


