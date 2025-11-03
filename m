Return-Path: <linux-arm-msm+bounces-80093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 21114C2B88A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 12:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1D4D44F9AE0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 11:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D80305E01;
	Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTUaJCa2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39A23043D0;
	Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762170352; cv=none; b=hAUXKe6HkOs2JSJp/z4y2WpXXUgk8piDeO6pezxOqyWDhkZVLVNNGu3aERO7ThH1mkfcDIPz/VFX8CWmeg2HOUXEX7UGjfzzzV2+6KP9Qle/U4Wksom8ztFhgoLez1DuJGXrD3uBUEYpsV+lzqW8P+W3Qup6xAnOTO6SDqnd9s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762170352; c=relaxed/simple;
	bh=usqJ+nSopZseouaGntxUyToctjdXBYfd7bNTTzfX0RE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTM6b1XZ1xvvSQy1+2uS1PqtjSboVKaOkXYI7XmsBoRQTYX6rsjaiz+XvdoTT+hGXQkGOzi5RYJYL1HqZ9Y/xyxX3QGpk65EZc2YfOAQKuEOTlUUj/ZvFXFQPSzeBHiii0876DXS0CEM5ll/ik2Ww17sRCMsHfX30FttGmQduy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTUaJCa2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E4FBC4CEE7;
	Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762170352;
	bh=usqJ+nSopZseouaGntxUyToctjdXBYfd7bNTTzfX0RE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LTUaJCa2X+/ucvPAiDz8smUnoJHjLHbXWNDQcG70NovjFR5a2vF8ONHM4/dxuD6w6
	 t3AQAHiNE1MXzkCSLoh31RZLxOS7WQ/5uxIc0VPioOq/elV6cHie/ow2nkukaP//Yu
	 aB02iGZ/+LCA426vs4BypA1fc0CNMD1WD/6GUu1Ozub0yxSxIk+0k1y3JdaqQ181gh
	 sjYnm7HFKrR78xmxaxC4lX8is2Xjka9twC8I+gYwpHQSokOe7VWvJKobK9rwJIpcbL
	 m5Qv/IdxifsLUelVDVX90lIPLjewTxmvkQxcwkN1OJTodLtSZ5erpY76kqZ28R8Rv2
	 cfSDwrKnA+HyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 158DECCFA05;
	Mon,  3 Nov 2025 11:45:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 03 Nov 2025 12:45:50 +0100
Subject: [PATCH v6 1/4] arm64: dts: qcom: sdm845-oneplus: Update
 compatbible and add DDIC supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-s6e3fc2x01-v6-1-d4eb4abaefa4@ixit.cz>
References: <20251103-s6e3fc2x01-v6-0-d4eb4abaefa4@ixit.cz>
In-Reply-To: <20251103-s6e3fc2x01-v6-0-d4eb4abaefa4@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3555; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=Ja+qcUZPemiWGwrEdzpL2zpATb4nV3ugDrMqyZlS1to=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCJXuHq7BedYzlYVbXLP19Bzd4GUC0NZDIIT5m
 BvUk9JIByWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQiV7gAKCRBgAj/E00kg
 cuqMEADArYtBsvFOcy80EjAH+D7F0BhpGm/lifFYE59baEerspM5ITJYxUxj2eLKQ3TET+PF+Rn
 w0JcCx5s5uNA/VognH3DqTtbSHiyL8lAFtF02i0wS+zpM2r7KCiy/n9vPkLBFQwNwMGfYjKtlq/
 38scKsB+J/T+qlOwxIkDdpu5hDglRaZxjac5hv2aRDeGw+n3V5DuevLTi8X76Zgin6KyV4azpUT
 zYu2WQTwVCZ8r+3htb69/PkyFJxAFAV8jG0j8ajZ6yovkx6AjC9D6xCMH/VpuchW71OheEe142b
 ZI1ObczqNxqgrXmnGhIiLrAGX50NpqaW0NYmT+IWwKkB8iJ6R1uIwGicuUVFrBGG6T/iqkohjTA
 P5+2kWx8Pa7K17gchl0WiaV6bSXyRUFtE2KbVpFF0JrnL+Oxwj1aByNEsyiemBxvAIl+aDLjMQ4
 rDECDquo8J4wAfRsJ0ixmMFKIAtF0bz071OveK3I79AoWhXSp0/7bKAHELuEmrn59HM2R0QHx4j
 CPy9y1Svnzks8ODjNZyoB0cWhCeULdkwCRKwHDy7TmVbq5/hhZrcDc51O6+r+Pw0PSJtuZjt2bH
 lQkRzzkUl4QRWaCqbh2nlt15EN1ZUMKJApheD1eBpoGLEXZj9zGyHmGrsdGHbb9oeGv9rXDnPmx
 TVplV30lq46WqWg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

Update the compatible to reflect combination of DDIC and panel.

Original compatible describing only the DDIC used, but omit describing
the panel used (Samsung AMS641RW), which we have no way to detect.

There are two additional supplies used by the panel, both are GPIO
controlled and are left enabled by the bootloader for continuous splash.

Previously these were (incorrectly) modelled as pinctrl. Describe them
properly so that the panel can control them.

Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |  2 +-
 2 files changed, 46 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index fd7fdc1f07493..d619b710c63fe 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -150,6 +150,34 @@ ts_1p8_supply: ts-1p8-regulator {
 		enable-active-high;
 		regulator-boot-on;
 	};
+
+	panel_vci_3v3: panel-vci-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LCD_VCI_3V";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&panel_vci_default>;
+		pinctrl-names = "default";
+		regulator-boot-on;
+	};
+
+	panel_vddi_poc_1p8: panel-vddi-poc-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDI_POC";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 25 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&panel_poc_default>;
+		pinctrl-names = "default";
+		regulator-boot-on;
+	};
 };
 
 &adsp_pas {
@@ -416,6 +444,8 @@ display_panel: panel@0 {
 		reg = <0>;
 
 		vddio-supply = <&vreg_l14a_1p88>;
+		vci-supply = <&panel_vci_3v3>;
+		poc-supply = <&panel_vddi_poc_1p8>;
 
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
@@ -790,6 +820,20 @@ hall_sensor_default: hall-sensor-default-state {
 		bias-disable;
 	};
 
+	panel_vci_default: vci-state {
+		pins = "gpio26";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_poc_default: poc-state {
+		pins = "gpio25";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	alert_slider_default: alert-slider-default-state {
 		pins = "gpio126", "gpio52", "gpio24";
 		function = "gpio";
@@ -805,7 +849,7 @@ ts_default_pins: ts-int-state {
 	};
 
 	panel_reset_pins: panel-reset-state {
-		pins = "gpio6", "gpio25", "gpio26";
+		pins = "gpio6";
 		function = "gpio";
 		drive-strength = <8>;
 		bias-disable;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 7e75decfda052..d6cd873aef0de 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -32,7 +32,7 @@ battery: battery {
 &display_panel {
 	status = "okay";
 
-	compatible = "samsung,s6e3fc2x01";
+	compatible = "samsung,s6e3fc2x01-ams641rw", "samsung,s6e3fc2x01";
 };
 
 &i2c4 {

-- 
2.51.0



