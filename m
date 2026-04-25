Return-Path: <linux-arm-msm+bounces-104518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FmJFX2f7GmtagAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 13:03:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B7E4660D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 13:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62D7A300B04A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 10:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE71D3947AA;
	Sat, 25 Apr 2026 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkcJXycG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBAD391517
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 10:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777114602; cv=none; b=ktre4AqL7Z3IGgbsTqeaAC2OmSmstdjntfMJRwSrVerDBS9GNfiyjIdBstiOxCHgjaB8vurKoSlxPmXJPsGKC88TPjgbQVLoDwZsGvrltBD5ZBLubj2qQ5GqP7ptYZ3YtjKIPVsoZrv8fBtlLxE655BCyjJb+D7OcXHEJ+VxvI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777114602; c=relaxed/simple;
	bh=G8vVfNfEog92l5bB0QaSDlC5S4L8KtRUiECZfYd7jNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=likMPyYRadhpB99X3uvZVmRWDXWhuuq13OAO1LdoPxH5P7UDzBE0eZjIdtDYpperPXohs48zV+P1ioIk1HfsDtjPD86bMWwDjOXVATgOK47fCHXz6j7Z29PlwvF+JJuxTRWrQ+lfSzMY8dH71mc4lDluLnLBSGwFuD1v3wc7iP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkcJXycG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a871daa98fso57125215ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 03:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777114601; x=1777719401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n09TuySP0iJDtxFxYcR0L3xSG7A7SGVHN224gUHuUN0=;
        b=dkcJXycGhAbKAjTG2EFXBRakFC5BQLHhN7UYIwTllD03hbqxn6JBqbIc/uMNicOeXz
         BQdC/4RrCtwBf/cOBB1am0UAxkXnW2FIknAml6gQV4x+L58zCcW02B/WLtqWfXrCwYND
         sYCuMz2FSF9AnpJmxg/ahXcwfiFu5gHB5aTA9txO2be3hUXUHX2E8VuFray79wBZIqDt
         ai3H3JYKJFgjmzdNvpwM7Zrvef+BpGic/DkU1Ded3PRxDVSYLAR8jFUdFaSeDSYk69ar
         Lb5i+ahbbjwsgg55rp/53oupUpQ/qlaZAMrpPQ8hiiYcQdmvLqi+FSXDUwAZw4Ho2zTF
         WfIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777114601; x=1777719401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n09TuySP0iJDtxFxYcR0L3xSG7A7SGVHN224gUHuUN0=;
        b=N3mqWna8S42s5mRyDHNQg1z7p7dCqkdYHgTV/5H/VHb4KvmGQfGdgzjc4KExEsmrQl
         hZKkn7L03wZ93iy59+L+g5j4q2nZ+dPZD/SLl8ecDoBQ1kf0lr8HjPbbwVeq9RGtU3xj
         8c9F515FaePyUiOBf90u+3RKxhWRNAKEcT7MK9Dl/wm4Qw5kxLjYEJ9JRtSqUUYhQxfv
         K9L9oSErndBC93izwmuenfKAmfBeHx1LMOM4JhDlXCXS1QbetWhHehX3G/UL5JOKCl61
         NJcpbWHBGx4UWpPv35kIJBsbzEAoF6EOk5M2VotdFFgFkrHsXb42HLScuPBqEL9NDT9x
         KaEw==
X-Gm-Message-State: AOJu0YyqOymEapGp47AOf5+/TiUw53dEmlMbcWnwJ8TjWptq1XIthI5e
	vatpzHbndPROl4BudijkpnNVEMPTeun5aUleQ/2SN0mfZDV/CVgzU+9B
X-Gm-Gg: AeBDieu8xuYJ7RIsnW/68xQ3s4QREYZJy62KHA4LUrXGAJM8kZc4xOHfZ0Ufxw26EkI
	nT0PBapYsS2l9JkmYmujRThmyJRY5B0O+VkHEzOFFnjTcrU3CWSkBbc/aAzNVPzS4n6rRghEGmU
	IIcQXA8udUdKelFx+O8U7fTsT9gvKwzvyuo5pH8uO4V8YDhZJTUBLJdmnUG3Ws2KXeuGFIDptAS
	70pgPN67NwZeci79xjQdzSeZ2kIQtq8FYIqJeHNjaWZF4gqsBqo1fkfrzq5BAv7iwrMfZqOu683
	CDGsOLtb0kFJWTNGcinOq8HUy4GtN4f7Q8mqfp/+k8948BAjwwpUmSKPaWbZOLqGNyPIXus8V8r
	FAbYjvApDteZzuX95kTuhd+X4QeF+3P2q9l9ATWWOyp7YOsjkJMUSRKiw5LEUyc9DGLibw3P/g1
	96HlamLRChxoJw7SdiXrbHllWMnSbMyWoISpW8yPU=
