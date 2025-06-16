Return-Path: <linux-arm-msm+bounces-61468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8603ADB558
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 17:28:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E08023AFAF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 15:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E9826A0F2;
	Mon, 16 Jun 2025 15:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pr2IxeQ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D991B238C25
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 15:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087598; cv=none; b=V6GGUEZPt95GgVGp1jrZUtviG3L/S2DAsS7nK0ibUsS7kocoHtAPypKZPjuFy3lOV2MmDY1j+wRP+x+0uMdDEbkceGeAqumuavP2MbkfcGHdh4Y3ETJ6peMcFdFmm6B5U1I6FvYgcfVtV7dA2qeb3mXfOElhZwuwYIP14+fMhXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087598; c=relaxed/simple;
	bh=pdAaXrFGqL/Aa6hYgRxtPn4uBoWPP4NW+5mn6DP8Bvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYjE5W2hcRfhMiI5G1v0+vqfBwNgTBzs6EI86KOjg0nyuXaIX5/OFeQhVP+houVquWv9NcvecQqkseFpbSkwfo0eVSCRPrFD/msx3E7rkoYxZiOPl5NWminRwcGawa7D2EXQGz09nWeAZAPKN3285H1NoELdNC/CzY9SJw3lXy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pr2IxeQ1; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cf214200so40076265e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 08:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750087594; x=1750692394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yxve1JwDDe+FnWnhjimT/HvKYa1GnuZ34/tu1s/3jVw=;
        b=pr2IxeQ17G/98iZItvk+E3yxa/QrTP8mJrkbJ9plppYsPOXTTl3BVJEAQYuL2ZByK1
         neWWdvglRey9SqQfNAAhzLsnzjlnz9D5YHxM4Am5+P490fEF2FUjtxGuHww8jr428vX6
         jvwljIFe22IYRoEYPTJCR607PkklsfTzBaiQDEWESnjHZvvMHosdcTyK8B+wFhFjjQHJ
         I7rRprotjMt4OrgQffkp9IY0faYV9HVTIAH3UEQTddGxXPVQAWrW3qA9BGVoUOHx1egE
         4cNwbjgNwstM80Pcuwydeg0RSb4ri3esLdWaqzWTeno32X/eEcIyLxNkU98v4VTUIHaR
         WWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087594; x=1750692394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yxve1JwDDe+FnWnhjimT/HvKYa1GnuZ34/tu1s/3jVw=;
        b=aMdiGkr3n/ZM2CdPMqsMH+oP88UsxZtxatBIUdFnaEU/e//lieKjNWa9cGL2yHce9e
         I/ipTARBoJjoa30sw5sFD1X+eeDs2e/qygYkLYOZKMlF1rJBnUmhd7D6j7RIK8+I4OX2
         9QXU7ej/mmIzAFuibc8NMXJlFbhCLTn+bp+cVEgj6CaVBfWt6YWR5GDlw9ffHPTllBBG
         awmbpL8IGjHxvELoQ3srRWyJlQRC8JGSkGNc4w1PHOxu2IkHWUNDDXTPE83BCyeIfKHE
         v3j3TljfrjsrE71htfwC7C97O14Fw0qcfn93QyepS8AjnNIjxFagauM04bGUJuwdG/kg
         KV+w==
X-Forwarded-Encrypted: i=1; AJvYcCVzML+POn4e8sFNJsLRLh9ox2doNCRTtd8Sbi+Jy04/gYcrK4VLWiny3GNstkR7RUyDJY4THe6lipD1BAym@vger.kernel.org
X-Gm-Message-State: AOJu0YxLAokCBT/NR68E6s40lvE/Ph1zzGBqXDiVT9VfA7mik3NeES3z
	6FHABQ0alQXbPDAMr9/myYF2QIdMUbx/TgbC0ZCq05LpoHOl+dMZuXsgWrTZOuNBWnw=
