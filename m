Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 172FD4ED5FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 10:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbiCaIoL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Mar 2022 04:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233171AbiCaIoH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Mar 2022 04:44:07 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76691F6F1E
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 01:42:20 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id c11so19463689pgu.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Mar 2022 01:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+aE0R/lXzUk7zJvgpIyzEUdhyujK4IRdtbXraXjKl9I=;
        b=HMufMd7WglXhhQDkzZqZSsbrM8TtvGCB12JFrqP5twSXwGUkhtIKf+k/aYbDOeaMFV
         QHIbapPo4NUF4FinUA9ZT6Zy3zgwPG8lfhpnUXAbYTrgbfcRbwhn6xICSqawV5AoRsni
         onul6KFeELklCIfTk1Csw/424VV80AoozQ++0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+aE0R/lXzUk7zJvgpIyzEUdhyujK4IRdtbXraXjKl9I=;
        b=BmkIIQ3gXmZNxXQeLU78MhDl2NAFJuz+ypAo934CXFOpQXl0eDLqKG28PaH+uinTZI
         E3ZkXa+U5wqZ1gAPfn+N0C8XgCX2WhyTT3A3AeYvM2d6Ydipr1B+2AdbxUTyA1H9y4Ob
         S38dNAzZsJn9h6TEyfFKVyd2SpsHnWjTCVm5RhCq1QVoZh4VKn1Jq1pfKQ7XrN0S0Qq/
         5HbUocAaLlVxxdKl68C2/q72k8OS5SyeI+yZ2GlFI+Nj71vC0POP1wXN4eXPqDmlC86X
         xOPt2oZhm4xMfSpskUpep/dTO2xvj8RIT47IIaoHMtJ6L882OgyPfhZoWEA6uQ5h2NXC
         KOOw==
X-Gm-Message-State: AOAM530aLfmEYrhb99CH5leTxQMsoPFbGOyvJDU/gqDRapOsKgKXuBVI
        HZxakKIxTay+NcR3RgfoGh75zg==
X-Google-Smtp-Source: ABdhPJx6Za03E8aFKWtkYONZbUyj98eqWhvJ/dpPQnts7b30RCF+bR9M/JuZBv+LK0MkVotICxRyOA==
X-Received: by 2002:a65:6202:0:b0:382:1fbd:5bb3 with SMTP id d2-20020a656202000000b003821fbd5bb3mr10098402pgv.194.1648716140367;
        Thu, 31 Mar 2022 01:42:20 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com ([2401:fa00:1:17:88f1:170c:cc:666f])
        by smtp.gmail.com with ESMTPSA id q28-20020a656a9c000000b00372f7ecfcecsm4783036pgu.37.2022.03.31.01.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 01:42:19 -0700 (PDT)
From:   Judy Hsiao <judyhsiao@chromium.org>
To:     broonie@kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, dianders@chromium.org,
        cychiang@google.com, yuhsuan@chromium.org, judyhsiao@google.com,
        swboyd@chromium.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, Judy Hsiao <judyhsiao@chromium.org>
Subject: [v2] ASoC: qcom: Add driver support for ALC5682I-VS
Date:   Thu, 31 Mar 2022 16:42:01 +0800
Message-Id: <20220331084201.62815-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Machine driver support for ALC5682I-VS codec.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---

Changes from v1[1]:
 - Fix nits and use SND_SOC_DAIFMT_CBC_CFS.
 - Fix return value when snd_soc_dai_set_sysclk failed.

[1]: https://patchwork.kernel.org/project/alsa-devel/patch/20220330084519.3863856-1-judyhsiao@chromium.org/

 sound/soc/qcom/Kconfig  |   2 +
 sound/soc/qcom/sc7280.c | 107 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 28d0dfb4033c..750653404ba3 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -197,6 +197,8 @@ config SND_SOC_SC7280
 	select SND_SOC_LPASS_MACRO_COMMON
 	imply SND_SOC_LPASS_RX_MACRO
 	imply SND_SOC_LPASS_TX_MACRO
