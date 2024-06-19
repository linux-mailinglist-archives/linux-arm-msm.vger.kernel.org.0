Return-Path: <linux-arm-msm+bounces-23215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AAC90EF3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 15:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65DD728238C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 13:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F66014F9D0;
	Wed, 19 Jun 2024 13:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DGnLshL5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD4714EC7F
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 13:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718804532; cv=none; b=ED12rHn/88I4c9qno7B2ewyXueH893jxgYu+iYz638N0K03oB1PvhyE8VabOxz8iM5pFycz354HI7IKcxih7fgmaLN0CEjDkiaZd2hoeaZIXwy4jjzTI843IoZCfZHQCxWaTo1GMkPWVebL3JfRHNWPbDa281GFItmFIdQ6d+mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718804532; c=relaxed/simple;
	bh=k9yry0x1tI/DYruAhQA7fXL7Cnn7I6rwM4/ndUzrwrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQvblu8gkrnXI5TDEQvZhXbhzCJTXUiFkOL2mlHtSdV2l5wdMjCVSGJ338/lAAhh8KaFA5xoTzIT7klP3C3v+wbVfvmCSVrNWOb2z9Zs2ZcxENCyuowOgeNDAgJASwVVGu68gUxUaMhKmxhIpb3b1ZLYKRFuUTCJ+FX4TKHufUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DGnLshL5; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52cccd44570so656999e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 06:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718804527; x=1719409327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yqG7W4vsUEFDpItqcWYue/XYKARV+F1uUdRAmQJH5WU=;
        b=DGnLshL5+Q2GI2QWHukQp+8MA2v1e2GmzyLahqteSWwPEhm4hZB62sEvhU50A7qmDU
         MVT3PcwWaRTkYMGIIwzNKXCNB8csw3TPYIyDjXjLlpKG/gfbT6kgi8hel88N4eG1twh0
         QXzL9L5iNm03pz7QzpLkz1qz0Nl/BuxZi6UXBgG5Pf+0EF6tQFQvl+EGwMnmiq0qC7BV
         nNZj7mLNCem84eS14K9JQNTz+DQVj5Ve59TiSNzcE7O/GKyuxx9ikLENQBnbT9qLywZk
         x95QE1c9mf7PETgo6uG0wlLnGxoeD8UzeO3wEW2BZjPubnyksuFsiuzOh4b/JnZ0/wun
         gcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718804527; x=1719409327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yqG7W4vsUEFDpItqcWYue/XYKARV+F1uUdRAmQJH5WU=;
        b=DFC1OSSp0xlvUZNIEQaz6RvREBk/fQeQE3ZXmO+xAKoEEjnv+fB0xdmEnEwB7/ETGS
         5HMSCHG/1w71jROhYmvQfGfyKK0Tjr4ACy+K3ed9BXfSapyn6sOj0YDsYQPyqFPWYYPD
         sGQJoaJI4Zg76AE7yVZrH+Pnz25sTAMAJ5xwNeBrbxgG1qQc7weJdBTs7bRE2wR4Phg4
         l6XTqwLil1Hdy/YJieTNMDhG6C0DJTsgiB+Vdjaf2NfpSCsu6hnUcUy2MxVWfAP9fjZJ
         OE75gX5zcP67xHG9LKHQFxazEb05VrL7kVmetwusiu4rnnLYAqieYZBXgXPDNu2k80uv
         +Pwg==
X-Forwarded-Encrypted: i=1; AJvYcCWmaYCyChjH2RC9k/vzeRIkpCFvKotT+ZxpJEYp3Ugfl62K/FyeLc2qso8nMejm8h/+w64Vj8CHf+NPjTF+3DwhmCYUPOhUg9Sv0fytUw==
X-Gm-Message-State: AOJu0YxdzQRv/ZwzPzRKR3YdroNgt329iwEGLU2hEwqZjGDxr6GngPhe
	ReFmLcuags3N0Lr+lFT1lBGTy63qEEKZVRQCbKqrn02pQ8cps/8k3BxG7EBfQJk=
