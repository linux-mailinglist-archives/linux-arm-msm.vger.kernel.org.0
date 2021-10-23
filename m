Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BCE14382C5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Oct 2021 11:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbhJWJ5U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Oct 2021 05:57:20 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:30354 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbhJWJ5Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Oct 2021 05:57:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634982897; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ELsg9IdAUzcR72uofZF9W9/EiaBhWfswgeYqyyR0T0M=; b=pl0av/MGhdEvm7VOBjbZscnCTcnJPFwHYre2gNT9BL0eeys/A5uCGLnRXZNokk09Mj6X6nz/
 sXay4DQ0o3g6PKRcZhXYqWiiwtpKEJydufymKqiN099Q4Ugzjb9p6tjAJOPKB1IOg92XDPsd
 J+IYT7IUDDXPDBORTGfIvpfoFbA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6173dbe3fd91319f0f4d13ce (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 23 Oct 2021 09:54:43
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0B742C43637; Sat, 23 Oct 2021 09:54:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A9C65C43618;
        Sat, 23 Oct 2021 09:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A9C65C43618
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
Subject: [PATCH v3 04/10] ASoC: qcom: Add lpass CPU driver for codec dma control
Date:   Sat, 23 Oct 2021 15:23:56 +0530
Message-Id: <1634982842-7477-5-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634982842-7477-1-git-send-email-srivasam@codeaurora.org>
References: <1634982842-7477-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add lpass cpu driver to support audio over codec dma for
ADSP bypass usecase.

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 sound/soc/qcom/lpass-cdc-dma.c | 195 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass.h         |   1 +
 2 files changed, 196 insertions(+)
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
new file mode 100644
index 0000000..f5bfda9
--- /dev/null
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 The Linux Foundation. All rights reserved.
+ *
+ * lpass-cdc-dma.c -- ALSA SoC WCD -CPU DAI driver for QTi LPASS WCD
+ */
+
+#include <linux/clk.h>
+#include <linux/module.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+
+#include "lpass-lpaif-reg.h"
+#include "lpass.h"
+
+static void __get_dmactl_handle(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
+					struct lpaif_dmactl **dmactl, int *id)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_pcm_data *pcm_data = rt->private_data;
+	struct lpass_variant *v = drvdata->variant;
+	int dir = substream->stream;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK) {
+		*dmactl = drvdata->rxtx_rd_dmactl;
+		*id = pcm_data->dma_ch;
+	} else {
+		if (dai_id == LPASS_CDC_DMA_TX3) {
+			*dmactl = drvdata->rxtx_wr_dmactl;
+			*id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
+		} else if (dai_id == LPASS_CDC_DMA_VA_TX0) {
+			*dmactl = drvdata->va_wr_dmactl;
+			*id = pcm_data->dma_ch - v->va_wrdma_channel_start;
+		}
+	}
+}
+
+static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
+					 struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpaif_dmactl *dmactl;
+	int dir = substream->stream;
+	int ret, id, codec_intf;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
+		codec_intf = LPASS_CDC_DMA_RX0_INTERFACE;
+	else
+		codec_intf = LPASS_CDC_DMA_INTERFACE(dai_id);
+
+	__get_dmactl_handle(substream, dai, &dmactl, &id);
+
+	ret = regmap_fields_write(dmactl->codec_intf, id, codec_intf);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to dmactl codec_intf reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to dmactl codec_fs_sel reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to dmactl codec_fs_delay reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to dmactl codec_pack reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_ON);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to dmactl codec_enable reg field: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int lpass_wcd_daiops_startup(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(drvdata->cdc_num_clks, drvdata->cdc_clks);
+	if (ret) {
+		dev_err(dai->dev, "error in enabling cdc dma clks: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void lpass_wcd_daiops_shutdown(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+
+	clk_bulk_disable_unprepare(drvdata->cdc_num_clks, drvdata->cdc_clks);
+}
+
+static int lpass_wcd_daiops_hw_params(struct snd_pcm_substream *substream,
+		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct lpaif_dmactl *dmactl;
+	unsigned int ret, regval;
+	unsigned int channels = params_channels(params);
+	int id;
+
+	__get_dmactl_handle(substream, dai, &dmactl, &id);
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
+			"error writing to dmactl codec_channel reg field: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int lpass_wcd_daiops_trigger(struct snd_pcm_substream *substream,
+		int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct lpaif_dmactl *dmactl;
+	int ret = 0, id;
+
+	__get_dmactl_handle(substream, dai, &dmactl, &id);
+
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
+				"error writing to dmactl codec_enable reg: %d\n", ret);
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
index 33e4ee5..74da4e9 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -421,5 +421,6 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
 extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
 int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
 				struct snd_soc_dai *dai);
+extern const struct snd_soc_dai_ops asoc_qcom_lpass_wcd_dai_ops;
 
 #endif /* __LPASS_H__ */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

