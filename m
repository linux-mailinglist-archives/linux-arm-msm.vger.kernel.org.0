Return-Path: <linux-arm-msm+bounces-30943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 170D996DB6F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C32272893E9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F8F1A38C8;
	Thu,  5 Sep 2024 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="P79rubyy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80671A0AEA
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545628; cv=none; b=Mb+4GLQBXZeYCMo1+dWxOywho8FobdQLiwMFwxHVne9jVAPHEa2OtN5+tR4Q1iDW79PxYdVoyjGiC0qyicijHL6+4gz8wZPd2JRr1IkQDuSfrk10yQ53Xon3zlftPrn6M1RN6xWerXyMRFNBQSpHIBTpZQxEB21zLamRadqttLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545628; c=relaxed/simple;
	bh=1uqZdGxPQGBnP8j4g6VlFe4rJuLJoGF/D9uni1/dnBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvIadlkE7OZP1qzdBHykfvj7RZCTsjU0hua8Lb/pmXdW87YJa+6mVZ2jQiZ/zkA0LdZ02C8UHfE4l/yY5ctyz3Uj52O3d58M48sLDf2JAKZk5Zh52byVxrT2kz1PtF70/pIEFtOWOPShKZajoHVkIpMLYeXle+GtMbbZQ0gFkE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=P79rubyy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42c7bc97423so8869975e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 07:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545624; x=1726150424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NInuXK75oVteTq8w9+Oc9GnjLQbH18gVkPWMAJJFJ/U=;
        b=P79rubyyJnvYlIhoxNVvITA7/DR1YSuAWhn/V1LjAyosp/OXxM96jYg31XQaNvjwH9
         5aT2kr8jXtaqp3BO1j0wmx4LMzhlMfGrfIBIePjIB4K60Z8jaTTMe/JcCu6QT/IohPh/
         oDZZnF7IgFQa+7KEfWHRML80fWo6g7g4ytWcWZs9k/ISVd9gK8v2/JfRrEl8I2PVIKni
         aA8PQ6P2Xns8c3s3//CYc47uMWDUwRXF6KRm7UgaQza2253lOPwg98LF0uyovMGG3MHf
         HKXcoI3iO4Qq6382s2il3juauj36aCkTPdf/8QlyMGgtIlcz97v6gLFXUd78yCM8SZS6
         hpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545624; x=1726150424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NInuXK75oVteTq8w9+Oc9GnjLQbH18gVkPWMAJJFJ/U=;
        b=hA9z8KJNiEvdQlmV7Bvm57Ka8zuEL/QiAps586abTjWblfkTlWkvZhaeuzTjH57OWT
         C5blcGfvA8b5TLFq069xxzRktDmjRjP10vMZl5FLgKDnXktfBQaBKIBJnfGIapZoq5S5
         xd47MQ/+D/OoaIZgfdll2NTCJT7yPlxsDJE5UqEuNRjUkis1yWPAOS4wj2KhE/HQE34a
         goaqvoOyey+YM6exq7iZIwnfq2K6SUQ8C85Yq1S5KowgmfXR85QXK2wHrKVox4Qc81wR
         DwdEcf8lfvliZMqKNsqP5ERhuM+CHiGpPMLC8Y6uhYgnlaYzglzM+9cPe4uG11wNQ2ij
         rGxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcx5JtxBuBCcYOeoir7HrIQtIu9QzD7WjKrssTEEuJGNlrh6qtXbKzoJmsAPlYsek1mOIS4VOaY0Jik6B1@vger.kernel.org
X-Gm-Message-State: AOJu0YyW5DIiqcqFOxa20imHYPoRgBmqvrIX9wA4OB7pJsS07Yly1vnw
	8IsTIoN18qUxlr51/54eCawT3q9oUEXHQvsiWZfp1aWPImfNG3skLYoDw8wYU8w=
X-Google-Smtp-Source: AGHT+IF1Rnp0BlEo/3O3FvtMVAQD9zYxpmEVsCSjem+AnuxVcV5GOUWE75yL3i/75iLee6d74WlhdA==
X-Received: by 2002:a05:600c:4f4e:b0:426:5e8e:aa48 with SMTP id 5b1f17b1804b1-42c9a36ce9bmr25508875e9.22.1725545624078;
        Thu, 05 Sep 2024 07:13:44 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:13:02 +0200
