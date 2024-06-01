Return-Path: <linux-arm-msm+bounces-21376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D43868D6F97
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 13:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F886282A59
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2024 11:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E153E150999;
	Sat,  1 Jun 2024 11:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="DUcjn+J5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440DA14F9DD;
	Sat,  1 Jun 2024 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717242850; cv=none; b=CsbZCwVOBgASTcNsYJ+3BTgg7jXysMGnFj6ORIQ7yB6/82R87pXOm/Qitb8IcCD/ndtNiuM+d0mFB6I7qs+0JNvDuHBWmtydfkQixAMpsQDwo+a9lY0yRwSYOWhAInE6Lw8GgrTgKzz8RkDsP2dv54LsA6ZrnPVFh27wLbbQ72o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717242850; c=relaxed/simple;
	bh=rTGNR1gjpqxgwEbWGFTcY+0ou57HsU3yOk3rGq/T+XQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T+CWzkuPdsU2p/OQ/7Pt1VTN2/nCmlnskzBGEwOM2ajQs5bl2pyhXJ+9jk957fvv+iT37yZVJnNcL4HvuOieIyXvCrtB+5Q8EXg/Wx3BOzcL16usF8j7Tc0PhhHsdMPYpmxUd0/E01xNBAtx2nuxp6071OSPRERRQYOJs79hIz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=DUcjn+J5; arc=none smtp.client-ip=185.70.43.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1717242841; x=1717502041;
	bh=ZQZES2BbNvBUeOffC7dAFTAqf4ZRcVbqy7kUlYlzRxU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DUcjn+J5bQOBpjzJPFGbK93HK4b50ocPdOIVe+MusH+LuPmCJCgaigQ5FBeZWIpdA
	 F7zzQY57BSZ/+vSQfzJEvFij47CP5AtE7q/WGyeqIvMhTrnRl2moOxgtddnymFgb4c
	 Ckud5tH8LTR970qlCotng7fgS1xOmdRGKb8Ka2WEBkQ/f7aBeIDfCWdVPD4jVyOEPc
	 jBrb0N/sthOuiKduH8lAW9G21Op0mxBHnDFA407j5JrQZH6a5QNWyhZStE3wgOoNUf
	 cgSIP5ua6apXFTjaRLMdtGpaunqCrC/v1aspx3lPxQxBk/IZ/CMASVys161GAEwrHi
	 pBdAeK+1N8y1A==
Date: Sat, 01 Jun 2024 11:53:57 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Siddharth Manthan <siddharth.manthan@gmail.com>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Joe Mason <buddyjojo06@outlook.com>
Subject: [PATCH 1/3] arm64: dts: qcom: msm8916-samsung-gprimeltecan: Add NFC
Message-ID: <20240601115321.25314-2-raymondhackley@protonmail.com>
In-Reply-To: <20240601115321.25314-1-raymondhackley@protonmail.com>
References: <20240601115321.25314-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: fcf6c71ce66daa31f8cf29645cd200c4b361e6b1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Joe Mason <buddyjojo06@outlook.com>

The Samsung Galaxy Grand Prime CAN has a Samsung S3FWRN5 NFC chip that
works quite well with the s3fwrn5 driver in the Linux NFC subsystem.

The clock setup for the NFC chip is a bit special (although this
seems to be a common approach used for Qualcomm devices with NFC):

The NFC chip has an output GPIO that is asserted whenever the clock
is needed to function properly. On the A3/A5 this is wired up to
PM8916 GPIO2, which is then configured with a special function
(NFC_CLK_REQ or BB_CLK2_REQ).

Enabling the rpmcc RPM_SMD_BB_CLK2_PIN clock will then instruct
PM8916 to automatically enable the clock whenever the NFC chip
requests it. The advantage is that the clock is only enabled when
needed and we don't need to manage it ourselves from the NFC driver.

Signed-off-by: Joe Mason <buddyjojo06@outlook.com>
[Stephan: Put NFC pinctrl into common dtsi to share it with other variants]
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
[Raymond: Use interrupts-extended. Keep &blsp_i2c6 enabled by default]
Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 .../qcom/msm8916-samsung-fortuna-common.dtsi  | 38 +++++++++++++++++++
 .../dts/qcom/msm8916-samsung-gprimeltecan.dts | 17 +++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi b=
/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
index 4f05cae68b37..4cc83b64e256 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
=20
 / {
 =09aliases {
@@ -227,6 +228,10 @@ touchscreen: touchscreen@20 {
 =09};
 };
=20
+&blsp_i2c6 {
+=09status =3D "okay";
+};
+
 &blsp_uart2 {
 =09status =3D "okay";
 };
@@ -346,6 +351,29 @@ muic_int_default: muic-int-default-state {
 =09=09bias-disable;
 =09};
=20
+=09nfc_default: nfc-default-state {
+=09=09irq-pins {
+=09=09=09pins =3D "gpio21";
+=09=09=09function =3D "gpio";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-pull-down;
+=09=09};
+
+=09=09nfc-pins {
+=09=09=09pins =3D "gpio20", "gpio49";
+=09=09=09function =3D "gpio";
+=09=09=09drive-strength =3D <2>;
+=09=09=09bias-disable;
+=09=09};
+=09};
+
+=09nfc_i2c_default: nfc-i2c-default-state {
+=09=09pins =3D "gpio0", "gpio1";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
 =09sdc2_cd_default: sdc2-cd-default-state {
 =09=09pins =3D "gpio38";
 =09=09function =3D "gpio";
@@ -367,3 +395,13 @@ tsp_int_default: tsp-int-default-state {
 =09=09bias-disable;
 =09};
 };
+
+&pm8916_gpios {
+=09nfc_clk_req: nfc-clk-req-state {
+=09=09pins =3D "gpio2";
+=09=09function =3D "func1";
+=09=09power-source =3D <PM8916_GPIO_L2>;
+=09=09bias-disable;
+=09=09input-enable;
+=09};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts b/ar=
ch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
index 4dc74e8bf1d8..7ac86fd3c703 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
@@ -29,6 +29,23 @@ &bosch_magn {
 =09status =3D "okay";
 };
=20
+&blsp_i2c6 {
+=09nfc@27 {
+=09=09compatible =3D "samsung,s3fwrn5-i2c";
+=09=09reg =3D <0x27>;
+
+=09=09interrupts-extended =3D <&tlmm 21 IRQ_TYPE_EDGE_RISING>;
+
+=09=09en-gpios =3D <&tlmm 20 GPIO_ACTIVE_HIGH>;
+=09=09wake-gpios =3D <&tlmm 49 GPIO_ACTIVE_HIGH>;
+
+=09=09clocks =3D <&rpmcc RPM_SMD_BB_CLK2_PIN>;
+
+=09=09pinctrl-0 =3D <&nfc_default>, <&nfc_clk_req>;
+=09=09pinctrl-names =3D "default";
+=09};
+};
+
 &mpss_mem {
 =09/* Firmware for gprimeltecan needs more space */
 =09reg =3D <0x0 0x86800000 0x0 0x5400000>;
--=20
2.39.2



