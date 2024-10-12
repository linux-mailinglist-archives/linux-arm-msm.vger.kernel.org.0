Return-Path: <linux-arm-msm+bounces-34189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 302A199B2D8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 12:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3353B1C21395
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Oct 2024 10:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDC4152160;
	Sat, 12 Oct 2024 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K5/hcQvu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBC314F9F7
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Oct 2024 10:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728727878; cv=none; b=FZu1XHbaDK0B9+OKTUTxk8/Rqze12kCl2BvLs8jIMWd+3sfB36ED2R+exRX4NbnNxjJhVt848x82Dv4ZupQYvXN+jDU6fdc0eZzQ6sEK0tdl7aiG7giBV165q4KoaM3oNEx3UACanK5x28kVRixfsf/aUPX7g0GTAekl+ZblfSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728727878; c=relaxed/simple;
	bh=l+g7ZZNhOPkyAa9Dk/e5/JWOw85ZtEH+kE4rgPB/cPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I6cWrgDGxvblY51Q9cVTx1iJiNPrHxYw8lAqp8OMse/P6exsyp3w8SEdN34WWxAb5kY5tnRsWahX3uWfP61esakcMwBqU4Ydq3PsBm3PqOLlkfQnaTXidN+WGLij1EXnZmv0Qs2hSUghAt+Qxez2A8K/su4L/RRreWD8Vld0ZSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K5/hcQvu; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c940ac7ca2so429547a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Oct 2024 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728727875; x=1729332675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6e6wpy4k42n/aq7+kncSL6a1K05K8zISJjrIyP9jbEU=;
        b=K5/hcQvuyllzQwB8/+dgVPNx+bSqdBMHqjwndOELuddoJ3l+TLbIlWYm4lvXupnNY1
         oy1A6MdeXuBbCCHOOg1aSa3RjKt9bD0hkR3scXCi9//vvN5mot7FWZksYb12JUsvTb6v
         kHoCi82cDMuJPxAnBHM29HULFE+Xd0zsoYQtE5IrFRiaM+Fto/+ecjZPfeCnON9ES3FG
         z+gOh+JQ5CMBYJK19xGlVyFuRlLs1EmxmzjBr+Qpprid2tSQXcdMjGPid8tHNZFZ5zgl
         HT2BtSBq4/g8dyY8ZWRhzKsFJaBMLwoRnPZcv64t0PqCMLvyzRwNIpYjlZNrmrvbYsUe
         wUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728727875; x=1729332675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6e6wpy4k42n/aq7+kncSL6a1K05K8zISJjrIyP9jbEU=;
        b=RxwzpT4WweEaNX0cWO/+VsSoUYp3eo5WO9iH9R89OetMeBrbrE/VPNu2aweVnePNm/
         0otj6FNoqX9TwMTL564zuikpIse139VgPYlpyeFGzoB3EJsFDHu6NLV0iKTiien9OP6p
         llzPafqRcQPsAumSiZQ4MiZwC19aPlzb4tqO4zBURAZFWZ8P3oLc4x4DrW2PXzuXOJGW
         ZmAZpgNYS8NXMsuKZD4jPHoUElKKStqoc8yxOiulprNuKLPd6IbuS+4x1313lSUWZihn
         yxfKO6vJsZMTLU7AWaMs0fDf8rjaILFU1/7GfIQx3bGISK7OwbpJ/f3pFziFND8J3a3V
         tAFA==
X-Forwarded-Encrypted: i=1; AJvYcCX5OYIPnu/OUQNXpg5j3FDIxDRqlfiBIRF4BGwqSaLfDKEhkxmOcQsQO+z9mk6b1YOYfX70aBEgBCbEErTE@vger.kernel.org
X-Gm-Message-State: AOJu0YxWooEfo21Wm1jUNdhHKZnOVQfbZk7vO1sZze3FXSvlmu8B3rg1
	WtAd+uwuU2NQhSCkIDyhMeL3giPT8RzBqAClxqlUPC4XAVqmukcGsthUrh75dBo=
X-Google-Smtp-Source: AGHT+IFZ+zSFFM+kAEHqjV12bdV/1nmPVCq1BXVd98k15pNtl3iqmXvxXbLVK3Eb4vJrDA7H1qMnhw==
X-Received: by 2002:a05:6402:2790:b0:5c9:3fd:2fb0 with SMTP id 4fb4d7f45d1cf-5c948cb2d72mr1410534a12.3.1728727875476;
        Sat, 12 Oct 2024 03:11:15 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c93711ab3asm2749539a12.30.2024.10.12.03.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Oct 2024 03:11:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Steev Klimaszewski <steev@kali.org>
Subject: [PATCH v2] ASoC: qcom: sc7280: Fix missing Soundwire runtime stream alloc
Date: Sat, 12 Oct 2024 12:11:08 +0200
Message-ID: <20241012101108.129476-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 15c7fab0e047 ("ASoC: qcom: Move Soundwire runtime stream alloc to
soundcards") moved the allocation of Soundwire stream runtime from the
Qualcomm Soundwire driver to each individual machine sound card driver,
except that it forgot to update SC7280 card.

Just like for other Qualcomm sound cards using Soundwire, the card
driver should allocate and release the runtime.  Otherwise sound
playback will result in a NULL pointer dereference or other effect of
uninitialized memory accesses (which was confirmed on SDM845 having
similar issue).

Cc: stable@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Steev Klimaszewski <steev@kali.org>
Fixes: 15c7fab0e047 ("ASoC: qcom: Move Soundwire runtime stream alloc to soundcards")
Link: https://lore.kernel.org/r/20241010054109.16938-1-krzysztof.kozlowski@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add missing 'select SND_SOC_QCOM_SDW' as reported by LKP
---
 sound/soc/qcom/Kconfig  |  1 +
 sound/soc/qcom/sc7280.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 3687b9db5ed4..ca7a30ebd26a 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -209,6 +209,7 @@ config SND_SOC_SC7280
 	tristate "SoC Machine driver for SC7280 boards"
 	depends on I2C && SOUNDWIRE
 	select SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_SDW
 	select SND_SOC_LPASS_SC7280
 	select SND_SOC_MAX98357A
 	select SND_SOC_WCD938X_SDW
diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index 207ac5da4dd4..230af8d7b205 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -23,6 +23,7 @@
 #include "common.h"
 #include "lpass.h"
 #include "qdsp6/q6afe.h"
+#include "sdw.h"
 
 #define DEFAULT_MCLK_RATE              19200000
 #define RT5682_PLL_FREQ (48000 * 512)
@@ -316,6 +317,7 @@ static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
 	struct snd_soc_card *card = rtd->card;
 	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
@@ -333,6 +335,9 @@ static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
 	default:
 		break;
 	}
+
+	data->sruntime[cpu_dai->id] = NULL;
+	sdw_release_stream(sruntime);
 }
 
 static int sc7280_snd_startup(struct snd_pcm_substream *substream)
@@ -347,6 +352,8 @@ static int sc7280_snd_startup(struct snd_pcm_substream *substream)
 	switch (cpu_dai->id) {
 	case MI2S_PRIMARY:
 		ret = sc7280_rt5682_init(rtd);
+		if (ret)
+			return ret;
 		break;
 	case SECONDARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
@@ -360,7 +367,8 @@ static int sc7280_snd_startup(struct snd_pcm_substream *substream)
 	default:
 		break;
 	}
-	return ret;
+
+	return qcom_snd_sdw_startup(substream);
 }
 
 static const struct snd_soc_ops sc7280_ops = {
-- 
2.43.0


