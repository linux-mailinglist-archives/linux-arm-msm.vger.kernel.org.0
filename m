Return-Path: <linux-arm-msm+bounces-46742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5D1A25A13
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 13:54:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AA7C3AA039
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 12:53:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3F91FECD2;
	Mon,  3 Feb 2025 12:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dI9+6Oxo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6162046A5
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 12:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738586993; cv=none; b=oIVIiUSvcductE+FaWeh61oTHGxnjlyBxs47K7tDx6drTfsF9Jf8rzsYsm1MuU8lIULAA/gux4ML2X9Msi6OnunsCMga7EDBNgGBv+MEJlnMqh4hXTU9ZwTH+HwucdSmmv9irb5n0uJveKYsaIlZihDTbZaqmJQD1i9jEPO3emw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738586993; c=relaxed/simple;
	bh=nUkpU5HdizpxTWr8YxBaJkQkZC9L5Iy1O5dsyOZHQtY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ecs3zZxyD4ZMZ0HdpejrlBhisauUR3PNLaSpq6rBQZ/fY/n/IuARyYpR+ZAoZkBr8qghI/T8FnySWmjQ4oTrD97pb4CTXNJLPHyezvkqG/8PlGTKekGlKNkd2KL2Il1Dql0nLeB3ekPDJaKKNEQOgYPdAf0/ke502EWgpfgWUPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dI9+6Oxo; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so2264793f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 04:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738586989; x=1739191789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ywGUrOp/w8H6RCppdbR3Agfd+wqSLlU6tOUovBhQqng=;
        b=dI9+6OxokdsnoihcAOg5SVnwAgJdhRbr4yoY2vKt1NmMyHrloRebNjBS7z/4wG2e6y
         KwDneDXWijRuWnYy+MUgYtJ2TSV2GjgG1xvBiOqr1Th/9bP3STpj+Hy/hIDc1txIffFW
         aObscZVLtL7P7gXtppoDUkY0hNtxTwP0nkLaluQ8BitU0h7X52c+mUnpXKxJc3Bt5PLP
         OLaWuVUYCUzv7IEvDD1Udjp3hYy2gYjCrVXHogEXPVXlpAKQ/lCi+bIm4LDFFrHLdHbs
         NJxP7mOKjkwa3WeoSMQueYVetWzBzZ5XBJGKZ8jiaJIy+xLzw0Oa5fxKdf8P6ULm0Ll/
         V7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738586989; x=1739191789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ywGUrOp/w8H6RCppdbR3Agfd+wqSLlU6tOUovBhQqng=;
        b=Uk71BX7Pr4iq6EZELUukvuH6Wzq5Q6EL8igOizFiVCM92mwtlm6ApHH4N5jWMLFrVw
         x0gPLMeDWFZDOgcCf0dyx9sCzYtt5LxEN/xUdfxRth3kbemHtTALbpRUB414BTFpM13E
         lqlFQQgltewK5YDyvb80fsc7o7Twsv3Rgqt3+wcoXaok3zrVryGQwPxfc22SVDw4gAxf
         CRuBFOe0maHY3uchT0kuV9ggGNIMFJUNm0VYCG+sBlsobItkPWxAkpdKxtK5IIcUOA87
         kc1fekqsrsVHHwMSSbWaDnRkQfz/lbfd4T3ZF23BtWlRW9bHJK1mrtbK+6d9rRYdxFf6
         qy2w==
X-Forwarded-Encrypted: i=1; AJvYcCWPf3krY6YZZzFW5Ndw2GlZYxe/7niFc62hwR7uoKqqVkNtVwIY+vdhGBHWE8W4r4GusNC84aYR9opXXstt@vger.kernel.org
X-Gm-Message-State: AOJu0YznAIGZiXeqR7CilI7tzy2Ao0XLvH9uNsjNgmgXnc8uBkCr/U2V
	Wn6AhlSORW8E7oCGdyx+ninFZjcUtC0wWG/ARNkuy4yHHT9/siDgCNKC7z6p7Ig=
X-Gm-Gg: ASbGncvD09xVKJ1PYmbzZQzsqsBDjl1liHXo0LnZKRxxk7/bR9E9OZXmW6G7Lxq4sE2
	XbSFdFCMXd6egg0ZgH6wMZtMI6LC00KKd0j0jg59TdRjnm0t0QNJ0ysLZnuyJI28WZYP8QpvIfN
	//5LK1suITMvRMzPIocZFFf9w/Xz3o9/K83CboEaH/vuDox6+oRPIcq7Ht6Y59rToTQCllT9H46
	ZahKZ0C19T0QGT7FzzK+LhEYm+Vtw7X6Y+tFOWhXiSsviQnXoAaRWRaO5aiEV8NfF+rjiOSWFGq
	lc4nvt8o39bK9Ka1wgUMmsx8ZndFs9vmocwGBd3T
X-Google-Smtp-Source: AGHT+IFcRPGPDmD48EIK6elAaZu2Zk8DxQERIr9dnmWyB0Uuf10XrVS2TvtkTaG7Mc0/1xomxVn61g==
X-Received: by 2002:adf:f504:0:b0:38b:e109:1e0d with SMTP id ffacd0b85a97d-38c520b6629mr14361510f8f.49.1738586989345;
        Mon, 03 Feb 2025 04:49:49 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2f17dsm189411645e9.23.2025.02.03.04.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:49:48 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	krzysztof.kozlowski@linaro.org,
	pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] ASoC: q6apm-dai: schedule all the periods before we start streaming
Date: Mon,  3 Feb 2025 12:49:45 +0000
Message-Id: <20250203124945.11406-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

With the existing code, we are only setting up one period at a time, in a
ping-pong buffer style. This tiggers lot of underruns in the dsp
leading to jitter noise during audio playback.

Fix this by scheduling all the periods, this will ensure that the dsp
has enough buffer feed and ultimatley fixing the underruns and audio
distortion.

Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index c9404b5934c7..148c3fb77168 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -299,15 +299,17 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
-	int ret = 0;
+	int ret = 0, i;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		 /* start writing buffers for playback only as we already queued capture buffers */
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
-			ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			for (i = 0; i < runtime->periods; i++)
+				ret = q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, 0);
+		}
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 		/* TODO support be handled via SoftPause Module */
-- 
2.39.5


