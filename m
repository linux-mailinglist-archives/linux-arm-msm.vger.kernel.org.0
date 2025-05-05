Return-Path: <linux-arm-msm+bounces-56850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D73B7AAAA9F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 03:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF7307A856E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 01:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C43E288C2A;
	Mon,  5 May 2025 23:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEl/eZdO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE3037644A;
	Mon,  5 May 2025 22:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485988; cv=none; b=Xosf46ckpCvlLxYo1lNc9ZfQHWNmg/fBBx4r0RC39SdyscPj2Fy6jvM0JMk9U2vwjj/HrHFKrBGnunu74LkZumORCYwTwEsRLVu9ohEIdumzBd4TenZiZYqRxaVoaCFGwJ0Ny2JcHhOliER741K0POq/aiuLaIyxFFUGk3lFcfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485988; c=relaxed/simple;
	bh=wRlgtUevqMElDfA1JrkyqCdvrsKyxqffpyjyC2gQpGs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jGtLp9W6XAmsSgk3z29IAXl+MFRVdUXjLHbb8qpdzyxCMxyo+e1AFTg5FX9TaNcoNdJQgO8cfOcMwKeX6zhSiBz9DMSv+JVoM7ByyIubQJ8NZAqMJSPwR5WzUrVWyls0N339F7VNloqFlICBENgjbIyCWcLH6vCOa4jiw4zRGZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEl/eZdO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BE0C4CEED;
	Mon,  5 May 2025 22:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485987;
	bh=wRlgtUevqMElDfA1JrkyqCdvrsKyxqffpyjyC2gQpGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pEl/eZdOch2KiUWW7Y0JkoNkYdPBHhfBV0h61jCipol8G40XdcJXAJi3xL9m+GmQc
	 sdxd732/zH+pyjQWIrmIDXQN3zBYmtvvRQZ29LOj0I83S90Uj0aa4VHYbOSFei8IKz
	 bMuhGUbHb9S3AhWeOb/ypf11Pk78ZwBH2oxdNc1eYJOFM4DdCQVu07jzrpE0Cme/0U
	 e3JR+Ffcn3+1K9GtOhOlz73+9eq3uVbz8tUv2v1mr/ZserFHbSSzhy3niGhSWEl/cs
	 xZNz1s8GKk3bvtpgxX2TTqsmtQlsVDO7SSxk5NIyXGXk4aHxiboJdr9wLAFEORCaCl
	 BSlaAec4CCRUw==
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
Subject: [PATCH AUTOSEL 6.6 098/294] ASoC: qcom: sm8250: explicitly set format in sm8250_be_hw_params_fixup()
Date: Mon,  5 May 2025 18:53:18 -0400
Message-Id: <20250505225634.2688578-98-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index 88a7169336d61..580eb20b0771a 100644
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


