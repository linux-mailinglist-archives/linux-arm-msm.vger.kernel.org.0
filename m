Return-Path: <linux-arm-msm+bounces-50161-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8106A4DB97
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 11:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 855CF3B2A74
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466FE1FFC6A;
	Tue,  4 Mar 2025 10:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pNba2wxU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D13A1FF605
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 10:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085878; cv=none; b=aHpOAUOUyCsG05coE7fVM7X8ubeR+HJm6eflPaeumDoVuMVZCOIZ0nwLf1nD3nwfCh99HXOFIwyVeIhBjTzi76eetxF9mW7CA4yYOy8a4hWxuGpJXHCQmjD3omtAELmb1HQD7aiLmEx50iPkiCm8uGOjXjMNcQWOm2o7W55XcIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085878; c=relaxed/simple;
	bh=2cyClla8P6nWRItjw60GOMchhN9i8E2qxWYIAydEh1U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IuKOLM8wpT+KaIIXcDPWR9qejbX8JjcFvkxVXSGflvdShha2o6+t97J4YQNok47JefIVpxthmjNl6cmF1ZSpEEH0ZE0RYdia8oI9lkjztFLc6WUa/AqrfWy0BY6I7b14ZS5Y29e9N/DVkwU+Tce3GErF/iyVM0wzx+EiSS/yGns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pNba2wxU; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e5491eb379so3579121a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 02:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085874; x=1741690674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ey071ua+N+9tAjiihktgShgQiT43owN1w7pBcfUu5o=;
        b=pNba2wxU7i/nwvVqF1bqfLHzLYB5/OFSy++gxwjWYwP4KoGYRXQiOSImu9g9M770UF
         y7OPqZiimIM+R/g2R5zgbGztGH6CJaLjQGvvl5t/gSfBDbOpCbJ+DF2HB3GfC1qHooX+
         L42uZDGihrjcpMu4Ov6MjOEZlrjwymQu6EPjVPsYtsjUoVkcAX2YiAZ3cqc2VbD7pnFD
         zmerkZOCzA5V+oHnWKrlGvlJGaFT8EBrbhXDu2ZxMPY5KSOm2Bu0DMLaExfym/cgi1Qv
         7637g3XWm3HEME4qE5DYiYMmrgvI7VTxwxVyYWyeY6It08vKV7niARKCFCRB+TsZlr3W
         x/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085874; x=1741690674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ey071ua+N+9tAjiihktgShgQiT43owN1w7pBcfUu5o=;
        b=Ae7jGQWmlbmqSxAIHXRggNNz5h+kbkJJInDobzPRthxlsOs0oRPJRCOcc9CEHYRVQ9
         2EZDZIgxOq9BOb9YLsaFGa5uM2to9MOxmsCMj1GzxOyA337qbeP66b3IUPgMCPEF30Zg
         A2HQqepn3fQ0jV+qOUrYDTN4boRO/RRtf28nY026LV77pOSRX7Nn9IR29KOJYMin32qN
         MqPkiza1o5nBRGCtzeVtc5BAIq618q0FwqurgEV5bp8cKnR8KwtNQdlZfn3uKudoBIYH
         8JuHd6t6DMmuxgh/bUbuISHa2TqDh/RDvhppkEZ8cItwUs+sXSrt+jngfNDzZ0O0aU/z
         POrg==
X-Forwarded-Encrypted: i=1; AJvYcCWAO3o/rzivgsMWnUG/Gd3eaf9I8roSppXyqRFkzTVNdnlTHRwAFWJz6/r1imWzmaKNUoRpYEjYp9GEguyd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9C4F4snHN0Bf3OF7VIqGlLtsXByG5jZcmwu8dRKk/g37B+VBO
	OTu2jWbMDUl4qNthF0d4d2jb42gQunocbGJxn/HchykROXvoYPSjuPiEyiPswBA=
