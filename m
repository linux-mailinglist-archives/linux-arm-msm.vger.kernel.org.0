Return-Path: <linux-arm-msm+bounces-97197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDhMBMapsmnwOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:55:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F35F27156B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 12:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C87583068D25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 11:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506A03909A2;
	Thu, 12 Mar 2026 11:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSQSpCF7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94761397E71
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 11:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773316523; cv=none; b=AyO6NCyUndVxKo3wUgNw/cod/zXC75jf2xVP41GP6ePDr70+wVmydA3PB125zfSmdkx5m6jRjUbccjFhRZgv3NsBiR3K3MfP9H1L6HhIfRPvwRwEMTn6XZTXqdxbAYU0BNdaGPESUHRgy6ZjV8yJD/kfe0/2eB9IvZW1MjY6Cbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773316523; c=relaxed/simple;
	bh=NMCnP+Vn9CRSuVMeCq9y74f40B8hugn2Hc7oZ++rEeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jgHb5k2SoaUwfbt+uJ/H2hJuPXxUM1nNObIhHXRyj8wV9YhAU2FEIUxO863UboHjP4Wb1ISL1Xjr/06ZVFVfqQM2IuLL/3k55nG5lCwvHXpgKSmKKoRX8ONYc5HijcC6qNic5QZFE46P/45j7WD3lmXVdxJ/bEhj5gkItkN/OIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSQSpCF7; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439c56e822eso980155f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 04:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773316520; x=1773921320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=80Lm5IjiUIX059jl1E/bAPpLCGfF21FnmJFKamm0ixc=;
        b=fSQSpCF7d0F4Ry1QQIZoYDoCO/bOMHD++5QQHVwv8eYx/IpXgLrb/0boxp6QQVGANq
         X9Hm5Ub72e/gi1geTutEZWGdccvb/k+kxdpfUEcyjrHHW6OOtXbWI72scX76NmOSLPdN
         Gd2cb0k5f4xxEzngyAyYIq4TukE1Jeh7UEdZZrbL24pTEWUYuSGzbboQFm3//L1Z8ezg
         KfQ/+rWryQqtTaCuiIbWw1tOMPyGP+e3IYoEqWBXuSuTHmN5eRhqYGhZU9eNxwFcffGe
         bepfrmp8bNkEl79iso7GhRysV4opm/cSp+jg2rD3EBevfsLGK7V4Z10NdVJiXxF3ZeSf
         EWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316520; x=1773921320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=80Lm5IjiUIX059jl1E/bAPpLCGfF21FnmJFKamm0ixc=;
        b=rJYU9vxcnoRZ7NLuBIZxqXgBQmkSSrLCLwzRdjhU9XDoMZNJQACsy8s0msi+XNqssU
         iQ/mlQdNtQcG6mDUjLjmcJaDKUE2hrjvci6G8rlxfDAQqvNztcD73VZwafmFrXBvwTfk
         Z5LF5j5n/O2Bl/W04sBQVM5PMK21iLiD2dHnHDFtveI/RTqJ/B7PLf0g06efYFB3JIwq
         RKSCUKT1mRX6G/Z4Dtadot/INo8fukEDEl6gTgLMvMqdCIPnxXWOOmaNoia4I0DSQXKb
         X/eieC3PuxDzTSgBak4HQdx/ZcOJH3m0KLBGvqvGABvQxxp+QWj+32C9Bfwqij8Wip3F
         iOPw==
X-Forwarded-Encrypted: i=1; AJvYcCXCdy7e16mJmePQNbv9cMfyBAhQhX/rwnOF3yHhgs03VKZzzRDDaKUFsViiPreO9fyH2q7dOMsG907cf8Xs@vger.kernel.org
X-Gm-Message-State: AOJu0YyIR0DshIesjMLrhAi+vrUM39eGKPFagfdgJ9BX+W0TwhBnW7TM
	pj3FQ5w0JopZI0CV5kDUyjecG72+JPDUd5iV73x5OKW2QG5RYllwcNkV
