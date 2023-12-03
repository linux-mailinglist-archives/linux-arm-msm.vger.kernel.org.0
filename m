Return-Path: <linux-arm-msm+bounces-3143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2387802470
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 15:19:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 503911F20FAB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 14:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077EB13FF4;
	Sun,  3 Dec 2023 14:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=z3ntu.xyz header.i=@z3ntu.xyz header.b="Da6LsnHK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 313B5FA;
	Sun,  3 Dec 2023 06:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=s1;
	t=1701613175; bh=zG1QlBY918k0cqDNZJiK3uWxGAzr0xCzGr1cWRkdLA4=;
	h=From:Date:Subject:To:Cc;
	b=Da6LsnHK7v6Halu26lJ10J8D8lS3Zq0vlMO3ScFXGj8U4ObKw8+3xfDM25rMy7Tfh
	 hmadtT5G/lEfzbiXUqkn3WkuBaDSIPRpiJYDyCW22qTwgrp29b4e/lAwnYm1KD1sZf
	 KFgN+MhZ4eiDEjWxT2ZX6/Myb4XcuAKnJkhZA2iM=
From: Luca Weiss <luca@z3ntu.xyz>
Date: Sun, 03 Dec 2023 15:19:18 +0100
Subject: [PATCH] ARM: dts: qcom: Disable pm8941 & pm8226 smbb charger by
 default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231203-smbb-pm8941-pm8226-v1-1-9ad75909604b@z3ntu.xyz>
X-B4-Tracking: v=1; b=H4sIAGWObGUC/x2MQQqAIBAAvxJ7TtA1TPtKdLDaag9aKEQQ/T3rN
 Mxh5oZMiSlDV92Q6OTMeyyi6gqmzceVBM/FASVqhVKLHMZRHMG6Rn1ANMJN5OdWaYPWQwmPRAt
 f/7QfnucFwEEPImQAAAA=
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryant Mairs <bryant@mai.rs>, 
 Luca Weiss <luca@z3ntu.xyz>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6633; i=luca@z3ntu.xyz;
 h=from:subject:message-id; bh=Jjda69uIJewreP8b7act6A6XqbWWoTpW68t9pfVJZuI=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBlbI5qzJPA1+NyNWogHqHuPmQC+gcn6l916Wga9
 6IQHoDf/QyJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZWyOagAKCRBy2EO4nU3X
 VqOJD/9f1qNhZAEwfInHziEJpqmZX2q5EB50sTwcvUr1N7i4u01q8VqrJGuu6jXQm6zIFyjFOHu
 vg4kUJp1r2gJkg50iZU0uDpdmUJpxQ/opmUPpHlYvPw/BZ9s1PY9F/M+l8CNon/rMOREPHA/Kzj
 zpwrZ7wA5baoAtRWkSOImrbmEd/IPaBq+iaH2Celcar9G0X4sDUIgavJD0qA8jsBxyo82csZFs5
 bKZtDkHT6/vhZ3EclV79bqFSAeXBuW6V3FwaqMpFIBnoJ7JDzPHcxpzjVeAX451wTtKPJxGq+7A
 ZDiSaShCFZDq2kxPinJxdwhRcacIAPhClU9hECOS0UyuwDYQ6mkQ/euz48tOHBW5Quo0q81nyJK
 BHauowsRak5NHvghPAyLHKgykzsGIQqu3NLYSk820NrOcSOZf4P1U88b+hipb38+Jk3yYjDmUr9
 dyRUaR6VGlm3ZNxuit7l5EOBxUCGX5jY102aZksudfau9NkyhkK0URftSGvJd3yKBsyYgi3V6FH
 KmK8O9Gjw9uJV7w/dFfh+kGZjgECwWCpR+b+HnV6la3rLr3rXKkTuZ6YyRv0q06RLatZYX6Qaut
 0HQr5JEOx/+YEQbAf0PHHd+dha46wdI0Jcm15ozmkrYZXQIR6+toDTDTuGl8JBruNvIEqIS0/bV
 1rAUHJOKsIf8Q1Q==
X-Developer-Key: i=luca@z3ntu.xyz; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Bryant Mairs <bryant@mai.rs>

Some platforms don't use the built-in charging hardware (e.g. milletwifi).
As this is an optional peripheral, default it to off.

Keep it enabled for all other boards that use smbb.

Signed-off-by: Bryant Mairs <bryant@mai.rs>
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm/boot/dts/qcom/pm8226.dtsi                                    | 2 ++
 arch/arm/boot/dts/qcom/pm8941.dtsi                                    | 2 ++
 arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts                  | 2 ++
 arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts               | 2 ++
 arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts                      | 2 ++
 arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts                   | 4 ++++
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts                     | 2 ++
 arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi            | 2 ++
 arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts              | 2 ++
 arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts              | 4 ++++
 arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts | 2 ++
 11 files changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/pm8226.dtsi b/arch/arm/boot/dts/qcom/pm8226.dtsi
