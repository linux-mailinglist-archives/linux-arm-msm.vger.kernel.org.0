Return-Path: <linux-arm-msm+bounces-23060-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B6D90D38D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 16:07:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 788F71F25B16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 14:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6002F1591F8;
	Tue, 18 Jun 2024 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MNPzUz2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9259F13CF9C
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718718562; cv=none; b=qNM4DlB/8lBcRgLl3Ib1F1HAVvRTKjEEvbAt4aFZS2i0GBm11UcLpgcIgyyQjtPo4jJBryg3n05ATxmLoOXuay8pl5v1NLNUlQH8RRxHxWCgYkpy1nxQbvxeH8uxfnsHmTWGBV651wwfFzTgVBOVS6Vo6K/Bt/uYG9PxgtdhRQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718718562; c=relaxed/simple;
	bh=XbOLlOWlwcD1EYYwvE5qAsvZWmsWuvVl0dXINENlJqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CFJRE1zjfA0L7aQJffETOoDlpkDOPwxh5HDhE7uiSklYPqHD0uSBLJmm8hnwPFvGzHsGTIxIx+9l4t9lLfF/i3pOwhT9MyBfXDwmYVBWHJkJFtlRVHN75FyITuCZQloMJNP28AyVxmKMQEM7TZjHMu6UH0Q+EiXqoP94jUUh1I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MNPzUz2a; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57cfe600cbeso750428a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718718559; x=1719323359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mT8eUKe7uKBDcnOx0sNjTt1FDPm4Rm6266oWd39xCYo=;
        b=MNPzUz2aT2CbuIyWLUz7w0j2uT+lDGVvmWiFmLy+Aq+yh/JnOOQ6i8EXPAM4TDpPOd
         IZesRgE7ww9k6hzWTSDfdEiddvt8376/nWTXzNDeLj32QC84KEICRZ7f4o/XUj66hka3
         8CskHoRbItVinso1AtJvUEUvIACV3j2RRJf99TtF3BNXmedCPhQtc6bEV+5AirpFE9cO
         7mOAVdDQlD6iQVA4qVyYviYNL8Ivh2exuv03/8mAHEKVW4dkZFj7qGoDTYHudxMmWfum
         EcN9NYGfLIyZjPv54CL8AnqkK1QYHcfpwAu6R0DWWgvpVYi+4MwBda2yNQ0CD9UP4MN6
         mi8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718718559; x=1719323359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mT8eUKe7uKBDcnOx0sNjTt1FDPm4Rm6266oWd39xCYo=;
        b=MgbM+1KrZkOKmsc9rIihoGoO4gmai2uNQ8HLu7QBI9JoTrqAwuz9puRGjWd6J55xla
         sHIYbsTRGPag059f1mMPTQXTYseCCMvd7cy8PTs+PJiPzNj61A4pNR1gdFOt8u9+zmE9
         XoRwieWHHlTcV6+2Kohi8U07EUqeAeRA3mHdcNeK86r/sKyjLazijN6Wmvylx9ARmXc4
         5n4Tdhy0N999Jg97b9zHxnczHovtacqOuZaf51hCWby+A7XGVvlqw6LFWAMUIn2OEzYa
         E5HeVJmjs5vzAC2G+eFk0DR1gv4hs77mYUUpfMYGGc+OdjysN2Vhit7/rbD3zedz8Jbe
         ULJg==
X-Forwarded-Encrypted: i=1; AJvYcCVNikS/x6DPTrKpXD/7monTceobKbjaqIsQxiA0AzBMCqMQJ8LXmJ6MQqswo6R8DYLPiDG3qWUQvQgY1SDF/NdYqoTt1i2PBqKZufae6Q==
X-Gm-Message-State: AOJu0YwOPI94nWO2rhPTJ7Ve3Ru74mxlSurs8vP6MD0k9pyKNcBlh0k8
	kbyhTvRAPuw5z5jHljqLU801kCtTLWvmRFzZnxBZbcDSJ3Jp7AGFu5z+mKwYg44=
X-Google-Smtp-Source: AGHT+IHT9mgFIP4gnreH1Y2uJj9kPskt5MMHqGXeZ9KFWYTuiCUeGqK0leKSOhfBMrPQANcKRdxP7Q==
X-Received: by 2002:a05:6402:2881:b0:57d:c8:d295 with SMTP id 4fb4d7f45d1cf-57d00c9385fmr771440a12.4.1718718558796;
        Tue, 18 Jun 2024 06:49:18 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cbdfe1428sm6678397a12.27.2024.06.18.06.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 06:49:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Tue, 18 Jun 2024 14:49:00 +0100
Subject: [PATCH 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240618-lpass-wsa-vi-v1-1-416a6f162c81@linaro.org>
References: <20240618-lpass-wsa-vi-v1-0-416a6f162c81@linaro.org>
In-Reply-To: <20240618-lpass-wsa-vi-v1-0-416a6f162c81@linaro.org>
To: Banajit Goswami <bgoswami@quicinc.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3487;
 i=srinivas.kandagatla@linaro.org; h=from:subject:message-id;
 bh=XbOLlOWlwcD1EYYwvE5qAsvZWmsWuvVl0dXINENlJqE=;
 b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBmcZBc9D7yd3a5UzFrmBLYPMBR3Ul/av8RYu1jp
 AzNLuv0aYGJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZnGQXAAKCRB6of1ZxzRV
 N1oBB/9ZFw/xEXGQ83UmQrU2jJQjhaofE3cC2STGIKGSKk+FJThNkXePz/nsaUlq+jS3SkPejGx
 ezNvz9MKSAClo2teAXL++zyAVx3vj/V27DkNGBAo9XshdHCl75B3dvtCRqd55US4Hs+OuKY9SQT
 HnWhy2NzMhFK4knArLNnhoIzZe/hijWhfigU1bPD6rJsKZldekk6nryqs/0J+kK7kUrEzi6l5Mq
 LIL97KGRCVc+nazheV3t9wOusLYmEs+4Za+/0+o1UgjB02kSkaatAcZ1hPgmGDSk1TZUzCEgLMl
 +PGrImS171EIMWVKgqdYQzo99POMH/JANZIqv0fKZhj8cP4T
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp;
 fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6

Currently the VI feedback rate is set to fixed 8K, fix this by getting
the correct rate from params_rate.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 6ce309980cd1..7b6d495ef596 100644
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
@@ -986,6 +992,10 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 			return ret;
 		}
 		break;
+	case SNDRV_PCM_STREAM_CAPTURE:
+		if (dai->id == WSA_MACRO_AIF_VI)
+			wsa->pcm_rate_vi = params_rate(params);
+
 	default:
 		break;
 	}
@@ -1159,6 +1169,28 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
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
@@ -1179,10 +1211,10 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
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


