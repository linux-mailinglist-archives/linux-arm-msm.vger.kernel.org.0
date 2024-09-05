Return-Path: <linux-arm-msm+bounces-30938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB07996DB5F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF5381C23B16
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B1871A01BA;
	Thu,  5 Sep 2024 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LZ7fs2t2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF0019F487
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545622; cv=none; b=n9VJFG2EfuuX1H3aSCu9+qzgQ5AeEs7bHi2E5H3Pw5qXHvIEzMqN11zyChmuqdEKwZCAswEML3OTWPAis7uehXNN5RyhltZ7rWgd/CqgetlqrU+1Suxc9dxHgZJoC3HudeoR4EhqhnSmuI7ahwExkC0UDF1DIJjJaSlBolgRr4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545622; c=relaxed/simple;
	bh=JZU8jHCoVhWoac780UCorUbM0BqAjQdqy8oNh22CxhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ksCP6KlqS86FMHzDkTQqD3D7dq4f3/jnEPAxKoIrf94J9gSKQuYq+8DdlUvky0kiCbwnYECHlZS0fhMKgSRmne5Jj/K1k6Pv0rtvkh/2o1GqLvuD+KfQ/RvuXqSGX8ZjMBufMCwCpv0q30SpQi+GxZSEoOHhG8UKLdVrdGE3+P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LZ7fs2t2; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42bb9d719d4so7672575e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 07:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545618; x=1726150418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfaUW45B+7KlIF+mUGq7uC7AFp3mgjyj9XJFdT/ylM8=;
        b=LZ7fs2t2lMYRdnSJ4E4ZQ3UFA8eMAP42w54v5KEjg3ph9OkTddWrlIuhxDgR9CbxVE
         LEyTfAAeQ2BuY2zpOfWGri+3b+fopvjE+DvW9wm+cSIfzYFl/ALiDBV4MTpuVLiz1PXG
         PYvEC8RpdWJQeQGsiRhUpdaDhVgxrWDPviSpNB3/X804lsuzn7te6Xv4aXSiZ314iKyn
         pIge2jfmK4uOXtZ7mcJVjFFBGnLmdx3etqh1uYGqnA7p11YM8SkH2InjH5QyAMhEvF8Z
         jG5TiP4YRC2wktckbSIJvX9tk6nleXDC819SXatCDtUYx/FSO6RdZku73EYB09T5C0RT
         IQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545618; x=1726150418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfaUW45B+7KlIF+mUGq7uC7AFp3mgjyj9XJFdT/ylM8=;
        b=YjwpRNiaZoTvMgEilGYitN6h7/Z3TumPC88n1F5TVEJAu9MvV89PPYc+yWggEuOJka
         CuprS98CIPp6uFBaE4k1kB1YFN9xQ18r221MmXSi7/+ZNJIB9mRPdFxPKA7TXrr4F5G9
         99s5isXCj21tHv+kQuKbY4cFvvHvHBbHKTsF258dmQQ1hWFGxBfBO58rjSLTfCZsjCvp
         4mGQSR3vRw8iWWjaDm2cLjL6vrCa4vBgLNuHviXFxPKDYmAFk0R2Oy+HeNSZva1p8PWG
         1Ldo4/gnhEtE7UIkylkdpp+p/viD745sDt6ZYdPZTZNzDoLMdDz/T0uVPQYH/HNEKfvL
         PnlA==
X-Forwarded-Encrypted: i=1; AJvYcCVkcLsCljzdJIJKgy8Y4hBtPBugp7KWHKjTM0DbEVMiKga2OOqIexbJsnwp4Y/Hk1E6e3eSMNhRZAwoyLIK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9tJnguePUFgQE6f4xBkbOa7jNeXQTwo4dGvChHYjRdHqOTGa7
	x7L9DL/4SorMCrGX1Z/8o6jXjo8lWU8LkNlMJksFnqCsyiZo8aDjpYd6tpTj7BU=
X-Google-Smtp-Source: AGHT+IGtEzlkmi1X9qAKFgSrVIwQmTXSMDlgcMdhQ2tpsl988QCRJs9wFHdgsZEawo3apfr7sYtKiA==
X-Received: by 2002:a05:600c:502b:b0:42b:a2fd:3e52 with SMTP id 5b1f17b1804b1-42c880f40a3mr88769815e9.22.1725545618149;
        Thu, 05 Sep 2024 07:13:38 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:37 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:57 +0200
