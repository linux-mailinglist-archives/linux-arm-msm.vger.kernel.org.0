Return-Path: <linux-arm-msm+bounces-53123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17657A7A77E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 18:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C11B317674D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 16:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7680E2512F0;
	Thu,  3 Apr 2025 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kZFKbnLb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9581A257D
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Apr 2025 16:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743696160; cv=none; b=e0rAllA6tKMMBc5r/gSyq555RO8LGriQqBpqbD6Pt5J3SLdH4is2RMT9r2QwXV1XyVRp1degZmX0WqhUnP5J2TYR14n8FDrHWsWiH3TUUE+H0jD1O8dQxJFrmkGO9x+C+tjWaBnQ2+RE0xPpPalfqa1Op7bb1n0zhfbBy9oVef0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743696160; c=relaxed/simple;
	bh=0LYOYslFbH1/SZya9PF9YDkFKbrt6hIeHk7ECB0LUD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=usl5mxeQTS1VyCIQaasOi7XeocfuVOwJ9rRx3NvoM8Dj3wEtPJqgggJY4NLOefSTcoioRjphkQ3rt760DtDsNKhIkA+ja0FVfUFvjNIguoxNcmZqLHwGXhluNzleXhpzILhMf4xgrf3tm6k6j7TauFa1GOu2yTWuH7jS9u3ie8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kZFKbnLb; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso10891175e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Apr 2025 09:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743696156; x=1744300956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEBC5GQl7j0rLVreom+CHyGDEsGtYBc9XRQ5JiiuDd8=;
        b=kZFKbnLbZCZ11HUIvRb9xkAO1FvdnAner4KmhmP0P6qwedngkQGJ3syNZEPF54sGry
         5gNacc40Olgty4q7YP/3XIv2MM2krFgZgwYoV+smjxGtP4NQ55H3vwAyEHmu/jdGQSbA
         q3EAHlAKPTcOTYS49IazY4CrPhmRRBAiQLdfnvfbW/HPlsTMMsoTG2s3QCSE6KaXwKTk
         N+AOv61DL75IK9Iqt25DQmr18SGBhsy4jx0qE626afR2gkMgmDo0L5ZNd2mmm9z7ztmh
         SUKyqxWoIZqD9CTl8ftk3NJ3AnYa9osaPoYQg4rti8HyPbSTHuIcqEbNgQPIwx+kWCk9
         MuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696156; x=1744300956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEBC5GQl7j0rLVreom+CHyGDEsGtYBc9XRQ5JiiuDd8=;
        b=rvYFDGIQGcGHA/JBLaUDRajIJMW0s45RrISrdTA6f22RF8N+if0KIAVJusU5t3DGpu
         9i4SPeNsHXyLD336EAMtdwn5vXeUhaOPJ0zo+g9+az3rHrOa82KxMBvG//Jn3TduLYnA
         0SDgc0ZHbiMAjb4RZbWDprifqhlflf+zs39S+eN8I8KFL4l36So0nK8bODKgaWZHhXX8
         t0Jj2Rr0ab2qOXK/pgnSwtFrGvaOFHW77XHLJltE109LNu4ctgbM9yfDv0Ep5dwyGwOF
         1PWxqBrx2tMYajJaoGzu6Fj1uGvZpFmg54IpmSfTyUsKDRvL0TaLx5TtUQltjld8U2HI
         MxCw==
X-Forwarded-Encrypted: i=1; AJvYcCXZluTGsQm2PE/K2ZInCWbtKD++K1hboZXr0sTZYNzDsgHDZMkEEztEmnVe733f+VZGAamuD7/0unEqSH5B@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9NJr0pXT+D5B5Q8jWPuZHvJ6OAzc/pbaK7p3YoXl0+l89t/Vy
	S2NnuP9kh6VnICvQptijmcyMuRGOViu3cKh/+FBzkwv4sgIQAx55wQ2XvdSeg3Y=
X-Gm-Gg: ASbGncuD5ABYsw66ML9C0DwCB4Jv8YsTdzOGzngznJE6mk0lVGyrlloFTKivP86X8uM
	0SUd+IQ4YnWwHZgVe0pIMWiMJjF6qL+CgY9tDg7Az1l6PjICLOywMmW8j+y3rRTKtNCWmReZsf1
	yMQ444a4dkpCwAHlr3QrFz2UWhHJKFSn9SbNoOmil4VpBtHQdQbF2XHIsU1UFTWtx53SETKcobJ
	VeXH2XOve6xZRFKglD8Rm+CSgLhrGy95orzxabcGl/ZmKskxqMFP1cREeckOk2VxrZyg1ijnjy5
	T133wjyOnZbtMUMsAH5J+NnHH6MKquXIswDHKBS+AIYIlOEc6hUEx9ar4ZqHUpxq+Q4w85ihSGc
	OxavF
