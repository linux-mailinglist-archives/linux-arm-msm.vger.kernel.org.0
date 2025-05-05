Return-Path: <linux-arm-msm+bounces-56832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36245AAA2B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 01:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CBA9F16E8B6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 23:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA752E62B5;
	Mon,  5 May 2025 22:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZIyPXEOi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA3F2E62B0;
	Mon,  5 May 2025 22:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483756; cv=none; b=qEZ+U+ixSsAPU8Iv/yW4GarQW1BhzPZsZS1trxsytwFl6nLZm3FgPm2Zt+5srfU3UGTSs76NLSc4gr6BFim+KEHMHEhtv6ElPDQxaAYhuoAXOBy14Dx9GRAcRvK0W36lGSbjLdx+DZ265CqUwN+SynbnIJomKk8uceMDjDkHeAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483756; c=relaxed/simple;
	bh=OL6KSBqDQC6bdyHVg2GZ43UeOGMOEmczhtUq575JHOw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XufJEE6QTjKMSFu8likOg+YzUkiKeD68HnHBjJJPIH3g1DpENMb+8O6xGOoJfxVL0egkPDOaL7CvmOhHPaavY15vAEVshwJ0HpMSSZF8mtXq90lpipKitdH+FkFwa54TZw4x2OybdGyxIUcIPkJ7/BosqCM3gNrWNFFchJnbczM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZIyPXEOi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD658C4CEEE;
	Mon,  5 May 2025 22:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483756;
	bh=OL6KSBqDQC6bdyHVg2GZ43UeOGMOEmczhtUq575JHOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZIyPXEOi9oZ9mjYDv9C7LCxM+/p8kz/awK8yJpkXFAUOiZYmYVZ/JpYadJlRsWgIi
	 vdjrvJqmRQPEWdqKFARAQpfZRU97eN1k4NvSbM2HJ8yQEHoIeke1oSXW8qCfld7GNl
	 c70j6q9fn/gKGUFEx1jt5o0Q/MYXYjAuyAbRNKQqH9KyUbSvYWbwyHSmJtdqdjZTGW
	 clAGUO2RbhSowfIUhC4rQja5kTjI1MIVUorb6W9dzAJeU9f+B4FmEHP7kwm4MWyeod
	 oTLWwtDmTJ/iFW8pFSt583KWnJTDzOZHBMHtzkS9nCyhF6GNS3v838V2/NVA6j1+oE
	 /bnDBDExlfLmA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srini@kernel.org,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 201/642] ASoC: qcom: sm8250: explicitly set format in sm8250_be_hw_params_fixup()
Date: Mon,  5 May 2025 18:06:57 -0400
Message-Id: <20250505221419.2672473-201-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Alexey Klimov <alexey.klimov@linaro.org>

[ Upstream commit 89be3c15a58b2ccf31e969223c8ac93ca8932d81 ]

Setting format to s16le is required for compressed playback on compatible
soundcards.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Link: https://patch.msgid.link/20250228161430.373961-1-alexey.klimov@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/qcom/sm8250.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 45e0c33fc3f37..9039107972e2b 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -7,6 +7,7 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
@@ -39,9 +40,11 @@ static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
 	rate->min = rate->max = 48000;
 	channels->min = channels->max = 2;
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
 
 	return 0;
 }
-- 
2.39.5


