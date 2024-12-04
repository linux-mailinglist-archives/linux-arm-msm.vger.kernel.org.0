Return-Path: <linux-arm-msm+bounces-40388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD7A9E46E3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07E85282EA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45EF207DEC;
	Wed,  4 Dec 2024 21:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKoOW3El"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00865207656;
	Wed,  4 Dec 2024 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348126; cv=none; b=UvJssyLSNUdvkeqOMVds9ejyxRXY1w7pHFtfelwyE4sFLidtz4BUIaf86FnuyzrVHM8df2l4o1Kbwv3ygoJT3aAG3EHGJwME/x/cxeckEgMBihHf4lXQhp3m0rECtS0qShSAuvuzMhvSZ0yv/sAw3F0J0fIcd/TzjeEM+8k8RDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348126; c=relaxed/simple;
	bh=uW3TPvnyVbOWrR6A/8rgsRdgj3Yworgcih8zs6Uk61A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cbSrgRXkIZr2msxSeG/LuSC+8pXkwA7U8TcOOWZ44ToWNaauxLLHSwsA/ayM3/jRnBnxyhyBICGjOtg0ixI83SIkbrqaBUJAojvfa+/Ki3XaoCmRLDCV4i6PrQq+AE6FcN35GCHXJbfh4t7e0PX9UeB0pj74knBCdGQZlz2ei6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKoOW3El; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso32118566b.3;
        Wed, 04 Dec 2024 13:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348123; x=1733952923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwFQy8X+WDgmt521NCES9Gjn+QOPDf6YmgCxf6bOiC8=;
        b=MKoOW3El7b93JGUDXG1j+VQ3uU7S1p1Po+AtuUzsutCMHjKt9i4O2vviXJCSwcGqYj
         qecMm5HckvrKMZwdjxQSdsXX+cpMcOJzjBH1GPq/a3GicKUD0GiAjeCkwUDOj6owe1xA
         q7DUCgT+/eijglN+oHBdhiMX87FtyP9RNmxGgzTYwchX53abmLxNwM8jofsL+L0dOqqO
         zJqivi0qgkhrDYjsGBIE/eBK2AkT9mcaR34P6IhWYe17XszY3lVxNV91m6PNXrN5HXxa
         JXohCFlR9uKY2XbB1NYxoA+jhgANtuyxKlT71uQEpxJ10MCkPPl13gzX+bNmacpNJdW5
         pnvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348123; x=1733952923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwFQy8X+WDgmt521NCES9Gjn+QOPDf6YmgCxf6bOiC8=;
        b=P0x3MDdf0ikadapWXcGgROwWZKc55u1PYkITGP5UKSwWF68k4U1ETo6bEZSsSTTNZX
         EF3WZ0KC7QUPRg/RsWVCt96Lok4EqW6lU423lMjr1csbXjX7YTwHMo7T4MmN/rGzHZjd
         JiHy2ymT1nNjeNkm7cYFUdfDuoQDW+WP5/ZJzezQDngvFoAp++xaqKDcdi/yFo9UXNtu
         9Cc4Q3hCqbJniEiK+SG2OsqZ34sKduVDOWjYWYomM/etlnK9pmG5MsgbeRyRDZwC/J5p
         OOtV/5EkC85TneBD0WDwVeVuVrwsWJoNQT6vwMa/FfpoEdl4LGDoqPM5SBiYGZhxpylw
         KlwA==
