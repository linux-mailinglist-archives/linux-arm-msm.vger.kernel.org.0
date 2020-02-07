Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 043AA15605D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 21:59:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgBGU7P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 15:59:15 -0500
Received: from mail.serbinski.com ([162.218.126.2]:46966 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbgBGU6p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 15:58:45 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 783A0D00732;
        Fri,  7 Feb 2020 20:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id aw0PiKosRpDL; Fri,  7 Feb 2020 15:50:56 -0500 (EST)
Received: from anet (ipagstaticip-7ac5353e-e7de-3a0d-ff65-4540e9bc137f.sdsl.bell.ca [142.112.15.192])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mail.serbinski.com (Postfix) with ESMTPSA id D9218D0071B;
        Fri,  7 Feb 2020 15:50:29 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com D9218D0071B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581108629;
        bh=Li+7uO9ANVGhw/mLvHKkrDnYRFTrSj70ZU/KaJjHjjc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YmszpOIYsuFlKSA30erbiFhMiDo442nZhtP3XnqleqhzpuyZseknQuy5nTjQfCqAn
         MegrA4ojKOX4BBZQnmwO9aFGF4zWdS8gaNJyueaDgng68Gbwc5fXMqAKYsos8MidX2
         tuIhKxBwRfO03R9nfmd17zuzk/te04cHSeembVJs=
From:   Adam Serbinski <adam@serbinski.com>
To:     Mark Brown <broonie@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Adam Serbinski <adam@serbinski.com>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Patrick Lai <plai@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/8] ASoC: qdsp6: q6afe-dai: add support to pcm port dais
Date:   Fri,  7 Feb 2020 15:50:08 -0500
Message-Id: <20200207205013.12274-4-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200207205013.12274-1-adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support of AFE DAI for PCM port.

Signed-off-by: Adam Serbinski <adam@serbinski.com>
CC: Andy Gross <agross@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Patrick Lai <plai@codeaurora.org>
CC: Banajit Goswami <bgoswami@codeaurora.org>
CC: Jaroslav Kysela <perex@perex.cz>
CC: Takashi Iwai <tiwai@suse.com>
CC: alsa-devel@alsa-project.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 198 ++++++++++++++++++++++++++++++-
 1 file changed, 197 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index c1a7624eaf17..23b29591ef47 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -151,6 +151,28 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int q6pcm_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params,
+			   struct snd_soc_dai *dai)
+{
+	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct q6afe_pcm_cfg *pcm = &dai_data->port_config[dai->id].pcm_cfg;
+
+	pcm->sample_rate = params_rate(params);
+
+	return 0;
+}
+
+static int q6pcm_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct q6afe_pcm_cfg *pcm = &dai_data->port_config[dai->id].pcm_cfg;
+
+	pcm->fmt = fmt;
+
+	return 0;
+}
+
 static int q6i2s_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params,
 			   struct snd_soc_dai *dai)
@@ -358,6 +380,15 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 			return rc;
 		}
 		break;
+	case PRIMARY_PCM_RX ... QUATERNARY_PCM_TX:
+		rc = q6afe_pcm_port_prepare(dai_data->port[dai->id],
+				&dai_data->port_config[dai->id].pcm_cfg);
+		if (rc < 0) {
+			dev_err(dai->dev, "fail to prepare AFE port %x\n",
+				dai->id);
+			return rc;
+		}
+		break;
 	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
 		q6afe_tdm_port_prepare(dai_data->port[dai->id],
 					&dai_data->port_config[dai->id].tdm);
@@ -429,11 +460,32 @@ static int q6afe_mi2s_set_sysclk(struct snd_soc_dai *dai,
 					     Q6AFE_LPASS_CLK_ROOT_DEFAULT,
 					     freq, dir);
 	case Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT ... Q6AFE_LPASS_CLK_ID_QUI_MI2S_OSR:
+	case Q6AFE_LPASS_CLK_ID_PRI_PCM_IBIT ... Q6AFE_LPASS_CLK_ID_QUI_PCM_OSR:
 	case Q6AFE_LPASS_CLK_ID_MCLK_1 ... Q6AFE_LPASS_CLK_ID_INT_MCLK_1:
 		return q6afe_port_set_sysclk(port, clk_id,
 					     Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO,
 					     Q6AFE_LPASS_CLK_ROOT_DEFAULT,
 					     freq, dir);
