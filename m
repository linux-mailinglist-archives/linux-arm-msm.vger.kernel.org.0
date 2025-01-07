Return-Path: <linux-arm-msm+bounces-44107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDE4A03C2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B5681887014
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD9B1EE7B1;
	Tue,  7 Jan 2025 10:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S5MFtFRx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F380C1E9B03;
	Tue,  7 Jan 2025 10:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245079; cv=none; b=N4mEmH5DzjQXh3shvwEyskkPVsoR76pEnoE7pNykUjJwbW/VLawbyUvB4YNH+yI4f3YKtbw73WFQ/mm1PC3zF42kLAmsWB77p/rZQXJHdfUM2+hEK1ryhlqDeIHKF3uMFy50RlWrPN6Fq9akvrBVIIkChjZI64f1ZbiWw2kwzvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245079; c=relaxed/simple;
	bh=K8VrtSjmbWds87x17SBcYo0o1Afxn9qQjgu2pqzihGc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ou9DhTjlc9X0ngKw6kRcdIBE/UirIwMar/VSSV/mTDHiuF7akP1C356dlImIbVTp0AVQeocEUJ5goj7YheLkc5xjXECegBKpGrfU0yjOdUb5jbC9NuWE2SnXAk40yzk2Hw3IGNoS2essgBoFftFCtnMm4t6NdkphFLDKmqQxe4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S5MFtFRx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5079vTsP020078;
	Tue, 7 Jan 2025 10:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dAEmoZ1bZABcYRdqrW4sb73XuArMPLvw0fg1tne3E0E=; b=S5MFtFRxL9E1hyZ1
	pq7NA14eR37QKqYwPK8F+VcYpBMXT7ZsMjGe63q2MCkeNiNXAkIrABkFUm7twbm6
	2h2paV/vD38pRZ0sfVux1URdxjGAaT+eyKDWHFAq9xIW6zv5mo/gbUU0ZluyeO/d
	DX1dkgYqiJJ14l6ePiAI2GG+Vt/KyHLByLzOvQlGAhHE36rdTBdvSfAG9yH4u8GS
	diE57lZg9KRvVT/bpCwmb0oAnQBAa2pj/ao5XNm/vGq9Gyn0keL/HGSSvGFosRJd
	GtR30N037sk5fMJxHeYPzjdudglGgbOTsgRuzjgsvFJwA46xQrhGLjqj1W1nBHN2
	SkoMEA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44123hg1h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 10:17:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507AHpi7027458
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 10:17:51 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 02:17:45 -0800
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <konradybcio@kernel.org>,
        <quic_mmanikan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <quic_gokulsri@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_srichara@quicinc.com>
Subject: [PATCH V3 8/8] arm64: dts: qcom: ipq5424: add nodes to bring up q6
Date: Tue, 7 Jan 2025 15:46:47 +0530
Message-ID: <20250107101647.2087358-9-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: S7TmxALOkC5Cox_mGo5dzeiLoEBHz5Pw
X-Proofpoint-GUID: S7TmxALOkC5Cox_mGo5dzeiLoEBHz5Pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=807
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070085

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 80 ++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5e219f900412..32c8fa837dcb 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -3,7 +3,7 @@
  * IPQ5424 device tree source
  *
  * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -125,6 +125,11 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		q6_region: wcnss@8a900000 {
+			no-map;
+			reg = <0x0 0x8a900000 0x0 0x2800000>;
+		};
+
 		tz@8a600000 {
 			reg = <0x0 0x8a600000 0x0 0x200000>;
 			no-map;
@@ -233,6 +238,55 @@ intc: interrupt-controller@f200000 {
 			msi-controller;
 		};
 
+		apcs_glb: mailbox@f400004 {
+			compatible = "qcom,ipq5424-apcs-apps-global",
+				     "qcom,ipq6018-apcs-apps-global";
+			reg = <0 0xf400004 0 0x6000>;
+			#clock-cells = <1>;
+			#mbox-cells = <1>;
+		};
+
+		tmel_qmp: qmp@32090000 {
+			compatible = "qcom,ipq5424-tmel-qmp";
+			reg = <0 0x32090000 0 0x2000>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>;
+			mboxes = <&apcs_glb 20>;
+			#mbox-cells = <1>;
+		};
+
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5424-wcss-sec-pil";
+			reg = <0 0x0cd00000 0 0x4040>;
+			firmware-name = "ath12k/IPQ5424/hw1.0/q6_fw0.mdt";
+			interrupts-extended = <&intc GIC_SPI 508 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 0>,
+					      <&wcss_smp2p_in 1 0>,
+					      <&wcss_smp2p_in 2 0>,
+					      <&wcss_smp2p_in 3 0>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			mboxes = <&tmel_qmp 0>;
+			qcom,smem-states = <&wcss_smp2p_out 0>,
+					   <&wcss_smp2p_out 1>;
+			qcom,smem-state-names = "shutdown",
+						"stop";
+
+			memory-region = <&q6_region>;
+
+			status = "okay";
+
+			glink-edge {
+				interrupts = <GIC_SPI 500 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		timer@f420000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0 0xf420000 0 0x1000>;
@@ -302,4 +356,28 @@ timer {
 			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	wcss: wcss-smp2p {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 501 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
 };
-- 
2.34.1


