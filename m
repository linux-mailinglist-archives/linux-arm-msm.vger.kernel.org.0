Return-Path: <linux-arm-msm+bounces-53099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F29A3A7A30C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 14:43:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59D8F1895EA0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 12:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749DA24E4A3;
	Thu,  3 Apr 2025 12:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uuUdfwDM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DBB24DFFA
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 12:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684184; cv=none; b=ERizED5wNCtCrIMsikJDh2HIU4xkjNlV318cn1p8Q74NU3QOrkRvK+T+Ck0ymNgmvcjJwi+awlnjuyw86C8MXuZTg0VP0X3gT21xdj7FzyFRu01x2UD7GLIEAp0I/nzc9Kqh0Q8URYorYH3z62cY81iZ7M6aOzqw0nmh690UYgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684184; c=relaxed/simple;
	bh=sb2QRnB7188NOtda5DPHBASrexKmkSX9VEuesDDtB+M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DnQyPFMiMrk6770YsXjRK3x7bPCtudF0i2Yh35xEmaywB7w8WPmAPy7zyURFH7ma8NN/ztFIwQ4uvujkPhkloqxp1FGJs2QmoxsZY256SXtCC/RmAVVuiGEROdeRcQ/p/No8Y0/gweAsqs8850QSNzjJH1CZwYQnm/AXpC9k1QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uuUdfwDM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so5338335e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 05:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743684180; x=1744288980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2gzGEzgiKIa4EMF6KQg0t5+kh4IPdUUyGlnfc/EwEw=;
        b=uuUdfwDMWKADYPr6aBZDzW3ukiuKhdz/AoR2O2HkWY0WBxV2FWYAaQQJdsR0ZwvuDG
         tKBKbuBsHjIbYAaKlSq1hx4nxfpVQemL3ZCAzUiPw92zwqI5vPnWtm3N+2qkmqJH7wbA
         D0bFQBbBbcbMJlatV8xv4r1CzRnDY2oOP054TDP3tYkfG2bMb9lZ0rDe+w5S+QbDDI1v
         xZntQCEHIcHKkcnZIVUZCoxZzK/KymKE+UESvZV52oF/ZtwzkWn/HbWfQINUvg3Z3D1q
         mCCqku6yhH0aA7P7q0q9RrU1maCoWdpIrK+LC3sfJYQQhMP8n9ACWdqmz69GOx062YQe
         5kww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743684180; x=1744288980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2gzGEzgiKIa4EMF6KQg0t5+kh4IPdUUyGlnfc/EwEw=;
        b=HMWP8QKI2eVL1DcaJ1Ba4J1i13qD8btTwFM7UaVkQopAQGY8kogNWPYhuyy4BCjXSi
         fF6m9HvA6WsG0oEjKT2ROADKMO3c/IYDKFEusuzy6YDDj4FktDC/GBwmrgtCEsIhOP1X
         ZCmVJao1CUX1kdFQ8LNKH+Mt+25g15swanJ0efKpqgtbBfphQA+4O/AsHs0uyYLGpOsM
         R2/E9pA1Z/tHK3Z3XiQelcjVyFn4vtQmDDoikrYWjpaLMRzIgesICchc/AwdpCODRImS
         5NAeMYE0lhlges6GvxmnE53n4Fm/fqp70vAM+5FVMgOabGJI0cG4dHVQAUFWusDdRKrU
         G2cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpPp7shoNPpXKcsDztvF2UGNLetj4anO0WbXPS3+JcEyEAtF7TRIiL/Dq8L32xfGvGODU+ZoLPln5DkIvB@vger.kernel.org
X-Gm-Message-State: AOJu0YwGhVdEMW3xUPdN9HQAaGsq3fidH4h7FZ4ABgFv4w65PmcG1qQO
	n9JiUnPhg8/lr/Uc6tUmjZOYA0AAY47zorGXVdKOZGap9PtuoNWzFtsAXa+Mt1c=
X-Gm-Gg: ASbGncuVWdV6Qu4AELvn4e3uz/td6bMnWSWI2w2rK4t59b0EFimf8wJQoJsQfBuzKcU
	JvVHrTeW0jcODuS5Ued76Q1q55XXM+Ta7ReDct0Vaw0CUcssa0g23SkTtLDcktwpoA6eWtXJ2E4
	OfLDiYyj4E6x7z+SYWU4GvDC/e1CD0S8wAoWbY41m95J/2xTkuaLno9JBggDjoKQwSCwRKk1q4r
	QvnbkOkJtMMITuk2M855DZNiH0duBisIK7ebalelFT8JO1ov7fM1fFZuO33oh6NHw9ecSrQLIrC
	nD6uJqo9y2X7MMua8ok7m/c050KWLOJtrudPeG7C5f/KiDLcJ6G2x+tgZQFcHCwK+KRdpj1h7bX
	5d4cV
