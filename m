Return-Path: <linux-arm-msm+bounces-116594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NhE1NJ65Smo4GwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 22:07:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F3A70B41D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 22:07:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="n/U+aKnp";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116594-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116594-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EA803016021
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 20:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737843A8724;
	Sun,  5 Jul 2026 20:07:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D720238C40B;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783282063; cv=none; b=uqAQBOj7kPoU5jJrCBZd/mYbEcrCAlCjFpJ7QUOMKCS6HMpOoz90azvZTqYzYD/mBh4sUf95xGb4F/UJqORIFQgSfVFzLOkS4PC45JLrDgzSheaQS/6J3tRC3GaDNlSnH3TURgQMkH9iUVHTgftrpkEDFuCV33Z4T0zOzJUkHsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783282063; c=relaxed/simple;
	bh=tbtseEtGFnodhyICSjw8aAbiexEhRo/kUfwBK98RQr4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZFssEuuuDH1eDZ6n2tLJp4/D10p5sdCTGu7R9mQ55rzQ17+9Fa8eVFGEe30+Jv908MBH8fBocSktsuLAtSRj8jpz6PTJw2xpzZgj40A1A2f3S2yWMVU0WDdzjwDxNlUOF8Iis0SIYttJ7c0GONAjKxh4EbWLWrdKbmZa6gnQ4Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/U+aKnp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FE7FC4AF19;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783282063;
	bh=tbtseEtGFnodhyICSjw8aAbiexEhRo/kUfwBK98RQr4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=n/U+aKnpyx3Soj4fLgBXbwM+u11x0WnfTZYt1n7c68wNVQoj/EkKlMtGl0vqzFed+
	 d0UHh+P+fyCOUVPEhV4hv2Z4LSwrAAvpYCkuZFh2AuKZIjiENVTGEIovfv19ZVRK70
	 NG0oc+1I8n4EM80lRAEPLHb/7+5V4OiGdt0FRG32nr2FA+ba1tT3a0BPEYm5L2E0Yb
	 DMdSFjtVGvCo1xtsD5pufGKkf8K3B9K3pLBULR/lH7zDTw0snAHA0TrziGWvk9hyry
	 KcRIxgAOt2HGYHOyuwv1+5d+YNg/hqNGppszgqXRtCVkz9zqU1aup5n355FkiNZGcP
	 ppgDnW/gxHGow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 893BFC44500;
	Sun,  5 Jul 2026 20:07:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 05 Jul 2026 22:06:56 +0200
Subject: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
In-Reply-To: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 David Rhodes <drhodes@opensource.cirrus.com>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5530; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=4QT6MbVMdh9DemMmlyZeKTtLW9oQ3lZJrUSa/kP3wr4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqSrmN3xSuGutBrlsGqBqsGNkmGGhdWNLbEMAHo
 uPVwc80SHKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCakq5jQAKCRBgAj/E00kg
 csC9D/0fTr88ve2WlRdxwYh+Ph9+nrZTk6fiM515YqY7e9kB5k2FRQvR4F8IoUC1KJIRroqnfM9
 dXAPmrg15STlkI8vWJo9cNVFH7PAEDM9trK8FXyCMEJOs3cFgXNHmovrpx2ddHM3/1l1X/FYxY5
 JA3tgHoe7hSwJXMNigLFCJmQ5HHYIgMyJ/za6ZTYMqA5vbnmGM/mWiQYGDfSHosJv8zFFdzZQZ1
 pgkO6S+dWA3Vm0Fzejoc97fibQncdOsIEWoXsJ3NFoZLYrjeLyxLEBTYfMKBiBK25S5fuCGl7Vu
 dmqyOI5iC7OakjI8xJjF2rZCMGfQXPvHOsJO6TNsE2WWtqZQ18VQ/fYeQU56Tk19ex7rKEooDsN
 qqoWK0jWhn86PXVWkWi4cm9Xyg92F8yuypRr3ZjmxT1YE7dIKXujCJUNgqd/yNV2MBNtGcQDL+p
 gtPUpVtGmh3wItP2Lq+ivbLLjzgjUdMlCQtrUABw6r37Wyjdq9ZL/gkQZhdux14HRhZZiO467Ns
 qsNZtXF+YB/cN4NK8Pqk2Pi3c43eyyQSICBXVrJ6q9ivx9NMTSABf+BqGqTHWaB9lskfBvLvwmM
 aH17+TDPYhloslVO+idZAm4xtOHHe9y6r0pPV35heOKbwbOYktpQQ15B2TTwagTvSRpCSBgac4D
 OPTGYKxuZ3hHTrQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116594-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:drhodes@opensource.cirrus.com,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:devicetree@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,cirrus.com,opensource.cirrus.com];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ixit.cz:replyto,ixit.cz:mid,ixit.cz:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45F3A70B41D

From: David Heidelberg <david@ixit.cz>

Introduce support for sound card and wire two CS35L36 audio codecs for
top and bottom speakers.

Inspired by commit from Joel Selvaraj.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 133 ++++++++++++++++++++-
 1 file changed, 131 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index b2dc0327dff85..d00fee7ebd424 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -2,16 +2,18 @@
 
 /dts-v1/;
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
 /delete-node/ &mpss_region;
 /delete-node/ &venus_mem;
 /delete-node/ &cdsp_mem;
