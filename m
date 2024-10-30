Return-Path: <linux-arm-msm+bounces-36482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F90F9B6C01
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 19:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60D16282346
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 18:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A051CC15E;
	Wed, 30 Oct 2024 18:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gGJHVSPP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CC51C7B68;
	Wed, 30 Oct 2024 18:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730312525; cv=none; b=AfY8WyzO/6wZY/F2e1ZTkxn3pK8Ija+ZDGSVBrDHdAnl9wvd6v7PbfboiXjnUR0Ur9gjU/nhImEhavrWaoMjaf+0E8MischNqIuoeZVpC0vGqCB5gw9MM5B3SPJjyyOc7D7nE7EtWm0UgLh/4Q2Vx0VSuqYKvIQ+KBSBeHLka/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730312525; c=relaxed/simple;
	bh=r3Pn7i/2ydcwsFF9NdbJfG1QjGwV3zk0jWvh9EKgtYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rn2vukszGfG/4vXCvukwVUAGWG9eHgmdCQSc44Bi3UjHR+Ogtv2ihScbrXHnhuGydh31lIkax0F5qrmcp6jDQvWV+Kgt8jcyzaemRN8e7SU14Wy6HjegHdFOtjQiiEwiUt8D0SylICElFrXgWcDS/K6Yxj+rP2hNZlKMYJCOjeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gGJHVSPP; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9acafdb745so25791266b.0;
        Wed, 30 Oct 2024 11:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730312521; x=1730917321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpV+8ASolFfSxpBtygT6FdU6yWA+qcVKoRSCRnzKFQw=;
        b=gGJHVSPPZSROJWJw4t3FDm1fjSZ8LGGvjmgd4TyKn44NEGHIks9JzqiDKONMrtiGtz
         zWugD2qKJ0LgVyoj0flXeU4+npO4Rkun7cC5i1hHNfAyY8mkqqtPnysw6SV+KnUMLv6C
         LgPnHwQojHBRunlW13xoOWm4zGnv7CfCbyO4ZRBd4aH0MvuOJXGStr3C9BdR85mVSbw7
         fLSPQWVHe3edwhv0Rzz0LUozPU1if02gjVZ/AIUo4gqHexfgmg3YoqwL/Pp2NtNZhENw
         ktuOuC5pedK6UkjC9hR8etQ60pUZs/IFNTryZkNEDYndJBHvl/YctZljZ3JjAQZyaqzR
         6uig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730312521; x=1730917321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XpV+8ASolFfSxpBtygT6FdU6yWA+qcVKoRSCRnzKFQw=;
        b=K6/DMddEcoTbgsPDpyoMnbY5klsXZ4WMq18C645CRfTcCiCKocEj1xcqHkF6wndqwN
         /s7FCjc9D6k/6hvfVVqhBzxZte2uUl0HUoDMIsAFaSN3cXYowErVjf9BJ97SlvmEIvjK
         ObBbHcDRJjrl/MZCA/7BCNCXIqrr1SAQNwINSLt21Ewq5csW/hJn+qhl86l9UvmQ/2sN
         bjlo6yp56XYz0P/G9L5V9gNuDa0E8w+PSEEL+wZ7lM30sjFbd0/Lv4HVNR+WvlkyAu6Y
         +O+lo+c/Yg2H/O0caR4eQ9upvVIRmC+yEaPo0GJyDkRVnSYeO2QWU3qhg3UxPCSRyIBE
         4OVA==
X-Forwarded-Encrypted: i=1; AJvYcCVDQM8YJM8qqgCBlBTDh2MML7osmtoXjiKN4rZN51SOcXZatUcTnCdnZw81/qrT/UyxCchkBE87jb59@vger.kernel.org, AJvYcCWoeokefPNB4VECWQkzxGJxtrPumtSxOePNUymPa8d3Zc0PlyHEckc5YRjYE6oN4GX6H2Mo1CPJsvSD1k3K7A==@vger.kernel.org, AJvYcCXS+HJz+ByJ97SoqJmJaS2VQq98g6MQb7SgxEkd+m+uW1/urNa14b+Ez0Qf9U1JUXrqE6Y2IPzacIXx9jC/@vger.kernel.org
X-Gm-Message-State: AOJu0YzCBJ0zKB5DC9n8OT74cDNCtLXZB2lbivsbQtvDQLOHq6WtUtlH
	69VHsTs+HY21vJYNdr2ALce50H04FE6AeV8b+ED7YrJ4QuPxq4Q=
X-Google-Smtp-Source: AGHT+IEDCuaGve5sRyZ+CNuDzm3eNy1YkPNEwh41AMCociQOoET50xx+6rp4PtgCqsDqXZ4x3TfF8A==
X-Received: by 2002:a17:907:98b:b0:a9a:1ef0:837b with SMTP id a640c23a62f3a-a9e40bccaa7mr317973666b.10.1730312520450;
        Wed, 30 Oct 2024 11:22:00 -0700 (PDT)
