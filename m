Return-Path: <linux-arm-msm+bounces-105478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMs5GVew9GmTDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 15:53:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF234ACE4F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 15:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 85083302E3FF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 13:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7733B9D99;
	Fri,  1 May 2026 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="WFqjLdgq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3985B3BED18
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 13:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777643584; cv=none; b=QqLauhqBdXD3Op5ikmDQEZ5XETrMsxDN5qeyNraN/AbTAHyv7v4EfRmA1W4OZ886Esxy7SfXjgm4G9OP5FKy0OwUTeuRmiHalgDffzEeYVuDZSFN7WGX4Smq2h/aJ1rg8rl3NPtvF0b80umpq/Hf01zwbEaTF5+ymMa5/FXiyoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777643584; c=relaxed/simple;
	bh=4phARy2lOpcG+iFcGU8sNg9eH7L46jQjDqzNVUvYkd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6Vq25aNZwH6XOWOSRxsbSljN/LTqtiGTVHwdIo43xZ66uiH1cgBMA56TzUzRsqeo+sQNYev/JyGePykf0G4Y9J9F4PRf7N9uCsOLDMqiBVVTeAfsMg04o8kM2PX+kfdOv9HkOdx4Fovyncexr2+VoCTBx5AfjkFHCkIM9QbbCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=WFqjLdgq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso14262835e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 06:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777643578; x=1778248378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SprhwydFyCFNRJ6I2mJPFx1qCBc8YzyeEaam9z9ISQw=;
        b=WFqjLdgqikb2NMmt4R0e8pbx4vsG03mmeG9DJn9HCaGT2C/j/P0yZKs4TI/Y+7tE+0
         BD/bQPoHd5iSu+10uuqChkc+24vrL5sGcBcYM+40V00Rm4mqY2y7i4bB3RGkphUi8wXD
         9+i/kaJhyVGf9Ai5Lrch/2LPCoaskWgHnVbyqy6HZAUDbkjgjnpcfgXGg5dAh9RzYD/P
         OWtxEn/Vl3lyJTvn5a7Gnsyr+fUeWRhKSxhExra255dJncv24S9OnrxTcJUgcHIrU9tX
         4SaxMIkw82t0/C1bURo1HwFxcDSG6iSDb7wLHpJLa3DhVhROiWKfUSupQi4HgTbu55R3
         mYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777643578; x=1778248378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SprhwydFyCFNRJ6I2mJPFx1qCBc8YzyeEaam9z9ISQw=;
        b=Ug1PhjFjMYXuPCNVpozZMGNNrNRHl2T3tQSBgG/IIhVnaYGtql0XU4M7fYQkxLCWHE
         30kuSLangEk2dMogoo8+UR1+lXg3LuX5gre05ra12oFYuTWHsEMCj9vI/G41YuDqAW2x
         HmG0g6JoHkYAtJJhySI/LPQGY3i7IOoUf13ISGBZqTsG/hgSPMCxTduJ/QDOCSdZXFKU
         lVzbWwIawGM5TP0CQqrX+TpBg//k7nMsQOgsLPnJEmXKWUf/Ko0lD05ztJByB5nmagrP
         Xqn52lyp7vFpnxuvG0tO5Wcz2uqZ5aWxkipMLkUwRtRURwrCzrlMIWfD2YShKS+IWiy6
         R5AA==
X-Forwarded-Encrypted: i=1; AFNElJ8c+UWF74IlFTvJNurMWwKnJRWQE2P+SeRb5rlc+dYn0BfpMfi6hPo0VqNTvUg/d4tebNrDO73s3WVGmkij@vger.kernel.org
X-Gm-Message-State: AOJu0YzE5/L1HvTngPaLYQSh/ZwCHBTBsbnvP2yfDXdeedy8ncHYtC21
	tTmQYsn601TFkbljN72u6c9rU/+uXMIoePmygU8Z4qRmo/kLR9iU8dGrJ2bTb5jq11I=
X-Gm-Gg: AeBDietsFsrYR8rxEhZ894s5rNda86KTlmF2aTXYZR96GZFMCepXetTv2KZEirOHePj
	ePe7wPRr3jF0XEF2rhMJ+JFJmGSxXVvcS2fYDu8T8sRzFthmkDa1+gdiP0pAB/udMENCwlT8RKi
	nli8Z+kgMATIuxtNaGg6nGr1yyzxmHcw+fO46d3g3NbQWKti0m4uxJ/0CZ1uRK/uaggy42PIMpO
	vZJkyyB+miFyvJ3v/ZzYiEGzhLM+4eMCFJEe0p8/b4RVXrm8K2xtRK2SztfANC+gmyiZCyJbXdV
	IhJ0Zoq/kDEC2m296wtC/qgT6Q47GNqiXCl5mVRnmXvk87cYmiBXIk9Sqk27TXSoV/OWe+Ki0GQ
	slzEH/OswCriCu1jjxSttceTr8Q8ff/AjCjqgSa7MX525lgCDmFNOdpvHMwJ1UTe715E+YGEIHR
	NON0DGwuXQux/qUx8WjaimaX9m+Ly79dc7/x3h9oA/AsZ2EFEDzUyP1vtJ4kKPVRmS2J6w7lq2T
	poXYfOE
X-Received: by 2002:a05:600c:154d:b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-48a8452db0fmr123395355e9.25.1777643578635;
        Fri, 01 May 2026 06:52:58 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a822bf3ffsm143934275e9.7.2026.05.01.06.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 06:52:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 15:52:48 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-fp6-panel-v1-4-e09cb05651cc@fairphone.com>
References: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
In-Reply-To: <20260501-fp6-panel-v1-0-e09cb05651cc@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777643570; l=2182;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=4phARy2lOpcG+iFcGU8sNg9eH7L46jQjDqzNVUvYkd8=;
 b=xUdq3R4ju7VrrbMlrUU/wRM4VE4j/Gq3F++FNx2yt2ZNSkOtxB3Z6xk+BWK459qJKnyJVug62
 HKSGQscN3s/DYYGuA6wGOJHtguzdzmbEjMcO1sdhcPpAPHGR5hKvG/z
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Queue-Id: 0AF234ACE4F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105478-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[fairphone.com:s=fair];
	GREYLIST(0.00)[pass,meta];
	DMARC_POLICY_ALLOW(0.00)[fairphone.com,quarantine];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.593];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.105.105.114:c];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email]

Configure the MDSS nodes for the phone and add the panel node.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 48e87bd8ec2f..a6c467a27d09 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -690,6 +690,49 @@ vreg_l7p: ldo7 {
 	/* AW86938FCR vibrator @ 0x5a */
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "boe,bj631jhm-t71-d900";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_l19b>;
+		vddio-supply = <&vreg_l9b>;
+		dvdd-supply = <&vreg_oled_dvdd_1p2>;
+
+		pinctrl-0 = <&disp_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default",
+				"sleep";
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
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
@@ -848,6 +891,20 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";
@@ -868,6 +925,13 @@ pm8008_int_default: pm8008-int-default-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio129";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart5 {

-- 
2.54.0


