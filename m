Return-Path: <linux-arm-msm+bounces-78154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1638BF6546
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 027EC50337C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 12:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C2EE333428;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KtGgwXDd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1926032E745;
	Tue, 21 Oct 2025 11:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761047588; cv=none; b=uyeN1yEIZHbQ0jMwBYrhKTObV3h5z7FLKjSPlBnOcrkDmSbPNhr2AK70O+Bu9/4sbijr3MxsHkIM7vgoOuY+I3wskbso58uI4FSWQvI6pVbsV46xfeOiZOq/PvgNI0UCb7kncNmLJa/9D+jLNDq77xWzhnfo+/pMXNhnlGpMNXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761047588; c=relaxed/simple;
	bh=w69+lORHLBk1YdMhMA8T+HNY3dQ1RRGhVGhjM7xFxkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AW+ow5/JVQsCFf62r2/OU9j00ZXpJAgfwk/N3OGQEiIK5CXgyxARSCxxXHtjL/2TZ9Oe9w7eBUvsvg5nEKDxDVJMkEJmEVzzs8RGYBj1riEmZVv1OZdNyChBJ6jXD5KDLANVJLTQHsY9H0PFhRpx3eX0jt1UQ+SzTN4v1RB9Y34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtGgwXDd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF486C4CEFF;
	Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761047588;
	bh=w69+lORHLBk1YdMhMA8T+HNY3dQ1RRGhVGhjM7xFxkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KtGgwXDdmEQAztjrM0tUFxj+1JmkBBwLmEBesggWOnzekhJDYSKJM0zDdSlmwlg/r
	 M9ZsncaUGEjyAwdqIX3m6JwrrTY1UgHUr/XYsd/j5bdtf3RCB2uWn9OTa5LAR90lfl
	 Qq9Z1LbCax1wiTfE9l4m4AoL8e9OGk1vFchvU2xZoIJNqjlmU3mAw7sQqbJbZrbI5Q
	 orRFe5FrCeJDjZyL/oTf4arzkDQ2j+PBL1qdu4RrZq42Naqo85DUjQdbpt24FijdUA
	 Rr65uwJpGv2uY2TU6cpMvE0kSkU3AbURElMvXae+2dEnkqOlDCm7hoEUnmhjRxwKDH
	 1SCpb/NQMIyfw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3655CCD1B0;
	Tue, 21 Oct 2025 11:53:07 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 21 Oct 2025 13:53:03 +0200
Subject: [PATCH v4 3/7] arm64: dts: qcom: sdm845-oneplus: Update
 compatbible and add DDIC supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251021-s6e3fc2x01-v4-3-5e3ee21c688a@ixit.cz>
References: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
In-Reply-To: <20251021-s6e3fc2x01-v4-0-5e3ee21c688a@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3556; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=5dCLbwr33VzKhLnq/J0O1v2W9AA33R5EWabu34Rbafs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo93Qhsaotx4/EuvX6eblhCyscFpkXCwOWWmsRo
 3inlH1OfniJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPd0IQAKCRBgAj/E00kg
 cvkIEACNAQnLzL7pPu1zgNkra79JhYJg3shkb4SULdSqtRdDrbG56r2672ZwzPHPWECzlcCxN6q
 QWCvJjWGQp95vs+13TDKJVDghttYOWRw53fjGR3q7W3rYC4ADdHwLSXZBMdPsRHSelJbKvw+JoG
 pxt4xW/uLPvmtEHbi5/RQzMwCXWl7V3t85N2z+Brna5y4Gc3q0xMvWz4akCWhiYqEiYHM9UlC4b
 sKsfFDBcuht7aLtr6L5/9xOARs1GVocNyF7/tB5lPhkGHNBa0v+3gcA66iWRHmI57YnOWb7Yb3N
 w7mXCmY+aE9UAuGgHr8Z7t3E9oBLiNOjTqQnBnye70ibtlZPtqR2Ic+ww5H6g9COWBd6JS+4gax
 nZFDbU259SaI0zVHqVteYfK1f41XGzWhIzy43h9qQmqNM0KLszdu8rx+pbGm48qIdcj32dZsLE0
 um7w4PDcDFM2AuwAEbFwFxWzo+lZCxscmeQ2aAA95Qs95YHjk/LAOR7jF9NURvPYBPGnMGFVJge
 5vczSnZlwySzSV8DpqmgDkJlL7BsFpR2B/oiVPLKxB1Jl97VHyXN3k+x2FapWsJ0BUSde3vX9Xj
 m7Z8MdDEvnjTB4noXqPHjcrZ03vstEqdeB5HlO0Q0Fhd2nm1LUqnlIzt2Qpdbg2zXfJQ1qKesl0
 FgzoOq0UYd6JlSQ==
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
index dcfffb271fcf3..1cf03047dd7ae 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -162,6 +162,34 @@ ts_1p8_supply: ts-1p8-regulator {
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
@@ -429,6 +457,8 @@ display_panel: panel@0 {
 		reg = <0>;
 
 		vddio-supply = <&vreg_l14a_1p88>;
+		vci-supply = <&panel_vci_3v3>;
+		poc-supply = <&panel_vddi_poc_1p8>;
 
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
@@ -803,6 +833,20 @@ hall_sensor_default: hall-sensor-default-state {
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
 	tri_state_key_default: tri-state-key-default-state {
 		pins = "gpio40", "gpio42", "gpio26";
 		function = "gpio";
@@ -818,7 +862,7 @@ ts_default_pins: ts-int-state {
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