X-Received: by 2002:a17:902:ca8f:b0:2b2:4cd2:e162 with SMTP id d9443c01a7336-2b5f9f61d80mr253247955ad.34.1777114601035;
        Sat, 25 Apr 2026 03:56:41 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa33486sm303832345ad.33.2026.04.25.03.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 03:56:40 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Martin Kepplinger <martin.kepplinger@puri.sm>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH 3/4] arm64: dts: qcom: sc8280xp: gaokun3: add front camera sensor node
Date: Sat, 25 Apr 2026 18:52:59 +0800
Message-ID: <20260425105300.745044-4-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260425105300.745044-1-mitltlatltl@gmail.com>
References: <20260425105300.745044-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 93B7E4660D8
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-104518-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.20:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.580];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,2d:email,0.0.0.3:email,0.0.0.0:email,0.0.0.50:email]
X-Spam: Yes

Hi846 is found on my Gaokun3, descripting it.

Note that it seems that only Goakun3(3.0GHz) version is equipped with
Hi846. Goakun3(2.69GHz) version is equipped with S5K4H7.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index 9819454abe13..39e559e91289 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -15,6 +15,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/phy/phy.h>
 
@@ -27,6 +28,7 @@ / {
 	compatible = "huawei,gaokun3", "qcom,sc8280xp";
 
 	aliases {
+		i2c2 = &cci2_i2c1;
 		i2c4 = &i2c4;
 		i2c15 = &i2c15;
 		serial1 = &uart2;
@@ -47,6 +49,21 @@ framebuffer0: framebuffer@c6200000 {
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		pinctrl-0 = <&cam_indicator_en>;
+		pinctrl-names = "default";
+
+		privacy_led: privacy-led {
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_WHITE>;
+			gpios = <&tlmm 34 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+			panic-indicator;
+		};
+	};
+
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9380-codec";
 
@@ -98,6 +115,20 @@ switch-mode {
 		};
 	};
 
+	vreg_camf_1p2: regulator-camf-1p2 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_camf_1p2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		gpio = <&tlmm 44 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&camf_1p2_reg_en>;
+		pinctrl-names = "default";
+	};
+
 	vreg_misc_3p3: regulator-misc-3p3 {
 		compatible = "regulator-fixed";
 
@@ -462,6 +493,13 @@ vreg_l8c: ldo8 {
 						   RPMH_REGULATOR_MODE_HPM>;
 		};
 
+		vreg_l11c: ldo11 {
+			regulator-name = "vreg_l11c";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
 		vreg_l12c: ldo12 {
 			regulator-name = "vreg_l12c";
 			regulator-min-microvolt = <1800000>;
@@ -577,6 +615,66 @@ vreg_l10d: ldo10 {
 	};
 };
 
+&camss {
+	vdda-phy-supply = <&vreg_l6b>;
+	vdda-pll-supply = <&vreg_l3b>;
+
+	status = "okay";
+
+	ports {
+		port@3 {
+			csiphy3_ep: endpoint@0 {
+				reg = <0>;
+
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&hi846_ep>;
+			};
+		};
+	};
+};
+
+&cci2 {
+	status = "okay";
+};
+
+&cci2_i2c1 {
+	/* On Goakun3(2.69GHz), S5K4H7@2d, image quality is better than hi846 */
+	camera_front: camera@20 {
+		compatible = "hynix,hi846";
+		reg = <0x20>;
+
+		pinctrl-0 = <&camf_rgb_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAMCC_MCLK3_CLK>;
+
+		assigned-clocks = <&camcc CAMCC_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
+		vddio-supply = <&vreg_l2c>;
+		vdda-supply = <&vreg_l11c>;
+		vddd-supply = <&vreg_camf_1p2>;
+
+		leds = <&privacy_led>;
+		led-names = "privacy";
+
+		orientation = <0>;	/* Front facing */
+		rotation = <0>;
+
+		port {
+			hi846_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <80000000 144000000 200000000 288000000>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};
+
+	/* actuator???@58, Goakun3(2.69GHz) only, eeprom@50 */
+};
+
 &dispcc0 {
 	status = "okay";
 };
@@ -1318,6 +1416,36 @@ hstp-sw-ctrl-pins {
 		};
 	};
 
+	cam_indicator_en: cam-indicator-en-state {
+		pins = "gpio34";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	camf_1p2_reg_en: camf-1p2-reg-en-state {
+		pins = "gpio44";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	camf_rgb_default: camf-rgb-default-state {
+		mclk-pins {
+			pins = "gpio17";
+			function = "cam_mclk";
+			drive-strength = <6>;
+			bias-disable;
+		};
+
+		sc-rgb-xshut-n-pins {
+			pins = "gpio15";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	i2c4_default: i2c4-default-state {
 		pins = "gpio171", "gpio172";
 		function = "qup4";
-- 
2.54.0


