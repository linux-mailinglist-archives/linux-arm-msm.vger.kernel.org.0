Return-Path: <linux-arm-msm+bounces-25445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC7192972D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 10:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9BC431F215C4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jul 2024 08:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A82810A14;
	Sun,  7 Jul 2024 08:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="D/iFG6SN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBE7F51B;
	Sun,  7 Jul 2024 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720342610; cv=none; b=GTBbKyFOrFv+OCPPjwx8ViCO4WIoRi7xibQGV+ZoLkDU2J2RmbSkLL4NpKbY4klkOSl4dqktJIXtyvEE4yyijEOj3ukZmdfGNJhGI3svtLHtRbn0vOqYph6Y/V10xZbKm8Qy5DLbQXlxoJaJuAQf5DWUfBhwv4D0llED7083y0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720342610; c=relaxed/simple;
	bh=tH9nMASGzPPGyJh68hCgqOFGw5zJeZCLjZOsJf+Rlr0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=UXWoSE0ZgBcfCshOm+uqITBe4X83nQ7GyVr9sTkvg2HCphFeDvYuAo7k4QNhAueZRMLKhgDv8zD5XeK2hPWE8ejGXg0r5UZPXNbBjsdwf8qrAWvX0h9YKT64fXPdI0+/CBWSmUObtcm3sFHWh49nQviKLjJE4+WurgYpmQCg53E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=D/iFG6SN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4676FgXq018591;
	Sun, 7 Jul 2024 08:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q9E7DqNQLQNBs9xfmNPO/E
	rBsLEs5p+TdEFHa+ZXnLU=; b=D/iFG6SNlUQYW+uHcPDN8+prxClVKIaa9FCJWi
	mjABeXwH0zjwWY6eCzfER1ynh/cUnvxLX+rSl14l/r0YzGIEk5JnnJu2cpbBpbNT
	PSAtQ/x+WVDQtXFpzu2IptLxMFNmpYdYYKCWP+jq5SAOBSFBqs/SWhD1t/mWtZkt
	VemDaiMay18N3Ok3ObSIxKGb8oxL4VMyqx0TuXChyk/MGn3QjKBG9fUth41Felb6
	N13eags/YHfAfxvL9H8IVY1f5RWoCgMWNyQ5fbeC+E3UkEb+MSsC585CixM/hy3j
	zlAuJ0xsMbp9rbRK+pbFUdrBavlBWBAUc6cJbQ7rX/ZGdk4Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wmmhhje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jul 2024 08:56:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4678ubI1026081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 7 Jul 2024 08:56:37 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 7 Jul 2024 01:56:33 -0700
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Johan Hovold
	<johan@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v17] arm64: dts: qcom: sa8295p-adp: Enable the four USB Type-A ports
Date: Sun, 7 Jul 2024 14:26:24 +0530
Message-ID: <20240707085624.3411961-1-quic_kriskura@quicinc.com>
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
X-Proofpoint-GUID: mKChzIPReX79mE4PRibae0hqT7OmsW1P
X-Proofpoint-ORIG-GUID: mKChzIPReX79mE4PRibae0hqT7OmsW1P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-07_05,2024-07-05_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407070071

The multiport USB controller in the SA8295P ADP is connected to four USB
Type-A ports. VBUS for each of these ports are provided by a
TPS2559QWDRCTQ1 regulator, controlled from PMIC GPIOs.

Add the necessary regulators and GPIO configuration to power these.

It seems reasonable that these regulators should be referenced as vbus
supply of usb-a-connector nodes and controlled by e.g. dwc3, but as this
is not supported in Linux today the regulators are left always-on for
now.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
Changes in v17:
Updated commit text as per comments on v16.
This has been only compile tested as only the commit text
has been updated.

Link to v16:
https://lore.kernel.org/all/20240429162048.2133512-3-quic_kriskura@quicinc.com/

 arch/arm64/boot/dts/qcom/sa8295p-adp.dts | 83 ++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index 78e933c42c31..2fd1dafe63ce 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "sa8540p.dtsi"
 #include "sa8540p-pmics.dtsi"
@@ -109,6 +110,46 @@ edp3_connector_in: endpoint {
 		};
 	};
 
+	regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB2_VBUS";
+		gpio = <&pmm8540c_gpios 9 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb2_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	regulator-usb3-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB3_VBUS";
+		gpio = <&pmm8540e_gpios 5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb3_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	regulator-usb4-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB4_VBUS";
+		gpio = <&pmm8540g_gpios 5 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb4_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	regulator-usb5-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB5_VBUS";
+		gpio = <&pmm8540g_gpios 9 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb5_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	reserved-memory {
 		gpu_mem: gpu-mem@8bf00000 {
 			reg = <0 0x8bf00000 0 0x2000>;
@@ -637,6 +678,10 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_2 {
+	status = "okay";
+};
+
 &usb_2_hsphy0 {
 	vdda-pll-supply = <&vreg_l5a>;
 	vdda18-supply = <&vreg_l7g>;
@@ -697,6 +742,44 @@ max20411_en: max20411-en-state {
 	};
 };
 
+&pmm8540c_gpios {
+	usb2_en: usb2-en-state {
+		pins = "gpio9";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		output-enable;
+		power-source = <0>;
+	};
+};
+
+&pmm8540e_gpios {
+	usb3_en: usb3-en-state {
+		pins = "gpio5";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		output-enable;
+		power-source = <0>;
+	};
+};
+
+&pmm8540g_gpios {
+	usb4_en: usb4-en-state {
+		pins = "gpio5";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		output-enable;
+		power-source = <0>;
+	};
+
+	usb5_en: usb5-en-state {
+		pins = "gpio9";
+		function = "normal";
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &tlmm {
 	pcie2a_default: pcie2a-default-state {
 		clkreq-n-pins {
-- 
2.34.1


