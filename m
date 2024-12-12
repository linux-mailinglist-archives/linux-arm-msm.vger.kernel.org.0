Return-Path: <linux-arm-msm+bounces-41747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3AA9EE76D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 14:09:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07350282759
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 13:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D548214A87;
	Thu, 12 Dec 2024 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GsQjTLrg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4A2213E99
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734008930; cv=none; b=BVamN2WNEVElzst/iCuAUit9MVG+w1Vldwr0kC6ovFKQk8UH09nin5kYo27O9lL+aSyBx6qxHKsBU149oNYdzGDZJNZ/FTIeRf1fsgQ033HO9AkVbD3dHPSpowbLEzq5vFR9e++XlNCH9RdbfStz5hxkSxElemixc7DcDrh89Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734008930; c=relaxed/simple;
	bh=VtMKVUgiuFNrjD+MOUtkdFqKPINjhq3zvD6DSKRrTCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CKNKJuyoI3YzI1KmpopC2/c+DWOKwqq3aZ4RQDr4yLGExPFSSB7hhYimgBj7C1jTt7YujGJNYJq7zVzIClJIDVlKciMHgIRvbjv0nJMaAXyX3P0kL8/xUlNCXNCNcl+2a5PTu1zTXGupK4vjQHaTMNc1qpaYZWatwIRhaOvbHEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GsQjTLrg; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa68b513abcso100675266b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 05:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734008926; x=1734613726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+CFAWmD+WHNtDn2sWiPUE7SCXR+4z8SWkq0gx9HvZo=;
        b=GsQjTLrgU+pXR8S076PEqRG1O/s9YRMYxrkj4sX0v1AHUE8v9GnuJgRhcBVTYuGnzV
         Qd1u/pqY9W+FKyVI7smCOS2Q1vfi/YBmuBPwgOGizBHu24wAFZFM78xx2zAAn55oewPM
         4KHwegCb5p8nbfeQY0fHvKxT14zMoh7YTMI8tgIX6mdeRUkWRqB07vwHrQsIoghMBhGs
         V8T9IajlnnqokC0cAXO58HW6nGoWLhq6WUvIPv2DdV5aum8m/euPe976Qsgui/iwh2nx
         jleCgqc0JOgP0+73f2YmZ46we6NLpb8QREaP5Xhjtk+yhbKew5JfcIln6PlBYWSXNruI
         2HlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734008926; x=1734613726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+CFAWmD+WHNtDn2sWiPUE7SCXR+4z8SWkq0gx9HvZo=;
        b=FNXX814fnTYzODecsf2OoXGioDGTKDMMde7z4t+m9wk+TWgmI/5EQRLV/WwiGPFkZR
         j8R0bhCez7arq0sWXL8iIngxz8HyqXjr6WwRdop4AslQxMmqAzJp3qgC5ok534K4s9Wp
         ahY6n1JLhGZY9ADEOqT4M++6EgHZrbLnSyezehRPBD6McKiZXWmEoDS/K3dT1kpO3SOR
         j+Sevdtr2gHY1St9jPULyTwpH8wq3WWHRC6F1FgH5K0+GzLxfmkexWdOasJXpQuGDdBI
         DMpvCgmphvcB5Ki4yDmP/1AVbuVuuktM0zPUaNETInMpzDwXQXCeh4dkhKuDs0qT0bu1
         5x9g==
X-Forwarded-Encrypted: i=1; AJvYcCUjABEtEl7wdRAeftUWqqW9Y1Rq+Yfb00+P3iX0v1ronWXH3QV9+hSpWUKdJbWWFdFH1zfy81+x2qk+MKRt@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd8mLdr0RRgmXsXC+tFV1pCG/gNNFqv7ZaF5WiMaUXYqqqFG+R
	9Fv8Xtdk3DFgf7HxnTftWq5Ck7vnVwy9ZfYR0fk5XX8W9c9M9zvLc/5M+IphH8Q=
X-Gm-Gg: ASbGncv7WBRkFIvIevdI6dSBmc3shwWZqHnqiWracq56twMUJCmjaPC6Co1uRiRnErn
	U4i7XhmAO6lKwDfZ+iUhOnlCc8QenHaFhNAcUh9FacSkx4oWx7shg7Qk6JVu/VXQy5hYBlTAsb8
	C6TrqkqZqb+lGYSr/XcBdD93rzju0y9So53QEtpjne4iW1ONZg1fHuIShPp60gQ4ZbHO2s2JwI0
	rwRsGCPBYwPaz3f3UshzayO9FhMb8J1KXSRIIF97y7qisF3I4xvvttxF65+COd1Jc9h2Q==