X-Google-Smtp-Source: AGHT+IG0QObZ8D+w+vfiFfGk4A3wWZ/+yy902ax8lcbmkRjM6EjVLp3sZqUq/XmJ+Tbwt9b/SL9u1A==
X-Received: by 2002:a05:6512:33c9:b0:52c:8a4e:f4bf with SMTP id 2adb3069b0e04-52ccaa98d21mr1608954e87.51.1718804525621;
        Wed, 19 Jun 2024 06:42:05 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4229c60f758sm251639505e9.20.2024.06.19.06.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 06:42:04 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Wed, 19 Jun 2024 14:42:00 +0100
Subject: [PATCH v2 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240619-lpass-wsa-vi-v2-1-7aff3f97a490@linaro.org>
References: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
In-Reply-To: <20240619-lpass-wsa-vi-v2-0-7aff3f97a490@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3882;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=k9yry0x1tI/DYruAhQA7fXL7Cnn7I6rwM4/ndUzrwrY=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcuArTnuTeqCt7QYNfZuRWG2mF/M+R4MypmoAM
 Jb+3llU/MWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnLgKwAKCRB6of1ZxzRV
 N5N9B/42MjFdIVdRluns1Wk5nB11XhbXa0yUC0tzwsZmpRIeqgWVGY7O4ucCA+OXMrek8yaLA2W
 H2F6fALzPvxVkgbEAZRfLo1Rb2GYd/RIGk0ZS5aPNxGtcUlPy4D72oqeZEkQJF7due68f0xIUi5
 ZYlxXPwqWERVLh4LtWmIh5RyabRk+z87b/HgmDSilGhsNGuUvaAoMpbY6VowJfALSLoxvLsObdC
 cUETwLGzZrYn8wge5SoRTl8iefYWfFVNVvp5kK1JCbdrVube6FfYtGFibfUhpbnXgCcq4CrVIsY
 1U94s56FIaaMfgKAA3yzcfeXX1EH5iFnF6WiYjQ21wUkXL6a
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Currently the VI feedback rate is set to fixed 8K, fix this by getting
the correct rate from params_rate.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 39 +++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6ce309980cd1..ec9f0b5d6778 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -66,6 +66,10 @@
 #define CDC_WSA_TX_SPKR_PROT_CLK_DISABLE	0
 #define CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK	GENMASK(3, 0)
 #define CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K	0
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K	1
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K	2
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K	3
+#define CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K	4
 #define CDC_WSA_TX0_SPKR_PROT_PATH_CFG0		(0x0248)
 #define CDC_WSA_TX1_SPKR_PROT_PATH_CTL		(0x0264)
 #define CDC_WSA_TX1_SPKR_PROT_PATH_CFG0		(0x0268)
@@ -347,6 +351,7 @@ struct wsa_macro {
 	int ear_spkr_gain;
 	int spkr_gain_offset;
 	int spkr_mode;
+	u32 pcm_rate_vi;
 	int is_softclip_on[WSA_MACRO_SOFTCLIP_MAX];
 	int softclip_clk_users[WSA_MACRO_SOFTCLIP_MAX];
 	struct regmap *regmap;
@@ -974,6 +979,7 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	int ret;
 
 	switch (substream->stream) {
@@ -985,6 +991,11 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 				__func__, params_rate(params));
 			return ret;
 		}
+		break;
+	case SNDRV_PCM_STREAM_CAPTURE:
+		if (dai->id == WSA_MACRO_AIF_VI)
+			wsa->pcm_rate_vi = params_rate(params);
+
 		break;
 	default:
 		break;
@@ -1159,6 +1170,28 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	u32 tx_reg0, tx_reg1;
+	u32 rate_val;
+
+	switch (wsa->pcm_rate_vi) {
+	case 8000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
+		break;
+	case 16000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K;
+		break;
+	case 24000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K;
+		break;
+	case 32000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K;
+		break;
+	case 48000:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K;
+		break;
+	default:
+		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
+		break;
+	}
 
 	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
 		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
@@ -1170,7 +1203,7 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-			/* Enable V&I sensing */
+		/* Enable V&I sensing */
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
@@ -1179,10 +1212,10 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K);
+					      rate_val);
 		snd_soc_component_update_bits(component, tx_reg1,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K);
+					      rate_val);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
 					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);

-- 
2.25.1


