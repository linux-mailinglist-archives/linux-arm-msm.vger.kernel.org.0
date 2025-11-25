Return-Path: <linux-arm-msm+bounces-83193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C352C83E93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9A6D3AB892
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295A92E36F3;
	Tue, 25 Nov 2025 08:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="pYv/QK7I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707642E1C57
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058397; cv=none; b=YKszvNqRe+1jIQIzsS1eBjF1jCKR1IjIbAgdC8Kg6oMWV0vt9LUMRXdZkNordb0nUFJDOaeCzgDr5kobMeSJDzW+Mqs8Ts8yPeVMAFQK+aAWhgy5s1EWYM2dz+QEq++wsGdJvBlmuOytdWzR7IG6KotH2ntERmABmeM9rndnhEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058397; c=relaxed/simple;
	bh=K8gapTNnVjo/jTS+9b7eZkDQS1x2H76g+XSdMztTOjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BVdTE1rlztIXr4XE713OP+wCThX7/OEcFqAScT2r7ZQkTqq48juWsqaGmaGKfQS9o3UBnKABWI4obZhqJdJu66VYWa7NHCNy6/iy4TwPxwP5Fvz8q5U5rZQuslZU4NqDjrkxniD+onGfvF9l5x++b1e0SoxGXFiXr2qHzIIjbkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=pYv/QK7I; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0ejbQS51Tms5hO98oVQCk2U60Rb1YtqzHblCNrmYC+c=;
	b=pYv/QK7IVOE03cpTd+sC3xTtYHPi4xx6M7pYnkML0O22/vnhX9WddvmKUPqLei+yXggvtP
	KodaxLQltohJ2f61HOeXLCV6/ZMsxR+J7Dxv1tMO4YZL5H/AGQ7AQ1eMSy2Db5CGC1kL/i
	Vn3toyvgxMS3gxaM6n2fIa83dr5PQ0hM9HqaLDWBNHTeH2mBTvjZ9hPutd83eKiYdmyPNy
	jEqOL06r2uDlokuXO6RqyVFIDcPhOmmxzlxIFwaBhx1znl0cZLNukAWfmt8R3Za2SWptou
	gz19HHnStEr08IpUVbGDAbNH7ivUNe5MrkrcxvgWXG7QobndZP/cBKIIvyWfzw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 25 Nov 2025 00:12:35 -0800
Subject: [PATCH v4 05/12] arm64: dts: qcom: sdm845-lg-judyln: Add display
 panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-judyln-dts-v4-5-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
In-Reply-To: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058372; l=3332;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=K8gapTNnVjo/jTS+9b7eZkDQS1x2H76g+XSdMztTOjg=;
 b=2ak1qBZaUfFviZgF2XDj04qgZKnKSngKx2dUTsRu0qPIT1W9HvtVKx5MH/FkXn91/S0OxZVwo
 ToTHXd+J5ImCS60TJ3SsXA+vOE61n13Uu5Kgm5VNqbKuz6jy149CeiM
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Also include other supporting msm drm nodes, including backlight

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
Co-developed-by: Amir Dahan <system64fumo@protonmail.com>
Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
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
index fa048937e396..8e4214b83bf1 100644
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


