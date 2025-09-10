Return-Path: <linux-arm-msm+bounces-72923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16991B510D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFC9E4E2E98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 08:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2323030F548;
	Wed, 10 Sep 2025 08:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aYeouZ1H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B0830EF95
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 08:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757491913; cv=none; b=L7XzcAqxRJqqofU7Z9lpOpedug6YbJph1vaqKF9LwngN8+wNC2Ugautp+4B6p870hty2SEW08HUOYZuDqUQVsqfbbEwzvpXVAFdayF/EW3sm4hpKe1YTxp1S/NkhYMIulgt/FUygSU1AtLlJYgd1mfH63gOuy6IBHr9Z5CxxBG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757491913; c=relaxed/simple;
	bh=ucP/aNdeMUj9WGK+nqbjxS0TPhCInGb+XBTPIIB0vXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MtiGazHxTO1ewRADZLQkFbyWwLA7j77l3Eyxts8T7R5jDwrLoMVg1o4hMesUxHwEgEGwkWbHeo2KZdFsEtTi068kafSX1fBLjiVjl8/xSjYJBNmV/4aEW0ZRRocK7wu57QdCE1j8iephPl59zI0OiLEGOq992a37NCuzlu5i0OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aYeouZ1H; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3da9ad0c1f4so4513539f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 01:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757491909; x=1758096709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oSP0NK4lU5tJ2GBOadqfrzjQst48eWkEAa1mwne9n/k=;
        b=aYeouZ1Hkv5H7Dw312H5zghrjkAOO04TDqCbYB+uspO+enzTD99h6Rc6zvSzd6kN3N
         yHke5dtWSN/o3bqPxPkn6KfN8xZyYhjZ/EE0pbJoR95zy6eLdJnvhY3dw/wrMKeh33JN
         YoiXaiFvb2X45KM00z7Jo8OP44VNPF828s8qvaqfsusaWKKEsL70qkC2PvqbsQiQiR3h
         LVy6KGfOa99lgRitOYxAfHXeLFXKVZgpMwOy6sswXRpdQxWlez8pUxg97XavTlojsxFz
         zVuuxVJXThtFGU4AM/xrZRpFhnjgxmRp4ASb0UkgEqqXd7/KclyNXlvADbNOmLjf403F
         tsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757491909; x=1758096709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oSP0NK4lU5tJ2GBOadqfrzjQst48eWkEAa1mwne9n/k=;
        b=iOYD/VYXGchvutvkzDrYksQAU2kZqpA8nacFe8R1aXEan0ak+iCTi4WjPneozs+O91
         ymAV1UrDPu87ftu4bQdQ7Muud0WAq1xd51h9sxWLN/EYuckhDekA8JBUArdBr7cVn4CW
         vNnKeH/A/GmsDBTQNSc5SNXs+oowOljoqPrcOmYEQVv/4Bq7TsGvFvLQv31T6QXtm7xz
         H/eko9jdWVr3F/YKOUdH86FBHbAElHvh4Hu4E8fGTm0KZxTCkyU0G7AapDpBcTrqIFYR
         ig4lODj25X6SyLsSsSAvYgT+I42BymdkOB2PS3ixaYVAqyu7r7OJ84zfSpJ0J+mZBw1i
         F7wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbL6adNcYlkBmT5WKFhs0T27dfkqrP7iVFtPiNDVsPsEsZvIpLO9Ky2TJ5qIRtm3wh5yjH+V91DSAVLxUt@vger.kernel.org
X-Gm-Message-State: AOJu0YwP5ET0LzqHOB7iQzi2XSe+F+o9QTTEW12cSyZEkhwcxFVvrxQp
	n4zqC7bNBR4S8VVxv4boA1NSHuk2Ve1N7RtGr/5wNf9HW1WFEMFTcpseQiGypdIj1jw=
X-Gm-Gg: ASbGncsrn6i86CRoScexMUgFgBjoE4SupqVbnQnavYoyXoZeSvqf0v/2UprfM5bMVvT
	Bz1RY4JJELhSq9MGPxQVnZrN9NCu31Muj09w/kwkAPbAToXrGSRkZsmV+PyLjxXOWHVHpWju7Rv
	elV6jcxyNtsF4TNbW6l6OT1BvhVJrslfdlxZ5Jz5O7c7EpMLmEb7yRC6OKXdeLYQLiKV0cSpq6x
	2RktqrBMIsat03zl2XQQgynHqztmOT4hfsNkotEWg+zfRRqy+1sDLzdcFsPON2DjvpQE54Secul
	16vcbv7ILnN4p0cznhuHnJb54X5xfcvXUGrJqg/c2zae9upNNpIsbzNh9ZriLm9fwpdDkXr87Ko
	pbPbtvTlXCXxHFGnMhQnrCgMILwye
X-Google-Smtp-Source: AGHT+IGpz/bTtnp/unn04UhPboOAAZyWO8UB3SqgAB5z2MwFSMwS59eu6FF7EHcJ8sk+L6ElLq27yQ==
X-Received: by 2002:a05:6000:2089:b0:3d1:95bd:dd13 with SMTP id ffacd0b85a97d-3e64c3ac8c9mr12250717f8f.42.1757491908901;
        Wed, 10 Sep 2025 01:11:48 -0700 (PDT)
Received: from orion.home ([2a02:c7c:7259:a00:a727:6a46:52e3:cac2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df8218944sm18119995e9.12.2025.09.10.01.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 01:11:48 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Wed, 10 Sep 2025 09:11:42 +0100
Subject: [PATCH v2 2/2] ASoC: qcom: qdsp6/audioreach: add support for
 offloading raw opus playback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-opus_codec_rfc_v1-v2-2-35fb6536df6b@linaro.org>
References: <20250910-opus_codec_rfc_v1-v2-0-35fb6536df6b@linaro.org>
In-Reply-To: <20250910-opus_codec_rfc_v1-v2-0-35fb6536df6b@linaro.org>
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
index bbfd51db879766445fa0fea564659fabd06b59ad..aaec3d00068d71694000ad9c92c042c26c8da9b4 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -883,6 +883,7 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 	struct payload_media_fmt_aac_t *aac_cfg;
 	struct payload_media_fmt_pcm *mp3_cfg;
 	struct payload_media_fmt_flac_t *flac_cfg;
+	struct payload_media_fmt_opus_t *opus_cfg;
 
 	switch (mcfg->fmt) {
 	case SND_AUDIOCODEC_MP3:
@@ -925,6 +926,32 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
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
+		opus_cfg->version = mcfg->codec.options.opus_d.version.version_byte;
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
index 790fba96e34db0fc9d5c90504747174f56b65b32..d1b60b36468a86301601b61a7f8e7f6051561c3e 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -31,6 +31,7 @@ struct q6apm_graph;
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
+#define MODULE_ID_OPUS_DEC		0x07001174
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
 #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
@@ -257,6 +258,22 @@ struct payload_media_fmt_aac_t {
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
index 09da26f712a6ada97196090d760b91bc2dc2a732..4ecaff45c51860cddc631725953ba7dfa84eeb50 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -551,10 +551,11 @@ static int q6apm_dai_compr_get_caps(struct snd_soc_component *component,
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


