Return-Path: <linux-arm-msm+bounces-30937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7682E96DB5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 16:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 016841F21240
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 14:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5A319FA90;
	Thu,  5 Sep 2024 14:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TTkC6TPa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A468C19E827
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 14:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725545620; cv=none; b=eHXiUj/MczZ8WvQ+V+Bv0G/B9JKu86d+35E67O5iK4lHQXehlaC1HqAugPA8GnPAp2RKHaR86XMUqeidwSAh4wpYfdmix4Yy5f1J9rvjVUyfR5AKMqtquAGereR9Ho+emeCQjYO6+HeDvTRQkLaOjtPOL9eRZgq55QFPgACMmVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725545620; c=relaxed/simple;
	bh=KOHw3cK09GmDelIdzy0PFMcoAWRfmYIV3CJePnQGlsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lmdgcwFAUSKMUa6WfuuYfkh3fxBtn/SH6CUExA4sbnsMMk0sDRik5zRicoBpNDFwCOL44GgCcP21NZwgEvZzUNHH/9DzIQ7P7paDU6jQwpXdSChC1bLIr5E6Yzt+xmPTkvN+nzX/CEBybyjTNyfHZRr8nbd9Pk48wobdCCiyomk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TTkC6TPa; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-374b9761eecso517348f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 07:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725545616; x=1726150416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7h3IxLII25IyrhC+KVhfj3YGVmIHw6kd015YpmGIJ8c=;
        b=TTkC6TPaQZx3Tro34dLDv39PjeMAYTlgQc+b9ohqyAoFiJDofc0EP/d+V0iarzrpa3
         AWhTgGBAL5sU6Rsg8txPMYDfcfc6WslNzhAfNg+76eiDIZ8LCyh7i07/FqC0STFXnPWX
         S+wlAAdkhf2dafgxqAtUWlonKCojbDN49Q5subdUFTmfwVKN0eD2oYDMR3Oemjb94ggs
         Bewkxw/+/WWTSOFiMxLmDhIoexc0j7B0hgMVNNKWGCqcNJovCm7d13G+cQyZTuc+W6kr
         DkcVTK9WAg+X3IW+M5eAPAFtF02LCNXfDBuyeRLwnx8kkG/tanJSUFb8/BBrd9b+q140
         hQtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725545616; x=1726150416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7h3IxLII25IyrhC+KVhfj3YGVmIHw6kd015YpmGIJ8c=;
        b=LU3EYSag8B9AJ02plJ9zj0Trj7s+JdGkSyeE/OY0P0bhCP2D/VIaDg36CHgTQueZ+D
         QwGRGgzn8VL0ZrVjl+0usOhJ9zvLHcDHgdun4f8HSILxXiCuKe4taHHHOClXadJWoq0U
         sohwxDXzWkHC+x6qQpG688rv5V2sfPz5u7MK+WK/QUWZnvaJlumU//FoWyhFXZAlCXbZ
         7T2WehRo0ANg2Vhw+L53e3QFrYmJGPpfZtMT5Oj9w3DceU8ijjS6oHMBn65XARgxyz2v
         Oehv0ImjPJI4P1m7vLphUaqUgES73BANW6f1LxR6cp3OXObVwcQ9JthoYg18Xf3anJtN
         HEtA==
X-Forwarded-Encrypted: i=1; AJvYcCUjEgP+44RoZuT/mitlmYQOqNVsW5+BimTUnhxZuxdY+GCt1oWEVD/FBn5kb2iz/a0muxNHgy7411jX9X+K@vger.kernel.org
X-Gm-Message-State: AOJu0YwdU++NlsZZ9/CswgrdsI3NvrZa5jaG2rJx+vt86Ngg5TTaOVVT
	74j9yIkQu/+BXH1OE+NS5dSZYD8Dx8Y/4QWfFlLCN2pXL+zh22fQTHd/jyRr9WU=
X-Google-Smtp-Source: AGHT+IEbUswTlTIXY9IFqrPyLxkDRDlQG32Uf8DYiNRcFcDxuqbhWX0zczTUJWneGpA3Bu0lLOXdbQ==
X-Received: by 2002:a5d:6783:0:b0:369:9358:4634 with SMTP id ffacd0b85a97d-374bcea7a66mr11693722f8f.19.1725545615753;
        Thu, 05 Sep 2024 07:13:35 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:4763:343b:23f3:f45])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3749ef81146sm19514621f8f.82.2024.09.05.07.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 07:13:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 05 Sep 2024 16:12:55 +0200
