Return-Path: <linux-arm-msm+bounces-49335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A152A446C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 17:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 793DF865E07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 16:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF971FBEAE;
	Tue, 25 Feb 2025 16:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZXpL1ZdD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A0E195B1A;
	Tue, 25 Feb 2025 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740501578; cv=none; b=D40c2iSrf1xQACmnd6E2Q3Uq0nLVKxkZCY2jFfZQJdi88KPklciJf/atjMfvp8OIv9lQr1sned0FI7pGm7Lgn7t6AEZSmcj0pm6cmpl0a/HK/0GromYU3sh7I7+EXK7xdADN45ODE2euUElWz2MKBoC1SnFqbrJAmpUbbxe1q6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740501578; c=relaxed/simple;
	bh=4cyTlsaHco383EF4xVigt4ChuUakSnBPtAS8xw/f7iQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i10Y8ATDUYIc93mNy5I7cACTPWDo5sA4q511uX6HUwJtZ1FbakJpV2i5OPOJLFM1mdg+t2iE7WyRhLrJ2DiGBtxo5CxaTtEc6NPJFSsXDKtueJwpRGW47td9PJmAbiE2UzBqqjgot3v0fy6CMT2+DOirek5dITq/UkUQajKgzPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZXpL1ZdD; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e0505275b7so9306417a12.3;
        Tue, 25 Feb 2025 08:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740501575; x=1741106375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z4QTSsfoeVCDt3yXq9ebFWWKuixfe3D/L3+d/mpcj4E=;
        b=ZXpL1ZdD8gd0JP6QzptLs/5ad+j1+jkHZOSSJVwKZrNRHLXxHufEek+g5aZlBUYrAf
         16pvU+sdeJRGzUiAtSSU0cXQyeHTh7QC3kMk8/MxbPxCnz7cHHMdMnDugiWHWnGGN0uj
         bZ8CXuEileAhgndFITV+P8oDYuoFpBRvBD9sZ1yPHhNhySwbw9RxOyTxdlJ+SmJxCNhy
         9OIaSI+ivG8cFbMsmfyw+QiATQnBEZXMQHhtptoPa+FXvDb136KXFEQ7PSb2Blkg0f4+
         nkdHTaLqbgREVKf/JmNqHPKRNCvEIbJDxNYqCKROsGHP2kMhneE9SJp2YkF81sLwtkX7
         OMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740501575; x=1741106375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4QTSsfoeVCDt3yXq9ebFWWKuixfe3D/L3+d/mpcj4E=;
        b=DlMxnIB8SmynOx9x6jzSkykIupO4eYA+DR8UVKnLMiVk9Isskcy2Ly0mldgeFL3VVW
         +oB8itbs1Dg6LXTv3UthQ5ouRJylJi07g6uELX5Y/2tCPKrzCcytgrhXEZ77g7GHnv2x
         Z6PmYkyYlAp6J3J4Kits2sD/1IFZl4yKm1q4NgEXgbY4idsP+vdSSfzhywRz9hBCd/eK
         tTSERuJ6ONaTG+GuUnv3P/PoyjIplXTZ3yqS6W52UXq2MdsmNg8c6I6KIwk4e7AzlDqX
         TTWDXbFm149q9cPd4JjAnQkkuLuvTO3SOjcYti1gx7c5phRA/vccrTCy1k0TGvOKesp4
         JKbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6j8Mqmw3BRd21W3xnTjs1jiix3fIa2SiBsV07XSvhg5CbX4fIy3bQVXAEG82BE3hGJy9fSE9txKce@vger.kernel.org, AJvYcCV4JkPYcu/FjtD6tvYwq1rspJ61o7aJ3cucFeU29vwZp5viQavvqbHGcmkV01WuOXLh3LaHbFy0+u+vjps=@vger.kernel.org, AJvYcCVSmX98baEBqL/k7eWRKUy7rtpcX2IMigkvgzqxjEsRc9nCULH0BbhmDLw1IhAB1h5Z6nzgO4sXc3sxgSSa@vger.kernel.org
X-Gm-Message-State: AOJu0YyRd2JrHuTIUPDLZ4xS3Ia7GPG2ZfchKoQcOOlj+4LOnvZURVef
	5U2U4xYCsQyYA9AfExMG326dT/GdoSprz8OxavZi100jPRFv7FKO
X-Gm-Gg: ASbGncs0dXAYvFnKdeBp1Y/3eZog9wy8Uog5IuXUwFw4lRaGwWVnZMVzRIY0mpJ4H+/
	IaSHC43JcMIuJ1iys6DLhME/H4+zpv+pkcPAd+R1npuHboLbzkZlPtKAuFXE0rEKOx2ShclnDBh
	wiw+5cPMwPKqdnMX8gbk0X4rynaGakeBE7Yxfv9CMy1ydA9juvzois5Ji2Z0W3cDhUn6eFH6wPK
	Q8bpT4AU+6Kk0JcLeW0M5oBfl5150Y9ywNfLzQSVqUlcie8nm0GEMPjnn5clEwrHicisjYl272y
	2FHIxoxuUTMpaqoPCIiomxnU
X-Google-Smtp-Source: AGHT+IFGWGw8Y5Illp6NFpwdb0KEB1gJPdhSUdTTsfYRalDulweGquaZ+p/lNo5hXaDoSR9/hUW3FQ==
X-Received: by 2002:a17:906:3181:b0:abe:e1b3:78d with SMTP id a640c23a62f3a-abee1b30b3bmr183901766b.8.1740501574881;
        Tue, 25 Feb 2025 08:39:34 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.22])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-abed2055011sm163999866b.156.2025.02.25.08.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 08:39:34 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 25 Feb 2025 19:39:02 +0300
Subject: [PATCH v9 11/12] arm64: dts: qcom: sdm845-starqltechn: add
 graphics support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-starqltechn_integration_upstream-v9-11-a5d80375cb66@gmail.com>
References: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
In-Reply-To: <20250225-starqltechn_integration_upstream-v9-0-a5d80375cb66@gmail.com>
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
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740501555; l=2596;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=4cyTlsaHco383EF4xVigt4ChuUakSnBPtAS8xw/f7iQ=;
 b=vubqioe9WfRlXPUrvKQhxVHECfESKl109t4IOAUjKlwY7B92bAGcKAPT02uEp/n68aROadaaH
 Qk/t20W+J2/D5nI5m8IWTb645w5SApOPjyAeSSmfTagzctQkWgNQ6vo
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for gpu and panel.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes for v9:
- add tag: Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

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
index 762182331dc5..1202d8fc6b9d 100644
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
@@ -864,6 +910,27 @@ &tlmm {
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


