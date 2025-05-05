Return-Path: <linux-arm-msm+bounces-56855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B3AAAAC8B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 04:18:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8F65188656F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 02:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9722FE09A;
	Mon,  5 May 2025 23:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WV+WtDM9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F5E380967;
	Mon,  5 May 2025 23:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486907; cv=none; b=LXICbEptgbhVsg28iE5LorENe+xuzGEzwdiIgl8H98fmf3jVFCbWYLUeQBdKPSY5S5Stg+WH3yqA8RY2B3soNdX0aB/B0Cq3PHDL226obJ+G4BZW+ruKF/8AVuTryzucSpEdoQ/Wdwta0pv8c9dbboZImFkYWflafMEAA1RWjEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486907; c=relaxed/simple;
	bh=rvPRKy3rLzjg/YgOXJYy8BWkFpMnDeKRfn99mCLAJWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UM/l8YSIA9+SDDaNKWXj3TK1e2zH83qHo7QPXYLPVQ6G/bKVbHp/D/SPG8mow51xtAaKrQbIO+BaCLbqyY5QVsAtsxbJaGYvDShqbnA/Stb1bMzFAfTunpbEdKOhYKhbL0v3OdcosBdXGAn9gbwRpCKWFiPNS4kOr1iMG2z3Isc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WV+WtDM9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B34A3C4CEE4;
	Mon,  5 May 2025 23:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486906;
	bh=rvPRKy3rLzjg/YgOXJYy8BWkFpMnDeKRfn99mCLAJWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WV+WtDM9V6nYJh1LjKQGc48UCnvSeLwbrZSbRZO0VHZfAAkph0uYjzkaA5CErmAR7
	 eCFu6MBDFxpMsRqEy7Buh35pQChEyvOpzTFBpJhLJRJ30SYOKAOqH5NBqyKc4ZPAkF
	 O4FHfxEUCgDCrA8HiqEuNJPaaSRl0GbCbJ59xSM8WZemOzOge920VHEeoU/Z5tIUSl
	 l4WWagR0YMT+uxC8kqRZb3a5a3F/NZ1DhiZFJZj/UDmh+qJICD0DzPNrkCywFxDHRu
	 JRyQnfe+4HDPexKTnnulT7DnXmTehJFo4qnFGkOBap/TGCxNvbQ+xsKk7FO4QzkWr+
	 2TGtvJOs8pt3g==
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
Subject: [PATCH AUTOSEL 5.15 053/153] ASoC: qcom: sm8250: explicitly set format in sm8250_be_hw_params_fixup()
Date: Mon,  5 May 2025 19:11:40 -0400
Message-Id: <20250505231320.2695319-53-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505231320.2695319-1-sashal@kernel.org>
References: <20250505231320.2695319-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.181
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
index a38a741ace379..34a6349754fb0 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -7,6 +7,7 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <linux/soundwire/sdw.h>
 #include "qdsp6/q6afe.h"
 #include "common.h"
@@ -27,9 +28,11 @@ static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
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


