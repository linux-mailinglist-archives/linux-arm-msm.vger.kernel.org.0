Return-Path: <linux-arm-msm+bounces-88754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D12BD18076
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 11:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4354D3017849
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF8438E5F2;
	Tue, 13 Jan 2026 10:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="js2ENYLI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ScujVZ5f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5F738BF75
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300122; cv=none; b=HKDndDPHSnpZdiuB7ziG7BjBo6GyBjizXZqeFYdYCn04H1vz9Sd9RPYfsrrEvuL1yt8BaoI6y5hPe4GDnuT90VTdEB5qBepxz6P6/k1KZg0En2A7u2KrHQYCVWWQ9EXhYdAdXOKmlFVpCi75q5Gr+Im5I/mcbfnx9FEqNbxCN7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300122; c=relaxed/simple;
	bh=nPoaCvXC9fYWvhq/vZ4lvnfmGxbhql3x2Jf6rQgElDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bOGTO2w1OkskiL6tHc2mFVsi4daXaq3gmGJ8ErvbrU83y4fuwlBsXYt/2Lh1IhBJtr7nPX1wCnR6meUh5Spw98XTq2Wxjh6rf2deJDDBf6Qg0Z5pqDBB6SihtcT+oFQ0d+I1+VF8DzQ3BjlATjc2veTLz4y194z1xiz4vYDwr+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=js2ENYLI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ScujVZ5f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D78o7U1935703
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=45zdGDb6r1W
	HhSgDsq/WdGHrGhA2G9S3kLXgLp5fVU8=; b=js2ENYLIrwFQEc+9d7wLKKmET5c
	B6YnpNOlWT6Wji7uqtXIMjuZ4hyze3iOsc4taI3je6KCjmQu0eQ1hNB9YOXKn2u5
	qTzTLkzOUg5Zd0sA19Mqt4xO1UmHbwvcTxPAW6/zaFiXuYX95tuu7ub2YKhEpwDy
	LGtp9J6bMixVVsns+o7Z1rUBzSD7Eixx9vWQoCmK4w35jPZ/3VGmjoKeNe7yriB+
	lvw1mvT3Z88CVSofPG46SWzBsmJTJtOzcs+d+HLZx5l7e3rVuVHITaxY+q3dHlaI
	GYijOATqopJUfQEDaW6NE9c8LtZDmG9ZTI1y5xPPm4wgULAOGwfFU8vytpg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bn6cnjhhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 10:28:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso84046425ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 02:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768300116; x=1768904916; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45zdGDb6r1WHhSgDsq/WdGHrGhA2G9S3kLXgLp5fVU8=;
        b=ScujVZ5fRPPQV/XTtGAAVkai3HAN0f4ym+khv71haU/y0RgBItkf98rWziuFV9x6B/
         QORkjupqkmUeW92J5HqiLrK0V1+IBssIqQG+K9tnMB4mEMxIlRRvf550DpKLfOm8yST4
         7w/F/miAvlGtVGWvKJqnvkq7WbtxOtEPKsJqWmFYvMVoqV3glGUqConDmnJeBgWy3LUT
         NN/1HvaOntNkUIdUTWtAHKX/axLHosqTCez8B7OqTJ3n5EcfGK8ADTY60qEXoOI1tOHE
         zFlompjogKtxrgz/zvZkl+WAFM8yn8SHZi9MkdjsQ9ytGS0Vc0fFoV1xJ61cQMjnXxKG
         ceBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300116; x=1768904916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=45zdGDb6r1WHhSgDsq/WdGHrGhA2G9S3kLXgLp5fVU8=;
        b=uzPpoDbuIx94kagL8fpG4i+HHigvdsjryVhk6K0fbANraeeA6uQkCHI9m97S4iFL1h
         2WzuWhdHoWgg4JSVl6dca9STqTll3xkPeXFRveR/Mtc72W/wLxC8D6pWyLnaK7i2P2+p
         v59/k8OZtIxKiLWV9WWFCOpUf162mEktq2BRFtkKB5rvjPgiXM3FYxxat1bI5MH2W38V
         4oy/FGcOKrQRup/c5TN8umJgJy0AazGnQeFJ+zqQmkSs0dT2af8FD3ulJhmFw/9kMxer
         nL3cQVhQG4Vrrz3AI21tVXKgu+3A8AILsuQro7zUYc5fKeuWiuvrK48JvyC4rBgFK+0r
         IGCg==