X-Gm-Gg: ASbGncsEeLEfQMtOof1SAonflizSWcaCESQurY2uVYE/tJTzCsxU2ac6d8FmQ/PB/3o
	yhsoeZ9NbfExpHlD/fqcIjYwJA4RnuTd61nFgs4fewZZIggPIOm9XwQdYUsaymtCJLUBi3Kbtc2
	SwuCsBqtkGclH8zP/D90H5/oeip2ScePDsrIPWOdYKc39jebUM+q/1wdGNh4ErEevLTv9UXhzN+
	Ir4skDOAwsK5KdjzfnRKp8MWjIX1VPCFaG6Lf1QJltYksmyI6WagzdQmKULyP/A7EbFYxUa6FQK
	k1zsRkRY1iBbnoSeOdbyo+3v95Ja+FtuLNX7BtXxYfW+LbwxypyUZw2MAngIWzTOjq/8X8tVDSZ
	ZGzWU
X-Google-Smtp-Source: AGHT+IHAglKv0ipXGLm4ZNMd0YquIJiUa9gmi+FMc6wvrzQqpOyfQOqfYF2Jz6O3U3YA8WygG5GRgw==
X-Received: by 2002:a05:600c:1d0c:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-4533cab544emr77945185e9.22.1750087594186;
        Mon, 16 Jun 2025 08:26:34 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7213:c700:32d0:eaf7:ac68:3701])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532dea1925sm151687525e9.12.2025.06.16.08.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:26:33 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Mon, 16 Jun 2025 16:26:23 +0100
Subject: [PATCH RFC 2/2] ASoC: qcom: qdsp6/audioreach: add support for
 offloading raw opus playback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-opus_codec_rfc_v1-v1-2-1f70b0a41a70@linaro.org>
References: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
In-Reply-To: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Patrick Lai <plai@qti.qualcomm.com>, 
 Annemarie Porter <annemari@quicinc.com>, linux-sound@vger.kernel.org, 
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

This patch is based on earlier work done by
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Cc: Annemarie Porter <annemari@quicinc.com>
Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 sound/soc/qcom/qdsp6/audioreach.c | 33 +++++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h | 17 +++++++++++++++++
 sound/soc/qcom/qdsp6/q6apm-dai.c  |  3 ++-
 sound/soc/qcom/qdsp6/q6apm.c      |  3 +++
 4 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 4ebaaf736fb98a5a8a58d06416b3ace2504856e1..09e3a4da945d61b6915bf8b6f382c25ae94c5888 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -859,6 +859,7 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 	struct payload_media_fmt_aac_t *aac_cfg;
 	struct payload_media_fmt_pcm *mp3_cfg;
 	struct payload_media_fmt_flac_t *flac_cfg;
+	struct payload_media_fmt_opus_t *opus_cfg;
 
 	switch (mcfg->fmt) {
 	case SND_AUDIOCODEC_MP3:
@@ -901,6 +902,38 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 		flac_cfg->min_frame_size = mcfg->codec.options.flac_d.min_frame_size;
 		flac_cfg->max_frame_size = mcfg->codec.options.flac_d.max_frame_size;
 		break;
+	case SND_AUDIOCODEC_OPUS_RAW:
+		media_fmt_hdr->data_format = DATA_FORMAT_RAW_COMPRESSED;
+		media_fmt_hdr->fmt_id = MEDIA_FMT_ID_OPUS;
+		media_fmt_hdr->payload_size = sizeof(struct payload_media_fmt_opus_t);
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
+		opus_cfg->stream_count = mcfg->codec.options.opus_d.stream_count;
+		opus_cfg->coupled_count = mcfg->codec.options.opus_d.coupled_count;
+
+		if (mcfg->codec.options.opus_d.num_channels == 1) {
+			opus_cfg->channel_mapping[0] = PCM_CHANNEL_FL;
+		} else if (mcfg->codec.options.opus_d.num_channels == 2) {
+			opus_cfg->channel_mapping[0] = PCM_CHANNEL_FL;
+			opus_cfg->channel_mapping[1] = PCM_CHANNEL_FR;
+		}
+
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


