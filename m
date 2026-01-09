Return-Path: <linux-arm-msm+bounces-88207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF08D07AE2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 09:02:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84F5D306C773
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 08:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C39A2FB093;
	Fri,  9 Jan 2026 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Akdnff/8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kFhGp0iq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448722F9D9A
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 08:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767945620; cv=none; b=HpygL9Uqeq7oZLD6s870b1CxlBMlN3yRJMSmarWqsGyu4TcrO3dKw6Z8LDZXreqeY1eQ/4frBgRj9t2Tw0IBUTmP35XiFy6faVMgA0RFShLjctvYs8x+dbNo6PU0axEhdqA+IjuosWIrqO57cHPv5Egore8TIsvhSDFckNg7YMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767945620; c=relaxed/simple;
	bh=GxFeOTfqLMjAh+3xV+k5jT7ij5RPRieTPubXQ2dlf1I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c4Zjs6TfF3Jagh93xDhPmx423CF8NrrzgZq2Wnt2M78oEPxMiImY63wJaFIy2sAVVl63V/KW43pwOg4qF1n+ekiHwDqdDThqeJUe6vgB1QsjUomtdfuHjPyvjZzmDjdHw/k51XiD/XnJWBEnawZvPlolROdM5b9Nh+weiwS9upE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Akdnff/8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kFhGp0iq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095OBI31701777
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 08:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HYOioQivKAV
	ocEtadZNARwQdYdXFu9IqffB0LQmMym8=; b=Akdnff/8SUKPeUbi0u58rth1qIO
	SgRrpBhYEz0PRT2m3g5LkYV2DXPh4AEBLpYHsX/vSLuGECBUQx/Qfa49N0Pu8A7V
	7xvHpHjapjcK8dq3AKmPwi3n19BYpxWixkXzj6/D5sFdJ8jDaMJwzavOWIaVQEuA
	UyBPAuIUbzYO3rYYIxDJuVKvddN9sW7HqGznUlgDNXyv1gwowqqftNcZjiitEe+r
	exZcc6YFal2Dj35EEfuAeXlclVgRzEJFrv7tU3eEHcoLAz2Xn+w6Vnp/zOiDUG3c
	lHlZjdmD6yDD8ckJTO5tuEZ0I5KOlmSQR9C1vg6ovnN4QOQXWg133aNxOkA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfdaagv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 08:00:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c56848e6f45so180840a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 00:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767945616; x=1768550416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HYOioQivKAVocEtadZNARwQdYdXFu9IqffB0LQmMym8=;
        b=kFhGp0iqu9G93Qj0b0TyUxh7MDlhOLck8+LVI0XMg7iQrTUOCyca9TA4DxhV62g9oL
         vfgxOL4AzzXITGp56whV4oZKGPkBV08UuX+2GfoY7nlc+DYOntKepMvs57ws1Wj/THNh
         FdfGlzVuX3Okv60qXX7TqcV59i7hOp6fVsnORm18ADwvg3RWJ9lfSV+FBS/iJdY8vOPR
         ctiP5+nRkIvXNrHO7FOFuhK9Zjd7g4ttf1etVbHVwOYfAiYZl8OgW3FeLC1lo6c7+DpX
         EcU/j4ERe2KGYne8knIm1MdluOWKkNU5xXw+F/qcTiZfz5TnQlSM014tLaeXcw/TcwMp
         5f7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767945616; x=1768550416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HYOioQivKAVocEtadZNARwQdYdXFu9IqffB0LQmMym8=;
        b=rxdB1baaZDxMn72ln3z3N7HsZxul9J7qRJnyMlUR/yFP1P9qEnq/wxATR9nQTydUi4
         5QsGo3BL6cKxILwByz2RvS8pou6Mkf6+GHpWh0VJayCRWXrge804Bm6nf5jx/aWJO5m8
         lDyyKOxPoLXHMg6+2mHEw2nVjZnwFc3x5gh5BHsPZcLiMtzAKeJedS7UdUDyq9lTXxGA
         JnKnl2RlTEUqki35xBZfo5kVHnKoboE9KAjEkmjZxRlLfLplCWSRTJDjcdTplZFtA56p
         KYc++hFN7jjMC7kPzVQ7RkO1pS+PpDxhO72EolF9/mQWQwR4xWxNy60QsyG/ntjV+3fS
         Daeg==