Subject: [PATCH 04/13] ALSA: hdsp: drop SNDRV_PCM_RATE_KNOT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240905-alsa-12-24-128-v1-4-8371948d3921@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2330; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=KOHw3cK09GmDelIdzy0PFMcoAWRfmYIV3CJePnQGlsA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm2byAGCtXNMv4zmeK8xaUD9ydPbkZKpBUTd6RJ
 QmFXFNp3uWJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZtm8gAAKCRDm/A8cN/La
 hf1yD/4484C6jyc9McqeqL7Zucii06qG7GJ75NozKsnq8MPLDo2S3U55W/KesC1pT/XlYmui5O2
 WyYY+W88+0wV/3Gf+vCvsKfG+47ttqBGTLd6i3DriWETBgKOplOzy7khdZt4qQl2lq3QvlwQY2O
 fMR3FwzCuob0a5AOZY064ZlG+tdaJCjX7kN0tibF6v8V376AVcK4EG1m42WWkyr3mzoBUXnDE/S
 G3VCsaOynVmaj+A7RhefYy8/Jp5hk5a7NzccvkAdi+46WNv2yHTiQ+NhfBOyFmA4mQy32kk4QQU
 zsKwfVv37g2Vu0n32++cIo+WbjO1LU97hg/G8TxAfmhZHCoYPJsnCvtsl5Kye8lS1gzZNl8391E
 plrRXUEa3Rjr5eU6AUpm7MUjJY9wt2tlPO1nqhQL3boLXlIXSf2HYD3RIk/ou94L0ko+cVdTOQp
 Ve+Cd9BUZfApUzijH1AbFiW340rwalm0TjEGfFakod+mh2pUnN7Oj3IWsIT8tMUm5sG7noniinD
 SYXScq21wOtzJy6vEva0I7MtUT8lH0/Jd+rPRyPZTWn8GdbwM4VFxuJ2szOfhP5Low0NGD6kfmf
 UmizqtBtrmrhX+O5yCwyDWK7hheosHrjYGIDBHYhs/oDB5vK0EVwRxwTeYpaGWrbJIHVxsu0lC5
 yLro4DIal4JBB4Q==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The custom rate constraint list was necessary to support 128kHz.
This rate is now available through SNDRV_PCM_RATE_128000.

Use it and drop the custom rate constraint rule.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/pci/rme9652/hdsp.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 713ca262a0e9..1c504a591948 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -4301,14 +4301,6 @@ static const struct snd_pcm_hw_constraint_list hdsp_hw_constraints_period_sizes
 	.mask = 0
 };
 
-static const unsigned int hdsp_9632_sample_rates[] = { 32000, 44100, 48000, 64000, 88200, 96000, 128000, 176400, 192000 };
-
-static const struct snd_pcm_hw_constraint_list hdsp_hw_constraints_9632_sample_rates = {
-	.count = ARRAY_SIZE(hdsp_9632_sample_rates),
-	.list = hdsp_9632_sample_rates,
-	.mask = 0
-};
-
 static int snd_hdsp_hw_rule_in_channels(struct snd_pcm_hw_params *params,
 					struct snd_pcm_hw_rule *rule)
 {
@@ -4499,8 +4491,9 @@ static int snd_hdsp_playback_open(struct snd_pcm_substream *substream)
 		runtime->hw.rate_min = runtime->hw.rate_max = hdsp->system_sample_rate;
 	} else if (hdsp->io_type == H9632) {
 		runtime->hw.rate_max = 192000;
-		runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
-		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hdsp_hw_constraints_9632_sample_rates);
+		runtime->hw.rates |= (SNDRV_PCM_RATE_128000 |
+				      SNDRV_PCM_RATE_176400 |
+				      SNDRV_PCM_RATE_192000);
 	}
 	if (hdsp->io_type == H9632) {
 		runtime->hw.channels_min = hdsp->qs_out_channels;
@@ -4575,8 +4568,9 @@ static int snd_hdsp_capture_open(struct snd_pcm_substream *substream)
 		runtime->hw.channels_min = hdsp->qs_in_channels;
 		runtime->hw.channels_max = hdsp->ss_in_channels;
 		runtime->hw.rate_max = 192000;
-		runtime->hw.rates = SNDRV_PCM_RATE_KNOT;
-		snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, &hdsp_hw_constraints_9632_sample_rates);
+		runtime->hw.rates |= (SNDRV_PCM_RATE_128000 |
+				      SNDRV_PCM_RATE_176400 |
+				      SNDRV_PCM_RATE_192000);
 	}
 	snd_pcm_hw_rule_add(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
 			     snd_hdsp_hw_rule_in_channels, hdsp,

-- 
2.45.2