X-Gm-Gg: ATEYQzzm0pLwxLL/sNcjSYGK/dXukcxNeYL379+9ocAoxfGyrQi/g9WS0J1+FHNBe0I
	AHOmod4hUJny/7XmM4JRQIJJfLDiiYD7JvJzSh+Fd5WAt+ms2DxWx0PBfwu7OXgQN9ZGOV+vin2
	JfMnGfIpkJkjJgpSOK7uBYU1+mZion33zQgpwrqbEuqVl9MYMZCTwV1r5tVJOBTr4kBZTWjYb9I
	+mqeahXI3K8po4aLX0Ld6v1Jn05ZQTE5n+qQWl8Uh7d0MUvffyCX1NIW3ZmxqmA9beYDCkkUTwT
	JG0Zx0qavsF0tCXDCNgOAfSsbmDtOaLMOa2mkmQEwwBy+G1Cw7/cVXgVsu0V1xSbigV9T6GS1kd
	RO9VUza9j7Y3j8qshFTDrvKfvTM+dz9DRRtrXZ9ug2EsqkcDd+fGzA/3I9S8lvtKlNaW0fHcEdo
	a39tCHiiUJKu0fewRHf4zCTxhvWugCcJcV4XDLgRF1aqLa1V8P4AZ82wOkkdZoc9o=
X-Received: by 2002:a05:6000:4029:b0:439:b6c0:ea86 with SMTP id ffacd0b85a97d-439f81b6370mr10386697f8f.1.1773316519830;
        Thu, 12 Mar 2026 04:55:19 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm7058657f8f.31.2026.03.12.04.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:55:19 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Thu, 12 Mar 2026 13:55:10 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260312-panel-patches-v3-3-6ed8c006d0be@gmail.com>
References: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
In-Reply-To: <20260312-panel-patches-v3-0-6ed8c006d0be@gmail.com>
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
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773316510; l=3281;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=NMCnP+Vn9CRSuVMeCq9y74f40B8hugn2Hc7oZ++rEeU=;
 b=zYQWzhpTIbcPuQxsdVMDtlcN2tNPR5qKgoIzLDC0rIWjSAqELBfMLtEVOHPJOL/SQ8qRsoKW9
 Smzws947TVODHaZhvs3rlnKeuJQ2+EYh2xyXsAULJ9eu1Q/gv7/D9Q3
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97197-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,vger.kernel.org,lists.freedesktop.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7F35F27156B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the MDSS nodes and add supplies and bindings for the Samsung S6E8FCO
DSI controller for the M1906F9 panel.

The ldo and iovcc gpio pins boot up with a current of 16 mA, but they work
fine with 2mA, so I used that.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 994fb0412fcbdf5466f87a325c48b697a37b514b..878b7cab479fb173bbc01ffb653e306e52cae54b 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -82,6 +82,33 @@ key-volume-up {
 		};
 	};
 
+	panel_vddi_1p8: regulator-panel-vddi {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_vddi_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		vin-supply = <&vreg_l9a>;
+
+		enable-active-high;
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_vddi_1p8_en>;
+		pinctrl-names = "default";
+	};
+
+	panel_vci_3p0: regulator-panel-vci {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_vci_3p0";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+
+		enable-active-high;
+		gpio = <&tlmm 124 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_vci_3p0_en>;
+		pinctrl-names = "default";
+	};
+
 	thermal-zones {
 		rf-pa0-thermal {
 			thermal-sensors = <&pm6125_adc_tm 0>;
@@ -128,6 +155,45 @@ &hsusb_phy1 {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l18a>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e8fco-m1906f9";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&mdss_default>;
+		pinctrl-1 = <&mdss_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		vddi-supply = <&panel_vddi_1p8>;
+		vci-supply = <&panel_vci_3p0>;
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
+	panel_vddi_1p8_en: panel-vddi-default-state {
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
+	panel_vci_3p0_en: panel-vci-default-state {
+		pins = "gpio124";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &ufs_mem_hc {

-- 
2.53.0


