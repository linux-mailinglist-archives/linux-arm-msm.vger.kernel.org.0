Return-Path: <linux-arm-msm+bounces-22416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E055F9050D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:49:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E19DB1C20C27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D69FA16F84C;
	Wed, 12 Jun 2024 10:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AQtnzPBl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5432C16F29E;
	Wed, 12 Jun 2024 10:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189333; cv=none; b=lDGaAJ4w4g9Jz9g+GdBpOZPAOOxVljhP7SFGMKFXQkSTGE0Vb/0Hb9YqxB4vnhjz75bpWrKRL5Sgi/h0q5vWEVXK8bf1vlAond/y017qf1NVZTu1wB9uPmw/66F4ebX2s6NlYZvQ9dBg8DUuYRqxcvLSAAn6NCMEJxTQB7vy65U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189333; c=relaxed/simple;
	bh=hIwm+uNdMyT9mPlfqHTylLq0DdSOapRvMvMNOVfV6Gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=k3EfFozalKxGB0mQeQ6yfAtx581Hn0toZuTJd0a2q9b8rtJ5sq/kjn/GBKKCib22pUooKtUN8Oay07E5E2ZmLezGf9N9VgqhjKaMMD+a+aL0Q06+Pda2362HWyErseVwE4WRUYXOS2M2Q2cjmBxjNoqV4gjtd+ab0RF1DH74Gjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AQtnzPBl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CA7A1O028814;
	Wed, 12 Jun 2024 10:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ma9Kyn9FJKgFigLN7ddq39QMpoKRLbZLYPJH+SGcDE=; b=AQtnzPBlGqTdiXxD
	A93wkbBBrjGDultJgOSDnz7eK6y3we8sa2l7jQ6ITtlXX0JIxkiJk4+PcOhPRtvU
	sJk6YXduf8kP/COfFmpxx1G86WrSzD/aaSaNwUIK1wES9iV4jW4LzntatiBbtI9g
	S4ls3GOe1LN59h/aEuZKvk2/TMXpzRDbjDrP3rYDBC5WduE9Hbpk/fUPxaivkOg6
	n5KM/WsFwzfhjdWtOWiTXaO3M603SpWET5E+yJpOA/PuKKVJFdLc8mVuRSST6B5r
	OOZsU86wfW1/bOrE7d/kIupKYhIvL1DD2aJPm4RprO4/+o7N/0C1/dNeEAAg6iCR
	DxbYYA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymfh3a1mj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:48:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CAmlUC001292
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:48:47 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 03:48:42 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 12 Jun 2024 16:17:48 +0530
Subject: [PATCH 7/8] arm64: dts: qcom: Add support for multimedia clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-sa8775p-mm-clock-controllers-v1-7-db295a846ee7@quicinc.com>
References: <20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com>
In-Reply-To: <20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: m1HPtNZSaBasGzd0QsWUhNASMT2FnfXl
X-Proofpoint-GUID: m1HPtNZSaBasGzd0QsWUhNASMT2FnfXl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120078

Add support for video, camera, display0 and display1 clock
controllers on SA8775P platform.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 59 +++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 3808fafd6bec..b1acd2b74d09 100644
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
@@ -2904,6 +2907,47 @@ llcc: system-cache-controller@9200000 {
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
@@ -3438,6 +3482,21 @@ cpufreq_hw: cpufreq@18591000 {
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
2.45.2