X-Gm-Message-State: AOJu0YyvFGkG0oO2WNIxi8K765cgbGux9/6KOCTsWJz0Mm0YqWM54dpE
	HH/JtFbvJNcXrot79KtjfDHgQLbVDOAnRXSJITKE75AxsfTbFDWnnmbisEVecj012fFyunq+9lp
	6vozs5tEGs/1OkxiZuC9IrVmNj8BF2VQ00wffqFivxQVEE8ze9wlhwADYi39nIi1+2j9q
X-Gm-Gg: AY/fxX4XRsZYu+szxdBQrHd8kxsUSxZyJDbjsNtRMVNQqjSqI+O6FVSL4zONcqdVehR
	xv2R8hsLC6WnJSHYdaPNPJCL1Mj74fivYvJfuEdnAsmfcYbSBVGdbAdN5LiYwfJiUhplnsdqzVQ
	mT2F9Zr44dxxtAiFbrtdJWeOM5LdJuQ3ZEjjxwCFVrbP1hFMO7tFt523fKbwjPFti40SUzcl23R
	Yd2lncF0nTmRH7YyHuSt0AMFrO2ROq4XW37DL9Q9Fwptno9VcjPcKfqF3O2TndgROvJLxsAtU06
	auLLRU0SB0qJVLA782qyAk6fUimo5OlDQVXUyIFV0jYuKa8/XIOnKP/TMoKooaKk4Vx70Plspl3
	cNHG16s3YH5RT+3dcP6DWMR/SNB0cZgIHO7tCv2GC9xI0AlM5RG6LrJ27Jc542af2ZRfuQx1zJa
	g=
X-Received: by 2002:a17:902:f54e:b0:29d:584e:6349 with SMTP id d9443c01a7336-2a3ee451f29mr199749905ad.13.1768300116114;
        Tue, 13 Jan 2026 02:28:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHH04odkjGB6quhBjYqwJMFLA59SWVl1C++R5m41jC2rLFV3i109d/dOXfEva5lPqb2gZvo3Q==
X-Received: by 2002:a17:902:f54e:b0:29d:584e:6349 with SMTP id d9443c01a7336-2a3ee451f29mr199749685ad.13.1768300115608;
        Tue, 13 Jan 2026 02:28:35 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8d76sm197125265ad.84.2026.01.13.02.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:28:35 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com
