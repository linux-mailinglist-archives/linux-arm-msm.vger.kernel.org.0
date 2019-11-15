Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8344FDB55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 11:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbfKOK1q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 05:27:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:49644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbfKOK1p (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 05:27:45 -0500
Received: from vkoul-mobl.Dlink (unknown [106.51.108.125])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 970B820748;
        Fri, 15 Nov 2019 10:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573813665;
        bh=8oHQt7MPagfOxYSdD/WliNlX/xPE5ypyV6uVQjdJNTk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=02PboHr+ua8Y+fd3oIByquwwz/Y5JQMn/3lbO2ZNd1Vy/wQzl7KMpBd4iVtaOw5xW
         rxPhBXILFyHZX/oqkQqZtRjz3ouCQ5NYfyTjNHPV1yN7rqpkyReElQcAMpL8uEb8NB
         wJ8LMGYeAD7DlHJQa8nUPQyEzaNHMLTSJhqLMlUc=
From:   Vinod Koul <vkoul@kernel.org>
To:     Takashi Iwai <tiwai@suse.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [RFC PATCH 3/3] ASoC: qcom: q6asm-dai: add support to flac decoder
Date:   Fri, 15 Nov 2019 15:57:05 +0530
Message-Id: <20191115102705.649976-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191115102705.649976-1-vkoul@kernel.org>
References: <20191115102705.649976-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm DSPs also support the flac decoder, so add support for FLAC
decoder and convert the snd_dec_flac params to qdsp format.

Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 35 +++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 548eb4fa2da6..56e306bdbbe1 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -635,8 +635,14 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 	struct snd_soc_component *c = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
 	int dir = stream->direction;
 	struct q6asm_dai_data *pdata;
+	struct q6asm_flac_cfg flac_cfg;
 	struct device *dev = c->dev;
 	int ret;
+	union snd_codec_options *codec_options;
+	struct snd_dec_flac *flac;
+
+	codec_options = &(prtd->codec_param.codec.options);
+
 
 	memcpy(&prtd->codec_param, params, sizeof(*params));
 
@@ -673,6 +679,32 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 		return ret;
 	}
 
+	switch (params->codec.id) {
+	case SND_AUDIOCODEC_FLAC:
+
+		memset(&flac_cfg, 0x0, sizeof(struct q6asm_flac_cfg));
+		flac = &codec_options->flac_d;
+
+		flac_cfg.ch_cfg = params->codec.ch_in;
+		flac_cfg.sample_rate =  params->codec.sample_rate;
+		flac_cfg.stream_info_present = 1;
+		flac_cfg.sample_size = flac->sample_size;
+		flac_cfg.min_blk_size = flac->min_blk_size;
+		flac_cfg.max_blk_size = flac->max_blk_size;
+		flac_cfg.max_frame_size = flac->max_frame_size;
+		flac_cfg.min_frame_size = flac->min_frame_size;
+
+		ret = q6asm_stream_media_format_block_flac(prtd->audio_client,
+							   &flac_cfg);
+		if (ret < 0) {
+			dev_err(dev, "FLAC CMD Format block failed:%d\n", ret);
+			return -EIO;
+		}
+		break;
+	default:
+		break;
+	}
+
 	ret = q6asm_map_memory_regions(dir, prtd->audio_client, prtd->phys,
 				       (prtd->pcm_size / prtd->periods),
 				       prtd->periods);
@@ -768,8 +800,9 @@ static int q6asm_dai_compr_get_caps(struct snd_compr_stream *stream,
 	caps->max_fragment_size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE;
 	caps->min_fragments = COMPR_PLAYBACK_MIN_NUM_FRAGMENTS;
 	caps->max_fragments = COMPR_PLAYBACK_MAX_NUM_FRAGMENTS;
-	caps->num_codecs = 1;
+	caps->num_codecs = 2;
 	caps->codecs[0] = SND_AUDIOCODEC_MP3;
+	caps->codecs[1] = SND_AUDIOCODEC_FLAC;
 
 	return 0;
 }
-- 
2.23.0

