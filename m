Return-Path: <linux-arm-msm+bounces-39800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5349DFCFC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DB75B21B0E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3347D1FA82C;
	Mon,  2 Dec 2024 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J7t0QLQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFC61FA17E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 09:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733131412; cv=none; b=e3PaNdNo+aZsq4OFypt7gSJst5pZBZnKby7v/rlVdmB/7aMUZC1Dfh8FPIfl8k6SYwKYk4PfsYANpL9C+6RqKrpIG8yVaGnukerQrFBq4xNBinetW5nKh1V/MbLm/UZKLzAxnXKAUgP7wKWYIkeRvf41bolDMWsk6MweOsdBAPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733131412; c=relaxed/simple;
	bh=C2kGaOmz/CaErDE0G6S0bTj71m7no0zx2F0gGDhbOTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XNiuqdbofdaO+8V/LMqvHU5OiDAhLvGj77to9JLFBjcZAPUmKnVHHpq6gEMMf6dJeQ1efDLx/gyk2rxBsDaqzf6UEzTcvDZr7nFsEj0mNsJDYBIV/AUf3F+73EWZjbUCPJc/zjMaH5E2YVk+Ka6fc/KwqYaXvoD/ns4Nh30UNwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J7t0QLQY; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-434a8640763so33429445e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 01:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733131408; x=1733736208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8OKMEosgqE9VkGMvuNYOyfsBk2QOMVt5DkJ/p7PQz4=;
        b=J7t0QLQY/jzjCPHkQsGVpj+EClMlBu1sZlQ2j5seJ1recAStvAqAh7wB67w6PLvRih
         6Ixa+92aO1wWwt1lnhVg8PunppQ/yGS0Jnl9/plBGaH4V//nRZeTTarf1uhyrKxanLC9
         5NLhPeDkHQlB/e7VwNkPAEOGGuT+NESU+g9ur+83bOBv96yBK39zVUinUQs8DffxqwP8
         NQur+slt5ww7PmLvQ1I67AtphJJs4a2W/JWp70cSdoDvTMwl8sXEIexGjz7N4kyRZcuF
         uB5WFcLNMhYs2NZfxJ0QKChjYsQbs7a1jIpPAh2/au3w6tCbg4QRkWry7FQfAkJjXbeu
         6OsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733131408; x=1733736208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y8OKMEosgqE9VkGMvuNYOyfsBk2QOMVt5DkJ/p7PQz4=;
        b=R3CA0BUB+ba9PiHPWEfh1aFonEBtReR4R+qCWaWvBv0YKNSqUyq65gBbqmmYTKgSS+
         GDb5dnjqit62PNbnyTuSiRmXM4hYAQqG9/JjAKSP9rD3nIEJrnKZDnJC2DjU5crtgR7y
         3YhatnFa/HZ909wFTk2Y8/fqf1REoWW0WxYTC3VOOdChyJx8mU4sBoGtw9uIQKsjumt7
         JswF7FfgilHJfrggFqjY7oPH+uva9BjXfKeAuadpXr9TcVEQSQrdiY458ebOOy1X9LPm
         0BZGLEt6CebftPGYgFsVLSdBTbRBvfbV42QjWDXt8TeWYYiyA2oybjXoNCnrZGxx+bQZ
         C+YQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5qMgCdf3SFmg1teazb4LnHj69qW2qM3ZaeQYLHy3oz7HyqrvwbsDzHEXI87u7TAaYrreAy3VSC34vbQWx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1CBs+QvmGXvpPQQ93fVRY2TQHTd1mLNpUxwZh+X7c01bOeIlz
	QfIiQoci3dPCZoKpEC7Uz+Q+cB/RbuNdKXNXykjWGw3hZ/uWJAHitkOeBuMgm2E=
X-Gm-Gg: ASbGnctQeABrQOPL7VP6kIK76/81zMoP/cIYxnYONMeE7jcyw49b/Lnyv5jrPC7UXHX
	6gfz7bb1poYi/esveaWTfPLWXUxneMlpaZD9fdtKGUsrfFUFxUnKTe4bnvTAGLNXfV1aXc9ukqv
	mN+OiSOgHdtqrhZ+yMKUh26N51kKFqvVA3BGehjFjB3pKzipDpI0/q1ttEstFtd+SLUgHRC1Jg6
	g4drwoBx5KP9gNDDpMZnuCSWmojlHRMkKq1OlkXQPHgveRpCw==
X-Google-Smtp-Source: AGHT+IG3iSNlENv+dLDr1FD/IC3ruGaEywPJ8EPxxmcmL2XYuR9s3xremZ+IdmO5MCb0I48rLkT+rA==
X-Received: by 2002:a05:600c:1988:b0:434:9f78:17d2 with SMTP id 5b1f17b1804b1-434a9df09bfmr182087265e9.29.1733131408486;
        Mon, 02 Dec 2024 01:23:28 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385d7264f27sm11014744f8f.80.2024.12.02.01.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:23:28 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 02 Dec 2024 11:23:17 +0200
