Return-Path: <linux-arm-msm+bounces-27483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1FB94267A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0BE7B2222B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6429D16D9C5;
	Wed, 31 Jul 2024 06:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="sOmBICBv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E079416A94A;
	Wed, 31 Jul 2024 06:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406781; cv=none; b=HJ1cuYrO335+XrmJDLxzrAJfpPs7j+2N7f+5lWOxvTiE6Nyjd7UbaerzuLlRFN6LB9MR9or7CZQGPe2q4VHukYtC2iRH+2Te+mIrDaLBrb1DXAeBpB20OTmBR1mqu7YhBRVssGr/Lx5eMEGU/bSBrGZnfhaMtWlcuoCLtoo0Ei4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406781; c=relaxed/simple;
	bh=WNvPdgZ1+ApClON4sY9NXXmesMLCtDJAey8+OGBZ5nE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n7rzYGiBh/3ujqNUUOoBNCzTbduy9R9NQVBNW+VhnOoNQRRcslLGC4u0j76xNlc95lAvB7f8Ff4XjJlDCIGkkHoGoxIU4t31MNVZv8d18Keo/n5T38MIyeeFqhQAzeLtIYtXAureMb4kPI+ca5WK6+z8EWfL2guJUOdH0+LwEUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=sOmBICBv; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WYhlH2FgTz9thY;
	Wed, 31 Jul 2024 06:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722406779; bh=WNvPdgZ1+ApClON4sY9NXXmesMLCtDJAey8+OGBZ5nE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sOmBICBvHq8jKxplOD4nr+bOsHRg1F4GHWnDJUmTKDzVJLTZSgKevnBgj7/YbGHAV
	 lFcLzDh9ClyjmKdgixZv0k60YlrNgFyUtygloFxbmyP1dJTuvVoLd+FC5havpiVYSJ
	 TbYl5w4cD9O8FfVFYNqgZEFA7vpdKr8O1C0kBiq0=
X-Riseup-User-ID: B18A1D924C664FD30C65C4F28A5A2B6F1733CFC7BBAFBBEBF9C0A5646CB74593
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WYhlD3jC5zJt03;
	Wed, 31 Jul 2024 06:19:36 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Wed, 31 Jul 2024 13:18:47 +0700
Subject: [PATCH v3 06/11] arm64: dts: qcom: sm6115-pro1x: Enable MDSS and
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-qx1050-feature-expansion-v3-6-b945527fa5d2@riseup.net>
References: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
In-Reply-To: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

Fxtec Pro1x uses the same display (BOE BF060Y8M-AJ0) as Pro1.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 84 +++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 67946d099976..0301f04041e7 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -33,6 +33,26 @@ framebuffer0: framebuffer@5c000000 {
 		};
 	};
 
+	disp_elvdd_supply: disp-elvdd-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "disp_elvdd_supply";
+	};
+
+	disp_elvss_supply: disp-elvss-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "disp_elvss_supply";
+	};
+
+	disp_vcc_supply: disp-vcc-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "disp_vcc_supply";
+	};
+
+	disp_vci_supply: disp-vci-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "disp_vci_supply";
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -93,13 +113,16 @@ ts_vddio_supply: ts-vddio-supply {
 	};
 };
 
-&dispcc {
-	/* HACK: disable until a panel driver is ready to retain simplefb */
-	status = "disabled";
+&gpi_dma0 {
+	status = "okay";
 };
 
-&gpi_dma0 {
+&gpu {
 	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/sm6115/Fxtec/QX1050/a610_zap.mbn";
+	};
 };
 
 &i2c1 {
@@ -136,6 +159,46 @@ touchscreen@14 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm6125_l18a>;
+	status = "okay";
+
+	panel: panel@0 {
+		compatible = "boe,bf060y8m-aj0";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 82 GPIO_ACTIVE_LOW>;
+
+		elvdd-supply = <&disp_elvdd_supply>;
+		elvss-supply = <&disp_elvss_supply>;
+		vcc-supply = <&disp_vcc_supply>;
+		vci-supply = <&disp_vci_supply>;
+		vddio-supply = <&pm6125_l9a>;
+
+		pinctrl-0 = <&mdss_dsi_n &panel_en_n>;
+		pinctrl-names = "default";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &pm6125_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio5";
@@ -338,6 +401,12 @@ key_camera_n: key-camera-n-state {
 		bias-pull-up;
 	};
 
+	panel_en_n: panel-en-n-state {
+		pins = "gpio65";
+		function = "gpio";
+		bias-disable;
+	};
+
 	ts_rst_n: ts-rst-n-state {
 		pins = "gpio71";
 		function = "gpio";
@@ -352,6 +421,13 @@ ts_int_n: ts-int-n-state {
 		bias-pull-up;
 	};
 
+	mdss_dsi_n: mdss-dsi-n-state {
+		pins = "gpio82";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	hall_sensor_n: hall-sensor-n-state {
 		pins = "gpio96";
 		function = "gpio";

-- 
2.46.0


