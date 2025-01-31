Return-Path: <linux-arm-msm+bounces-46593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 845ABA23B48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 10:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFAF1188A152
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jan 2025 09:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CC61AE850;
	Fri, 31 Jan 2025 09:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTErgEUN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52DD1991CD;
	Fri, 31 Jan 2025 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738315339; cv=none; b=u5sucQTiaATxdWl1c3VXHW7JE8yXLSxdHxC2Is3WGjL1RdQhfmNGrdbUecnxzrNe8KQRw6ol1Xq5DCF1yFP/xscRKuSV55+RYw5xGzJsKLP3/GT+13gQF0FpGvPFGFM/vQVvIzapgdp732hq3X8zJ1OFtVFLvIsD815oOmryKWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738315339; c=relaxed/simple;
	bh=MTePTFZO0fJY5+8Rwq04Zyp4iZ/qTd/L+xe/WvK/kzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WVy9A0Wazwk/Cd2jT8ub9XzUUZi4xnaugy02Gl4m+FNS0NfGsG77taF6Wr0KCbOwr3KpLST7pCG1gegxOoil3uhTaK4F8mhWi6OrLeQaSKlCQnHxmr3kzxseM6JU+C4DI5bOvlP1sFZGiI0mbOeHolfVw60YiNVJlBnBejP/Mfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTErgEUN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2156e078563so25000055ad.2;
        Fri, 31 Jan 2025 01:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738315337; x=1738920137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6kosElOaSMZSNtX69a/Hsyj1tzL+5G6ZJzdXAObE/E=;
        b=RTErgEUNinzmXF71IRalxjSZr4mjorhGH4d9VNmtYaU/4niXC+X0/+kFO9geuQQQcR
         tJrP65LT40seJSzrtQhgshf5R0XB0IP6XCqnCCdww1nwrnBeMdUhwEu09GzdhO2Voqrv
         IbUj4EXQfw13RpBsaniTWNKIl5n45xSvjHUTc854zGXEJYyvU03BBtlHLyFKn+JCe0Sh
         rHzQd25tdvdRi+o+uZlX8kb8660TNFcTpRhS2OCkQE7RHpVhAF9ocDkbu7M+MxiXp3G+
         s3vtOZIbEiax+ZjuUD8Xlx8257nj9FLrLSahSz1CWwLLX9ZYM7OQQoK4QuZzwydCiNeq
         VhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738315337; x=1738920137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6kosElOaSMZSNtX69a/Hsyj1tzL+5G6ZJzdXAObE/E=;
        b=w1o4EqQc3A0vUQBScZj5w/W4a9DJME0ZmVEL9LtwCMxtzmfaTf+GNPFYBg69gF+LMx
         DoZ/HTJa32saVtEieg1rlJBafGyy0f3SF7qQEeDZRJhdH85pFSDtafL/jESRhxBRW8Ss
         ZWxeIKe9ycBAViPmR9mPItt3IF57gkYDyXlBzRGjjG1vSzDbMICy6PKx87ViU0G95UwG
         9pzME5USHAf7kRha30no2H2RUrYOGxgGX0koaBgBsyw92Q7jf3JwwyvKPpjgxw8MRqES
         M8zOZxjWSgdo7nWMyrf3t0TeE8C4Pb1ZDIW6ngJDw4cGIKHYD7LPCDudPHX5olawUh1n
         ZxpA==
X-Forwarded-Encrypted: i=1; AJvYcCV06P4RXEqF5UIT1z4i5akH9YIM5lD45gCmc7Cm5eWw0B85kGvJQjMNNL6JEpzNMtYc2kdyLa5Uq65o/8wE@vger.kernel.org, AJvYcCWc0aW1si1xMNtpIEBOXtpWsyE2Gb9OUbeZB4lAKbbc05taKP5/GvfUVKdugkisUxR0DEdUUR/tPtolkSg=@vger.kernel.org, AJvYcCX+IIuBNDQShVGbxBawoPA+zX7dXum1PvwSFqgcwap8EXI7GLB3UoWfb178MZ7dvOZzmha1AuEONWTIrSXJWwRJydd2cg==@vger.kernel.org, AJvYcCXzQI2R0+0ti+USgwa/rGSMnckfXfOUOHrWZ8i9pfyYU3ODqiDbXQElP36n4o3vAFeOhTNdOKu9NOMxS88V@vger.kernel.org
X-Gm-Message-State: AOJu0YzkdafyDgSg4H9JGxDEPknukgFp4+kwExbaYVn+eJLjdnu/M6Y5
	GxhKy8SaPuYoIq2zJrTLCCPgMlE8N1BpRQN9wlL085hx1v0KbsPj
X-Gm-Gg: ASbGnctSs2fqTapGrUARgbOzICHd9UvjH7DzdGqtNHCV6SH7T79Miu7hdUmpf1k1ae2
	nJ6CHunjTBDA8UBYgeezTrngx47ruwtgihxR8QmLdvYa4dLSVwO2Klu1iCgwGpDMD0zkg38oDgS
	w/Sr6Yx6Jfq4ZW3h55dG+5kwCK4T44pj4BGYT6AoVMyqz5YUDQfEHPajnZQY5caOGqgA0RXP/LX
	vad+e9HOigY2O9dJ9AgtJqYQEAUGO/0BVyhlf+8ujMSRO2o0RQcn3QE0Hc97vz8DwfpULV4BTgH
	pU0fszIFLlqeygEV