index 2413778f3715..2fd4f135ed84 100644
--- a/arch/arm/boot/dts/qcom/pm8226.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8226.dtsi
@@ -82,6 +82,8 @@ smbb: charger@1000 {
 					  "usb-valid",
 					  "dc-valid";
 
+			status = "disabled";
+
 			chg_otg: otg-vbus { };
 		};
 
diff --git a/arch/arm/boot/dts/qcom/pm8941.dtsi b/arch/arm/boot/dts/qcom/pm8941.dtsi
index ed0ba591c755..aca0052a02b7 100644
--- a/arch/arm/boot/dts/qcom/pm8941.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8941.dtsi
@@ -99,6 +99,8 @@ smbb: charger@1000 {
 
 			usb-otg-in-supply = <&pm8941_5vs1>;
 
+			status = "disabled";
+
 			chg_otg: otg-vbus { };
 		};
 
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
index a39f5a161b03..a2ca456012f1 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dts
@@ -253,6 +253,8 @@ &smbb {
 	qcom,fast-charge-high-threshold-voltage = <4400000>;
 	qcom,auto-recharge-threshold-voltage = <4300000>;
 	qcom,minimum-input-voltage = <4400000>;
+
+	status = "okay";
 };
 
 &tlmm {
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts
index 59b218042d32..ac228965a485 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts
@@ -335,6 +335,8 @@ &smbb {
 	qcom,fast-charge-current-limit = <300000>;
 	qcom,fast-charge-safe-current = <600000>;
 	qcom,auto-recharge-threshold-voltage = <4240000>;
+
+	status = "okay";
 };
 
 &tlmm {
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts b/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
index feb78afef3a6..0a1fd5eb3c6d 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts
@@ -292,6 +292,8 @@ &smbb {
 	qcom,fast-charge-high-threshold-voltage = <4350000>;
 	qcom,auto-recharge-threshold-voltage = <4240000>;
 	qcom,minimum-input-voltage = <4450000>;
+
+	status = "okay";
 };
 
 &tlmm {
diff --git a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
index d7fb3e0e8886..6fce0112361f 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
@@ -430,6 +430,10 @@ &sdhc_2 {
 	pinctrl-1 = <&sdc2_off>;
 };
 
+&smbb {
+	status = "okay";
+};
+
 &tlmm {
 	sdc1_on: sdc1-on-state {
 		clk-pins {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
index 9e90330a6231..ed328b24335f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts
@@ -355,6 +355,8 @@ &smbb {
 	qcom,fast-charge-high-threshold-voltage = <4350000>;
 	qcom,auto-recharge-threshold-voltage = <4300000>;
 	qcom,minimum-input-voltage = <4300000>;
+
+	status = "okay";
 };
 
 &usb {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
index a43341ae4495..94cbad81379f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -452,6 +452,8 @@ &smbb {
 	qcom,fast-charge-low-threshold-voltage = <3400000>;
 	qcom,auto-recharge-threshold-voltage = <4200000>;
 	qcom,minimum-input-voltage = <4300000>;
+
+	status = "okay";
 };
 
 &tlmm {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
index 66c422004dcd..fe227fd3f908 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
@@ -408,6 +408,8 @@ &smbb {
 	qcom,fast-charge-high-threshold-voltage = <4350000>;
 	qcom,auto-recharge-threshold-voltage = <4240000>;
 	qcom,minimum-input-voltage = <4450000>;
+
+	status = "okay";
 };
 
 &tlmm {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
index 6d1412aec45a..4c8edadea0ac 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
@@ -460,6 +460,10 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&smbb {
+	status = "okay";
+};
+
 &tlmm {
 	gpio_hall_sensor_default: gpio-hall-sensor-default-state {
 		pins = "gpio68";
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index 818ff5835031..7c6fe442b559 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -585,6 +585,8 @@ &smbb {
 	qcom,fast-charge-low-threshold-voltage = <3400000>;
 	qcom,auto-recharge-threshold-voltage = <4200000>;
 	qcom,minimum-input-voltage = <4300000>;
+
+	status = "okay";
 };
 
 &tlmm {

---
base-commit: fe14587be497254eb07c5c8aa1c799bde2abce39
change-id: 20231203-smbb-pm8941-pm8226-9cead713628a

Best regards,
-- 
Luca Weiss <luca@z3ntu.xyz>


