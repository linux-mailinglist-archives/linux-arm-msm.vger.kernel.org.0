Return-Path: <linux-arm-msm+bounces-106199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DocII+o+2mYewMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 22:46:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBCA4E051A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 22:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 327563041387
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 20:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F883A4505;
	Wed,  6 May 2026 20:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="QdY+WYAI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8A43B0AC8
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 20:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100212; cv=none; b=mbdyQuBaKI/UHhlhUfluNeaJS77Rj7tVfgNPRrC3V8C3w3/h6/u3EfgZBIVzOtpNd6MF1rd3yJcwtesrNv0nig07jkalxs3R893WUx4gjVCBX2G1utjhECN7p9k8/ZQDQ4A1wx8seGEHIMZnJ1amkwhOkj4kgvWdEIFS77G6qIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100212; c=relaxed/simple;
	bh=edYLieIDPBhCD3StzZq9rRArw/5rQDHxmGyYGxgiUXY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U5ztz81BbgphkeIVCM98v/cLn3ylc0oVE02xE+Sc/vgygiDsGziO1j+6AO9j98cIwKHDIidKzx6DX62vi34mDyENLcWAE27X9LhjOTvKoKI6cBsrPuGVweB92vClH+TSxeP0N5RhPWwjLqLXJvps4FQN9m+CCOkexTsPRgQ8UJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=QdY+WYAI; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778100208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TGyIQHm1frgCjrMqtV3tvUoJBEcUKkCxoYR5gVevYVI=;
	b=QdY+WYAIggoFN5TdvYRR55g+BEhODBx9nokzd7jGBmmJdRGnqL7S1m77RBdbknDmlihh8n
	UiUbP+7jk7ofPx+He7D1D9USLax8RNtmDiYkjxZwNFIHxeU37cxyuW8r62hN5wsWG6vGpn
	ypURdLzjg5zvKKcPgxhlDMmT7w6iTCFdYaUjfAZqwBOB3ZdlP0ShAWE5/K+iK0OWz1Lbaa
	I9ctgckQFP48XuUGmh4B4dtM5we5D9SMbxyXLIQ91qZrQ1yZvs21g+CzkA4MlQn8i0vG+m
	02EngM3Mose9sF5O2Q99E/2BNtizcJK5xVH/PDwfIYMJUqXoPjQs3Q282EZpDA==
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Val Packett <val@packett.cool>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Bhushan Shah <bhushan.shah@machinesoul.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Antoine Bernard <zalnir@proton.me>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] ASoC: qcom: sm8250: shut down MI2S/TDM AFE port clocks
Date: Wed,  6 May 2026 17:33:06 -0300
Message-ID: <20260506204142.659778-6-val@packett.cool>
In-Reply-To: <20260506204142.659778-1-val@packett.cool>
References: <20260506204142.659778-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: CDBCA4E051A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106199-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,packett.cool:email,packett.cool:dkim,packett.cool:mid]

These port clocks were never being turned off, leading to increased
power consumption after a sound was played through any of these ports
for the first time. Use enable counters to disable the clocks in the
shutdown callback, similar to how it's done for sdm845.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/qcom/sm8250.c | 150 +++++++++++++++++++++++++++++++---------
 1 file changed, 119 insertions(+), 31 deletions(-)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index b64fd3970ba1..9f0f846a14bb 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -24,6 +24,7 @@ static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
 
 struct sm8250_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
+	uint32_t clk_count[AFE_PORT_MAX];
 	struct snd_soc_card *card;
 	struct snd_soc_jack jack;
 	struct snd_soc_jack usb_offload_jack;
