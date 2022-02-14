Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C35A4B53E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 16:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348401AbiBNO7n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 09:59:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244446AbiBNO7n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 09:59:43 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E40439A;
        Mon, 14 Feb 2022 06:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644850775; x=1676386775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=w3RKeE0AkTp0vTxNTvZMcYwIAerjV4UXdCebiEAKxwE=;
  b=c9h7t74EDKQPcNDhJCoMahdxgsMzCFudhY9dase3VCVAmqtYv/YFDrg6
   h3BNqQnK5QxOYq6GJUL5Rai1DK1GOLvLVt+vSkqsTiE0nC57TpoTVnjry
   3e7+kpCQLnRw9JsYArhYFr9gqPELmAMMENf/JYjwSerF5VhIm0W71blB/
   o=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 14 Feb 2022 06:59:35 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 06:59:34 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Feb 2022 06:59:34 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 14 Feb 2022 06:59:28 -0800
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
        <quic_plai@quicinc.com>, <bgoswami@codeaurora.org>,
        <perex@perex.cz>, <tiwai@suse.com>,
        <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <swboyd@chromium.org>, <judyhsiao@chromium.org>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        "Venkata Prasad Potturu" <quic_potturu@quicinc.com>
Subject: [RESEND v13 08/10] ASoC: qcom: Add lpass CPU driver for codec dma control
Date:   Mon, 14 Feb 2022 20:28:26 +0530
Message-ID: <1644850708-11099-9-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
References: <1644850708-11099-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add lpass cpu driver to support audio over codec dma for
ADSP bypass usecase.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-cdc-dma.c | 304 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass.h         |   1 +
 2 files changed, 305 insertions(+)
 create mode 100644 sound/soc/qcom/lpass-cdc-dma.c

diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
new file mode 100644
index 0000000..4a50baa
--- /dev/null
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 The Linux Foundation. All rights reserved.
+ *
+ * lpass-cdc-dma.c -- ALSA SoC CDC DMA CPU DAI driver for QTi LPASS
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
+#define CODEC_MEM_FREQ_NORMAL 153600000
+
+enum codec_dma_interfaces {
+	LPASS_CDC_DMA_INTERFACE1 = 1,
+	LPASS_CDC_DMA_INTERFACE2,
+	LPASS_CDC_DMA_INTERFACE3,
+	LPASS_CDC_DMA_INTERFACE4,
+	LPASS_CDC_DMA_INTERFACE5,
+	LPASS_CDC_DMA_INTERFACE6,
+	LPASS_CDC_DMA_INTERFACE7,
+	LPASS_CDC_DMA_INTERFACE8,
+	LPASS_CDC_DMA_INTERFACE9,
+	LPASS_CDC_DMA_INTERFACE10,
+};
+
+static void __lpass_get_dmactl_handle(struct snd_pcm_substream *substream, struct snd_soc_dai *dai,
+				      struct lpaif_dmactl **dmactl, int *id)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *rt = substream->runtime;
+	struct lpass_pcm_data *pcm_data = rt->private_data;
+	struct lpass_variant *v = drvdata->variant;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	switch (dai_id) {
+	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
+		*dmactl = drvdata->rxtx_rd_dmactl;
+		*id = pcm_data->dma_ch;
+		break;
+	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
+		*dmactl = drvdata->rxtx_wr_dmactl;
+		*id = pcm_data->dma_ch - v->rxtx_wrdma_channel_start;
+		break;
+	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
+		*dmactl = drvdata->va_wr_dmactl;
+		*id = pcm_data->dma_ch - v->va_wrdma_channel_start;
+		break;
+	default:
+		dev_err(soc_runtime->dev, "invalid dai id for dma ctl: %d\n", dai_id);
+		break;
+	}
+}
+
+static int __lpass_get_codec_dma_intf_type(int dai_id)
+{
+	int ret;
+
+	switch (dai_id) {
+	case LPASS_CDC_DMA_RX0:
+	case LPASS_CDC_DMA_TX0:
+	case LPASS_CDC_DMA_VA_TX0:
+		ret = LPASS_CDC_DMA_INTERFACE1;
+		break;
+	case LPASS_CDC_DMA_RX1:
+	case LPASS_CDC_DMA_TX1:
+	case LPASS_CDC_DMA_VA_TX1:
+		ret = LPASS_CDC_DMA_INTERFACE2;
+		break;
+	case LPASS_CDC_DMA_RX2:
+	case LPASS_CDC_DMA_TX2:
+	case LPASS_CDC_DMA_VA_TX2:
+		ret = LPASS_CDC_DMA_INTERFACE3;
+		break;
+	case LPASS_CDC_DMA_RX3:
+	case LPASS_CDC_DMA_TX3:
+	case LPASS_CDC_DMA_VA_TX3:
+		ret = LPASS_CDC_DMA_INTERFACE4;
+		break;
+	case LPASS_CDC_DMA_RX4:
+	case LPASS_CDC_DMA_TX4:
+	case LPASS_CDC_DMA_VA_TX4:
+		ret = LPASS_CDC_DMA_INTERFACE5;
+		break;
+	case LPASS_CDC_DMA_RX5:
+	case LPASS_CDC_DMA_TX5:
+	case LPASS_CDC_DMA_VA_TX5:
+		ret = LPASS_CDC_DMA_INTERFACE6;
+		break;
+	case LPASS_CDC_DMA_RX6:
+	case LPASS_CDC_DMA_TX6:
+	case LPASS_CDC_DMA_VA_TX6:
+		ret = LPASS_CDC_DMA_INTERFACE7;
+		break;
+	case LPASS_CDC_DMA_RX7:
+	case LPASS_CDC_DMA_TX7:
+	case LPASS_CDC_DMA_VA_TX7:
+		ret = LPASS_CDC_DMA_INTERFACE8;
+		break;
+	case LPASS_CDC_DMA_RX8:
+	case LPASS_CDC_DMA_TX8:
+	case LPASS_CDC_DMA_VA_TX8:
+		ret = LPASS_CDC_DMA_INTERFACE9;
+		break;
+	case LPASS_CDC_DMA_RX9:
+		ret  = LPASS_CDC_DMA_INTERFACE10;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static int __lpass_platform_codec_intf_init(struct snd_soc_dai *dai,
+					    struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	struct lpaif_dmactl *dmactl = NULL;
+	struct device *dev = soc_runtime->dev;
+	int ret, id, codec_intf;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	codec_intf = __lpass_get_codec_dma_intf_type(dai_id);
+	if (codec_intf < 0) {
+		dev_err(dev, "failed to get codec_intf: %d\n", codec_intf);
+		return codec_intf;
+	}
+
+	__lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
+	if (!dmactl) {
+		dev_err(dev, "failed to get dmactl handle for dai_id: %d\n", dai_id);
+		return -EINVAL;
+	}
+
+	ret = regmap_fields_write(dmactl->codec_intf, id, codec_intf);
+	if (ret) {
+		dev_err(dev, "error writing to dmactl codec_intf reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_fs_sel, id, 0x0);
+	if (ret) {
+		dev_err(dev, "error writing to dmactl codec_fs_sel reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_fs_delay, id, 0x0);
+	if (ret) {
+		dev_err(dev, "error writing to dmactl codec_fs_delay reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_pack, id, 0x1);
+	if (ret) {
+		dev_err(dev, "error writing to dmactl codec_pack reg field: %d\n", ret);
+		return ret;
+	}
+	ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_ON);
+	if (ret) {
+		dev_err(dev, "error writing to dmactl codec_enable reg field: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int lpass_cdc_dma_daiops_startup(struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+
+	switch (dai->id) {
+	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
+	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
+		clk_set_rate(drvdata->cdc_clks[2].clk, CODEC_MEM_FREQ_NORMAL);
+		clk_prepare_enable(drvdata->cdc_clks[2].clk);
+		break;
+	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
+		clk_set_rate(drvdata->cdc_clks[5].clk, CODEC_MEM_FREQ_NORMAL);
+		clk_prepare_enable(drvdata->cdc_clks[5].clk);
+		break;
+	default:
+		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
+		break;
+	}
+	return 0;
+}
+
+static void lpass_cdc_dma_daiops_shutdown(struct snd_pcm_substream *substream,
+				      struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+
+	switch (dai->id) {
+	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
+	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
+		clk_disable_unprepare(drvdata->cdc_clks[2].clk);
+		break;
+	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX0:
+		clk_disable_unprepare(drvdata->cdc_clks[5].clk);
+		break;
+	default:
+		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai->id);
+		break;
+	}
+}
+
+static int lpass_cdc_dma_daiops_hw_params(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct lpaif_dmactl *dmactl = NULL;
+	unsigned int ret, regval;
+	unsigned int channels = params_channels(params);
+	int id;
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
+	__lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
+	if (!dmactl) {
+		dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
+		return -EINVAL;
+	}
+	ret = regmap_fields_write(dmactl->codec_channel, id, regval);
+	if (ret) {
+		dev_err(soc_runtime->dev,
+			"error writing to dmactl codec_channel reg field: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static int lpass_cdc_dma_daiops_trigger(struct snd_pcm_substream *substream,
+				    int cmd, struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct lpaif_dmactl *dmactl;
+	int ret = 0, id;
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
+		__lpass_get_dmactl_handle(substream, dai, &dmactl, &id);
+		if (!dmactl) {
+			dev_err(soc_runtime->dev, "failed to get dmactl handle\n");
+			return -EINVAL;
+		}
+		ret = regmap_fields_write(dmactl->codec_enable, id, LPAIF_DMACTL_ENABLE_OFF);
+		if (ret) {
+			dev_err(soc_runtime->dev,
+				"error writing to dmactl codec_enable reg: %d\n", ret);
+			return ret;
+		}
+		break;
+	default:
+		ret = -EINVAL;
+		dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, cmd);
+		break;
+	}
+	return ret;
+}
+
+const struct snd_soc_dai_ops asoc_qcom_lpass_cdc_dma_dai_ops = {
+	.startup	= lpass_cdc_dma_daiops_startup,
+	.shutdown	= lpass_cdc_dma_daiops_shutdown,
+	.hw_params	= lpass_cdc_dma_daiops_hw_params,
+	.trigger	= lpass_cdc_dma_daiops_trigger,
+};
+EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cdc_dma_dai_ops);
+
+MODULE_DESCRIPTION("QTi LPASS CDC DMA Driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index e059c4a..d279a72 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -410,5 +410,6 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
 extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
 int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
 				struct snd_soc_dai *dai);
+extern const struct snd_soc_dai_ops asoc_qcom_lpass_cdc_dma_dai_ops;
 
 #endif /* __LPASS_H__ */
-- 
2.7.4

