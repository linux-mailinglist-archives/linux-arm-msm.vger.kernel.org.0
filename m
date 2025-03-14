Return-Path: <linux-arm-msm+bounces-51418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CBCA613B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A73A4882FAC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6335C20127D;
	Fri, 14 Mar 2025 14:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QtHpDldG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE17201015
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 14:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741962808; cv=none; b=AC2lFnL64Ai2I+tI9uoQsKZ3MEox7LmFP5SrL7h+Q/A724TcCPQBchA03D0iFV+qzZ3hko/t0q5Q1AVXDhpGPzMFU65ZF24B4gs4GwQjroLQ454rl8Z7QqB7V7mX8kWl9HCoF2iKB4FMBkuLS6NhH5QP3HfnzUu8BU7r+JJ0ZVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741962808; c=relaxed/simple;
	bh=TAw1EHr+KGLgB3XkicmeA88VvxQqIZ56YNyuSffOm+E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kPrBCda9PFRHTYRAgKmF8D5ds8/zQzsQ5c6Av8kmtRTvmxOj062kEbBtsegeska/N8RN6MmtRhnyeyiBVXRsLw+h6TIL5LW58sJaaDK6FuTcA2z3sUouVRDiYlnzSTQC4ACe5E0vZQ0Cn5uCXx5HLmb+IFHHPRh3ZvdfMEdbl8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QtHpDldG; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39133f709f5so1346719f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 07:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741962803; x=1742567603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chruVzlaUTkKurouBS2LcxGafUPd4GyPtKSm8NIC0fw=;
        b=QtHpDldGuK5JIGP+WKBGAsKCb0hEg3CiR33mzhwg4kIPGga5JT5dy5bjsS2pfPRXtc
         dgQ1VAkGd0PpjgryNzWOL69fqO38K9Fq5WalSzvNSSWtUQZJWaa7c+itaoy5accQkADY
         zR3H12QiIsDvmw3lAlZzVNc1orNRBgUnMCnv29sOt2fh6JxHbOEPiu6Ig9E6r/HDRj/f
         q3hAzOkIMEzo3WsAVAARWjrPlor8hbo+d2H0c1spiPaeIFUFqoCOTxXdJnW+GRkruX3a
         5VRTNiIEeu5T7YIfR0Cmf5l0u8Lxjo+/g8lSKhNIw/D/zXGuDweyTfQ6n+gHJBEShodt
         0FRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741962803; x=1742567603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chruVzlaUTkKurouBS2LcxGafUPd4GyPtKSm8NIC0fw=;
        b=HZpPG1PVi2VKD80iETf/WaVs6Prt6iZsRvZguf7SBqph/Xrx3syeJaJIoKbUPPITzw
         jLTnPkOqKwgciH9wC3kXDZ42suno3ix+AvB4llH6GeqgImLtjRmcbVtSOX6ClmlaBW/M
         Xl3bzXACnF4Fjq1r/NKa8NjuR/GQUPaYlrMnNEWlWsK7H+EdkGysvxzSdmLZLjauzHqN
         wVHK8OhYPc5P8/P3nQ3ANe1EMTuhmNcKxImEMC4URZu9sUllITiOfp+FPI0HoKumFttY
         +3/XhqmZ34hEGjFNl4faAHp1gctWs8CTfUwwY1J6SC2ZdLoxWQDWnFvCedqnTDgHcAiE
         llDg==
X-Forwarded-Encrypted: i=1; AJvYcCVqc8E7Uud7qZoj5cmeHaeUdIR65QSntHITq10YBMlzQGm1ujcJBlHn3Sm7SgNMkDU4Qym/joRCJmQxbDz8@vger.kernel.org
X-Gm-Message-State: AOJu0Yye1MBh4+gbLn7Y02CY7jYD22OfdggT7beQzmQUhyfVwq4YH+9H
	JMGIBE6v4AXxKyO1FAnCtKk6CO9Yc4V8gpgODa7U3fPBGezvQrd3s8A4gCqrkbo=
