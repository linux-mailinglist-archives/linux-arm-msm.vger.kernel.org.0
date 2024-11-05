Return-Path: <linux-arm-msm+bounces-37053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A33789BCBFC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 12:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 643A3282709
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 11:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9841F1D5172;
	Tue,  5 Nov 2024 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DY6xL29P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6C01D47C7
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Nov 2024 11:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730806678; cv=none; b=Uvxer0sxl+u/6HsqHj8PTCX+SYxo/fIQTQplcqAmIneJv0ItJKFbYLABueO6NJCsS46N2VEO8MO2tcipRQpHgbh9ErxpZXds6SNSKdjS0foc13pDoav7jgeuycYM9UHrBLQVquby5k3aOy3VUOPO0nAszQ2YDwarvrhidsLuqfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730806678; c=relaxed/simple;
	bh=snuUtiSL/ybuiG1jJeB441EEojxXeaRAIydWFUMluW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cCxcgd2auC0JXY/bYjbMDznDaHpyZl79ivT1cic4GR9Iup0vwx73JYL/WSo5xvr/fj3czR0FqaJpSv2Ui8KKvEVf3dhoxhpbFPBuKyLwTaipLuCogsy5DFbtbZAseepi9pR0Gzyd3n5dOM8BGaAtcea7Tt/gb2jVW6ZlOf1bmx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DY6xL29P; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f0f9ee49so6063261e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2024 03:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730806675; x=1731411475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUR4G4+KmGfw2qjWg659n+t+XFqWG6GKx9RaaMjNBVk=;
        b=DY6xL29PTJn+8wBvqtu3oO8O9JxBJe5ghJQlwjZcqnXI3djLmcmn3r/i+1MM1tIUbk
         sU/DvRboTD4AGmfYfxvXVF3773sI227UpUAlvZWUucYnajap5bBrHXc72PX+/XOmp7lx
         EqAdcg0sOUlsWc6e9i/bqBts3BjHnIr/rM1I0YEtZ0ow/2iJ5J5n8e1CeIsLzQUQctGc
         SOJLxO0CHbx3ThAfKiP0T9esytYnMiRNT3T8rMmtbIa/4Ng591LAAv8+Y0zKIHl7Hh2L
         d0iOrL8q4jNojjp6BBDETdh3zBUsRrKDUJNpVn+95NNNdqruAuA+BT4B2CG+Pjf66Zbo
         pJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730806675; x=1731411475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUR4G4+KmGfw2qjWg659n+t+XFqWG6GKx9RaaMjNBVk=;
        b=l5CVZqH0KQ1kuVx4utIjGgutavM59vvdXUM+GWkcsHpOwdYIMGkbzD+mdkjWskdayM
         eGzGTtjjKCx3v7LBj9IC3z6716xfWSVgMKDsHW6uDhTkzGotB4UoXo3VWKLsVGbqYXmP
         h0Cl/K8RJfJDx9kxbp4BGLAVTdLHGOIx84tbMMhyrHhHsaj0jOxJXUaiGzq3ofdHLhHC
         vd6bZZW+CiQMdr8aFN/jLweup2gt6vqobGoN7jNYLb8ap7xfVmnh3bh/JNpJwuRRGICR
         qVHCZSmfwbOPx164GVRpQLTAvhZdDgqWneC10+33n6K+gWEStkWRT5N4TUGvnxJTzgwm
         VaFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJUCYQX5yCMn6T5WcHsdeH17BDtaB5nwzIggAoSXlq0A+F9Kn8iQCC/6vSY9DULnS9zsr7MVFC5muUCBXq@vger.kernel.org
X-Gm-Message-State: AOJu0YwE/mW5lfUOjvJSEK3uqVAv2s6EbadOe3NvZ9n3k9/+CA+1CLeC
	IHegB7hVQC5DLZGj9Rsh7yzbOyNYtsVWD5x2U2f+SqQrFgBo/sQDjwxrpi5OjFBlOOlyqvA0/Oh
	n