Subject: [PATCH v2 1/2] arm64: dts: qcom: x1e78100-t14s: Enable support for
 both Type-A USB ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-x1e80100-qcp-t14-enable-usb-type-a-ports-v2-1-7360ed65c769@linaro.org>
References: <20241202-x1e80100-qcp-t14-enable-usb-type-a-ports-v2-0-7360ed65c769@linaro.org>
In-Reply-To: <20241202-x1e80100-qcp-t14-enable-usb-type-a-ports-v2-0-7360ed65c769@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3005; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=C2kGaOmz/CaErDE0G6S0bTj71m7no0zx2F0gGDhbOTY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnTXyL5lq5xYYc9kwuXfNl9MsNxR8wMu0JL/V70
 g5mB4HdgpyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ018iwAKCRAbX0TJAJUV
 VlfJD/wNayU5qu1i7Xus7LPdONeJSXK2eLFb3qaZ5hBgUu74dysMvgV2LBEyZ3vLSOsobh8EjJe
 TROkwgSGdeKwVoivLqhXfJP0tsUToDPHDRZu5xAidnYOOBwwPVnYMN9cr0NIxmyG7OII3DmEVTO
 J+SsWJhAY2nYwfBB+3BD7TNwSbYGsrlVGOaXpqv2nUWte8vJmCaQGm+AJoMj/uE1dJxEfGguR9C
 P82Bj/DEPzd3dHiBfZhU5VANWA070b0tWLhVc9iWJAUdNNIBtqaoEhWxnhIxQ1H5mQwfh62hKkc
 OC9XHzXkEm0LWAF/EPugLo1Hmyf75JCO8FOOunb/i+8I2iKMT8fG1+ZYy6Rv/8DYOWcY26oAyfn
 +fmWiWfU4HVfKNFNZA8BamG7/0pb9dhpagdCl/DivEtH03d51lZu6PR1jmZTNqkpa8M8+EGgu6z
 RsJmjpz24C7rix8MrBL4ob5NUhYhKg8vI/eAFi+80Fo7nIqnLT1A6LbcFdoDsCWmwS89ggTxAUE
 hfV4FnhdHxiRJVu1u7iNgbKXUHEBwwHaxf4zexX/hK/8yMHGKM/vC7Tdxzv/GwtEXmSUAklSJxG
 n3F0K777E9grpe5hcUjqIwh0WfjlZEcUirYHQzxaes6WKzjB/EDaW5804iTsEJHlKrMxR395d+0
 S5Z0/WwPVPk2ESQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Thinkpad T14s has 2 USB-A ports, both connected to the USB
multiport controller, each one via a separate NXP PTN3222 eUSB2-to-USB2
redriver to the eUSB2 PHY for High-Speed support, with a dedicated QMP
PHY for SuperSpeed support.

Describe each redriver and then enable each pair of PHYs and the
USB controller itself, in order to enable support for the 2 USB-A ports.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
index 975550139e1024420ed335a2a46e4d54df7ee423..f936e3246ec87972746a60080c3a48d646a356f2 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
@@ -495,6 +495,40 @@ keyboard@3a {
 	};
 };
 
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	eusb3_repeater: redriver@47 {
+		compatible = "nxp,ptn3222";
+		reg = <0x47>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b_3p0>;
+		vdd1v8-supply = <&vreg_l4b_1p8>;
+
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb3_reset_n>;
+		pinctrl-names = "default";
+	};
+
+	eusb6_repeater: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+
+		vdd3v3-supply = <&vreg_l13b_3p0>;
+		vdd1v8-supply = <&vreg_l4b_1p8>;
+
+		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&eusb6_reset_n>;
+		pinctrl-names = "default";
+	};
+};
+
 &i2c8 {
 	clock-frequency = <400000>;
 
@@ -651,6 +685,22 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
+	eusb3_reset_n: eusb3-reset-n-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	eusb6_reset_n: eusb6-reset-n-state {
+		pins = "gpio184";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	tpad_default: tpad-default-state {
 		pins = "gpio3";
 		function = "gpio";
@@ -808,3 +858,39 @@ &usb_1_ss1_dwc3_hs {
 &usb_1_ss1_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss1_ss_in>;
 };
+
+&usb_mp {
+	status = "okay";
+};
+
+&usb_mp_hsphy0 {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&eusb6_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp_hsphy1 {
+	vdd-supply = <&vreg_l2e_0p8>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&eusb3_repeater>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3c_0p8>;
+
+	status = "okay";
+};
+
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3c_0p8>;
+
+	status = "okay";
+};

-- 
2.34.1


