Return-Path: <linux-arm-msm+bounces-30940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A696DB64
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 571AD1F2134C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7331A0734;
	Thu,  5 Sep 2024 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sBCBGP4Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5871A01C4
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545624; cv=none; b=tqp2+9XuUnSAWteRzBg0WK9F5ovp9htBEK4XAZCDfRKc6U02eYa3J0PxezoD/JzPFJ0qRdayQDLkElvk+hhJPUel9N3dp4doqcf5vTbdR4GWCzda0fv9rq1q89tR9AKTiPsmORXNU352mvS8R+3nKuOTIEU4q0fZru3LCksTwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545624; c=relaxed/simple;
	bh=x86FNaEpjnIyR5OAZHCSCK5+o+umgxvyBNNfEVUoPH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CcP5zag8z99Rj/yqRMuShYe6rlbVgvlfWUXGWRCEg8TPEs7foSwbcZGg5y1atzj0YGIJMB2ktp12/GwO5ClWi+9hulDyC7Llt4ft+n2+c2tjTGWY1uAvFaeaxUe5Vlfqsl+/uDDUPU6/PE01A0lcwtuxeFFYte3IuBJSptbvRHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=sBCBGP4Q; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42bb885f97eso11298675e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 07:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545621; x=1726150421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sxrac1nWcSLd8cTfx3t0NuLkVpF4P7zBU6WUMa4X7WI=;
        b=sBCBGP4QA+elRgUnaOEoQI7YJC8c+TFQag+K4FpCyj4xFUSE0dqrcKkMMKen7X8sHN
         yBubLtpx/R5znyIzQtu/gdjZmT+UF8Lm0Wiu2QISMt09bPcmZZDyjr5KzAWLlsy8trUV
         6vsho6PSKf8j7WO69h7MiL6TFXxaSNVvQNJEFYej1NRVZrvccDRH8MFi/9WNbKS4izXY
         XqVfL/x06F3huDDv5Bj3pqNv1oNTfmarzecWDPukoR1gqBfjHoJz2t2gXZnUjCQkOFDP
         kBEEzQ5PyauKsZytVrmJIH4P2U6kCtvuZgIbhjvxSBmsJ3XnmtE+XD+wwTo3MmF7RB5d
         vp2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545621; x=1726150421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sxrac1nWcSLd8cTfx3t0NuLkVpF4P7zBU6WUMa4X7WI=;
        b=LjF8BC4BzY0Pov1yom8+Atskv5pIYjAOTHND55H8H1fYf4gzjSrmIdB/pFrPj0i103
         FH7X4TeKrtG3UNbUYylzosnKHsE4VNSCyIQRxTh31E9VEFkqh3cwn3PdV3ahTAjKP7ii
         Y2yAQzvxeEAUEY+B1e6Q9HbvUA1BDrcb7jWQRsL3ZUp3u5ofWQ9Vhr7aVTdCe99n+CsL
         2dVGcA1f8i4BriZMu3g4hyXb+xCepVpn0uTfmzJF5hS52HGZPttPMzg3Rhs6C0iPbKuO
         ZbpALTn6ojmAh/jgAEMuZZb22ldWfpB+LIkz0Y21RYY1y3Dtc6q4z4WbYhb/BOUdLY7S
         4jKA==
X-Forwarded-Encrypted: i=1; AJvYcCUDhY3dLAp7wmEPrFi7Eit9soxLzz/sgMwnu7MQirm6Vx+zw28WpxCwtR5u0VwvCQd6mXfh6eCcuDmoUsru@vger.kernel.org
X-Gm-Message-State: AOJu0YwD53twu8gCLJyeMR9IQ20wmaUxgdqAjSdYuUP102LaUhrSwDPJ
	Y0KwtsEG9xT4y0r4A9metGOd6PdqvQW2OcZkXbgCDefzaPuZW+8AJ6AdX9xNBGw=
X-Google-Smtp-Source: AGHT+IH+jM4E6XFtH4yV7dt/MuKKbSnx0kbRDSQ+9W6MalNelsQvYVX6PPe8E18bCCVxO02rcsQe3A==
X-Received: by 2002:adf:e709:0:b0:374:c57e:1ea9 with SMTP id ffacd0b85a97d-3779b847aaamr3814838f8f.18.1725545620447;
        Thu, 05 Sep 2024 07:13:40 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:59 +0200
