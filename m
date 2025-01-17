Return-Path: <linux-arm-msm+bounces-45409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF94A15131
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 15:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85E4D188CDA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 14:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3366A1FF7D2;
	Fri, 17 Jan 2025 14:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQniv2y3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACD71FF1C3;
	Fri, 17 Jan 2025 14:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737122760; cv=none; b=Pth4RaBdTiHRgMiU6Jclf6KJ3HHxq3tG/qO4lyNujmSyO3GwTrviNVpsatbNIH65LvjctruLq8rHBP367z4lTU8pKw9ZzFeieQyYl5NXNblesxvzVljscqGXcjpu1/zT7z5N5iyxUund3ccdNUXZGFmMiADsiwJUN+fFlPto0N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737122760; c=relaxed/simple;
	bh=8FjgO75/c9jEZev52R+dHmynOFnK/JHLLOBKZ9TcRrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQennQBIobt/L9ql+HI2N7DB3AcIWN20T1bQUflPeBxZjUnyzqRBbDiUweU/vkvhiuuME7PjTKwNGCXw+mDo04Gl/lVMvC4Bu07dOksf15mXwgjTQrzjbkIei52RtjeDcxEJU4hGxjiaSERyJOQI3L9xc+rxw+eJVjPYF5v6gz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQniv2y3; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2167141dfa1so39337795ad.1;
        Fri, 17 Jan 2025 06:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737122758; x=1737727558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkneiOoL2vXr3mcByG9scZksV7uTRQnaFQoOiswSeYY=;
        b=gQniv2y324e/AsdffTtjb9Y1kXElKlAP01Be2voy68oNYFnyJK28UPfVMzAMEHpjkh
         QGO5PDODUIvSyRQJzVJQK4coCjrh3miGMiMktx9QNcWx9CTDB9VrqlJRUeXFKO7y551M
         ysXThpTA5XGo7q3zneuTvRptiXJlAiBLx611pvYvOVFpepxj+Hnk9d5NMqm2FDMqaK6k
         42muCwrXlCVU0U9Sdrz/d4n3i7r+UMgpSZqewIp1XLPd8sQ7SwohsodcVNXuxnxZBqNc
         Nodz6Qw7r5ir9FXl8y8Kk6xDW5xlZ6SNvqZ2lIbJ/31SWOt7n5Xcx+7wb+XtpGborgvM
         Ik6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737122758; x=1737727558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkneiOoL2vXr3mcByG9scZksV7uTRQnaFQoOiswSeYY=;
        b=dtOeYRJa6cHD0x+QGQM3+Jdew8RY1OOkoapPrQWXO88ck0zrDO80xAEpT0B6AEbefu
         B//6Wgezbk+YFKsgadS3dvVYLzI95ZANXoTE90qmisRvvEHu63YMgv/2QQCswB+FsldB
         On0MsAj0jGxOyvKvTTjM5XZfKV3R5Yr3l5poQ8niBKnisZJCzcKVihVug2ooczXSHPw/
         jDXtq19hUglqk33yA8v2coLJ7Kk7x8RbyFPgpamwuWHZmWahCvn+n0E/Ts3QeJucbFaq
         0U4Q6EdtRjE9/L0F99ZRsLybrdDp9e6eyQazZ4Sa867/JJkKbbS0SqI5AcT6I1Z5S7VN
         YHmw==
X-Forwarded-Encrypted: i=1; AJvYcCVGZgVZ8tJUTkZ/WCV+Ki77akKoJdRsitUmTLhLhonkUcHDV4T/fLVTYijwUfdlAQjVrzXi85jS12xbkwo6v1dQUxAhvA==@vger.kernel.org, AJvYcCWDTTkeAKw5CZ0dB8z3QZq7RV2Rexw2Omxpug+fG2cgrBlbP3lv3vv4+nKgiRHpNQOOFFrPKRpmAK6Y3YjE@vger.kernel.org, AJvYcCWhZdh9+1hge+gz0foc2/bCl8iJuzFg3pEl5sOhJuCaRVeFJSHUFc+N0sF1JSfUhRlek2CjUpwEvfXXChnZ@vger.kernel.org, AJvYcCXiKkNqVM7fkrKNz3XRl637s52wuJl32hu0NeKXlEa1PmXIw2UTPk1FaSSwHlCrYEsVosk8k2qTpnlEp/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywza0DZzQdTycHUFFki1jGBrQUY8yEcfR6pwhFdBW624wpJasfX
	F6ieJu9jMZs5RmAAgyfsQv0Otrsof8dOSqidyVGuLdVsmT46BN9o
X-Gm-Gg: ASbGnct19BdafSEccsFTV669/UxerW8XtlxAWmSoZshkBHk22Hzbbu0c6Dcqe9ePjeY
	GqMnMLujlP1u1OQycddd/xPjIE0e/yZ2PuJ8SarS/Ziv9Ta/2MkwYR3/15C/HjAVkssAyfZJSgX
	lPCxAI1QqfYH70yXNK1Vmy0MFY3k1Xhg1i9YreuI+WXKka/9BYRPgXXhVPxwJyhwXOO7y0JbyI1
	dap6sx0QWt022P4mYdDtv5X/7quZ3LZHJtTm+hY1B1hfno/8nii75s=
X-Google-Smtp-Source: AGHT+IEXcduRJhqAcVpPIMoqR91F6Rbg+r1FP4Vb5qno2pPOY8BO8tungG1a+XaoUUnxNaJx7bdP6A==
X-Received: by 2002:a17:903:94e:b0:215:58be:3349 with SMTP id d9443c01a7336-21c35db8133mr53735985ad.14.1737122757858;
        Fri, 17 Jan 2025 06:05:57 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3a8822sm16178375ad.140.2025.01.17.06.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 06:05:57 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 3/3] arm64: dts: qcom: gaokun3: Add Embedded Controller node
Date: Fri, 17 Jan 2025 22:03:48 +0800
Message-ID: <20250117140348.180681-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250117140348.180681-1-mitltlatltl@gmail.com>
References: <20250117140348.180681-1-mitltlatltl@gmail.com>
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
2.48.1


