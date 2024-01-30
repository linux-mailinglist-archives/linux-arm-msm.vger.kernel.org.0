Return-Path: <linux-arm-msm+bounces-9097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C16842DD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 21:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9093928A5D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 20:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0CC78B70;
	Tue, 30 Jan 2024 20:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="SczYw9xJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-187.mta0.migadu.com (out-187.mta0.migadu.com [91.218.175.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D438D762EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 20:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706646488; cv=none; b=C3FbnRTqXfCR6cTL94/7AT/l9kU+tXAkIUPGVEL/SRTT4/xSImG8mW70laJQarAV8OfF2whF2yfUB6A80VZ7oGs6HDhA+ucNYEgeentk75cSdHf/hp+zyenvc50Z+x8OZcFmTgMyBR4gJzbYR20fAB9wRk0dSrdvywlR2liBErg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706646488; c=relaxed/simple;
	bh=O7J52DPIrE7Oy12cOq/hTpYx7w8Xbf9lXcXsC7ZnwJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NnsQC5CAZGhWxGouvD4LDKEGFyOfWh/sNuaT2+K/+XIEGMkN54l9zQxPPFZRPVgm1fG5/iXeFUIQ8PMvlQuzL5/SbzaDGWC2a1yen/gXIDIRhsdSmMY9nGpBHL9lGifdMkTl5yot3vn1AcZmEr7jz9T4OxJ+XXfpAtFUkiQzRIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=SczYw9xJ; arc=none smtp.client-ip=91.218.175.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1706646485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Ck8zt2HdoRVrChrqjQW7h2A5x3YqJ1hRCsTUEcHsKo=;
	b=SczYw9xJGEW2JliUBPe7g0cDPmM1uJs0n8PUnKxka+aai6TlaZoTZOtf2QCseQ+M/yOiWK
	DNznst/0gd52bP2FKbUjg4iHhgpmhGexkAmxARv3sxCwi7w5zslJa53tl2B1YgwmA9OSSm
	dqYxzzJPG5FZUnpAyyQleg3ttizG3lTqM/7x9Q1DYLK/AHzOwCm62HZRxe7tsHuF1sD9ZQ
	29ceUSm0i3+21X5TjDqmKOyL1Xk0K/acU65uUqOIONuHJXttWJvQGseDHTRE/4+lpGJJtw
	vss5hn8sC4tuldw1rqnSl3xXFic3LIACgkjLTL1rvgzE/Ako2qo8nt1k6a+eBQ==
From: Anton Bambura <jenneron@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/5] arm64: dts: qcom: sc8180x-lenovo-flex-5g: enable touchscreen
Date: Tue, 30 Jan 2024 22:27:53 +0200
Message-ID: <20240130202755.2289952-4-jenneron@postmarketos.org>
In-Reply-To: <20240130202755.2289952-1-jenneron@postmarketos.org>
References: <20240130202755.2289952-1-jenneron@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Set regulators, reset gpio and delays according to ACPI tables.

Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
---
 .../boot/dts/qcom/sc8180x-lenovo-flex-5g.dts  | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index af61acf58d68..8e8e1fca11c0 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -271,6 +271,12 @@ vreg_l3c_1p2: ldo3 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l4c_3p3: ldo4 {
+			regulator-min-microvolt = <3296000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l10c_3p3: ldo10 {
 			regulator-min-microvolt = <3000000>;
 			regulator-max-microvolt = <3312000>;
@@ -337,6 +343,12 @@ vreg_l10e_2p9: ldo10 {
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l12e_1p8: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l16e_3p0: ldo16 {
 			regulator-min-microvolt = <3072000>;
 			regulator-max-microvolt = <3072000>;
@@ -357,7 +369,7 @@ zap-shader {
 &i2c1 {
 	clock-frequency = <100000>;
 
-	pinctrl-0 = <&i2c1_active>, <&i2c1_hid_active>;
+	pinctrl-0 = <&i2c1_active>, <&i2c1_hid_active>, <&ts_reset>;
 	pinctrl-names = "default";
 
 	status = "okay";
@@ -365,9 +377,17 @@ &i2c1 {
 	touchscreen@10 {
 		compatible = "hid-over-i2c";
 		reg = <0x10>;
+
 		hid-descr-addr = <0x1>;
+		reset-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
+
+		vdd-supply = <&vreg_l4c_3p3>;
+		vddl-supply = <&vreg_l12e_1p8>;
 
-		interrupts-extended = <&tlmm 122 IRQ_TYPE_LEVEL_LOW>;
+		post-power-on-delay-ms = <3>;
+		post-reset-deassert-delay-ms = <200>;
+
+		interrupts-extended = <&tlmm 122 IRQ_TYPE_EDGE_FALLING>;
 	};
 };
 
@@ -718,6 +738,14 @@ wake-n-pins {
 		};
 	};
 
+	ts_reset: ts-reset-state {
+		pins = "gpio54";
+		function = "gpio";
+
+		bias-disable;
+		drive-strength = <16>;
+	};
+
 	usbprim_sbu_default: usbprim-sbu-state {
 		oe-n-pins {
 			pins = "gpio152";
-- 
2.42.0


