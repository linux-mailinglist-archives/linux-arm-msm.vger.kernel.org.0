Return-Path: <linux-arm-msm+bounces-61779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF27ADF8E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 23:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31A383BF8D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 21:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218A121CC48;
	Wed, 18 Jun 2025 21:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="RaDmgGbK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A431FBE80;
	Wed, 18 Jun 2025 21:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750283155; cv=none; b=UZFQbfg2hgN6YaY6O+MdRbwCSZ0DsRpX5RqwVbb3GDlYbi6rOdB+EDiJ9P/WrFXP1CV+b8qS1EQ+sQfVR5EskGpNrD7zQXC1s6TkVmzjGnemq0NEV4dFnR9UlQ/HSNN0TvjBORMc5VQhXomwrvbjCKC2zdoCnQZ5uHYqUQrDQtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750283155; c=relaxed/simple;
	bh=rnH3rE3Rl7r5mitRGMgRRL9AGeiM3uqXWWvgGLIGLfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZtRJwFmf4gA3syxolmFnS6GqnJeh0nL2/tuBsG/jEOGekIKNpXeg7qYBwF+7GajSY4VJMTU5RVaVfxBPBoRnznXgFpfkoxmE0htRUmJIfLe/anjJLg/ykneN6bQ+DOgkwwCOSc/vkzeld11Eqvk5cb1Q30WjuX544SpSSYnA404=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=RaDmgGbK; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1750283151; bh=rnH3rE3Rl7r5mitRGMgRRL9AGeiM3uqXWWvgGLIGLfk=;
	h=From:Date:Subject:To:Cc;
	b=RaDmgGbKW9nXmVC5qShFgjvRAdF2Pdh6ztvPkcLJANIUxGKVvv0OAkwZQksVoW/ZV
	 HYgRsNG1A38+Nbr3D5fD5DQMcZTQTYyMm+0uPpmR3lZKOfoNQ7y/DB/Yy9H81olY4y
	 49UzPvMXgwvngTVT+W6vIceR99r063Tmic2iLYUc=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Wed, 18 Jun 2025 23:45:44 +0200
Subject: [PATCH v2] ARM: dts: qcom: msm8974-samsung-hlte: Add touchkey
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-hlte-touchkey-v2-1-2cf188b57e31@lucaweiss.eu>
X-B4-Tracking: v=1; b=H4sIAIczU2gC/3XMyw6CMBCF4Vchs3ZMLxKsK9/DsKhlsBMJNS2gh
 PTdrexd/ic53waJIlOCS7VBpIUTh7GEOlTgvB0fhNyVBiVULU7SoB8mwinMzj9pxTNZ1evGisb
 UUD6vSD1/du/WlvacphDXnV/kb/0nLRIlms5op0ndteyvw+zsmzilI83Q5py/575u1a0AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2631; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=4RTcF4jhXLdqbx7OH71IWnZwd999TXwoC6vDZ1+Qcsc=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoUzOO59gKy0fQLQLm6+qhgjFlEDETlSgwHJyyV
 wI/iYQdKB6JAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaFMzjgAKCRBy2EO4nU3X
 VsXNEACQyeZsswMK4uUSxKN+2QM69Rzi2tMVdVZm+gc4FmKCVdS7aJDAjCK78BdCCMghPLX8Mq1
 pK2p92OEzWyQJTJUbIPYzoYnFbxj8EjIjNQ0D2lmxsHgO2OFqaQx/ScS6c+u42I39qiOxRSWI9l
 Dh4NTKjIDFdV7QYbVot5SMQPstkhxh3HLJVq3vZpBZD9DBF1krvyQ6tUcQIjijVAcWxHWyqBYwm
 0hWCjTWXjUOCK29KjPVFJvpkYkqIlROw+bTRikhPjdcKFLmNo990DNhsbaQadT/t4RWL4xxqSid
 AK1DoQDdQdjJMvC7HuBmZlKTONl/DlR4G53QXow6qZGziRkWtkdPL6M+cr31fl0R2KyRzFUKtXK
 mtfLKNH4aLB50rrpo3/qsB774tWZaten9yLz89DIAZO7On07lUoZmdv3wuh7O4FkJbiAd66bABS
 xQHET3zHnDUIOTRmRE9dyl/qxxdH7NMAobBpDi4H7/yGZZscv7mE6CDuBf6BL+32+unc6OhFfk4
 fmGhOnIm6RAZlP0F6qjQfKPRVAl9NPaF52Vqepo25Ul4uwMUmw9akTke/BJ8KPXYLx2j6o4sdcF
 QOR+Ou8kmYvsDDms9leJM+VpdOMB8mnJn8vwSnRUQlsoCcGKl6B5BrOmicZoxR5Da6WIBM9Pmtw
 7MJFq3/+AXEVyzA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Adam Honse <calcprogrammer1@gmail.com>

Add support for the touchkeys on the Samsung Galaxy Note 3 (hlte).

Signed-off-by: Adam Honse <calcprogrammer1@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v2:
- Fix schema validation failure, adjust i2c-gpio node name
- Fix misplaced S-o-b (hopefully)
- Link to v1: https://lore.kernel.org/r/20250419-hlte-touchkey-v1-1-9d93c3e2b31f@lucaweiss.eu
---
 .../boot/dts/qcom/qcom-msm8974-samsung-hlte.dts    | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
index 903bb4d125135771504281df50aa11c9b6576a28..b7a1367d3470551de12af699ef150434dc0302b8 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-samsung-hlte.dts
@@ -50,6 +50,34 @@ key-volume-up {
 		};
 	};
 
+	i2c-touchkey {
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
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250419-hlte-touchkey-8ea2f37a0795

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


