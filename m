Return-Path: <linux-arm-msm+bounces-53098-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B4AA7A30A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 14:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5011E1892411
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 12:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FFCB24E008;
	Thu,  3 Apr 2025 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vbG62oQW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBE635942
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 12:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684183; cv=none; b=KZYxhG3O2YLbkNIMoFDN13LfdUlZeBcVfNLUNYPOYbQ7KgdPSosINzEi33NgKVIAvnmRtbpgtBfJuRdVAYWk+wxp4WPd8PI0vUjDjeVZYmwzDgqxMkoUJ0GQTiQifLgHtvmFCVs89v8/q0xRgwdRwCj7Xlv1S1esMhNiuyFDjsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684183; c=relaxed/simple;
	bh=D3YRzj3mCAmvwT1dNDp/XxMgwKsjJtdp0ijI+8PtraA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EAvgSms56YehIfCx5GKrSw/HnzseyXvuYGxKUKdbE7MS2Bo+NrKxOmypk1Z6FE+OlRAEez5moPyqhHbTaJmvpyrRMPbRu3zeEjvszFnuNP7CwyuQ0eU/QnyndyYXkImLw1tU2ic47jak1YqyOx497lBQQHRFmjpKre2wzc5ue/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vbG62oQW; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0dfba946so548090f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 05:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743684179; x=1744288979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8Lmy7xC4akxbC/rSRpm6p7I4pTGlGcGr5of77/sByw=;
        b=vbG62oQWlblgZWd4xgjQtNUMurIWjhC/katsMMcEcC1xnBLmgEOdUFS3U0X6n/i2M+
         k8Rdw0Id3N7hv6abG/HQlf19iohMIEZitGvv85XSYjUvam3DRPSLUEKyHd19iuPPNs0l
         u19/6eSu+A2n6qF9NC/BrY2ZtrXJiuiAXt8Za0yZLUSQhWHvDEyHVXQdk/ANabsh7Qi1
         KJ9jYJQxyRWwkwnF8280jXqjflnaza5HSjaI5almeZlj4lhCIYuX1ufbG1xP2JsTllcf
         R+1rUhYT817Tpx3ONKMOLVcq56HfX420ydO+VSCv8DtiYpXShnz52BNCNWAJPInGjYMC
         bgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743684179; x=1744288979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8Lmy7xC4akxbC/rSRpm6p7I4pTGlGcGr5of77/sByw=;
        b=cZL5R/EowXR4FnwxQaDJNmZusiNWQf4nCJqt5pLrs4zKeWRCGPgl0hIy2NB1es6RWT
         apzfYxWRgCp1dnWPjWFoJcwa1b+MDvEoOOnBbyeq/s/CI3rbnhOu6oXifcdRK82FfOvQ
         IETnF4B2uepKryvEEGuxqCKDTZr9qEC8kSNF6Sncu6bG4le6SUA00eDiRVK+UE501Y57
         I+8pD5V0S8Pf5ric+6c6/9NMwHAdlsGetLvssJiRX8vRcy7IYde9NUZqV0WotiZYDT1K
         jq1L2IpLGOGEX/2SdyflpXj/xJ0YfALeoaKjlsMXMLFgCSGCvbpZCqOQWS8HmMeE+B0r
         xkog==
X-Forwarded-Encrypted: i=1; AJvYcCX3ZUgMREsd/WyHjKyBXNCLyzaU4eKWZUbQFLGEJ13w94nMuFJpOa2u85tgtXCBp+gWo0F6qTYeSA7qHnqP@vger.kernel.org
X-Gm-Message-State: AOJu0YwdT05gz7BLV2DcZ9aPcouShK3R0cbg8fsmmPG1YFAYUQqO/n3+
	4HxYx2+aId1G4sA7w8Esj30huNFJkFWYU8S4vhqFXYIBIrC4lv/pPhR71XTW/Gs=
X-Gm-Gg: ASbGncsyCnINBYWEMMf8Qzn1AszgQmpykhdDwIiyXDGI7cu+DEkRxRrvgWZ9CAuYrzY
	eAC3ei+nkIXDnrvFYsPZ05hGAr9J6PZ3MxyPO65+v7pRaSLfF544yyaMlNBg96Wih1QFMpczJ+9
	dq7UlDcqzat0Mr9KS9J6kaD8k8T1gPdVDfZVSyPSTUX6vsp2oX61CagtaQxPvGUEfE8olf4tpL9
	sLClct9kDlG/c5sJWkXxZZfuEbjXuO+0eYUxyESJdfHqd/yvz6Qop5HwGN9sMuugvTQz9aYT73w
	ddv638ylB3ZseE1ev0NeMeO+D9Cz8EgZfiwkQrdvrYOTieMibbtAP77XOIhG7vz2dMcAtQ==
X-Google-Smtp-Source: AGHT+IGE6xylVZSZ796+4B1DhKJi0ahGSGLaNKAnwgsZ5gCFYnuPC7oaNBPI8qkRDECC2cthkSTB+g==
X-Received: by 2002:a05:6000:144b:b0:39a:ca0c:fb0c with SMTP id ffacd0b85a97d-39c2f8e1369mr2190659f8f.28.1743684179389;
        Thu, 03 Apr 2025 05:42:59 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a7615sm17312505e9.9.2025.04.03.05.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:42:58 -0700 (PDT)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: codecs:lpass-wsa-macro: Fix vi feedback rate
Date: Thu,  3 Apr 2025 13:42:46 +0100
Message-Id: <20250403124247.7313-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403124247.7313-1-srinivas.kandagatla@linaro.org>
References: <20250403124247.7313-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Currently the VI feedback rate is set to fixed 8K, fix this by getting
the correct rate from params_rate.

Without this patch incorrect rate will be set on the VI feedback
recording resulting in rate miss match and audio artifacts.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Cc: stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 39 +++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index c989d82d1d3c..ac119847bc22 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -63,6 +63,10 @@
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
@@ -407,6 +411,7 @@ struct wsa_macro {
 	int ear_spkr_gain;
 	int spkr_gain_offset;
 	int spkr_mode;
+	u32 pcm_rate_vi;
 	int is_softclip_on[WSA_MACRO_SOFTCLIP_MAX];
 	int softclip_clk_users[WSA_MACRO_SOFTCLIP_MAX];
 	struct regmap *regmap;
@@ -1280,6 +1285,7 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
 	int ret;
 
 	switch (substream->stream) {
@@ -1291,6 +1297,11 @@ static int wsa_macro_hw_params(struct snd_pcm_substream *substream,
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
@@ -1465,6 +1476,28 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
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
@@ -1476,7 +1509,7 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-			/* Enable V&I sensing */
+		/* Enable V&I sensing */
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
@@ -1485,10 +1518,10 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
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
2.39.5