X-Google-Smtp-Source: AGHT+IF2HLn5OuDk/TB8JnDc6PcOsIzoUFHc7eqF2+sIPbthR4zPdoM6HtwREP6/JqDnchoUOQjMrQ==
X-Received: by 2002:a05:6512:1105:b0:539:e776:71f2 with SMTP id 2adb3069b0e04-53b34a33f15mr18418462e87.52.1730806674538;
        Tue, 05 Nov 2024 03:37:54 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf429sm181816845e9.12.2024.11.05.03.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 03:37:54 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 05 Nov 2024 13:37:33 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: x1e78100-qcp: Enable Type-A USB
 ports labeled 3 and 4/6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241105-x1e80100-qcp-t14-enable-usb-type-a-ports-v1-2-b4386def91d8@linaro.org>
References: <20241105-x1e80100-qcp-t14-enable-usb-type-a-ports-v1-0-b4386def91d8@linaro.org>
In-Reply-To: <20241105-x1e80100-qcp-t14-enable-usb-type-a-ports-v1-0-b4386def91d8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2920; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=snuUtiSL/ybuiG1jJeB441EEojxXeaRAIydWFUMluW0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnKgON/c3tJ21JZAcD05ny6D5svRT1ag7gP1jYo
 eDbroaNCASJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZyoDjQAKCRAbX0TJAJUV
 Vgl5EACQmgNQNAVeAr8lf7jB2+lTK2V/okejH7egi+6z5DqD6FcQ8BHCfG5yNCuXi1muVYFNprr
 SGqgU4wzTRnPpq2/CLjeKhy18+c2BsB3z7Xurcoq/at9LorHpXa9+ncDUgYasXgwyXMXEbEahRt
 U9yfxxRxF668as4EZos13CuTgNkP5IGB4Wb8lKPKylohC0S+KShvfoJ20kNRniV/pCjnVIbhLB/
 H4zHuoMXh/mxhh/j5q6eBoAEBnVt9wa1Y6GhhkJhgnpbA4mCNZJCr9kihCYCYnI/jpFmIM8JQ2o
 CdK3kVOK34HTOOzzURd3ZmlkXot58CkXFR8Gk5gvEUDSvNP5FyCvCTEdjmWNfe2lIbsboy/Oebh
 nQSvnsao+LkGPAHd5no7UZGk7pVVGVeA0tKRYXNsASCfOlxFvfkfxf6ZfNyfhk9lI8kYoVPiquL
 j9QRFuhr7AO+Sj0fimVvkHx7kYAn9Zkr6tVu2L47skA8Ag6TyvaGj4UPnKckgflkSP+falKfipE
 By0PNknB9QiVHjAmfd0sZw5PLhBp/Wo+CxyjFaf90SSHsiUswq4sXFRe5I+tys8SCaGWhSS9WNH
 W1bZPHvyAiosJdQUzhnSS5hm+JsR5QJMmq+mcPlmlmyufAg5QbzvfEdcuzsR6uaqmPr+gBfsBzK
 EVxLa8arCijgoLg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X Elite QCP board has 3 USB-A ports. The ones labed as USB3 and
USB4/6 are both connected to the multiport controller, each one via a
separate NXP PTN3222 eUSB2-to-USB2 redriver to the eUSB2 PHY for
High-Speed support, with a dedicated QMP PHY for SuperSpeed support.

Describe these two redrivers and enable each pair of PHYs along with the
USB controller, all in order to enable support for these 2 USB-A ports.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 86 +++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 5ef030c60abe2998d093ee60a6754a90cd5aaf72..f52ead28eb7d16847f5049185ea5ff0d8edb10e7 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -616,6 +616,40 @@ zap-shader {
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
 &lpass_tlmm {
 	spkr_01_sd_n_active: spkr-01-sd-n-active-state {
 		pins = "gpio12";
@@ -819,6 +853,22 @@ edp_reg_en: edp-reg-en-state {
 		bias-disable;
 	};
 
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
 	nvme_reg_en: nvme-reg-en-state {
 		pins = "gpio18";
 		function = "gpio";
@@ -981,3 +1031,39 @@ &usb_1_ss2_dwc3_hs {
 &usb_1_ss2_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss2_ss_in>;
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
+&usb_mp_qmpphy0 {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3c_0p8>;
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
+&usb_mp_qmpphy1 {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3c_0p8>;
+
+	status = "okay";
+};

-- 
2.34.1


