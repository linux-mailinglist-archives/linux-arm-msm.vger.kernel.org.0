Return-Path: <linux-arm-msm+bounces-93700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MF5SLvpjnGkoFgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:28:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D17177FF3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92DF130F3AA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCC128C037;
	Mon, 23 Feb 2026 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Notags+E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089F4289374
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 14:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856661; cv=none; b=gWWNjqpd5VmJS5+1yOdc4jNcKfePizxuNFn92+h7eeU79rujpYt3j+86vK9OM2BAH9qHV25QhUGMqbmGEk4ZymR287zh2le1nYF+8VQ10OppIIHgGXuYaAV1+FBHnr7EySgqvrthryXr/pLofEjobkilgTaX3x4kCrj7LLGtaN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856661; c=relaxed/simple;
	bh=CzJleqofENKnSdtHil5FSilRw3jXdV+MFbWEBQ/PF4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b37jCvGaBklaAYoWa+zUunFulkBYvDHR9Azt8UrP+utt61B8xUTI8eE4+yewbs/s5GuxGA035vjS8C0L4wYC3nikJGlCDradm6ifVjRs4c81R9Irk0j3BAJGqaug+dXZsbGQyy9hYXagLIu7AT4QswN5ucTnd+G3TfPPmppyPGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Notags+E; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4359a16a400so3990014f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 06:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771856657; x=1772461457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64I03f5whtjg6Z+0x9fPdRncv5f7XES5+UgOPq8bZgU=;
        b=Notags+Ez3REVgWtei53N1qB2gQPCylWLwymejWAll2YBdRFQXmVNoBlahyRY7kR1Y
         byYOKccO6NbpQ8oFm3LACV1P9LAz/XOTUGopddMvDTvWjqwriA3HkQrStvynXha6rKB2
         3PoVb5WpO7PhJX9QOmpNVhlzC57QWImDqZdA1pX/cw6E6AJ6vfPNhLSChIK9Ahp+V+kd
         f57iotuEaWAPchCiEQLu/+8H1uUHRm1gJvyuX2HES1jvzgJrTReihTVutLaAliwh21x4
         iV7Cemg8wqerJZ7ao09x47bQE8QbgW5tdfc3D6x8vsj+xtYht6XBsskdkLRX+IyTERUK
         zi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771856657; x=1772461457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=64I03f5whtjg6Z+0x9fPdRncv5f7XES5+UgOPq8bZgU=;
        b=Fq7pJFZu/HNGsvkh2I8TmgqIu5hQKHY3C/KKzQexGcf7roVLWcMQoM6XlGZK/jqNUY
         MPdXr2JsiO18wDY35hyxcTXxwc3WhG396RdP/ol/NBIQ8VmWbxxN0TZ426Dar2sMFaDB
         DQjqToFXDBSCiTqFyvtGhKwNrd5rs92Pbp7kITwJp3jH+KedyoWy/iyaDlT+4XjR9F1x
         Sw4heAGmj1w9I/7pGfu741/7DHZGkEIphJn3Aih4fsrTueWrAvXzyhAY+HkpWO8lu/B1
         kZFWhJLCuv0bd7WQDKTivHRXcGATNeEQTzDDdsfJLYcJZZqA+YCfHWOMpudznmFujyLM
         CfMw==
X-Forwarded-Encrypted: i=1; AJvYcCUnUrH872xrffddHQ8RTIxCy3byMEOcuxTErv9WqkglaALu3E8XdITpBJorv32VyGfEdnDQJGdtk+hN3IkQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9DpE+nzjaIDIfOGrKTb/mKQ66iaN0PEto5zJECssFhFf7be6s
	XIcvG6oweGfOudUCe1Jz4eZDXPekSrld5FGLwHGbMUP9JZSRMA1hp4/N
