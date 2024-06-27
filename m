Return-Path: <linux-arm-msm+bounces-24499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D9A91AB33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 17:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 164DD1F28251
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 15:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80282199238;
	Thu, 27 Jun 2024 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nki+dQg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81DC1991B3
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501835; cv=none; b=nQ843xFQ1LnW7E/T+cx1kDBQm8q0lXq+B0PLc0or9K7xfF9gvOrZUbCWZGUExveqwUcL1ujhAxZr0KJtBUTnEaGWSvX0gDHyeM95RMGcUDSKTShwQ5wUde08na2ZG5e7wDf11sNEGMNGP/RS5XXb1VK5wBA1ZDkzteWN2oR8wNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501835; c=relaxed/simple;
	bh=bGXi5j7RtMWqTV/YOEsZohRFyc1PuafBeHL3YjZpRpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JoefaMnlIWc9tkot5Nvtr4IEAdU/3Faw+K4OJxS2Lr+PppkX0mrEfe7T6m7YHbGzSzbTdSI23ZgfUdyxJY9LfyJvh31r3VzU9xFVR4R2hw8LfA5jsHaPCrMBblTaH5vIMnO9R1uEt4k611FbBMvYv7sfmt+WCiv32Bhk2ZwO9Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nki+dQg6; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cdebf9f53so5641975e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jun 2024 08:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719501832; x=1720106632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RYQGDqdm11IXNknTjts1TE9ajQ2ABZYYP3j2vEJ9x9w=;
        b=Nki+dQg6HXUxSjkUzd3N5d9NlSR4r+d9J9FCTT18aLKXyOUYxNI/qehx9MkBtUyX0a
         pBSNhfEz3hs/Iv5rCWD1A2I+Mur4ug6+g8dhm1ILkWbrvasUsoiMQzpB/yeeqU+ZfEsN
         O9IyB5mqCKGBo++Yx0PVSOC0ZMJS78r2NoDcULA9udSIzfdZjTGsUKKYa7+Pziq2tltR
         ox93Dg5KWmqDPmlejfLhZBJrAEOSeH7cVdRFOKejeB8tuN0THqMN0EDCafDik/DKVIlG
         7IsxK1hJS3yrQcHbEp6awetmznRXeKj3L3pNcV7w0RBobHZREYweMSJWEKBUMJV0+eRD
         gMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719501832; x=1720106632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RYQGDqdm11IXNknTjts1TE9ajQ2ABZYYP3j2vEJ9x9w=;
        b=WbFOByk6WlIGpVfzZRb4QqMpAGhfBYUeO2iQER5q8cyfA75KE7eXvcv14HO58SmJ4g
         VGt4wwbV1w1O3RvgNuEfqQaUJamI69qdKujeOrWUpxcOaAVUHwsrTdpq+UmMi8E99eU8
         9759MH0SD08+Z4GoAyVErwOwdlX325DVM/wGi2x97Q/kJ95rCNb0JdpZgouzcNSyDtH8
         p/34x6eqVzekmzXM9GibScz9+2qDpb8X1qIgzDY8qExk8geoJ80v3GFk2tnA9JZB6qSk
         oew/y1B9ACmHtb1EcYHt77m3r9S6yVF5EdBf4yamN3FsFRdn4UzdsGC11mAvZYLC2yYk
         Kp/A==
X-Forwarded-Encrypted: i=1; AJvYcCV4pkfz6FRE+Ieu6BlVybK8nd6sLtzPRb7afRHIMYVFrVY1R0GJWV+VBQvWRzUQXcmhbIAuNXyG/FJ1PW62g65fY1wf38zp6ZFrU4Lz/Q==
X-Gm-Message-State: AOJu0YyCuh+ZyIi4MXj3bXbDsdtWX0/4NqH18A/6WvSaubXWqMoo7y/1
	+SCjlL26WFSMHsjbHztdf66b1uDXwYkIrr6ZAJek7JA1tVXj2yMJz6l1IKyICO0=
X-Google-Smtp-Source: AGHT+IF9f7edEKwKerNIjhX3uTXOTM1OPnrW5fODb6A/0TRznA8i8xLuQYfbAyXq18C3tMQn2lJbpQ==
X-Received: by 2002:a05:6512:3988:b0:52d:b1e4:b327 with SMTP id 2adb3069b0e04-52db1e4b3eamr4743847e87.43.1719501831927;
        Thu, 27 Jun 2024 08:23:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42564bb59b7sm32783185e9.34.2024.06.27.08.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 08:23:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 27 Jun 2024 17:23:44 +0200
