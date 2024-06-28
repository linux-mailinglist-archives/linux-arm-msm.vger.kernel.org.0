Return-Path: <linux-arm-msm+bounces-24612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3944E91BC62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 12:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93927B232A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D11C15575D;
	Fri, 28 Jun 2024 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y/XrIkpo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C29155335
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 10:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719569496; cv=none; b=dW9Ho7zQ2dZOjcjd/+AbSyU0EfseQVcB4IXKBpEJhHaVPGDrRRTBe+q8FU9PvzoSguM01tcmQWJFvbfojnxdYyNCPflEB3jOIbIK9JC5viMBuufPJBEsdCppXVevFLpS7Vd7T+iDhZnKlTMMxWpkj2I0q+ygBpEwf3K13B6PL1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719569496; c=relaxed/simple;
	bh=t0oThzO9Q8Q8Ygu8zNE+tB4uDDaXPUAD51K7NJR7FOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pEy8mPh/r/0/jAHmmsLGI/eOR/NaVVKGdcX7cHcRh+6JsaUjEUsK8UHTiB0PtWNHRD10TNywCOzugh3k8xNa7s37HmNPGE2eZoYSW/GMZasmXkTRdQD3LJsHWDXiKcR84e875UZOe+tceZAHfNH6JvyAfX0rY66yTxEH6hge1XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y/XrIkpo; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec595d0acbso4728611fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 03:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719569492; x=1720174292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rcUCvATOk6PUaPwOA0D72nSVujkGGCzYAuhpl2nZXU=;
        b=y/XrIkpoAmYtx3jqETmeEM4e3ncZMOTHYFYC98+fVjAkRCjL4q9bw9sq90TepghPjh
         DYpqm/i7ctOY2Mg0QP7Ld3bN0r/HM+uzIwuAxAD5AtE7ZX6+8jj4yYs9UnX4lTfFxOe4
         V5HZZB1SW6VTLxZM5hWxH0O4tSFtFyk34WxJmifgujkIL1y2n/lf0fI0PJcbl3JXMlya
         Whklirh4LhxEpGDa1J2vPgt/DMd6d5BK3KxdzADUyHD8pjJ1hiFdUVH6KILMdFlckAMl
         GwlbWtmkIJ0Azg3reV3ScgsfEudnTilJQpvJYeAFY5OiyZy3YHuzwx2no6oUb3DBRHjz
         u92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719569492; x=1720174292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6rcUCvATOk6PUaPwOA0D72nSVujkGGCzYAuhpl2nZXU=;
        b=NlbvjzzB4dIbGumnWSXWP0hQup3bz7RHc56zPVvjl6fNUdRU5QR3mjyV9tQvWi262y
         S9bF7RXR4zS1/PfvDvFO8DlrP8nhrnqjRV580QlouOA60OZbzx4C8qv4kh4laAS1rwIh
         25+kxXRbpeBlINyZwqvfxlgm6i9P3kDMwEQ7UhPngi7QEGYh/d/0Nryt2ILQNqgD1g3h
         UTPtrD9PJuaqLWTbm+N8hoZcWu7JJe8fFJ2jYd9xmtYejfTs2kuGWv2GxHpd2SIvRuAA
         s/O36FJoZqKMox3MPiVv/ZJs3tuj/eLgMkcxLfOSh759ef+PSRkkoijNvnxiB9iQ7ZFO
         xAJA==
X-Forwarded-Encrypted: i=1; AJvYcCUvyvKVSUckhfZUpwGOu+lodqzlFQ+vrx5PXuI6Cn7s2QHqXkq5/AxnvDqkp2699+FldLWUFtljNLUs/4O95jrWjVlHKDeeO9yCQDu+SA==
X-Gm-Message-State: AOJu0YzZ36xqMbFbFL8r/SojQFhXcpPyj8kH13a92aRenmK9p4zDNUMh
	7GR/vu9KYW7ghYMZ2+W1urF6e8lmOhkG7+cfzxIFnkK9AM3URRFET3uyg/QNGCE=
X-Google-Smtp-Source: AGHT+IGv+fN5oMBLkD52ryRZ8LfY0cXbKJU+4r6OFmL14KG93AcvWuOhqCYyA9visl1sjhxLli+LsA==
X-Received: by 2002:a2e:3018:0:b0:2ec:588d:7eb4 with SMTP id 38308e7fff4ca-2ec5b30bd1fmr121706111fa.15.1719569492424;
        Fri, 28 Jun 2024 03:11:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0c15f8sm27024605e9.47.2024.06.28.03.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 03:11:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 28 Jun 2024 12:10:55 +0200
