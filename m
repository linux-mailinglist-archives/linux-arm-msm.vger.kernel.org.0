Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54D711871DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 19:08:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732274AbgCPSID (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 14:08:03 -0400
Received: from foss.arm.com ([217.140.110.172]:53778 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732234AbgCPSIC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 14:08:02 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0818E1FB;
        Mon, 16 Mar 2020 11:08:02 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E5863F67D;
        Mon, 16 Mar 2020 11:08:01 -0700 (PDT)
Date:   Mon, 16 Mar 2020 18:08:00 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     alsa-devel@alsa-project.org,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Takashi Iwai <tiwai@suse.com>
Subject: Applied "ASoC: qcom: q6asm-dai: add support for ALAC and APE decoders" to the asoc tree
In-Reply-To:  <20200316055221.1944464-9-vkoul@kernel.org>
Message-Id:  <applied-20200316055221.1944464-9-vkoul@kernel.org>
X-Patchwork-Hint: ignore
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   ASoC: qcom: q6asm-dai: add support for ALAC and APE decoders

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 4c3189380c6748a3e9fc6ab8aeb4bde3dd2032ed Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Mon, 16 Mar 2020 11:22:20 +0530
Subject: [PATCH] ASoC: qcom: q6asm-dai: add support for ALAC and APE decoders

Qualcomm DSPs also supports the ALAC and APE decoders, so add support
for these and convert the snd_codec_params to qdsp format.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200316055221.1944464-9-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 70 +++++++++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index fa685fe4a027..8b5d86be9ace 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -41,6 +41,9 @@
 #define Q6ASM_DAI_TX	1
 #define Q6ASM_DAI_RX	2
 
+#define ALAC_CH_LAYOUT_MONO   ((101 << 16) | 1)
+#define ALAC_CH_LAYOUT_STEREO ((101 << 16) | 2)
+
 enum stream_state {
 	Q6ASM_STREAM_IDLE = 0,
 	Q6ASM_STREAM_STOPPED,
@@ -630,12 +633,16 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 	struct q6asm_dai_data *pdata;
 	struct q6asm_flac_cfg flac_cfg;
 	struct q6asm_wma_cfg wma_cfg;
+	struct q6asm_alac_cfg alac_cfg;
+	struct q6asm_ape_cfg ape_cfg;
 	unsigned int wma_v9 = 0;
 	struct device *dev = c->dev;
 	int ret;
 	union snd_codec_options *codec_options;
 	struct snd_dec_flac *flac;
 	struct snd_dec_wma *wma;
+	struct snd_dec_alac *alac;
+	struct snd_dec_ape *ape;
 
 	codec_options = &(prtd->codec_param.codec.options);
 
@@ -758,6 +765,65 @@ static int q6asm_dai_compr_set_params(struct snd_compr_stream *stream,
 			dev_err(dev, "WMA9 CMD failed:%d\n", ret);
 			return -EIO;
 		}
+		break;
+
+	case SND_AUDIOCODEC_ALAC:
+		memset(&alac_cfg, 0x0, sizeof(alac_cfg));
+		alac = &codec_options->alac_d;
+
+		alac_cfg.sample_rate = params->codec.sample_rate;
+		alac_cfg.avg_bit_rate = params->codec.bit_rate;
+		alac_cfg.bit_depth = prtd->bits_per_sample;
+		alac_cfg.num_channels = params->codec.ch_in;
+
+		alac_cfg.frame_length = alac->frame_length;
+		alac_cfg.pb = alac->pb;
+		alac_cfg.mb = alac->mb;
+		alac_cfg.kb = alac->kb;
+		alac_cfg.max_run = alac->max_run;
+		alac_cfg.compatible_version = alac->compatible_version;
+		alac_cfg.max_frame_bytes = alac->max_frame_bytes;
+
+		switch (params->codec.ch_in) {
+		case 1:
+			alac_cfg.channel_layout_tag = ALAC_CH_LAYOUT_MONO;
+			break;
+		case 2:
+			alac_cfg.channel_layout_tag = ALAC_CH_LAYOUT_STEREO;
+			break;
+		}
+		ret = q6asm_stream_media_format_block_alac(prtd->audio_client,
+							   &alac_cfg);
+		if (ret < 0) {
+			dev_err(dev, "ALAC CMD Format block failed:%d\n", ret);
+			return -EIO;
+		}
+		break;
+
+	case SND_AUDIOCODEC_APE:
+		memset(&ape_cfg, 0x0, sizeof(ape_cfg));
+		ape = &codec_options->ape_d;
+
+		ape_cfg.sample_rate = params->codec.sample_rate;
+		ape_cfg.num_channels = params->codec.ch_in;
+		ape_cfg.bits_per_sample = prtd->bits_per_sample;
+
+		ape_cfg.compatible_version = ape->compatible_version;
+		ape_cfg.compression_level = ape->compression_level;
+		ape_cfg.format_flags = ape->format_flags;
+		ape_cfg.blocks_per_frame = ape->blocks_per_frame;
+		ape_cfg.final_frame_blocks = ape->final_frame_blocks;
+		ape_cfg.total_frames = ape->total_frames;
+		ape_cfg.seek_table_present = ape->seek_table_present;
+
+		ret = q6asm_stream_media_format_block_ape(prtd->audio_client,
+							  &ape_cfg);
+		if (ret < 0) {
+			dev_err(dev, "APE CMD Format block failed:%d\n", ret);
+			return -EIO;
+		}
+		break;
+
 	default:
 		break;
 	}
@@ -857,10 +923,12 @@ static int q6asm_dai_compr_get_caps(struct snd_compr_stream *stream,
 	caps->max_fragment_size = COMPR_PLAYBACK_MAX_FRAGMENT_SIZE;
 	caps->min_fragments = COMPR_PLAYBACK_MIN_NUM_FRAGMENTS;
 	caps->max_fragments = COMPR_PLAYBACK_MAX_NUM_FRAGMENTS;
-	caps->num_codecs = 3;
+	caps->num_codecs = 5;
 	caps->codecs[0] = SND_AUDIOCODEC_MP3;
 	caps->codecs[1] = SND_AUDIOCODEC_FLAC;
 	caps->codecs[2] = SND_AUDIOCODEC_WMA;
+	caps->codecs[3] = SND_AUDIOCODEC_ALAC;
+	caps->codecs[4] = SND_AUDIOCODEC_APE;
 
 	return 0;
 }
-- 
2.20.1