X-Google-Smtp-Source: AGHT+IE3enyxAZVTqzPEUAe7qjEY3Y3tdXWOW27/BAvY2zKNMjeRl3maRC1dSdmgDBrCWszACK6JCg==
X-Received: by 2002:a17:906:1da1:b0:aa5:2a57:1779 with SMTP id a640c23a62f3a-aa6c1d33ccbmr351498166b.59.1734008926316;
        Thu, 12 Dec 2024 05:08:46 -0800 (PST)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef40:3c0e:7a2d:e7e3:9cf8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6845ab4absm605843366b.73.2024.12.12.05.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 05:08:45 -0800 (PST)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Thu, 12 Dec 2024 14:08:24 +0100
Subject: [PATCH 2/3] arm64: dts: qcom: x1e80100-qcp: Add FSUSB42 USB
 switches
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-x1e80100-qcp-dp-v1-2-37cb362a0dfe@linaro.org>
References: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
In-Reply-To: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2

Unlike most X1E boards, the QCP does not have Parade PS8830 retimers on the
three USB-C ports. Instead, there are FSUSB42 USB switches for each port
that handle orientation switching for the SBU lines. The overall setup is
similar to the gpio-sbu-mux defined for sc8280xp-crd and the ThinkPad X13s.

Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 154 ++++++++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 5ef030c60abe2998d093ee60a6754a90cd5aaf72..cc0561debdb0b5c89f5d7f298d34f1feaf183b61 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -84,6 +84,14 @@ pmic_glink_ss0_ss_in: endpoint {
 						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss0_sbu: endpoint {
+						remote-endpoint = <&usb_1_ss0_sbu_mux>;
+					};
+				};
 			};
 		};
 
@@ -112,6 +120,14 @@ pmic_glink_ss1_ss_in: endpoint {
 						remote-endpoint = <&usb_1_ss1_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss1_sbu: endpoint {
+						remote-endpoint = <&usb_1_ss1_sbu_mux>;
+					};
+				};
 			};
 		};
 
@@ -140,6 +156,14 @@ pmic_glink_ss2_ss_in: endpoint {
 						remote-endpoint = <&usb_1_ss2_qmpphy_out>;
 					};
 				};
+
+				port@2 {
+					reg = <2>;
+
+					pmic_glink_ss2_sbu: endpoint {
+						remote-endpoint = <&usb_1_ss2_sbu_mux>;
+					};
+				};
 			};
 		};
 	};
@@ -256,6 +280,63 @@ vreg_nvme: regulator-nvme {
 
 		regulator-boot-on;
 	};
+
+	usb-1-ss0-sbu-mux {
+		compatible = "onnn,fsusb42", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_1_ss0_sbu_default>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			usb_1_ss0_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_ss0_sbu>;
+			};
+		};
+	};
+
+	usb-1-ss1-sbu-mux {
+		compatible = "onnn,fsusb42", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 179 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_1_ss1_sbu_default>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			usb_1_ss1_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_ss1_sbu>;
+			};
+		};
+	};
+
+	usb-1-ss2-sbu-mux {
+		compatible = "onnn,fsusb42", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 171 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 170 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_1_ss2_sbu_default>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			usb_1_ss2_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_ss2_sbu>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -872,6 +953,79 @@ wake-n-pins {
 		};
 	};
 
+	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
+		mode-pins {
+			pins = "gpio166";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+			output-high;
+		};
+
+		oe-n-pins {
+			pins = "gpio168";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		sel-pins {
+			pins = "gpio167";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+	};
+
+	usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
+		mode-pins {
+			pins = "gpio177";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+			output-high;
+		};
+
+		oe-n-pins {
+			pins = "gpio179";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		sel-pins {
+			pins = "gpio178";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+
+	usb_1_ss2_sbu_default: usb-1-ss2-sbu-state {
+		mode-pins {
+			pins = "gpio169";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+			output-high;
+		};
+
+		oe-n-pins {
+			pins = "gpio171";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		sel-pins {
+			pins = "gpio170";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio191";
 		function = "gpio";

-- 
2.47.0


