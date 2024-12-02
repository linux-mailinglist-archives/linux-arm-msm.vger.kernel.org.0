Return-Path: <linux-arm-msm+bounces-39801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D14D29DFD02
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:23:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46451B2228A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726FC1FAC3B;
	Mon,  2 Dec 2024 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CWmT5Yti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797841FA270
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 09:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733131413; cv=none; b=gPAwAoj+5mXBBS39HPRDq1r8TNDOOoZACUZxCNYahAoMbChiqypOuTR9gaKFGlqdI6R3zdrKgDyPYT8vycrH2u2YEpX0VJhU2FDst0+o+lNG5Iiusxw28fsqvKb42EtPSZ1P2+z9UUI1yZrXGIW52f8y6JlmjEfSPTb4+xdwJjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733131413; c=relaxed/simple;
	bh=tqg7gzkgA4MYt/pRkxLKHP2cWrGEuuks3ig+VrWudZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EnZRBHxlN9qrqsKibn6pMJPBNgUj7AnwJs01MbqpZizpBJvPo+HjiuNU72MZZpU4cuA+s/4acX5ALJfXXPfdQy4unvR9pq7xGYd2AbPUYl/o+XkGS2F5145RmtG0SWSnOMhqCRmovD2L35C8EdepepiXFkMUroKGHlwr+OHcc8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CWmT5Yti; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4349f160d62so33372675e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 01:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733131410; x=1733736210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XiMGM/nWXpyvgXGPxpGpfX8jLfqYzeixD1E53niaNPI=;
        b=CWmT5YtiRQtoBygULHK8mlqV6r428lLLRWWU8PEhjclOblwVn51TXZaYh4tY7dH8j/
         lt6gyDl24tZ1NQK+BLlh8dBm2hlbVaeWg5+5S+PYP3Y1JGp/um3lgGsuguRKbluBztoM
         3yFmQxJ31Zp0fRVr8CgZDZXnjHwwAKR+gj5gJAHsaGJD+1STxpmRBCqKNPxcKYy6XQSl
         Yn0XiLchVZ1PnQvlP1fFPFWUA9KQCLZwK0z3COD4KIYavPUWKBK46yUVA3uGxw39tEeC
         ljd81vByvV+yz8X5rr398k+XdOdI+4qnA7kDPa4CeeI8hEdSc+TsPcaR2GAf3Ty0sPxw
         G9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733131410; x=1733736210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XiMGM/nWXpyvgXGPxpGpfX8jLfqYzeixD1E53niaNPI=;
        b=FnCu86ox2JH2nPYxNMPfXV/iILIGF22YDilUOpMd7DSaGXWn395ZZhgikLXyEbqc2a
         8McUuQ1rHNJL1Ac/jS+qheLkL3hMBjGMjD+dYhRNRrJVsIcsrzAptkAYthofTxgQtiY6
         1GF+c5MbfBkrQIptKNm3t/ets2E6pPDuhzoGwhoX1kSEof+VckUFUEKx+49gx39msbQc
         mmJ6Lgnihv3RcIqWFTg9ZWmsgs/a4QKSn+Z1RCSDEX32QkHiKsKCjDndN3qpfhy9UU4D
         YAM87Fd6PJ1KpM3kIqj0wWiJPb4VUPh74ovMQYXE+Oh/BVdDP6EbTUJ8Bu0vxbY/4nQd
         XR6w==
X-Forwarded-Encrypted: i=1; AJvYcCV56cpClldZat7G5vflXu5ooOWPYl7R1yaHaQ5E1M5lY+bVAvRRFqkBkoQOfG3Q6ztvd0yrWV+AFR6kNyEG@vger.kernel.org
X-Gm-Message-State: AOJu0YzV718kPMxRQ4b29twxQeE2zLBD+836TFi5rY2GT3bnZ6+Yg3vW
	QC0w3iAm96l1j7xGWIqMe8bJ0GRY7w+LgzFr3vMQs3Yavi9ec7GhJC8NTeHq8ww=
