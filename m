Return-Path: <linux-arm-msm+bounces-70016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBF3B2E751
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 23:16:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9B34AA402C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 21:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7DCA2DAFC7;
	Wed, 20 Aug 2025 21:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xNwSRYF7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A90271472
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 21:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755724576; cv=none; b=LJJI+LXwyVd0XVV/EwGxfsaKWUUYALG6vcKUV2hQ5ACtauxaVbvRHRWhCQrJ75SQjB5cR3zWyA0lwSj2R4Mqn+4HxjxJDF6jsHpiv4Smmw6CP2T8qgf8FpjLUCGM3sYHzzEPzwmZhRBlDBF+JzN9Z1RPvvgwC+IngIOtuNtQiMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755724576; c=relaxed/simple;
	bh=hmWbs8FGLzvsazw5RVUy4v3GvgVeg7eQjs7ei15fWrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d93cy1Ya4UlYvNJZg5HH9dwOZkTvLDq/eAgK2u8Ni2nc42iXC3+Q+GzbgsIHmwqkmsNTyI8nEjVFB5wRtUBVhz/MBxrIsi2ImRthbdva7kjhY6MXDQS7VvbWzuSO2t+laDuDiuPMBVEpXMIoLl5syL9q4KTVvwSyvn+wOHQC2LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xNwSRYF7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45a1b0c52f3so1829385e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 14:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755724573; x=1756329373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytmwRW2y3GFxQiML3XJrlQdf+rqHBq2ABtfrv5RXEuM=;
        b=xNwSRYF7ZCH+FwN4MnFkDwbJOq0X31Y5cW+i+kA3eurFUsMnIAySZCRvVwvl9Mefsm
         rjcKbbhHC7/kuwQOdM+J7cSn2eU1D0qrobzjRFiWwuWp8laM1LQ+n7QwjxlgacFOFGfK
         HrK9esV2KucyC+5BCfQIRH2swS19PvCkeddm7MTP2H5M5H7SCjWTWoi0dmLfCEmjJ8ho
         IefWkNzQvFUGOFZ0DCakhOumagAJGjEcgWPwb+pr6sQ6IW8YmTW/o1N8DwOIlxhPCG0o
         EEDsZjwmVWnS+3MAOeMyxYNVUaxPXkqsV4/X20bYTjXbfNBRfqg/BlvqyDxyOVOpINFc
         4Ifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755724573; x=1756329373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytmwRW2y3GFxQiML3XJrlQdf+rqHBq2ABtfrv5RXEuM=;
        b=CxUSOUMdVuEFrV0A3XBTqQGBYufjdVyVcytUsbPt1addqt4kwwk9aiAEdrbJOPHEZm
         YhFReafshNB/KiWytoe/7BBcswfsLyGe30bS5Llo2OjMWFzLrrDKQRZnwaTBOQCQGWXV
         4+ThVVaHNB9kb/MuRIgP66dOfUsA9gjj965pGntaHnA6EujDRifMh6tHIL0tBv/lr0mg
         23ix09nnlkUObdpKIo8ffhYh52h9gdgXgwO1ycy2IVUyIj7+EqbESyMWxO3/8K7zc0n7
         erKlXaR/jM/GkE9898EG1fC54cVesOhMA1gZWuFRDXLro/VQPyOtGi9xUosVzgJYMA43
         +NkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVePrujNn0tqwyL5lV/PifAx+kPFmoWUtqIjOZA+hvLF1G+IA00MGBl7GTWbUonB7fWp1aeHkI9R6luTU+t@vger.kernel.org
X-Gm-Message-State: AOJu0YwYOH1nbVt2AyHx9Hte4gMnYQkJu/jceOASVib1qwZ2lPq6Jzhl
	11HyM067XibvPV7qEzkl5SUxN4PXCVjm9P57qBfnN0m0uwQS6BDsbmN8sznUot+ZvMU=
