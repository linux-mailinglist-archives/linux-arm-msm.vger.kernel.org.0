Return-Path: <linux-arm-msm+bounces-50159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D12A4DB8D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 11:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CFC27A6AD2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A5D01FF1D9;
	Tue,  4 Mar 2025 10:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uy/lLvWZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E98F1FECB8
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 10:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085875; cv=none; b=Hllno21gnpk4vCq/TbVSBow2pRZHnpmts1OBTYS6d1bZPx/5GL0mmyg+H/OVx62N74ZzZNHq/Gy8S/+vrVmJ8aL9/AhZ/ezeQKu3bDtEH4pqFxRdxEqQk5maAX3yvKsHqgu8EBjQ0lQXuHKh9qSBIBe5BKBSCEp5RNrcXvRUymk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085875; c=relaxed/simple;
	bh=a8wBb5Pu3Xn+ai4AGmTn/n+jSwHVc64nuzgsrIqk6KU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rimuduWfHMzhFxbY+8Io3s5/hk4WuNP0ImeqFeYW02ot/whvjnMkz73FsGZC8MQ9vgxuCNKWL177jkZe4zoyR9RDHyJcH8pvVd0d8Cw5ieeszw9/5RQKq8ctLcVk/p06BqeoXCudqH6zTaQh9rm/4YY0U1n90G78CDmv9oFiJW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uy/lLvWZ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5491eb37dso3629646a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 02:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085872; x=1741690672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0rt3fuU/Pf0rTgHYvdRPIfkUIcPPHNUBjw5GiQRLAs=;
        b=uy/lLvWZvtHfrQojVjj6SGU9ht9lfSFUHl06//CTzn9UZAGG3trTM+gYW66nD+pJhL
         C5xvfIM6DDHBA2KjO4iZrx6IwDKhdbm4u5slo+VeXQhZ766ixAH8YDUA/uCTjM4ZfyUL
         QXhNTG8JQXq+kmzNVi8oSRdshOe4EraWYNjd59ZhHAtpkdo+1j+V70dqClR69oLjR5Gk
         HC3+JCF+mlHiZT0ISG7HCftanfbObb8KLqRRA3Gu4sk2/9rR/vlvT/JGPfIjZqoKXM2x
         K8AAxUNO0cnJ+Z4du7+RlYvKVRvRzfLB46GUqS4JsWIkWzqEBPSTVMx/q2+JXfgl5MqY
         zpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085872; x=1741690672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0rt3fuU/Pf0rTgHYvdRPIfkUIcPPHNUBjw5GiQRLAs=;
        b=Csi1BUFmIezVuoEnoG/cAc3YAXK/d4JjB0hxSnKij1rw6o1A3M50C0rX7sI97ATEPa
         Nk3eLgF3Nil8DzzI5Jcps/21JsTku6b851XEuWQK3trbyNmUhzDungCgAjcTj+BNblZc
         06Q3rr8ewWufRDGD8HT1ZCTCRgTop5t+O4tnR+uNO4yKJ+pnn+3auzSwqE6l1SaMKE2X
         uKd8NV6PPOBhKTqS5vEsP5jN5Il6UAy3MJhzVk6IkxyG7nuiwtrGWMjMZdBPnDFGT1jU
         6jxbdxs43XPMkGLKQuZK6FmDAh/fI+sJJ6uU78zEQUfLdiWORaLTqh5K0mDFGffcvmk4
         Ks2A==
X-Forwarded-Encrypted: i=1; AJvYcCWfdftbDi+bMO5fg4Al2SMH3ebewEtcsu5ZAUZXFCJsX7PPfsgDxT7tDZHRi4LEocHDuSoJE/BKZEPjcf3a@vger.kernel.org
X-Gm-Message-State: AOJu0YykrGgv4rPNt0byzGTEWb8kk5PHO44nfE3N14eG1sLw4hR3XF0j
	r0A6H5EgmoaQPtHY1Daaa1myY2Q/L7PiBMpkDSHzdM11oOaIeSkXHl1YDcIPLDE=
X-Gm-Gg: ASbGncsTTyamwI1PgPVaDh/YLl2GZl9/xtbLSWlzriM41PdM5WXNFkpEJpc7fhd1HXv
	ffXehsIm+D84Z/LIwI2T74uPiKSDAwWMb2+gicxYJHMO/tEMzL2lWg+Q8w63zumHgoB0UiQBKX/
	0IEo5lyV7DMx3lFn4kL/J7Z8f9he4Yh88YiCJ7tOVNylOT9kK+tnyz5F1IintaPgol4D7OlDDyD
	5xF9eP5ib1ZGJLL+eM4mAnuwCCHUW1f7Hur32EAAq1aoetzh++X9VGJwXWD+/0td5Jt4sHAgjQS
	limj73sEk3D7eghtP5I6uqCj0UxZ3Prbspf+Rjbg1uMVIcpJXCNek3yQ+1goutmIewuWsA==
X-Google-Smtp-Source: AGHT+IE2oxoC1L64pceFAJjINpFW78bsl4/VjfI/l/jWFrb64hOpXvLnDRUmBAhXfrCjNcCe085GuQ==
X-Received: by 2002:a05:6402:848:b0:5dc:d10a:1be8 with SMTP id 4fb4d7f45d1cf-5e4d6b0e6c9mr19059467a12.19.1741085871828;
        Tue, 04 Mar 2025 02:57:51 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm8002966a12.77.2025.03.04.02.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:57:50 -0800 (PST)
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
Subject: [PATCH v3 1/6] ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs
Date: Tue,  4 Mar 2025 10:57:18 +0000
Message-Id: <20250304105723.10579-2-srinivas.kandagatla@linaro.org>
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

With the existing code, we are only setting up one period at a time, in a
ping-pong buffer style. This triggers lot of underruns in the dsp
leading to jitter noise during audio playback.

Fix this by scheduling all available periods, this will ensure that the dsp
has enough buffer feed and ultimatley fixing the underruns and audio
distortion.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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
2.39.5


