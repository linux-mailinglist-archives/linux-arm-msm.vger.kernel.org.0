Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 908FD403ED4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 20:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349335AbhIHSDr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 14:03:47 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:34702 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349030AbhIHSDn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 14:03:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631124155; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=N+6r2hK8mTzNM1q9Yeqe/17mfjph0gZR2//tfdNAcHc=; b=c2GIfQN+WJ6+rnUtLqsXhqJiisnuygBG4Epudv0PFuVCt+ETO7lP1MmWqNAJz0gYS6CTf4OU
 T0RZmXPoMT6foZM/pwLl7KCbfGyT/FLjUTE5mGOid5dDEiIfrUX+9U4zUwYBxwuubJ/azUY9
 qneDchAeNeom2aupBtzTEMVELpA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6138fa801567234b8cfb60cc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Sep 2021 18:01:36
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8BC0EC4360D; Wed,  8 Sep 2021 18:01:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A5DDAC4360C;
        Wed,  8 Sep 2021 18:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A5DDAC4360C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH 2/2] ASoC: qcom: SC7280: Add machine driver
Date:   Wed,  8 Sep 2021 23:30:57 +0530
Message-Id: <1631124057-17155-3-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631124057-17155-1-git-send-email-srivasam@codeaurora.org>
References: <1631124057-17155-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add new machine driver to register sound card on sc7280 based targets and
do the required configuration for lpass cpu dai and external codecs
connected over MI2S and soundwire interfaces.
Add support for audio jack detection, soundwire init and MBHC.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/Kconfig  |  12 ++
 sound/soc/qcom/Makefile |   2 +
 sound/soc/qcom/sc7280.c | 347 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 361 insertions(+)
 create mode 100644 sound/soc/qcom/sc7280.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index cc7c1de..d9ffcb7 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -152,4 +152,16 @@ config SND_SOC_SC7180
 	  SC7180 SoC-based systems.
 	  Say Y if you want to use audio device on this SoCs.
 
+config SND_SOC_SC7280
+	tristate "SoC Machine driver for SC7280 boards"
+	depends on I2C && SOUNDWIRE
+	select SND_SOC_QCOM_COMMON
+	select SND_SOC_MAX98357A
+	select SND_SOC_LPASS_RX_MACRO
+	select SND_SOC_LPASS_TX_MACRO
+	help
+	  To add support for audio on Qualcomm Technologies Inc.
+	  SC7280 SoC-based systems.
+	  Say Y if you want to use audio device on this SoCs.
+
 endif #SND_SOC_QCOM
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 1600ae5..625aec6 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -19,6 +19,7 @@ snd-soc-storm-objs := storm.o
 snd-soc-apq8016-sbc-objs := apq8016_sbc.o
 snd-soc-apq8096-objs := apq8096.o
 snd-soc-sc7180-objs := sc7180.o
+snd-soc-sc7280-objs := sc7280.o
 snd-soc-sdm845-objs := sdm845.o
 snd-soc-sm8250-objs := sm8250.o
 snd-soc-qcom-common-objs := common.o
@@ -27,6 +28,7 @@ obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
 obj-$(CONFIG_SND_SOC_MSM8996) += snd-soc-apq8096.o
 obj-$(CONFIG_SND_SOC_SC7180) += snd-soc-sc7180.o
+obj-$(CONFIG_SND_SOC_SC7280) += snd-soc-sc7280.o
 obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
 obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