X-Google-Smtp-Source: AGHT+IGG6GtIcwXiGICO4lIzd9YGXmj75fyR5ixP3S6L8K30oAW+vLBtChvalONOA1A0MT12YPAFzA==
X-Received: by 2002:a05:600c:46d0:b0:43d:22d9:4b8e with SMTP id 5b1f17b1804b1-43db6229c55mr230869235e9.10.1743696155657;
        Thu, 03 Apr 2025 09:02:35 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34bbc64sm21811285e9.21.2025.04.03.09.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 09:02:34 -0700 (PDT)
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
Subject: [PATCH v4 2/2] ASoC: codecs:lpass-wsa-macro: Fix logic of enabling vi channels
Date: Thu,  3 Apr 2025 17:02:09 +0100
Message-Id: <20250403160209.21613-3-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403160209.21613-1-srinivas.kandagatla@linaro.org>
References: <20250403160209.21613-1-srinivas.kandagatla@linaro.org>
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
 sound/soc/codecs/lpass-wsa-macro.c | 108 +++++++++++++++++------------
 1 file changed, 63 insertions(+), 45 deletions(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index ac119847bc22..81bab8299eae 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -1459,6 +1459,67 @@ static void wsa_macro_mclk_enable(struct wsa_macro *wsa, bool mclk_enable)
 	}
 }
 
+static void wsa_macro_enable_disable_vi_sense(struct snd_soc_component *component, bool enable,
+						u32 tx_reg0, u32 tx_reg1, u32 val)
+{
+	if (enable) {
+		/* Enable V&I sensing */
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
+					      val);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
+					      val);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
+	} else {
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
+					      CDC_WSA_TX_SPKR_PROT_RESET);
+		snd_soc_component_update_bits(component, tx_reg0,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
+		snd_soc_component_update_bits(component, tx_reg1,
+					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
+					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
+	}
+}
+
+static void wsa_macro_enable_disable_vi_feedback(struct snd_soc_component *component,
+						 bool enable, u32 rate)
+{
+	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
+
+	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI]))
+		wsa_macro_enable_disable_vi_sense(component, enable,
+				CDC_WSA_TX0_SPKR_PROT_PATH_CTL,
+				CDC_WSA_TX1_SPKR_PROT_PATH_CTL, rate);
+
+	if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACRO_AIF_VI]))
+		wsa_macro_enable_disable_vi_sense(component, enable,
+				CDC_WSA_TX2_SPKR_PROT_PATH_CTL,
+				CDC_WSA_TX3_SPKR_PROT_PATH_CTL, rate);
+}
+
 static int wsa_macro_mclk_event(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
@@ -1475,7 +1536,6 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
-	u32 tx_reg0, tx_reg1;
 	u32 rate_val;
 
 	switch (wsa->pcm_rate_vi) {
@@ -1499,56 +1559,14 @@ static int wsa_macro_enable_vi_feedback(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	if (test_bit(WSA_MACRO_TX0, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
-		tx_reg0 = CDC_WSA_TX0_SPKR_PROT_PATH_CTL;
-		tx_reg1 = CDC_WSA_TX1_SPKR_PROT_PATH_CTL;
-	} else if (test_bit(WSA_MACRO_TX1, &wsa->active_ch_mask[WSA_MACRO_AIF_VI])) {
-		tx_reg0 = CDC_WSA_TX2_SPKR_PROT_PATH_CTL;
-		tx_reg1 = CDC_WSA_TX3_SPKR_PROT_PATH_CTL;
-	}
-
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
 		/* Enable V&I sensing */
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_RESET);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_RESET);
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      rate_val);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_PCM_RATE_MASK,
-					      rate_val);
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
-					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
-					      CDC_WSA_TX_SPKR_PROT_CLK_ENABLE);
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_NO_RESET);
+		wsa_macro_enable_disable_vi_feedback(component, true, rate_val);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		/* Disable V&I sensing */
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_RESET);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_RESET_MASK,
-					      CDC_WSA_TX_SPKR_PROT_RESET);
-		snd_soc_component_update_bits(component, tx_reg0,
-					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
-					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
-		snd_soc_component_update_bits(component, tx_reg1,
-					      CDC_WSA_TX_SPKR_PROT_CLK_EN_MASK,
-					      CDC_WSA_TX_SPKR_PROT_CLK_DISABLE);
+		wsa_macro_enable_disable_vi_feedback(component, false, rate_val);
 		break;
 	}
 
-- 
2.39.5


