Return-Path: <linux-arm-msm+bounces-37664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E90879C5E33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 18:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A90A72826C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 17:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D9921746E;
	Tue, 12 Nov 2024 17:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M+qqPc1p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AF52170B3
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731430904; cv=none; b=n47pmV4QTtPbvc1M8JAfj8IFTot3esWYHxmZRYLtKkUISGWy9QKovuhvkKfG30N5CCrI9Z37tMrNN8HUkVGFzPmvkrqveu3mlw0mH2hpX0LGsN6oqOyFOVTYkqhb2Jum/mhHqMzD7qfXn6q5THZA6wEshq61GdnaZUqa2FqHZzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731430904; c=relaxed/simple;
	bh=MwjgNt5+aNaUfiS/EBGOdLZk2NGLvyeyxK92/FM+oqk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZbJ//aAbPve4Zu2ZkZWx3bA51IGEWTZA2q+C/jnmO1u301ulHzulkQkh4UHoBVF9RRB92U6rJUIwoWpq5aNraHQ1drqU7wl2TzeKe6r88dd1mAlv4n5Yzb5mtbMTk+mlSHDKdz4F4Y5Eu39/8tVDKaN8g2l0+rXe6rXzY5fkdoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M+qqPc1p; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso49547575e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Nov 2024 09:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731430900; x=1732035700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0aFxB5VVBnt9lFUBymJpaNnBNFkTqzxGkCrJ08x5+aM=;
        b=M+qqPc1p7U0kxxWulPNyyCs62+jdseltQTW57H6yIB7yqLyMneTuYM6DxEJnUFY41G
         j2fNx9Gd15JMdkBLcKrANER23OCHmFaG5KkaM9plp0TA/PMFXPJYD1VtS/ChmwbRUnFA
         QBe9C+yvw62H8n7eV92qb3eEr1SMKXFy+cQciJ3ytACNIORIa+57DmskIdPynOKVmC+u
         o/BG0oDQX10KjruZxU3O8fGthzZfQP2Qcz5vWBg5YX3BLCI+l3nLaby3wz4D8bzxSmvP
         GKFqXC2+c5fCDZXW67SJtNC8SZM1APnOJ1bem9orzsw+rlyUzW5AQxth3/OoxgRUngdB
         3qcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731430900; x=1732035700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0aFxB5VVBnt9lFUBymJpaNnBNFkTqzxGkCrJ08x5+aM=;
        b=AwY+cqhGFo0xDX6IqHFF+fzP8F57v3nGAHz0mXfsSItX9QAeOmzMFy54KZnH6qADR6
         Cf16mSNKPwbhqyaiqkwtn0dF5LnnIIm+nEq+u2heVaONg8ZKY7wT2FB2r9afmXsOU6X5
         h6SXK1ZRPfkSD4zUN4oGHoGD1c0CACfoz9jxsyv0WTKaZx7Vc4OxUvn28LgJQkdsD6hP
         5JWOduydItqSvX6vYzoOiP1qRjHikc9AHF0qkvLsFeT/kS29YLOsZ5Z7ozMlcgXH4jbW
         bGfe4kz1yAEluXAweKxOFf2qgGilG2eiebQYpBQWN9EnZuLu0sTg1UhDTwjMzSK2vPpz
         sA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWso6V+EPG1JVpSpl3qzJ8K9pew8/7mALqYFqxbK74S5DbrqICfitEkAsr0gPSD4FFi364BIDjDacznZPC4@vger.kernel.org
X-Gm-Message-State: AOJu0YyO9U1RFS2Y6EdPlEEmwEOQtf9AEtpd2dMCQgKa2wSBMGGoZ7RX
	1URsB+kMaS5rfWdufAA5i4RSY4NNypuJuwUS5pOZQFzZFsDICywOdhqZJUhNrdo=
X-Google-Smtp-Source: AGHT+IGO8yaklfivFw9BPYReh3yqysx+2RTkDxKmX0QjSBFR/TqzJiSQYcVJjp1YJ8mZLZ25SfldPA==
X-Received: by 2002:a05:600c:3ca4:b0:431:680e:95d9 with SMTP id 5b1f17b1804b1-432b7517221mr147821425e9.22.1731430900116;
        Tue, 12 Nov 2024 09:01:40 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b053051fsm215018895e9.6.2024.11.12.09.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:01:39 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 12 Nov 2024 19:01:14 +0200
Subject: [PATCH v5 5/6] arm64: dts: qcom: x1e80100-t14s: Describe the
 Parade PS8830 retimers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-x1e80100-ps8830-v5-5-4ad83af4d162@linaro.org>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
