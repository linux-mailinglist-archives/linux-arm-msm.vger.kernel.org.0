Return-Path: <linux-arm-msm+bounces-30933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D34096DB4B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6653CB228F5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3947019DFB8;
	Thu,  5 Sep 2024 14:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V4Y1RrbX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D4919DFB6
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545617; cv=none; b=vEBnJHc7EJiPvLYtWCpD338CicEQTxMpdJLxm5KXXQEN2fT40zD/5FtdsJtgILeR49bIfoF1jzg9QAnA6XwLA/uapNnL8UJ0U7f8jgArQpM1QRmNHsII4EnEt8RF2Ys4lxkK48zIdzjMFvgGFf92k1SChooush7c00F9dXrftME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545617; c=relaxed/simple;
	bh=nbyk2pbjAgexYBySRE6v5MF/PkMeyNKLqiWP8pzL27U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h3IILE7+6u62wCzgkgwbmh3F133loLQRuwCzCVLjT8VFe5y9btPGxgousrnEQiupoy+/RMrqkMz1D5exuEmeUXKBtlkbmsP5M0tU7+cGy4hlKpJv7iYnFNBXpEaOVMhMCF0ngrOkBjDficJkxgmJ4kiH0/UDOxhutP6+IJo0OFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V4Y1RrbX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42c2e50ec13so6855175e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545612; x=1726150412; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTW4BPjVBNC1txaO1Qybt7JrbkszqBjqcNmLmY+bYcs=;
        b=V4Y1RrbX234zbTEMB06cGWFrNMbrbkNToiRtge91tSArERTErk1MEjEanGtGWfuaR/
         PZJpXbftyKW+5bnznRtvz7hg9rTQfgLcH/GWTQ7gx/Cew21DgBZF4dxMHFF8cg5ZWIAq
         CeON1xpPDTVkvPPK4ZsmJEUSssvXcHyTkx22J6hioq1pmN/g2xNYhbikFasr1BKDm/u+
         Q5t21HAG0H2aoZAp07qNqEVRXR658Uo39AcLnSuJNjaDM1QUKcnLp1udQNLpHYVhYJ3l
         ZSRqsH61rXdk2EIwvhL8wdylqOuvBjobkHwaYlxQUzg1hJ7tbygDDZpeHVTX+ilVbM4a
         6kOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545612; x=1726150412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTW4BPjVBNC1txaO1Qybt7JrbkszqBjqcNmLmY+bYcs=;
        b=cIFquntX74JxZo8CrOsPgz0PGkv6YVouHwaB0wCCGWA6NlYPnqFSs8j4KrWKkfcm+x
         wulLcCQQTsdVAhLFLOrf0lKB0KZzErgdtEYgzwU86Qtuz6lAGEozY2QehBI8oIwOarnD
         owFdPRiJnPoSD+RwY3aeVlDXnxyHMCcS6Y3h7D616IrIQ1GeaWFxxa2RD37LQDFOjvhL
         Zw1e/VTax2/95312AafY/SQvjaY/tNKNb+8AHPbGmR5/x6m7S61S7Qbxy1+TtNv+9Sdk
         2KTUr2/1dCAm83aFYjGSz+Yf+p/CdGslyeLomyIe3opgiwtapLRU8NrRyREgULvvQ4F0
         KBLA==
X-Forwarded-Encrypted: i=1; AJvYcCVgoc++PIjdPLQlg4n96lNh7lPJ7dee9J5FY1YOvcg0k7b0Qn+EUGgFAn/+jGyS45q24EkPnswM3pRvFdvx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxf4p+yX6g0LTrulHtWb9k8ophKrI3JaRQqf29nkdkf2MqWhyq
	CSie24k12HAi9252kximmPAENgLrUf5UmHEVri5kAf9paJewmauvpQP2df71FW8=
