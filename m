Return-Path: <linux-arm-msm+bounces-65086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA3FB0666E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 21:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F7E57A60D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 19:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7372286D4E;
	Tue, 15 Jul 2025 19:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b="KhWxC4i8";
	dkim=permerror (0-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b="ezLGlsE2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.adomerle.pw (mail.adomerle.pw [185.125.100.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A3222127C;
	Tue, 15 Jul 2025 19:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.100.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752606273; cv=none; b=prqhqBpouzJzxNY2Al9KOPbZhQDPyw3Zj6ZNLOH8pKFFZBEtulL3s5BP6j12JXUpqIoMy5Poz81qKQqDE22sNB8TLrLfUjcbTNJNxsGLbbIKQTHSt0TwqXXwa5ViklM/YfutUCuhtwK79EZtp3UOJXMDpUyLHGCrQjjHIf/83Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752606273; c=relaxed/simple;
	bh=YUV3YeM4Fq4QGG1zN0G74X85uF0zGrKZ+k1T1UgOveo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FLSK8vcI9Ax5wmkPUZjb9nWpacyIfLV3/iN2JGkC0EOiV+e+AykEVau/F3Q4nLbndfakgEf201+gCprXlgZVaM08nqTAxwfG2osVVS2TPGTHh7s9DLmReSRcAX5S2Wn32thkD7Y6sS9y5XILNmYzccwqBjr1FHKRylpwBmw302Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adomerle.pw; spf=pass smtp.mailfrom=adomerle.pw; dkim=pass (2048-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b=KhWxC4i8; dkim=permerror (0-bit key) header.d=adomerle.pw header.i=@adomerle.pw header.b=ezLGlsE2; arc=none smtp.client-ip=185.125.100.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adomerle.pw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adomerle.pw
DKIM-Signature: v=1; a=rsa-sha256; s=202506r; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752606124; bh=Uez8y4uGRauT1BDCWYyBz3C
	LJ0UDoRN9JzPNvvO6Okw=; b=KhWxC4i88j6SCVmszanPtKlC0VjDFT6G+HzHQWF34HmnaZmHTN
	EHhLk0zOXOC8nP/+K0d7yN+O5o0HlZpZEeDBfuB2DeEihOkNg7e6gm/8Q3xjSCpB8EEusVAYwRQ
	h0r7OhNhD634kmi8c01uLYZhs9yDIWYGgBN7lOy2Drt3/rmsae0aDUrV/xg5u8d/Zf8MGZ+ktIZ
	Mcf08KzJtAmiJpYJyBLZ8C01tRexd8b2jSkhxpAESk/tEoaimKCFXghHh6LByXbx7u2szcunB4x
	xAIrm5qDeWeBz4KOzqlw0HAUX5DGEefVksClW0gix293CRiMj+E6HxW/cXw5Cs+rgRg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202506e; d=adomerle.pw; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1752606124; bh=Uez8y4uGRauT1BDCWYyBz3C
	LJ0UDoRN9JzPNvvO6Okw=; b=ezLGlsE2AmAZqMfTkfIPk5WYQf1aCT5QPlsAfT55HVJZzU56JV
	RZxT2CXPmSuBLbNgQJhadE6qazGj7A1XFQAg==;
From: Arseniy Velikanov <me@adomerle.pw>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luka Panio <lukapanio@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Arseniy Velikanov <me@adomerle.pw>
Subject: [PATCH v1] arm64: dts: qcom: sm8250-xiaomi-pipa: Drop nonexistent hardware
Date: Tue, 15 Jul 2025 22:56:36 +0400
Message-ID: <20250715185636.21758-1-me@adomerle.pw>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PM8009 was erroneously added since this device doesn't actually have it.
It triggers a big critical error at boot, so we're drop it.

Also it looks like the fuel gauge is not connected to the battery,
it reports nonsense info. Downstream kernel uses pmic fg.

PMIC fuel-gauge driver uses mixed stats about dual-cell battery,
so I combined it into one.

Fixes: 264beb3cbd0d ("arm64: dts: qcom: sm8250-xiaomi-pipa: Add initial device tree")

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
---
 .../boot/dts/qcom/sm8250-xiaomi-pipa.dts      | 95 +------------------
 1 file changed, 5 insertions(+), 90 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
index 668078ea4f04..b74c3c9b4076 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
@@ -50,18 +50,12 @@ framebuffer: framebuffer@9c000000 {
 		};
 	};
 
-	battery_l: battery-l {
+	battery: battery {
 		compatible = "simple-battery";
-		voltage-min-design-microvolt = <3870000>;
-		energy-full-design-microwatt-hours = <16700000>;
-		charge-full-design-microamp-hours = <4420000>;
-	};
-
-	battery_r: battery-r {
-		compatible = "simple-battery";
-		voltage-min-design-microvolt = <3870000>;
-		energy-full-design-microwatt-hours = <16700000>;
-		charge-full-design-microamp-hours = <4420000>;
+		charge-full-design-microamp-hours = <8840000>;
+		energy-full-design-microwatt-hours = <34300000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4370000>;
 	};
 
 	bl_vddpos_5p5: bl-vddpos-regulator {
@@ -406,63 +400,6 @@ vreg_l11c_3p0: ldo11 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
-
-	regulators-2 {
-		compatible = "qcom,pm8009-rpmh-regulators";
-		qcom,pmic-id = "f";
-
-		vdd-s1-supply = <&vph_pwr>;
-		vdd-s2-supply = <&vreg_bob>;
-		vdd-l2-supply = <&vreg_s8c_1p35>;
-		vdd-l5-l6-supply = <&vreg_bob>;
-		vdd-l7-supply = <&vreg_s4a_1p8>;
-
-		vreg_s1f_1p2: smps1 {
-			regulator-name = "vreg_s1f_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1300000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s2f_0p5: smps2 {
-			regulator-name = "vreg_s2f_0p5";
-			regulator-min-microvolt = <512000>;
-			regulator-max-microvolt = <1100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		/* L1 is unused. */
-
-		vreg_l2f_1p3: ldo2 {
-			regulator-name = "vreg_l2f_1p3";
-			regulator-min-microvolt = <1056000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		/* L3 & L4 are unused. */
-
-		vreg_l5f_2p8: ldo5 {
-			regulator-name = "vreg_l5f_2p85";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l6f_2p8: ldo6 {
-			regulator-name = "vreg_l6f_2p8";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7f_1p8: ldo7 {
-			regulator-name = "vreg_l7f_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
 };
 
 &cdsp {
@@ -495,17 +432,6 @@ zap-shader {
 	};
 };
 
-&i2c0 {
-	clock-frequency = <400000>;
-	status = "okay";
-
-	fuel-gauge@55 {
-		compatible = "ti,bq27z561";
-		reg = <0x55>;
-		monitored-battery = <&battery_r>;
-	};
-};
-
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -523,17 +449,6 @@ backlight: backlight@11 {
 	};
 };
 
-&i2c13 {
-	clock-frequency = <400000>;
-	status = "okay";
-
-	fuel-gauge@55 {
-		compatible = "ti,bq27z561";
-		reg = <0x55>;
-		monitored-battery = <&battery_l>;
-	};
-};
-
 &pcie0 {
 	status = "okay";
 };
-- 
2.50.0


