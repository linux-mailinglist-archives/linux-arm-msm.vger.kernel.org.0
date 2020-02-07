Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16F82156059
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 21:59:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727530AbgBGU7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 15:59:02 -0500
Received: from mail.serbinski.com ([162.218.126.2]:46992 "EHLO
        mail.serbinski.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727303AbgBGU6q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 15:58:46 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.serbinski.com (Postfix) with ESMTP id 4FE9DD00730;
        Fri,  7 Feb 2020 20:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at serbinski.com
Received: from mail.serbinski.com ([127.0.0.1])
        by localhost (mail.serbinski.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 3-cR2t8IMy7X; Fri,  7 Feb 2020 15:50:58 -0500 (EST)
Received: from anet (ipagstaticip-7ac5353e-e7de-3a0d-ff65-4540e9bc137f.sdsl.bell.ca [142.112.15.192])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mail.serbinski.com (Postfix) with ESMTPSA id 3857ED00722;
        Fri,  7 Feb 2020 15:50:30 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.serbinski.com 3857ED00722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=serbinski.com;
        s=default; t=1581108630;
        bh=zaw40z+MaGqwmP6pGRzvLwtGTChRHBQ2BFqSPCd0RK0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IHBSBgrPp7NjCE+SYir4MW129yCnJg0ZsVRCM5c9gTqOE82etvekyCyLCKmT5tCES
         Ca25IAzboLRMS7cT8Tf8JbusehE3YCFukWuHgCxxPu5SCWofoMH/RVdq0yPO9rEUli
         U27MwfMPlauSHMu/DvIzy0559cdeqVtZHE/WXuHY=
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
Subject: [PATCH 5/8] ASoC: qcom: apq8096: add support for primary and quaternary I2S/PCM
Date:   Fri,  7 Feb 2020 15:50:10 -0500
Message-Id: <20200207205013.12274-6-adam@serbinski.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200207205013.12274-1-adam@serbinski.com>
References: <20200207205013.12274-1-adam@serbinski.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds support to primary and quarternary I2S and PCM ports.

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
 sound/soc/qcom/apq8096.c | 86 +++++++++++++++++++++++++++++++++-------
 1 file changed, 71 insertions(+), 15 deletions(-)

diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index 94363fd6846a..1edcaa15234f 100644
--- a/sound/soc/qcom/apq8096.c
+++ b/sound/soc/qcom/apq8096.c
@@ -8,24 +8,13 @@
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
 #include "common.h"
+#include "qdsp6/q6afe.h"
 
 #define SLIM_MAX_TX_PORTS 16
 #define SLIM_MAX_RX_PORTS 16
 #define WCD9335_DEFAULT_MCLK_RATE	9600000
-
-static int apq8096_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
-				      struct snd_pcm_hw_params *params)
-{
-	struct snd_interval *rate = hw_param_interval(params,
-					SNDRV_PCM_HW_PARAM_RATE);
-	struct snd_interval *channels = hw_param_interval(params,
-					SNDRV_PCM_HW_PARAM_CHANNELS);
-
-	rate->min = rate->max = 48000;
-	channels->min = channels->max = 2;
-
-	return 0;
-}
+#define MI2S_BCLK_RATE			1536000
+#define PCM_BCLK_RATE			1024000
 
 static int msm_snd_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
@@ -33,10 +22,32 @@ static int msm_snd_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_interval *rate = hw_param_interval(params,
+					SNDRV_PCM_HW_PARAM_RATE);
+	struct snd_interval *channels = hw_param_interval(params,
+					SNDRV_PCM_HW_PARAM_CHANNELS);
 	u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret = 0;
 
+	switch (cpu_dai->id) {
+	case PRIMARY_PCM_RX:
+	case PRIMARY_PCM_TX:
+	case QUATERNARY_PCM_RX:
+	case QUATERNARY_PCM_TX:
+		rate->min = 16000;
+		rate->max = 16000;
+		channels->min = 1;
+		channels->max = 1;
+		break;
+	default:
+		rate->min = 48000;
+		rate->max = 48000;
+		channels->min = 1;
+		channels->max = 2;
+		break;
+	}
+
 	ret = snd_soc_dai_get_channel_map(codec_dai,
 				&tx_ch_cnt, tx_ch, &rx_ch_cnt, rx_ch);
 	if (ret != 0 && ret != -ENOTSUPP) {
@@ -60,8 +71,54 @@ static int msm_snd_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int msm_snd_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+
+	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX:
+	case PRIMARY_MI2S_TX:
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_CBS_CFS);
+		snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_CBS_CFS);
+		break;
+	case QUATERNARY_MI2S_RX:
+	case QUATERNARY_MI2S_TX:
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT,
+			MI2S_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_CBS_CFS);
+		snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_CBS_CFS);
+		break;
+	case PRIMARY_PCM_RX:
+	case PRIMARY_PCM_TX:
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_PRI_PCM_IBIT,
+			PCM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_CBS_CFS);
+		snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_CBS_CFS);
+		break;
+	case QUATERNARY_PCM_RX:
+	case QUATERNARY_PCM_TX:
+		snd_soc_dai_set_sysclk(cpu_dai,
+			Q6AFE_LPASS_CLK_ID_QUAD_PCM_IBIT,
+			PCM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
+		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_CBS_CFS);
+		snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_CBS_CFS);
+		break;
+	default:
+		return -1;
+	}
+	return 0;
+}
+
 static struct snd_soc_ops apq8096_ops = {
 	.hw_params = msm_snd_hw_params,
+	.startup = msm_snd_startup,
 };
 
 static int apq8096_init(struct snd_soc_pcm_runtime *rtd)
@@ -96,7 +153,6 @@ static void apq8096_add_be_ops(struct snd_soc_card *card)
 
 	for_each_card_prelinks(card, i, link) {
 		if (link->no_pcm == 1) {
-			link->be_hw_params_fixup = apq8096_be_hw_params_fixup;
 			link->init = apq8096_init;
 			link->ops = &apq8096_ops;
 		}
-- 
2.21.1

