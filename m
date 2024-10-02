Return-Path: <linux-arm-msm+bounces-32915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EDF98CB27
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 04:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61193B22030
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 02:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577F3D51C;
	Wed,  2 Oct 2024 02:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MSPHdhaT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD4517BA9
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Oct 2024 02:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727835628; cv=none; b=r6+Bi77idIfI4W7QCznQKrrFyQln+CeAVgT5lmCUQVf9b3k2irijGsYTzQ0++iV2ef+gp62uMWYbp8J3KUCtMw5rLUURwf43ab4/Mr99EhGIlZmRksg1o3KwQTHkJf3vDw25/wpBKbtIULS7zb6UhSLx442MuanjB9gWreV3I1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727835628; c=relaxed/simple;
	bh=LOfadXrLg7ZRoN+A8CWVlfI8ytsXadkatDmRlJNEVAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIGJaBB2G8fVKaGNsdfBRy14ibY1qzhl0NuXN5GSMwzUK2MupuaVFfp4v90TOlT6+gPAJKr7zDDi+pRlUHC7dK0npc1VI5U3xVJh25kTLga5L77HhZ5HzsZ031kefFDz5xtCDNR2ZeIWokGMyTf6Xnn5fVsJkQqExkzyMmKPaww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MSPHdhaT; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c88b5c375fso4973988a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2024 19:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727835625; x=1728440425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCYOTM8/0Ug4V9lj8bQNm7elnTCjMFp7xXGYdHTDU3c=;
        b=MSPHdhaTgmrYkMv+nfF0ucq6Q2yt8NL/FoXOKvB8Ya237KlalA75OfLZzP7N36IHNZ
         wmsFxajkYHYfWDXw+fv1ZD6Hwny6PQasQakgrJCOT6owYYTvrWfg8aAdnhsGEfb9UhS5
         T1YGf7VqfqI7huYHL7q5mDRu5vqjCgHbXTBK2FrmNYzpx2ljeLvCFIvYfwwdFblMFMid
         qkRgOeVlgP0MDIAG7UJr4u1K3zikMq90NLL2ho4qfnJS+cQYIBCrrUU8g6IK0q8LR3yR
         XSLoJegG/34m+sQRc0Z1j2Z7d9hVnAokrS5tCz6wod91jz1JWGMq5FZTgAySX/ppoJXf
         jzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727835625; x=1728440425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OCYOTM8/0Ug4V9lj8bQNm7elnTCjMFp7xXGYdHTDU3c=;
        b=jBc0xXqSR6BkmrIShAlsFAfOtA7i9zZKR+gqGH8OQL94zOQY+DjGcXkQBDZEAhl4/G
         HNvMQHwQvvFWfeePCveDuqmb4rVQpwsmWr8s3YdYy+GjQSaxDmSx7lNScnRn6nfwZ5qt
         /eypiGfChE9E008yYw59Lp+mGB8yiRuPLBd4MITtUrCrqa0zvZ4maVP+i48n578Q6ym/
         9pjVmgfuV3F7oJEeiTORtkTfMALe3/mL/YM/ZL+RrvvPhAO/DkvQUQVMS61LvM9vyU88
         yDPBzh1/54lSzwTmINPYJOhowZpCfsd8oNvrbdDAtrzsUwe1QDboX6yR9wDThKv96394
         9Xtw==
X-Forwarded-Encrypted: i=1; AJvYcCV7MDKx9qltCh9t8j1wSQAZKFUuSbhseRfIxv8PiwUYjZ5JW/jhNdb/1ceHnLblQYKlk3qLWc7XIi1YGk9P@vger.kernel.org
X-Gm-Message-State: AOJu0YzcAscxORnXAuvpscxaHIc6EDkYdSSwJE/2TU6mz8vNVv3XOVHy
	MVPx1oQL5RNmlJ3LtCIgvQI0FKF4r3HF+YjG/LKltZ/BTfouF40TDyt7OM1nffo=
X-Google-Smtp-Source: AGHT+IG+Q/gURHat1q3AUvb0+GovkmpG4ajTJTbVyAEb1VAT3Jst29VyqLUHNkKFUyiefEeDXTOUcg==
X-Received: by 2002:a17:906:99c5:b0:a7a:9144:e256 with SMTP id a640c23a62f3a-a98f8213366mr125224866b.6.1727835624893;
        Tue, 01 Oct 2024 19:20:24 -0700 (PDT)
Received: from localhost.localdomain ([2.125.184.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2945f2esm787518866b.117.2024.10.01.19.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 19:20:23 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
To: linux-sound@vger.kernel.org,
	srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	elder@linaro.org,
	dmitry.baryshkov@linaro.org,
	krzysztof.kozlowski@linaro.org,
	caleb.connolly@linaro.org,
	linux-kernel@vger.kernel.org,
	a39.skl@gmail.com,
	alexey.klimov@linaro.org
Subject: [PATCH v2 3/7] ASoC: qcom: sm8250: add handling of secondary MI2S clock
Date: Wed,  2 Oct 2024 03:20:11 +0100
Message-ID: <20241002022015.867031-4-alexey.klimov@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002022015.867031-1-alexey.klimov@linaro.org>
References: <20241002022015.867031-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add handling of clock related to secondary MI2S_RX in
sm8250_snd_startup().

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 19adadedc88a..8776c35a98df 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -63,6 +63,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case SECONDARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	case TERTIARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
-- 
2.45.2