X-Google-Smtp-Source: AGHT+IHBWWTYTD/NiKOaA5SpW4N37gd2i4CApX3NZGiNIF1CauMco3Jpwv1V3JBttP1V61f4V94HEw==
X-Received: by 2002:adf:eace:0:b0:374:c324:eab5 with SMTP id ffacd0b85a97d-374c324eb64mr10087549f8f.41.1725545612335;
        Thu, 05 Sep 2024 07:13:32 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:31 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:52 +0200
Subject: [PATCH 01/13] ALSA: pcm: add more sample rate definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-1-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4141; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=nbyk2pbjAgexYBySRE6v5MF/PkMeyNKLqiWP8pzL27U=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2bx+0hxsyOB1G3jUIFP2N4UKQAgjgwcIS7zpN
 P2ju1g982qJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8fgAKCRDm/A8cN/La
 heV4D/wJBqYO/X+0ODfULGsb4Og1L+bWaai0VSP8TToyZzfpSkmUyd/wXZtNo/BLpdsdAYyNKM5
 K314rJcJfBbWXQT6XmgfRSjc/Kn7xKqFkrJzGUVtpiPlf82h6RW1M25nfekb1lMia6rvaBcRVcQ
 15eM1ckLvlIhWZpcEvTaBFWW/V5TUcy64mpJX574qJCKbR0U071AqMTsYgdTJnptPAZOTqhLVDc
 uKbGoXvfX9F4KWs+YH3d3kjzeDeizAkXrRhv5NHoLeOUvvamYZggmjqJCRWS5oiLPn5JKvkig/L
 YOCgPtBn4QW8gZKxhOmRqLA2GG24RRADpaEWRPfIUziaeZMYJi2u06HA+gtyzP6gdrwimkS2FN/
 ii3pA+MwjNoOrCKiHPzKFX1WpeoDruRDBkXtNfnubUsOQj9OI5lUdr0EQna1gUUiVKRKnTr7QDe
 DiZP64xgjmL/kT/YK6WrZ7BnJ3rpZSd1gOmn8vRYRjG88M3l1PdggL7LXUWSfXtYqxX1loVyR9M
 Q2ewA4GtbRX6qeWpf26VHv3j7tyVzLfDM2oaxTP1KOlHAp0V6r+4CIWKTst9cGt2ASHCbJgfdVw
 dA5qjMX3o7PP6ZwPnhwY/uNBmjUtZcX4ZseZNgdFDGYRUuKIb3qCaqAfVjMfRKuQB0XfOKo85A/
 x/qauD5RnK44B/g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

This adds a sample rate definition for 12kHz, 24kHz and 128kHz.

Admittedly, just a few drivers are currently using these sample
rates but there is enough of a recurrence to justify adding a definition
for them and remove some custom rate constraint code while at it.

The new definitions are not added to the interval definitions, such as
SNDRV_PCM_RATE_8000_44100, because it would silently add new supported
rates to drivers that may or may not support them. For sure the drivers
have not been tested for these new rates so it is better to leave them out
of interval definitions.