X-Gm-Gg: ASbGncu6QZNvtewBPWCoi7ppGX+45qM8LGu97XighCptP2WoWxSDzAYjj72vQjOba5T
	iRAXy91F4olavgTQdmjnhPdUUlD6NT5KS5Tgys5uW97U+A9keB8/cmUjaY5UG8EcpfI2FDmEFHe
	2To370WcYIfVLr6y/XdR1bMWJfhMmYNai00iefO0rQGJgyiF2oaQD1IdWvs9y3PZxoDQsdEg5CN
	xC8y+FISiO0vym9jZ70eH3xp2s02EfQ28w7B0Z8pH3JEQMcwtite428wYKWWNUIhroReq4Pyw9t
	G27JFq/HMtQzPX09a9tHpyEzp1dg6/7xJ/fzLOAUwW6DrMvgDoPScbIk+KxxWRJ/iE/aM0g60/3
	+X8HfDViopnHcQT1FybC8ZxQd1t9x90eZdYGKYiI=
X-Google-Smtp-Source: AGHT+IEe4M3NBOiWSKUa+0NGhdxb6Od8NyNMdp0SOCvaPO9HpLzj2LwXaeh30jMJMNJA9JOQbegDxg==
X-Received: by 2002:a05:600c:190a:b0:458:c059:7db1 with SMTP id 5b1f17b1804b1-45b4d859a4dmr66575e9.30.1755724573278;
        Wed, 20 Aug 2025 14:16:13 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:41e2:cc8d:197b:62f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4d7b2948sm162105e9.0.2025.08.20.14.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 14:16:12 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 20 Aug 2025 22:16:00 +0100
Subject: [PATCH 2/2] ASoC: qcom: qdsp6/audioreach: add support for
 offloading raw opus playback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-opus_codec_rfc_v1-v1-2-54d5c7560856@linaro.org>
References: <20250820-opus_codec_rfc_v1-v1-0-54d5c7560856@linaro.org>
In-Reply-To: <20250820-opus_codec_rfc_v1-v1-0-54d5c7560856@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>, 
 Annemarie Porter <annemari@quicinc.com>, 
 srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 kernel@oss.qualcomm.com, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
X-Mailer: b4 0.14.2

Add support for OPUS module, OPUS format ID, media format payload struct
and make it all recognizable by audioreach compress playback path.

At this moment this only supports raw or plain OPUS packets not
encapsulated in container (for instance OGG container). For this usecase
each OPUS packet needs to be prepended with 4-bytes long length field
which is expected to be done by userspace applications. This is
Qualcomm DSP specific requirement.

Cc: Annemarie Porter <annemari@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>
Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 27 +++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 17 +++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm-dai.c  |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.c      |  3 +++
 4 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 4ebaaf736fb98a5a8a58d06416b3ace2504856e1..2d27e33c545357896c35bcf1314dd6753ad8b861 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -859,6 +859,7 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 	struct payload_media_fmt_aac_t *aac_cfg;
 	struct payload_media_fmt_pcm *mp3_cfg;
 	struct payload_media_fmt_flac_t *flac_cfg;