@@ -404,19 +406,63 @@ nfc@28 {
 		firmware-gpios = <&tlmm 79 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-0 = <&nfc_int_default &nfc_enable_default>;
 		pinctrl-names = "default";
 	};
 };
 
 &i2c12 {
-	/* Bottom spkr (right) CS35L36 @ 40 */
+	status = "okay";
+
+	/* CS35L36, Bottom Speaker */
+	cs35l36_bottom: audio-codec@40 {
+		compatible = "cirrus,cs35l36";
+		reg = <0x40>;
+		reset-gpios = <&tlmm 112 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Right"; /* Bottom */
+		VA-supply = <&vreg_s4a_1p8>;
+		interrupts-extended = <&tlmm 115 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&cs35l36_bottom_default_state>;
+		pinctrl-names = "default";
+
+		cirrus,boost-ind-nanohenry = <1000>;
+		cirrus,boost-ctl-select = <1>;
+		cirrus,boost-ctl-millivolt = <10000>;
+		cirrus,boost-peak-milliamp = <3700>;
+		cirrus,temp-warn-threshold = <1>;
+		cirrus,multi-amp-mode;
+		cirrus,irq-drive-select = <0>;
+		cirrus,irq-gpio-select = <0>;
+	};
 
-	/* Top spkr (left) CS35L36 @ 41 */
+	/* CS35L36, Top Speaker */
+	cs35l36_top: audio-codec@41 {
+		compatible = "cirrus,cs35l36";
+		reg = <0x41>;
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Left"; /* Top */
+		VA-supply = <&vreg_s4a_1p8>;
+		interrupts-extended = <&tlmm 40 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&cs35l36_top_default_state>;
+		pinctrl-names = "default";
+
+		cirrus,boost-ind-nanohenry = <1000>;
+		cirrus,boost-ctl-select = <0x01>;
+		cirrus,boost-ctl-millivolt = <10000>;
+		cirrus,boost-peak-milliamp = <3700>;
+		cirrus,temp-warn-threshold = <1>;
+		cirrus,multi-amp-mode;
+		cirrus,irq-drive-select = <0>;
+		cirrus,irq-gpio-select = <0>;
+	};
 };
 
 &ipa {
 	firmware-name = "qcom/sdm845/Google/blueline/ipa_fws.mbn";
 	memory-region = <&ipa_fw_mem>;
 
 	status = "okay";
 };
@@ -449,16 +495,35 @@ &pm8998_resin {
 };
 
 &pmi8998_charger {
 	monitored-battery = <&battery>;
 
 	status = "okay";
 };
 
+&q6afedai {
+	dai@72 {
+		reg = <QUATERNARY_TDM_RX_0>;
+
+		qcom,tdm-sync-mode = <0>;
+		qcom,tdm-sync-src = <1>;
+		qcom,tdm-data-out = <0>;
+		qcom,tdm-invert-sync = <0>;
+		qcom,tdm-data-delay = <1>;
+		qcom,tdm-data-align = <0>;
+	};
+};
+
+&q6asmdai {
+	dai@0 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
 
 &qupv3_id_1 {
 	status = "okay";
 };
 
@@ -467,16 +532,48 @@ &qup_uart9_rx {
 	bias-pull-up;
 };
 
 &qup_uart9_tx {
 	drive-strength = <2>;
 	bias-disable;
 };
 
+&sound {
+	compatible = "qcom,sdm845-sndcard";
+	model = "Google Pixel 3";
+	pinctrl-0 = <&quat_mi2s_active>, <&quat_mi2s_sd0_active>,
+		    <&quat_mi2s_sd1_active>;
+	pinctrl-names = "default";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	cs35l36-dai-link {
+		link-name = "Speaker Playback";
+
+		cpu {
+			sound-dai = <&q6afedai QUATERNARY_TDM_RX_0>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+
+		codec {
+			sound-dai = <&cs35l36_bottom>, <&cs35l36_top>;
+		};
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = < 0 4>, /* SPI (Intel MNH Pixel Visual Core) */
 			       <81 4>; /* SPI (most likely Fingerprint Cards FPC1075) */
 
 	nfc_int_default: nfc-int-default-state {
 		pins = "gpio63";
 		function = "gpio";
 		drive-strength = <2>;
@@ -505,16 +602,48 @@ touchscreen_pins: ts-pins-gpio-state {
 	};
 
 	touchscreen_i2c_pins: qup-i2c2-gpio-state {
 		pins = "gpio27", "gpio28";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	cs35l36_bottom_default_state: cs35l36-bottom-default-state {
+		reset-pins {
+			pins = "gpio112";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		irq-pins {
+			pins = "gpio115";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	cs35l36_top_default_state: cs35l36-top-default-state {
+		irq-pins {
+			pins = "gpio40";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		reset-pins {
+			pins = "gpio75";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
 };
 
 &uart6 {
 	pinctrl-0 = <&qup_uart6_4pin>;
 
 	status = "okay";
 
 	bluetooth {

-- 
2.53.0



