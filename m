Return-Path: <linux-arm-msm+bounces-33601-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F0999550D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 18:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB8F5B25F6F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:54:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696B51E2618;
	Tue,  8 Oct 2024 16:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoTNoUBw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23A51E1051;
	Tue,  8 Oct 2024 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406346; cv=none; b=JhQKeX66C3sY7WTAbDZa+wXWczLxwVJjpvpgC+dcKm5kZTPaW2VcdnwKUw1LGza2Vm2cOv/ruEJd48IzdlSu0TDi8YfTmMqM2zupzkW9G+rX080oX36HwEFLGJIBZaVW11tyVoLM4lmAM5/Mp3kkDDQRkLbin6ySK4Wca4Ldn+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406346; c=relaxed/simple;
	bh=rcE2/GmrbbYrMkpcfScPpgvsQj4SBqxIMfT54Ac5TRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rj0vM5k8cVdhuNX5H88o0w4hxYeJKEXVvR8JRsGRz2UpF5gtq1eLgxZ0FKTexuUl/SlfsOHoTGkOFcqUviKekkcwRfD1h/nc0uaRzkXY+LspNi0jqB21Jq+hfV8nUJSuEb9HrZC9EHv4xNscnClv2+ZWCXVLCLnepmtob6nai6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoTNoUBw; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-537a399e06dso6169390e87.1;
        Tue, 08 Oct 2024 09:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406343; x=1729011143; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SnNDfwNKoG43QWQYWXWnF2oe/+JuCEPR6mrRjTttHk=;
        b=BoTNoUBw8Yy80Za5bs8tLHWbjws60mLjMJpaZ0uf9nr/aZ+5nsjOLIG1d2AilVGhcW
         g/TY7QUbo3vdK4TBbAqweq2tVg+cMjnn8YiONH/3n3NBxBTwtq71XjKPNgplZkEYcE8J
         sARuu1Pxg3hrZ3CaxcQHIKXQQLODluC/0TmryPnTA4LPoBcaIW2ZBJOGEO6dbN6X2N2A
         FkJLjJh/CZ82bbg42/da9Fn+Y1CLKl70o8PyDw+K2f2LfQDdwUF38yoE4Hc5+qCK9E7q
         I1y4qNipfTLi394AX8quMPYXV97cRk06WTfZooOuAKMsIL6PIgYOwTYhNTqJweXup43I
         sBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406343; x=1729011143;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9SnNDfwNKoG43QWQYWXWnF2oe/+JuCEPR6mrRjTttHk=;
        b=TKf9e/W/w2FTfEC5ChGop9dK2tc8F1uY9Y9XNn0wI0u6UbQLuusSkjSIMj9XjAXyJa
         AS61IUmtg+bMjUG1ce0jHB9wbwRZXQdGAvmrcNfKSgzBzl3cLoSrCMmxM7ROjeA6sxgE
         NmjS5e7MOu5OKOOVjYATwK4WjceKVRw4cPKZyBvhKDy58KI9Ry+0CyUI8OHmHmPy2z4s
         Zg7bfZxMlgwO406scL+AMp4wrjQ621TmY3FjMquIAExDUtwBY7ARQkbAw1+pDtsFUnuq
         ji/jNbqqsDPpqUHT+0aMw4kb6NFg7dNKxd+Q4rjRPDRRx/FdYikAJF/21RkYM7TGVlbq
         Sh0A==
X-Forwarded-Encrypted: i=1; AJvYcCW/IhjdvVehWB487KaSZDaozufPYvEASPkhgBAlunG5KzwALnk4Wkh4sADwnKgPHQ8dA4FF2i2YzwuQ@vger.kernel.org, AJvYcCXS7wnmoBRXBUyeIPH235JoGoiCojBk5wdtpUYS3NNDrJZJQUZLhUZP+FFPXbaSD954JUQLKUmIyny8sNW5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9kvcbhhDrLXu7M9vYf3zWWn++LdrOrjoaoAqxD0pCRqgFBnQQ
	ztQ7QlVCLV9aLFF7cf0qm9Du1VP035fMGroWPUiCjLjJIeNV2jeB
X-Google-Smtp-Source: AGHT+IGX8at7Sa48XGDDEvkkyu+3ml39dlyfdzrZDG7wuxQNzY0S3IzPo12EYbiyiX8aaHhlQKYiPw==
X-Received: by 2002:a05:6512:1596:b0:530:ea2b:1a92 with SMTP id 2adb3069b0e04-539ab9dc72dmr7738583e87.43.1728406342542;
        Tue, 08 Oct 2024 09:52:22 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-539aff23e5fsm1260736e87.235.2024.10.08.09.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:52:21 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 08 Oct 2024 19:51:48 +0300
Subject: [PATCH v6 11/12] arm64: dts: qcom: sdm845-starqltechn: add
 graphics support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-starqltechn_integration_upstream-v6-11-5445365d3052@gmail.com>
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
In-Reply-To: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728406308; l=2444;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=rcE2/GmrbbYrMkpcfScPpgvsQj4SBqxIMfT54Ac5TRU=;
 b=RQjjwwzpAnt6mMr0VGJE1lXZ72BO5OPLb7515E5kLs3rWfqwgrpzELj2xIUOMIERifufvdKXl
 Bx+G1GShtGiBTWo9ReIoWYiheae+yPzkDIk6OJYKk++1lR3vDy9o+vF
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
index 4d459fb85782..043ae14c4fa9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -203,6 +203,52 @@ vib_pwm: pwm {
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
@@ -837,6 +883,27 @@ &tlmm {
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
2.39.2


