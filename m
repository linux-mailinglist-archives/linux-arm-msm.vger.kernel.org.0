Return-Path: <linux-arm-msm+bounces-25136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C84E5925FCA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 802651F23875
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EBCA1741F9;
	Wed,  3 Jul 2024 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yinf8q62"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4EC17279B
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008674; cv=none; b=cLQIzKGamxKdyJFpAZuI++Q79st6gQwVk8PM+iQO+/N5tduo1LTaZIaFf3LhuvJTvoxsDo0xmuqHStbZ8Veu47Axhcl6ME4oewvFPq8nrxsc3b/1+Bz0JhJo8TT4dN4dJx2IiSmspwjjezn4WP3sYrLvPknjr9lMocqOVghAOIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008674; c=relaxed/simple;
	bh=zkBYXA5XhH4F6q1m9UDysUTPImTnL2Gru3YtQza5a+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i/6otY3ZkrxlGd0bjA1JL/TIudniNMqrhqS5fTty2bShQ4FOjgZa5xenKoUMEvfGnFBhx51jQ27Tni9Ccy21IMhVadLN/q8frU9a8KJbTyXOU9Vtp/Uh6ynNQHRsZn9sla3lVOHaweFufbE5tTOQXf9uktrfKX7S8/AFYFxt5CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yinf8q62; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-36743a79dceso376068f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720008671; x=1720613471; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7cLxowQxGXKyItHO9t5LQNge45csaHkg4VU8jx6Qm+I=;
        b=yinf8q62WNkfCKrJA8xgleqMQO7qSsl23P729JNkKfm3ERJdcoAKP8/eDe3qt/j98s
         Z7kqV9rqyGgAbEUxIG9338sx/rRtkS4THO1ffdHRN0wAyD/KAfLpGW9Y9y6Noui2BrLN
         U1vV/WDI+GnAkVdg9pJrFJQgARnMH3a4uvN97045rGM8WYaz3jbJX1S15l91bIauI817
         mnelTHbYU8AcO/mEwBZSq6iI7xYHnoTZ00sQEdalq5W/dJPOVa7H0H5QpTv/hcPLDPnU
         ATWv6BG1I0AEG4NPX91V+zQbzdqsHUiJZuaxQNu2xJ3BGoXUF2s/3HLZSMJRuS3XltVB
         7wuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720008671; x=1720613471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7cLxowQxGXKyItHO9t5LQNge45csaHkg4VU8jx6Qm+I=;
        b=YeZZnTLYj2djDhIc2CzbTXoIE543jpYWYp+9amGhLQY+f3wBYapzmTt4IB005ccC3L
         +LDqRpkx+0KfX1veRnp9S//p3b78+2XYsvj7vafH4b+pJkNn63lngdlaaqN9roMH9kDi
         ll0lobmPRkkFAgxtKLdK8Y/3m1BU8qm2+9YzKuMu/yJ+oby/mnrkt30I69Gim/5uJRw1
         iY5hHwoCD+z93SRZ3PS4MZ+t63rSvge5GphHaiEOzlJx1j9mPFh/epWuNyB+uIHnhRU/
         bV1RsPpWuIlCZFQtfzTwGC8suelGLISIO9XXi2XtE/f+SawOSEoHzjg8iWKYvbzikmjE
         YnaA==
X-Forwarded-Encrypted: i=1; AJvYcCVqF85h0nzAwFdf4KJcEM8cRx51ASQ5WMHnKFKMeO7sFD+462Q+AmI4Hk4GF+BrUT8a+3X6VbXXWYY38heNKbJlHaQIJDIxGqheH6cWIg==
X-Gm-Message-State: AOJu0YzIqiTlDsWmCBWK9ayIO18/CJqTlDkzkrJsjJEnEbpPq66Hxgrs
	i/TAykDiuvC8NEm+hcEcJ3ZV3HNjhHg18wKJXxELScHdk3Ly91dqW0xKbzqGF63cBhc2JE2eUI1
	fhFA=
X-Google-Smtp-Source: AGHT+IFy7XIwYIBv75NcGjjGCl0VS2oKdh8CqLT1sJCeuF/ePWgLta3XoHjrEoA8051q0A7kko4l1Q==
X-Received: by 2002:adf:f652:0:b0:363:337a:3e0 with SMTP id ffacd0b85a97d-36794780b27mr1367398f8f.1.1720008670720;
        Wed, 03 Jul 2024 05:11:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a10307bsm15716222f8f.94.2024.07.03.05.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 05:11:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 03 Jul 2024 14:10:55 +0200