X-Gm-Gg: ASbGncvG2UuocUBIuiAH8JaO6bidCYgFlGGpLkChqB/LhisCUVZ3e5w+aDirjvynRml
	tzGs5d6Fhx+KzKQd5t/rpxMhfSY8awDwrPJc8mmH2dObU6ulBV3FMJMc6j4w/PUBASHAaKWOYET
	STsFcZtU9nho6H2ZVvOmuRVeim0pnlxCJzaNsPbe88uq0HkCvAYvu9UQQv3zbRRb0ht3WZLGO3F
	FB/SduJ4JeUBw1slwP1LOPwDa8jx4rTmPWJr+Lvr69DaZJwpw==
X-Google-Smtp-Source: AGHT+IGkW5mxPjQmyLvxG8GcPkJwiL6bZvT9/RnZ8OiXx4aWYYIaccK72XIFNkOLMjFAbLHZ/3amPw==
X-Received: by 2002:a5d:6485:0:b0:385:e176:43ea with SMTP id ffacd0b85a97d-385e1764628mr8641610f8f.28.1733131409708;
        Mon, 02 Dec 2024 01:23:29 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385d7264f27sm11014744f8f.80.2024.12.02.01.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:23:29 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 02 Dec 2024 11:23:18 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: x1e78100-qcp: Enable Type-A USB
 ports labeled 3 and 4/6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-x1e80100-qcp-t14-enable-usb-type-a-ports-v2-2-7360ed65c769@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2981; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=tqg7gzkgA4MYt/pRkxLKHP2cWrGEuuks3ig+VrWudZM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnTXyMEDvNhdMm3eST43LpgWDgnzisRdswLSLS9
 889P214jt2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ018jAAKCRAbX0TJAJUV
 ViY/EAC98lUfBJ6Kq/7KCbPeZaxSU4AIb8eA/BrjJc3IyQvYzmPpmzhHvXh7MW+eG6yOgh1ErMR
 lCHfZvj1DT47nAn4KBgoeLg5rnYO5d7JSVuaHGGA+pXlEr1Az9MMYh2EQ6NyUHZOJGCjL1yAmfJ
 xwPAuGbCZBltp+XjApQibShh39o6hPA+h6M/Jcriu2CwMWEHPPCb1NMoID3S6VGvMsSO8HR1GZX
 U2WHHu9rjuYMBjo5phsNnB5QxH0aMgV2Lchhjv1+sOHFaiXSisvTEsRV3HKJp045egcA/DZ3H0s
 K0/H9pDfI1N2e5hP6zKb+uazkzltew2oqZ+eyY9aw4YaRJSL+E7MDTD6JohXuYNGoWCTJOBSgSA
 u8RPsc+42FcpCLERm7dxwjG6QU2l5VA37jdZ2ck/emsUjU6vS/pK6LNDfOPvMSQgcjBGpvSB7Ac
 qIwhjCqGKsARVAVo1d28CReQdycftcCsPLNBJ58RfmkhJb5H/8rUEl1F+7qdnONod/63sWzTUSV
 VfWYURd4ApX49kBVbXCokKnlpxWBmM9zmD5QlnSvHYEEscikHreFgsMLTT2KDgLvfmQa9M2B2gU
 8rOxgg/jcyC+pyccLMdxaTf5ZJXS2TsnY/EMMKt4GPndsZC5vQb4qsKrG28yhkDVtYwJWUg7hO5
 t9xeP+5qfRkdlWA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The X Elite QCP board has 3 USB-A ports. The ones labed as USB3 and
USB4/6 are both connected to the multiport controller, each one via a
separate NXP PTN3222 eUSB2-to-USB2 redriver to the eUSB2 PHY for
High-Speed support, with a dedicated QMP PHY for SuperSpeed support.

Describe these two redrivers and enable each pair of PHYs along with the
USB controller, all in order to enable support for these 2 USB-A ports.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 86 +++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 5ef030c60abe2998d093ee60a6754a90cd5aaf72..7c133e60e6f00f65f94adc5863cf935954989589 100644
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