Subject: [PATCH 11/13] ASoC: sunxi: sun4i-codec: drop SNDRV_PCM_RATE_KNOT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-11-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=1uqZdGxPQGBnP8j4g6VlFe4rJuLJoGF/D9uni1/dnBU=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byHCX1aj4AmJj1Q1JWPzGMx85ey7eOOxJr+R
 rAU5MJYHhGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8hwAKCRDm/A8cN/La
 he0WD/9ZWAdHLFmtFB3mqYO/QGvuN52rpe1DwhCaM2ZCwcGDXqJ2yN32wMIZlvW2Ws2qBR7xuJq
 mZ6HjgYXOG0wJIW3Pe9fiUdRSxdJM7ILbnodGi7Mpb1b8f9TITFHjR9OCxaskxFs6MlMTsovZco
 TyhNEo7x4TbKgjNxELQKMqvTW4A7XA/Uz05XKJ1Ys0tZ/AsiJccuDCmv0Igy5VezRVRubCOjzwz
 A+2bUFPbOtq0OPrKr8Z2tfZkjKdR0RDuNcEV0SGtwWIijxxhlEy+eidNFq1tzVQbTTcPzNHObnu
 /iU5f7f3tExu0ipT1WcGmJrb6WePR8T5r/iQul8HGDekZnPnXDFutlqNZZsX5EYdOajvF4klddC
 mP7PzOAG0QHyZkgwOU7JwrwetBknkEeeA+KFAMKU/30+Q6bWsIXE9UDjBR9ZvxgWts8ey+nP8/o
 Z8LKus8tsEv23crdsPdSGzxJNQuC0x2SqBhoqk9e+Lk2qECPJorgQHhIANw6BMd0Mp43ugYA7J8
 zqWrr6BzE3JtJKGjfH+Lyad+DpAmzLHAjEsoE9nvV8ZP9qdQq473Tbn1ePNgDQjkEdndiv5N2HA
 bUJdAvFHiQqTxVq/x7icSTe7dOwERMEm0XEF05xTExrKh1d8lbdlaIqbjp2sZbXHoI7Sy4/dOtC
 FIFFrECzeVOEwHg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The custom rate constraint lists was necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/sunxi/sun4i-codec.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index a2618ed650b0..25af47b63bdd 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -577,28 +577,12 @@ static int sun4i_codec_hw_params(struct snd_pcm_substream *substream,
 					     hwrate);
 }
 
-
-static unsigned int sun4i_codec_src_rates[] = {
-	8000, 11025, 12000, 16000, 22050, 24000, 32000,
-	44100, 48000, 96000, 192000
-};
-
-
-static struct snd_pcm_hw_constraint_list sun4i_codec_constraints = {
-	.count  = ARRAY_SIZE(sun4i_codec_src_rates),
-	.list   = sun4i_codec_src_rates,
-};
-
-
 static int sun4i_codec_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
 
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				SNDRV_PCM_HW_PARAM_RATE, &sun4i_codec_constraints);
-
 	/*
 	 * Stop issuing DRQ when we have room for less than 16 samples
 	 * in our TX FIFO
@@ -626,6 +610,13 @@ static const struct snd_soc_dai_ops sun4i_codec_dai_ops = {
 	.prepare	= sun4i_codec_prepare,
 };
 
+#define SUN4I_CODEC_RATES (			\
+		SNDRV_PCM_RATE_8000_48000 |	\
+		SNDRV_PCM_RATE_12000 |		\
+		SNDRV_PCM_RATE_24000 |		\
+		SNDRV_PCM_RATE_96000 |		\
+		SNDRV_PCM_RATE_192000)
+
 static struct snd_soc_dai_driver sun4i_codec_dai = {
 	.name	= "Codec",
 	.ops	= &sun4i_codec_dai_ops,
@@ -635,7 +626,7 @@ static struct snd_soc_dai_driver sun4i_codec_dai = {
 		.channels_max	= 2,
 		.rate_min	= 8000,
 		.rate_max	= 192000,
-		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rates		= SUN4I_CODEC_RATES,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
 		.sig_bits	= 24,
@@ -646,7 +637,7 @@ static struct snd_soc_dai_driver sun4i_codec_dai = {
 		.channels_max	= 2,
 		.rate_min	= 8000,
 		.rate_max	= 48000,
-		.rates		= SNDRV_PCM_RATE_CONTINUOUS,
+		.rates		= SUN4I_CODEC_RATES,
 		.formats	= SNDRV_PCM_FMTBIT_S16_LE |
 				  SNDRV_PCM_FMTBIT_S32_LE,
 		.sig_bits	= 24,
@@ -1233,7 +1224,6 @@ static const struct snd_soc_component_driver sun4i_codec_component = {
 #endif
 };
 
-#define SUN4I_CODEC_RATES	SNDRV_PCM_RATE_CONTINUOUS
 #define SUN4I_CODEC_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 				 SNDRV_PCM_FMTBIT_S32_LE)
 

-- 
2.45.2