X-Gm-Gg: ATEYQzxcUncieVAKMIvF2dd+lnkT+XO/Q7wOR1XUVqZpx/AjXX/VMm8Ev05egA2Q3Gj
	Ih1Wz5Vb5Dy69qhVKXVnvGHn4ftFvjm7MoUB9vfT3d5pNu7nbQAdfAhyKY+rruHrrNcxKkuIhHk
	X5WgGicX6jdm+5NoIr0UVk7MMg/GatuM+ig5vda5Vf5miiApfCygrYXe7Rad9BfvYcCq2t5taww
	3vav0t37ym2+t+iLncRAA1ZdEqh+XPNgliuisN61bkFDsdhCMl8Iwk8aN6Huhr8gh1iEnHzFL4Y
	QGGvOAa3kAb0jhQluyYs/f5jxZUKIq3Q41aJ968jbXPbUmZ3vEw/V1stAeGUh5lqwPjBGWUG3iC
	cxHt5mupTSeCgIQSqid4kIBpPm1TKsEee2AKpLgkia1UIurp9VkQ3FkSKHnIx66G1mML1G932qB
	Jg528ZllX4T+Lna1wJNgDtPbVuq+5RdTTbPK2GO1OoBrtxxoMlJHrucXAUD168qLQ=
X-Received: by 2002:a5d:588a:0:b0:432:dfea:1fa8 with SMTP id ffacd0b85a97d-4396f182684mr16248759f8f.45.1771856657191;
        Mon, 23 Feb 2026 06:24:17 -0800 (PST)
Received: from [10.100.102.82] (46-116-183-56.bb.netvision.net.il. [46.116.183.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm18713233f8f.3.2026.02.23.06.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 06:24:16 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Mon, 23 Feb 2026 16:24:04 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable
 MDSS and add panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-panel-patches-v1-3-7756209477f9@gmail.com>
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
In-Reply-To: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771856648; l=3240;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=CzJleqofENKnSdtHil5FSilRw3jXdV+MFbWEBQ/PF4k=;
 b=zUj0Qz+K/lwWYCkXuLWVaoqbWju0xnDdWN3TE6aNBKe+76amnI84XGVL73nBJ3j1iBB+P4Sgd
 NA0bUalaWdQDkR+kWvfXdu3ZX8Tr3YAU8o0GpOJfBlfU+IuPMCD47d3
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93700-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,lists.freedesktop.org,vger.kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 57D17177FF3
X-Rspamd-Action: no action

Enable the MDSS nodes and add supplies and bindings for the Samsung
S6E8FCO panel.

The ldo and iovcc pins boot up with a current of 16 mA, but they work
fine with 2mA, so I used that.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 994fb0412fcbdf5466f87a325c48b697a37b514b..10fd01143a644004b807fc455d2235f8e6a9737a 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -82,6 +82,32 @@ key-volume-up {
 		};
 	};
 
+	panel_ldo_supply: panel-ldo-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_ldo_supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+
+		enable-active-high;
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_ldo_en>;
+		pinctrl-names = "default";
+	};
+
+	panel_iovcc_supply: panel-iovcc-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_iovcc_supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+
+		enable-active-high;
+		gpio = <&tlmm 124 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_iovcc_en>;
+		pinctrl-names = "default";
+	};
+
 	thermal-zones {
 		rf-pa0-thermal {
 			thermal-sensors = <&pm6125_adc_tm 0>;
@@ -128,6 +154,46 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l18a>;
+
+	pinctrl-0 = <&mdss_default>;
+	pinctrl-1 = <&mdss_sleep>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e8fco";
+		reg = <0>;
+
+		vddio-supply = <&vreg_l9a>;
+		ldo-supply = <&panel_ldo_supply>;
+		iovcc-supply = <&panel_iovcc_supply>;
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
 &pm6125_adc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&camera_flash_therm &emmc_ufs_therm>;
@@ -387,6 +453,34 @@ &sdhc_2 {
 
 &tlmm {
 	gpio-reserved-ranges = <22 2>, <28 6>;
+
+	panel_ldo_en: panel-ldo-default-state {
+		pins = "gpio26";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	mdss_default: mdss-default-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	mdss_sleep: mdss-sleep-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_iovcc_en: panel-iovcc-default-state {
+		pins = "gpio124";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &ufs_mem_hc {

-- 
2.53.0


