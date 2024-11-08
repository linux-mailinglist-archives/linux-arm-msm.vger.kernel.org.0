Return-Path: <linux-arm-msm+bounces-37328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE699C1670
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 07:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B483284043
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 06:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41141D0164;
	Fri,  8 Nov 2024 06:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PUKLI+Ju"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF241D52B;
	Fri,  8 Nov 2024 06:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731047075; cv=none; b=iJij6GopB4dIa8Czul/NNWnVvgDu0RPdW/mrKOURgZeU6L/8ROjEe/AFx8IV7EfUSDOTFW14AUedwKg7VKKnnfSzx9krvU9oU65bWKoALpalBFbYwNDnaDfnF408yzaxN5dDJQGgupl64LxNJ360xhTT9a0XUjlkqcXCh2zWlkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731047075; c=relaxed/simple;
	bh=rckc5gHPwd4i52593aH0TQ6k09gm+anplge+Yf2lrX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tESJHfDO4+SLQ7Lnk9xkSqhNyOr70Sa3OMJYpTTDkB7W5S0+EqLPL45jcM84BXgRHJZ4jbmd3lqXggqpu2ZvWdbIToDC0zXToInqeR1RfPhDMqBDrTg27sWFq6LlnDuV5X5rCnwGLFdBTWt55JbesGm/jZZtOyW3HMrUorz83bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PUKLI+Ju; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7MahTJ011029;
	Fri, 8 Nov 2024 06:24:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5+hldowGe2Ve9G/zf8ZExGnS3gxZc40lLKZOM5fUlow=; b=PUKLI+JualL/3Rq5
	ki5IB1WNwb6khqQhlMoN6xLsDOQa/a4Fg5gf+PlClaxHYofos04pvMqQftRnWfzb
	9bgCvK74e27ir8QsRhQhWVytmk95syfQk/iySt5BKuYes1znTpDCPjVVYFxLVGlr
	m3r7yQFZIka+fCjzvaWH69diuz4IXxKVgeFjorYTLDS98YH/7c/7WgVHmxrxHR/P
	JeTOh9lZPP8YG1z8pMPcExztfLE1X67UE9paOBSt53DPYC03a/QbAIQm70I8UB9E
	8XM5HGKsLERqLTSQboUpKaRAxo4xwd+8ila9SAw3NnpbX+Njdpqn8V/iWvvP3ZT0
	Trlt6w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gbgu00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 06:24:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A86OUh8011978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Nov 2024 06:24:30 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 22:24:26 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 8 Nov 2024 11:54:04 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: Add clock nodes for multimedia clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241108-qcs615-mm-dt-nodes-v1-1-b2669cac0624@quicinc.com>
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
X-Proofpoint-GUID: VRTTCzL8mxa7ya61umFUv95hLKlBbttO
X-Proofpoint-ORIG-GUID: VRTTCzL8mxa7ya61umFUv95hLKlBbttO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411080052

Add support for video, camera, display and gpu clock controller nodes
for QCS615 platform.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 51 ++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 868808918fd2cdf3f23fcb43ead61b2abfc776f7..8c98ac77dc5c665ef296e65ac76c1b59be485abb 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3,7 +3,11 @@
  * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/clock/qcom,qcs615-dispcc.h>
 #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+#include <dt-bindings/clock/qcom,qcs615-gpucc.h>
+#include <dt-bindings/clock/qcom,qcs615-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
@@ -488,6 +492,18 @@ qup_uart0_rx: qup-uart0-rx-state {
 			};
 		};
 
+		gpucc: clock-controller@5090000 {
+			compatible = "qcom,qcs615-gpucc";
+			reg = <0 0x5090000 0 0x9000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GPLL0>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dc_noc: interconnect@9160000 {
 			reg = <0x0 0x09160000 0x0 0x3200>;
 			compatible = "qcom,qcs615-dc-noc";
@@ -502,6 +518,41 @@ gem_noc: interconnect@9680000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		videocc: clock-controller@ab00000 {
+			compatible = "qcom,qcs615-videocc";
+			reg = <0 0xab00000 0 0x10000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ad00000 {
+			compatible = "qcom,qcs615-camcc";
+			reg = <0 0xad00000 0 0x10000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@af00000 {
+			compatible = "qcom,qcs615-dispcc";
+			reg = <0 0xaf00000 0 0x20000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,qcs615-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x30000>,

-- 
2.45.2