X-Forwarded-Encrypted: i=1; AJvYcCVpSdMRRCSB71JRic1sUO5G/j1c8R23tg2UGg8Jy19+lY33eUSb9y2TMl0A5KtNxxxm+Rx/AgqchZBiaGI=@vger.kernel.org, AJvYcCWpcxXEyHQhD1U5DNZqQQhnLr6xKxx7+kwTRj27k6EEvPaPY1bgEf30hJI8zyz/uXhB540kz/ie0aHx@vger.kernel.org, AJvYcCXMnmGx7UZe8M4V0jl+V2I6ZC+Sz/Ks/4IdSqaAec0EnKBECGcv15LV/npu/MPk6oXPVaymtflWbtZo5z9q@vger.kernel.org
X-Gm-Message-State: AOJu0YyMnNL2e/T/3m85sYXLzvTwJsbeQOR1k1S/l7GvmpY6l26pE/jr
	kcD+pIYCKhhTjFRGvon2DDIrEEkbGJbL1jyC7RqvzHsdGlB3xga8TWvUpA==
X-Gm-Gg: ASbGncthTYgauCajYLVfI1UbWYTo2YSDvK4FBXKZoI2rDUoPSxdpHrC+JGC6RMa1J+7
	p2iQImc0uGbeuh1RetWGa81HbUzcrTm3NCYeujFOChBBWD3Ce20kPF7AtRFGiOKk45C2atC2ONp
	8nOf9h9On9IAOZ6B0QI0dwrGxxcUoK+ELwnK9DoRmCgfHT574dXDCgUiAeOsi+Wbom/ap4KIHUg
	NapAnn8Qz2YeJs+cf4eAgVARM8LyeFTuOJYMVP0hg5gZn1v
X-Google-Smtp-Source: AGHT+IEHXts7Ylf/aSIM/txH9nDWPDxCNc1p/Vf/oBZserS/EJIF8uqKXRw6B8TrBFf92AaLPILtjw==
X-Received: by 2002:a17:906:fd8e:b0:aa5:241a:dc77 with SMTP id a640c23a62f3a-aa5f7f2a1b4mr976130166b.54.1733348123126;
        Wed, 04 Dec 2024 13:35:23 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:22 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:35:00 +0300
Subject: [PATCH v7 13/14] arm64: dts: qcom: sdm845-starqltechn: add
 graphics support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-13-84f9a3547803@gmail.com>
References: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
In-Reply-To: <20241205-starqltechn_integration_upstream-v7-0-84f9a3547803@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=2444;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=uW3TPvnyVbOWrR6A/8rgsRdgj3Yworgcih8zs6Uk61A=;
 b=m9a3NyVMdItCnJRIRP2Y6uwwrqqoROFKdb+mQDjBRkhctZBn5tbNcqoYz0Zc/fbjkeUf4+dPU
 UQEmLCfCoXHCyIJJTv1ZrY7C+OKkBy0IPU0n9QhrEGEHKaKVCSAZB7S
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for gpu and panel.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes for v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject
- refactor: remove 'sde' prefix in tlmm dsi nodes
- refactor: place tlmm dsi nodes alphabetically

Changes for v5:
- fix label names
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 04ef4f030931..15997cb88576 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -208,6 +208,52 @@ vib_pwm: pwm {
 	};
 };
 
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm845/starqltechn/a630_zap.mbn";
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l26a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,s6e3ha8";
+		reg = <0>;
+		vci-supply = <&s2dos05_ldo4>;
+		vddr-supply = <&s2dos05_buck>;
+		vdd3-supply = <&s2dos05_ldo1>;
+		te-gpios = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&dsi_default &dsi_te>;
+		pinctrl-1 = <&dsi_suspend &dsi_te>;
+		pinctrl-names = "default", "suspend";
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
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+	status = "okay";
+};
 
 &apps_rsc {
 	regulators-0 {
@@ -860,6 +906,27 @@ &tlmm {
 	gpio-reserved-ranges = <27 4>, /* SPI (eSE - embedded Secure Element) */
 			       <85 4>; /* SPI (fingerprint reader) */
 
+	dsi_default: dsi-default-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	dsi_suspend: dsi-suspend-state {
+		pins = "gpio6";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	dsi_te: dsi-te-state {
+		pins = "gpio10";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	i2c21_sda_state: i2c21-sda-state {
 		pins = "gpio127";
 		function = "gpio";

-- 
2.39.5


