Return-Path: <linux-arm-msm+bounces-48068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CC6A36549
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 19:08:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EF1D16C394
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 18:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B313269881;
	Fri, 14 Feb 2025 18:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDn6+Ip4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF322268C79;
	Fri, 14 Feb 2025 18:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739556460; cv=none; b=WC9B5xLbxTLKlnY1MVaAlBAPsuYzB5u8grs9XIydlemm9pl+wMNct5aeTdJP+tmHj2Nov3VwA1p2uJFD+7fA46nrAcGq4ARqmMmSM3+RoTkeBXiSlEaFeq+5Ac1hbZ8QviSdsruBHktC7fKNsaVX18rWQUpm21+ZkbI8tVVRBqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739556460; c=relaxed/simple;
	bh=3x4K+SD5PYi2ViO8I6/HZjgmfGn/z75JBWV4fnL2QJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Butj1J0/1egyzt30HIZQYtMWEc+cFmQZ15GV4XrvAQWD+7XDPOzKK15ca7/Lwl+lmB0kfE6tHf80WFJ76+c9eAekPGOALriKY2W7a0NRk32MrjyNEZdgQOZItLBLV5eak5oTeysGkjfcNWWeec7mEBcUnTnTKoXsiNlJ/anS/FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDn6+Ip4; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21f6d2642faso63536765ad.1;
        Fri, 14 Feb 2025 10:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739556458; x=1740161258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6V49PP2OXvDHhbvnLGV7YUEo0KCZSY47T2HrIiGDuHw=;
        b=cDn6+Ip4YB3aeAD3tNMJVzPtztlnynjcoMwyGD3ZXQkfwTQrImAEE4IQSfcxaCQQhy
         8pBxwD6zu0MiKtbjfgiRT2yqdpAZS85sltiXpmOwtjor+e6tOVLGwm8knHpAfbjZt1GY
         mxq8Dn47gpGcXktzBi+2XHCy427tsi+eoQc6PtKN5MbDKfN+5qDLaSUd+ZR71CbmE49W
         kd23bKKmkAXTLLUwcMuTGJ04+I6nhRQeWfkWM2CSRkQ+PqxKTgK1Fe3QRwnhQRxv/w9E
         LhR5Ge8ybC9DDyjbdFpr1D8GJgs5dXWMo6U7RkFllFU+dKQhebRhtjhg6YLHlmR7Bs9A
         OxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739556458; x=1740161258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V49PP2OXvDHhbvnLGV7YUEo0KCZSY47T2HrIiGDuHw=;
        b=LEinPdwId2mpLaXz96KSiwpDjqY6HT/vaoOixSI0nXQIQNnN3BmSF9kWrvIOPXe2Ht
         GzAZAZtneFdg+wtF/C4jFRUtT9sd34Hj0BSkvb0R3/D35WwgPR5EM5i0nrccleWHuUEj
         dqm4RBONd9Aiv7UjowLSO0gCjqM1GBocyNkQgaFsLQWIJ8V7pzYOqQSGtDC/gszLzEiU
         qjpWKpGWje3nsFyT8o8bOR9bY2Tq2P3xd5nCal8LBfig3b9+GYPSax546KBo1XbJ12Os
         tELc97n/LjkUtH+L6PAEIUZU8koEpuTs0R8pBoF6JN0iHSZWGhJroy4+xl5RIyZAN/lX
         Q2fg==
X-Forwarded-Encrypted: i=1; AJvYcCUYF1h5kNy36Xg7UL1lbnefACBCucW5Kk3vyR1ZsdBP/hBFHO0D+1rV2b+qurkgf/lexCwzwsx0YK6Wegpx@vger.kernel.org, AJvYcCUeBU4NhwSjBzkRccmkm6zF2yWDRZVi2HGp5GN7Ixy8TriS8Yhd+5zVZHR3LsdeENSYLZKHx3pcUUUY5lXz@vger.kernel.org, AJvYcCVmvzu9q0eolVTFhBCmVtsmy0CYGsW3udGMEhSdrUV1Zaslvpy2sJ0jGDDB6eOpdmjOOB3h+X3N2KRFU9hiz86ebtgMPw==@vger.kernel.org, AJvYcCXgnsdRkbnSNrfyb7wRH+Fv1XxfzLC5yA8dHxXpZpp+VHDlACATWxLdXXBcL7+vYIs67ouAsFNHcAa7L8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCSZtYZIrM+zNa/unMHa+i89TcxGD/lFzgED8pV0MbvbDo+5/0
	SBUArB0/+wukzZ+1harzHIKm+pnSVtgw5ikIT6zULMOUYvkVTCDS
X-Gm-Gg: ASbGnctMT2w3z90qrZbrRLWzyqyG25TmrJG9Sj1TI1bvrcd3eOQ+gmMacyQX0mxRoGu
	wUcjMbeg0qAsXZe2LJBOLH972QkYK3pBzlO/wz7KEvmtSz/tfohrlcrAN03ZtEyHwmUreXByh91
	aw/bkJfYoc5fMHzdMuvn+B5E/PhxeXZ7QEz+Z6S6V4TaBfq8+zMil9JCFKJsGo1CZJ7keV6JvhS
	GRsRLy49qUAuGcQ12hz/5TnVvrJPS0dR+1p87CCg/w/St0wSrYQBw5H1e2gHrUJ1iSr5XAZFi+i
	cagxMikUXuEbc4by
X-Google-Smtp-Source: AGHT+IFdqcOwrSbPxFE6udXiTud4ePffb512nZRYqbbNtQdie7/rchVUrYM0lC8PJwGVHc/43AGZhQ==
X-Received: by 2002:a17:902:e5c6:b0:21b:b3c9:38ff with SMTP id d9443c01a7336-221040bccafmr1893635ad.37.1739556457820;
        Fri, 14 Feb 2025 10:07:37 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d051sm31599105ad.108.2025.02.14.10.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 10:07:37 -0800 (PST)
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
Subject: [PATCH v7 3/3] arm64: dts: qcom: gaokun3: Add Embedded Controller node
Date: Sat, 15 Feb 2025 02:06:56 +0800
Message-ID: <20250214180656.28599-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250214180656.28599-1-mitltlatltl@gmail.com>
References: <20250214180656.28599-1-mitltlatltl@gmail.com>
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
2.48.1


