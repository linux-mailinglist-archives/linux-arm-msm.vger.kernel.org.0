Return-Path: <linux-arm-msm+bounces-33770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C35997C1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 07:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A3C41F24AFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 05:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F1719DF77;
	Thu, 10 Oct 2024 05:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YyOlj596"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0CA5A7AA
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 05:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728536700; cv=none; b=LMKmra/awSaE+AAQtNOyuV9Wa1YsinVXrEECtYdLswUbOSnuLd7Q+TLNxsUvAnAOGksxfFjHukMSuQ04rMLyTGM2oAu1Yn2DJ56b8pZjcQGLgLFl9z1LY9D2ZUDZSAcxJ6W57udyEpHxZ6Z0a5GYHLuc5fvG+OdEy5LEEdsdYUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728536700; c=relaxed/simple;
	bh=GfiDKfx5a1AjhcyHuiuXq8lE21gaNSy3lluDclyQ3oM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D/UCWWqdZog/EYIHQeZOrP0N1TU0haKUfMO3Qeemzzp4zQwNUQmhp1Rknam30PNjoPblVP1uujX3p3hYjEbpcpkiEypW9SiwBtVtY/q85x0KEC3LoI5X72YwWvz3XUVQh2u1j7sT9om7YJBcgZbqvV5GNw22bone8YeOiBcKkdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YyOlj596; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-431157a490eso809645e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 22:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728536695; x=1729141495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jbc2uR+ePxfXp2ltY2VNtmdr1Yv+lwKP50Ov4eu113k=;
        b=YyOlj596fkHsTpHLguS+4+5LV6ldb2pqaCLAOavIfc4i1K0ramw/9aWO/nIs9JMw/W
         HkhAzwL6HZNLn05+gZrXBeuuoETqJG/wHbPF4hIYLF5I6JJ+t6JjoB1P4dJUDMBC1RWl
         VSgK8OvWlMZX3mjCLliDCo5SGQ3NX4BuMUehm7xlIfW3avD2uy5SE3KtMfndyYGF16Nn
         sDkV2aTcDiKGkVuLsybGq20EIELipQUneu5eML099r4ed4p8rwJV7BjuSrQsk7Ql7D5F
         PH27fZy+ZKGFF6N2aJ7DjRUa+OdhALsaS5YIxDj/4JtmfLiFD22f6TmqHSRKpYTLOGQB
         tZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728536695; x=1729141495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbc2uR+ePxfXp2ltY2VNtmdr1Yv+lwKP50Ov4eu113k=;
        b=WYGYWitcnPEYAwwm57EkwVNyRJB51NNL8Iz/Xj6mZhf0JrRYlwoSKcK2HsGNxkYfU1
         W0q8I0GQIPO6pDt+K1XdQUBRg3RgnDACamX+IlfPs8kxj2oxRVPs4rPMfOtcuo0sJseD
         XiPBjNTdz/PLeLoEIP81IQozUzCAPca0r0HaAuKkgTIhao66KaYh3uC70SWxHtfv6YQo
         HUkAuJC0Ubw6YYYuN0LDgFzO3ZGnoNfCVEo25elPBPOAQnH+1Y0/UZNclT3IEOL8hQ8c
         /95IdFHaWJxNn2iCmb2zZMhi9KkXW+5DaTOqLv2nJnu6W2p4Ii3giGf4Jm72jfkG5zWj
         dPSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnuBwtgEh6ssG12SrjlFlxTmw5u6PWfyolh2Via9+ExlwPAJ+CiXPoQ+gb+iAnGA26ov3DQjyMkyScRHM3@vger.kernel.org
X-Gm-Message-State: AOJu0YxCEnwUfDsFaBcr+Y8kX0Y9RdNX5GXAqjGILlv2O167uZoj848R
	h4BcyuCA3K8a3gZ4ikgAlaHX8hSCN/sPL/UZ3W+f7C+5F2LyMbLNsnGvE+zmCaddYbVFUR0Oe+K
	Q
X-Google-Smtp-Source: AGHT+IHjOO5/3OmweNS045RjhKStWrN5/D4V4RM46O2JiZ2w6pXTyi2bzfZfpCB2Jcrirhn2c062Yw==
X-Received: by 2002:a05:600c:4448:b0:430:52ec:1e2a with SMTP id 5b1f17b1804b1-430d70a6aeemr19085955e9.7.1728536695196;
        Wed, 09 Oct 2024 22:04:55 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4311830612csm4526865e9.25.2024.10.09.22.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 22:04:53 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: qcom: sm8250: correct typo in shutdown function name
Date: Thu, 10 Oct 2024 07:04:51 +0200
Message-ID: <20241010050451.11913-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function is for sm8250, so fix the odd number in "sm2450" prefix for
soc ops shutdown callback.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/sm8250.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 19adadedc88a..91e9bba192c0 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -78,7 +78,7 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	return qcom_snd_sdw_startup(substream);
 }
 
-static void sm2450_snd_shutdown(struct snd_pcm_substream *substream)
+static void sm8250_snd_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -123,7 +123,7 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 
 static const struct snd_soc_ops sm8250_be_ops = {
 	.startup = sm8250_snd_startup,
-	.shutdown = sm2450_snd_shutdown,
+	.shutdown = sm8250_snd_shutdown,
 	.hw_params = sm8250_snd_hw_params,
 	.hw_free = sm8250_snd_hw_free,
 	.prepare = sm8250_snd_prepare,
-- 
2.43.0