+	}
+
+	return 0;
+}
+
+static int q6afe_tdm_set_sysclk(struct snd_soc_dai *dai,
+		int clk_id, unsigned int freq, int dir)
+{
+	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
+	struct q6afe_port *port = dai_data->port[dai->id];
+
+	switch (clk_id) {
+	case LPAIF_DIG_CLK:
+		return q6afe_port_set_sysclk(port, clk_id, 0, 5, freq, dir);
+	case LPAIF_BIT_CLK:
+	case LPAIF_OSR_CLK:
+		return q6afe_port_set_sysclk(port, clk_id,
+					     Q6AFE_LPASS_CLK_SRC_INTERNAL,
+					     Q6AFE_LPASS_CLK_ROOT_DEFAULT,
+					     freq, dir);
 	case Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT ... Q6AFE_LPASS_CLK_ID_QUIN_TDM_EBIT:
 		return q6afe_port_set_sysclk(port, clk_id,
 					     Q6AFE_LPASS_CLK_ATTRIBUTE_INVERT_COUPLE_NO,
@@ -468,6 +520,11 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"Tertiary MI2S Playback", NULL, "TERT_MI2S_RX"},
 	{"Quaternary MI2S Playback", NULL, "QUAT_MI2S_RX"},
 
+	{"Primary PCM Playback", NULL, "PRI_PCM_RX"},
+	{"Secondary PCM Playback", NULL, "SEC_PCM_RX"},
+	{"Tertiary PCM Playback", NULL, "TERT_PCM_RX"},
+	{"Quaternary PCM Playback", NULL, "QUAT_PCM_RX"},
+
 	{"Primary TDM0 Playback", NULL, "PRIMARY_TDM_RX_0"},
 	{"Primary TDM1 Playback", NULL, "PRIMARY_TDM_RX_1"},
 	{"Primary TDM2 Playback", NULL, "PRIMARY_TDM_RX_2"},
@@ -562,6 +619,11 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"PRI_MI2S_TX", NULL, "Primary MI2S Capture"},
 	{"SEC_MI2S_TX", NULL, "Secondary MI2S Capture"},
 	{"QUAT_MI2S_TX", NULL, "Quaternary MI2S Capture"},
+
+	{"PRI_PCM_TX", NULL, "Primary PCM Capture"},
+	{"SEC_PCM_TX", NULL, "Secondary PCM Capture"},
+	{"TERT_PCM_TX", NULL, "Tertiary PCM Capture"},
+	{"QUAT_PCM_TX", NULL, "Quaternary PCM Capture"},
 };
 
 static const struct snd_soc_dai_ops q6hdmi_ops = {
@@ -578,6 +640,14 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.set_sysclk	= q6afe_mi2s_set_sysclk,
 };
 
