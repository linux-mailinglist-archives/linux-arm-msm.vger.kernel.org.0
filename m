Return-Path: <linux-arm-msm+bounces-89376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3900D2FBFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 11:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5258330FCC0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 10:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2531735FF6E;
	Fri, 16 Jan 2026 10:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jWIQMqI8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a/R27Bn0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E9C3612F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560115; cv=none; b=rjrWT0vLuHapJs+e0e5kwpp1UcmBwBXktqejBBTaE69fwpDUCLHnh7C2Cf3bihKKBrvDWmH+iPf+KjcVpDkVLP6GCbOhPE/wai8kteyVAl2TjHwCGE4/nNJxSZQ4HJk3MljGBhvJTk6vxlWUtbwEYd1Cf1kHvyvuJW7HnvpMn6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560115; c=relaxed/simple;
	bh=6WWH0BxtbsHAJF5KlpW3HNSHjXXaRuCPbBD3fB0j6EU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gg2GQkMoMZOOx6NfP8pXOjgtZEny3dI7UElJlw/UrrF1eX4SvJtQ9gzUfifHzo+PWKSNnqfnA/Prm406jJQ2RRDNYn13vCv0HTwrd8G3vNDIykfkmhsE5fkiTMQgbtKFU2pxT936NrS0gT5gsoq4k1BlyBIHM3nhqTA2C50zmcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jWIQMqI8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a/R27Bn0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G8C9cs3582826
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lTyxVB+XCtW
	5KdnFDG/vprmLeOONz4Jr3SwhGCI7sz0=; b=jWIQMqI8Y7tJ7GT/hrIH0iZB+ug
	4pfvsv2WGPZOzZy/zs5aZGv8PYjmfSeMYgrAXFurOOy07CBVOh/hhrqbFn7u2o0+
	bBboYk0Qdx8BwOipPhOCJjMjgsGmlYRU631UlsHHKgVpcYZw8kFm3qJHrtjMvb9s
	+2W3WKOUdwdvEdwQju43E8qLAGbhMTBBGL3Oo3vEWsZJMuY6vikec6jRZRwRZp2L
	K0fFHhFn2O/rSs19ts57Kj/0AZcfzmPqi6pxXrxsvmG26oaoeNKCf/zEmdHs1qpl
	paq4Ad6eM5NFKD7/3iFnySw8XKEWlgZiv8HGOmtjdZBRWW3xtuz8p8LfgxQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9aysuh2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 10:41:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0dabc192eso19890565ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 02:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768560110; x=1769164910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lTyxVB+XCtW5KdnFDG/vprmLeOONz4Jr3SwhGCI7sz0=;
        b=a/R27Bn0n1+wcJmOp5QQZGokaX2me6kQIAC9OmM0IvMLwWmhqEu4oyEuSXKFpkDeWu
         3Le4C7MYitoo5PxpUOi24bkaDpWlO7grWPG3qnkTMA9nJ+u8YLG/ychNIbZUTbNXfpyT
         ikEmfsrBdo/hGLCL7LtHDyUHZ+ZvCXKdu0jIL85XGixJYIj5OoJ4BfAGqAVxuF4x+uuf
         pfSOvayCFiKgkYKsoGJqXcfe1nsTzDs3zsC+pAKlSXQSM5cTYPAP9LhGIj/0mVxEWW5O
         DbGn+R+pL8qVJ4dJp1vZwD6JpP7Lkejys15HOfS6a24ZH+jN5LW9oDJBnGf0tXwFXRUe
         iQeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768560110; x=1769164910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lTyxVB+XCtW5KdnFDG/vprmLeOONz4Jr3SwhGCI7sz0=;
        b=ll5OgNsx2dFoAd1ZXTnHDncef8CjIq/Tq2VkXkZI0Z292MOOA623X3E0ixfhpzvGxL
         8Z/x1BTn4s115rndeg4beC4oYAuPLjlN1e03ui0E/8vDKkDHroWM3XHj9Gynuxd6rnY8
         BMJ4b2f760iVPe/L5fm2HyVCfvAKqDiEa1YonfgnlVG0pcd1g/sVEewfgg58NeNSuErQ
         XSo0xjDK0OeIDjfwq5ni2ZXOTo+dwGKJs7hRFjs7ZrZhfEZY4kzd+sr89ROoFnri5e2t
         pO+kiGKnScrj3/vgcSl6R7DquGTgpV/cKUiwQ3u/CAkEXFkb1j+5IRedUD4FUKDJoqxz
         HApA==
X-Gm-Message-State: AOJu0YzJ2T4FIiDxyF4+RUFygNHYIeyCXKyb2rxkuOEtObtfSCU5FTlr
	gpVKsgVYIp7++aC5320r5qZOjZLPqgeUuL3ySCCw81LI2YM7W6wxg5ETU3HAshL4S3EfMbYSIZW
	m9qS8i9BbCbA5al7jiVE1wkkKxjaOtZ/bpcWQrw+DrZLve7BT2DI2heZyaJHM1RiWXPEk
