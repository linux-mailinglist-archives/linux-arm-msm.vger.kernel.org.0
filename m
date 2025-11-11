Return-Path: <linux-arm-msm+bounces-81202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 603D2C4CFB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A0B3A4F02FD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A00A3074AA;
	Tue, 11 Nov 2025 10:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Kps+fY7F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FFE62F28EC;
	Tue, 11 Nov 2025 10:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762855716; cv=none; b=pEJRGSppgg2P3aGpFtFKPggHMA9B2YyLDKM+zktsP77772ofmBmQVXhj4QhwtYZ80ULU5ahVyAzECqLixW4Jv6I3E3a7iJNzy5HWwd1aWyOZUjIbwKtVNuNb9zcsBiJEhlS/Al62uWCDbTf3ZgWW1EmVJtIHalu1PrVH0AFSMhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762855716; c=relaxed/simple;
	bh=7X+tQBa5o9+OpQ/P39mjVqCMoYP6HWTOSrThfQsEhbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=gPno/XMFoV3gBlpBCuC2DHBg1JFR13zLakSfC9NtjApnXW3xjHaBHoOwBNfsPR52u/46SC1rMB4DrfQDwejMT+9BlihuETSjDj1L+lQDMyWr+6tRAUywZaeICl3K48AZolGFMfkigIJwPT60QYrSKUmFPfamYLfQuWNW/6xvbxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Kps+fY7F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB4Z4Dt4166506;
	Tue, 11 Nov 2025 10:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=O8SwmBoVNsDi/IqYhcJbBd
	vR4qNInoazAMTqO9e8Hw8=; b=Kps+fY7FS+U4Wkt7kwX9uW+fKc0CNvJcjJ2LRF
	RI8kQmwhizbdfTC4GExmGzLIfHxHUwi05eAkAOhfsx25J/QBXBHzSkzp4phV9Huu
	TXiPHWmWUl0NU2J2/H3KjTTI8XOUO8VYfVuqM1vHLn/TwVrfDHOkXCT7NYItFrMq
	jL5WnfIWzkOoggHiaUHRsJ1VfQipFXtfnWJnHKDm75zsrYjOIqGd10ToTyXoR2Gm
	Kn97Aem5zd9oPyf6klV7MytTt2NyreSzNQ+2/o6V37iJNukGgJDGbR9uNnTWkoXH
	67ZgkPnWlmUKSTllE81GJBk6pfViEfzWI/opH/725/BKqi2A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abm4a2jef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 10:08:24 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5ABA8NC2025538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 10:08:23 GMT
Received: from hu-sushruts-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Tue, 11 Nov 2025 02:08:20 -0800
From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
Date: Tue, 11 Nov 2025 15:38:16 +0530
Subject: [PATCH] arm64: dts: qcom: monaco-evk: Enable PCIe0 and PCIe1 on
 monaco-evk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251111-monaco-evk-pci-v1-1-8013d0d6a7ca@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAA8LE2kC/x3MQQqAIBBA0avErBtQSciuEi1kmmqINBQiEO+et
 HyL/wtkTsIZpq5A4keyxNCg+w7o8GFnlLUZjDJWa63wisFTRH5OvElwtOQG64idN9CiO/Em7z+
 cl1o/CIqmh2AAAAA=
X-Change-ID: 20251110-monaco-evk-pci-85c9459ce9a2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ziyue.zhang@oss.qualcomm.com>,
        <krishna.chundru@oss.qualcomm.com>,
        Sushrut Shree Trivedi
	<quic_sushruts@quicinc.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mDSVSKiWjznHGqSUvJ5M4rCXApifn358
X-Authority-Analysis: v=2.4 cv=G6kR0tk5 c=1 sm=1 tr=0 ts=69130b18 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=4TjeMMSwllEyUDyrvMMA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: mDSVSKiWjznHGqSUvJ5M4rCXApifn358
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDA3OSBTYWx0ZWRfXyGYEvzmtf2YZ
 hYVVrE21qoNxpC8A+Oue4Q/7v2Wl0AdJ+skaRGqNpTlIgeaPQIyAqL8cZzT/Vl3OieT5L4P9Kkr
 bAjIaDk45d8MuPlCc1L2jvTqY2+6SPf5B9xI1TTLv+FqLBzliLxeAbqQF7cUvAqC7jXtePpURvp
 W+Qh8yHa6t0PomFDnR0bxvlazN7v10R4hH6IxecdTCZZqYuxqOdwhvZVzYXz+wMsKhKThWF0DR0
 ApuxhGbxGBmcGc577X23wRb+Fo8tDK2x0UvjKk2dx/tp98GO3ddZrbpBJ23cHbEvRFnHDKGeY9k
 AJEkhr3dMEGjOV0U25faa4aeq7Z6iprlHVxfXg+FRFugbTvxcWuyq/nxHv9Ee+a2vooGgxQvHN0
 bOLPghNCzyUxPh/XSx2HLGTxSMmlRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511110079

Enables PCIe0 and PCIe1 controller and phy-nodes.

PCIe0 is routed to an m.2 E key connector on the mainboard for wifi
attaches while PCIe1 routes to a standard PCIe x4 expansion slot.

Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
---
This patch depends on the series:
https://lore.kernel.org/all/20251024095609.48096-1-ziyue.zhang@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 84 +++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index e72cf6725a52..70739f71dd5c 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -408,6 +408,44 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l6a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcieport1 {
+	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l6a>;
+	vdda-pll-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/qcs8300/adsp.mbn";
 
@@ -449,6 +487,52 @@ ethernet0_mdio: ethernet0-mdio-pins {
 		};
 	};
 
+	pcie0_default_state: pcie0-default-state {
+		wake-pins {
+			pins = "gpio0";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio1";
+			function = "pcie0_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio2";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+
+	pcie1_default_state: pcie1-default-state {
+		wake-pins {
+			pins = "gpio21";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		clkreq-pins {
+			pins = "gpio22";
+			function = "pcie1_clkreq";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-pins {
+			pins = "gpio23";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+	};
+
 	qup_i2c1_default: qup-i2c1-state {
 		pins = "gpio19", "gpio20";
 		function = "qup0_se1";

---
base-commit: b89214826b1ab0e527303464d6c90e53d290c4f1
change-id: 20251110-monaco-evk-pci-85c9459ce9a2

Best regards,
-- 
Sushrut Shree Trivedi <quic_sushruts@quicinc.com>


