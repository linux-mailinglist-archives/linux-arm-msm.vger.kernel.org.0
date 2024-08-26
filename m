Return-Path: <linux-arm-msm+bounces-29495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF87B95F352
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 15:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A324C1F22129
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 13:55:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA0F18732F;
	Mon, 26 Aug 2024 13:55:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from forward203d.mail.yandex.net (forward203d.mail.yandex.net [178.154.239.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E58F3D71;
	Mon, 26 Aug 2024 13:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724680510; cv=none; b=AMyEmqwgqtTfLtFJoREZhZfRp+iSMbJfyBKceHPmEn+i1qVH6RXQ3b/KRuSWo3EhZl94KpYYtcoWyrRhW9vK2VKxA01Uih71q1sHOUstSFsEb4Cw2S4xwb4n/0Ww0WLmgIbgmBQZy/sbAOtetkowfIKOa+Tud41s4Vw9o4hA18A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724680510; c=relaxed/simple;
	bh=C42m+jPwh32KPCsnO0oyfF4dYvxrQhak5pCgtDH4W8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEbfzSun05qYbIFhyyAoH7YxfRlnZoHdPR4224+GpgAP5uzO+wlGv+jVy9dSqEG/889+jvPtoy9fB7iG8+/OBZFfw1t6Mi1FXM36c96FrVF9fDayiAoPf2prbqlL2s7OV4lZkalp7ogpgHTmfAOg7LwBz7RYNVQKagFDwnmZwnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz; spf=none smtp.mailfrom=travitia.xyz; arc=none smtp.client-ip=178.154.239.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=travitia.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=travitia.xyz
Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d103])
	by forward203d.mail.yandex.net (Yandex) with ESMTPS id 4F08862BFD;
	Mon, 26 Aug 2024 16:49:48 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:24a4:0:640:473f:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id A329760024;
	Mon, 26 Aug 2024 16:49:40 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id UnTqJJ0oEKo0-cU9hcZFx;
	Mon, 26 Aug 2024 16:49:39 +0300
X-Yandex-Fwd: 1
Authentication-Results: mail-nwsmtp-smtp-production-main-35.klg.yp-c.yandex.net; dkim=pass
From: Jens Reidel <adrian@travitia.xyz>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@mainlining.org,
	Jens Reidel <adrian@travitia.xyz>
Subject: [PATCH 1/1] ASoC: qcom: sm8250: enable primary mi2s
Date: Mon, 26 Aug 2024 15:49:20 +0200
Message-ID: <20240826134920.55148-2-adrian@travitia.xyz>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240826134920.55148-1-adrian@travitia.xyz>
References: <20240826134920.55148-1-adrian@travitia.xyz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using primary mi2s on sm8250-compatible SoCs, the correct clock
needs to get enabled to be able to use the mi2s interface.

Signed-off-by: Jens Reidel <adrian@travitia.xyz>
---
 sound/soc/qcom/sm8250.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a15dafb99b33..274bab28209a 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -55,6 +55,14 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX:
+		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, fmt);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	case TERTIARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
 		snd_soc_dai_set_sysclk(cpu_dai,
-- 
2.46.0