Subject: [PATCH 2/4] ASoC: codecs: lpass-rx-macro: Keep static
 regmap_config as const
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-2-ede31891d238@linaro.org>
References: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
In-Reply-To: <20240627-b4-qcom-audio-lpass-codec-cleanups-v1-0-ede31891d238@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2386;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=bGXi5j7RtMWqTV/YOEsZohRFyc1PuafBeHL3YjZpRpI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfYQBx7fY0kBJ6jxCqWdY53la071tLtaabndv0
 1oUeEZeorqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn2EAQAKCRDBN2bmhouD
 1yaxEACWVO+e6qA0ml86PfmOMaxQrfhrDhHJZDwq9gLbpH9gauNvKjHRjs/cRMitM74rqiTToDr
 LhxqR09dLUBiLiFNXwXlT6jvzLrDeFq8JJiQER1cwbe3woa7ZVT/eCdPDg1oBD0Iqt/bJZZmoLJ
 Ook2x1Wst9yTJ3XtyYN7PYn5MU7saXsHWiXIMonKKzkGF6EZYLNSQeZoQua12hI4Os/SFRleSvK
 jJ4WfYQjlrKGH7vgKEWF8LbFWdr89OHdACdjNHDipmvFaH2+JmOYuM8xdBhR67qLi3y/BZFiPIC
 EgzMM7qpSQyK7GUPnycZgim+5ZXmUmQ4RmwvfaZx+eeM3jyP1fDbNYmep1nfUZRh4XWm3xhVd+r
 4KNh6/ymz9ockw8H6J8gYkr9VoVROJ8DXUlm2eaf7vXaliBPfatmhejfdKOXkrjQRvzRi3A14tr
 tIUr+oehD9e//w99AgzREShKuZ4NYIratbA6YRftz3s2t6D3pLdoD4ocrzO8I9W00jX/CSNzX8g
 +qvXzqmNC5xcwevDI2drbRpb6qn7j5ZcTRaDSgfwI9/a+9xzgeJ0d7cJMhU7vEAEncPdrsf4LxV
 2Kt019sa3oRdD/xoAk6VKaI6wHqaaItuD6GUY+Bwmuf9t5iTf/0XtV2yXMAR0qLAk1/W+S4XLoL
 fURMQr5rzgXvFYw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The driver has static 'struct regmap_config', which is then customized
depending on device version.  This works fine, because there should not
be two devices in a system simultaneously and even less likely that such
two devices would have different versions, thus different regmap config.
However code is cleaner and more obvious when static data in the driver
is also const - it serves as a template.

Mark the 'struct regmap_config' as const and duplicate it in the probe()
with devm_kmemdup to allow customizing per detected device variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/lpass-rx-macro.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 59fe76b13cdb..3d8149665439 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1662,7 +1662,7 @@ static bool rx_is_readable_register(struct device *dev, unsigned int reg)
 	return rx_is_rw_register(dev, reg);
 }
 
-static struct regmap_config rx_regmap_config = {
+static const struct regmap_config rx_regmap_config = {
 	.name = "rx_macro",
 	.reg_bits = 16,
 	.val_bits = 32, /* 8 but with 32 bit read/write */
@@ -3765,6 +3765,7 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
 static int rx_macro_probe(struct platform_device *pdev)
 {
 	struct reg_default *reg_defaults;
+	struct regmap_config *reg_config;
 	struct device *dev = &pdev->dev;
 	kernel_ulong_t flags;
 	struct rx_macro *rx;
@@ -3851,14 +3852,22 @@ static int rx_macro_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	rx_regmap_config.reg_defaults = reg_defaults;
-	rx_regmap_config.num_reg_defaults = def_count;
+	reg_config = devm_kmemdup(dev, &rx_regmap_config, sizeof(*reg_config),
+				  GFP_KERNEL);
+	if (!reg_config) {
+		ret = -ENOMEM;
+		goto err;
+	}
 
-	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
+	reg_config->reg_defaults = reg_defaults;
+	reg_config->num_reg_defaults = def_count;
+
+	rx->regmap = devm_regmap_init_mmio(dev, base, reg_config);
 	if (IS_ERR(rx->regmap)) {
 		ret = PTR_ERR(rx->regmap);
 		goto err;
 	}
+	devm_kfree(dev, reg_config);
 	devm_kfree(dev, reg_defaults);
 
 	dev_set_drvdata(dev, rx);

-- 
2.43.0


