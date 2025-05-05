Return-Path: <linux-arm-msm+bounces-56859-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 40915AAB0D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 05:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57F107B30EF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 03:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0AB31CA24;
	Tue,  6 May 2025 00:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMU3fKyX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE94D35B95B;
	Mon,  5 May 2025 22:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485103; cv=none; b=QSIl2cDbLFlydf8obRMda7Jz4c3HzbR7MNfMTHSJOaEhevjxwAu4tmlqzEViwg+LwSpL51ZFCKKh9fkiRX2oGQhT+uI5NIIIo0TcNxRzD8SW9seQfTNzvzBbT3oQ/hyZFCN/WTCwZkjomxbL22dlYVO9iaSuGmKjA0I4TF7MwSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485103; c=relaxed/simple;
	bh=ZjH8N2oYszvEYvkkzBImYYwzxEmlFUSz8FVQRcb7JiA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JNv4z97UW4QSVcgripCyb4rpN6EwqGk4EUdSJM6VJe6N20ng0HpshuCsipkav/x1/LjybgPpciaFy+vtdIstW6h9I6rbsZrHtdRzJsS4sW2WvB1PTpMW6NJIhurnffwltOPxAodSq6h7bwh3bkqbKtRA0PBgz/NN2KRT/fWZJRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMU3fKyX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 739E6C4CEFF;
	Mon,  5 May 2025 22:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485102;
	bh=ZjH8N2oYszvEYvkkzBImYYwzxEmlFUSz8FVQRcb7JiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nMU3fKyXNaxggMVgNLaZJT2BbIHoLggtObKhHDvFwCtDvAVAW9hPzKFWMTOBjro+8
	 1EtXtbjRtOMxfZiaoPwGZoKA/ha9ngD7Ws7YNOXUBMb+TelJPoMVZTr15/Lv1GvlcF
	 Kr4MAcp1yc2EHYfE72+2eT4GszPe03bhezRupnEMeRPzjKrLCZ+EYUUSLYLuRxNKIX
	 +ZgX9xRivbfgNEveqmgv/KLr1cfFCFE0M62mxzIwd92AnUIdIhFIlW1e2A6cEBWrYl
	 LHC5t5LgAMc0BywmObXWeNuef+UUQwRdwyCATBHmPb81HuMIzsc8/T7QsvFMXp8mzh
	 NwWJ0RAwqICmg==
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
Subject: [PATCH AUTOSEL 6.12 162/486] ASoC: qcom: sm8250: explicitly set format in sm8250_be_hw_params_fixup()
Date: Mon,  5 May 2025 18:33:58 -0400
Message-Id: <20250505223922.2682012-162-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index 19adadedc88a2..1001fd3213803 100644
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


