Return-Path: <linux-arm-msm+bounces-12190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0452285FAFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 15:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FEB1B27556
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 14:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 433611474C0;
	Thu, 22 Feb 2024 14:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VfGhc2I1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69C9146918
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708611596; cv=none; b=c0riuZX5T5RLmvrJ8qZ8y97Y6eRWi+qhsE1pI0SSIpC7d0pMN1zlBPM2XnuAOYhxdc3K9yPD8zJSUF+SpKp9HUsI4mr7glXdXpAO1+gsi32AB8ttH1ShX03lbtysbWogyr7Gxhiyllybphg5pdWtl3c8hnLcsm/Po3j6CJYg0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708611596; c=relaxed/simple;
	bh=8svlNz2AM3TX39zt1Mh5SAJo/Xa23Z1D0hrKnS+mZzw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=orANFbhSJ4myuzQtC/L9zcXMPjSlCo/QSPXMkHCGfBUS4ZupItF88j4tlM/qQwdb8MeLGVY1g/6BE8PB5lFCKELAOc7FPcEVHq25RV8XXKAY1N1S7/t3kFHU8kWpQLcBPWRyp5/1+pombkEBYP+c3Wpzp1G2apSIz8+ZsFNmW4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VfGhc2I1; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5648d92919dso2769266a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 06:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708611583; x=1709216383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TNFJtzw1Au24uNAZlkPHp4RYVJ5vQGAsCG8vVXzlObA=;
        b=VfGhc2I1hVTIjT9elOsyD7TI82M848XIuhgwJUdZ3ILk2XJeEpixwVoIC1nhPby226
         nQ+Wv9T0wKxtfy8XhsZa8hfipRKwExCTk3B7poM/80jw34oPYXXHWLAPX9onT3SQVesM
         NTMDUZbD+4zUDKx1zICDx3Z9ClZP1qOUk525TrUOW1y1tK2snMzhg3G/h91nJS0stpS/
         0L+fORGPzDIo6qVGSnfa3YYWm9PfHUufG1Y3TPcbk4cVUJjPK/Yy8KdFj5BtnHClSBz0
         /Rtj1oiTQ7yalyMYkfBdSnf3JLUuaYtaT2MUSst8+S8aXevmGmTki3EzFNPZTl21ACTQ
         TORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708611583; x=1709216383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNFJtzw1Au24uNAZlkPHp4RYVJ5vQGAsCG8vVXzlObA=;
        b=Nn9xIsdOrwnZ1di/qHbQT++FIIVacb74K8VZswvuGgx/TFDfTvY0xf+OtHX76T96L6
         DwhZqX7F02mHzOcIMQgcTD0Suc2x/mdHv6h0FiRmCx/R0Szn+9UGQVGxRqJ0glojAaEj
         8czZFRmVTP4qs13ChsBNchbAYk/N1s2N3gCm5ydPX4OIbyrwu6qmVuGv4xSxXxI5YbNq
         YWkZ4x15FLQf4UsOcGeaOGRbuwec09JF6Lt205pwJ7EgQPZ0oaxoBMA1Iu9nn/UO3wYR
         x/e7ghigpkgEvOk5hzruCKyhRNcOc2xYgBBceE1lhY1Op7t960H/sZSKlwFPysgMtrUd
         y0HA==
X-Gm-Message-State: AOJu0YzVZ4gHbTqnXlYOx4pmfv1PBfxRBv4YqxNqvQ0dD9OMS36I8/AP
	DS3keFkqlMPkXVGe4ZNzdL0g9pyTijz471Mcn8W0m7bNKEOlO4rYDX45b0o6p2I=
X-Google-Smtp-Source: AGHT+IH6om1CxmwZGcQnWXy6bEIMyBXZcIWXNrdCLTXKQ0SXCd7CCKQlkBnOSpAafphpRQ/CzqYzVw==
X-Received: by 2002:a17:906:aad1:b0:a3e:a3d6:eb6f with SMTP id kt17-20020a170906aad100b00a3ea3d6eb6fmr7506167ejb.48.1708611582822;
        Thu, 22 Feb 2024 06:19:42 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id lj7-20020a170907188700b00a3daf530fd8sm5992588ejc.210.2024.02.22.06.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:19:42 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 22 Feb 2024 16:19:21 +0200