X-Gm-Gg: ASbGnctXUQwdyerj2z1pLELA6Lr9gE8l1jnyfPcEXb8BZ1MJkpeF8czp8siWdVYvhMF
	bm09VA3HVYwnmZU59eOSzefVGX6g5RfSGKJsxOZWvnnGO5gFvHTLBBeK4CJ89byvXmfS6hsKQVX
	9P3YGDGE5bybFid0c+IGScRRlaPw0YTJW68Cb0Km35iUtpwZTL+bW/k7uoc6M5dv5+ccv+zcsle
	qCDWgi2Q2wV7ZDXayBuHwncHGDhV8WximuzjqN9TnZnIPZbD1Ymp4rty+rUGN6UIMD72nNWPRXW
	p1oI8PYbd2JmLfxYvv2uN8SnKn1Z/eSYeCSMa3IMyPL7l4jll1L1qj2V5yhoOJZWcbs8lw==
X-Google-Smtp-Source: AGHT+IGkZEYytxBtdjySKaiItrRdrarx/PaGm+R/Jm71H8ErDxLmtWHVS1w8bgjGtTokv5oSf194nw==
X-Received: by 2002:a5d:47c6:0:b0:391:ccf:2d1b with SMTP id ffacd0b85a97d-3971ffb36a4mr3785197f8f.49.1741962803514;
        Fri, 14 Mar 2025 07:33:23 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c2690sm5699168f8f.25.2025.03.14.07.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:33:22 -0700 (PDT)
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
Subject: [PATCH v4 1/5] ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
Date: Fri, 14 Mar 2025 14:32:16 +0000
Message-Id: <20250314143220.6215-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>
References: <20250314143220.6215-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

With the existing code, we are only setting up one period at a time, in a
ping-pong buffer style. This triggers lot of underruns in the dsp
leading to jitter noise during audio playback.

Fix this by scheduling all available periods, this will ensure that the dsp
has enough buffer feed and ultimatley fixing the underruns and audio
distortion.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index c9404b5934c7..9d8e8e37c6de 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -70,6 +70,7 @@ struct q6apm_dai_rtd {
 	unsigned int bytes_received;
 	unsigned int copied_total;
 	uint16_t bits_per_sample;
+	snd_pcm_uframes_t queue_ptr;
 	bool next_track;
 	enum stream_state state;
 	struct q6apm_graph *graph;
@@ -134,8 +135,6 @@ static void event_handler(uint32_t opcode, uint32_t token, void *payload, void *
 		prtd->pos += prtd->pcm_count;
 		spin_unlock_irqrestore(&prtd->lock, flags);
 		snd_pcm_period_elapsed(substream);
-		if (prtd->state == Q6APM_STREAM_RUNNING)
-			q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
 
 		break;
 	case APM_CLIENT_EVENT_DATA_READ_DONE:
@@ -294,6 +293,27 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	return 0;
 }
 
+static int q6apm_dai_ack(struct snd_soc_component *component, struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct q6apm_dai_rtd *prtd = runtime->private_data;
+	int i, ret = 0, avail_periods;
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		avail_periods = (runtime->control->appl_ptr - prtd->queue_ptr)/runtime->period_size;
+		for (i = 0; i < avail_periods; i++) {
+			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, NO_TIMESTAMP);
+			if (ret < 0) {
+				dev_err(component->dev, "Error queuing playback buffer %d\n", ret);
+				return ret;
+			}
+			prtd->queue_ptr += runtime->period_size;
+		}
+	}
+
+	return ret;
+}
+
 static int q6apm_dai_trigger(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream, int cmd)
 {
@@ -305,9 +325,6 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		 /* start writing buffers for playback only as we already queued capture buffers */
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 		/* TODO support be handled via SoftPause Module */
@@ -836,6 +853,7 @@ static const struct snd_soc_component_driver q6apm_fe_dai_component = {
 	.hw_params	= q6apm_dai_hw_params,
 	.pointer	= q6apm_dai_pointer,
 	.trigger	= q6apm_dai_trigger,
+	.ack		= q6apm_dai_ack,
 	.compress_ops	= &q6apm_dai_compress_ops,
 	.use_dai_pcm_id = true,
 };
-- 
2.39.2