That being said, the added rates are multiples of well know rates families,
it is very likely that a lot of devices out there actually supports them.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/pcm.h     | 31 +++++++++++++++++--------------
 sound/core/pcm_native.c |  6 +++---
 2 files changed, 20 insertions(+), 17 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 732121b934fd..c993350975a9 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -109,20 +109,23 @@ struct snd_pcm_ops {
 #define SNDRV_PCM_RATE_5512		(1U<<0)		/* 5512Hz */
 #define SNDRV_PCM_RATE_8000		(1U<<1)		/* 8000Hz */
 #define SNDRV_PCM_RATE_11025		(1U<<2)		/* 11025Hz */
-#define SNDRV_PCM_RATE_16000		(1U<<3)		/* 16000Hz */
-#define SNDRV_PCM_RATE_22050		(1U<<4)		/* 22050Hz */
-#define SNDRV_PCM_RATE_32000		(1U<<5)		/* 32000Hz */
-#define SNDRV_PCM_RATE_44100		(1U<<6)		/* 44100Hz */
-#define SNDRV_PCM_RATE_48000		(1U<<7)		/* 48000Hz */
-#define SNDRV_PCM_RATE_64000		(1U<<8)		/* 64000Hz */
-#define SNDRV_PCM_RATE_88200		(1U<<9)		/* 88200Hz */
-#define SNDRV_PCM_RATE_96000		(1U<<10)	/* 96000Hz */
-#define SNDRV_PCM_RATE_176400		(1U<<11)	/* 176400Hz */
-#define SNDRV_PCM_RATE_192000		(1U<<12)	/* 192000Hz */
-#define SNDRV_PCM_RATE_352800		(1U<<13)	/* 352800Hz */
-#define SNDRV_PCM_RATE_384000		(1U<<14)	/* 384000Hz */
-#define SNDRV_PCM_RATE_705600		(1U<<15)	/* 705600Hz */
-#define SNDRV_PCM_RATE_768000		(1U<<16)	/* 768000Hz */
+#define SNDRV_PCM_RATE_12000		(1U<<3)		/* 12000Hz */
+#define SNDRV_PCM_RATE_16000		(1U<<4)		/* 16000Hz */
+#define SNDRV_PCM_RATE_22050		(1U<<5)		/* 22050Hz */
+#define SNDRV_PCM_RATE_24000		(1U<<6)		/* 24000Hz */
+#define SNDRV_PCM_RATE_32000		(1U<<7)		/* 32000Hz */
+#define SNDRV_PCM_RATE_44100		(1U<<8)		/* 44100Hz */
+#define SNDRV_PCM_RATE_48000		(1U<<9)		/* 48000Hz */
+#define SNDRV_PCM_RATE_64000		(1U<<10)	/* 64000Hz */
+#define SNDRV_PCM_RATE_88200		(1U<<11)	/* 88200Hz */
+#define SNDRV_PCM_RATE_96000		(1U<<12)	/* 96000Hz */
+#define SNDRV_PCM_RATE_128000		(1U<<13)	/* 128000Hz */
+#define SNDRV_PCM_RATE_176400		(1U<<14)	/* 176400Hz */
+#define SNDRV_PCM_RATE_192000		(1U<<15)	/* 192000Hz */
+#define SNDRV_PCM_RATE_352800		(1U<<16)	/* 352800Hz */
+#define SNDRV_PCM_RATE_384000		(1U<<17)	/* 384000Hz */
+#define SNDRV_PCM_RATE_705600		(1U<<18)	/* 705600Hz */
+#define SNDRV_PCM_RATE_768000		(1U<<19)	/* 768000Hz */
 
 #define SNDRV_PCM_RATE_CONTINUOUS	(1U<<30)	/* continuous range */
 #define SNDRV_PCM_RATE_KNOT		(1U<<31)	/* supports more non-continuous rates */
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 44381514f695..7461a727615c 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -2418,13 +2418,13 @@ static int snd_pcm_hw_rule_sample_bits(struct snd_pcm_hw_params *params,
 	return snd_interval_refine(hw_param_interval(params, rule->var), &t);
 }
 
-#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_192000 != 1 << 12
+#if SNDRV_PCM_RATE_5512 != 1 << 0 || SNDRV_PCM_RATE_768000 != 1 << 19
 #error "Change this table"
 #endif
 
 static const unsigned int rates[] = {
-	5512, 8000, 11025, 16000, 22050, 32000, 44100,
-	48000, 64000, 88200, 96000, 176400, 192000, 352800, 384000, 705600, 768000
+	5512, 8000, 11025, 12000, 16000, 22050, 24000, 32000, 44100, 48000, 64000,
+	88200, 96000, 128000, 176400, 192000, 352800, 384000, 705600, 768000,
 };
 
 const struct snd_pcm_hw_constraint_list snd_pcm_known_rates = {

-- 
2.45.2