new file mode 100644
index 0000000..1ab29f6
--- /dev/null
+++ b/sound/soc/qcom/sc7280.c
@@ -0,0 +1,347 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+//
+// sc7280.c -- ALSA SoC Machine driver for sc7280
+
+#include <dt-bindings/sound/sc7180-lpass.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <sound/core.h>
+#include <sound/jack.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <uapi/linux/input-event-codes.h>
+
+#include "../codecs/wcd938x.h"
+#include "common.h"
+#include "lpass.h"
+
+#define DRIVER_NAME "SC7280"
+#define LPASS_MAX_PORTS  (LPASS_CDC_DMA_VA_TX8 + 1)
+
+
+struct sc7280_snd_data {
+	bool stream_prepared[LPASS_MAX_PORTS];
+	struct snd_soc_card card;
+	struct sdw_stream_runtime *sruntime[LPASS_MAX_PORTS];
+	struct snd_soc_jack hs_jack;
+	struct snd_soc_jack hdmi_jack;
+	bool jack_setup;
+};
+
+static void sc7280_jack_free(struct snd_jack *jack)
+{
+	struct snd_soc_component *component = jack->private_data;
+
+	snd_soc_component_set_jack(component, NULL, NULL);
+}
+
+static int sc7280_headset_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	struct snd_jack *jack;
+	int rval, i;
+
+	if (!pdata->jack_setup) {
+		rval = snd_soc_card_jack_new(card, "Headset Jack",
+							SND_JACK_HEADSET | SND_JACK_LINEOUT |
+							SND_JACK_MECHANICAL |
+							SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+							SND_JACK_BTN_4 | SND_JACK_BTN_5,
+							&pdata->hs_jack, NULL, 0);
+
+		if (rval < 0) {
+			dev_err(card->dev, "Unable to add Headset Jack\n");
+			return rval;
+		}
+
+		jack = pdata->hs_jack.jack;
+
+		snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_MEDIA);
+		snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+		snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+		snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
+		jack->private_data = component;
+		jack->private_free = sc7280_jack_free;
+		pdata->jack_setup = true;
+	}
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_TX3:
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			rval = snd_soc_component_set_jack(component, &pdata->hs_jack, NULL);
+			if (rval != 0 && rval != -EOPNOTSUPP) {
+				dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+				return rval;
+			}
+		}
+
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int sc7280_hdmi_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	struct snd_jack *jack;
+	int rval;
+
+	rval = snd_soc_card_jack_new(
+			card, "HDMI Jack",
+			SND_JACK_LINEOUT,
+			&pdata->hdmi_jack, NULL, 0);
+
+	if (rval < 0) {
+		dev_err(card->dev, "Unable to add HDMI Jack\n");
+		return rval;
+	}
+
+	jack = pdata->hdmi_jack.jack;
+	jack->private_data = component;
+	jack->private_free = sc7280_jack_free;
+
+	return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
+}
+
+static int sc7280_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_TX3:
+		return sc7280_headset_init(rtd);
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_VA_TX0:
+	case MI2S_SECONDARY:
+		return 0;
+	case LPASS_DP_RX:
+		return sc7280_hdmi_init(rtd);
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int sc7280_snd_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_VA_TX0:
+		break;
+	case MI2S_SECONDARY:
+		break;
+	case LPASS_DP_RX:
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int sc7280_snd_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sc7280_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime;
+	int i;
+
+	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2, 2);
+	snd_pcm_hw_constraint_minmax(runtime, SNDRV_PCM_HW_PARAM_RATE, 48000, 48000);
+
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_RX0:
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			sruntime = snd_soc_dai_get_sdw_stream(codec_dai, substream->stream);
+			if (sruntime != ERR_PTR(-EOPNOTSUPP))
+				pdata->sruntime[cpu_dai->id] = sruntime;
+		}
+		break;
+	}
+
+	return 0;
+
+}
+
+static int sc7280_snd_swr_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+	int ret;
+
+	if (!sruntime)
+		return 0;
+
+	if (data->stream_prepared[cpu_dai->id]) {
+		sdw_disable_stream(sruntime);
+		sdw_deprepare_stream(sruntime);
+		data->stream_prepared[cpu_dai->id] = false;
+	}
+
+	ret = sdw_prepare_stream(sruntime);
+	if (ret)
+		return ret;
+
+	ret = sdw_enable_stream(sruntime);
+	if (ret) {
+		sdw_deprepare_stream(sruntime);
+		return ret;
+	}
+	data->stream_prepared[cpu_dai->id]  = true;
+
+	return ret;
+}
+
+
+static int sc7280_snd_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_TX3:
+		return sc7280_snd_swr_prepare(substream);
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int sc7280_snd_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_TX3:
+		if (sruntime && data->stream_prepared[cpu_dai->id]) {
+			sdw_disable_stream(sruntime);
+			sdw_deprepare_stream(sruntime);
+			data->stream_prepared[cpu_dai->id] = false;
+		}
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_VA_TX0:
+		break;
+	case MI2S_SECONDARY:
+		break;
+	case LPASS_DP_RX:
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__, cpu_dai->id);
+		break;
+	}
+}
+
+static const struct snd_soc_ops sc7280_ops = {
+	.startup = sc7280_snd_startup,
+	.shutdown = sc7280_snd_shutdown,
+	.hw_params = sc7280_snd_hw_params,
+	.hw_free = sc7280_snd_hw_free,
+	.prepare = sc7280_snd_prepare,
+};
+
+static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static int sc7280_snd_platform_probe(struct platform_device *pdev)
+{
+	struct snd_soc_card *card;
+	struct sc7280_snd_data *data;
+	struct device *dev = &pdev->dev;
+	struct snd_soc_dai_link *link;
+	int ret, i;
+
+	/* Allocate the private data */
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	card = &data->card;
+	data->jack_setup = false;
+	snd_soc_card_set_drvdata(card, data);
+
+	card->owner = THIS_MODULE;
+	card->driver_name = DRIVER_NAME;
+	card->dev = dev;
+
+	ret = qcom_snd_parse_of(card);
+	if (ret)
+		return ret;
+
+	for_each_card_prelinks(card, i, link) {
+		link->init = sc7280_init;
+		link->ops = &sc7280_ops;
+	}
+	ret = devm_snd_soc_register_card(dev, card);
+	return ret;
+}
+
+static const struct of_device_id sc7280_snd_device_id[]  = {
+	{.compatible = "google,sc7280-herobrine"},
+	{},
+};
+MODULE_DEVICE_TABLE(of, sc7280_snd_device_id);
+
+static struct platform_driver sc7280_snd_driver = {
+	.probe = sc7280_snd_platform_probe,
+	.driver = {
+		.name = "msm-snd-sc7280",
+		.of_match_table = sc7280_snd_device_id,
+		.pm = &snd_soc_pm_ops,
+	},
+};
+module_platform_driver(sc7280_snd_driver);
+
+MODULE_DESCRIPTION("sc7280 ASoC Machine Driver");
+MODULE_LICENSE("GPL v2");
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

