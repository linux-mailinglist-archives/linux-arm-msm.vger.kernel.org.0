Return-Path: <linux-arm-msm+bounces-51421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A191AA613B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 15:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BA381B62431
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 14:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD89202F65;
	Fri, 14 Mar 2025 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g73ymznm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1B020299C
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 14:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741962811; cv=none; b=QmrG0yGTJXD1Gir6IALgpMSw+P9EJjoBm63+rm7/iCgg2s84GKuwAzo35vefVy+gA+ATvTq52lP7V9EBCrLA20OSq/Iq5/aWd/16O+FbvZQe9hzwb1tungiSjMD3dXO0qY9TFkkEg2WRa5sxMPnxDvaBc8sMmhZCqkgT0hqr2/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741962811; c=relaxed/simple;
	bh=etID88XhArSgmvosEDMawlWfvyYiW3vHyBAqplbUD90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GYYM5ZFuAfWHQrB5DEKIGYPgjG7iE3dsNCfFsnuLXewt/Ix0vhRqWdzVgjzjOIlpuLJ9Z4odrGJmg5mu6Jw+AzUIunG+OWdN4lfJfHPvc926oRShufVAqvAvnLmD0KyzXY6c0TXZCfdGCCCMUjgH6Ct/XDbmEjAKFsCGpBi4oKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g73ymznm; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39133f709f5so1346799f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741962808; x=1742567608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86CJK2fc0cAvOYyDOyHTA5kr0QOMsZ602Wh5UOHhaX0=;
        b=g73ymznmPQ+l3wbZ7nChZLt9j0OptWwba7Z+ES3NZLj5jSpgMHRSXdKPx65IdCppwo
         hmHl6K/wxkd0h6QoI8+lfuRbXvSMuFnfvwSujBaIz4EnvYxLOcm5jBPZrC4d8rwkhEAP
         kCk2lVBl0fMl2KlqemjvJl7aD0zmK/NYdpGsXS8RLE7rglT/2MGmiNeBVpToubITKxv0
         begNQiuZ01/ZmYJ0et3CiksswTp7dKSgLK55bs7OJBcO47bxR5ALGYeqIDWXZgVjoM3d
         +j26oZjTfmadrVxLENrDOA2z7uXEu/CyZ7+loLUGa7Ng0HXX1kGToU4lUQsHM4eEblHY
         aD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741962808; x=1742567608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86CJK2fc0cAvOYyDOyHTA5kr0QOMsZ602Wh5UOHhaX0=;
        b=VIa9qkTlQ4A4nnl0vQ4dpl/XgFnvApVMQ5voqKnQqwD++T6hpQjcY5EpInk1PoOgYh
         o0mihHn/kuQzCw/MpiTJhWmApyZ1Xi+5WXjhCrgJrIhj7a2HRL5Cm7jzL7ieWkRvwQWK
         wlLt6VLwVF1mt8+1Cr8Y3A2LTFrGhZcMe9AdcV19yJRLa4BwJM1yQQm3nDxC5mIsaQpX
         D4et1pbuuW+Q9qVf40aZn3lHGeA8qPknotCe61UaD9Enhg91vqyGkB2Y5CFZhjh//qi3
         u9K2i+0hoDiDMXWMLi2yNyaB3l/xMTDzLF2HLuNmBng24b7iN8fhtR3Wd5P+QX2hnAGe
         kSvw==
X-Forwarded-Encrypted: i=1; AJvYcCW2ySr0TFrlXsroiWk7v30t4jCFv8luHeXJcgyJaU13VW9DEJgO6X8pVbWoki5G0ywapTjPaVK7CQAL30gl@vger.kernel.org
X-Gm-Message-State: AOJu0YwaInCl70wP7CIlJDBi/QHmtxn3T+SrtS866gn4oiPpofXxdC1X
	/I57mpqMtRZJjX/JTeE6NWOzLWyY/lgaOy4tpwh5Hfk0yKt0gU8L3L5oLxucR+Q=
X-Gm-Gg: ASbGnctV4yEvmjMOvQkY+GD6cfjA01pgQkKlCMKSM2WLfWiDvcoNsEcpYRlrTPcxE3W
	s47WEUx1yrAIzkay6Jk8I24ypyRewkNId3ILJvbDkZVl34l30yPSPCH3Mfc0PkxEVHQXZaFavSW
	R2cQ80lvp2q7S6i9gr9ntp8sQF1aicWn7m9M1PEAExbDb0S0hYLDAhrS5eUAS0NrOMKoEP/vzu9
	5znqRRz4HT0XHuYNMNZBiJDYwkxdwXL/J7TkhUlKDTP99SfXYi9cucSlgqjLrYoHv17whAuuD5u
	iCHprI/5z7qwX89LDjEHR7Zgq6jk650XTWgPKpsvjNmIQIELTvZwonW7pOURA9mJsqF2og==
X-Google-Smtp-Source: AGHT+IHVs9aqh53jMw+jTNDbDhOzV9r2dswK8/QSdrxt12hvlpFw9Rs059AvnN5+zk17YnDOTrO2nA==
X-Received: by 2002:a5d:47cf:0:b0:391:31c8:ba58 with SMTP id ffacd0b85a97d-3971d03ee20mr3210099f8f.10.1741962808009;
        Fri, 14 Mar 2025 07:33:28 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c2690sm5699168f8f.25.2025.03.14.07.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:33:26 -0700 (PDT)
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
Subject: [PATCH v4 4/5] ASoC: qdsp6: q6apm-dai: set 10 ms period and buffer alignment.
Date: Fri, 14 Mar 2025 14:32:19 +0000
Message-Id: <20250314143220.6215-5-srinivas.kandagatla@linaro.org>
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

DSP expects the periods to be aligned to fragment sizes, currently
setting up to hw constriants on periods bytes is not going to work
correctly as we can endup with periods sizes aligned to 32 bytes however
not aligned to fragment size.

Update the constriants to use fragment size, and also set at step of
10ms for period size to accommodate DSP requirements of 10ms latency.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 90cb24947f31..a636f9280645 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -231,7 +231,6 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 	cfg.bit_width = prtd->bits_per_sample;
 	cfg.fmt = SND_AUDIOCODEC_PCM;
 	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
-
 	if (prtd->state) {
 		/* clear the previous setup if any  */
 		q6apm_graph_stop(prtd->graph);
@@ -385,13 +384,14 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 		}
 	}
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
+	/* setup 10ms latency to accommodate DSP restrictions */
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 480);
 	if (ret < 0) {
 		dev_err(dev, "constraint for period bytes step ret = %d\n", ret);
 		goto err;
 	}
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_SIZE, 480);
 	if (ret < 0) {
 		dev_err(dev, "constraint for buffer bytes step ret = %d\n", ret);
 		goto err;
-- 
2.39.2