+	struct payload_media_fmt_opus_t *opus_cfg;
 
 	switch (mcfg->fmt) {
 	case SND_AUDIOCODEC_MP3:
@@ -901,6 +902,32 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 		flac_cfg->min_frame_size = mcfg->codec.options.flac_d.min_frame_size;
 		flac_cfg->max_frame_size = mcfg->codec.options.flac_d.max_frame_size;
 		break;
+	case SND_AUDIOCODEC_OPUS_RAW:
+		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
+		media_fmt_hdr->fmt_id = MEDIA_FMT_ID_OPUS;
+		media_fmt_hdr->payload_size = sizeof(*opus_cfg);
+		p = p + sizeof(*media_fmt_hdr);
+		opus_cfg = p;
+		/* raw opus packets prepended with 4 bytes of length */
+		opus_cfg->bitstream_format = 1;
+		/*
+		 * payload_type:
+		 * 0 -- read metadata from opus stream;
+		 * 1 -- metadata is provided by filling in the struct here.
+		 */
+		opus_cfg->payload_type = 1;
+		opus_cfg->version = mcfg->codec.options.opus_d.version;
+		opus_cfg->num_channels = mcfg->codec.options.opus_d.num_channels;
+		opus_cfg->pre_skip = mcfg->codec.options.opus_d.pre_skip;
+		opus_cfg->sample_rate = mcfg->codec.options.opus_d.sample_rate;
+		opus_cfg->output_gain = mcfg->codec.options.opus_d.output_gain;
+		opus_cfg->mapping_family = mcfg->codec.options.opus_d.mapping_family;
+		opus_cfg->stream_count = mcfg->codec.options.opus_d.chan_map.stream_count;
+		opus_cfg->coupled_count = mcfg->codec.options.opus_d.chan_map.coupled_count;
+		memcpy(opus_cfg->channel_mapping, mcfg->codec.options.opus_d.chan_map.channel_map,
+		       sizeof(opus_cfg->channel_mapping));
+		opus_cfg->reserved[0] = opus_cfg->reserved[1] = opus_cfg->reserved[2] = 0;
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 61a69df4f50f6cc90b56697c272ade6f1411bbf2..512ea24fd402c95f98db790313b756a5ba3dcca1 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -29,6 +29,7 @@ struct q6apm_graph;
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
+#define MODULE_ID_OPUS_DEC		0x07001174
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
 #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
@@ -255,6 +256,22 @@ struct payload_media_fmt_aac_t {
 	uint32_t sample_rate;
 } __packed;
 
+#define MEDIA_FMT_ID_OPUS	0x09001039
+struct payload_media_fmt_opus_t {
+	uint16_t bitstream_format;
+	uint16_t payload_type;
+	uint8_t version;
+	uint8_t num_channels;
+	uint16_t pre_skip;
+	uint32_t sample_rate;
+	uint16_t output_gain;
+	uint8_t mapping_family;
+	uint8_t stream_count;
+	uint8_t coupled_count;
+	uint8_t channel_mapping[8];
+	uint8_t reserved[3];
+} __packed;
+
 #define DATA_CMD_WR_SH_MEM_EP_EOS			0x04001002
 #define WR_SH_MEM_EP_EOS_POLICY_LAST	1
 #define WR_SH_MEM_EP_EOS_POLICY_EACH	2
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 2cd522108221a2ec5c7bbbb63f7d4ae4f8001cf6..7da91ed297f4a5ed39ca0747804cabd579634b50 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -550,10 +550,11 @@ static int q6apm_dai_compr_get_caps(struct snd_soc_component *component,
 	caps->max_fragment_size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE;
 	caps->min_fragments = COMPR_PLAYBACK_MIN_NUM_FRAGMENTS;
 	caps->max_fragments = COMPR_PLAYBACK_MAX_NUM_FRAGMENTS;
-	caps->num_codecs = 3;
+	caps->num_codecs = 4;
 	caps->codecs[0] = SND_AUDIOCODEC_MP3;
 	caps->codecs[1] = SND_AUDIOCODEC_AAC;
 	caps->codecs[2] = SND_AUDIOCODEC_FLAC;
+	caps->codecs[3] = SND_AUDIOCODEC_OPUS_RAW;
 
 	return 0;
 }
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index b4ffa0f0b188e2c32fdfb863b9130d1d11e578dd..0e667a7eb5467bdd65326099132e8ba9dfefa21e 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -354,6 +354,9 @@ int q6apm_set_real_module_id(struct device *dev, struct q6apm_graph *graph,
 	case SND_AUDIOCODEC_FLAC:
 		module_id = MODULE_ID_FLAC_DEC;
 		break;
+	case SND_AUDIOCODEC_OPUS_RAW:
+		module_id = MODULE_ID_OPUS_DEC;
+		break;
 	default:
 		return -EINVAL;
 	}

-- 
2.47.2


