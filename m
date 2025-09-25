Return-Path: <linux-arm-msm+bounces-75035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D847B9E39F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 11:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C1CC7B5E44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 09:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C382DE6FF;
	Thu, 25 Sep 2025 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjzjyYtV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1250027F727;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758791572; cv=none; b=H3dYvgVb/D9EoXA6Wnlombhd005BQezSqPJ9TNy0Q8SxdZd2oKm5xaZt3A7PsNTYwAq3ATTl1FDI+50bH3T0eM8P7OcmdNfyD0gDB2K/V4Q7zXeCychQCrztmmmyISprJVwkkyGK4K+9RhvVSK/GYXcEwpiZJr1S9/dsSK5Mdc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758791572; c=relaxed/simple;
	bh=NW1CE17pvkwuuY99J8C7oYyNarOCPRTFmP+evEv+sk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iryti3AuSiNMSCuHfF7mj84LlalHG6Xe5/1Uka5vdMpRutQlzs45TVbZg0z9TnOgmE24J8GKwUwkmPhx3oMRAHjD27KFC3sNM87c0rOpEItAJcMWG+Ga5AO3KMsta2bx1294/N3FCrc1zNRoaUqSTl9VNSoCfHo2SwhWF1x9VuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjzjyYtV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F45DC19423;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758791571;
	bh=NW1CE17pvkwuuY99J8C7oYyNarOCPRTFmP+evEv+sk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JjzjyYtVlukpSqCQC5ClOfQ9WEuytYEnWwJKSPXg/gIloXuqbNw5hHFEXiIosgJat
	 L8VTIijwNxCvi2MX8Aawm5hO+6nA4a7jsCMLyA8GkikDowfekr/4goMt9s0XMm+xi/
	 he5xnBtZe9c/1a8GCRbL2vBlSxhyXVuZv/YZvmGwsiJkj1sSdHGf1JrVM0SigZ2afA
	 nFRmqDmzeL+lcJzI5FltnoRh1C0h/0Odl9LtM6TnROsYazCCMmoWpwVjlfk4Q9ai6M
	 V1xO8hB1RivU16tLGiRYJ0Z+UfFhnBDT1VEFyYco8If/9YOhjJt9LZIc6AP5NRA3fp
	 28Zte+Uwmk2cA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DA1CAC5A5;
	Thu, 25 Sep 2025 09:12:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 25 Sep 2025 11:12:49 +0200
Subject: [PATCH 3/8] arm64: dts: qcom: sdm845-oneplus: Describe panel vci
 and poc supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-s6e3fc2x01-v1-3-9293016768f7@ixit.cz>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
In-Reply-To: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2120; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=iduZDITmtG6mUy1IsKO6y2Hl6HLIfyv+LeZypEX8vE0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo1QeRBZuGrMAYZb1bmM/KLqp1Hwljqo9uRCiVP
 w5mvUPF752JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaNUHkQAKCRBgAj/E00kg
 cjAID/91TkloKosKnYGmnJfhHjk8hrAX6DDrs3DZG2W6Vnny2tVudonwYJaHLM4tnP2BbRffnR0
 Utgf+e7sRtK7EoGXqhB1ZOGiF8fh5nIsquvDbF1YTTXTg5O3Ufjb9JLa0JuuUY2XeWCn26kE4pI
 xh4+rhecHP1h6fpQiDlNLO9fPyKj/Bfgb1gxkClhoVkVgiYqwOTU3vqdoAC5grxxAeV8rdlLb3d
 zleD3i4PNHNauAdTwwGRRH/Y7jHTM0/6dMJa+FIWyrEtvEDmQmI2sZ12beQv/ZiA0zO+c6GkHdt
 L0II2wzFv8Xsn79ZDqzgejm3gFV52J3iI3uxQsvGEpkhdqhL7RXAVKpgYXX2TKX0EgXwKycjnGy
 1LfeEiC89wt+vxOI1T6VsEK/nmZ41X9aJmn29o6L9PQcwftqeoXIbP5fHS9cQ7VZODc6C1oGXaD
 iNfugYX7Ltg7N/9TbgEmeu9+ralg29a6kWaog1wvdFOAYiLU+OzC92jyFWye7EwB6D0FcoKXw9M
 284rfZvZjOaWf9W4xJjF7GV9k2l0q20zy4DWvpUR0yWVSWPLRfG2Ovz0N3nMEVR5Ws43kx2g2Gq
 QrzwD4+fmGP+Keyw+AQXPZnSN2uBRIJ+s7zHUbcBVzjxa4JaVZfBvIX6GWDBXSTPL+U3rQGYQOE
 IDsqdkUY70uTEEA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

There are two additional supplies used by the panel, both are GPIO
controlled and are left enabled by the bootloader for continuous splash.

Previously these were (incorrectly) modelled as pinctrl. Describe them
properly so that the panel can control them.

Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index dcfffb271fcf3146aeabda8fc19e61b456b76887..aff5e80c1eba43e830991c2afd53b6322893cd27 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -162,6 +162,30 @@ ts_1p8_supply: ts-1p8-regulator {
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
+		regulator-boot-on;
+	};
 };
 
 &adsp_pas {
@@ -429,6 +453,8 @@ display_panel: panel@0 {
 		reg = <0>;
 
 		vddio-supply = <&vreg_l14a_1p88>;
+		vci-supply = <&panel_vci_3v3>;
+		poc-supply = <&panel_vddi_poc_1p8>;
 
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
 
@@ -818,7 +844,7 @@ ts_default_pins: ts-int-state {
 	};
 
 	panel_reset_pins: panel-reset-state {
-		pins = "gpio6", "gpio25", "gpio26";
+		pins = "gpio6";
 		function = "gpio";
 		drive-strength = <8>;
 		bias-disable;

-- 
2.51.0