X-Google-Smtp-Source: AGHT+IEbPg8+OB+t29rOtNL2QkkFRiJ5r3Z4JpZaekYA6Sh1gaBggQto/hs6PTOfMoriK53k96kgHg==
X-Received: by 2002:a05:6000:4023:b0:39c:119f:27c4 with SMTP id ffacd0b85a97d-39c29767c83mr5503332f8f.30.1743684180601;
        Thu, 03 Apr 2025 05:43:00 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34a7615sm17312505e9.9.2025.04.03.05.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:42:59 -0700 (PDT)
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
	stable@vger.kernel.org,
	Manikantan R <quic_manrav@quicinc.com>
Subject: [PATCH v3 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels
Date: Thu,  3 Apr 2025 13:42:47 +0100
Message-Id: <20250403124247.7313-3-srinivas.kandagatla@linaro.org>
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

Existing code only configures one of WSA_MACRO_TX0 or WSA_MACRO_TX1
paths eventhough we enable both of them. Fix this bug by adding proper
checks and rearranging some of the common code to able to allow setting
both TX0 and TX1 paths

Without this patch only one channel gets enabled in VI path instead of 2
channels. End result would be 1 channel recording instead of 2.

Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
Cc: stable@vger.kernel.org
Co-developed-by: Manikantan R <quic_manrav@quicinc.com>
Signed-off-by: Manikantan R <quic_manrav@quicinc.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 112 +++++++++++++++++------------
 1 file changed, 68 insertions(+), 44 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index ac119847bc22..c9e7f185f2bc 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1469,46 +1469,11 @@ static int wsa_macro_mclk_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
-					struct snd_kcontrol *kcontrol,
-					int event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
-	u32 tx_reg0, tx_reg1;
-	u32 rate_val;
 
-	switch (wsa->pcm_rate_vi) {
-	case 8000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
-		break;
-	case 16000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_16K;
-		break;
-	case 24000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_24K;
-		break;
-	case 32000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_32K;
-		break;
-	case 48000:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_48K;
-		break;
-	default:
-		rate_val = CDC_WSA_TX_SPKR_PROT_PCM_RATE_8K;
-		break;
-	}
-
-	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
-		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
-		tx_reg1 = CDC_WSA_TX1_SPKR_PROT_PATH_CTL;
-	} else if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
-		tx_reg0 = CDC_WSA_TX2_SPKR_PROT_PATH_CTL;
-		tx_reg1 = CDC_WSA_TX3_SPKR_PROT_PATH_CTL;
-	}
-
-	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
+static void wsa_macro_enable_disable_vi_sense(struct snd_soc_component *component, bool enable,
+						u32 tx_reg0, u32 tx_reg1, u32 val)
+{
+	if (enable) {
 		/* Enable V&I sensing */
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
@@ -1518,10 +1483,10 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      rate_val);
+					      val);
 		snd_soc_component_update_bits(component, tx_reg1,
 					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      rate_val);
+					      val);
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
 					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
@@ -1534,9 +1499,7 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component, tx_reg1,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
 					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
-		break;
-	case SND_SOC_DAPM_POST_PMD:
-		/* Disable V&I sensing */
+	} else {
 		snd_soc_component_update_bits(component, tx_reg0,
 					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
 					      CDC_WSA_TX_SPKR_PROT_RESET);
@@ -1549,6 +1512,67 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 		snd_soc_component_update_bits(component, tx_reg1,
 					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
 					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
+	}
+}
+
+static void wsa_macro_enable_disable_vi_feedback(struct snd_soc_component *component,
+						 bool enable, u32 rate)
+{
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+	u32 tx_reg0, tx_reg1;
+
+	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
+		tx_reg1 = CDC_WSA_TX1_SPKR_PROT_PATH_CTL;
+		wsa_macro_enable_disable_vi_sense(component, enable, tx_reg0, tx_reg1, rate);
+	}
+
+	if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
+		tx_reg0 = CDC_WSA_TX2_SPKR_PROT_PATH_CTL;
+		tx_reg1 = CDC_WSA_TX3_SPKR_PROT_PATH_CTL;
+		wsa_macro_enable_disable_vi_sense(component, enable, tx_reg0, tx_reg1, rate);
+
+	}
+
+}
+
+static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
+					struct snd_kcontrol *kcontrol,
+					int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
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
+
+	switch (event) {
+	case SND_SOC_DAPM_POST_PMU:
+		/* Enable V&I sensing */
+		wsa_macro_enable_disable_vi_feedback(component, true, rate_val);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		/* Disable V&I sensing */
+		wsa_macro_enable_disable_vi_feedback(component, false, rate_val);
 		break;
 	}
 
-- 
2.39.5


