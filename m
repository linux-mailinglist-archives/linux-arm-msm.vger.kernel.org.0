Return-Path: <linux-arm-msm+bounces-93811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNqaFTy4nGkqKAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:27:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC4417CE62
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 21:27:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91D37310C6C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66867377561;
	Mon, 23 Feb 2026 20:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U/ypHDwX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F34376BE1
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 20:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771878413; cv=none; b=CAiwvWb+MFYMNgpj8SSrlQnu+iVFQRpLW1eThJm7KzZaPJtWp3y7PTJe6ZTMWaKCMR9VEp3qq8VFkaBF8ejFunJ4VV6JLqFOJNnCUYytToruEQuUxTR2xe3Su1RV8TrNjmlMK30nYDgI549M0SDpWL3+Od2OKu8KviKGcQiGdOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771878413; c=relaxed/simple;
	bh=CzJleqofENKnSdtHil5FSilRw3jXdV+MFbWEBQ/PF4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0MhEVCgoh/He1wwATxYVcviho+ZhvyHa6+5AH4XMzfsDYod4lCgE7Xv6qccsdKtnAiGJoHLzbEXMtLYNdaHkse2UmKq5UKIG3pYLJtl8lgjVQdLUHq1bgencH8P8oWl9kL0X/Y4woIj8A/I2lIZgVcsH3NJoZ0N1I9x3dvpI6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U/ypHDwX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4837907f535so42843075e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 12:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771878410; x=1772483210; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64I03f5whtjg6Z+0x9fPdRncv5f7XES5+UgOPq8bZgU=;
        b=U/ypHDwXA8x2ef2263UCWgqBBOb82mLEzrGOi56yhESeZuD77KIhrf6i7D6y5wVaXZ
         XruKbH9WGs+RWfTbCKWIBb2Auy1hQJSuqlC4HXju04I5BhJH10NIEUw4jbep58JefuSn
         KA95/VzI7WKMCJsrVBxDGI/jJUyYwba7+IliiJ0S3Auyyfpt2szmRovXnJj//oD8L095
         XcyFCxSQ2PI6Z2BPX7ILNOiOMlro4qjepC9I2zUl3eyc4VEUdER8ukycJ9aLLCjPaIC+
         gqB6r/djSZOYBDn5DiisZJg6X2t5cDIJcsUz9CbVS+idF0RYlwIE+AXmAbvsCFWCZOfk
         JUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771878410; x=1772483210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=64I03f5whtjg6Z+0x9fPdRncv5f7XES5+UgOPq8bZgU=;
        b=wB95xxujlHrfNPnXsGM1PDyFhOXrKql5ZbJ/yNEGK96s/lgV6ViGjWNE4YmUcmBtew
         VHpJGthEjzLFzVFGZzY/r/MgnJVXciHjtfy3IP+q6bJ0Ly65urusQmkFVmHE86OMfOdI
         TScb+BxiRfvr8Pc4norrsBVSQ3FhhO2gpulG5suXJiQK/tn80/Rnm6Dbk88QF8jQvXnn
         pF3RBC7VtVpOqrizxejIsQzLQ3IxXBxqS2lYUXbgn5KYv+PLLjbVFLcLIBDU0+lmPEth
         ONZVgz9uc6hzcAw4YbTm0J1llUrpzNwZ3tx8Zn3RYVe1P68za2WTYF3gWLYUas30izTH
         9DQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUe4VaNLKYjwdHiB2YAB8dF+sfJPhntP/uu338OUo6T01nFu9aCctJS/GPkBkSQKyfRjM4tBB2c3XpgFNYD@vger.kernel.org
X-Gm-Message-State: AOJu0YxjhZANc5BJn+DQM/Tzt9FiXXd1NKEKWYjcXsPaWBnu0r8qGtTU
	punxY6Faqjb5ZYbb6FCAN0spVPgKuLBTMUEPPNZSRYRnBRwd0SnJaUVB
X-Gm-Gg: AZuq6aIDRsl7YU+rXlqeSHy7KFF/H+0fWXXE3XW0pTHK8dvuKRFa0ENzZcXSvXEj1dF
	hs0nZLtZDbx+0u5R6MjCihdt4jg8WVESCuoHCcpAn15dWqjHshpwC4eKmp31kf7ztL40m1eydwL
	EVfe/OkdUbHdxzZWxN4vM+A8oEu5uZY7om7YBL7ZhmkgE7q4nV7q1tivWLUn/4TvN98OPyp5Qq7
	lsJODZrK6q48oHiGju3fcDlU2z9TAVuDhjNQYyE3fCLfh8bQdR73pw3TD/bSK7QrnYxNdRkAZhD
	JJxTEAfYE4/24eZQxHRijhs86xeHrcAPj8Csy5mx3R/TA1ngoSGMmHOq/EA9isTArWaS4VriVCp
	coOPscbCf3o084fZX2PwvDZF6Lwn8sABPR95OlEuNwk3Ybb5YKiPqLGodma9IAANt/LxAm9bUwH
	oOl8veUrVBA6bFl8xlDUGJk5BIbQe+xWSXXIR5GIV5axS8DUgeLU9MUUcsi56KLk4=
X-Received: by 2002:a05:600c:45ce:b0:483:7813:90d8 with SMTP id 5b1f17b1804b1-483a95bd80fmr166896275e9.1.1771878409631;
        Mon, 23 Feb 2026 12:26:49 -0800 (PST)
Received: from [10.100.102.82] (46-116-183-56.bb.netvision.net.il. [46.116.183.56])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54c5csm21369551f8f.38.2026.02.23.12.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 12:26:49 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Mon, 23 Feb 2026 22:26:22 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-panel-patches-v2-3-1b6ad471d540@gmail.com>
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
In-Reply-To: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771878400; l=3240;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=CzJleqofENKnSdtHil5FSilRw3jXdV+MFbWEBQ/PF4k=;
 b=4Hhv4ch+g+2onoP3Oj07ZKaZi7xK++T1hTIP4SwL26WVmrtzuj8vNednVCZtqagKaNtpQGpLe
 ieKeg8ZLtT9Br/fX6to5HizVk92Xfd/E4/eBnIdCZV2bRg9R/PipQ5p
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
	TAGGED_FROM(0.00)[bounces-93811-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: ACC4417CE62
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


