Return-Path: <linux-arm-msm+bounces-97710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOBMG4rXtWkn5wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 22:47:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F2A28F16E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 22:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6D79F302F71E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Mar 2026 21:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304163859C2;
	Sat, 14 Mar 2026 21:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0GuyJfQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB27A38A713
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 21:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773524800; cv=none; b=BY1XJJRUS+OPM5D9e2o07B1qH/ryTKhhNT/B2cVZT25tcwH3i7DKNDihi3B+saW6q5pPXSrJr6XZ349YYB83nplWKdHzmtMg+H0LIrWghokH8VAVjlUhFDbup1Z0ivQN/yJnuI/YTh3gdEktT+t6xPtCf4Xh8WZuWifNlqTZdzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773524800; c=relaxed/simple;
	bh=MowvpUKBHWcPnQE4YIK2nePYkcrVYnXiFtHKOMsDddI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tM4HG0ZhbXfn1DOANaW+pBNNayZJHX4cz4Lgh/cvmZvLX2m6h/oofWvflDx7pJHXp7SmySx/lwUm3J3FFE0y/TidwovnbMs0CGn7BtS2WDv1G33r1IslRUANdfcDN/YBkKx28END78g6EcPNTHfAApkYwGmRKppYMRsrYYZXrVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0GuyJfQ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so38968085e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Mar 2026 14:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773524794; x=1774129594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dsoJTFfN3Lcp672vnl+BCSyX/e4yOnsEQpHNAiLSlIQ=;
        b=A0GuyJfQc94m5UEhtTIfAdq56YUBCYJWaSTIsRFCT6Kgz6om7Ixa9ZtQ6UhzyQF9MH
         XRUwy8aBrbrasIrhuDDENW++4Ap3cgP8a7pOuTQlB3jFPdCoTNWeoSNFcmUQzkzHSqDN
         4EKSOHDYHmb1KYoxly/puprbnFDn89A+YQnmkIZjkhhmBSEjcwINDA3o+YJz6vl1ZYlM
         vyT29FXXpPAk6Iem0Xm52K2L2ImlOr6vBOFbl+U4RPjk0LhlheEa9YvXsTAbuJ1stGXs
         nm5u1sM3hIV48KONjgevjD4kID32ehSZ6pQalctH9JeMGfth2ieGsKQ/jiJ/eCBhKtfJ
         /f9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773524794; x=1774129594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dsoJTFfN3Lcp672vnl+BCSyX/e4yOnsEQpHNAiLSlIQ=;
        b=F6xjZ+YENT7RRF6ocl2qPfLyMBrYg2bqbDItrKgx2jKpDAiN1UlY3a/sVM1H9eBj3Z
         8PbuVHzkTOUUsiGnOyG6ia4Pl6oq5vtwLiwjXNni2TXhx3xRNujfiptSvthRjMX698Xm
         CcoJuNXMQiYFrxbhtpf8WgnFEPoI1gSsS0mwiPZlfR0mq0Uiv3OjDve3pnmPT72L8tbH
         OMm/e2N6l2csAT/lRueJpoei0Kwg8LIL0m63HNOLDuBxbD8/kGAHRIxX1oxWvTmfr0Wo
         O6dsm8XX2ITd1RoSwjaAix0QJkki4qbHYY+1Sg+P3eqQBOtUzmkNmcJag7bY2rQDtIby
         3ETw==
X-Forwarded-Encrypted: i=1; AJvYcCX8D+f+s2+n4nNJN5OOQL3fm7Yf3t0E0Olrm+1XqC+sY2F29MSufCNuRyw/pauM/ZHJsrj7kKEuMxCAadMq@vger.kernel.org
X-Gm-Message-State: AOJu0YzbQeig2t13pPwdYMr9EQtnkwDCYNCCKl6uab/HYWDEhSu8jmxs
	3qE9rH7nRywyoR41rAx2AG+vHkMaB89gK49pob96+sfh0d3+jFCKvEu8
X-Gm-Gg: ATEYQzwJn3hgj7Y+c1DgkOBfu0+uAjMt+luuq6I2cSZF0hI1Jyid5oSbcdq1XQKwc58
	ht2vVbghF++gmBnKN5DdBA1cm4ckBPiOWBvKtEUjhnX6nMgSq+ASR16blAXrqTDl6zReNq648jR
	eDG8Lr/hAHLTaVuqaD8szH3bxeZht4e25W6Px/Sl2qj1D+GsWzigxG2ofceDsb6Lzkfx0GSUzgO
	Vkw4e3GBzNHvw/XusqHwWGvmF7IBpKMoYvlFy7T/kC+gRWhd0flq7d/7PmJhyK9pPx5/uHE6pj+
	IHswfDlcsjbLa45zjL0uegbbarOSjhvo8X6uShwBNbdKRFwrCUJEgSPijCtAK57HtpdkT9NgRoC
	y97m6lwfJxyru5d0vSj7e++JwrcJhZdbDvCD/Ta7Q+l7OrGwcf6O6oxG7mbjEstDGpOA1MA6+I2
	o2sWXHlQZ7UVNEqmETjEo2rmAgd/SFFvM6ie20xsDNxFg16FhnHmyEG4BpVTZN7txXcg8C7aJf3
	Q==
X-Received: by 2002:a5d:5f53:0:b0:439:bd26:3c63 with SMTP id ffacd0b85a97d-43a04db4bf4mr13896214f8f.28.1773524794034;
        Sat, 14 Mar 2026 14:46:34 -0700 (PDT)
Received: from [10.100.102.17] (89-139-129-65.bb.netvision.net.il. [89.139.129.65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe19aec5sm28756221f8f.4.2026.03.14.14.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 14:46:33 -0700 (PDT)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Sat, 14 Mar 2026 23:46:23 +0200
Subject: [PATCH v4 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260314-panel-patches-v4-3-1ecbb2c0c3c8@gmail.com>
References: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
In-Reply-To: <20260314-panel-patches-v4-0-1ecbb2c0c3c8@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Yedaya Katsman <yedaya.ka@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773524784; l=3473;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=MowvpUKBHWcPnQE4YIK2nePYkcrVYnXiFtHKOMsDddI=;
 b=fjAjMIu63T3J89KrTMFMgceNzP8z3eiyQ/RYVuk1rw4Xso+FdysYzfH7tFEqPaGpEPjECwufA
 ZyYAKfsa9lhDS0lbq+DfbA14HoN7LNx4Kv9qt9tfs+0v9ATS6TkkIjO
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97710-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,disroot.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.sr.ht,vger.kernel.org,lists.freedesktop.org,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[23];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 10F2A28F16E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the MDSS nodes and add supplies and bindings for the Samsung S6E8FCO
DSI controller for the M1906F9 panel.

The ldo and iovcc gpio pins boot up with a current of 16 mA, but they work
fine with 2mA, so I used that.

mdss_dsi0_phy is powered by VDD_MX, see power-domains in sm6125.dtsi

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index 994fb0412fcbdf5466f87a325c48b697a37b514b..9b046d21da1dc54bd851a94d0e209bf1763e865a 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -82,6 +82,33 @@ key-volume-up {
 		};
 	};
 
+	panel_vdd_1p8: regulator-panel-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "panel_vdd_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		vin-supply = <&vreg_l9a>;
+
+		enable-active-high;
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&panel_vdd_1p8_en>;
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
+		vdd-supply = <&panel_vdd_1p8>;
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
+	panel_vdd_1p8_en: panel-vdd-default-state {
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


