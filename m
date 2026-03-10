Return-Path: <linux-arm-msm+bounces-96740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJoQJRdUsGmBiAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 18:25:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1189F255883
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 18:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9091130BF15E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 579CE3D0935;
	Tue, 10 Mar 2026 17:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="CeN1hLKR";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="U7ABnPng"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE563D47A9;
	Tue, 10 Mar 2026 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773163315; cv=none; b=cOHM0pCWpiMdQLgv6008bf2oHhr71BHZD7CKtdMdRMSfRHMBiyxn9Ctvh8e5XhpSYq5V2C3sKGZItaVWR+dNPcuBFaCOH3oafQ6ESPZ3C9EBpkzoDpX9RbJyryf4DQOoHjwovHGhZOembGIdFKagBgvJg70W9bi5Ee6k4DgEFwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773163315; c=relaxed/simple;
	bh=lx6unmWMNaejxtadInCRSJGyFY4RHOZ4BHRBhZzs2Ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgMhm5B0uySRtphBtY9HYoqJyCaCnO1A3hIrnfdMBBX3s1TZDcEbdDfqOwJW103yRCHlUhbvacSb+Ym4r0wTPqLx2/d9OK4bXooPF5QVoPUn92SUecuW6CiPCXMEb7eItQM3WDvMCdPkrIacmgYxIxJFDVpSXJ0eFIP4n0yWW/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=CeN1hLKR; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=U7ABnPng; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773163298; bh=lRELyoDy9yFKpGtzS5hNP/7
	86BeTukFxk41SNtHvFIY=; b=CeN1hLKR3XnTtY1E4/VMMKAHI9zGG+rQRW49kgEwTKMYlgsc2S
	jEls0YymWItY1/gW9keqY8KX0F6NlwHItJjMxirkPCQd7qkDnklcYQSN882kSE94WH96fXtqUnn
	qkvt5rySa63pnwiKY65KpNnfnQ3GE8xO0CKB/FvDkEkULtZesoGLJmVfe0J3IMc9HxxOsBrrmsi
	KPX2JTvi0n9QHED/HJhABIZSc2JJThk2axhRiNhRDvVDnJYKIOoOcfdWIALYSGs7kmJjhQu+KsV
	sKuLsUtN/I18qnuCHMDktzWEj+IPLONZj0sKG89Fhu+oQNssNRq3TdpKZ2oBrM4pKBA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773163298; bh=lRELyoDy9yFKpGtzS5hNP/7
	86BeTukFxk41SNtHvFIY=; b=U7ABnPngVIJoVnOXlTq/ILolTR8JPUEoSM7hkrTJAZxmJGbUoX
	T+3Ygto5KXkuEu4ppKsC6I7VUanWhYptPvAg==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 10 Mar 2026 18:21:32 +0100
Subject: [PATCH v2 2/7] arm64: dts: qcom: Make a common base from Redmi 5A
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260310-riva-common-v2-2-3bfc23996857@mainlining.org>
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
In-Reply-To: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773163296; l=3775;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=lx6unmWMNaejxtadInCRSJGyFY4RHOZ4BHRBhZzs2Ig=;
 b=tXIVMhIT/x5SbOb+eo7vvVymkj6n4RaU+ZnTBGBgBv8sfGmqIGYsKujLEqPTbsiWAh4e2K+oD
 DpRjiSROXjiBevWf8boAudFvGgj0oFD+2zoMVea12Wo6svva28k6P9R
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Queue-Id: 1189F255883
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.22 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.88)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-96740-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.55:email,5.93.78.104:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.38:email,6b:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid]
X-Rspamd-Action: no action

Redmi 5A was made by wingtech like Redmi 4A (rolex) and Redmi GO (tiare).
They are very similar, make a common base from riva for avoid
unnecessary code duplications.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  1 -
 ...iaomi-riva.dts => msm8917-xiaomi-wingtech.dtsi} | 45 +---------------------
 2 files changed, 2 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6d87be639aac..e68e161cfec0 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -81,7 +81,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86518.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt86528.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-yiming-uz801v3.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= msm8917-xiaomi-riva.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8929-wingtech-wt82918hd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8937-xiaomi-land.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-asus-z00t.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
similarity index 84%
rename from arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
rename to arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
index 1bfb16f90ddd..f0a534106e11 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
@@ -13,12 +13,9 @@
 /delete-node/ &qseecom_mem;
 
 / {
-	model = "Xiaomi Redmi 5A (riva)";
-	compatible = "xiaomi,riva", "qcom,msm8917";
 	chassis-type = "handset";
 
 	qcom,msm-id = <QCOM_ID_MSM8917 0>;
-	qcom,board-id = <0x1000b 1>, <0x1000b 2>;
 
 	pwm_backlight: backlight {
 		compatible = "pwm-backlight";
@@ -28,17 +25,6 @@ pwm_backlight: backlight {
 		default-brightness-level = <128>;
 	};
 
-	battery: battery {
-		compatible = "simple-battery";
-		charge-full-design-microamp-hours = <3000000>;
-		energy-full-design-microwatt-hours = <11500000>;
-		constant-charge-current-max-microamp = <1000000>;
-		constant-charge-voltage-max-microvolt = <4400000>;
-		precharge-current-microamp = <256000>;
-		charge-term-current-microamp = <60000>;
-		voltage-min-design-microvolt = <3400000>;
-	};
-
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -104,7 +90,7 @@ framebuffer_mem: memory@90001000 {
 &blsp1_i2c3 {
 	status = "okay";
 
-	touchscreen@38 {
+	edt_ft5306: touchscreen@38 {
 		compatible = "edt,edt-ft5306";
 		reg = <0x38>;
 		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
@@ -115,27 +101,8 @@ touchscreen@38 {
 		iovcc-supply = <&pm8937_l5>;
 		touchscreen-size-x = <720>;
 		touchscreen-size-y = <1280>;
-	};
-};
 
-&blsp2_i2c1 {
-	status = "okay";
-
-	bq27426@55 {
-		compatible = "ti,bq27426";
-		reg = <0x55>;
-		monitored-battery = <&battery>;
-	};
-
-	bq25601@6b {
-		compatible = "ti,bq25601";
-		reg = <0x6b>;
-		interrupts-extended = <&tlmm 61 IRQ_TYPE_EDGE_FALLING>;
-		pinctrl-0 = <&bq25601_int_default>;
-		pinctrl-names = "default";
-		input-voltage-limit-microvolt = <4400000>;
-		input-current-limit-microamp = <1000000>;
-		monitored-battery = <&battery>;
+		status = "disabled";
 	};
 };
 
@@ -280,7 +247,6 @@ pm8937_l23: l23 {
 			regulator-max-microvolt = <1200000>;
 		};
 	};
-
 };
 
 &sdhc_1 {
@@ -306,13 +272,6 @@ &sleep_clk {
 };
 
 &tlmm {
-	bq25601_int_default: bq25601-int-default-state {
-		pins = "gpio61";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
 	gpio_keys_default: gpio-keys-default-state {
 		pins = "gpio91";
 		function = "gpio";

-- 
2.53.0