Subject: [PATCH v2 1/5] ASoC: codecs: lpass-rx-macro: Simplify with
 cleanup.h
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-1-e9741143e485@linaro.org>
References: <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
In-Reply-To: <20240628-b4-qcom-audio-lpass-codec-cleanups-v2-0-e9741143e485@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2363;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=t0oThzO9Q8Q8Ygu8zNE+tB4uDDaXPUAD51K7NJR7FOs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfow9491/AvVpxy9ctPQeIOel+kU6a2WiOiqlU
 6zfSOJQXdWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn6MPQAKCRDBN2bmhouD
 1y+dEACR1q3XmwV+WuYCly6WpPMyPcQz2N3xgpPi4saLYSobA8Gm/tUVbxMUqk/lL7Y/26lB8Un
 ffGLBUsDsO1Q/MY10YVArp/OE6gTvSRxBKElY03d1vTInfeu9gG8e9z/XQ2uSIUV1O6LN31pt3+
 q4PpGqn4FBoH0vFc7i5AToHTHN8+/by4ppLJ3+gj2oWSiCLeoJhpL33hgZ0h1+DeUubgbeapgGY
 +TB0H/Tf20+Ghb1T5bssPfLYLLSiI2A6NANsDVkRRjTixkL8HTLxbeCII/hw+jEx6Lw/PUw4q1I
 DKREVV3B2rmI7OcAZY3RHJxjEATN1oAd2eCruzV1WrM1fnv4BaAp1Crb4oaFqhn4dOY0cTYJbWK
 T8PcUeLRUQMn0EQKsZ+huVovLod8Kxa2bKCC/YOrcyusPtfdZVS98rsv+iqu81BLuftRJ/FFNrb
 Xg5I3lc4pIGtDI1FILl+s4y0P2bKuwbEoGy74n6XGDyMXTbJCi8KFUQ4kszI+sJNpg+s4C23bG4
 T77l4e+XF9d4YPs7d0kWa+Bcr2/qCFq6XnOUFdU7IvDzUqTRzTDyiJBT/vx5Noek4kaM//IBctS
 RRdjZm7RCqrOUahDN1rs+VV+V64eiw+bwy/A7jD7vH+9FlqPfyia8yNpRp2YrqQmB9DdODaxq/Y
 SMEiOpDlwyu9Y+g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the default register values array with scoped/cleanup.h to
reduce number of error paths and make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not adding Dmitry's Rb tag, because of major change devm->cleanup.h.
---
 sound/soc/codecs/lpass-rx-macro.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index d47c49c90de3..4cf030760d74 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -3764,7 +3765,6 @@ static const struct snd_soc_component_driver rx_macro_component_drv = {
 
 static int rx_macro_probe(struct platform_device *pdev)
 {
-	struct reg_default *reg_defaults;
 	struct device *dev = &pdev->dev;
 	kernel_ulong_t flags;
 	struct rx_macro *rx;
@@ -3809,6 +3809,8 @@ static int rx_macro_probe(struct platform_device *pdev)
 		goto err;
 	}
 	rx->codec_version = lpass_macro_get_codec_version();
+	struct reg_default *reg_defaults __free(kfree) = NULL;
+
 	switch (rx->codec_version) {
 	case LPASS_CODEC_VERSION_1_0:
 	case LPASS_CODEC_VERSION_1_1:
@@ -3853,7 +3855,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
 	if (IS_ERR(rx->regmap)) {
 		ret = PTR_ERR(rx->regmap);
-		goto err_ver;
+		goto err;
 	}
 
 	dev_set_drvdata(dev, rx);
@@ -3866,7 +3868,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(rx->macro);
 	if (ret)
-		goto err_ver;
+		goto err;
 
 	ret = clk_prepare_enable(rx->dcodec);
 	if (ret)
@@ -3912,7 +3914,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clkout;
 
-	kfree(reg_defaults);
 	return 0;
 
 err_clkout:
@@ -3925,8 +3926,6 @@ static int rx_macro_probe(struct platform_device *pdev)
 	clk_disable_unprepare(rx->dcodec);
 err_dcodec:
 	clk_disable_unprepare(rx->macro);
-err_ver:
-	kfree(reg_defaults);
 err:
 	lpass_macro_pds_exit(rx->pds);
 

-- 
2.43.0