X-Google-Smtp-Source: AGHT+IFRiqNQj7MxLr4NO504ORq8PNY5pGBppS/wd9xq7E5Gec4ceQ4SYgJmZodMRIS6ANJgN1z9jQ==
X-Received: by 2002:a17:902:d488:b0:215:5bd8:9f92 with SMTP id d9443c01a7336-21dd7c46302mr169334755ad.5.1738315336989;
        Fri, 31 Jan 2025 01:22:16 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bf93ef3sm5366629a91.30.2025.01.31.01.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 01:22:16 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=83=C2=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RESEND v6 3/3] arm64: dts: qcom: gaokun3: Add Embedded Controller node
Date: Fri, 31 Jan 2025 17:21:39 +0800
Message-ID: <20250131092139.6065-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250131092139.6065-1-mitltlatltl@gmail.com>
References: <20250131092139.6065-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Embedded Controller in the Huawei Matebook E Go is accessible on &i2c15
and provides battery and adapter status, port orientation status, as well
as HPD event notifications for two USB Type-C port, etc.

Add the EC to the device tree and describe the relationship among
the type-c connectors, role switches, orientation switches and the QMP
combo PHY.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 09b95f89e..1667c7157 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -28,6 +28,7 @@ / {
 
 	aliases {
 		i2c4 = &i2c4;
+		i2c15 = &i2c15;
 		serial1 = &uart2;
 	};
 
@@ -216,6 +217,40 @@ map1 {
 		};
 	};
 
+	usb0-sbu-mux {
+		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
+
+		select-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb0_sbu_default>;
+		pinctrl-names = "default";
+
+		orientation-switch;
+
+		port {
+			usb0_sbu_mux: endpoint {
+				remote-endpoint = <&ucsi0_sbu>;
+			};
+		};
+	};
+
+	usb1-sbu-mux {
+		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
+
+		select-gpios = <&tlmm 47 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb1_sbu_default>;
+		pinctrl-names = "default";
+
+		orientation-switch;
+
+		port {
+			usb1_sbu_mux: endpoint {
+				remote-endpoint = <&ucsi1_sbu>;
+			};
+		};
+	};
+
 	wcn6855-pmu {
 		compatible = "qcom,wcn6855-pmu";
 
@@ -584,6 +619,97 @@ touchscreen@4f {
 
 };
 
+&i2c15 {
+	clock-frequency = <400000>;
+
+	pinctrl-0 = <&i2c15_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	embedded-controller@38 {
+		compatible = "huawei,gaokun3-ec";
+		reg = <0x38>;
+
+		interrupts-extended = <&tlmm 107 IRQ_TYPE_LEVEL_LOW>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
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
+					ucsi0_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi0_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ucsi0_sbu: endpoint {
+						remote-endpoint = <&usb0_sbu_mux>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
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
+					ucsi1_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi1_ss_in: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ucsi1_sbu: endpoint {
+						remote-endpoint = <&usb1_sbu_mux>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &mdss0 {
 	status = "okay";
 };
@@ -1004,6 +1130,10 @@ &usb_0_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_0_dwc3_hs {
+	remote-endpoint = <&ucsi0_hs_in>;
+};
+
 &usb_0_hsphy {
 	vdda-pll-supply = <&vreg_l9d>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1025,6 +1155,10 @@ &usb_0_qmpphy_dp_in {
 	remote-endpoint = <&mdss0_dp0_out>;
 };
 
+&usb_0_qmpphy_out {
+	remote-endpoint = <&ucsi0_ss_in>;
+};
+
 &usb_1 {
 	status = "okay";
 };
@@ -1033,6 +1167,10 @@ &usb_1_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi1_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l4b>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1054,6 +1192,10 @@ &usb_1_qmpphy_dp_in {
 	remote-endpoint = <&mdss0_dp1_out>;
 };
 
+&usb_1_qmpphy_out {
+	remote-endpoint = <&ucsi1_ss_in>;
+};
+
 &usb_2 {
 	status = "okay";
 };
@@ -1177,6 +1319,13 @@ i2c4_default: i2c4-default-state {
 		bias-disable;
 	};
 
+	i2c15_default: i2c15-default-state {
+		pins = "gpio36", "gpio37";
+		function = "qup15";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	mode_pin_active: mode-pin-state {
 		pins = "gpio26";
 		function = "gpio";
@@ -1301,6 +1450,20 @@ tx-pins {
 		};
 	};
 
+	usb0_sbu_default: usb0-sbu-state {
+		pins = "gpio164";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	usb1_sbu_default: usb1-sbu-state {
+		pins = "gpio47";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wcd_default: wcd-default-state {
 		reset-pins {
 			pins = "gpio106";
-- 
2.47.1