X-Gm-Message-State: AOJu0Yy4WpdRRmKuLmkw+0xuu5UMrE1841tFCQRecyEOki0xOHD0dvJe
	nQkofj6Hn4lJ2i5QJVW3TPKJzTRvslQavpfwekWXUqtXDiFrJhbWEIQHmY2Ubg+0mATl56RgiDm
	0fbdLvI3VF7CVEeLm9z/uzQROiUkEbZGBa1wP9fCkoAoVorjIzsr0O/DWrQXWNJrZV0G6D3YhsC
	+VmFo=
X-Gm-Gg: AY/fxX66g6bRwajbTn+jyfb2ig4KMUUWpNypdDsuyWx419Ie4B/Zp0iIBYRxc6wBYIW
	0xxi22rYQL5w0ckwsmkSzrKTw+zDkpQBb43YU+Y02JLhyw9tQWvvITuo9jp7Im6hQIGu3Tt7cQG
	tTj8D5agEILrAsIwDsvZt2vLBX97BW2o6Qy00wKt9OUz4q7ieok2wt78HaYD5PtngFEF/8Qljg1
	nceYsDyUrip49XnRR61ZeH/um4P2qAajfGyFgDIT1IbpWLNFibzfRqvSE7mggVdzRi4xytar+Ci
	vJ5Z1EypFIg378IvGb+o4nQU8q0NrINzXJiaoypvOFCQdvNVpcYDEkJg5l9Sg3oqNEXpxGuug7Z
	jkz3cqEz6JAmY4xQBOhBXAdqD0gsb4C0i4pYGC4JXHIpVBvj46Kt7KzWW+zPKfWQLUM1tz+nn0f
	I=
X-Received: by 2002:a17:902:d501:b0:2a0:dabc:1388 with SMTP id d9443c01a7336-2a3ee47d571mr80416665ad.28.1767945615487;
        Fri, 09 Jan 2026 00:00:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpkK6MFu3cvxse5kp/KmGV1fMiRcpG9gK8T+9m+ETywQaAhkuQgKWoRRsHpy32P5IF88sWQg==
X-Received: by 2002:a17:902:d501:b0:2a0:dabc:1388 with SMTP id d9443c01a7336-2a3ee47d571mr80416045ad.28.1767945614797;
        Fri, 09 Jan 2026 00:00:14 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a56bsm96808445ad.20.2026.01.09.00.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 00:00:14 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, yijie.yang@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Subject: [PATCH v2 4/4] arm64: dts: qcom: Add base PURWA-IOT-EVK board
