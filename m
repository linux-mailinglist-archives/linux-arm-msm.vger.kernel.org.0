Return-Path: <linux-arm-msm+bounces-101779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKTiJGcK0WlfEAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 14:56:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2230D39B24B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 14:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 711D33016C81
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 12:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC6A2DB7BF;
	Sat,  4 Apr 2026 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="El4+mzS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106111.protonmail.ch (mail-106111.protonmail.ch [79.135.106.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10EA318EE6;
	Sat,  4 Apr 2026 12:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775307340; cv=none; b=rNw571emflZfRUn+w1bDqRtnlu4sK4uhZC+kGdBSKqp42hWJC3rutZ8q5qi5fCFS3HjEDu3Be0GhufpR35AGTj6RrrAHKGX7ZQUFq7gujryZorotfgfRPo5cFzkwjdSTb8v87mOB7WtOO1aRyjA+u6Kizk9hnJx50p88vYZCoFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775307340; c=relaxed/simple;
	bh=NNw89viHCAluudQ5hHl3RTCj23fU/KFs0wnqyKyi6Ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iRhbeNBClHeOjAYooivWC42UOYfqF1i7H3txYLejLEGeatSp3n15astS9XuxpJjcOAtWd0mNsrJ7Gv0+hrkGNAaIoO1uUhqsLyMExG/fHkLNVHVgGCoZrmEkehBaC2ZMVIL9glLuW2yKZDLCv4isTRDnWjdjGsfFN5OBJ7oMUSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=El4+mzS0; arc=none smtp.client-ip=79.135.106.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1775307329; x=1775566529;
	bh=oCTPVX4/Ad1LLXg3NGfYhCwqJCIY4GkH6bCOQnVy2bw=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=El4+mzS0MR2i3gQ7Kp1Va5y1KwS0HbOzRpIZQd2X+vQGxa/p1qBRPhCHiW2B84Vyh
	 Ax+W/bFEjVHUvFzT5xBGxDI/415RbzLZov6IjPWQU48KvmnCC9C54nAsBtQ/Afil8c
	 /p13tTuguZZDwUig/3cUSkc2AGAzf8AMsNydAEfS16DlDYPfD1E0oyNAAYppGCDNfk
	 c3xWbe1w2lE/uep8ZjIfKwPJSJ3CwXIMKCWtdyv6sgHGs3BsuoDjCMUPwIeXdu2L1E
	 SjY3EjueKZwHLWf0TFCbiojXMx0D6rDAUKMP/PYyIDlxjIATgRF+f/wx0Sh937bOea
	 ZxHzAlQtYHSBg==
X-Pm-Submission-Id: 4fnwYX4znBz1DDLg
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Sat, 04 Apr 2026 14:55:17 +0200
Subject: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
In-Reply-To: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4034; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=NNw89viHCAluudQ5hHl3RTCj23fU/KFs0wnqyKyi6Ks=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDJkXuSxkft/JrFB4USjUWWy0fNWqcn7btDlfJFVDzh56t
 rjc20i+o5SFQYyLQVZMkaX7z9e0rkVz1zJc1/gGM4eVCWQIAxenAEwkuoPhv8cWbh5vi7tLbi4v
 mycm4fz59Tbpxud3A7fZdikrrnD5sYmR4UyJgZXarzMbV4Qc6fjAOU//ixoTV51g+Jbbe8ttFSy
 sGQE=
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101779-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.144:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.145:email,14d:email,14c:email,0.0.0.147:email,vinarskis.com:dkim,vinarskis.com:email,vinarskis.com:mid,3b:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.146:email]
X-Rspamd-Queue-Id: 2230D39B24B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe embedded controller, its interrupt and required thermal zones.
Add EC's reset GPIO to reserved range, as triggering it during device
operation leads to unrecoverable and unusable state.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 94 +++++++++++++++++++++-
 1 file changed, 92 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index ce7b10ea89b6dcb2a4a65c114037f4c90a4b0c6d..fe7e069f0ef56c6fdc3b495dd78dacd1b96c1c95 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
@@ -759,8 +760,32 @@ retimer_ss0_con_sbu_out: endpoint {
 
 &i2c5 {
 	clock-frequency = <100000>;
-	status = "disabled";
-	/* EC @0x3b */
+	status = "okay";
+
+	embedded-controller@3b {
+		compatible = "dell,xps13-9345-ec";
+		reg = <0x3b>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+
+		io-channels = <&pmk8550_vadc PM8350_ADC7_GPIO3_100K_PU(1)>,
+			      <&pmk8550_vadc PM8350_ADC7_GPIO4_100K_PU(1)>,
+			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM1_100K_PU(1)>,
+			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM2_100K_PU(1)>,
+			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM3_100K_PU(1)>,
+			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM4_100K_PU(1)>,
+			      <&pmk8550_vadc PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
+		io-channel-names = "sys_therm0",
+				   "sys_therm1",
+				   "sys_therm2",
+				   "sys_therm3",
+				   "sys_therm4",
+				   "sys_therm5",
+				   "sys_therm6";
+	};
 };
 
 &i2c7 {
@@ -1025,6 +1050,64 @@ rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
 	};
 };
 
+&pmk8550_vadc {
+	/* Around DRAM */
+	channel@14c {
+		reg = <PM8350_ADC7_GPIO3_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm0";
+	};
+
+	/* Around left Type-C charging controller */
+	channel@14d {
+		reg = <PM8350_ADC7_GPIO4_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm1";
+	};
+
+	/* Around upper-left side of motherboard */
+	channel@144 {
+		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm2";
+	};
+
+	/* Around right Type-C charging controller */
+	channel@145 {
+		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm3";
+	};
+
+	/* Around SSD connector */
+	channel@146 {
+		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm4";
+	};
+
+	/* Around battery charging circuit */
+	channel@147 {
+		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm5";
+	};
+
+	/* Around keyboard */
+	channel@148 {
+		reg = <PM8350_ADC7_AMUX_THM5_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm6";
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };
@@ -1071,6 +1154,7 @@ &smb2360_1_eusb2_repeater {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
+			       <65 1>,  /* EC Reset, accessible but yields system unusable */
 			       <76 4>,  /* SPI19 (TZ Protected) */
 			       <238 1>; /* UFS Reset */
 
@@ -1081,6 +1165,12 @@ cam_indicator_en: cam-indicator-en-state {
 		bias-disable;
 	};
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio74";
 		function = "gpio";

-- 
2.53.0