+static const struct snd_soc_dai_ops q6pcm_ops = {
+	.prepare	= q6afe_dai_prepare,
+	.hw_params	= q6pcm_hw_params,
+	.set_fmt	= q6pcm_set_fmt,
+	.shutdown	= q6afe_dai_shutdown,
+	.set_sysclk	= q6afe_mi2s_set_sysclk,
+};
+
 static const struct snd_soc_dai_ops q6slim_ops = {
 	.prepare	= q6afe_dai_prepare,
 	.hw_params	= q6slim_hw_params,
@@ -588,7 +658,7 @@ static const struct snd_soc_dai_ops q6slim_ops = {
 static const struct snd_soc_dai_ops q6tdm_ops = {
 	.prepare	= q6afe_dai_prepare,
 	.shutdown	= q6afe_dai_shutdown,
-	.set_sysclk	= q6afe_mi2s_set_sysclk,
+	.set_sysclk	= q6afe_tdm_set_sysclk,
 	.set_tdm_slot     = q6tdm_set_tdm_slot,
 	.set_channel_map  = q6tdm_set_channel_map,
 	.hw_params        = q6tdm_hw_params,
@@ -1012,6 +1082,115 @@ static struct snd_soc_dai_driver q6afe_dais[] = {
 		.ops = &q6i2s_ops,
 		.probe = msm_dai_q6_dai_probe,
 		.remove = msm_dai_q6_dai_remove,
+	}, {
+		.playback = {
+			.stream_name = "Primary PCM Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE,
+			.rate_min =     8000,
+			.rate_max =     16000,
+		},
+		.id = PRIMARY_PCM_RX,
+		.name = "PRI_PCM_RX",
+		.ops = &q6pcm_ops,
+		.probe = msm_dai_q6_dai_probe,
+		.remove = msm_dai_q6_dai_remove,
+	}, {
+		.capture = {
+			.stream_name = "Primary PCM Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE,
+			.rate_min =     8000,
+			.rate_max =     16000,
+		},
+		.id = PRIMARY_PCM_TX,
+		.name = "PRI_PCM_TX",
+		.ops = &q6pcm_ops,
+		.probe = msm_dai_q6_dai_probe,
+		.remove = msm_dai_q6_dai_remove,
+	}, {
+		.playback = {
+			.stream_name = "Secondary PCM Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.rate_min =     8000,
+			.rate_max =     16000,
+		},
+		.name = "SEC_PCM_RX",
+		.id = SECONDARY_PCM_RX,
+		.ops = &q6pcm_ops,
+		.probe = msm_dai_q6_dai_probe,
+		.remove = msm_dai_q6_dai_remove,
+	}, {
+		.capture = {
+			.stream_name = "Secondary PCM Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE,
+			.rate_min =     8000,
+			.rate_max =     16000,
+		},
+		.id = SECONDARY_PCM_TX,
+		.name = "SEC_PCM_TX",
+		.ops = &q6pcm_ops,
+		.probe = msm_dai_q6_dai_probe,
+		.remove = msm_dai_q6_dai_remove,
+	}, {
+		.playback = {
+			.stream_name = "Tertiary PCM Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.rate_min =     8000,
+			.rate_max =     16000,
+		},
+		.name = "TERT_PCM_RX",
+		.id = TERTIARY_PCM_RX,
+		.ops = &q6pcm_ops,
+		.probe = msm_dai_q6_dai_probe,
+		.remove = msm_dai_q6_dai_remove,
+	}, {
+		.capture = {
+			.stream_name = "Tertiary PCM Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE,
+			.rate_min =     8000,
+			.rate_max =     16000,
+		},
+		.id = TERTIARY_PCM_TX,
+		.name = "TERT_PCM_TX",
+		.ops = &q6pcm_ops,
+		.probe = msm_dai_q6_dai_probe,
+		.remove = msm_dai_q6_dai_remove,
+	}, {
+		.playback = {
+			.stream_name = "Quaternary PCM Playback",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+			.rate_min =     8000,
+			.rate_max =     16000,
+		},
+		.name = "QUAT_PCM_RX",
+		.id = QUATERNARY_PCM_RX,
+		.ops = &q6pcm_ops,
+		.probe = msm_dai_q6_dai_probe,
+		.remove = msm_dai_q6_dai_remove,
+	}, {
+		.capture = {
+			.stream_name = "Quaternary PCM Capture",
+			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE |
+				   SNDRV_PCM_FMTBIT_S24_LE,
+			.rate_min =     8000,
+			.rate_max =     16000,
+		},
+		.id = QUATERNARY_PCM_TX,
+		.name = "QUAT_PCM_TX",
+		.ops = &q6pcm_ops,
+		.probe = msm_dai_q6_dai_probe,
+		.remove = msm_dai_q6_dai_remove,
 	},
 	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
 	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
@@ -1169,6 +1348,23 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 	SND_SOC_DAPM_AIF_OUT("PRI_MI2S_TX", NULL,
 						0, 0, 0, 0),
 
+	SND_SOC_DAPM_AIF_IN("QUAT_PCM_RX", NULL,
+			    0, 0, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("QUAT_PCM_TX", NULL,
+			     0, 0, 0, 0),
+	SND_SOC_DAPM_AIF_IN("TERT_PCM_RX", NULL,
+			    0, 0, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("TERT_PCM_TX", NULL,
+			     0, 0, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SEC_PCM_RX", NULL,
+			    0, 0, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SEC_PCM_TX", NULL,
+			     0, 0, 0, 0),
+	SND_SOC_DAPM_AIF_IN("PRI_PCM_RX", NULL,
+			    0, 0, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("PRI_PCM_TX", NULL,
+			     0, 0, 0, 0),
+
 	SND_SOC_DAPM_AIF_IN("PRIMARY_TDM_RX_0", NULL,
 			     0, 0, 0, 0),
 	SND_SOC_DAPM_AIF_IN("PRIMARY_TDM_RX_1", NULL,
-- 
2.21.1

