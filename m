Return-Path: <linux-arm-msm+bounces-48737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BF2A3E0D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 602CE703750
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 16:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BAB212B22;
	Thu, 20 Feb 2025 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DNWw/fR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89A620DD47
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 16:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740068968; cv=none; b=AWJeBRyBLNQbCJz3KcqMRCE9dOCrC5hcE5kOu0givmVcOEntBJA7AfkD+TVfxlL9U22l3tyAcKVfa5um+mUICOIsXU4OamDjYxSnEGBDACdrVncyDRW5+91zcUB1X8Yz+5iSF8P/slz8N9QRLRp9axe0wiLKN/vUMG/zTgS+nXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740068968; c=relaxed/simple;
	bh=Dr8Rk5o8L7NeOZgA3IT4ksHpO16HjBDqWkL7REEjaPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SEkg0rjt7XG/Nw44MD2PEkjqHi6YGw4YOXghrMPiAKg/aQ8u6d7XJ8TBS8N7tM2dEJw5ndFSSLCl3FkBG9MHym0oYXlyQ66g5KLrEFNAGFUuFk1klItS7yPWwNivAWFJ/zb71ffd9M465ibV/3IbUvYPNdWNZwtKuSdultolvns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DNWw/fR9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38f6287649eso871793f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 08:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740068965; x=1740673765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wWH0fM1NieugYkKcNBWP1cXDL8AX1zdkriiAZTiM3tI=;
        b=DNWw/fR9h7YMhL+7ngqVD5BHacs5CcUYj2W4UrzJHYdPugU8YEElWgIHNKVzmtNn41
         kTA9KLkP4LA7wRY1frSI1O3Q4qAwVvl4orM9fdjZG83hk0lQz64a9xG7MnklpHoXrhuD
         nnEbs6YmtMEYp8+GWYQCJAtAEjS/isHpvcCpxsKDHrnb7+gJV1g+o3yvPsM/GYna+Iuu
         DpMX+dj2QU+jvKDshaWTu9P51dhtbs8ijStVrH1ihcavm1VYKJG/sTV7zJEUyAzj35rh
         P8QOSQuRUkgeNYzgL7Nue0D6sT99oCRfI2rpWsmW3Zrrg/odAXTw58AF1d0u+XfRcd9T
         mFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740068965; x=1740673765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wWH0fM1NieugYkKcNBWP1cXDL8AX1zdkriiAZTiM3tI=;
        b=MFCW++88Uf6EZ17+Isd0VpBEwvQmnXa13siSyC9DcWGuodCayT6BG0XksIrUluByUo
         BxoCo/G9+Mg27ewY47xW6qmNfsgOCqp0N6c+C49MVghKjPazGKWxqe/a5sTVuwWWwohw
         8E+t/Hn5bGNhBxHM5WTSbV4uW3HwXPixP+pR3cEEtLl78tRrO/nfhmeSv2aHW2GuapQm
         Q9SBdErKgnuTY5zDSU9VHlpvuOGUw+fCqqMyq3Rra6nJez26aS7mBZYRBRbX2f5bV1Pa
         sdc8n+4mnNbADxQXKDmp2iIb8TShObfAk3jx0fbFFHA8u8jhavAXpdDHwUep5ZDJCkQQ
         y8xA==
X-Forwarded-Encrypted: i=1; AJvYcCUVEd+HS2LWMzoTXySXMU/Zin/viG28OCq3Mw823x1QORgLjTflXsPCfQW5jm+7gLuZvq0Hny1EA4JHS1U4@vger.kernel.org
X-Gm-Message-State: AOJu0YxSdKTLtShB1Ttvpkj8lhL693h246R98Iey1fV5ezo1+SfToJrO
	MeE2rS4cJO7zhs4ShtdNZjtQqYbg7d9rCeNncQf9Rmuu0IuGIl2MvPxMdjH6UPk=
X-Gm-Gg: ASbGnctA2og5m2y2DcQFZFW2W3Er+VrPsvgpDeBuGHY19z3uaA7fh7tng5F3abF1umn
	F0v4+GOXS8+JEfs1sMtsZ9hfo1hr/r8eoQAVyzCUbFaZNXQlUJxGBP11D4gy52mXkJ0UvlgvIO/
	iA9CMrym/FqbXAngIRW+XeyOcEkmZHkmNitas3Eo71a7Woooh0NXN/FX1N7/YIg0kl5J75H7Mud
	RpkVzxUyYCXkops/0ryrHUJMmVK9mrvI1z4JdmA7vSHl1ohamMHES98Lti/VxoA5+oDVbN6bN/7
	ezV0gWsZRmh1HUfuBHZXgZysMiJMjEdRbvrbIpHN
X-Google-Smtp-Source: AGHT+IHdOwtU9xb0WEouusC4CcaJUMhnzC1yLBW1Y1gMidwn7Gg10mbC9aK40VRIc2odT8xSgLfmSw==
X-Received: by 2002:a5d:4641:0:b0:38d:e304:7470 with SMTP id ffacd0b85a97d-38f33f44f3emr20248336f8f.25.1740068965221;
        Thu, 20 Feb 2025 08:29:25 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258f5fabsm20813753f8f.45.2025.02.20.08.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 08:29:23 -0800 (PST)
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
Subject: [PATCH v2 3/5] ASoC: q6apm-dai: make use of q6apm_get_hw_pointer
Date: Thu, 20 Feb 2025 16:28:45 +0000
Message-Id: <20250220162847.11994-4-srinivas.kandagatla@linaro.org>
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

With the existing code, the buffer position is only reset in pointer
callback, which leaves the possiblity of it going over the size of
buffer size and reporting incorrect position to userspace.

Without this patch, its possible to see errors like:
snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536
snd-x1e80100 sound: invalid position: pcmC0D0p:0, pos = 12288, buffer size = 12288, period size = 1536

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index eba51e88a297..7466fe0c661a 100644
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
@@ -450,16 +441,12 @@ static snd_pcm_uframes_t q6apm_dai_pointer(struct snd_soc_component *component,
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
@@ -674,8 +661,6 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
 	prtd->pcm_size = runtime->fragments * runtime->fragment_size;
 	prtd->bits_per_sample = 16;
 
-	prtd->pos = 0;
-
 	if (prtd->next_track != true) {
 		memcpy(&prtd->codec, codec, sizeof(*codec));
 
-- 
2.39.5


