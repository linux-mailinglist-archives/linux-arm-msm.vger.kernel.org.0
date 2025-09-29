Return-Path: <linux-arm-msm+bounces-75454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C14E5BA7F62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F1177A8116
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EED822AE7A;
	Mon, 29 Sep 2025 05:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="RasfZU8I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878D22836C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759122352; cv=none; b=qqh1sZa77Hnh/iT8oSHdYujWQoRO6/gpAtcg0gcYc5H9DMaRO2Pwrf7qHS/UDTIu5IPWM6SjVv185zrH1kyKA+MtplsZWz9CY/vfTvF09zB4fvPZn/pEwv+OYfvHYyTpU7C5s1b85guZDcqwAChKGhuQNlbBDwizC484tTJUoUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759122352; c=relaxed/simple;
	bh=QArI55h2f3mKSFAW7bLk4qRXL577+wzrlqW2PxFMXRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=neTrraDkdnvHXC4B8vTQpsxZc4L4XgZtCCak2TVD3wLTAcRdftX9/Kzb66M5i22nJDrtenry9y6v2pRPFKzvac83WGt7hx6Ekcv+PLTcJkuc1+Z2D2nTbFGL4LAUrt0yHiND/aG/Na0h6rH9OhvMhKA1pVnx+4k62qCIYZuRqEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=RasfZU8I; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1759122348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rligWal/S2HvMrpgNgnuebpXE2OYRThXVxsg80JzvhU=;
	b=RasfZU8I/peyGxAXPnDj+f4XSu31mVCm+aqiVWW7JlHeW6WRFb6cEA5TUl8D743o+rnqK4
	ZJQ8I0xIwvdrLkm7Dk07k3EblYCvM7oJktPn2KSTRbBwwUHdlV53gRm6jULD9S6Ymh2jJn
	texvvrEakKS7DZN8N17ahVhbazcTEca52ws812j/tJKFxNxfPQfpEptW60f7QnjYB7qjxb
	p5R+Fa/ofiMX9Eh630iO56OepNUamikAlgHTAPIHU9Y1iI0N0E9qb+oV8Czu3wh6Jg6f/0
	uOEg6qvjhlJGtYbAIOQmVwRiv0631BV0mFzDfuht2grW1z7FfvNJTlsQBMRHmQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 28 Sep 2025 22:05:28 -0700
Subject: [PATCH v3 05/11] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-judyln-dts-v3-5-b14cf9e9a928@postmarketos.org>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
In-Reply-To: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759122330; l=3501;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=QArI55h2f3mKSFAW7bLk4qRXL577+wzrlqW2PxFMXRY=;
 b=K6OFs21yQ671JjHNKAABpSqLX+hMuHO07zTUjIyjjBBs6EZp6dDPiET4uBT+25vw8c2uE5FJZ
 IU5cw+91FA1BYtMBKoG0ggy9Ub9N1cNDw1ZBangdfG0IQq4gAVIjgxA
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Also include other supporting msm drm nodes, including backlight

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
Co-developed-by: Amir Dahan <system64fumo@protonmail.com>
Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  8 +--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 82 ++++++++++++++++++++++----
 2 files changed, 73 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 2a612922ecf7ce3f8a0734cb1a31a8a81efdb4f2..aa338612433f9ac3b07363b79d8a3b8e0eedd98b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -461,10 +461,6 @@ &cdsp_pas {
 	status = "okay";
 };
 
-&dispcc {
-	status = "disabled";
-};
-
 &gcc {
 	protected-clocks = <GCC_QSPI_CORE_CLK>,
 			   <GCC_QSPI_CORE_CLK_SRC>,
@@ -532,6 +528,10 @@ led@5 {
 	};
 };
 
+&pmi8998_wled {
+	status = "okay";
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index df65b0e32b195d2f668883542cfcabbb9bde8204..f45eb1dfe55c562142092a4239758609fa3f2e47 100644
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
@@ -61,6 +48,47 @@ zap-shader {
 	};
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
+		compatible = "lg,sw49410";
+
+		backlight = <&pmi8998_wled>;
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+		width-mm = <65>;
+		height-mm = <140>;
+
+		pinctrl-0 = <&sde_dsi_active &sde_te_active>;
+		pinctrl-1 = <&sde_dsi_sleep &sde_te_sleep>;
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
@@ -78,6 +106,34 @@ thinq_key_default: thinq-key-default-state {
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
+	sde_te_active: sde-te-active-state {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	sde_te_sleep: sde-te-sleep-state {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &bluetooth {

-- 
2.51.0