Subject: [PATCH v3 3/4] arm64: dts: qcom: x1e80100-crd: Add repeater nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-x1e80100-dts-smb2360-v3-3-85a691d4f68a@linaro.org>
References: <20240222-x1e80100-dts-smb2360-v3-0-85a691d4f68a@linaro.org>
In-Reply-To: <20240222-x1e80100-dts-smb2360-v3-0-85a691d4f68a@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=8svlNz2AM3TX39zt1Mh5SAJo/Xa23Z1D0hrKnS+mZzw=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl11f30GGaRLU6XUNmd7u6Wgq5dYwyzoH/42EN3
 qutQPWK+bGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZddX9wAKCRAbX0TJAJUV
 VpCyD/0fmjcldQqSmANrHDFImBG57tiHs8sO5I+eujxjkmeB6M7qcTc7bI4dl7zD/YKabril3uy
 17uy01kPnB+ogyqEntKqvujGip1OBvcuFz1/I+KypNBKIHL+ZrwFjSAKrmtzQ3wJ8MGe+9KBcLf
 b3K0R9ObWdb4XF/7OHJsc7r0QmAtaxHEI4BtGfxFXDFkfuNYDmy/KndNfSc/mPa6z+U+GeXh05/
 Bp8Ad6Y0//Ourne1/HJmsMLrcbKGQlQloQJ/98irhoMYkKR8qHvc/PX0kN8Oq94pOExsnwqYTJw
 ZKXRjZUNUmDCoJfDyLfd5ao7uxa0GoTK5neo6eG5ehIzhvoYV+jfySyyzLmx3nogmllxNdkwSP/
 lC+oMo7lHgvEryGf3Er0FlJGfbmnDeTeuoBH85G1R3OAJJyO8AQjMOMvq3ktM5jIzvpG8hwXxDo
 PV5YeFSpygLyGvkHplOgo20kMxlWGSjjeELL1JAiLyHq/CRALeqX6rCD35mYgThkPfpcvLl9tCU
 1KexbF/7q88XPLORsWHUungd+/dYwz4eR68lyxVbcy6I8M+OB1sKY/o9bb9ci5yLh9evd+x8JRS
 1DWUpqeTyQEKiVwLM102juo2CzizPwPuzFl9v8s7+YBYHxpecElc66yqaDJxXmEs62c3elbFb+4
 9rAK1ECC2iGjqQw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Include the PMIC dedicated file and add regulators to each one of
those 3 eUSB2 repeaters. Tie up the repeaters to their corresponding
USB HS PHY.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 6a0a54532e5f..41078889969d 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -9,6 +9,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "x1e80100.dtsi"
+#include "x1e80100-pmics.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. X1E80100 CRD";
@@ -680,6 +681,21 @@ &remoteproc_cdsp {
 	status = "okay";
 };
 
+&smb2360_0_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l2b_3p0>;
+};
+
+&smb2360_1_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l14b_3p0>;
+};
+
+&smb2360_2_eusb2_repeater {
+	vdd18-supply = <&vreg_l3d_1p8>;
+	vdd3-supply = <&vreg_l8b_3p0>;
+};
+
 &swr0 {
 	status = "okay";
 
@@ -817,6 +833,8 @@ &usb_1_ss0_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
+	phys = <&smb2360_0_eusb2_repeater>;
+
 	status = "okay";
 };
 
@@ -837,6 +855,8 @@ &usb_1_ss1_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
+	phys = <&smb2360_1_eusb2_repeater>;
+
 	status = "okay";
 };
 
@@ -857,6 +877,8 @@ &usb_1_ss2_hsphy {
 	vdd-supply = <&vreg_l2e_0p8>;
 	vdda12-supply = <&vreg_l3e_1p2>;
 
+	phys = <&smb2360_2_eusb2_repeater>;
+
 	status = "okay";
 };
 

-- 
2.34.1


