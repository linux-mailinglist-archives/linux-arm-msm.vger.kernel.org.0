Return-Path: <linux-arm-msm+bounces-86000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E969CD28B7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 07:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 554583028C7C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 06:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D30E92D739B;
	Sat, 20 Dec 2025 06:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xiy4kNK5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z4kN7F3T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305022D7D2A
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 06:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766212596; cv=none; b=op9tGr/viEtt1kGGy4CDD/ZnmVvqSpEvgXfIUW+XytaQei1eODn01ufgZsYy/RepfwbA/UDL1G8sNL+CNUQF5Z7JUjxOQ93p0XEQo6/xmi94LNko9DzFBfROI+LckI8TovBVw8kLpsUmjgBA8j0JiO1L2gJoevwV28LKoKlatuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766212596; c=relaxed/simple;
	bh=+TO9BHN9dqsZdCeMLdCOkLD5oWhxZd8LOnnSEJKZauQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sAPXQxvEe/Mnw1X1FF4OwxPxVxofM93QhkNlDasWb4qmM71bWh1CVVSjZymf2F3Qn0jpwwZnSAb5T/Rv6lElWE9SpPtbCiOxIrgqfLftoJkqRz1M07dofgI8gPk0fdiqpSVIeZkV2psOpQviik1h6hAHG1aoVnLcBOQ7eX2hpUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xiy4kNK5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z4kN7F3T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BK4PwfZ2982898
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 06:36:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2Nx7Cr/k4HX
	aH74wUNAFiQCRYfHpTk7Bi2OnazsTsiM=; b=Xiy4kNK5meAHEyKPSXhYemIIqxo
	zzXTHXDSrwjTB4VHklC94w2hl+nIJF1qgysOn9ZDsiqmqOUu6aoxg1BHV+Nb/e7S
	Hd3bp08Yyku/X1R/RZAgtca1vH6M+xyPw8fHFWp4mXv2DuDRr+VS+KGx1fHdJnhg
	HbjtCZPsAbG5ZMgpazMt4hl4DJG662qVnF6ij0ro28qSdO7LRoQfYU5z9VLDDUhW
	KpD2IIXM4GQs9YEG4toNV9E2Dbuz+Rq+zZskFywH1uoqPyZOIronvRXqjUJ80f5P
	EGQHJaZk81lgHWbCnjIu/UXLLnhvza95YysAMgPtQKMfzBvCG2Wg78A29Zw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mru06aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 06:36:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34e5a9f0d6aso2371457a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 22:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766212590; x=1766817390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Nx7Cr/k4HXaH74wUNAFiQCRYfHpTk7Bi2OnazsTsiM=;
        b=Z4kN7F3TO9eDmgzuDO39GfYxm2cLEzfIh1Wm0riKg8pzqujUpCB/vOh2qIQoqoV0x9
         isjdclIheWfrupAgyo8JJ4OKWorGjBhscNsFQaDH3E3ZdRTM0RrIfBbLrlu1dccsTQEo
         tHe18rACoQNuOI8EZub987unQ6yjhfxVfsRGT9if7wnN3F2w8E3DoETL2K4gM8qlxbEZ
         5AG4VzDISKDY93O1UmaW8Aecz6JTy4PUF6vfJsI3Eq00N41P6nSTPivUq6jsH3VJhLCt
         PyQMBpkMo1/Fa5maUiL+PHMcOGFmnqEWJIMxZK/low+mYQZHJaS3xyHVYj9wTwiRJKMK
         9BnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766212590; x=1766817390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Nx7Cr/k4HXaH74wUNAFiQCRYfHpTk7Bi2OnazsTsiM=;
        b=M/Pgz+rp88JYV/0srUwpTSPx2F96cMe9PwdouBu0dUDGXG0DyENl2r5viILcPkUEm4
         LG+rATOQ7KbWRLkgCHKdrR5NTc/gUNo3k5WFxBayyqeYxNesIcqVdcaROQSYophf9GGr
         AkyS6PmeXdXtVMidSY5ngTM2c+S8FYvxHCznKDKuzq3IXSu7lC9q2I+gm6zNc9xwZNVA
         0uKf24US+mGf8jh9W+pYMpnc4SV44L4mBOghYCayZ6W0cDy1lOWeh7kwW1o1glyCMe8G
         fyocLxx/kSwMMrgEpSonRSRcMzDQIi6mCrFzA/+irUP0y08R1KwixEoD5C9hbY575tLX
         VKEA==