Subject: [PATCH v3 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
Date: Tue, 13 Jan 2026 18:28:16 +0800
Message-Id: <20260113102822.590677-4-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
References: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: JhUs1XjJkHAMaoU2pf7aLsI_leimzV3-
X-Authority-Analysis: v=2.4 cv=KK5XzVFo c=1 sm=1 tr=0 ts=69661e55 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=dNVs3vikzzgUXnu04FQA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: JhUs1XjJkHAMaoU2pf7aLsI_leimzV3-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4OCBTYWx0ZWRfX04IDqLDEmSTz
 qmY8azFI2+vBEWFdQRXg8eCKpVFz6LUZTghJ5OagL/UCinC/MErnAe5atWDVpCwS0cdCHWnpgqM
 O5LUWS166+0DyEvBA5pCS7ZVmbNIo3mKGC3imbCXmo+Sk7AsOGlJrYUTTlAZllUTlWxaFfX3z/l
 7LlQpN2Iovq3wd40i3oqL85dFeqfAVBY0zEdYrZEiLto6sW5tmBnqykncJh+LxCdKhaof4B1VEp
 ZkJujJwmxQeOXkqQ13LUZYzF3GrbrCHf4uFM1w4gmraAkScEzC0yLb6q+7cC8s9BBELHeGKIBzq
 hc8ns2tuq6otvzAOBzfStUF6TT9oqjzXbxPs1erPQhZ/gSJM6Y7gXV4GbgUx9WGT0CI2yzsWrLF
 6JY0YI+MFrwoC2ofiK+gUaMwt7H1Er7rukYFdab5ZQM6k5RoaMeAua+lEd/HK5lUhQybXzEgNKP
 /sIB2Bn208BmvvZ09ew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130088

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
the Purwa IoT SoM and a carrier board. Together, they form a complete
embedded system capable of booting to UART.

PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
Meanwhile, USB0 bypasses the SBU selector FSUSB42. As a result, the glink
topology differs from that of HAMOA-IOT-EVK.

Make the following peripherals on the carrier board enabled:
- UART
- On-board regulators
- USB Type-C mux
- Pinctrl
- Embedded USB (EUSB) repeaters
- NVMe
- pmic-glink
- USB DisplayPorts
- Bluetooth
- WLAN
- Audio
- PCIe ports for PCIe3 through PCIe6a

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../{hamoa-iot-evk.dts => purwa-iot-evk.dts}  | 102 +++++++++++-------
 2 files changed, 65 insertions(+), 38 deletions(-)
 copy arch/arm64/boot/dts/qcom/{hamoa-iot-evk.dts => purwa-iot-evk.dts} (95%)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a5d6f451f85c..d276b3cf14ee 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -126,6 +126,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-lilac.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-fairphone-fp5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-particle-tachyon.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
similarity index 95%
copy from arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
copy to arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index 2390648a248f..6f779be3c6d7 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -6,12 +6,12 @@
 /dts-v1/;
 
 #include <dt-bindings/leds/common.h>
-#include "hamoa-iot-som.dtsi"
+#include "purwa-iot-som.dtsi"
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 / {
-	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
-	compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
+	model = "Qualcomm Technologies, Inc. Purwa IoT EVK";
+	compatible = "qcom,purwa-iot-evk", "qcom,purwa-iot-som", "qcom,x1p42100";
 	chassis-type = "embedded";
 
 	aliases {
@@ -118,15 +118,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+						remote-endpoint = <&retimer_ss0_ss_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 
-					pmic_glink_ss0_sbu: endpoint {
-						remote-endpoint = <&usb_1_ss0_sbu_mux>;
+					pmic_glink_ss0_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss0_con_sbu_out>;
 					};
 				};
 			};
@@ -618,25 +618,6 @@ platform {
 		};
 	};
 
-	usb-1-ss0-sbu-mux {
-		compatible = "onnn,fsusb42", "gpio-sbu-mux";
-
-		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
-		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&usb_1_ss0_sbu_default>;
-		pinctrl-names = "default";
-
-		mode-switch;
-		orientation-switch;
-
-		port {
-			usb_1_ss0_sbu_mux: endpoint {
-				remote-endpoint = <&pmic_glink_ss0_sbu>;
-			};
-		};
-	};
-
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -753,6 +734,63 @@ retimer_ss2_con_sbu_out: endpoint {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK4>;
+
+		vdd-supply = <&vreg_rtmr0_1p15>;
+		vdd33-supply = <&vreg_rtmr0_3p3>;
+		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
+		vddar-supply = <&vreg_rtmr0_1p15>;
+		vddat-supply = <&vreg_rtmr0_1p15>;
+		vddio-supply = <&vreg_rtmr0_1p8>;
+
+		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&rtmr0_default>;
+		pinctrl-names = "default";
+
+		retimer-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss0_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss0_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss0_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
+				};
+			};
+		};
+	};
+};
+
 &i2c5 {
 	clock-frequency = <400000>;
 
@@ -1102,9 +1140,7 @@ edp_bl_reg_en: edp-bl-reg-en-state {
 		pins = "gpio10";
 		function = "normal";
 	};
-};
 
-&pmc8380_3_gpios {
 	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
 		pins = "gpio8";
 		function = "normal";
@@ -1171,16 +1207,6 @@ &smb2360_2_eusb2_repeater {
 	vdd3-supply = <&vreg_l8b_3p0>;
 };
 
-&spi11 {
-	status = "okay";
-
-	tpm@0 {
-		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
-		reg = <0>;
-		spi-max-frequency = <20000000>;
-	};
-};
-
 &swr0 {
 	status = "okay";
 
@@ -1470,7 +1496,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
 &usb_1_ss1_dwc3_hs {
-- 
2.34.1