Received: from localhost.. (adsl-178-39-53-103.adslplus.ch. [178.39.53.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b1f2982ecsm586588466b.106.2024.10.30.11.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 11:22:00 -0700 (PDT)
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan.Kemp@dell.com,
	tudor.laurentiu.oss@gmail.com,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-dell-xps13-9345: Introduce retimer support
Date: Wed, 30 Oct 2024 19:19:36 +0100
Message-ID: <20241030182153.16256-2-alex.vinarskis@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241030182153.16256-1-alex.vinarskis@gmail.com>
References: <20241030182153.16256-1-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe x2 Parade PS8830 retimers for left and right USB Type-C ports
respectively. Adjust graphs between connectors and the PHYs accordingly,
add the voltage regulators. Dell XPS 13" 9345's DSDT describes 3rd
retimer, but its not actually present.

Regulators are _assumed_ to be correct, since:
* tlmm pins match DSDT definition.
* tlmm and pmic gpios were tested and confirmed to be powering
  off/resetting respective retimers.
* USB3.0 now works correctly in both orientation, pre and post suspend.

Derived from:
arm64: dts: qcom: x1e80100-t14s: Add external DP support

Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
---
 .../dts/qcom/x1e80100-dell-xps13-9345.dts     | 293 +++++++++++++++++-
 1 file changed, 283 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 05624226faf9..b112092fbb9f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -89,7 +89,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+						remote-endpoint = <&retimer_ss0_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss0_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss0_con_sbu_out>;
 					};
 				};
 			};
@@ -118,7 +126,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss1_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
+						remote-endpoint = <&retimer_ss1_ss_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss1_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss1_con_sbu_out>;
 					};
 				};
 			};
@@ -166,6 +182,102 @@ vreg_nvme: regulator-nvme {
 		regulator-boot-on;
 	};
 
+	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_1P15";
+		regulator-min-microvolt = <1150000>;
+		regulator-max-microvolt = <1150000>;
+
+		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr0_1p15_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr0_1p8_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR0_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr0_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR1_1P15";
+		regulator-min-microvolt = <1150000>;
+		regulator-max-microvolt = <1150000>;
+
+		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr1_1p15_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR1_1P8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr1_1p8_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_RTMR1_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&rtmr1_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vreg_vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -492,9 +604,60 @@ keyboard@5 {
 
 &i2c3 {
 	clock-frequency = <400000>;
-	status = "disabled";
-	/* PS8830 Retimer @0x8 */
-	/* Unknown device @0x9 */
+	status = "okay";
+
+	/* Right-side USB Type-C port */
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x08>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK3>;
+		clock-names = "xo";
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
 };
 
 &i2c5 {
@@ -505,9 +668,61 @@ &i2c5 {
 
 &i2c7 {
 	clock-frequency = <400000>;
-	status = "disabled";
-	/* PS8830 Retimer @0x8 */
-	/* Unknown device @0x9 */
+	status = "okay";
+
+	/* Left-side USB Type-C port */
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x8>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK4>;
+		clock-names = "xo";
+
+		vdd-supply = <&vreg_rtmr1_1p15>;
+		vdd33-supply = <&vreg_rtmr1_3p3>;
+		vdd33-cap-supply = <&vreg_rtmr1_3p3>;
+		vddar-supply = <&vreg_rtmr1_1p15>;
+		vddat-supply = <&vreg_rtmr1_1p15>;
+		vddio-supply = <&vreg_rtmr1_1p8>;
+
+		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&rtmr1_default>;
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
+				retimer_ss1_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss1_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss1_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss1_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
+				};
+			};
+
+		};
+	};
 };
 
 &i2c8 {
@@ -634,6 +849,36 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pm8550_gpios {
+	rtmr0_default: rtmr0-reset-n-active-state {
+		pins = "gpio10";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
+
+	rtmr0_3p3_reg_en: rtmr0-3p3-reg-en-state {
+		pins = "gpio11";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
+};
+
+&pmc8380_5_gpios {
+	rtmr0_1p15_reg_en: rtmr0-1p15-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
+};
+
+&pm8550ve_9_gpios {
+	rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };
@@ -762,6 +1007,34 @@ wake-n-pins {
 		};
 	};
 
+	rtmr1_1p15_reg_en: rtmr1-1p15-reg-en-state {
+		pins = "gpio188";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rtmr1_1p8_reg_en: rtmr1-1p8-reg-en-state {
+		pins = "gpio175";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rtmr1_3p3_reg_en: rtmr1-3p3-reg-en-state {
+		pins = "gpio186";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	rtmr1_default: rtmr1-reset-n-active-state {
+		pins = "gpio176";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	tpad_default: tpad-default-state {
 		disable-pins {
 			pins = "gpio38";
@@ -839,7 +1112,7 @@ &usb_1_ss0_dwc3_hs {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
 &usb_1_ss1_hsphy {
@@ -871,5 +1144,5 @@ &usb_1_ss1_dwc3_hs {
 };
 
 &usb_1_ss1_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss1_ss_in>;
+	remote-endpoint = <&retimer_ss1_ss_in>;
 };
-- 
2.45.2


