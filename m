Return-Path: <linux-arm-msm+bounces-106198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOVQIkyo+2mYewMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 22:45:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F454E04B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 22:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 901CB301546A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 20:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B21C34E762;
	Wed,  6 May 2026 20:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="XFLiYNXd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A533A4505
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 20:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778100207; cv=none; b=TDHxCQpGIBUFHUMY2npKQx6VYqeGRKgKnZ7rQ5XedlKW6tQDBhoi0paw7uoVKqnwucXcIbuDK9J1PYBVOcx0ghvyjfntdiOEEciGHhuLYtId2VgeJKQkeGsVEv50bCn1sFoD/KYWG1cWpqXE/rVZGNyZwhXS/X2KLBtwyDJV73k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778100207; c=relaxed/simple;
	bh=9cqY5Ei5/Xd+BUyLi7B0HYfLfTRUBd/DmkQpssIit/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3BlwYgN2S5sIbNEm0qiOzapQcfWpCjKnV/niuuIWe6IwHTOT9C79T14kXAsesRJnX6u6Ei3WM/unUl+THthA1tFbp05gTWIE+Uj/OdcMwRhE7YRZFLZ9wxUqzV2n1XUVGCC/0xXFA8lGK9HVPBVa8vGOUu391uacu0FcAwAfoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=XFLiYNXd; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1778100203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ujeou9PrF70xNxDNtL4x4ZU2rn4Mnf7hRj3ZTMa6ymY=;
	b=XFLiYNXdkolsdpNiI0zEOt/0dD6PisS5aKc/po5DJ2XmpVp0Ze1ltdfl00GO8cBXI8WXsi
	D2g4kTw2iUT3kzp2tyUz9H0ZCjk9xznZVHlRuZo+vwv2OZWmj3zgLgNxGvAWWVGh6ck2DA
	rLudB4HMLctablP5+mxu9FVG3+ZX8vexkZXnmB/RGC1C60zNC5SMujsDBEIltl3zOFSDrv
	eWfzu8GfUe8SbMOP+QxwAhFkiEIwEnHMukzRyLwk8tU4jfcYknP7yIPJLe13O66Fkf1HdM
	cUltZqt2DHjzIiedeA6PSF9o9NtCCnQ3RAPXprRuIB00HWJnY5AMMhbpBorJoA==
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
Subject: [PATCH v2 4/6] ASoC: qcom: sm8250: add TDM RX support
Date: Wed,  6 May 2026 17:33:05 -0300
Message-ID: <20260506204142.659778-5-val@packett.cool>
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
X-Rspamd-Queue-Id: E3F454E04B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106198-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[packett.cool:email,packett.cool:dkim,packett.cool:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add support for TDM RX DAIs which are used on some devices to send audio
data to speaker amplifiers. Channels are assigned based on the codec
DAI names for a quad-speaker setup such as on the xiaomi-pipa tablet.

Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/qcom/sm8250.c | 141 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index a675913da943..b64fd3970ba1 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -17,6 +17,10 @@
 #include "sdw.h"
 
 #define MI2S_BCLK_RATE		1536000
+#define TDM_BCLK_RATE		6144000
+#define NUM_TDM_SLOTS		8
+
+static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
 
 struct sm8250_snd_data {
 	bool stream_prepared[AFE_PORT_MAX];
@@ -55,6 +59,89 @@ static void sm8250_snd_exit(struct snd_soc_pcm_runtime *rtd)
 
 }
 
+static int sm8250_tdm_snd_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai;
+	unsigned int rx_mask;
+	int ret = 0, j;
+	int channels, slot_width;
+
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16_LE:
+		slot_width = 16;
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid param format 0x%x\n",
+				__func__, params_format(params));
+		return -EINVAL;
+	}
+
+	channels = params_channels(params);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0, 0x3,
+				8, slot_width);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
+					__func__, ret);
+			goto end;
+		}
+
+		ret = snd_soc_dai_set_channel_map(cpu_dai, 0, NULL,
+				channels, tdm_slot_offset);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
+					__func__, ret);
+			goto end;
+		}
+	} else {
+		ret = snd_soc_dai_set_tdm_slot(cpu_dai, 0xf, 0,
+				8, slot_width);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set tdm slot, err:%d\n",
+					__func__, ret);
+			goto end;
+		}
+
+		ret = snd_soc_dai_set_channel_map(cpu_dai, channels,
+				tdm_slot_offset, 0, NULL);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set channel map, err:%d\n",
+					__func__, ret);
+			goto end;
+		}
+	}
+
+	for_each_rtd_codec_dais(rtd, j, codec_dai) {
+		if (strstr(codec_dai->component->name_prefix, "PL")) {
+			rx_mask = BIT(0);
+		} else if (strstr(codec_dai->component->name_prefix, "PR")) {
+			rx_mask = BIT(1);
+		} else if (strstr(codec_dai->component->name_prefix, "SL")) {
+			rx_mask = BIT(2);
+		} else if (strstr(codec_dai->component->name_prefix, "SR")) {
+			rx_mask = BIT(3);
+		} else {
+			rx_mask = 0;
+			dev_warn(rtd->dev, "%s: codec DAI name '%s' not recognized\n",
+				__func__, codec_dai->component->name_prefix);
+		}
+		ret = snd_soc_dai_set_tdm_slot(codec_dai, 0, rx_mask,
+				NUM_TDM_SLOTS, slot_width);
+		if (ret < 0) {
+			dev_err(rtd->dev, "%s: failed to set TDM slot, err:%d\n",
+				__func__, ret);
+			goto end;
+		}
+	}
+
+end:
+	return ret;
+}
+
 static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				     struct snd_pcm_hw_params *params)
 {
@@ -120,6 +207,41 @@ static int sm8250_snd_startup(struct snd_pcm_substream *substream)
 		snd_soc_dai_set_fmt(cpu_dai, fmt);
 		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
 		break;
+	case PRIMARY_TDM_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT,
+			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case SECONDARY_TDM_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT,
+			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case TERTIARY_TDM_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT,
+			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case QUATERNARY_TDM_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
+			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
+	case QUINARY_TDM_RX_0:
+		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT,
+			TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(codec_dai, codec_dai_fmt);
+		break;
 	default:
 		break;
 	}
@@ -145,10 +267,29 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 	return qcom_snd_sdw_hw_free(substream, &data->stream_prepared[cpu_dai->id]);
 }
 
+static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int ret = 0;
+
+	switch (cpu_dai->id) {
+	case PRIMARY_TDM_RX_0...QUINARY_TDM_TX_7:
+		ret = sm8250_tdm_snd_hw_params(substream, params);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
 static const struct snd_soc_ops sm8250_be_ops = {
 	.startup = sm8250_snd_startup,
 	.shutdown = qcom_snd_sdw_shutdown,
 	.hw_free = sm8250_snd_hw_free,
+	.hw_params = sm8250_snd_hw_params,
 	.prepare = sm8250_snd_prepare,
 };
 
-- 
2.53.0


