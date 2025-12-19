Return-Path: <linux-arm-msm+bounces-85927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 080CCCD1131
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3EF1B3039CCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 17:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F983845DD;
	Fri, 19 Dec 2025 16:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPNWQLhW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+gPEKSc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3960B3845CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766160862; cv=none; b=dqtM8dxL3YP7E4qEz2L9G3QLqAJb/Nw+IzJbWHviRySPVuWhNYiV6j5E2ou6G9VQ2kBwMMV3PT6kZJYRk+4YQIsWLf4ygUwSO+QWlnFHSPLBcw75cZLPdOXdfDX83cyAwpXxN2YWzAMVaNoh56uB1Or8F5XJftBmv9QnxuIXc/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766160862; c=relaxed/simple;
	bh=uUBZMafbxvXCgbEsErGwbKr0lA9sPi0q830kWH1ILaE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CmwpPjIP/qhZyuWpveJMnwv77orVnnY4Dzv/lqMGiDc0VYVV2fGJC4O1eBhHhXiOHiPNu/Je5CaW2L3VXOL14Pi5/DW6S5x9X3xP4a1+RWSbXagIakdZhlFz6UIt6Nk2ddV0Ggtn4qldLU048WZzCFVMdHSzGQH0eKkZp6TidLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPNWQLhW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+gPEKSc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJFjV5R1887242
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 16:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=iiIQVLlVLOqTqlglYAiv5W2jU8h6e00ZieP
	H+OB2zQ8=; b=bPNWQLhWUBH2EIM3MQjD2KBP4rpkJkSWom5KrWtMsYsp64FBsHv
	HDgLm+pRdEZtu0qE8GS4kT/asF6CZKqjnFjftwemj3tNpiXBvXSrjYBaJyrsXnSo
	1xfgXmFo1Xl/51vb64hcz4O8kDMrvqRIqWhCZ9bAkU9cbjClHUIZZcwD2eNi3yHJ
	/9Sjk73/oMs39a/eTTDRv7MHVTzBKxYa1WQJPxci3WM0XAH54pCmR6xv/KxpKh+x
	AIyOh1vM8HzMz7KtF36OV3D0vQuR8YWnaQdTcorSBate3fuG+bKG/iq5NvTbS41C
	ku5uuoLk48TslR/KWur9y6RSnVifXO+LHKg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2du8wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 16:14:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0d43fcb2fso50889975ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 08:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766160857; x=1766765657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iiIQVLlVLOqTqlglYAiv5W2jU8h6e00ZiePH+OB2zQ8=;
        b=M+gPEKScTz/75IazYOi7rou58XSbp2qMTUd7JIu9ZqcGDeDFpM15bygi+O3G9AHx2/
         YA0xR7RVACij8bJ8w+zdM9dfC4ghmE4KXSRdaczfe9jC2Kb1lunHOUlsb2vH1Lu9yvTP
         drYbFsJ3fNaxcRP13kPz1gR4NDElFQWllMenIJvw64l3QeRBADEnua3IEguRj35b9yEl
         vCHAJXa+Q8UYvtirsCFY52WSkAUtCXykR2hVGHMmqcJBBSpaiaOXQOwvVGgnaTIQEWtX
         jx6+MbDHmnCpknri6qmq1nw6g3409AmgBIS4J6KBgKLCMWV4Udbff6w3K8xWXSsZauQZ
         Qozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766160857; x=1766765657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiIQVLlVLOqTqlglYAiv5W2jU8h6e00ZiePH+OB2zQ8=;
        b=h+wn+llCYBLBf5d+z0HRcoXK1nspavrAhDGJ+EgwwLMAp4vn9o67ge0YK6KjgDwlJh
         8P40YMselG66VuFeCqTqmpbux2w8NqW9FCp+spaRJaAoPfYHnK0bDAZT9dDspu6atTXy
         23PT3VS2LEPYaehrLUSVubnpDhH063fL2/z85GnJczGqUaqsizEgHiGOOyCNaGisgRDR
         BM5PaYlfwNHSsX7tB5ilK1DrYDnb02C/xBBwepmZxDzaLQwKw/k8oJdzWJY0x+OHxLsY
         Mb7DbtraAyfJKiEocM3Mn5r6kRd3LIbZBSMfGu2oBPQf/xDwxykDpHMHvrO0YCJYi7C2
         4iNQ==
X-Gm-Message-State: AOJu0YzNgr35GogvK3/7MRgiJqYJU4npWVD4ATttFEORxdQ/rWFQ3KXz
	V7Kfw2hCFc4dkfaniuiyArT+/qO1dwysITmCrjYP9a0moCtjpEs/8JBXV4j9FabiEmzpwidwXWX
	8P/Uh+MiAg+i5DF/uecDx5YICkAXBoEpSR1nJRg43ukuB9lnVmqpOLQ2MfmsqUnq01AUFB34kzI
	N9
X-Gm-Gg: AY/fxX53zIzeVg0ntGqdV+8GnrAc6svU61I+NYUxOpdP3k03w5/ts7Gb3hWF1KSFcqp
	8aPFq7Hv4v4ZkRGyFlvKYIRuqg2RmoYAnyEgGWJf2EPm4gmB08ilUdqN0dpoK2hoGBVN3UJ/rvh
	2dnCpm397ml4rmt3L2VLwLy13C9wA1WawRzTUoept0iPLHoCXdig3wCXx0zl76xoyWUQgsgH4K5
	9xEvPD000H/csEYcaaqGaQDidXtQf50XGYPTqIWtoFH1eoo/Q2A3PQ5oLiL3AcHZ0RVD1q/b1D4
	43fWu0GxF11gVL7KxbAlHwBaXJRAFVTkFxraMfh7AV/X9nqqbntum2hsuV691zNVw9IL8/eTsmv
	jjah+2lYjvvfocyrbwlGntieR+GdeKvmzrW1hmSR8STawOAM=
