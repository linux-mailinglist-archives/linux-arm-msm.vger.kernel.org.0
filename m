Return-Path: <linux-arm-msm+bounces-92164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFluLw7/iGkY0QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:24:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D80F10A331
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 22:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 650EA3001477
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 21:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC7934A3AC;
	Sun,  8 Feb 2026 21:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7T3Pvnq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9AD248F5A;
	Sun,  8 Feb 2026 21:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770585868; cv=none; b=J0E/rtpdF8QTPdZVQX+bmGC7VO/mmDW5Nu4GbceRe68jpYZeT/KKkgjFuRciCfVTNb1AXtKC2ARqLkH7EpUyi3pkLnFmCDA1Bog81z7RYv882tWLAtA+nK+K4GIwgc1UuerqNd5eVrm/foQkeTuBH80H/cu2eZW2XIFeZMdCL6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770585868; c=relaxed/simple;
	bh=3IJy81RzZhoLUFLAjVQt3bGniMa7XC8oSFJTkR7zy9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tIEujKfIC791OgoF/sEr2IvOtCjVMgtJbixNfANp45gXjBTA3FYSA+aVivNQkvnK4Zbz7QOoYs7BHkRDCDZRBKDHvyyeUAPL2CZ7irkwqChr9e8BCU2sXHFYNypupSKUcJWhZ8CtumGTEPAa4wM1WN+QvxU6MIm1EQDU88BnDSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7T3Pvnq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF5E8C4CEF7;
	Sun,  8 Feb 2026 21:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770585867;
	bh=3IJy81RzZhoLUFLAjVQt3bGniMa7XC8oSFJTkR7zy9k=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=G7T3Pvnqo+/MsaLK6vQjIcGNSaBoyARESbefHe/6IBeqcy+sEf1k2J2PhOuROdvqk
	 WG0PGvGhDYWr+dVHRNAJTy7mXrwT6hiASds8VF7+breixLt+Sl7ghqe7IXR+8rVQLX
	 nGEa+RU8vgQwhjexboPGQGkOGYHRetaQ7XrDBprl57qRkfVfx7VETqvFAxxa60+e4Q
	 Cd/7M74whpcq52mxCZMvvpQOIK0E+BQLDzT2y0NLJqA3v5887vft/aw5tG1YIMQDdQ
	 emAiVDmQnOLYQ1Ap32LM4w9bG9/+WPKGKiHNDuabtLwr74molveOaik6XmcfZgxJJ/
	 L+uRw9BnGHNaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E8CEF06E2;
	Sun,  8 Feb 2026 21:24:27 +0000 (UTC)
From: Yedaya Katsman via B4 Relay <devnull+yedaya.ka.gmail.com@kernel.org>
Date: Sun, 08 Feb 2026 23:24:23 +0200
Subject: [PATCH v5] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add
 Focaltech FT3518 touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260208-touchscreen-patches-v5-1-5821dff9c9a2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NywqDMBCF4VeRrJuSTBKrXfU9She5jDVQLyRWW
 sR3b3QlIl3+B+abiUQMHiO5ZhMJOProuzaFOmXE1rp9IvUuNQEGOeNc0KF72zragNjSXg+2xkg
 NGlCQG6cqQ9JlH7Dyn1W9P1LXPg5d+K5PRr6s/72RU0Y1Z6W6VAKcK27PRvvX2XYNWbwRtoY8N
 iAZEriqSmkLbfTeEFujODZEMrjN9QVKq9DIvSE3BrBjQyZDMC6V06XLndga8zz/ADzwCLGCAQA
 A
X-Change-ID: 20260113-touchscreen-patches-beb2526bd5fb
To: =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770585866; l=4549;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=uLRuSW3FC71D/g2v0anek3bfb3SM5Go5/FJtCdtd5IE=;
 b=mQa7ISvungOxBQDzqmmXfERfev6zdun29Y6R+kimhVMkciPeBpHc9CH1u1ruIThgIPQBcaIzN
 nY4HS5FZByIAvMKCNVACNwhVG2xLO/Vh/7pP3JHW6VYZsNdbo2DQjgA
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Endpoint-Received: by B4 Relay for yedaya.ka@gmail.com/20260113 with
 auth_id=601
