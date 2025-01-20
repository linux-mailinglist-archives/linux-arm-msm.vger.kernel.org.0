Return-Path: <linux-arm-msm+bounces-45544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C53A166BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 07:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBE6E188976D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 06:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784B515666D;
	Mon, 20 Jan 2025 06:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KCUaQKgR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE3E3209;
	Mon, 20 Jan 2025 06:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737355529; cv=none; b=eVKFDsN0zcw5gzbf7QPYtChjouFxdq583g8ScGZlFpS1prZMSu0Nj3jzXtKL3HwcFABBR1GwBIgnnvmytZxduL9YSGG8z5Kvp1hKm+bq9Wbd3qrsNrdJiUn6EI3z1XT+cuQvUaobhLm8WtNuUl4NOFN3AjA0KrIwgdFF7D3AyyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737355529; c=relaxed/simple;
	bh=2RU1m/ff7eJ3TisGzpUJ/KAiJxQrccbAK3esuXgXH2Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oIi6FqFJ+BcGvN0qDrl3pqWvAEylcp8z3TfwpMBGUu3Rjh+5NhutZtpSeI2tCAXFWFtqrzt8s3C2GR+FdORLzX+6M6slc60FVQd8ey17Rn7JSjCyPLpBzXeEG0fx6W3VS4ITboLkeD3scCULMnzbgmgdQ5h1ScQib0f3k1Qf1bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KCUaQKgR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K6csbK025070;
	Mon, 20 Jan 2025 06:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OskXaOr54kcQrJbfMrOTUT
	mc7h81FbMISesu7qBNXEM=; b=KCUaQKgRbWnKOIpYTgt5HUJWntL8iJSC7A87jz
	nKIBmxo1GO1z16T7FIzBaeBabf6TndgUjMmL6bdfBgp3HWiq4m1HSokXknp49f+w
	6qoxBwH6zmY0hKLcLumyDgh5mQnyaj4I2Q5CE0HlK4JIyyiPDQqh4B8FNaT2qo2F
	N6zX9dWtu30GNjH4KQOjTLYNPqrbwQXW08R46Exn/q8OyQAOTqcQk2v9758MCAjN
	YZOPxjLvWHGj+/dEFpM0bqbMOfV0rE9S9Guawzo+jgK1Dh8opr+EAERnBZ3I/SJ7
	BAkcK+GRTIo1irTf3P/ebCc7LB6XnBsQgkFkUhIct+nQQx6g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449hdbg0ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 06:45:24 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K6jNbs027570
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 06:45:23 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 22:45:19 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: ipq5424: enable GPIO based LEDs and Buttons
Date: Mon, 20 Jan 2025 12:15:08 +0530
Message-ID: <20250120064508.2722341-1-quic_mmanikan@quicinc.com>
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5tbpHQ1_rUanj5plQnAvgcUSg9esI4-K
X-Proofpoint-ORIG-GUID: 5tbpHQ1_rUanj5plQnAvgcUSg9esI4-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 mlxlogscore=833 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200054

Add support for wlan-2g LED on GPIO 42 and wps buttons on GPIO 19.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 43 +++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index b6e4bb3328b3..3c842aafca4f 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -7,6 +7,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include "ipq5424.dtsi"
 
 / {
@@ -17,6 +19,33 @@ aliases {
 		serial0 = &uart1;
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		button-wps {
+			label = "wps";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&tlmm 19 GPIO_ACTIVE_LOW>;
+			debounce-interval = <60>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-0 = <&gpio_leds_default>;
+		pinctrl-names = "default";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_WLAN;
+			gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "phy0tx";
+			default-state = "off";
+		};
+	};
+
 	vreg_misc_3p3: regulator-usb-3p3 {
 		compatible = "regulator-fixed";
 		regulator-min-microvolt = <3300000>;
@@ -95,6 +124,20 @@ &ssphy_0 {
 };
 
 &tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio19";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	gpio_leds_default: gpio-leds-default-state {
+		pins = "gpio42";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
 	spi0_default_state: spi0-default-state {
 		clk-pins {
 			pins = "gpio6";
-- 
2.34.1


