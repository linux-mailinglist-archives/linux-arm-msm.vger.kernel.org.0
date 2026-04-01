Return-Path: <linux-arm-msm+bounces-101254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHTNGRjPzGlFWwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:54:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7D637653D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 09:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A182C308091F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 07:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580E938D01B;
	Wed,  1 Apr 2026 07:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="Md3i3u7k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB29238BF67;
	Wed,  1 Apr 2026 07:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775028848; cv=none; b=Kuy+JWfV7GgdjozfKHcpuPnHNnSiuHxSn9xJU5mJkmPfjALjES0aJqUFzFbK5meV0zqyJnXRsVrnhvGwuoObSvOuLIDWlkueOJNYD8++pxY7nARBoRJCik0+s05wMvfhARc65LC6r5BKH3QNl4P85UH1RGxJ3u95COC0ZOFqgdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775028848; c=relaxed/simple;
	bh=60K/Uy8LU9zf98IRPCjLh2551vSDeukTLK2XSg3KdFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hwuxNKxEsRNa2E5/hVPKs/KJhBFNTtQ+l68qFk/IokYu7TqYeHxOsLJm2pkZVW6yuslC/JkdOzeC0XYns13psSJtYT1UIeeshp9xHVItrlKCyrDjvC0Eeh4ofWmXeMAtF+MK9S71eMAIqot3bZDNzhsNAO6Z7RzLetlyqU+bCD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=Md3i3u7k; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail2; t=1775028835; x=1775288035;
	bh=3cX2RM0lGaVVwCSJiPc5We3uqoBIIsjre4hSZZ55meA=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Md3i3u7k84zPIbmyEQdyoQ7b24uu/iyBdfUdOseBvhapFgSNeZYaV0bMWykGfWDDv
	 VT/fWlMaT4FGdvOgTTFc8SV/gPzctndZzURAcX+xymFbVmgKG8UHMGMLOdOKuBwFdV
	 OsnsOBmDHetm4tLoSQzCLWN0zKIHep5VKISlW6yzPMHVN/aIzxXfxK2ntKDxjV5bq4
	 VbO3+e9EBWLFYA5B2i5/wpNj6BcEdZQ4ShT1vrbt1B/Yn87hULuL45mOSTMbF5u1aR
	 Hty9WA2t78rq2M6nFU97ttqqnBkzomk0VyI31Dsl67jRWWo0aCdq+wtCJebvUzTjZ4
	 THmnBVfpQRjEg==
X-Pm-Submission-Id: 4flxYt4nyxz1DDLb
gpg: Signature made Wed 01 Apr 2026 09:30:47 AM CEST
gpg: using EDDSA key 8BFCF5668AA29DAD00D728F6EDAE71A20F500310
gpg: Good signature from "Aleksandrs Vinarskis <alex@vinarskis.com>"
 [ultimate]
gpg: aka "Aleksandrs Vinarskis <alex.vinarskis@gmail.com>" [ultimate]
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Wed, 01 Apr 2026 09:33:13 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce
 EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-dell-xps-9345-ec-v1-4-afa5cacd49be@vinarskis.com>
References: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
In-Reply-To: <20260401-dell-xps-9345-ec-v1-0-afa5cacd49be@vinarskis.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4046; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=60K/Uy8LU9zf98IRPCjLh2551vSDeukTLK2XSg3KdFw=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDJlnTkXz1eQ+NeY7WfT7yAdDH66daZa3hb+Ensk+tl0te
 /7zRzqlHaUsDGJcDLJiiizdf76mdS2au5bhusY3mDmsTCBDGLg4BeAiqQz/ix1W+7+Uee4vEfgr
 aELujvtn/FKV7h9V+xChvLxplfT0NQz/1Bef+pcx9/TnR2v4Qu7ecPjnfNwizD3iReI8bh7T08x
 5TAA=
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[vinarskis.com,quarantine];
	R_DKIM_ALLOW(-0.20)[vinarskis.com:s=protonmail2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101254-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@vinarskis.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[vinarskis.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.147:email,0.0.0.144:email,0.0.0.145:email,vinarskis.com:dkim,vinarskis.com:email,vinarskis.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,3b:email,0.0.0.148:email,14c:email,14d:email]
X-Rspamd-Queue-Id: 5D7D637653D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Describe embedded controller, its interrupt and required thermal zones.
Add EC's reset GPIO to reserved range, as triggering it during device
operation leads to unrecoverable and unusable state.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 91 +++++++++++++++++++++-
 1 file changed, 89 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index ce7b10ea89b6dcb2a4a65c114037f4c90a4b0c6d..32e7134316709f5574d43d9edd83c77fb7d23451 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
@@ -759,8 +760,29 @@ retimer_ss0_con_sbu_out: endpoint {
 
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
+
+		io-channel-names = "sys_therm0", "sys_therm1", "sys_therm2",
+				   "sys_therm3", "sys_therm4", "sys_therm5",
+				   "sys_therm6";
+	};
 };
 
 &i2c7 {
@@ -1025,6 +1047,64 @@ rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
 	};
 };
 
+&pmk8550_vadc {
+	/* sys_therm0, around DRAM */
+	channel@14c {
+		reg = <PM8350_ADC7_GPIO3_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm0";
+	};
+
+	/* sys_therm1, around left Type-C charging controller */
+	channel@14d {
+		reg = <PM8350_ADC7_GPIO4_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm1";
+	};
+
+	/* sys_therm2, around upper-left side of motherboard */
+	channel@144 {
+		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm2";
+	};
+
+	/* sys_therm3, around right Type-C charging controller */
+	channel@145 {
+		reg = <PM8350_ADC7_AMUX_THM2_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm3";
+	};
+
+	/* sys_therm4, around SSD connector */
+	channel@146 {
+		reg = <PM8350_ADC7_AMUX_THM3_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm4";
+	};
+
+	/* sys_therm5, around battery charging circuit */
+	channel@147 {
+		reg = <PM8350_ADC7_AMUX_THM4_100K_PU(1)>;
+		qcom,hw-settle-time = <200>;
+		qcom,ratiometric;
+		label = "sys_therm5";
+	};
+
+	/* sys_therm6, around keyboard */
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
@@ -1071,6 +1151,7 @@ &smb2360_1_eusb2_repeater {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
+			       <65 1>,  /* EC Reset */
 			       <76 4>,  /* SPI19 (TZ Protected) */
 			       <238 1>; /* UFS Reset */
 
@@ -1081,6 +1162,12 @@ cam_indicator_en: cam-indicator-en-state {
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


