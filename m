Return-Path: <linux-arm-msm+bounces-48739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C145A3E0DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73FF13BEB90
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8557C2135C1;
	Thu, 20 Feb 2025 16:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zE1N0M+m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6590C213221
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 16:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068972; cv=none; b=tvesGI7Dwp8gFrxECbO6x6yeJbMJSPORDEbunqI3biPMZEhZkCy/HJmPD5/mQEwRben3gPax9Mr01c1q53d24GqfmKe0rzlermQGfxCgG7S0Tl4DBBAipiGeDHIZ2OgNjg5j2pZ/sGwyCRZV2xGknXgHWr7xAHUyXZQU4mUeUJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068972; c=relaxed/simple;
	bh=G44mzomd17zjRW176IaSow82CVHdPVhJq52qbX/krTc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F38bwPUnr5KczahMsiDwx2AfhRJCeluAEpld0NVbAOfVbZE+aox2WqgkE+kU4hPqMK2EA/mAFSwQ/jT7w7x1EMPbCfb+VwpeIgOWUsukcTXIodWXILAinL6adGQZIhAPmr9KTsvyWqwRWT1Um1PqFDFkatgDTrM6ndlqzq+pprs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zE1N0M+m; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f2b7ce319so970574f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 08:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740068969; x=1740673769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7m/CTzgrh0AA9xzhVYZwH6Z/AB9cMb21X+WgCPYE0r0=;
        b=zE1N0M+mcG6yeCVrShQIusxoURBJlTD5R/+EL5iJJCd42rO9aXh8QlISKn09oAZlS8
         cfuZOZ46FL/dKy0jV2g1yq01U1RDQD/zt4t843n0+SdmkNtrT08e0aHKh7zGTPJtXwLX
         L1wJYAhc5cHI+csGZirsREJBWUDOSoGIhB/90u0PnS+w6Lubjz0TZ28u/3YncEB+r1aI
         ay9GT5GmWW5hhn6loUsx9pvBRrEyUzrA943X9GWhdrLgK3N6tGOQSaCT4lYNFY0XvCAR
         OaX98jS8UX0PYG0L/nvQLWfi0bU7lj//ommHFy9MpbMyjLJjCG85ifjpu0Ujr9UAgcEV
         wz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068969; x=1740673769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7m/CTzgrh0AA9xzhVYZwH6Z/AB9cMb21X+WgCPYE0r0=;
        b=Do8oAObzqOa6RY8MA52wP5YonVgITgXVRuZ07SeFYTdlWyjzeFEbAXEKC0DYorfMMA
         CrwF3M87se21do2qfRqMv7PAxGfzQesjFg1PDNtF7aOktZ6sXFaGQe2Kq51TICEXf1sx
         ESxKS+AxPZwdLKlSrJebMTqi+GEEIn1b+rSXG8IopDsbeKNQnddgW/9iAbL4fh48xv5M
         WgeIi9+Suz3Vo9Bk4fPrYGY8e8xIsVRxQzmbdiloJI3nzuZ1k3T9zW59sVfREiMTy9zg
         X+TwqopakHboUCHaJVZwCPS9P4bi+uDV5YUAnpxp4vt9pUVKsd8UzkEeStg2kDRWNEfO
         YRZg==
X-Forwarded-Encrypted: i=1; AJvYcCVtzvhISnPrqKH52MxIGkf78qMTCMTcfM6ytPS5l9P6FMjFEK/44t0hp4KfLyT11EV4FP66PzDGVoBmB6dx@vger.kernel.org
X-Gm-Message-State: AOJu0YyfwAkyeXiUW8S8r3sTc460U7gdvfXrqFPUDEwT8sE+HiUkrD7F
	wAAGcJuGX20VjYSc6qBtKkIFdoJ9lIiMOynQSD2uehugJ/s6C+l7XtVw7rZgeco=
X-Gm-Gg: ASbGncsjSn4Iq0XINvPk+F8FMEsoznjAVuoRq483crmxrpH1MglIlSqOH2wx1uBNCCD
	2l7UncUD2SAr9y3FCCxkVru5FOycs8CjrQBoEo+PjpTaO+zoEVztfqss+8loBtHHsa1V1tjJCTK
	RUoIqvthXKBgMFIcg39makt0dlqrPdyHwdJXQGOAqLcwTx553OHm17vjYsUUGBl+C3D7Nnp2CyL
	iGj0YskT5A41njh2X7J7lsHPjZEZmLfBiaQeu2PsQNmcptPw17fNN4natmJhssxmo5aW+CsEmj2
	2400j0Ge9hrD544uGMQhdzpClNTw8py4wl9LK+F1
X-Google-Smtp-Source: AGHT+IErNAEoXnEuPGcHDzaI4u+qesPWr2oJ8v0KPpx1eLR4SBNS7L5XLR9zDyZbvaRrA+qYm3ZYUA==
X-Received: by 2002:adf:fa86:0:b0:38d:dffc:c144 with SMTP id ffacd0b85a97d-38f587e73a2mr5603019f8f.55.1740068968673;
        Thu, 20 Feb 2025 08:29:28 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fabsm20813753f8f.45.2025.02.20.08.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:29:27 -0800 (PST)
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
Subject: [PATCH v2 5/5] ASoC: q6apm-dai: remove redundant hw_constraints setup
Date: Thu, 20 Feb 2025 16:28:47 +0000
Message-Id: <20250220162847.11994-6-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
References: <20250220162847.11994-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

pcm core already does setup the hw_constraints from struct snd_pcm_hardware
values, setting this in q6apm-dai is redundant.

Remove the code that sets this.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 28 ----------------------------
 1 file changed, 28 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 049b91fd7a23..b644ce7d394b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -374,34 +374,6 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
 		runtime->hw = q6apm_dai_hardware_capture;
 
-	/* Ensure that buffer size is a multiple of period size */
-	ret = snd_pcm_hw_constraint_integer(runtime, SNDRV_PCM_HW_PARAM_PERIODS);
-	if (ret < 0) {
-		dev_err(dev, "snd_pcm_hw_constraint_integer failed\n");
-		goto err;
-	}
-
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		ret = snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_BUFFER_BYTES,
-						   BUFFER_BYTES_MIN, BUFFER_BYTES_MAX);
-		if (ret < 0) {
-			dev_err(dev, "constraint for buffer bytes min max ret = %d\n", ret);
-			goto err;
-		}
-	}
-
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
-	if (ret < 0) {
-		dev_err(dev, "constraint for period bytes step ret = %d\n", ret);
-		goto err;
-	}
-
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
-	if (ret < 0) {
-		dev_err(dev, "constraint for buffer bytes step ret = %d\n", ret);
-		goto err;
-	}
-
 	runtime->private_data = prtd;
 	runtime->dma_bytes = BUFFER_BYTES_MAX;
 	if (pdata->sid < 0)
-- 
2.39.5


