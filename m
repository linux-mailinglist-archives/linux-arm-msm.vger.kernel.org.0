Return-Path: <linux-arm-msm+bounces-78789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 611F2C098FC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 18:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC48C4F0CAC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Oct 2025 16:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1192641C6;
	Sat, 25 Oct 2025 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t0F76UVW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0271313AD3F;
	Sat, 25 Oct 2025 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409283; cv=none; b=iWYuw7hGDvfzNF/IJ1X6KvXCcMAZGTqdbWXVz258HJsuLDNMI3Yk5AJSbZXLljlpBtyl7IiWDrJ8rEsJPjqettEbZB4aC0nGn+6LTNx7zvDsL1YGyDQEyvsFlsj2kJCVqpmtsfBsPAGiOH9v2Cis07HLkZyxxABhXDLz77jfULY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409283; c=relaxed/simple;
	bh=EVEwCBOHwD3E+CFJT3PvAv4ES+hDr4wbikh8kpOQngo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YomJ7t+jvzoHIxATF2nDN+HpxKikX/dLjEmxTSGHO+ktUmAibVwUqz2IVg2O0HRoxf4UJxsdIhTtnFlKok96JoOkjFkDVr9XWKmrAFwpV/4y29M01UVffmjZ0yJwjGVOHeGzHZ36c5DW5L/mnG2vg9slg5EdPLtdLYy2P4n0agw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t0F76UVW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E368AC19423;
	Sat, 25 Oct 2025 16:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409282;
	bh=EVEwCBOHwD3E+CFJT3PvAv4ES+hDr4wbikh8kpOQngo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t0F76UVWv+rhbtiYRr+ZTQREfpms4CYWPTLMRToUotizaUW93I1oedY+A1/BrJtSl
	 4GOd3FaxEajogMhzyylHHEWxH+CeViDMUvCbADFZQ2XE8Vrmrt8si4FGRY5NsREbGb
	 v6lxfCXVyylhAYP3XkWN9dhggEKrx6haNUCiYFOc6ZBl59dQY/qypCZFH8BvmZqwcy
	 7b6j4cvNK1uGAF/9EDbDMQRsWt9llL2ElH4/VjJjMiNWOd1GHHlV0TU5udISLQedcm
	 sHvcAfzHDis7lYJP3QbEgFj+iAJd9cgx+ZpSrLGkTut9F8IVSHQtFUCE9z8H3txW2A
	 iOG9k5h3bi5qw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	srini@kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.1] ASoC: qcom: sc8280xp: explicitly set S16LE format in sc8280xp_be_hw_params_fixup()
Date: Sat, 25 Oct 2025 11:58:12 -0400
Message-ID: <20251025160905.3857885-261-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Alexey Klimov <alexey.klimov@linaro.org>

[ Upstream commit 9565c9d53c5b440f0dde6fa731a99c1b14d879d2 ]

Setting format to s16le is required for compressed playback on compatible
soundcards.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
Link: https://patch.msgid.link/20250911154340.2798304-1-alexey.klimov@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES – forcing S16LE in the backend fixup is a necessary bug fix and safe
to carry into stable.

- `sc8280xp_be_hw_params_fixup()` now applies `snd_mask_set_format(fmt,
  SNDRV_PCM_FORMAT_S16_LE)` (sound/soc/qcom/sc8280xp.c:92-101) and
  includes the proper header to access that helper
  (sound/soc/qcom/sc8280xp.c:10). Without this restriction the BE
  inherits whatever format the FE negotiated (often S32_LE), so the CDC
  DMA path tries to run at the wrong width.
- The hardware side really needs the negotiated width to be 16-bit: the
  Q6 backend programs `cfg->bit_width = params_width(params);` before
  starting the CDC DMA port (sound/soc/qcom/qdsp6/q6afe-dai.c:364-366).
  When the format stays at 32‑bit the DSP refuses to start compressed-
  playback streams, which is the user-visible failure cited in the
  commit message.
- Other Qualcomm soundwire machine drivers already lock their BE formats
  to S16LE (e.g. sound/soc/qcom/sm8250.c:62-71), so this change simply
  brings sc8280xp into line with established practice and with the
  firmware expectations of the WCD/WSA codecs on this platform.
- The patch is tiny, contained to the machine driver, and has no
  architectural fallout. It fixes a real regression (compressed playback
  breaking on supported boards) and does not alter the channel/rate
  handling beyond what was already enforced, so the regression risk is
  minimal.

Given the clear user impact, alignment with existing platforms, and the
low risk of the change, it should be backported to stable kernels that
carry the sc8280xp machine driver.

 sound/soc/qcom/sc8280xp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 6847ae4acbd18..78e327bc2f077 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -7,6 +7,7 @@
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
+#include <sound/pcm_params.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/jack.h>
 #include <linux/input-event-codes.h>
@@ -86,8 +87,10 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 					SNDRV_PCM_HW_PARAM_RATE);
 	struct snd_interval *channels = hw_param_interval(params,
 					SNDRV_PCM_HW_PARAM_CHANNELS);
+	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
 
 	rate->min = rate->max = 48000;
+	snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S16_LE);
 	channels->min = 2;
 	channels->max = 2;
 	switch (cpu_dai->id) {
-- 
2.51.0


