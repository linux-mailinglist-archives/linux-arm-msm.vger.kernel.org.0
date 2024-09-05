Return-Path: <linux-arm-msm+bounces-30936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C571B96DB5B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:14:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45E961F22257
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D887D19FA7E;
	Thu,  5 Sep 2024 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ywswRn4O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC84419EECA
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 14:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545620; cv=none; b=MTByzBLuKaXZSCI7+CS39wSXPZcJISbOdPg6H3/76m5SjIpDof9wAcdqgD5ElbfeqtUroZSNIQGwVbz0/vmvKiWmsvLCBY/BwJcBZSRqnkcWKpbdwKa5effSQhjRV9zSSglJEl1kRoGRNKQVK5U0DS0r0crwhyUZYmU5ZcQ8czo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545620; c=relaxed/simple;
	bh=Xv0vuHB6OmJEPDWj7YbALy0svxpRq+MGIQhgNIVXe28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0uJPtCGwWx1SXzFezpFWzRivgAUXEBNmujQdBFbT//OLTVMEdmy8bjxWYfnyAfdKb67AiSJU3PXnRc1ODJMNIIGffi6CLRgknTx2Bo1C3sAvkejs9i0Utw2ehhg9/PksL/8V45T9m+R0aAFL6qjYIojZJ+wYqTjczsgTLIOmjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ywswRn4O; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bbbff40bbso6788635e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545617; x=1726150417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcCu+DWFXbg2fAQ79jKiLK8pzJONU6/x+rmv87WbABM=;
        b=ywswRn4Or1nrAsGScSkmKV7oXwr0FVzkPl4SkzwNhksSKMjCPIVybeZLvvdZKHFnoG
         euQxr5EAI0eGZm9ulXuJs3v5+xOGtV5cZr2TkYjeBO7wBnNpAAM68E0Vrsw6aUGvQEzW
         Z8LGuGHzFEAYJQ86f6l3FMqZuBCNYlOsIO/E7gW9U9IcwYauoaWy5dAU4liCzipyhsy5
         MrkbvZAL7WfrpXfk6tL9L7Nchp4QmlJmctOd6t9cLT3TiQP9yNsRdC7lChNbyMDG4mer
         s4oYFEYfMHGXOg46gZ9EMZPvKffBFNZycIpF0xhxngf9OegpTp6NBpxmSmER3MN9DZ1a
         soZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545617; x=1726150417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcCu+DWFXbg2fAQ79jKiLK8pzJONU6/x+rmv87WbABM=;
        b=GdfTl0pRoVChiRcZV9GRg4N1qfd4yuj9qdcSRPxDPIJ+C9rFvPewfiMNvuGO2a1WBC
         c3zdWW2p0K6vdiqvUIFQX7gQKSJr/c3liYbPDO02iwaGgBkbRPjB6UUeQKqIJ2Bv9qIX
         G9TOf91lrYHm7n6wp+750qrvbkdHu9+Wc+q1sbpkXfsbaZRJgD2U5o0pIehsdskcRt0f
         UWjG8qZifg4HMcSv0BtHpkT1gEoBY2KvGf3mx3fSvb8WiIYE2JoRUZkXQDjuRDAhdzqB
         PSdYO2VMQjmn/WK3XQkRsyIIr2hI/68TlB9lnIRqDFdxQrojR7K5lagnlzeNxnC3A0xi
         JTkw==
X-Forwarded-Encrypted: i=1; AJvYcCUsj5mGyBirYUbJAJGM/1teiGKnYe2Rlg2xrfCXkFgBQ90C2giBQ9YjJO9ToqbyoyPTk8Z4qUDLfQv8+rRr@vger.kernel.org
X-Gm-Message-State: AOJu0YwvgXUrglTF+TFL4X7H2nWfxeJEUP86rKNsfcoA0SzD7lxp9OFJ
	ioTSVF7Z6p2MDKzXwpZ2G5SKfWHrgxtW5zqQMYJLERzH49kY+WDyDZ4nrnLI5mo=
