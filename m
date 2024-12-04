Return-Path: <linux-arm-msm+bounces-40386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E61909E46DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A0EAA281DB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 21:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD9BA206F2E;
	Wed,  4 Dec 2024 21:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AB6Hnb0p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A462066F2;
	Wed,  4 Dec 2024 21:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733348123; cv=none; b=YAS1ZDRURmbcD0h0nox+PJ8e/jRvUgbznoHXWAhm34XRL9t9k7wcY1kOL8Y0jy+4u0EdK0ZclRWgz9KtVQr3wREZHi3P02iOPWAPEDuUsoBaqhNG1YvmFF3nwhqTMQoIWHAxNNgQFc+4FS3YrfCS1zwyKwTPJD1EBJVwXBVvjUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733348123; c=relaxed/simple;
	bh=Ppe4XJX8HWC5mRDSAJwcV5zPY6Dxs3QTSmfYtPfGMbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GL4fa1kL8fO6dRBesrtipPfaku7AEFosk9azWHGADsP7T6n+yCQ9PYNuL7V9vDneAvu3VNiPxEsaN3vDi238UB2AJlBrSt4MUfpOgF5MlpQjptKSwTUVQVfHblt4qXCuqDWnoHCyTB/HaqMScmxK8DW8aBECil4Q9dU/cJIW3KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AB6Hnb0p; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa549f2fa32so38876166b.0;
        Wed, 04 Dec 2024 13:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733348120; x=1733952920; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNMC3VECIaj3V7w9ANzM7fLDJKT28e7iJSL8sOna0Aw=;
        b=AB6Hnb0pEBoMG13TImLh3UTfI/9OmKK3uoF5c0XvhJPHRmyGgy4ecx8Cd1FTYQG8n8
         /Jyy0HYuqF0aIlHCqyfRJFzi33gumi8RG9jt2vxyw5ZvPL8PilP17uyhVybUErhaYFfo
         GPTAp+7UudX4Ll/MUXRU5eWlVC1E6gQXa5KESgTU9BzA4CbiuivRtJinNIJsNFxEW1L5
         lxUrOSmyNkxzY4Uk/VbR11v/l5CGteOzLnTFkMNj5PVZx47SxoxxLGDnVD23RLPC/8hX
         7rctmyOiFk00ZGkmbXXqBuRJg2WiPDYQPrFJWkhluxXPVc17brfCatRVvP7XhjvjKxBv
         b61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733348120; x=1733952920;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNMC3VECIaj3V7w9ANzM7fLDJKT28e7iJSL8sOna0Aw=;
        b=Q88mTienvIC0EgQFXUrGRFPV+VGbuD4h41nesp6Ss/gzeDacgg98GcKsVrxlFyYoUk
         oYkemm7wBI0bM1Kc7PeVjrNP02tkwtlW3BPVVyrswg4MCxc9RQE0FWmIO32dAPEic2ix
         LsqgMDgUv6ZI6ZKZXActTjJIG01/4ht9fdrVimfNBFQRT57VKFwBk0JxEmasjZosxK3t
         CNU1eiqwYTcUsiEv00Vc6lb5kYdXQyNlc7UXm/l4ZqK/ulelPrmvc9vwoFNEunCOwa4y
         hZrP2hSDPjdIuhEOMut8VUjH/SASj+yo3oKxY+5zsVF3fjzGmtCRR8ZTiudc+GN+iK/n
         57oA==
X-Forwarded-Encrypted: i=1; AJvYcCUdsh/6/9x0MNAO9TZ/zgx3gB+ffHgsKniXkFYYYgqcmTPgRMffvlwXvVxjP1PvKuSLwTO6KR3KcWotDdcb@vger.kernel.org, AJvYcCUr/eoqJ8TTkNlTwMHceyLuTxoTiq/s7PY67N0R22P2cr71IBzrDx9FFnRqy1u2I+hT3SOyYXlontXs@vger.kernel.org, AJvYcCVuwiSUj65RFzXavwfMEClMXC5YTyClg0HMvZf813jRjw9xTlWdR5BYr2E74XvkXFAn96Lx+V1+DdW0hyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQQnF4fXExux1ESjwvIYq2G8WNGJhqxcygPkscA2zL+qqrEOxG
	9VMRIFk/vKL0Vhu9bGieYhGwZaoO3o7daZG8W5wQBu+9D8XyxBs264dW3g==
X-Gm-Gg: ASbGncsfF2JUJYFI4PNw3wRV+66G7IodzWj3seq1PAepZ0LDPAIhx0ywXQo0JoEw+8R
	aDY9Rj/TYd/V/SXjeibkPwyFqvWyeClxaD8P8wknfy+cQO4uYXaOxSszCIOChfhFddJYFV28axu
	bhA5BwgnKcbKz0D52sJ3wAbHnYGiFWHguznYNc1bRsoMM4WkdWiOl6OilD7+k3/AGnYzzGE60sF
	S6U0eHlk5Q8DwKxJG4Z1vRMXRpO3nP7px3iljNLaykohjV7
X-Google-Smtp-Source: AGHT+IEVNZeXuDchR8MYkMCy3AGS24xV2mHVtm3IOMvGHvJfgPAok1wA2N4NMuXHuPwCfGaHJSRnWQ==
X-Received: by 2002:a17:906:1ba1:b0:aa5:f2cb:2285 with SMTP id a640c23a62f3a-aa5f7d1b1eemr518939866b.16.1733348119974;
        Wed, 04 Dec 2024 13:35:19 -0800 (PST)
Received: from [127.0.1.1] ([46.53.242.72])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aa62601b5ddsm4506966b.118.2024.12.04.13.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 13:35:19 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Thu, 05 Dec 2024 00:34:58 +0300
Subject: [PATCH v7 11/14] arm64: dts: qcom: sdm845-starqltechn: add
 touchscreen support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-starqltechn_integration_upstream-v7-11-84f9a3547803@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733348104; l=1393;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=Ppe4XJX8HWC5mRDSAJwcV5zPY6Dxs3QTSmfYtPfGMbI=;
 b=XEYZl3l3YrkTptmZ/V1LuJMY1LQXFyMxwC8IUyiAL2oyP0Thmp+fvnKpGtnNLwHrRefjj+A5x
 KvkWTFuX9IFAGLAYnPGwQYBxlPeqLk3gqkyF4tsZAv6ijuZwPn7bX4T
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for samsung,s6sy761 touchscreen.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 44a70f2f5a09..039feb07ef60 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -574,6 +574,23 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&i2c11 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "samsung,s6sy761";
+		reg = <0x48>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <120 IRQ_TYPE_LEVEL_HIGH>;
+		vdd-supply = <&s2dos05_ldo2>;
+		avdd-supply = <&s2dos05_ldo3>;
+
+		pinctrl-0 = <&touch_irq_state>;
+		pinctrl-names = "default";
+	};
+};
+
 &usb_1 {
 	status = "okay";
 };
@@ -678,4 +695,15 @@ sd_card_det_n_state: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	touch_irq_state: touch-irq-state {
+		pins = "gpio120";
+		function = "gpio";
+		bias-disable;
+	};
+};
+
+&qup_i2c11_default {
+	drive-strength = <2>;
+	bias-disable;
 };

-- 
2.39.5