X-Forwarded-Encrypted: i=1; AJvYcCVK9zRfa0fU+fK9fxTzuV934gAPLs3llO+T58vYyZGo4qei/iBx+bep+Mh8aOepSGNCY+p8ZuIe3YeWlbou@vger.kernel.org
X-Gm-Message-State: AOJu0YxEX5i2vIazzx1WOqdIp6IYQUtr7AjOV0HAGItfYFIKJdmkWWNv
	BNnpAFuje+WckOU62BMo5p/rnb3Ct9akl58YYpNOT8zrwIUgA97B3ISGBvs8Vbde/w2NEAlLU/A
	zSzMO1ouCJ9vWwiW6Gt61UxtTPlS2n7WghkJWiUoVSN0sGGJxS3o2hGM5EjzPmFK1wFnW
X-Gm-Gg: AY/fxX4B8HDVKOzLCt0ME4B/uu6hGdf2CB2FXrOrOHrZrl2xPRFcZ8pmqjYco3lqnAj
	ekt5g907UeAfrlCpharA3fzn/XNd33v/5TlhAwvEDZxbAceIZK/7rfs8G7Iu40hsBTfKiXn3M5j
	j+E2UEpndCEnJIx4x6lnE3/Y59amY73pUZUWYhzjtRWxo2yEYfLCDvhAAM/ZXnz8Ol/9/aWz6Vj
	UxOdE30XYS0g8VHUy32oL4wlJS1w6Hzf8ySvpH8nbwMiDKauCL+jEhgTQSlqQ4u3xmLAQBaI+k4
	4bjsrntyp5lUzTeBuK4pB+a75ogMbBkh0MsB50MJIFqwm8cverHRvTmYEzzz+HHTRgbxuQNZx4k
	fgR8NTULUXdsgZ62TChGyWXdF079vSJ1y1SbpjhhYGFk=
X-Received: by 2002:a17:90b:4b0b:b0:340:c094:fbff with SMTP id 98e67ed59e1d1-34e71e09fecmr7232400a91.10.1766212590165;
        Fri, 19 Dec 2025 22:36:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu9AxmyQj8/54hV6LdKcLMacPqBaV8Ajwg+Uf1W9s25P7nzhIFvHlYNlQXhWCBeA0d2hFuhA==
X-Received: by 2002:a17:90b:4b0b:b0:340:c094:fbff with SMTP id 98e67ed59e1d1-34e71e09fecmr7232371a91.10.1766212589520;
        Fri, 19 Dec 2025 22:36:29 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7723b3a8sm2847143a91.3.2025.12.19.22.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 22:36:28 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pin-yen Lin <treapking@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v3 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host mode
Date: Sat, 20 Dec 2025 12:05:37 +0530
Message-Id: <20251220063537.3639535-5-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDA1MCBTYWx0ZWRfX5IB28fRhcyx2
 oTT3sERKHHnDGYcoI2T5H65C/zz1yNHdgfsqAKtEaIU5K+HNBffxQ6RJw0RlUz0Qb52QWdcWjII
 CsGnb+4kqL902fS9fdEblsQpXza0gt25PXIYzgv/CiZTl0ItPX6r1x78+jwYRwHeNUaJYALve0y
 XCeEa8xm6qI6LH7ZkAEI5GBeZl5WdZHP1wn17mx/bADFykPMzWZrf0Rh3c7E2dKnmMfjopTfCHi
 XLI1jZfGU4HbPYqn+xe3ZO86qRJx8xRJL//vIMbuOacksGqYaLuMsyaf8bkyk5ZtOCyRL5D68gV
 hUPPy38ujaUipfh/CoP7lQ12KqAiuqXN7tqKXB/oeuqVLXTm4JKhUlXzuwh8Q+JFaXCeMQBT89q
 39OkJ+OnbdALKVH2spTi6NQRLkY+3tS29ZwDs9MhhTtglEKx3DgmJxf7paqhCjsCsRFVLWJOkOO
 V7vck7BSm7f4ZiDyB0Q==