X-Gm-Gg: AY/fxX6dhuD4bPZho86JbHjtdGbSvXMtlgHsdX9paxgPKI43wLQLEqdy3ptE6CtKkVQ
	63gMdn4oenXy1rPGki9ZGplY56FGnlP7NCmJFs51C7UsSsPg+u95boeyMv++nelxjKwUu5kf70O
	lqGVb/hfRKDSOHdvDNmzyZMlVXMJ7gzqc1AfyIUZQFHQOFOJOSofoY9c6T4CRPILgvUrrpr1P8T
	eMHk2Ejx2/H6N4XKr4upMYHm/7cGTJfJJNgMePi4+ANpySNZilbvONVUxQCszlNoHwIa+l2uESk
	dlWy30D8bpXRoCKgmNKpI92nxdlarA0cOSEdpdEj23frbBfpujKxte+Uwc7I3beAMBr80oXRE7K
	3zQOQ8faPm6/DgIZY8vLqJlSmPfSWIFeaaP3nrnVJG+ZAxZ3szrqwM1T+2uS3dLQcCuj7/GDzve
	U=
X-Received: by 2002:a17:902:da48:b0:2a0:9d0f:b1ed with SMTP id d9443c01a7336-2a7188be6f2mr23867745ad.24.1768560109647;
        Fri, 16 Jan 2026 02:41:49 -0800 (PST)
X-Received: by 2002:a17:902:da48:b0:2a0:9d0f:b1ed with SMTP id d9443c01a7336-2a7188be6f2mr23867475ad.24.1768560109175;
        Fri, 16 Jan 2026 02:41:49 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190aa340sm18009215ad.3.2026.01.16.02.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 02:41:48 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com
Subject: [PATCH v4 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
Date: Fri, 16 Jan 2026 18:41:30 +0800
Message-Id: <20260116104136.2922032-4-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g64gvBmQO59kXJM4QGqvc3hn_UMAviia
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA3OSBTYWx0ZWRfX2CnoQW/kxlLo
 uqORG3Mouxm6ZGUvjsRvKs5gjNjXTT7FiPtpfHx732bk2gPKvtDl+9caqPErnqKd6/1LyUTqTSH
 RPbyRb/80Jy2G70Qqwyq1ed9ZP2JsF4hAHxgE+HWB24kPRBNU6kly+fn2CiNImV+2zIceeFBQbH
 5NmDLj8Yai9Thnycigg8V4DeN5WxPbvp8u+7UqiXV4F+vNDpJxumaBTpxCpW1YZG1+Rte73tbrH
 VpZpKYA1avP3I0xYn6FJD62KC4sqEQdiHQ9TNyJwArsUYIgwXBVEeXRCqIggdt0YN+1VTHU9VH4
 fi9ZTHgqVHIrCzWtuEV2TXNcMh8Kn0kOzDnhPQDRkexyUny0e6CTk6gQI8O3miqWCGAUr/dJ0zh
 otSQ7+PyPSG7kMXdWT9JlLz9wlIsilj1dzsfYdBGg5kr/uSibHmKv+sDAjwpoqLgeDwuZhV9yFQ
 NaLFZRpx20mqy7keWEA==
X-Proofpoint-GUID: g64gvBmQO59kXJM4QGqvc3hn_UMAviia
X-Authority-Analysis: v=2.4 cv=NfDrFmD4 c=1 sm=1 tr=0 ts=696a15ee cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qttkq7nP6dpe1EO-CVAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_03,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160079

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

The PURWA-IOT-EVK is an evaluation platform for IoT products, composed of
the Purwa IoT SoM and a carrier board. Together, they form a complete
embedded system capable of booting to UART.

PURWA-IOT-EVK uses the PS8833 as a retimer for USB0, unlike HAMOA-IOT-EVK.
Meanwhile, USB0 bypasses the SBU selector FSUSB42.

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
- TPM

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../{hamoa-iot-evk.dts => purwa-iot-evk.dts}  | 112 ++++++++++++------
 2 files changed, 75 insertions(+), 38 deletions(-)
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
index 2390648a248f..2a2cbcd9eace 100644
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
@@ -1144,6 +1180,16 @@ &pmk8550_pwm {
 	status = "okay";
 };
 
+&spi11 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
 &smb2360_0 {
 	status = "okay";
 };
@@ -1171,16 +1217,6 @@ &smb2360_2_eusb2_repeater {
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
 
@@ -1470,7 +1506,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
 &usb_1_ss1_dwc3_hs {
-- 
2.34.1


