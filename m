Return-Path: <linux-arm-msm+bounces-45263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE631A138BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 12:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0AD83A7612
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 11:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1941DE89C;
	Thu, 16 Jan 2025 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebqWBjKY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F941DE3C4;
	Thu, 16 Jan 2025 11:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737026264; cv=none; b=JkHi3BRjottu/FmFlvD9tyCXG7CYAvNJLtrj2DZkVuDnqws+0RcdiDuzAPbeBE/GfC9LXXVg0qvocUJtIpiR/FmEm0s9dflAy5JcX3e4C8pWTAfqL6uAvy8SwyogJPGDASqroTFcI1mth7OD59AoReU8Hi3yLKaNGix411uppQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737026264; c=relaxed/simple;
	bh=A61bZ0VInRRJpIXwzLk0JUxwD+PbFsfCYexFjz1sB7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UwX/QfBpFiZgXe3YKbc5Nh3F7fG8p7oNJzp/IIVNz8FutQIKLLpH3SLEPd9uTpGYw6kNGghbZ1gFSlBr0XfrM7g/BBicDl+4DzAmsp6TbzTnEVmB3KF2JH6DFgYof+aAa31FCsmZ/TXXKfPjtXIsEjrCbuRBGjoIDaokVeRdO6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebqWBjKY; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ef748105deso1107231a91.1;
        Thu, 16 Jan 2025 03:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737026262; x=1737631062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDANrcnbbv0bCjDkuPViLh//nZpwAf5OK7qmV0BuFow=;
        b=ebqWBjKYPEnxtRuopGRCpSlN+SNsL7lydZUi7UBb2r6xy3/K7G5lRQiLFc7dlUado/
         nwDqIIAJ93pNLZG50UTAinbRDJL44Xwt9D+uC1lhh1Hbhu7Om6ITMzKHeqKKMVnP1w4j
         reaJT49UnEAjLjrUI7obDt/srPLTC2PvCO/C/9O1jKqCSbs8wOJdPNEyT+GmHVwCJMyo
         8PECGb48UcYp+TS9maFeh2Pi82DqmwnMLPAY5o5TxLNnxnRDUwLX9ZzOQTu/JRei5I4u
         HOk34ijNDwljPPDRpYxmFeSfWUwUlqlevcgSZF6E834iCtOPRmQxm/5FtBNYZP/TtGjO
         6V0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737026262; x=1737631062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oDANrcnbbv0bCjDkuPViLh//nZpwAf5OK7qmV0BuFow=;
        b=UPX8sPsG6cheX4ekrlpokks6Vn1n5rGJs2WoJWQm8twfhaELWVgL1QFcHgAjiLcrp3
         JOmN/5J7Tly9qMBZqblqQ5az313i0jbRGV+aH+rHsVb9OZscI4obvlvzCQEio9DVbJ2q
         qOP6rubvxQoNhWz+DpO99njIpSUoLArhd3Am7eY6jemr3XPy82rMTfC4K6iCIXmODVa7
         MS8j9HBY0HexLJ2IRgpuSFDBob+GKShEfzXn06sRpyPhPoimxTqL9zHYj4upCYBiq7tG
         Lld1E9LSb46OZpHlKsdCNb+kwP+88xpjtMgN/lcADY06dnjrYbx4jvqTdxBTkGKO1Ogg
         TyRA==
X-Forwarded-Encrypted: i=1; AJvYcCUWSFGrZ0kIebE61nM2cMbPIsmk46KgZCzT5HwWMAc+3sA4QGDOkf7VEsx1FIgbaN10RBzPuPQ+RPtLdDo=@vger.kernel.org, AJvYcCVAE2C4rUOTu5VBQPt2Fi2gmEt4gTDxQ+B5/fyWvN7G+JE0wPxIHDqbcGRkizMLm/j6NXGxUiyg1bfu8+v6@vger.kernel.org, AJvYcCW4pIj4LFUC2kmv2jGr+ddNYy2WvBSxVh7pkOmjWlunREg/pU7Ut9/Nlpo8MdTCAuKYTLAsQEFhZWD7CoEXRaYj6zwiWw==@vger.kernel.org, AJvYcCWJuqpcGk6K7hOn7fh0nLXSJnSRpLDfK/w8NKkz6SMbyhPbwjRhQ8L32RETAELM4rQHlzTlslcC807TzAPI@vger.kernel.org
X-Gm-Message-State: AOJu0YxpGM5g2Clu7QnvkI6Ij/rQ9Nw9EYql9b+Twh/oJGA3mkWltMOW
	zT5fdBqyLTuaouGneZXCw3dqc2zkY8hSPStH9kTqJB/4cCUToZf3
X-Gm-Gg: ASbGncsjLs7Md5Dn6O+cdmK8et+tuRpZjy1hztmhp46b3ubLVsgiYlZ+pWhLCYa4Egf
	6oPuz/PRlPFwzWELNWLxo6ApDoClKfedBTf7wA9hThmcgGtOlJDSN7GXbkOOuXkelSJKn2c1KGx
	sq49XAvM6oWBP/7IkUQXPhP5ePuDSBSN79qzJ38lbcqXYbKYTfOxzlm4ZXqW6XkcYurgfp1tVbl
	BHAFN1CUluBbZkY/b0wtQ1veIGtb3TrpEj47hxnfIc7dC/H4TOFoSY=
X-Google-Smtp-Source: AGHT+IHr2iwYkEaqJdyqmcVJdQzki6PsCbK9jn7IBj7hlC+lJn80j4Pz1G3UpfuKQihka3+kKySbSw==
X-Received: by 2002:a17:90b:520f:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-2f548f1d415mr46693311a91.30.1737026262419;
        Thu, 16 Jan 2025 03:17:42 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c156b9esm3091585a91.4.2025.01.16.03.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 03:17:41 -0800 (PST)
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
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: gaokun3: Add Embedded Controller node
Date: Thu, 16 Jan 2025 19:15:59 +0800
Message-ID: <20250116111559.83641-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250116111559.83641-1-mitltlatltl@gmail.com>
References: <20250116111559.83641-1-mitltlatltl@gmail.com>
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