@@ -163,83 +164,95 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	unsigned int fmt = SND_SOC_DAIFMT_BP_FP;
 	unsigned int codec_dai_fmt = SND_SOC_DAIFMT_BC_FC;
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	switch (cpu_dai->id) {
 	case PRIMARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
-		snd_soc_dai_set_sysclk(cpu_dai,
-			Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
-			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		if (++(data->clk_count[PRIMARY_MI2S_RX]) == 1)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
+				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case SECONDARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
-		snd_soc_dai_set_sysclk(cpu_dai,
-			Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
-			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		if (++(data->clk_count[SECONDARY_MI2S_RX]) == 1)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
+				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case TERTIARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
-		snd_soc_dai_set_sysclk(cpu_dai,
-			Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
-			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		if (++(data->clk_count[TERTIARY_MI2S_RX]) == 1)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
+				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case QUINARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
-		snd_soc_dai_set_sysclk(cpu_dai,
-			Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
-			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		if (++(data->clk_count[QUINARY_MI2S_RX]) == 1)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
+				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case SENARY_MI2S_RX:
 		codec_dai_fmt |= SND_SOC_DAIFMT_NB_NF | SND_SOC_DAIFMT_I2S;
-		snd_soc_dai_set_sysclk(cpu_dai,
-			Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
-			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		if (++(data->clk_count[SENARY_MI2S_RX]) == 1)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
+				MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case PRIMARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
-		snd_soc_dai_set_sysclk(cpu_dai,
-			Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
-			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		if (++(data->clk_count[PRIMARY_TDM_RX_0]) == 1)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
+				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case SECONDARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
-		snd_soc_dai_set_sysclk(cpu_dai,
-			Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
-			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		if (++(data->clk_count[SECONDARY_TDM_RX_0]) == 1)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
+				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case TERTIARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
-		snd_soc_dai_set_sysclk(cpu_dai,
-			Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
-			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		if (++(data->clk_count[TERTIARY_TDM_RX_0]) == 1)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
+				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case QUATERNARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
-		snd_soc_dai_set_sysclk(cpu_dai,
-			Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
-			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		if (++(data->clk_count[QUATERNARY_TDM_RX_0]) == 1)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
+				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	case QUINARY_TDM_RX_0:
 		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
-		snd_soc_dai_set_sysclk(cpu_dai,
-			Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
-			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		if (++(data->clk_count[QUINARY_TDM_RX_0]) == 1)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
+				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
 	default:
@@ -249,6 +262,81 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 	return qcom_snd_sdw_startup(substream);
 }
 
+static void sm8250_snd_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_card *card = rtd->card;
+	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX:
+		if (--(data->clk_count[PRIMARY_MI2S_RX]) == 0)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
+				0, SNDRV_PCM_STREAM_PLAYBACK);
+		break;
+	case SECONDARY_MI2S_RX:
+		if (--(data->clk_count[SECONDARY_MI2S_RX]) == 0)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT,
+				0, SNDRV_PCM_STREAM_PLAYBACK);
+		break;
+	case TERTIARY_MI2S_RX:
+		if (--(data->clk_count[TERTIARY_MI2S_RX]) == 0)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT,
+				0, SNDRV_PCM_STREAM_PLAYBACK);
+		break;
+	case QUINARY_MI2S_RX:
+		if (--(data->clk_count[QUINARY_MI2S_RX]) == 0)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT,
+				0, SNDRV_PCM_STREAM_PLAYBACK);
+		break;
+	case SENARY_MI2S_RX:
+		if (--(data->clk_count[SENARY_MI2S_RX]) == 0)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_SEN_MI2S_IBIT,
+				0, SNDRV_PCM_STREAM_PLAYBACK);
+		break;
+	case PRIMARY_TDM_RX_0:
+		if (--(data->clk_count[PRIMARY_TDM_RX_0]) == 0)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
+				0, SNDRV_PCM_STREAM_PLAYBACK);
+		break;
+	case SECONDARY_TDM_RX_0:
+		if (--(data->clk_count[SECONDARY_TDM_RX_0]) == 0)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
+				0, SNDRV_PCM_STREAM_PLAYBACK);
+		break;
+	case TERTIARY_TDM_RX_0:
+		if (--(data->clk_count[TERTIARY_TDM_RX_0]) == 0)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
+				0, SNDRV_PCM_STREAM_PLAYBACK);
+		break;
+	case QUATERNARY_TDM_RX_0:
+		if (--(data->clk_count[QUATERNARY_TDM_RX_0]) == 0)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
+				0, SNDRV_PCM_STREAM_PLAYBACK);
+		break;
+	case QUINARY_TDM_RX_0:
+		if (--(data->clk_count[QUINARY_TDM_RX_0]) == 0)
+			snd_soc_dai_set_sysclk(cpu_dai,
+				Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
+				0, SNDRV_PCM_STREAM_PLAYBACK);
+		break;
+	default:
+		break;
+	}
+
+	qcom_snd_sdw_shutdown(substream);
+}
+
 static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -287,7 +375,7 @@ static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
 
 static const struct snd_soc_ops sm8250_be_ops = {
 	.startup = sm8250_snd_startup,
-	.shutdown = qcom_snd_sdw_shutdown,
+	.shutdown = sm8250_snd_shutdown,
 	.hw_free = sm8250_snd_hw_free,
 	.hw_params = sm8250_snd_hw_params,
 	.prepare = sm8250_snd_prepare,
-- 
2.53.0


