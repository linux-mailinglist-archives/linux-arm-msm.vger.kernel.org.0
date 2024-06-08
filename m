Return-Path: <linux-arm-msm+bounces-22133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 682BB90128E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 17:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08EB0282CCF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 15:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33C217BB37;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGxkhm4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C3617B508;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717862241; cv=none; b=ub/nxln4oXzocKLCm9NYgaFNtRte2hufr3rC8YSVRLKImFskN5RL0IvIjN1Bq5WYGQXDmAqi1K/Q7UWuI9QJ3hsp3XDGpl3TR9+lc0/zf4R4XLzR02OWgcalTw/mRotq1YWW+qCbTvq8u+XIZjD38srIAgeAIGtdDyd6K/jrAoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717862241; c=relaxed/simple;
	bh=mrE9CflCyD5JGJU45JpmcouGaGOztDkM/lJ4oalLK0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Frfs9URPqNh3cyDffZUYOaqJAoeBAMY9YjL/iKlQGnQhwtlchkNYiLoPXNQlCAX7QmZ3qf8T8u10BbMhCuaPoeaEGVTckJ80nEmmM2YHtcCx4TuymEGHdmlsmYhcvYnatOjQq3Z3E+u2pG01ppguYLxTJtReZBva4P4SZYqdkLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGxkhm4Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A95C4DE00;
	Sat,  8 Jun 2024 15:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717862241;
	bh=mrE9CflCyD5JGJU45JpmcouGaGOztDkM/lJ4oalLK0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oGxkhm4YIAttg9cFJNPyiFrl4ijOQsL6rfF0KwRw5jU1mDiWrWCwCzuCQrMoO5eaE
	 KPr+719Jx14U6SK4/vpnlrNvSRKI0alg300+P0XM2WSWT9vqWub/6aylm0OC417psp
	 e/ymxXVIA+KtjVcZJibDuxcoHWwS9Fw1IHS+ilwdYLA12NrytGF2P/dRN1UsUb8WAK
	 vs8uKTH5q4fzREncAidWEFyuc+BnC5d/3xdzooIPSL8He+WJlqmMkzcoRyAxWKHUyO
	 ZUXo1lItASsMG+zMOszCVF5WpzKnacEjd7AxbVAq968ue+LF6Lx7eqIO1fU4zC2yPW
	 z3dfc2F9xjNkQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sFyRU-000000003QN-2Rhf;
	Sat, 08 Jun 2024 17:57:20 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v3 12/12] arm64: dts: qcom: sc8280xp-x13s: enable pm8008 camera pmic
Date: Sat,  8 Jun 2024 17:55:26 +0200
Message-ID: <20240608155526.12996-13-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240608155526.12996-1-johan+linaro@kernel.org>
References: <20240608155526.12996-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the PM8008 PMIC which is used to power the camera sensors.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 642705b7d896..daca6bd2e34c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -297,6 +297,27 @@ linux,cma {
 	};
 
 	thermal-zones {
+		pm8008-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+
+			thermal-sensors = <&pm8008>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
 		skin-temp-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <0>;
@@ -671,6 +692,85 @@ touchscreen@10 {
 	};
 };
 
+&i2c11 {
+	clock-frequency = <400000>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c11_default>;
+
+	status = "okay";
+
+	pm8008: pmic@c {
+		compatible = "qcom,pm8008";
+		reg = <0xc>;
+
+		interrupts-extended = <&tlmm 41 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&vreg_s11b>;
+		vdd-l3-l4-supply = <&vreg_bob>;
+		vdd-l5-supply = <&vreg_bob>;
+		vdd-l6-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_bob>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pm8008_default>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8008 0 0 2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		#thermal-sensor-cells = <0>;
+
+		regulators {
+			vreg_l1q: ldo1 {
+				regulator-name = "vreg_l1q";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l2q: ldo2 {
+				regulator-name = "vreg_l2q";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l3q: ldo3 {
+				regulator-name = "vreg_l3q";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l4q: ldo4 {
+				regulator-name = "vreg_l4q";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l5q: ldo5 {
+				regulator-name = "vreg_l5q";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l6q: ldo6 {
+				regulator-name = "vreg_l6q";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l7q: ldo7 {
+				regulator-name = "vreg_l7q";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+		};
+	};
+};
+
 &i2c21 {
 	clock-frequency = <400000>;
 
@@ -1361,6 +1461,13 @@ i2c4_default: i2c4-default-state {
 		bias-disable;
 	};
 
+	i2c11_default: i2c11-default-state {
+		pins = "gpio18", "gpio19";
+		function = "qup11";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	i2c21_default: i2c21-default-state {
 		pins = "gpio81", "gpio82";
 		function = "qup21";
@@ -1464,6 +1571,22 @@ wake-n-pins {
 		};
 	};
 
+	pm8008_default: pm8008-default-state {
+		int-pins {
+			pins = "gpio41";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-down;
+		};
+
+		reset-n-pins {
+			pins = "gpio42";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	spkr_1_sd_n_default: spkr-1-sd-n-default-state {
 		perst-n-pins {
 			pins = "gpio178";
-- 
2.44.1


