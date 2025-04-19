Return-Path: <linux-arm-msm+bounces-54800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0803A94284
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 11:08:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3EE33B8628
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 09:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E721B85F8;
	Sat, 19 Apr 2025 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="K+WSzLqB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3625026AF3;
	Sat, 19 Apr 2025 09:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053718; cv=none; b=EOBLv8RFxPROXHDO1y2qqU7GKL1mNisbdAQmnQH0CdnlbQotL9Vw298bjV/LDcjrSG9hOrngAafPAec12ecBC5tA/B+ZvFysWdrqL9rs/gBvKkoiBlfCHqzTb23uUy++eXDFsoH6s1qfknyxpucnaSib1ZHETPL5HhNvlgVOe2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053718; c=relaxed/simple;
	bh=ehHfcNOtPMRUL3VxNzC+BgtlgIzeCDFAQNWNOWeOses=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=j/i23RfM0QpzdfBZ46lc9DRbzb89ZdBBBc1elCAVFTQxRc33pIOf262YwAwUDIdvL+M/SbGUOX2x3DgadJMXUGpbJFOF02xpPDuz55+DskMFeExgWFV4TGzE2ukHg9BIDovHqr47RLD/wWeRPq5s+KxhnoK4hm2BPVElqYcxRIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=K+WSzLqB; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745053715; bh=ehHfcNOtPMRUL3VxNzC+BgtlgIzeCDFAQNWNOWeOses=;
	h=From:Date:Subject:To:Cc;
	b=K+WSzLqBP5c4HJiDTyUKiybiYnVrpcqeSciE5DqO8laQJ8BnVGReMHz8UzhrzYjnB
	 Slgzn6istQ/y+2zdpImtrxiAcoSRzT3lrfJqYScVc+V0MqugG7xAl2qrW3P6yNkmhy
	 Lmt3DdEoQq9cAt6IApOJdJXvHv26JeT1JtZh0Y/Y=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 19 Apr 2025 11:08:19 +0200
Subject: [PATCH] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu>
X-B4-Tracking: v=1; b=H4sIAAJoA2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0NL3YycklTdkvzS5Izs1Epdi9REozRj80QDc0tTJaCegqLUtMwKsHn
 RsbW1AO0xuyhfAAAA
X-Change-ID: 20250419-hlte-touchkey-8ea2f37a0795
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Adam Honse <calcprogrammer1@gmail.com>, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2430; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=S+LeAdx2W1POJ0Jw39CTYJpgFO9SBqkQhpjQtOXE8OY=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBoA2gG3hHEOlJmAMK5WsE41GJ50CiE167kIDxgy
 +CyBhSw77WJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaANoBgAKCRBy2EO4nU3X
 Vjl+D/4zGXk/SvZsfA7Hh3F2ivKEasejCuL21zcPScnLKyFHIlJjUfHp9aL7d/xgBF0sxQEHWdN
 kJ9hpvoVHdY4R/z+VpFAwT96u8eEx4aZb4ZTQL/B+AQVw2696e00C5g81lUvnXNJXp2NcUydh+X
 uJqx7YJOnKQ381RthSka6wZaHqLOi7Q8bsfgImFXZdcp2Hw/BRodPgvKnlKcIIw36YqidyJ/tYw
 4ghuUjZYGp4xtWQmd4quuqPdsETM0eYHIsgesFnWQrE0ccD32U3OAytXrjwv59iJyuC0hzuN1i3
 WLh1KSygCusXExtluj4pCSHTReSCVgvwJ1gHQGaHqkyUK7JOSdaopB+AsQqGSqe/Lp/PR2tNTqu
 Onhmxh8mYUj/WnZIkpe1LW/BqHd3fzB4RXxgcc7U/hTJJNcc5k0MubK0gKOu4/qvCacdUfRxcwv
 phUrReIRc8q5XkP2ajJqNhut+3NZcdO5Z7gEcUHhRtIUl3BOW3AU1uotejUBqILAiQiNNL+lE8O
 f5i2axyyG1dt9wuPf9iSm4lzt27WZXNm27wB8V2X3lf43ddl8zLTfscA1N7alOZtxIJkAuf4b/E
 cipz2Kl4nxyWJDO7Hvplf5RreSnLuLABncdZc5KWLY0E1zYa84Bmz8J8oZxZBCUX20YcGQU+byf
 LCUwXlKUVeLrAwA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Adam Honse <calcprogrammer1@gmail.com>

Add support for the touchkeys on the Samsung Galaxy Note 3 (hlte).

Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
---
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
index 903bb4d125135771504281df50aa11c9b6576a28..17d3e319941b8fd0363af600d93fc10127e4ab21 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
@@ -50,6 +50,34 @@ key-volume-up {
 		};
 	};
 
+	i2c-gpio-touchkey {
+		compatible = "i2c-gpio";
+
+		sda-gpios = <&tlmm 95 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 96 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+		pinctrl-0 = <&i2c_touchkey_pins>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		touchkey@20 {
+			compatible = "cypress,midas-touchkey";
+			reg = <0x20>;
+
+			interrupts-extended = <&pm8941_gpios 29 IRQ_TYPE_EDGE_FALLING>;
+
+			pinctrl-0 = <&touchkey_pin>;
+			pinctrl-names = "default";
+
+			vcc-supply = <&pm8941_lvs3>;
+			vdd-supply = <&pm8941_l13>;
+
+			linux,keycodes = <KEY_APPSELECT KEY_BACK>;
+		};
+	};
+
 	touch_ldo: regulator-touch {
 		compatible = "regulator-fixed";
 		regulator-name = "touch-ldo";
@@ -149,6 +177,14 @@ touch_ldo_pin: touchscreen-ldo-state {
 		power-source = <PM8941_GPIO_S3>;
 		qcom,drive-strength = <PMIC_GPIO_STRENGTH_HIGH>;
 	};
+
+	touchkey_pin: touchkey-int-state {
+		pins = "gpio29";
+		function = "normal";
+		bias-disable;
+		input-enable;
+		power-source = <PM8941_GPIO_S3>;
+	};
 };
 
 &remoteproc_adsp {
@@ -332,6 +368,9 @@ pm8941_l24: l24 {
 			regulator-min-microvolt = <3075000>;
 			regulator-max-microvolt = <3075000>;
 		};
+
+		pm8941_lvs1: lvs1 {};
+		pm8941_lvs3: lvs3 {};
 	};
 };
 
@@ -378,6 +417,12 @@ sdhc3_pin_a: sdhc3-pin-active-state {
 		drive-strength = <8>;
 		bias-disable;
 	};
+
+	i2c_touchkey_pins: i2c-touchkey-state {
+		pins = "gpio95", "gpio96";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &usb {

---
base-commit: 8ffd015db85fea3e15a77027fda6c02ced4d2444
change-id: 20250419-hlte-touchkey-8ea2f37a0795

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