X-Original-From: Yedaya Katsman <yedaya.ka@gmail.com>
Reply-To: yedaya.ka@gmail.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92164-lists,linux-arm-msm=lfdr.de,yedaya.ka.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[protonmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[yedaya.ka@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.38:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email]
X-Rspamd-Queue-Id: 5D80F10A331
X-Rspamd-Action: no action

From: Yedaya Katsman <yedaya.ka@gmail.com>

Add device tree node for the Focaltech FT3518 touchscreen on
Xiaomi Mi A3 (laurel-sprout).

Enable qupv3_id_0 and i2c2 bus that the touchscreen is on.

Downstream references:
Link: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/laurel-r-oss/arch/arm64/boot/dts/qcom/trinket-pinctrl.dtsi
Link: https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/laurel-r-oss/arch/arm64/boot/dts/qcom/laurel_sprout-qrd.dtsi

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Adds support for the touchscreen in the Xiaomi Mi A3 (xiaomi-laurel)
 smartphone, FocalTech FT3518

Original tree was here:
 Link: https://gitlab.postmarketos.org/SzczurekYT/linux/-/commits/laurel
---
Changes in v5:
- Add pin config for ts vdd
- Reorder some properties
- Drop applied patches
- Link to v4: https://lore.kernel.org/r/20260120-touchscreen-patches-v4-0-30145da9d6d3@gmail.com

Changes in v4:
- Follow dts coding style for pinctrl nodes
- Don't refrence touchscreen "release" gpio config
- Link to v3: https://lore.kernel.org/r/20260118-touchscreen-patches-v3-0-1c6a729c5eb4@gmail.com

Changes in v3:
- Rename regulator node and reorder nodes
- Add gpio pin configuration for pmx_ts_* in sm6125, and reference in the
  touchscreen configuration as pinctrl-*. Doesn't have configuration for
  the gpio 83 pin since it isn't documented downstream.
- Link to v2: https://lore.kernel.org/r/20260114-touchscreen-patches-v2-0-4215f94c8aba@gmail.com

Changes in v2:
- Fixed name and email in signoffs
- Link to v1: https://lore.kernel.org/r/20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com
---
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 994fb0412fcbdf5466f87a325c48b697a37b514b..97f64cb5d570e018ef666612f3839c4e6759ac7b 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -82,6 +82,19 @@ key-volume-up {
 		};
 	};
 
+	ts_vdd_supply: regulator-ts-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "ts_vdd_supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <70000>;
+
+		enable-active-high;
+		gpio = <&tlmm 83 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&ts_vdd_en>;
+		pinctrl-names = "default";
+	};
+
 	thermal-zones {
 		rf-pa0-thermal {
 			thermal-sensors = <&pm6125_adc_tm 0>;
@@ -128,6 +141,27 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&i2c2 {
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "focaltech,ft3518";
+		reg = <0x38>;
+		interrupts-extended = <&tlmm 88 IRQ_TYPE_EDGE_FALLING>;
+
+		vcc-supply = <&ts_vdd_supply>;
+
+		pinctrl-0 = <&ts_int_active &ts_reset_active>;
+		pinctrl-1 = <&ts_int_suspend &ts_reset_suspend>;
+		pinctrl-names = "default","sleep";
+
+		reset-gpios = <&tlmm 87 GPIO_ACTIVE_LOW>;
+
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1560>;
+	};
+};
+
 &pm6125_adc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&camera_flash_therm &emmc_ufs_therm>;
@@ -220,6 +254,10 @@ &pon_resin {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators-0 {
 		compatible = "qcom,rpm-pm6125-regulators";
@@ -387,6 +425,41 @@ &sdhc_2 {
 
 &tlmm {
 	gpio-reserved-ranges = <22 2>, <28 6>;
+
+	ts_vdd_en: ts-vdd-default-state {
+		pins = "gpio83";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	ts_reset_active: pmx-ts-reset-active-state {
+		pins = "gpio87";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_reset_suspend: pmx-ts-reset-suspend-state {
+		pins = "gpio87";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	ts_int_active: pmx-ts-int-active-state {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+
+	ts_int_suspend: pmx-ts-int-suspend-state {
+		pins = "gpio88";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &ufs_mem_hc {

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260113-touchscreen-patches-beb2526bd5fb

Best regards,
-- 
Yedaya Katsman <yedaya.ka@gmail.com>



