Return-Path: <linux-arm-msm+bounces-19787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E468C3DC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 11:09:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65DCE282F9F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 May 2024 09:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDEC14A4E2;
	Mon, 13 May 2024 09:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XXVe9UTW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE931494B6;
	Mon, 13 May 2024 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715591328; cv=none; b=pVBqFLtFbHKKHVQJFIyY0LxbUBcSM37cvDzZzqFtk2frICP1f/hjYQV2NHmFHY5WIb6zwJ5bWB9ror/AzYEZUJXvYM0UTD3UiYByaNFU9CDwDDKuH6S4ICNrE1ZXmvfLwHA6b283zRs4ze3+q+i02T8ltrewjQBcjFGkV7Hps+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715591328; c=relaxed/simple;
	bh=sQHJpolK0p55WXrJf3wWupgTPy1InByJOMun9RHBVVU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mc2wmw8Hhq49SbQwjaY/RYiIaqTZXke0zJ9kqshpCLwRUwVRgbuBIOXBeUdzXp6gAOyxeQWpofmPs9OBnJ5s+I0ZSXXPpTv59zRqAmhXfnnHMwCfAy8t6NFHpTGytVVwjVBt35sg9hMUjTskR39onALB1dlVZgm2Tgs5GyLKU9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XXVe9UTW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44CMvQGf012553;
	Mon, 13 May 2024 09:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=TpNcfO2xnYlam2lC1fswpwdjx3WYQ5jl7br/aggMbUM=; b=XX
	Ve9UTW51hRMoLJzVPIoHJd4wvMve2OFZm4iYFBPdYzZRbQ4zJf/0JRDeAImIJUMn
	Z3V+kDSj6WNttKYoOshcUL4XPdeSCSGvVHDvkv5Yt6eNSAvbYdx9rzjIU/YKRkZA
	+nJ5RoS6FowXNiiBVpbly2IXHXYiVfNFrlBk+ZbroiK1Yow3n2F3O0P32krCUIqZ
	b1+RcuiX45LcS9HMfFR1wuqicL3WWbXZJoPxXxVejoGj6AkhLvbafAzfn8WERN/q
	KgwEgiife1PniqQwUyvXaE35zicJA1Mde8xldZIeUQqEeV2kz1MHofHZYkj8Lfah
	BvdqXgo8mc+3mvorqLNQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1y9mb4u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 09:08:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44D98RVV000987
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 09:08:27 GMT
Received: from tengfan-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 May 2024 02:08:19 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
To: <andersson@kernel.org>, <konrad.dybcio@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>
CC: <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <kernel@quicinc.com>, Tengfei Fan <quic_tengfan@quicinc.com>,
        Qiang Yu
	<quic_qianyu@quicinc.com>,
        Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Subject: [PATCH v8 4/4] arm64: dts: qcom: aim300: add AIM300 AIoT
Date: Mon, 13 May 2024 17:07:35 +0800
Message-ID: <20240513090735.1666142-5-quic_tengfan@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240513090735.1666142-1-quic_tengfan@quicinc.com>
References: <20240513090735.1666142-1-quic_tengfan@quicinc.com>
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
X-Proofpoint-GUID: -VPBolCvrEPCrebKkm-RqaGmMF_xc7-y
X-Proofpoint-ORIG-GUID: -VPBolCvrEPCrebKkm-RqaGmMF_xc7-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_06,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130056

Add AIM300 AIoT Carrier board DTS support, including usb, UART, PCIe,
I2C functions support.
Here is a diagram of AIM300 AIoT Carrie Board and SoM
 +--------------------------------------------------+
 |             AIM300 AIOT Carrier Board            |
 |                                                  |
 |           +-----------------+                    |
 |power----->| Fixed regulator |---------+          |
 |           +-----------------+         |          |
 |                                       |          |
 |                                       v VPH_PWR  |
 | +----------------------------------------------+ |
 | |                          AIM300 SOM |        | |
 | |                                     |VPH_PWR | |
 | |                                     v        | |
 | |   +-------+       +--------+     +------+    | |
 | |   | UFS   |       | QCS8550|     |PMIC  |    | |
 | |   +-------+       +--------+     +------+    | |
 | |                                              | |
 | +----------------------------------------------+ |
 |                                                  |
 |                    +----+          +------+      |
 |                    |USB |          | UART |      |
 |                    +----+          +------+      |
 +--------------------------------------------------+

Co-developed-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Co-developed-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/qcs8550-aim300-aiot.dts     | 322 ++++++++++++++++++
 2 files changed, 323 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index f63abb43e9fe..c46c10d85697 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -96,6 +96,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts b/arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts
new file mode 100644
index 000000000000..49759274fb4a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-aim300-aiot.dts
@@ -0,0 +1,322 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include "qcs8550-aim300.dtsi"
+#include "pm8010.dtsi"
+#include "pmr735d_a.dtsi"
+#include "pmr735d_b.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. QCS8550 AIM300 AIOT";
+	compatible = "qcom,qcs8550-aim300-aiot", "qcom,qcs8550-aim300", "qcom,qcs8550",
+		     "qcom,sm8550";
+
+	aliases {
+		serial0 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&volume_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			debounce-interval = <15>;
+			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,sm8550-pmic-glink", "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		orientation-gpios = <&tlmm 11 GPIO_ACTIVE_HIGH>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&redriver_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&fsa4480_sbu_mux>;
+					};
+				};
+			};
+		};
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		vdd-bob1-supply = <&vph_pwr>;
+		vdd-bob2-supply = <&vph_pwr>;
+	};
+
+	regulators-3 {
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+	};
+
+	regulators-4 {
+		vdd-s4-supply = <&vph_pwr>;
+	};
+
+	regulators-5 {
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+	};
+};
+
+&i2c_hub_2 {
+	status = "okay";
+
+	typec-mux@42 {
+		compatible = "fcs,fsa4480";
+		reg = <0x42>;
+
+		vcc-supply = <&vreg_bob1>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			fsa4480_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_sbu>;
+			};
+		};
+	};
+
+	typec-retimer@1c {
+		compatible = "onnn,nb7vpq904m";
+		reg = <0x1c>;
+
+		vcc-supply = <&vreg_l15b_1p8>;
+
+		orientation-switch;
+		retimer-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				redriver_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				redriver_ss_in: endpoint {
+					data-lanes = <3 2 1 0>;
+					remote-endpoint = <&usb_dp_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0 {
+	status = "okay";
+
+	panel@0 {
+		compatible = "visionox,vtdr6130";
+		reg = <0>;
+
+		pinctrl-0 = <&dsi_active>, <&te_active>;
+		pinctrl-1 = <&dsi_suspend>, <&te_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_l13b_3p0>;
+		vdd-supply = <&vreg_l11b_1p2>;
+		vddio-supply = <&vreg_l12b_1p8>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pm8550_gpios {
+	volume_up_n: volume-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		bias-pull-up;
+		input-enable;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/qcs8550/adsp.mbn",
+			"qcom/qcs8550/adsp_dtbs.elf";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/qcs8550/cdsp.mbn",
+			"qcom/qcs8550/cdsp_dtbs.elf";
+	status = "okay";
+};
+
+&swr1 {
+	status = "okay";
+};
+
+&swr2 {
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <32 8>;
+
+	dsi_active: dsi-active-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	dsi_suspend: dsi-suspend-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	te_active: te-active-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	te_suspend: te-suspend-state {
+		pins = "gpio86";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_1_hsphy {
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	status = "okay";
+};
+
+&usb_dp_qmpphy_out {
+	remote-endpoint = <&redriver_ss_in>;
+};
-- 
2.25.1