+	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
 	help
 	  Add support for audio on Qualcomm Technologies Inc.
 	  SC7280 SoC-based systems.
diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index bd0bf9c8cb28..8c0bbae490dd 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -12,14 +12,21 @@
 #include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
+#include <sound/rt5682s.h>
 #include <linux/soundwire/sdw.h>
 
+#include "../codecs/rt5682.h"
+#include "../codecs/rt5682s.h"
 #include "common.h"
 #include "lpass.h"
 
+#define DEFAULT_MCLK_RATE              19200000
+#define RT5682_PLL1_FREQ (48000 * 512)
+
 struct sc7280_snd_data {
 	struct snd_soc_card card;
 	struct sdw_stream_runtime *sruntime[LPASS_MAX_PORTS];
+	u32 pri_mi2s_clk_count;
 	struct snd_soc_jack hs_jack;
 	struct snd_soc_jack hdmi_jack;
 	bool jack_setup;
@@ -69,6 +76,7 @@ static int sc7280_headset_init(struct snd_soc_pcm_runtime *rtd)
 		pdata->jack_setup = true;
 	}
 	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
 	case LPASS_CDC_DMA_RX0:
 	case LPASS_CDC_DMA_TX3:
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
@@ -110,11 +118,51 @@ static int sc7280_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
 }
 
+static int sc7280_rt5682_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	if (++data->pri_mi2s_clk_count == 1) {
+		snd_soc_dai_set_sysclk(cpu_dai,
+			LPASS_MCLK0,
+			DEFAULT_MCLK_RATE,
+			SNDRV_PCM_STREAM_PLAYBACK);
+	}
+	snd_soc_dai_set_fmt(codec_dai,
+				SND_SOC_DAIFMT_CBC_CFC |
+				SND_SOC_DAIFMT_NB_NF |
+				SND_SOC_DAIFMT_I2S);
+
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682S_PLL1, RT5682S_PLL_S_BCLK1,
+					1536000, RT5682_PLL1_FREQ);
+	if (ret) {
+		dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682S_SCLK_S_PLL1,
+					RT5682_PLL1_FREQ,
+					SND_SOC_CLOCK_IN);
+
+	if (ret) {
+		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int sc7280_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
 	case LPASS_CDC_DMA_TX3:
 		return sc7280_headset_init(rtd);
 	case LPASS_CDC_DMA_RX0:
@@ -227,10 +275,66 @@ static int sc7280_snd_hw_free(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
+		if (--data->pri_mi2s_clk_count == 0) {
+			snd_soc_dai_set_sysclk(cpu_dai,
+					       LPASS_MCLK0,
+					       0,
+					       SNDRV_PCM_STREAM_PLAYBACK);
+		}
+		break;
+	case MI2S_SECONDARY:
+		break;
+	case LPASS_DP_RX:
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
+			cpu_dai->id);
+		break;
+	}
+}
+
+static int sc7280_snd_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	int ret = 0;
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
+		ret = sc7280_rt5682_init(rtd);
+		break;
+	case MI2S_SECONDARY:
+		break;
+	case LPASS_DP_RX:
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
+			cpu_dai->id);
+		return -EINVAL;
+	}
+	return ret;
+}
+
 static const struct snd_soc_ops sc7280_ops = {
+	.startup = sc7280_snd_startup,
 	.hw_params = sc7280_snd_hw_params,
 	.hw_free = sc7280_snd_hw_free,
 	.prepare = sc7280_snd_prepare,
+	.shutdown = sc7280_snd_shutdown,
+};
+
+static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
 static int sc7280_snd_platform_probe(struct platform_device *pdev)
@@ -252,6 +356,9 @@ static int sc7280_snd_platform_probe(struct platform_device *pdev)
 	card->driver_name = "SC7280";
 	card->dev = dev;
 
+	card->dapm_widgets = sc7280_snd_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(sc7280_snd_widgets);
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
-- 
2.35.1.1021.g381101b075-goog

