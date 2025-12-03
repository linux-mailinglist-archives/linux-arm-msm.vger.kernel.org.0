Return-Path: <linux-arm-msm+bounces-84189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3011C9E8BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 10:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CC8B3A8F3E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 09:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63B8A2E7BA7;
	Wed,  3 Dec 2025 09:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="FYhsXmi3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4101C2DF700
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 09:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764754950; cv=none; b=k5nZCfZf3d7azZWpS/d51hVNGWOpqSQvuSuJ1Vtfyr8oSHjzV7H7SrBeJqr/5EoljJ+kFb0r02LxzJOiyVedTNC/lEkScrGLeROdNY+ssRWnHg2PEaOdlHCzB3tpd5GpMbnrgVDqAQFCJqbVoqpCHVA/L4l1uEPo+R9BEnfsYK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764754950; c=relaxed/simple;
	bh=GUKMU2Skv50RF98UB3r0Tufw4dT5jLL+eP3env160go=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nbZC4PUhJLI8j7qhGXpaQhoteVDavtl3hJzyVrIQGr8u6qX62LFV3PLkE0y82prk3qbiXADWC0DlQsyyqGGmuta4b2k/Oa/s6Z/woFLANvDdegHA/tTcfAWxfbxBkHNiNcIswUmK0uyN1y2oNmFf/HvyQcneHeo/g12+Oqmad8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=FYhsXmi3; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764754946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QlayXQdWRwdkE16uwF3x7wEspMmGsvNVCpcyI7ATxRQ=;
	b=FYhsXmi3RxmvvZR2v/ovQCOk0pu7diO071aVo8coREEIjyg/pMPXl1wRwLS8woBG0w8XsX
	c2iK75B6U+PPfO/CNoDNT0QIhaeEaif45q9JfP5ziVEn2fZ9y+RGrL2qRwyJxtKoLXlVmx
	wnI9AeJKv/rDQYgwQGiS/dup3iK1oIEnPdtGLt+lJFhLwGQ4k34qoKco3tKSDBwFCVt2wa
	dGBhj4zKzJvnubEWGZbqlxQDdCsiJ76kCmHQlqPR5qkogej24b42tCeMTaTOPWv8/gWDGA
	OIFDOFmQOECC7Fx4aYQKpgqPJATq2IjyNNAvhiUPtxFkz6y6gqVYWvqYKY9TUQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Wed, 03 Dec 2025 01:40:54 -0800
Subject: [PATCH v5 05/12] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-judyln-dts-v5-5-80c1ffca8487@postmarketos.org>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
In-Reply-To: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Amir Dahan <system64fumo@tuta.io>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764754921; l=3379;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=GUKMU2Skv50RF98UB3r0Tufw4dT5jLL+eP3env160go=;
 b=YPx+YxtjfRazvOB4d5YDdUzZ0NWGTyQRsTFNt9wXt5FwLTZSh1tTmseFrUlo7pQ8pLDBgjL/S
 1owbOKfuoL4AzERSUEqLc+mdQN0mrB92zW2SPomjUX7FtRW0VBPaXlV
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Also include other supporting msm drm nodes, including backlight

Co-developed-by: Amir Dahan <system64fumo@tuta.io>
Signed-off-by: Amir Dahan <system64fumo@tuta.io>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  8 +--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 75 +++++++++++++++++++++-----
 2 files changed, 66 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 165523db4d49..50921af83a51 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -450,10 +450,6 @@ &cdsp_pas {
 	status = "okay";
 };
 
-&dispcc {
-	status = "disabled";
-};
-
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -517,6 +513,10 @@ led@5 {
 	};
 };
 
+&pmi8998_wled {
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 55bfddab3afd..506e6fe8e798 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -13,19 +13,6 @@ / {
 	model = "LG G7 ThinQ";
 	compatible = "lg,judyln", "qcom,sdm845";
 
-	chosen {
-		framebuffer@9d400000 {
-			compatible = "simple-framebuffer";
-			reg = <0x0 0x9d400000 0x0 (1440 * 3120 * 4)>;
-			width = <1440>;
-			height = <3120>;
-			stride = <(1440 * 4)>;
-			format = "a8r8g8b8";
-			lab-supply = <&lab>;
-			ibb-supply = <&ibb>;
-		};
-	};
-
 	/* Additional ThinQ key */
 	gpio-keys {
 		pinctrl-0 = <&vol_up_pin_a &thinq_key_default>;
@@ -67,6 +54,47 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sdm845/judyln/a630_zap.mbn";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vdda_mipi_dsi0_1p2>;
+
+	status = "okay";
+
+	display_panel: panel@0 {
+		reg = <0>;
+		compatible = "lg,sw49410-lh609qh1", "lg,sw49410";
+
+		backlight = <&pmi8998_wled>;
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+		width-mm = <65>;
+		height-mm = <140>;
+
+		pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
+		pinctrl-1 = <&sde_dsi_sleep &sde_te_active_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
 &mss_pil {
 	firmware-name = "qcom/sdm845/judyln/mba.mbn", "qcom/sdm845/judyln/modem.mbn";
 };
@@ -85,4 +113,25 @@ thinq_key_default: thinq-key-default-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	sde_dsi_active: sde-dsi-active-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	sde_dsi_sleep: sde-dsi-sleep-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	sde_te_active_sleep: sde-te-active-sleep-state {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };

-- 
2.52.0


