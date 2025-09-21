Return-Path: <linux-arm-msm+bounces-74324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F86CB8D479
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 05:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7C1B4449BD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 03:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B9E2836A0;
	Sun, 21 Sep 2025 03:45:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from skyblue.cherry.relay.mailchannels.net (skyblue.cherry.relay.mailchannels.net [23.83.223.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8812820A9;
	Sun, 21 Sep 2025 03:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.167
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758426306; cv=pass; b=T667kIJ9QXWBAxfYDcRNL/D6Kv9arJjCwHtI1dD4XoAQAQJONrDMElH3G15S0AjGvDMyDZ7ul+x2gN0NCtGwm7essO6hRR04EMVNqsiMTBfZ7Ax6fze7LaaxSJ8fIptYxxFDR3h13bQiuHM3tSrkES4LacRocoL8nc+8jC14MmQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758426306; c=relaxed/simple;
	bh=BJUyg/gaubDDEi2kuLPGD/QgzfH5AJHevTLrsKbWOQI=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=JACXyeeH2laFJJOr64GWfkETBavX769pHm4FQguwXKfVcf873FXDH4r9Fvd7xh4HmVR7z5oO6aE1eMXd1qLRaqhuZGUdZU5qcm/CwBDLAcp53JTt6OxdpBgCTLssMpAoGDm3ePo/XtJN2OO0n3iNZa8xmhT65rISol6zUAiP1R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; arc=pass smtp.client-ip=23.83.223.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 8E2674217EC;
	Sun, 21 Sep 2025 03:08:39 +0000 (UTC)
Received: from uk-fast-smtpout7.hostinger.io (100-107-230-55.trex-nlb.outbound.svc.cluster.local [100.107.230.55])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id D809C4217E6;
	Sun, 21 Sep 2025 03:08:34 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1758424116; a=rsa-sha256;
	cv=none;
	b=K3m3CQuN54re6EWMPTiaY9Zkxu6nb8LLITaIxzxedpi3OO++Gsko2D0jkdLYGwwhh5t6pc
	gKaFlOYylpwQ9W2rRk6IDn6wkrt20zS5VXKIqTQCargVi4v8T4frfxRXk6a/58n0P8QoTN
	IwJOjnshqH/IwohJ84ieIhQm5DLiPdsUf+YlBpd5cL/owPYXapejTaEMH1xyi68Vdn9eOu
	g4Fpw/+w7dgrL50iQW3hrYOiaQhOShfvxV8GjPgfv6qw3ofuYmAJKhjVbXDRJhF7sumLzZ
	5EbnAYHw2wk8w+J8tP1vT0Yk3LjQiib0bwB+gdmllRmudKpu5Y5Ek6E1kmePJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1758424116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IbcmLT4SLfFsPddBllnufnUQ9nHvABPop3whe8yvnds=;
	b=3UFC2+MqfGgzE4VCz+dhoqmXGCuW4PgboZZ7Rs1pwhcy2wmVhC0VFoIYra406TCOPj072G
	GqTOCwl89diSM8rwpSKV+1NmV4Ryrwun4oQHsCXvicaitzmvggxb2sQWFXmCC0nPWkFoyf
	As0eduqVZ+sEZ5cJx0ePlFJIpEFjMTU87Fmq+2vvZ/hB0WnDOs9rxxHBwG3PhMi6gUaIPu
	w/TY7wMZdif6xbn4cmsnDqWcGGOF02su3ECNob+oa0A7KS8ElvnzAqpLfws49pefrgW4Pz
	0SDcqDIwOAtCK+6SBsqEOVr8B+xi4+yVROSedWm7jsQSAOtcxQRP+1eCyJFf3w==
ARC-Authentication-Results: i=1;
	rspamd-59b854cb4c-6wsqh;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MC-Copy: stored-urls
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Oafish-Juvenile: 0e61feef0de70447_1758424119495_1238929954
X-MC-Loop-Signature: 1758424119495:1266353866
X-MC-Ingress-Time: 1758424119495
Received: from uk-fast-smtpout7.hostinger.io (uk-fast-smtpout7.hostinger.io
 [31.220.23.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.107.230.55 (trex/7.1.3);
	Sun, 21 Sep 2025 03:08:39 +0000
Received: from [172.17.0.2] (unknown [180.253.43.125])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cTrlz5cKxzHTnH4;
	Sun, 21 Sep 2025 03:08:15 +0000 (UTC)
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 5/5] ARM: dts: qcom: msm8960: rename msmgpio node to
 tlmm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-msm8960-reorder-v2-5-26c478366d21@smankusors.com>
References: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
In-Reply-To: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>, 
 Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758424077; l=5147;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=BJUyg/gaubDDEi2kuLPGD/QgzfH5AJHevTLrsKbWOQI=;
 b=84+MESmCI1+YcmANy3kPl+bzoUxnhL0g8LbknodoeyIJTqxZf7zQ6IY76H+q5sDTgVlQyAXEW
 7S80w/Sx71RCAnxcj+K4lFGNeJKfhNaBOjSiGOF3p3/GqDqHIGgbSIu
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 21 Sep 2025 03:08:15 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=LvvAyWdc c=1 sm=1 tr=0 ts=68cf6c23 a=hVqNbC/oQIbyndLMfyRB3g==:117 a=hVqNbC/oQIbyndLMfyRB3g==:17 a=IkcTkHD0fZMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=uO6OOvRasOTzVOl-vJEA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfOWDKpZRQb1ziUEa9HKcpEZXKc1owb5lKGfjevzCI+EwqpL0+tFsVIdBoKfHhjrOHV2AeWCkn1A/LMseqQwRwHCbT5/fhQxftFGO0Z//pyfyvY8u4Yyq XA4+mNb5dQYXk5Sa6xBzvAdiQCEsQzn489qMcpgoLRRo8pk5WcXp1dxjW9p1dUtCcLRq2mT/FIofmrhR3w/qkRZNxrxlZ0fG1rNUvU7VkiHngayTGsinikcg aBOA9O9r18CMc+C5LT+Y/6jDWsbiOsFL65oeT+tsG+iEcZqQyR7yrsOckNWTUPjAsiOP5j8nvcPjunA6oOeZpYCwr+d/R+IU0bkdxHqktHQHmWqLC8W5us9F aXLEFNX8TJj7w1yPQuVcc34Q763xznlqUNxfQ8rZl2wPqF6gDAly4BXTdyJEzJdBU5nH0BKwBJYYzPNP3twLguk/hiYS6vAlwz7E13JAqzZhTnbp+YW9v7b0 vRZDMdgzZmK+jB1zKQcPsFUQRdvdZeFzeXPzrO2NPRvL/nAN9C6Ym2fEzMAaFE91u08HxKUn6Y7OCzg0jJemPH5dZRGSUvEn2hVuMA==
X-AuthUser: linux@smankusors.com

Rename the GPIO controller node from "msmgpio" to "tlmm" to match the
convention used by other Qualcomm SoCs.

Suggested-by: Shinjo Park <peremen@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts                | 10 +++++-----
 arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts | 12 ++++++------
 arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts       |  2 +-
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi                   |  6 +++---
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index 36f4c997b0b3aa8c9bbbee78906f03dad0a73e7e..1df078d7d89b839b45d9f9c56fee9d4ea9615c6e 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -19,7 +19,7 @@ chosen {
 	ext_l2: gpio-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "ext_l2";
-		gpio = <&msmgpio 91 0>;
+		gpio = <&tlmm 91 0>;
 		startup-delay-us = <10000>;
 		enable-active-high;
 	};
@@ -38,12 +38,12 @@ &gsbi1_spi {
 	ethernet@0 {
 		compatible = "micrel,ks8851";
 		reg = <0>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <90 IRQ_TYPE_LEVEL_LOW>;
 		spi-max-frequency = <5400000>;
 		vdd-supply = <&ext_l2>;
 		vdd-io-supply = <&pm8921_lvs6>;
-		reset-gpios = <&msmgpio 89 0>;
+		reset-gpios = <&tlmm 89 0>;
 	};
 };
 
@@ -56,7 +56,7 @@ &gsbi5_serial {
 	status = "okay";
 };
 
-&msmgpio {
+&tlmm {
 	spi1_default: spi1-default-state {
 		 mosi-pins {
 			pins = "gpio6";
@@ -90,7 +90,7 @@ clk-pins {
 };
 
 &pm8921 {
-	interrupts-extended = <&msmgpio 104 IRQ_TYPE_LEVEL_LOW>;
+	interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
 };
 
 &pm8921_keypad {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 49d117ea033a0ef73c134d1225982786fbded2c2..5ee919dce75b31a977e8e1ebd0d02413b20b6270 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -31,7 +31,7 @@ gpio-keys {
 
 		key-home {
 			label = "Home";
-			gpios = <&msmgpio 40 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 40 GPIO_ACTIVE_LOW>;
 			debounce-interval = <5>;
 			linux,code = <KEY_HOMEPAGE>;
 			wakeup-event-action = <EV_ACT_ASSERTED>;
@@ -40,14 +40,14 @@ key-home {
 
 		key-volume-up {
 			label = "Volume Up";
-			gpios = <&msmgpio 50 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 50 GPIO_ACTIVE_LOW>;
 			debounce-interval = <5>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
 		key-volume-down {
 			label = "Volume Down";
-			gpios = <&msmgpio 81 GPIO_ACTIVE_LOW>;
+			gpios = <&tlmm 81 GPIO_ACTIVE_LOW>;
 			debounce-interval = <5>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
@@ -102,7 +102,7 @@ &gsbi3_i2c {
 	touchscreen@4a {
 		compatible = "atmel,maxtouch";
 		reg = <0x4a>;
-		interrupt-parent = <&msmgpio>;
+		interrupt-parent = <&tlmm>;
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 		vdda-supply = <&pm8921_lvs6>;
 		vdd-supply = <&pm8921_l17>;
@@ -111,7 +111,7 @@ touchscreen@4a {
 	};
 };
 
-&msmgpio {
+&tlmm {
 	spi1_default: spi1-default-state {
 		mosi-pins {
 			pins = "gpio6";
@@ -160,7 +160,7 @@ touchscreen: touchscreen-int-state {
 };
 
 &pm8921 {
-	interrupts-extended = <&msmgpio 104 IRQ_TYPE_LEVEL_LOW>;
+	interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
 };
 
 &rpm {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
index f2f59fc8b9b61e18b0ec4ed1fc2d813585a75f15..591dc837e6003680d5841a6e29b8862996e1e5ca 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-sony-huashan.dts
@@ -54,7 +54,7 @@ &gsbi8_serial {
 };
 
 &pm8921 {
-	interrupts-extended = <&msmgpio 104 IRQ_TYPE_LEVEL_LOW>;
+	interrupts-extended = <&tlmm 104 IRQ_TYPE_LEVEL_LOW>;
 };
 
 &pm8921_gpio {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 0aaf60dcda647dc2f7ce11ae7cde05a0bcd35716..38bd4fd8dda5cc9c66f4e03ed4c1088b559ee04a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -121,11 +121,11 @@ tsens_backup: backup-calib@414 {
 			};
 		};
 
-		msmgpio: pinctrl@800000 {
+		tlmm: pinctrl@800000 {
 			compatible = "qcom,msm8960-pinctrl";
 			reg = <0x800000 0x4000>;
 			gpio-controller;
-			gpio-ranges = <&msmgpio 0 0 152>;
+			gpio-ranges = <&tlmm 0 0 152>;
 			#gpio-cells = <2>;
 			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
@@ -533,7 +533,7 @@ gsbi1_spi: spi@16080000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
-				cs-gpios = <&msmgpio 8 0>;
+				cs-gpios = <&tlmm 8 0>;
 				clocks = <&gcc GSBI1_QUP_CLK>,
 					 <&gcc GSBI1_H_CLK>;
 				clock-names = "core",

-- 
2.34.1


