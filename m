Return-Path: <linux-arm-msm+bounces-53790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F522A83E4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 11:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C60D189E730
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 09:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390FA20C48E;
	Thu, 10 Apr 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5TDlojg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEF7202981;
	Thu, 10 Apr 2025 09:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744276410; cv=none; b=JRY14yGQurWP618DDVQBgFarUU05vQ4YzjYFSnQVZOacyWqDrfxAuo+r5AWpyrDHhJfMT6BmGfanzyUDeFThtxATMg51gutKirUdacOUTJKA2juG0EownZTWkxKjPKn5OzUNHKPQHdU4L3CuQcPTjlAw2gfInzIDp+IFvGVYzw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744276410; c=relaxed/simple;
	bh=5mbHZUyOkQE+s16djS8lUyMoXLxUdkHs1Z/PpZZRfGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/LXzqIbgDkJiu8SUa/U9ttB98cf8CATL6snHl5Kme/p707ryUvcBz731+S+UaiupjoQVV3Z0Swt0GPYHMkoN1qxwUK3chPtRRJjB2G/REjW0vWOsDqBxXLu1DQAiWzIpXUKhkKOnJKIJfVPutVGdV8rWsNRvCWmu+6cv0JXONs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5TDlojg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBBF7C4CEEA;
	Thu, 10 Apr 2025 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744276409;
	bh=5mbHZUyOkQE+s16djS8lUyMoXLxUdkHs1Z/PpZZRfGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u5TDlojgsvjfuKCdFtAxw+Du2MuQMuUfCwSjH8ClN1JQX0ooMLrQIxy7zdxG6obLD
	 YQFuvi/lZNwRkD4Y+7vLN/qguzI8sw9ZrhAyFCVzXEBBPVxnC9rGSovQwOUd1GUsS+
	 SHP1VW0/XbCzi4uXa/UC6Y1SOrYo6m1WOjY6R5KJ1+39+JLnWQl6BFKtQtpmC28yTE
	 5QDtoEFa37W+7hcwBWjYNQ5J0gefgG0gKs6dqk6yJYpfkTeUFzxgU2Ngc3GiIFzfn9
	 nI/yQtgxCiIjoNZnL2cAnu3vfEfe4ezSlC407v04hPi/ehySqlo8wn8Qo1OhzxXNh+
	 Bua93vXnlW7TQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F04C369A8;
	Thu, 10 Apr 2025 09:13:29 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Thu, 10 Apr 2025 11:13:23 +0200
Subject: [PATCH 2/5] arm64: dts: qcom: x1e80100-hp-x14: remove PS8830
 retimer 1 definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-hp-x14-v1-2-b4e5ca253ec9@oldschoolsolutions.biz>
References: <20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz>
In-Reply-To: <20250410-hp-x14-v1-0-b4e5ca253ec9@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744276408; l=3986;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=gzkzB0oshddyiq7sEJIrmq7aS96/xb63mm0Bd2Jq1ks=;
 b=LgM6wSgQGzahGqvqThwNpZIy0HV+MEAbSQ0R5uSDHZsIetbYGTl0fA6EfFgk1odlYLXO5nUiF
 B2iCQmGIJ42A4VF2AYdie3FpaF/cyHFFDnjIS5n8h/c73Dmsg+lkluZ
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Clean-up of regulators, i2c definition, pinctrl

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 134 ---------------------
 1 file changed, 134 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
index 27f6b21589704b1767d45763773da4cf9c43c77b..582d4326d5d527d20f99e716349ea0e9c0d35099 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
@@ -370,54 +370,6 @@ vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
 		regulator-boot-on;
 	};
 
-	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR1_1P15";
-		regulator-min-microvolt = <1150000>;
-		regulator-max-microvolt = <1150000>;
-
-		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb1_pwr_1p15_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR1_1P8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-
-		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb1_pwr_1p8_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR1_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb1_pwr_3p3_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
 	vreg_vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 
@@ -1046,64 +998,6 @@ eusb3_repeater: redriver@47 {
 	};
 };
 
-&i2c7 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	typec-mux@8 {
-		compatible = "parade,ps8830";
-		reg = <0x8>;
-
-		clocks = <&rpmhcc RPMH_RF_CLK4>;
-
-		vdd-supply = <&vreg_rtmr1_1p15>;
-		vdd33-supply = <&vreg_rtmr1_3p3>;
-		vdd33-cap-supply = <&vreg_rtmr1_3p3>;
-		vddar-supply = <&vreg_rtmr1_1p15>;
-		vddat-supply = <&vreg_rtmr1_1p15>;
-		vddio-supply = <&vreg_rtmr1_1p8>;
-
-		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&rtmr1_default>;
-		pinctrl-names = "default";
-
-		orientation-switch;
-		retimer-switch;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				retimer_ss1_ss_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss1_ss_in>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				retimer_ss1_ss_in: endpoint {
-					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-
-				retimer_ss1_con_sbu_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
-				};
-			};
-
-		};
-	};
-};
-
 &i2c8 {
 	clock-frequency = <400000>;
 
@@ -1536,13 +1430,6 @@ wake-n-pins {
 		};
 	};
 
-	rtmr1_default: rtmr1-reset-n-active-state {
-		pins = "gpio176";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
 	tpad_default: tpad-default-state {
 		pins = "gpio3";
 		function = "gpio";
@@ -1564,27 +1451,6 @@ reset-n-pins {
 		};
 	};
 
-	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
-		pins = "gpio188";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	usb1_pwr_1p8_reg_en: usb1-pwr-1p8-reg-en-state {
-		pins = "gpio175";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	usb1_pwr_3p3_reg_en: usb1-pwr-3p3-reg-en-state {
-		pins = "gpio186";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
 	usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
 		mode-pins {
 			pins = "gpio177";

-- 
2.48.1