Subject: [PATCH 06/13] ASoC: cs35l36: drop SNDRV_PCM_RATE_KNOT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-6-8371948d3921@baylibre.com>
References: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
In-Reply-To: <20240905-alsa-12-24-128-v1-0-8371948d3921@baylibre.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2349; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=JZU8jHCoVhWoac780UCorUbM0BqAjQdqy8oNh22CxhQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byC+AUfKGYETlq0b9gY/V2ov1G04CRqslpi1
 7kwAIe43VWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8ggAKCRDm/A8cN/La
 hTTBD/4lpKyPM5exBNshRD/UjVrzJvz8M+5ZOQUfD0ozwld2V9Qt3a0FUU3uYi79qgHSCf8xupo
 Q5ymJGLATRBZRBe/t5FLYyRwO3JxBd4haRCcoI2wwtpJ/dOeF7tBsORVGQMUTPhxXr5UdYlgjd8
 dP1xfVoS+3hKilEy78jfGtMXMCguR8ozxcuQaAz1NCfuw+NN8Llq1DRApOoZuf5GlyQZw1z7gE8
 PahoISJjrdhbgoPjPxf1VusTyA5hGqOnHxawFudFhXri4mUz520kU0Se0odb/Z8HpQKoD8JOKh5
 dYByJWYcvszzEfKQqaUnlmFwaXdD6pTnp5VIdE2dssdkJsJbv1HzX2LtJFUWwa9A10wOT13heKg
 FHY01BWTLFlg++fMYfd3D1+GeTb0ebIWqvMhzHPwgPIdCuVKSgi1yXfWulxQRhFZmCAiiA6+NZu
 OcQknXux/ONA/p6FGjLqI+wKedl40/9ZV7IKGGgAFjxlwhoR9iBtn9LEY3bPePFvs1ZGbiz+tTB
 //Saii6d+XdarIq3na3e6koDqu/Gm7oeypPmBGNfpbwfT8ouwQbukGynEuRRw6pGs1YLJ2NcNoh
 QCGdpsksvt8z4C6YnYAS8/PJi5YwEfdrDVUfJN5GhaZvunchvMtuf7YXYdUWcsCXr6mS0zog7E1
 9vcDEwbRdon5ERg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The custom rate constraint list was necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/cs35l36.c | 34 ++++++++++++----------------------
 1 file changed, 12 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index cbea79bd8980..b49c6905e872 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -949,32 +949,22 @@ static const struct cs35l36_pll_config *cs35l36_get_clk_config(
 	return NULL;
 }
 
-static const unsigned int cs35l36_src_rates[] = {
-	8000, 12000, 11025, 16000, 22050, 24000, 32000,
-	44100, 48000, 88200, 96000, 176400, 192000, 384000
-};
-
-static const struct snd_pcm_hw_constraint_list cs35l36_constraints = {
-	.count  = ARRAY_SIZE(cs35l36_src_rates),
-	.list   = cs35l36_src_rates,
-};
-
-static int cs35l36_pcm_startup(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
-{
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE, &cs35l36_constraints);
-
-	return 0;
-}
-
 static const struct snd_soc_dai_ops cs35l36_ops = {
-	.startup = cs35l36_pcm_startup,
 	.set_fmt = cs35l36_set_dai_fmt,
 	.hw_params = cs35l36_pcm_hw_params,
 	.set_sysclk = cs35l36_dai_set_sysclk,
 };
 
+#define CS35L36_RATES (		    \
+	SNDRV_PCM_RATE_8000_48000 | \
+	SNDRV_PCM_RATE_12000 |	    \
+	SNDRV_PCM_RATE_24000 |	    \
+	SNDRV_PCM_RATE_88200 |	    \
+	SNDRV_PCM_RATE_96000 |	    \
+	SNDRV_PCM_RATE_176400 |	    \
+	SNDRV_PCM_RATE_192000 |	    \
+	SNDRV_PCM_RATE_384000)
+
 static struct snd_soc_dai_driver cs35l36_dai[] = {
 	{
 		.name = "cs35l36-pcm",
@@ -983,14 +973,14 @@ static struct snd_soc_dai_driver cs35l36_dai[] = {
 			.stream_name = "AMP Playback",
 			.channels_min = 1,
 			.channels_max = 8,
-			.rates = SNDRV_PCM_RATE_KNOT,
+			.rates = CS35L36_RATES,
 			.formats = CS35L36_RX_FORMATS,
 		},
 		.capture = {
 			.stream_name = "AMP Capture",
 			.channels_min = 1,
 			.channels_max = 8,
-			.rates = SNDRV_PCM_RATE_KNOT,
+			.rates = CS35L36_RATES,
 			.formats = CS35L36_TX_FORMATS,
 		},
 		.ops = &cs35l36_ops,

-- 
2.45.2