X-Gm-Gg: ASbGncsH5Ih3d9p/sd06S462++ZHuqcrgz2adp4EvEEX111Hb0TvWCN1kdb19p+ddKr
	B9q5U5vw9rjDY7bD5kQg3sDqXFpscLneCvZxX2BDRryfENCNbrNzn34v2pcthWnN9pBaswUqHte
	msirf5MpulkxVZ2Idyztc8RUZmGyQ5OYVJ4kgYVaYQzrwkl26mFaQJPEC5EEdiWntzLD5mb2eCj
	cJ5AIS5GBVmYNQw/9iCFnktCCtAuTxgSIbgmwFnKl7KsIt0xhFHFC8RR2hXF8MGKG/M0OhlL72/
	8the7QZ7ajul2owW6HzM5MRnDKlUzmghzJRfp9c9hYVfY+iYvJfXeXFomkMiVOi21d/6xw==
X-Google-Smtp-Source: AGHT+IEl5dQ7SUi+h+pAoAiqxB4IHkrcoHFGA18aKW1ukykTVB77J+DM70kzsLvNIP2qQEyNm/KbYA==
X-Received: by 2002:a05:6402:378a:b0:5e5:bb0:5d8b with SMTP id 4fb4d7f45d1cf-5e50bb0608emr14240833a12.10.1741085874589;
        Tue, 04 Mar 2025 02:57:54 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm8002966a12.77.2025.03.04.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:57:53 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	johan+linaro@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v3 3/6] ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
Date: Tue,  4 Mar 2025 10:57:20 +0000
Message-Id: <20250304105723.10579-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

With the existing code, the buffer position is only reset in pointer
callback, which leaves the possiblity of it going over the size of
buffer size and reporting incorrect position to userspace.

Without this patch, its possible to see errors like:
snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536
snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 9d8e8e37c6de..90cb24947f31 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -64,7 +64,6 @@ struct q6apm_dai_rtd {
 	phys_addr_t phys;
 	unsigned int pcm_size;
 	unsigned int pcm_count;
-	unsigned int pos;       /* Buffer position */
 	unsigned int periods;
 	unsigned int bytes_sent;
 	unsigned int bytes_received;
@@ -124,23 +123,16 @@ static void event_handler(uint32_t opcode, uint32_t token, void *payload, void *
 {
 	struct q6apm_dai_rtd *prtd = priv;
 	struct snd_pcm_substream *substream = prtd->substream;
-	unsigned long flags;
 
 	switch (opcode) {
 	case APM_CLIENT_EVENT_CMD_EOS_DONE:
 		prtd->state = Q6APM_STREAM_STOPPED;
 		break;
 	case APM_CLIENT_EVENT_DATA_WRITE_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
-		prtd->pos += prtd->pcm_count;
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		snd_pcm_period_elapsed(substream);
 
 		break;
 	case APM_CLIENT_EVENT_DATA_READ_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
-		prtd->pos += prtd->pcm_count;
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6APM_STREAM_RUNNING)
 			q6apm_read(prtd->graph);
@@ -247,7 +239,6 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	}
 
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
-	prtd->pos = 0;
 	/* rate and channels are sent to audio driver */
 	ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
 	if (ret < 0) {
@@ -445,16 +436,12 @@ static snd_pcm_uframes_t q6apm_dai_pointer(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	snd_pcm_uframes_t ptr;
-	unsigned long flags;
 
-	spin_lock_irqsave(&prtd->lock, flags);
-	if (prtd->pos == prtd->pcm_size)
-		prtd->pos = 0;
-
-	ptr =  bytes_to_frames(runtime, prtd->pos);
-	spin_unlock_irqrestore(&prtd->lock, flags);
+	ptr = q6apm_get_hw_pointer(prtd->graph, substream->stream) * runtime->period_size;
+	if (ptr)
+		return ptr - 1;
 
-	return ptr;
+	return 0;
 }
 
 static int q6apm_dai_hw_params(struct snd_soc_component *component,
@@ -669,8 +656,6 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
 	prtd->bits_per_sample = 16;
 
-	prtd->pos = 0;
-
 	if (prtd->next_track != true) {
 		memcpy(&prtd->codec, codec, sizeof(*codec));
 
-- 
2.39.5


