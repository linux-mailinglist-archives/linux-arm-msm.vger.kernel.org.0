Return-Path: <linux-arm-msm+bounces-50162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 670E2A4DB91
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 11:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C43F188D1A0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 10:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6EC20011B;
	Tue,  4 Mar 2025 10:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Of1OOs14"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851CD1FFC49
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Mar 2025 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085879; cv=none; b=dMlvkPtSpF/3gdb186fjFz58NOiphYht/NeaxEY9YMsMOgkatkj8CwWX06DBNAp80JnIfPpa4XJQdk9TLET6RaARVE/YxLKLFA8hjvxbQxJU9f97GVKZ6rJ3QSAwCD3dd1PZBbo5YCT8MB4/FoTnK7zZ0vnXI5GeyES+rdyxj0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085879; c=relaxed/simple;
	bh=T8BvseEhQtgXi/c6dzXEReCkqVf8+ZZBBGjoAN7DYSQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AJg3q2EhAwomAwVX9j+JIvr6ywemG2joBLcgL6u14uKdHkTFuyA/pkUaAXaarjWuqpT+eqbKlU6Mn27cm7ty9fOOOa0i8BTPRE2QbLP7IthTnpSKpi2Ec/7KS919yBM+hVDaDcVpnjwr5HZ+o+uw68EVMlRKPbZBduJviohQTBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Of1OOs14; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e535e6739bso4038626a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Mar 2025 02:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741085876; x=1741690676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8qpY34vr6GYk8mljhQq04C1Vg9LVV3uW0bLLDq/qwY=;
        b=Of1OOs14magff5WkzoscXE1E6o2u8goWZqXah/vmbZb+BR1l+k1+SuRISQGRT7+JWa
         KhN6itYTjZgtFdj+Kbi2oxRs6fmcwposhX36z+B62mwvR/2jgtNI16u4d6vuYOqMMVsQ
         wcqVyrGThcO1joVXOS22jz3tfJXhSgagdO5qF7+c0a5CNh3RZB/SNx0bZVdNz2YNfQa7
         dg+lpDQVaCKcD26ZpUOjhAdoYww0pwPxBBskhK58I+srXbx/1G0Ll0+QZt50IrJ+DHww
         hOnAW5IfN5CEFXW/zoQhwOHVyQnqyTXXVcSu9b3C0+tpmE5YsrxV3BOQReNVuYEHHwlD
         mFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741085876; x=1741690676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8qpY34vr6GYk8mljhQq04C1Vg9LVV3uW0bLLDq/qwY=;
        b=o/klcNpzRqsFCcND9Js6nKgUY5aecKz2UScxzVhuy2EkJL5UByyvOTMbE2Dcl9GhLu
         kKuN628k22XvUZqHjJ24h7A2MrZEcuRoHyKBj0zkdiIoMGoub27xBTLHGPCV+vIdWsj8
         mnXiSHUlLDL3Po5wxjne+N26uVfFOX8QxhVLEIqQyDY9quWjNzQiJ5OmwIHjSONFgeOK
         GH5lLG8aec71UTPTWGivM4kOihR53b+uuhlXrccZXO85XDKvqJHdHeWuTni20CupTj+v
         KiHjN85mNvGqSfJQZBGaj1nbDCifc/0dprdlS/VOoprRdkJe/h1iZrjeotlr7AFtjuSc
         ++xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhXHmi1pc73cslnEqcio7zN01zaLu1ROum03tds2u7VxVdR9JvDuXG36oS96se+12Bm/pJ/YmgOLx0yFkz@vger.kernel.org
X-Gm-Message-State: AOJu0YyD7fo+fjxCmML3ITy+BHNyWNjYRmWta2jyIodnXHUJMRDmuAqa
	/Gd+sliW7GiFzI90SJ3eZjEB0GMGI+38BYVaphj2jJB/+u5HU0TKq4EXpUneDxE=
X-Gm-Gg: ASbGncs9hnOwUdVd+BQaZ9Z6nnMLrZqvVOQPJHvSOzafrxFGqp9h4KZIQfDbT3amZtd
	F2q3S6KGo8SLJlrN8WNJZ/XwWvNlk8G78mxlQ4BZIzBMGa3XW9/6ICrEGiGJEU/fL1MGDKD5M+1
	yN2vmvcFO/sAPYIhErZwZ9VjQrki1cpmgRhArOSe8IbRAavfF0vJYU3OQ+nHkRGUBz/+pyjCPyR
	lKFXwkjB+4Uj5CzMy7qN90m16WRYDKMMtAOs3eALnQNIH0LC7XYeOPhWfV79s/4+JdxG0nX1GyH
	nMDCj3knHmCI4Vd68oP+23TmBL2iNuSVMr6hnxIduRcp44ZJPNifh8ezKYUponDf7tGTKw==
X-Google-Smtp-Source: AGHT+IEMtAPD+3mslBPe9dpUnwDfjI6yIrS86aj52AjEbtCekD+P8Nt1T5PEVviZq9Ti8UN7hLn8MA==
X-Received: by 2002:a05:6402:1d54:b0:5e5:3643:c8b5 with SMTP id 4fb4d7f45d1cf-5e53643cd09mr11556338a12.30.1741085875856;
        Tue, 04 Mar 2025 02:57:55 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e4c43a5acdsm8002966a12.77.2025.03.04.02.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 02:57:55 -0800 (PST)
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
Subject: [PATCH v3 4/6] ASoC: qdsp6: q6apm-dai: set correct period and buffer alignment.
Date: Tue,  4 Mar 2025 10:57:21 +0000
Message-Id: <20250304105723.10579-5-srinivas.kandagatla@linaro.org>
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

DSP expects the buffers to be aligned to 64 bytes. Having a 32 byte
alignment can result in fast playback or capture in some configurations.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 90cb24947f31..bb761ee0164b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -385,13 +385,13 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 		}
 	}
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 32);
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES, 64);
 	if (ret < 0) {
 		dev_err(dev, "constraint for period bytes step ret = %d\n", ret);
 		goto err;
 	}
 
-	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 32);
+	ret = snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 64);
 	if (ret < 0) {
 		dev_err(dev, "constraint for buffer bytes step ret = %d\n", ret);
 		goto err;
-- 
2.39.5