X-Google-Smtp-Source: AGHT+IFIEHR55riZlgeQGJQjXuyOXmmTN+5SiNQQq3UpC9AB9eRnK6WUg+y3HQedvVtwF3WTVV2akQ==
X-Received: by 2002:adf:fa4c:0:b0:374:bb1b:d8a1 with SMTP id ffacd0b85a97d-374bb1bd9c6mr11130169f8f.13.1725545616938;
        Thu, 05 Sep 2024 07:13:36 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:36 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:56 +0200
Subject: [PATCH 05/13] ALSA: hdspm: drop SNDRV_PCM_RATE_KNOT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-5-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Xv0vuHB6OmJEPDWj7YbALy0svxpRq+MGIQhgNIVXe28=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byBQJXpw0tKm9S1aoNQuw0gFMk22/TxwdNAJ
 DQo1OePFpeJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8gQAKCRDm/A8cN/La
 hb6CD/44tlADSXvh8LtznvSCnCRWDjibNp3ZPrngVla5rHZENvj/3bhJd4z2yqP+n5D9sGXGqDG
 4xNTMjbtLBxWXfJQTNFD1EkV6IIjuGJvW0i5NwXFyIS34ysoOE0hI9Q8FqVDCddEonzuY7wcjy5
 RnJBiUvZoKOO9WcpWEP3gm0VGniXudhEWa0SBL7G3ojs3j7TOXDF1Mceym7wTQKYJGZlZDCUohC
 H91vxd6zdshPH/qzyMI9jqGpjwkqY2lpHww/KZ9tQqPpy2VS2MXPgl4llQyPpIxxvbcQj56iZcR
 CsjdRZRWF4PE/aTCl1T8mbSUU/XmInE7C+yqydfXqxp0jd0vFsy8ZojjGp6JDfs6NgGn16EYbS6
 ViY4U2XOqdcXgXkg8ttNgs6JaEhjx1XrkRddp7NYnj11EVJIwwo/zODYBuBCYZJNSctuqG3MvJG
 IxM9AEefJBxIgyfUskHexjjJBa6NJhU/6ux0FNEN/ukrTRbxmCOFacv1jZ+uqo2BL71xYSl8GNq
 oAny7kUhtzHYyMG7I8Ifp0TH9qEtXeY5QApAGE+oIPYKpe8btMam/nMJCyBhUY7PotLSrYd97T2
 yQ+H8YXAew9HF16sTUciTp1/QB5QSU3YEVOEMQOpwc/MS7pQvwWhwZQonuGU/QQHJOQwvSsMelf
 DIHwWZKP7oiAz4A==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The custom rate constraint list was necessary to support 128kHz.
This rate is now available through SNDRV_PCM_RATE_128000.

Use it and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/pci/rme9652/hdspm.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index c3f930a8f78d..dad974378e00 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -6032,18 +6032,6 @@ static int snd_hdspm_hw_rule_out_channels(struct snd_pcm_hw_params *params,
 	return snd_interval_list(c, 3, list, 0);
 }
 
-
-static const unsigned int hdspm_aes32_sample_rates[] = {
-	32000, 44100, 48000, 64000, 88200, 96000, 128000, 176400, 192000
-};
-
-static const struct snd_pcm_hw_constraint_list
-hdspm_hw_constraints_aes32_sample_rates = {
-	.count = ARRAY_SIZE(hdspm_aes32_sample_rates),
-	.list = hdspm_aes32_sample_rates,
-	.mask = 0
-};
-
 static int snd_hdspm_open(struct snd_pcm_substream *substream)
 {
 	struct hdspm *hdspm = snd_pcm_substream_chip(substream);
@@ -6096,9 +6084,7 @@ static int snd_hdspm_open(struct snd_pcm_substream *substream)
 	}
 
 	if (AES32 == hdspm->io_type) {
-		runtime->hw.rates |= SNDRV_PCM_RATE_KNOT;
-		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
-				&hdspm_hw_constraints_aes32_sample_rates);
+		runtime->hw.rates |= SNDRV_PCM_RATE_128000;
 	} else {
 		snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
 				(playback ?

-- 
2.45.2