X-Received: by 2002:a17:903:4405:b0:295:565b:c691 with SMTP id d9443c01a7336-2a2f22292e6mr38202895ad.17.1766160856897;
        Fri, 19 Dec 2025 08:14:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUovbz+IQVwXUSlmpgzob2VqkixosM6m6qbOPt6+nuRwTuDua8k1xXagbSByh1JMNjuTXe1A==
X-Received: by 2002:a17:903:4405:b0:295:565b:c691 with SMTP id d9443c01a7336-2a2f22292e6mr38202625ad.17.1766160856400;
        Fri, 19 Dec 2025 08:14:16 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d566sm26593725ad.71.2025.12.19.08.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 08:14:15 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: Add vbus regulator support for Type-A ports
Date: Fri, 19 Dec 2025 21:44:07 +0530
Message-Id: <20251219161407.2075701-1-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ohw3kWZxmL-bdD7-aFnDr8HnbG-fVDtN
X-Authority-Analysis: v=2.4 cv=A7ph/qWG c=1 sm=1 tr=0 ts=694579da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KCX8l4TVFeEM4KXXM5cA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: ohw3kWZxmL-bdD7-aFnDr8HnbG-fVDtN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEzNSBTYWx0ZWRfX6S/cOtsw5RB5
 GsVwC3LZdLC3JphNPEt6IkBbR0NR2ICdie28BuV/C5EwV3eI0HG/6Vw0KV8IJ8xE4UKExN68hTo
 fEB6gAnwOkh2OuuSF/sHpWxeVqHLzIZKlBBpNzGQxLWUIUAhcI4A/+u1LOf8gbYhOiCzw2qz2GE
 Om2lY3oLkt0U09s4Onxad7fTiZu3HSPtv+LYnYB8FQoue81tz46M4C/bz+vX8OwmuGhiYxfJ//G
 PwvkWoXmF+2li4xPIW6rRvIsg0p5vYcshZObsM4PSFgT6DWCZQZQQbI8nkQlpvhUqXNQZ5hu8d5
 6TkfM6lhCQWlBcSkIZbFPZUDgNZCHi1RrbJJfkHI029D1QLc//Q828OXON/RwRc5Ko8Jx8VE+cn
 xi+v34GtEt0EeH0hqQ1CjdT8zHJPDcZ7B0FXAA8hs1WHng//Wkw4RocHew2g7OVcfvKy/IUTwiG
 ncoBvSCitWN1ft2hUDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190135

The Multiport controller on Hamoa EVK platform is connected to Two Type-A
ports. VBUS for each of these ports are provided by a TPS2559QWDRCTQ1
regulator, controlled from PMIC GPIOs.

Add the necessary regulators and GPIO configuration to power these.

Implement connector nodes to embed the vbus supply within them. Since
there is no entity currently that can read vbus supply from a Type-A
connector and control it, mark the supplies as always on.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Changes in v3:
- Added connector-a nodes and embedded vbus supply in them
- Added RB Tag of Konrad from internal review after adding connector nodes

Link to v2:
https://lore.kernel.org/all/20251209041701.3245452-1-krishna.kurapati@oss.qualcomm.com/

Changes in v2:
- Re-ordered nodes to be in sorted order.

Link to v1:
https://lore.kernel.org/all/20251208085152.2597818-1-krishna.kurapati@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 36dd6599402b..88e3e7bed998 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include "hamoa-iot-som.dtsi"
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
@@ -48,6 +49,32 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector3 {
+		compatible = "usb-a-connector";
+		label = "USB-3-Type-A";
+		power-role = "source";
+
+		vbus-supply = <&regulator_usb3_vbus>;
+
+		port {
+			connector_3_in: endpoint {
+			};
+		};
+	};
+
+	connector6 {
+		compatible = "usb-a-connector";
+		label = "USB-6-Type-A";
+		power-role = "source";
+
+		vbus-supply = <&regulator_usb6_vbus>;
+
+		port {
+			connector_4_in: endpoint {
+			};
+		};
+	};
+
 	pmic-glink {
 		compatible = "qcom,x1e80100-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -344,6 +371,26 @@ vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
 		regulator-boot-on;
 	};
 
+	regulator_usb3_vbus: regulator-usb3-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB3_VBUS";
+		gpio = <&pm8550ve_9_gpios 4 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb3_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	regulator_usb6_vbus: regulator-usb6-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB6_VBUS";
+		gpio = <&pm8550ve_9_gpios 5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb6_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -877,6 +924,22 @@ usb0_1p8_reg_en: usb0-1p8-reg-en-state {
 		input-disable;
 		output-enable;
 	};
+
+	usb3_en: usb3-en-state {
+		pins = "gpio4";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		output-enable;
+		power-source = <0>;
+	};
+
+	usb6_en: usb6-en-state {
+		pins = "gpio5";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		output-enable;
+		power-source = <0>;
+	};
 };
 
 &pmc8380_5_gpios {
-- 
2.34.1