Date: Fri,  9 Jan 2026 15:59:54 +0800
Message-Id: <20260109080000.606603-4-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=6960b590 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FF0mWUak27Dk8idMgBgA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 1N4rtvA604uFHVLeT19Mqvp-Ptjdfg4-
X-Proofpoint-GUID: 1N4rtvA604uFHVLeT19Mqvp-Ptjdfg4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1NSBTYWx0ZWRfX6DBJb/f4Zlnt
 LwUvTT2egShW/qfNzXUYzYB0JsWLbPdzkoNwTMukm85Ox/MBoj/N/qlpBinHYMqLCT2cdpcA39M
 iJbjZZMa05dftUp93AvMvrIpxFqLk8n8lAQBfqEp+24OD5vdEpTnItPSwo7EgylN2WWiTWBqHCb
 4Tp8bnpE8w94KxCAfKabwZFUZrKqGwRswX1IH68mTZSqthbWTCdNRiyuNeAJvwNFPLE8qprYFLj
 8IOLTUFI2NU8mlxzi4tXIon/2zV19bJrSTbh5HgZRd0UjAxbIE8AZnhk0jz93kZq07VLKblXFkB
 5vmbBtabELdMiZiMbLRuHdOmKgAPzLpsVKbhnNFRbj9VYgAhShx7DTWiBt7Q+OYgVy48ESiUo0/
 Rn4TqCMAbMqd16phATLHS6OLc5fjpceqOp3XQiTEn/F2/dZCrWiGdCuRzXsJAU9aWuVyZyC64va
 9wfMRkoWc3WQrPlriCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090055

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

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../{hamoa-iot-evk.dts => purwa-iot-evk.dts}  | 223 +++++-------------
 2 files changed, 66 insertions(+), 158 deletions(-)
 copy arch/arm64/boot/dts/qcom/{hamoa-iot-evk.dts => purwa-iot-evk.dts} (87%)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0ccd6ec16dfb..2ed1500cbaa9 100644
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
similarity index 87%
copy from arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
copy to arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index 898b92627f84..781634b45eb0 100644
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
@@ -19,16 +19,6 @@ aliases {
 		serial1 = &uart14;
 	};
 
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pmk8550_pwm 0 5000000>;
-		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
-		power-supply = <&vreg_edp_bl>;
-
-		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
-		pinctrl-names = "default";
-	};
-
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -60,32 +50,6 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	connector3 {
-		compatible = "usb-a-connector";
-		label = "USB-3-Type-A";
-		power-role = "source";
-
-		vbus-supply = <&regulator_usb3_vbus>;
-
-		port {
-			connector_3_in: endpoint {
-			};
-		};
-	};
-
-	connector6 {
-		compatible = "usb-a-connector";
-		label = "USB-6-Type-A";
-		power-role = "source";
-
-		vbus-supply = <&regulator_usb6_vbus>;
-
-		port {
-			connector_4_in: endpoint {
-			};
-		};
-	};
-
 	pmic-glink {
 		compatible = "qcom,x1e80100-pmic-glink",
 			     "qcom,sm8550-pmic-glink",
@@ -118,15 +82,15 @@ port@1 {
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
@@ -221,22 +185,6 @@ vreg_edp_3p3: regulator-edp-3p3 {
 		regulator-boot-on;
 	};
 
-	vreg_edp_bl: regulator-edp-bl {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VBL9";
-		regulator-min-microvolt = <3600000>;
-		regulator-max-microvolt = <3600000>;
-
-		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_bl_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -398,26 +346,6 @@ vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
 		regulator-boot-on;
 	};
 
-	regulator_usb3_vbus: regulator-usb3-vbus {
-		compatible = "regulator-fixed";
-		regulator-name = "USB3_VBUS";
-		gpio = <&pm8550ve_9_gpios 4 GPIO_ACTIVE_HIGH>;
-		pinctrl-0 = <&usb3_en>;
-		pinctrl-names = "default";
-		enable-active-high;
-		regulator-always-on;
-	};
-
-	regulator_usb6_vbus: regulator-usb6-vbus {
-		compatible = "regulator-fixed";
-		regulator-name = "USB6_VBUS";
-		gpio = <&pm8550ve_9_gpios 5 GPIO_ACTIVE_HIGH>;
-		pinctrl-0 = <&usb6_en>;
-		pinctrl-names = "default";
-		enable-active-high;
-		regulator-always-on;
-	};
-
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -576,25 +504,6 @@ platform {
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
 
@@ -711,6 +620,63 @@ retimer_ss2_con_sbu_out: endpoint {
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
 
@@ -894,7 +860,7 @@ aux-bus {
 		panel {
 			compatible = "edp-panel";
 
-			backlight = <&backlight>;
+			//backlight = <&backlight>;
 			power-supply = <&vreg_edp_3p3>;
 
 			port {
@@ -920,23 +886,6 @@ &mdss_dp3_phy {
 	status = "okay";
 };
 
-&pcie4_port0 {
-	wifi@0 {
-		compatible = "pci17cb,1107";
-		reg = <0x10000 0x0 0x0 0x0 0x0>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
-		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
-	};
-};
-
 &pcie6a {
 	vddpe-3v3-supply = <&vreg_nvme>;
 };
@@ -970,22 +919,6 @@ usb0_1p8_reg_en: usb0-1p8-reg-en-state {
 		input-disable;
 		output-enable;
 	};
-
-	usb3_en: usb3-en-state {
-		pins = "gpio4";
-		function = "normal";
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
-		output-enable;
-		power-source = <0>;
-	};
-
-	usb6_en: usb6-en-state {
-		pins = "gpio5";
-		function = "normal";
-		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
-		output-enable;
-		power-source = <0>;
-	};
 };
 
 &pm8550_pwm {
@@ -1010,21 +943,6 @@ led@2 {
 	};
 };
 
-&pmc8380_3_gpios {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio4";
-		function = "normal";
-		power-source = <1>;
-		input-disable;
-		output-enable;
-	};
-
-	edp_bl_reg_en: edp-bl-reg-en-state {
-		pins = "gpio10";
-		function = "normal";
-	};
-};
-
 &pmc8380_5_gpios {
 	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 		pins = "gpio8";
@@ -1036,17 +954,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 	};
 };
 
-&pmk8550_gpios {
-	edp_bl_pwm: edp-bl-pwm-state {
-		pins = "gpio5";
-		function = "func3";
-	};
-};
-
-&pmk8550_pwm {
-	status = "okay";
-};
-
 &smb2360_0 {
 	status = "okay";
 };
@@ -1363,7 +1270,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
 &usb_1_ss1_dwc3_hs {
-- 
2.34.1