In-Reply-To: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Johan Hovold <johan@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8765; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=MwjgNt5+aNaUfiS/EBGOdLZk2NGLvyeyxK92/FM+oqk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnM4nn/IwQ9YVL3iX8EOA5PThjIlfOEtqHqS3zU
 NXlwpcu59OJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZzOJ5wAKCRAbX0TJAJUV
 VpDHD/4gmybTRA2Ntx1+dCA0Dk48GzV//r0h50aUr8BZk4xtoQUzLcErRmlEoCm3zwkGlMB4ReF
 4/xoCbncvorSqzqAaxOfXw4KzSxykBIt45CUqRh12buFVnbZRKnvDJ583MoH0rPZP/NUPJ34UdX
 vmYz4EA3kyxYn2qzORZxb3YETqadvkZwsEQHfINW0vTgDEW6coQhxdYpL5pQzrq5x0oGmkP+9PF
 Khhl5CUSKdDvBV1yP3u0oxW/zZvesGN2p8gO1kGi3gk2Ycdvm3tvkcfokpF7KfR0lFiNTDkdKso
 IMQGUPgp0eARupPOMU3+HgQMK06uuKqR5nxT8qOywLmv2zckTLUQBVK/DNtxA9066SdaEHCSYcq
 +4DdwVLJnlN5JdyOz5JJk6Qh16zrYiq9TppI/2SeBhJFJ2wjEcToeOcfQ4uCSswKd+VeKE7Aqse
 33MqF3wUitkRuSZWYTkkfD0YsA71CqyAhZqtEdBQv5i5cOp7d9JtKLL0xvbOPuUf87z+ez402kD
 7YPpqYMOxsHTqQ2M9U+CjE3EBp3BVjlyuwK52aJCabzMwDAJJAMeufl5gBF0bDLFWjU1KXYsg+K
 isxt0FNVVVIdR3hORzAmTmBaDlbD4zNNJVEfe7s4Baf5KaN79eZWcSM/pGk7IEpxcoS9DUWgSan
 Vl0BGj6qr494t1A==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Lenovo ThinkPad T14s Gen6 laptop comes with 3 Parade PS8830 retimers,
one for each Type-C port. These handle the orientation and altmode
switching and are controlled over I2C. In the connection chain, they sit
between the USB/DisplayPort combo PHY and the Type-C connector.

Describe the retimers and all gpio controlled voltage regulators used by
each retimer. Also, modify the pmic glink graph to include the retimers in
between the SuperSpeed/Sideband in endpoints and the QMP PHY out
endpoints.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 305 ++++++++++++++++++++-
 1 file changed, 301 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index 975550139e1024420ed335a2a46e4d54df7ee423..ea3ecc7c5bda24f3a0a7bb027b456462b11daf4d 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -66,7 +66,15 @@ port@1 {
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
@@ -95,7 +103,15 @@ port@1 {
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
@@ -143,6 +159,102 @@ vreg_nvme: regulator-nvme {
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
+		pinctrl-0 = <&usb0_pwr_1p15_reg_en>;
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
+		pinctrl-0 = <&usb0_1p8_reg_en>;
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
+		pinctrl-0 = <&usb0_3p3_reg_en>;
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
+		pinctrl-0 = <&usb1_pwr_1p15_reg_en>;
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
+		pinctrl-0 = <&usb1_pwr_1p8_reg_en>;
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
+		pinctrl-0 = <&usb1_pwr_3p3_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -495,6 +607,121 @@ keyboard@3a {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x08>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK3>;
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
+&i2c7 {
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
+};
+
 &i2c8 {
 	clock-frequency = <400000>;
 
@@ -599,6 +826,37 @@ &pcie6a_phy {
 	status = "okay";
 };
 
+&pm8550_gpios {
+	rtmr0_default: rtmr0-reset-n-active-state {
+		pins = "gpio10";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+
+	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
+		pins = "gpio11";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+};
+
+&pm8550ve_9_gpios {
+	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+};
+
 &pmc8380_3_gpios {
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio4";
@@ -609,6 +867,17 @@ edp_bl_en: edp-bl-en-state {
 	};
 };
 
+&pmc8380_5_gpios {
+	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+		bias-disable;
+		input-disable;
+		output-enable;
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };
@@ -744,6 +1013,34 @@ wake-n-pins {
 		};
 	};
 
+	rtmr1_default: rtmr1-reset-n-active-state {
+		pins = "gpio176";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
+		pins = "gpio188";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	usb1_pwr_1p8_reg_en: usb1-pwr-1p8-reg-en-state {
+		pins = "gpio175";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	usb1_pwr_3p3_reg_en: usb1-pwr-3p3-reg-en-state {
+		pins = "gpio186";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio191";
 		function = "gpio";
@@ -778,7 +1075,7 @@ &usb_1_ss0_dwc3_hs {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
 &usb_1_ss1_hsphy {
@@ -806,5 +1103,5 @@ &usb_1_ss1_dwc3_hs {
 };
 
 &usb_1_ss1_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss1_ss_in>;
+	remote-endpoint = <&retimer_ss1_ss_in>;
 };

-- 
2.34.1


