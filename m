Return-Path: <linux-arm-msm+bounces-73832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E85ABB7F1C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:16:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AEFAA7B68E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 01:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2330E2116E7;
	Wed, 17 Sep 2025 01:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="JRTP2j7K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45942221F24
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 01:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071455; cv=none; b=tijPffpmcTSC6pi6/bA5p8DicDxAgY9MF8uyCNtuGKAlHfDP4Er3ZJ4KY+0ax/nT76FgD0XTRMAJ0S7aA+StDOtSNIPXJKlsmH1PNpyN8cENIs+UHIThg/3sniBFsbKIBiS4FZGfMogGNYaJIjIKYNYPnG3qURDZjvK4BYkfJQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071455; c=relaxed/simple;
	bh=Ql1KiV5WnAdrtcqHKppHzb6SGERNrEU6cEy8nYkOnYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iJGposekc+kwHAJ8yOK+5kHw/9rnqkUGxRO6phOg9AxWEuQyqH5EeC9G4QnUBRlYTBsN2sMd9aUGfIwSR04alI6LYLGscF694ynlJXlnI9nbfRWv8u9p5nfCyb88KPwoZIt1lTxkceYpYFk0qep0l8teZn+5EpU5AtoQh/MmVxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=JRTP2j7K; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1758071451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sFgd5B+wjmH6RKdMI1rlJ6+UgJFbCM3lPLIcJ3MhI4U=;
	b=JRTP2j7KF24ecrtY0PVXfQ/+SIYlEGa+ODgJ/otcYmgIx9eurhbRS0auG2aAac3a+fW2NI
	bxwJmiAFUFRni6ZSvTYYCjjPeETfO97uIPUHVjRSRSu3sefFhvwVyalhHRDI7QZdYSnKoN
	hzs6qgmatRF39U+Xi/O1iVevwcJkkOzk+n/p/5YPnGy6mCaAqH4KEmrARs/MgUsVGeuPFg
	VOoT1lOPRsDANdB/x4d4TJbtHMONtEqP68dzkAicQtrxbE0YvK3ZPd5W3g1P+FmM3OC1AD
	cAw/h0BOk58g0VOhNoASzjM8CIWsasw0O3rkxfJl6U5MnxzlQSv6cOshOLsFsw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 16 Sep 2025 18:09:51 -0700
Subject: [PATCH v2 05/13] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-judyln-dts-v2-5-5e16e60263af@postmarketos.org>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
In-Reply-To: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758071415; l=2948;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=Ql1KiV5WnAdrtcqHKppHzb6SGERNrEU6cEy8nYkOnYA=;
 b=hzMgsRuLmOntTfBiGiNrUEfjbnahOrDHZgGat7GZnHdHQaO8tHa/HpiRKe4qGGDrGHEU68KFO
 dyxKr4Tt0llA7iLuUGZFec0zhc5pdOCVa6ySByg+QulzmeFPm4Ie897
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

And supporting msm drm nodes, including backlight

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
Co-developed-by: Amir Dahan <system64fumo@protonmail.com>
Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi |  8 +--
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 67 ++++++++++++++++++++++++++
 2 files changed, 71 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index db28a2494a0cc4b9e9d997d11f1acfb116e586e3..ea4de09b549d1d436897ea6059d27556041a6b68 100644
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
index be488891d0ab01c5bfd3762514fbf1c3bbf6845a..8077a9fb0dc28237fc6ac0b70c8ef45a0d72876d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -61,6 +61,45 @@ zap-shader {
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
+
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&sde_dsi_active &sde_te_active>;
+		pinctrl-1 = <&sde_dsi_sleep &sde_te_sleep>;
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
@@ -78,6 +117,34 @@ thinq_key_default: thinq-key-default-state {
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
 
 &uart6 {

-- 
2.51.0


