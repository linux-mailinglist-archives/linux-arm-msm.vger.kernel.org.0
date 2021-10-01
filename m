Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF6D41EBAF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 13:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353826AbhJALYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 07:24:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46392 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1353816AbhJALY2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 07:24:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633087364; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=rME+nC0m199ZmuTpRVmVeo/Ci0Dmiq/V1rCel24i118=; b=QPk6o4LGAExwM7e9xk9gW5VQULnbxTTcLS7YCcgXroBluGDmJASu7dEhq8WPqSRQ9XnJ6TaM
 uJc2Bm95TdW4Gd5oaRKJS18CSLAlrspwSbjT4sjWZkeuB+MSGoxPGB/r//r7ARWzgrmhooLF
 N6tYkb09qPZ2x9a0p4lc0PoikCA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6156ef67605ecf100ba046dc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 11:22:15
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 15907C43635; Fri,  1 Oct 2021 11:22:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 76998C4338F;
        Fri,  1 Oct 2021 11:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 76998C4338F
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
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: [PATCH 4/8] ASoC: qcom: Add lapss CPU driver for codec dma control
Date:   Fri,  1 Oct 2021 16:51:28 +0530
Message-Id: <1633087292-1378-5-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
References: <1633087292-1378-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add lpass cpu driver to support audio over codec dma for
ADSP bypass usecase.

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/qcom/lpass-cdc-dma.c | 263 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass.h         |   1 +
 2 files changed, 264 insertions(+)
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
new file mode 100644
index 0000000..56b3791
--- /dev/null
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 The Linux Foundation. All rights reserved.
+ *
+ * lpass-cdc-dma.c -- ALSA SoC WCD -CPU DAI driver for QTi LPASS WCD
+ */
+
+#include <linux/module.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "lpass-lpaif-reg.h"
+#include "lpass.h"
+
+static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
+					 struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_pcm_data *pcm_data = rt->private_data;
+	struct lpass_variant *v = drvdata->variant;
+	struct lpaif_dmactl *dmactl;
+	struct regmap *map;
+	int dir = substream->stream;
+	int ret, id;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
+		dmactl = drvdata->rxtx_rd_dmactl;
+		map = drvdata->rxtx_lpaif_map;
+		id = pcm_data->dma_ch;
+	} else {
+		if (dai_id == LPASS_CDC_DMA_TX3) {
+			dmactl = drvdata->rxtx_wr_dmactl;
+			map = drvdata->rxtx_lpaif_map;
+			id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
+		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
+			dmactl = drvdata->va_wr_dmactl;
+			map = drvdata->va_lpaif_map;
+			id = pcm_data->dma_ch - v->va_wrdma_channel_start;
+		}
+	}
+
+	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = regmap_fields_write(dmactl->codec_intf, id, LPASS_CDC_DMA_RX0_INTERFACE);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to rdmactl reg: %d\n", ret);
+			return ret;
+		}
+	    ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to rdmactl reg: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to rdmactl codec_fs_delay reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to rdmactl codec_pack reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_ON);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to rdmactl reg: %d\n", ret);
+			return ret;
+		}
+
+	} else {
+		ret = regmap_fields_write(dmactl->codec_intf, id, LPASS_CDC_DMA_INTERFACE(dai_id));
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to wrdmactl codec_intf reg field: %d\n", ret);
+			return ret;
+		}
+	    ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to wrdmactl codec_fs_sel reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to wrdmactl codec_fs_delay reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to wrdmactl codec_pack reg field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_ON);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to wrdmactl codec_enable reg field: %d\n", ret);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+static int lpass_wcd_daiops_startup(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	int ret, i;
+
+	for (i = 0; i < drvdata->cdc_num_clks; i++) {
+		ret = clk_prepare_enable(drvdata->cdc_dma_clks[i]);
+		if (ret) {
+			dev_err(dai->dev, "error in enabling cdc dma clks: %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static void lpass_wcd_daiops_shutdown(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	int i;
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+
+	for (i = 0; i < drvdata->cdc_num_clks; i++)
+		clk_disable_unprepare(drvdata->cdc_dma_clks[i]);
+}
+
+static int lpass_wcd_daiops_hw_params(struct snd_pcm_substream *substream,
+		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpaif_dmactl *dmactl;
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_pcm_data *pcm_data = rt->private_data;
+	struct lpass_variant *v = drvdata->variant;
+	struct regmap *map;
+	int dir = substream->stream;
+	unsigned int ret, regval;
+	unsigned int channels = params_channels(params);
+	int id;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		dmactl = drvdata->rxtx_rd_dmactl;
+		map = drvdata->rxtx_lpaif_map;
+		id = pcm_data->dma_ch;
+	} else {
+		if (dai_id == LPASS_CDC_DMA_TX3) {
+			dmactl = drvdata->rxtx_wr_dmactl;
+			map = drvdata->rxtx_lpaif_map;
+			id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
+		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
+			dmactl = drvdata->va_wr_dmactl;
+			map = drvdata->va_lpaif_map;
+			id = pcm_data->dma_ch - v->va_wrdma_channel_start;
+		}
+	}
+
+	switch (channels) {
+	case 1:
+		regval = LPASS_CDC_DMA_INTF_ONE_CHANNEL;
+		break;
+	case 2:
+		regval = LPASS_CDC_DMA_INTF_TWO_CHANNEL;
+		break;
+	case 4:
+		regval = LPASS_CDC_DMA_INTF_FOUR_CHANNEL;
+		break;
+	case 6:
+		regval = LPASS_CDC_DMA_INTF_SIX_CHANNEL;
+		break;
+	case 8:
+		regval = LPASS_CDC_DMA_INTF_EIGHT_CHANNEL;
+		break;
+	default:
+		dev_err(soc_runtime->dev, "invalid PCM config\n");
+		return -EINVAL;
+	}
+
+	ret = regmap_fields_write(dmactl->codec_channel, id, regval);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to rdmactl codec_channel reg field: %d\n", ret);
+		return ret;
+	}
+	return ret;
+}
+
+static int lpass_wcd_daiops_trigger(struct snd_pcm_substream *substream,
+		int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_pcm_data *pcm_data = rt->private_data;
+	struct lpass_variant *v = drvdata->variant;
+	int dir = substream->stream;
+	struct lpaif_dmactl *dmactl;
+	struct regmap *map;
+	unsigned int dai_id = cpu_dai->driver->id;
+	int ret = 0, id;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		dmactl = drvdata->rxtx_rd_dmactl;
+		map = drvdata->rxtx_lpaif_map;
+		id = pcm_data->dma_ch;
+	} else {
+		if (dai_id == LPASS_CDC_DMA_TX3) {
+			dmactl = drvdata->rxtx_wr_dmactl;
+			map = drvdata->rxtx_lpaif_map;
+			id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
+		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
+			dmactl = drvdata->va_wr_dmactl;
+			map = drvdata->va_lpaif_map;
+			id = pcm_data->dma_ch - v->va_wrdma_channel_start;
+		}
+	}
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		__lpass_platform_codec_intf_init(dai, substream);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_OFF);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to rdmactl reg: %d\n", ret);
+			return ret;
+		}
+
+		break;
+	}
+	return ret;
+}
+
+const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops = {
+	.startup	= lpass_wcd_daiops_startup,
+	.shutdown	= lpass_wcd_daiops_shutdown,
+	.hw_params	= lpass_wcd_daiops_hw_params,
+	.trigger	= lpass_wcd_daiops_trigger,
+};
+EXPORT_SYMBOL_GPL(asoc_qcom_lpass_wcd_dai_ops);
+
+MODULE_DESCRIPTION("QTi LPASS CDC DMA Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 058b42d..e0ea698 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -418,5 +418,6 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
 extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
 int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
 				struct snd_soc_dai *dai);
+extern const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops;
 
 #endif /* __LPASS_H__ */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

