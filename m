Return-Path: <linux-arm-msm+bounces-907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF1B7EF022
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:20:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA821280E9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F195E19479;
	Fri, 17 Nov 2023 10:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="K0tPjKhz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E82199C;
	Fri, 17 Nov 2023 02:19:46 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH6FkZu025247;
	Fri, 17 Nov 2023 10:19:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=UOPGcJ/vmIJN7b+0MqW04iiFobCe40bbxs0hVuB0ZCM=;
 b=K0tPjKhzZlUv7o1LS/1NbpcI/vY56KHHXij9oEbcKCvVwQjqpaZVW0DoRdibqfI7Obiq
 cxFNdhIU334bm7a2gTAXkx6eCAhXKLFGYPDbN6eOf1SSUpLND2hI0fgqO5hZ4XSWe7tV
 cDl8RcpqmHxjkptapQnb5m3pgCfClA6O2NmCG69XuXT6ZzWrj5l6zNJlwD3lPgIjc0is
 poCe+MFpN/QoqW75nSy55JWGfImXnJYYe+ReTkSR6wjLIrKIctQ8HjvO21iKnv8u8RK5
 6remgXLAXjzBwQ/rwvRUjg8zrw8ugwvIALSdD3Qr9NkpUgncoe1eeAIBJqwIJZllENZN kQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3udt8bse4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 10:19:41 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AHAJD8m008730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 10:19:13 GMT
Received: from tengfan2-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 17 Nov 2023 02:19:10 -0800
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <-cc=kernel@quicinc.com>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
Subject: [PATCH 09/16] arm64: dts: qcom: sm8550-aim300: add flash LEDs
Date: Fri, 17 Nov 2023 18:18:10 +0800
Message-ID: <20231117101817.4401-10-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231117101817.4401-1-quic_tengfan@quicinc.com>
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cu4UICQanKuriCh6bXGAD0CheL1IWDvV
X-Proofpoint-GUID: cu4UICQanKuriCh6bXGAD0CheL1IWDvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_08,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 mlxlogscore=573 adultscore=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311170076

Enable PM8550 PMIC flash LED controller and add two flash LEDs using
four current outputs.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8550-aim300.dts | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-aim300.dts b/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
index 6a9b384c4e08..cafddc02aef0 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-aim300.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8550.dtsi"
 #include "pm8010.dtsi"
@@ -452,6 +453,30 @@
 	status = "okay";
 };
 
+&pm8550_flash {
+	status = "okay";
+
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_YELLOW>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+		function-enumerator = <0>;
+		led-sources = <1>, <4>;
+		led-max-microamp = <500000>;
+	};
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		flash-max-microamp = <2000000>;
+		flash-max-timeout-us = <1280000>;
+		function-enumerator = <1>;
+		led-sources = <2>, <3>;
+		led-max-microamp = <500000>;
+	};
+};
+
 &pm8550b_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_1p8>;
 	vdd3-supply = <&vreg_l5b_3p1>;
-- 
2.17.1