Subject: [PATCH 01/11] ASoC: codecs: audio-iio-aux: Simplify
 audio_iio_aux_add_dapms() with cleanup.h
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-asoc-cleanup-h-v1-1-71219dfd0aef@linaro.org>
References: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
In-Reply-To: <20240703-asoc-cleanup-h-v1-0-71219dfd0aef@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2812;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=zkBYXA5XhH4F6q1m9UDysUTPImTnL2Gru3YtQza5a+s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmhT/SBRZL/pAdnmTHzMWcEt1sae0bOVf+MOlLi
 9Iouwdrzt+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZoU/0gAKCRDBN2bmhouD
 1++xD/4smEI7/Q/xqQ8kHg3Br1em0PyUgtV32GF4yvl2OjiJmfHfqwc4MC8tYzguMEV3m9v143t
 3is1DhFHdotHjyQMMJiMG+/b3egvgKx8MxxKLDTGJ3MbXRecLSlQAaMuSCGeuLk4bCEXAZtN2nZ
 59l6mosBbXKPDZGIBe3M+soiCM03Ydl01cJl8dSK5suDjwRpkMhb0+JXQjOl4yk2ZO0u8RmvM0j
 uTtxKpGljxGv78qEXDf1jblZH1uShAGNoK1Ox0ZKWxrhVpaG14Ytg1DC66Mpd7oomSWnyWBt1wU
 EshhBKabPnUlVVJObbJ1XFzGZURbnFu/lUXJgmBgaxhNczlYsv9/5T60tarIxLoFEClMrdN5NF4
 7an704jrG2hU0kQtKZznWsT3bxDivQfnUj/7hEgnVcadq4eChOBHgZKl886/hgKB4b7l25UUdxr
 7Zw7a1u0wlt1n9SPZTdlqdQwGj/1eL8hAkZkxLW54Dn6o59EUy415ArhoHSaawTLZFbER5UtXSs
 JrKvhfVNnjlmMmOGlnXUwCWRTfLqf9HBuynCCUJsjfA4B6sMDo0lV+P5grGPlQlghYxPgiaUAzU
 H96CRf99qS+tBY6o3K4/0HEsWzv1FLK3oz/6DmIkUKweb/sR9xpbL8JxcMRwZsi762H3cuL7vTE
 RVySwVK/E7N7Ziw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Allocate the memory with scoped/cleanup.h in audio_iio_aux_add_dapms()
to reduce error handling (less error paths) and make the code a bit
simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/audio-iio-aux.c | 36 +++++++++++-------------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/audio-iio-aux.c b/sound/soc/codecs/audio-iio-aux.c
index 1e8e1effc2af..3969ee45f41e 100644
--- a/sound/soc/codecs/audio-iio-aux.c
+++ b/sound/soc/codecs/audio-iio-aux.c
@@ -6,6 +6,7 @@
 //
 // Author: Herve Codina <herve.codina@bootlin.com>
 
+#include <linux/cleanup.h>
 #include <linux/iio/consumer.h>
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
@@ -131,33 +132,27 @@ static int audio_iio_aux_add_dapms(struct snd_soc_component *component,
 				   struct audio_iio_aux_chan *chan)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
-	char *output_name;
-	char *input_name;
-	char *pga_name;
 	int ret;
 
-	input_name = kasprintf(GFP_KERNEL, "%s IN", chan->name);
+	/* Allocated names are not needed afterwards (duplicated in ASoC internals) */
+	char *input_name __free(kfree) = kasprintf(GFP_KERNEL, "%s IN", chan->name);
 	if (!input_name)
 		return -ENOMEM;
 
-	output_name = kasprintf(GFP_KERNEL, "%s OUT", chan->name);
-	if (!output_name) {
-		ret = -ENOMEM;
-		goto out_free_input_name;
-	}
+	char *output_name __free(kfree) = kasprintf(GFP_KERNEL, "%s OUT", chan->name);
+	if (!output_name)
+		return -ENOMEM;
 
-	pga_name = kasprintf(GFP_KERNEL, "%s PGA", chan->name);
-	if (!pga_name) {
-		ret = -ENOMEM;
-		goto out_free_output_name;
-	}
+	char *pga_name __free(kfree) = kasprintf(GFP_KERNEL, "%s PGA", chan->name);
+	if (!pga_name)
+		return -ENOMEM;
 
 	widgets[0] = SND_SOC_DAPM_INPUT(input_name);
 	widgets[1] = SND_SOC_DAPM_OUTPUT(output_name);
 	widgets[2] = SND_SOC_DAPM_PGA(pga_name, SND_SOC_NOPM, 0, 0, NULL, 0);
 	ret = snd_soc_dapm_new_controls(dapm, widgets, 3);
 	if (ret)
-		goto out_free_pga_name;
+		return ret;
 
 	routes[0].sink = pga_name;
 	routes[0].control = NULL;
@@ -165,17 +160,8 @@ static int audio_iio_aux_add_dapms(struct snd_soc_component *component,
 	routes[1].sink = output_name;
 	routes[1].control = NULL;
 	routes[1].source = pga_name;
-	ret = snd_soc_dapm_add_routes(dapm, routes, 2);
 
-	/* Allocated names are no more needed (duplicated in ASoC internals) */
-
-out_free_pga_name:
-	kfree(pga_name);
-out_free_output_name:
-	kfree(output_name);
-out_free_input_name:
-	kfree(input_name);
-	return ret;
+	return snd_soc_dapm_add_routes(dapm, routes, 2);
 }
 
 static int audio_iio_aux_component_probe(struct snd_soc_component *component)

-- 
2.43.0