Subject: [PATCH 08/13] ASoC: cs53l30: drop SNDRV_PCM_RATE_KNOT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-8-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2106; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=x86FNaEpjnIyR5OAZHCSCK5+o+umgxvyBNNfEVUoPH4=;
 b=kA0DAAoB5vwPHDfy2oUByyZiAGbZvISh5e9yuIZ6fhegOdIwe1HpWFPSz5lzuBx/Xh1lYE/Go
 IkCMwQAAQoAHRYhBPThWa4Y8/VtXxu3G+b8Dxw38tqFBQJm2byEAAoJEOb8Dxw38tqFxS8P/Auz
 glLnhOinsM4qpstMYih0MgMyBfS5BkRGvvQv78UV/Mi4Y8Aa/TZLWyjY5DtZ/ifYi+CQ1mTVKlM
 fcvpqaydV1yQs26SZX4WwftbI6yvH2ep63gu1gDMjNg19JM3CN5m+K17jL0N/nz9WJm1MifPHX0
 CNs9yhK3TaHhbDqsTKS1R3GGdjmRhYzEOFOECZI16OAgDUyHSyCrNW9moGzFE90b+luipqUKZYv
 CgEEa8t5PtgYBbB5DBVfQ9eMRMIMSffn7PBsaFLmvekhISH5e9iTm53/pGNBxXez7iYdm0BkOau
 vxSImcNyZd3McfPzz+NcUN4krQat144fofS0bz2ZDjZChOqX/TXst/bxAf9hnPBQM3b4HX9sOeA
 GX3y0BOPb71vdZWkk6q9tslY+DdFju7R1b1+At5rH+AwFH6L1ClGTEQ+hIwr5rLQ9WZMjtMe3Q4
 LbTkhY3khwyp9PYpDApAnR/o+LCtt4LyWOVy2A8cLmtmKHIulIL6Oqw3zqLeAWzKZvlGW+8WGrI
 jgeK+AU37YkFNpFF3YeM20MIXa6aDJ3PywF0zLVWsQ4sfVMUuHsWUNLAfsFSKbDjt7pF7tT6x/m
 qX3KDTzkCWSW6GZbgBS9jXRx00jM91w75beWJJ/mZ4V9YR1pAhuPwwo/oVQiZGMZQkmMR/MaAbj
 NaY1l
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The custom rate constraint list was necessary to support 12kHz and 24kHz.
These rates are now available through SNDRV_PCM_RATE_12000 and
SNDRV_PCM_RATE_24000.

Use them and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/codecs/cs53l30.c | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index bcbaf28a0b2d..28f4be37dec1 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -739,24 +739,6 @@ static int cs53l30_set_tristate(struct snd_soc_dai *dai, int tristate)
 				  CS53L30_ASP_3ST_MASK, val);
 }
 
-static unsigned int const cs53l30_src_rates[] = {
-	8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000
-};
-
-static const struct snd_pcm_hw_constraint_list src_constraints = {
-	.count = ARRAY_SIZE(cs53l30_src_rates),
-	.list = cs53l30_src_rates,
-};
-
-static int cs53l30_pcm_startup(struct snd_pcm_substream *substream,
-			       struct snd_soc_dai *dai)
-{
-	snd_pcm_hw_constraint_list(substream->runtime, 0,
-				   SNDRV_PCM_HW_PARAM_RATE, &src_constraints);
-
-	return 0;
-}
-
 /*
  * Note: CS53L30 counts the slot number per byte while ASoC counts the slot
  * number per slot_width. So there is a difference between the slots of ASoC
@@ -843,14 +825,14 @@ static int cs53l30_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 	return 0;
 }
 
-/* SNDRV_PCM_RATE_KNOT -> 12000, 24000 Hz, limit with constraint list */
-#define CS53L30_RATES (SNDRV_PCM_RATE_8000_48000 | SNDRV_PCM_RATE_KNOT)
+#define CS53L30_RATES (SNDRV_PCM_RATE_8000_48000 |	\
+		       SNDRV_PCM_RATE_12000 |		\
+		       SNDRV_PCM_RATE_24000)
 
 #define CS53L30_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE)
 
 static const struct snd_soc_dai_ops cs53l30_ops = {
-	.startup = cs53l30_pcm_startup,
 	.hw_params = cs53l30_pcm_hw_params,
 	.set_fmt = cs53l30_set_dai_fmt,
 	.set_sysclk = cs53l30_set_sysclk,

-- 
2.45.2