X-Authority-Analysis: v=2.4 cv=VMnQXtPX c=1 sm=1 tr=0 ts=694643ee cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0PLguQYFKghNqROady8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: owCOeIWeM_rO7VfxgMHV7qmmlWfFTW5o
X-Proofpoint-GUID: owCOeIWeM_rO7VfxgMHV7qmmlWfFTW5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-20_01,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200050

Enable secondary USB controller in host mode on lemans EVK Platform.

For secondary USB Typec port, there is a genesys USB HUB GL3590 having 4
ports sitting in between SOC and HD3SS3220 Type-C port controller and SS
lines run from the SoC through the hub to the Port controller. Mark the
second USB controller as host only capable.

Add HD3SS3220 Type-C port controller along with Type-c connector for
controlling vbus supply.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 158 ++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 70d85b6ba772..d72639479d75 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -67,6 +67,47 @@ usb0_con_ss_ep: endpoint {
 		};
 	};
 
+	connector-1 {
+		compatible = "usb-c-connector";
+		label = "USB1-Type-C";
+		data-role = "host";
+		power-role = "dual";
+		try-power-role = "source";
+
+		vbus-supply = <&vbus_supply_regulator_1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb1_con_ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_1_in_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb1_hs_in: endpoint {
+					remote-endpoint = <&usb_hub_2_1>;
+				};
+
+			};
+
+			port@2 {
+				reg = <2>;
+
+				usb1_ss_in: endpoint {
+					remote-endpoint = <&usb_hub_3_1>;
+				};
+
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -140,6 +181,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
 		enable-active-high;
 	};
 
+	vbus_supply_regulator_1: regulator-vbus-supply-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_supply_1";
+		gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+
 	vmmc_sdc: regulator-vmmc-sdc {
 		compatible = "regulator-fixed";
 
@@ -527,6 +578,33 @@ hd3ss3220_0_out_ep: endpoint {
 			};
 		};
 	};
+
+	usb-typec@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+
+		interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
+
+		id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb1_id>, <&usb1_intr>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hd3ss3220_1_in_ep: endpoint {
+					remote-endpoint = <&usb1_con_ss_ep>;
+				};
+			};
+
+		};
+	};
+
 };
 
 &i2c18 {
@@ -690,6 +768,14 @@ usb0_intr_state: usb0-intr-state {
 		bias-pull-up;
 		power-source = <0>;
 	};
+
+	usb1_intr: usb1-intr-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
 };
 
 &qup_i2c19_default {
@@ -849,6 +935,12 @@ usb_id: usb-id-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	usb1_id: usb1-id-state {
+		pins = "gpio51";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart10 {
@@ -903,6 +995,72 @@ &usb_0_qmpphy {
 	status = "okay";
 };
 
+&usb_1 {
+	dr_mode = "host";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	usb_hub_2_x: hub@1 {
+		compatible = "usb5e3,610";
+		reg = <1>;
+		peer-hub = <&usb_hub_3_x>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_2_1: endpoint {
+					remote-endpoint = <&usb1_hs_in>;
+				};
+			};
+
+		};
+	};
+
+	usb_hub_3_x: hub@2 {
+		compatible = "usb5e3,625";
+		reg = <2>;
+		peer-hub = <&usb_hub_2_x>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_3_1: endpoint {
+					remote-endpoint = <&usb1_ss_in>;
+				};
+			};
+
+		};
+	};
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
-- 
2.34.1


