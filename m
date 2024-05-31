Return-Path: <linux-arm-msm+bounces-21219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C84088D5DA8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF9B6B2496C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B015156649;
	Fri, 31 May 2024 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XQRZ20Gt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971E0156646;
	Fri, 31 May 2024 09:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146271; cv=none; b=Jhn/3nrrIdWVNbn73yQlQ+Auq936tfagBrm2Rm257iEkN83F4JyzK0Q2r/iZl/KBncRLvTH8y5/DsFYpRD054fNUdrT4jPbbRT3C07M0wG72n9xGJ10hup32EY7C7NNJhXaEm3ktqERkDkhkQUvceZ4Be4pSBa+8/t03Uum9q+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146271; c=relaxed/simple;
	bh=RQ16RDaLTXWQhQODnz91g4g1UZXiWj4A88rkCbB7RZ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fs0wYddrrHtl0X/0Jj+27Ov3JaUpQV+Zlp05yvlKOMwXu8WEXIpCIWp3kwhzOCT/FLQy/gD13BqLwqRlpNdJA1ClluwQ1bxzYD1k1UGt0Z8Aw48KMPn/C9VysoLVbjijX2cln+I03UN11NSsxACSg9CJjoxL+xlvUyC0aN4C5eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XQRZ20Gt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V12Wub003501;
	Fri, 31 May 2024 09:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4SJuNprWp3vXhTTumfGksTWu
	F1zW7NLmnaEjDruIw3E=; b=XQRZ20GtCeNQcD9dWYPB0S/YqqHQPbpGASYWnCeX
	A5Nffq07ro4mZDWOzLTZci8ReOwl6dGArTgf5wyNSswTMwOoo/E+VIX9zBJ/zAkd
	S/drFVt0V7R1GDamZ07gHGlGIVYUkD2HIFUhO6BhDY/Ta+cZT26fEvjhDLvOzSKY
	bUTJwoBtDCwFDGuF+97eQG6rFCN7iRLp2HUtTeYw1cFpc+DAQ5xOAr0oKl0DHTvH
	7HEJsRhbynqof5KcwBABSbdhnAu3fIh6ACL5DuzVJWgQmCRR3kJn4FYzC77/ubQU
	b8TGciSZllOJxcGRgbYBEDZroZ+gJYarXjxsvia9MV/bOQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yesw5jd4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:04:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V94Ooo025114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:04:24 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:04:20 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 13/13] arm64: dts: qcom: Add support for multimedia clock controllers
Date: Fri, 31 May 2024 14:32:49 +0530
Message-ID: <20240531090249.10293-14-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531090249.10293-1-quic_tdas@quicinc.com>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mioY2dzV0aY_nowP5Im3mC8RMd5YvM8E
X-Proofpoint-GUID: mioY2dzV0aY_nowP5Im3mC8RMd5YvM8E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310066

Add support for camera, display0, display1 and video clock
controllers on SA8775P platform. While at it, update the
sleep_clk frequency.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts |  2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi     | 59 +++++++++++++++++++++++
 2 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 26ad05bd3b3f..4684da376565 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -542,7 +542,7 @@
 };
 
 &sleep_clk {
-	clock-frequency = <32764>;
+	clock-frequency = <32000>;
 };
 
 &spi16 {
diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index eae0de9720b5..7f62738671da 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -6,8 +6,11 @@
 #include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+#include <dt-bindings/clock/qcom,sa8775p-dispcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
 #include <dt-bindings/clock/qcom,sa8775p-gpucc.h>
+#include <dt-bindings/clock/qcom,sa8775p-videocc.h>
 #include <dt-bindings/interconnect/qcom,sa8775p-rpmh.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -2904,6 +2907,47 @@
 			interrupts = <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sa8775p-videocc";
+			reg = <0x0 0x0abf0000 0x0 0x10000>;
+			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SA8775P_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,sa8775p-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SA8775P_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc0: clock-controller@af00000 {
+			compatible = "qcom,sa8775p-dispcc0";
+			reg = <0x0 0x0af00000 0x0 0x20000>;
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <0>, <0>, <0>, <0>,
+				 <0>, <0>, <0>, <0>;
+			power-domains = <&rpmhpd SA8775P_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sa8775p-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x30000>,
@@ -3424,6 +3468,21 @@
 			#freq-domain-cells = <1>;
 		};
 
+		dispcc1: clock-controller@22100000 {
+			compatible = "qcom,sa8775p-dispcc1";
+			reg = <0x0 0x22100000 0x0 0x20000>;
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>,
+				 <0>, <0>, <0>, <0>,
+				 <0>, <0>, <0>, <0>;
+			power-domains = <&rpmhpd SA8775P_MMCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		ethernet1: ethernet@23000000 {
 			compatible = "qcom,sa8775p-ethqos";
 			reg = <0x0 0x23000000 0x0 0x10000>,
-- 
2.17.1


