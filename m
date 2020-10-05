Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A564F282F4D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 06:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbgJEEOj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 00:14:39 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:62561 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725935AbgJEEOg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 00:14:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601871272; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=6+XxqIhw2cNeQoKA5O+KmuE67M9uuVMnICo/EXATbU4=; b=Z94vk2mvIpYjC4vMy8lIoXqKAWHrVwi2HRBOEHGhGzOhu3/hrRTXmBA0wOnyQPyKwOPof9I+
 AtELHjLExbFl7JcQd0JVcnPehUwmKD9UVS64qEygmI/ZHDSAsw9zTpwyX8SxUJVQsa5ZV/29
 /EiAH5Dfaoifxi5TnmVh1nABOJ8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f7a9da7f9168450ea54a9dc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Oct 2020 04:14:31
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5F887C433AF; Mon,  5 Oct 2020 04:14:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 81C01C433FE;
        Mon,  5 Oct 2020 04:14:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 81C01C433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao <srivasam@codeaurora.org>
Subject: [PATCH v9 5/7] ASoC: qcom: Add support for lpass hdmi driver
Date:   Mon,  5 Oct 2020 09:43:33 +0530
Message-Id: <1601871215-26200-6-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601871215-26200-1-git-send-email-srivasam@codeaurora.org>
References: <1601871215-26200-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Upadate lpass cpu and platform driver to support audio over dp.
Also add lpass-hdmi.c and lpass-hdmi.h.

Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
---
 sound/soc/qcom/Kconfig           |   5 +
 sound/soc/qcom/Makefile          |   2 +
 sound/soc/qcom/lpass-apq8016.c   |   4 +-
 sound/soc/qcom/lpass-cpu.c       |  51 ++++-
 sound/soc/qcom/lpass-hdmi.c      | 469 +++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass-hdmi.h      | 122 ++++++++++
 sound/soc/qcom/lpass-ipq806x.c   |   4 +-
 sound/soc/qcom/lpass-lpaif-reg.h |  52 ++++-
 sound/soc/qcom/lpass-platform.c  | 391 ++++++++++++++++++++++++++------
 sound/soc/qcom/lpass.h           | 113 +++++++++-
 10 files changed, 1114 insertions(+), 99 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-hdmi.c
 create mode 100644 sound/soc/qcom/lpass-hdmi.h

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index a7ef626..28e775f 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -12,6 +12,10 @@ config SND_SOC_LPASS_CPU
 	tristate
 	select REGMAP_MMIO
 
+config SND_SOC_LPASS_HDMI
+	tristate
+	select REGMAP_MMIO
+
 config SND_SOC_LPASS_PLATFORM
 	tristate
 	select REGMAP_MMIO
@@ -30,6 +34,7 @@ config SND_SOC_LPASS_SC7180
 	tristate
 	select SND_SOC_LPASS_CPU
 	select SND_SOC_LPASS_PLATFORM
+	select SND_SOC_LPASS_HDMI
 
 config SND_SOC_STORM
 	tristate "ASoC I2S support for Storm boards"
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 7972c94..0bd90d7 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -1,12 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 # Platform
 snd-soc-lpass-cpu-objs := lpass-cpu.o
+snd-soc-lpass-hdmi-objs := lpass-hdmi.o
 snd-soc-lpass-platform-objs := lpass-platform.o
 snd-soc-lpass-ipq806x-objs := lpass-ipq806x.o
 snd-soc-lpass-apq8016-objs := lpass-apq8016.o
 snd-soc-lpass-sc7180-objs := lpass-sc7180.o
 
 obj-$(CONFIG_SND_SOC_LPASS_CPU) += snd-soc-lpass-cpu.o
+obj-$(CONFIG_SND_SOC_LPASS_HDMI) += snd-soc-lpass-hdmi.o
 obj-$(CONFIG_SND_SOC_LPASS_PLATFORM) += snd-soc-lpass-platform.o
 obj-$(CONFIG_SND_SOC_LPASS_IPQ806X) += snd-soc-lpass-ipq806x.o
 obj-$(CONFIG_SND_SOC_LPASS_APQ8016) += snd-soc-lpass-apq8016.o
diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 5c8ae22..0aedb3a 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -125,7 +125,7 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
 };
 
 static int apq8016_lpass_alloc_dma_channel(struct lpass_data *drvdata,
-					   int direction)
+					   int direction, unsigned int dai_id)
 {
 	struct lpass_variant *v = drvdata->variant;
 	int chan = 0;
@@ -151,7 +151,7 @@ static int apq8016_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 	return chan;
 }
 
-static int apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
+static int apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, unsigned int dai_id)
 {
 	clear_bit(chan, &drvdata->dma_ch_bit_map);
 
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 12950d2..b6d243e 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -535,13 +535,17 @@ static void of_lpass_cpu_parse_dai_data(struct device *dev,
 			dev_err(dev, "valid dai id not found: %d\n", ret);
 			continue;
 		}
-
-		data->mi2s_playback_sd_mode[id] =
-			of_lpass_cpu_parse_sd_lines(dev, node,
-						    "qcom,playback-sd-lines");
-		data->mi2s_capture_sd_mode[id] =
-			of_lpass_cpu_parse_sd_lines(dev, node,
+		if (id == LPASS_DP_RX) {
+			data->hdmi_port_enable = 1;
+			dev_err(dev, "HDMI Port is enabled: %d\n", id);
+		} else {
+			data->mi2s_playback_sd_mode[id] =
+				of_lpass_cpu_parse_sd_lines(dev, node,
+							    "qcom,playback-sd-lines");
+			data->mi2s_capture_sd_mode[id] =
+				of_lpass_cpu_parse_sd_lines(dev, node,
 						    "qcom,capture-sd-lines");
+		}
 	}
 }
 
@@ -596,6 +600,27 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		return PTR_ERR(drvdata->lpaif_map);
 	}
 
+	if (drvdata->hdmi_port_enable) {
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "lpass-hdmiif");
+
+		drvdata->hdmiif = devm_ioremap_resource(dev, res);
+		if (IS_ERR((void const __force *)drvdata->hdmiif)) {
+			dev_err(dev, "error mapping reg resource: %ld\n",
+					PTR_ERR((void const __force *)drvdata->hdmiif));
+			return PTR_ERR((void const __force *)drvdata->hdmiif);
+		}
+
+		lpass_hdmi_regmap_config.max_register = LPAIF_HDMI_RDMAPER_REG(variant,
+					variant->hdmi_rdma_channels);
+		drvdata->hdmiif_map = devm_regmap_init_mmio(dev, drvdata->hdmiif,
+					&lpass_hdmi_regmap_config);
+		if (IS_ERR(drvdata->hdmiif_map)) {
+			dev_err(dev, "error initializing regmap: %ld\n",
+			PTR_ERR(drvdata->hdmiif_map));
+			return PTR_ERR(drvdata->hdmiif_map);
+		}
+	}
+
 	if (variant->init) {
 		ret = variant->init(pdev);
 		if (ret) {
@@ -606,6 +631,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 	for (i = 0; i < variant->num_dai; i++) {
 		dai_id = variant->dai_driver[i].id;
+		if (dai_id == LPASS_DP_RX)
+			continue;
+
 		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get(dev,
 					     variant->dai_osr_clk_names[i]);
 		if (IS_ERR(drvdata->mi2s_osr_clk[dai_id])) {
@@ -636,11 +664,16 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	/* Initialize bitfields for dai I2SCTL register */
 	ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
 						drvdata->lpaif_map);
-	if (ret) {
+	if (ret)
 		dev_err(dev, "error init i2sctl field: %d\n", ret);
-		return ret;
-	}
 
+	if (drvdata->hdmi_port_enable) {
+		ret = lpass_hdmi_init_bitfields(dev, drvdata->hdmiif_map);
+		if (ret) {
+			dev_err(dev, "%s error  hdmi init failed\n", __func__);
+			return ret;
+		}
+	}
 	ret = devm_snd_soc_register_component(dev,
 					      &lpass_cpu_comp_driver,
 					      variant->dai_driver,
diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
new file mode 100644
index 0000000..b731b95
--- /dev/null
+++ b/sound/soc/qcom/lpass-hdmi.c
@@ -0,0 +1,469 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020 The Linux Foundation. All rights reserved.
+ *
+ * lpass-hdmi.c -- ALSA SoC HDMI-CPU DAI driver for QTi LPASS HDMI
+ */
+
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <sound/pcm_params.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <dt-bindings/sound/sc7180-lpass.h>
+#include "lpass-lpaif-reg.h"
+#include "lpass.h"
+
+#define QCOM_REGMAP_FIELD_ALLOC(d, m, f, mf)    \
+	do { \
+		mf = devm_regmap_field_alloc(d, m, f);     \
+		if (IS_ERR(mf))                \
+			return -EINVAL;         \
+	} while (0)
+
+
+int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	unsigned int i;
+	struct lpass_hdmi_tx_ctl *tx_ctl;
+	struct regmap_field *legacy_en;
+	struct lpass_vbit_ctrl *vbit_ctl;
+	struct regmap_field *tx_parity;
+	struct lpass_dp_metadata_ctl *meta_ctl;
+	struct lpass_sstream_ctl *sstream_ctl;
+	struct regmap_field *ch_msb;
+	struct regmap_field *ch_lsb;
+	struct lpass_hdmitx_dmactl *tx_dmactl;
+	int rval;
+
+	tx_ctl = devm_kzalloc(dev, sizeof(*tx_ctl), GFP_KERNEL);
+	if (!tx_ctl)
+		return -ENOMEM;
+
+	QCOM_REGMAP_FIELD_ALLOC(dev, map, v->soft_reset, tx_ctl->soft_reset);
+	QCOM_REGMAP_FIELD_ALLOC(dev, map, v->force_reset, tx_ctl->force_reset);
+	drvdata->tx_ctl = tx_ctl;
+
+	QCOM_REGMAP_FIELD_ALLOC(dev, map, v->legacy_en, legacy_en);
+	drvdata->hdmitx_legacy_en = legacy_en;
+
+	vbit_ctl = devm_kzalloc(dev, sizeof(*vbit_ctl), GFP_KERNEL);
+	if (!vbit_ctl)
+		return -ENOMEM;
+
+	QCOM_REGMAP_FIELD_ALLOC(dev, map, v->replace_vbit, vbit_ctl->replace_vbit);
+	QCOM_REGMAP_FIELD_ALLOC(dev, map, v->vbit_stream, vbit_ctl->vbit_stream);
+	drvdata->vbit_ctl = vbit_ctl;
+
+
+	QCOM_REGMAP_FIELD_ALLOC(dev, map, v->calc_en, tx_parity);
+	drvdata->hdmitx_parity_calc_en = tx_parity;
+
+	meta_ctl = devm_kzalloc(dev, sizeof(*meta_ctl), GFP_KERNEL);
+	if (!meta_ctl)
+		return -ENOMEM;
+
+	rval = devm_regmap_field_bulk_alloc(dev, map, &meta_ctl->mute, &v->mute, 7);
+	if (rval)
+		return rval;
+	drvdata->meta_ctl = meta_ctl;
+
+	sstream_ctl = devm_kzalloc(dev, sizeof(*sstream_ctl), GFP_KERNEL);
+	if (!sstream_ctl)
+		return -ENOMEM;
+
+	rval = devm_regmap_field_bulk_alloc(dev, map, &sstream_ctl->sstream_en, &v->sstream_en, 9);
+	if (rval)
+		return rval;
+
+	drvdata->sstream_ctl = sstream_ctl;
+
+	for (i = 0; i < LPASS_MAX_HDMI_DMA_CHANNELS; i++) {
+		QCOM_REGMAP_FIELD_ALLOC(dev, map, v->msb_bits, ch_msb);
+		drvdata->hdmitx_ch_msb[i] = ch_msb;
+
+		QCOM_REGMAP_FIELD_ALLOC(dev, map, v->lsb_bits, ch_lsb);
+		drvdata->hdmitx_ch_lsb[i] = ch_lsb;
+
+		tx_dmactl = devm_kzalloc(dev, sizeof(*tx_dmactl), GFP_KERNEL);
+		if (!tx_dmactl)
+			return -ENOMEM;
+
+		QCOM_REGMAP_FIELD_ALLOC(dev, map, v->use_hw_chs, tx_dmactl->use_hw_chs);
+		QCOM_REGMAP_FIELD_ALLOC(dev, map, v->use_hw_usr, tx_dmactl->use_hw_usr);
+		QCOM_REGMAP_FIELD_ALLOC(dev, map, v->hw_chs_sel, tx_dmactl->hw_chs_sel);
+		QCOM_REGMAP_FIELD_ALLOC(dev, map, v->hw_usr_sel, tx_dmactl->hw_usr_sel);
+		drvdata->hdmi_tx_dmactl[i] = tx_dmactl;
+	}
+	return 0;
+}
+EXPORT_SYMBOL(lpass_hdmi_init_bitfields);
+
+static int lpass_hdmi_daiops_hw_params(struct snd_pcm_substream *substream,
+		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	snd_pcm_format_t format = params_format(params);
+	unsigned int rate = params_rate(params);
+	unsigned int channels = params_channels(params);
+	unsigned int ret;
+	unsigned int bitwidth;
+	unsigned int word_length;
+	unsigned int ch_sts_buf0;
+	unsigned int ch_sts_buf1;
+	unsigned int data_format;
+	unsigned int sampling_freq;
+	unsigned int ch = 0;
+	struct lpass_dp_metadata_ctl *meta_ctl = drvdata->meta_ctl;
+	struct lpass_sstream_ctl *sstream_ctl = drvdata->sstream_ctl;
+
+	bitwidth = snd_pcm_format_width(format);
+	if (bitwidth < 0) {
+		dev_err(dai->dev, "%s invalid bit width given : %d\n",
+					__func__, bitwidth);
+		return bitwidth;
+	}
+
+	switch (bitwidth) {
+	case 16:
+		word_length = LPASS_DP_AUDIO_BITWIDTH16;
+		break;
+	case 24:
+		word_length = LPASS_DP_AUDIO_BITWIDTH24;
+		break;
+	default:
+		dev_err(dai->dev, "%s invalid bit width given : %d\n",
+					__func__, bitwidth);
+		return -EINVAL;
+	}
+
+	switch (rate) {
+	case 32000:
+		sampling_freq = LPASS_SAMPLING_FREQ32;
+		break;
+	case 44100:
+		sampling_freq = LPASS_SAMPLING_FREQ44;
+		break;
+	case 48000:
+		sampling_freq = LPASS_SAMPLING_FREQ48;
+		break;
+	default:
+		dev_err(dai->dev, "%s invalid bit width given : %d\n",
+					__func__, bitwidth);
+		return -EINVAL;
+	}
+	data_format = LPASS_DATA_FORMAT_LINEAR;
+	ch_sts_buf0 = (((data_format << LPASS_DATA_FORMAT_SHIFT) & LPASS_DATA_FORMAT_MASK)
+				| ((sampling_freq << LPASS_FREQ_BIT_SHIFT) & LPASS_FREQ_BIT_MASK));
+	ch_sts_buf1 = (word_length) & LPASS_WORDLENGTH_MASK;
+
+	ret = regmap_field_write(drvdata->tx_ctl->soft_reset, LPASS_TX_CTL_RESET);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(drvdata->tx_ctl->soft_reset, LPASS_TX_CTL_CLEAR);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(drvdata->hdmitx_legacy_en, LPASS_HDMITX_LEGACY_DISABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(drvdata->hdmitx_parity_calc_en, HDMITX_PARITY_CALC_EN);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(drvdata->vbit_ctl->replace_vbit, REPLACE_VBIT);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(drvdata->vbit_ctl->vbit_stream, LINEAR_PCM_DATA);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(drvdata->hdmitx_ch_msb[0], ch_sts_buf1);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(drvdata->hdmitx_ch_lsb[0], ch_sts_buf0);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->use_hw_chs, HW_MODE);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->hw_chs_sel, SW_MODE);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->use_hw_usr, HW_MODE);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->hw_usr_sel, SW_MODE);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(meta_ctl->mute, LPASS_MUTE_ENABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(meta_ctl->as_sdp_cc, channels - 1);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(meta_ctl->as_sdp_ct, LPASS_META_DEFAULT_VAL);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(meta_ctl->aif_db4, LPASS_META_DEFAULT_VAL);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(meta_ctl->frequency, sampling_freq);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(meta_ctl->mst_index, LPASS_META_DEFAULT_VAL);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(meta_ctl->dptx_index, LPASS_META_DEFAULT_VAL);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(sstream_ctl->sstream_en, LPASS_SSTREAM_DISABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(sstream_ctl->dma_sel, ch);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(sstream_ctl->auto_bbit_en, LPASS_SSTREAM_DEFAULT_ENABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(sstream_ctl->layout, LPASS_SSTREAM_DEFAULT_DISABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(sstream_ctl->layout_sp, LPASS_LAYOUT_SP_DEFAULT);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(sstream_ctl->dp_audio, LPASS_SSTREAM_DEFAULT_ENABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(sstream_ctl->set_sp_on_en, LPASS_SSTREAM_DEFAULT_ENABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(sstream_ctl->dp_sp_b_hw_en, LPASS_SSTREAM_DEFAULT_ENABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(sstream_ctl->dp_staffing_en, LPASS_SSTREAM_DEFAULT_ENABLE);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+static int lpass_hdmi_daiops_prepare(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	int ret;
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+
+	ret = regmap_field_write(drvdata->sstream_ctl->sstream_en, LPASS_SSTREAM_ENABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(drvdata->meta_ctl->mute, LPASS_MUTE_DISABLE);
+	if (ret)
+		return ret;
+
+	return ret;
+}
+
+static int lpass_hdmi_daiops_trigger(struct snd_pcm_substream *substream,
+		int cmd, struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	struct lpass_dp_metadata_ctl *meta_ctl = drvdata->meta_ctl;
+	struct lpass_sstream_ctl *sstream_ctl = drvdata->sstream_ctl;
+	int ret = -EINVAL;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		ret = regmap_field_write(sstream_ctl->sstream_en, LPASS_SSTREAM_ENABLE);
+		if (ret)
+			return ret;
+
+		ret = regmap_field_write(meta_ctl->mute, LPASS_MUTE_DISABLE);
+		if (ret)
+			return ret;
+
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = regmap_field_write(sstream_ctl->sstream_en, LPASS_SSTREAM_DISABLE);
+		if (ret)
+			return ret;
+
+		ret = regmap_field_write(meta_ctl->mute, LPASS_MUTE_ENABLE);
+		if (ret)
+			return ret;
+
+		ret = regmap_field_write(sstream_ctl->dp_audio, 0);
+		if (ret)
+			return ret;
+
+		break;
+	}
+	return ret;
+}
+
+const struct snd_soc_dai_ops asoc_qcom_lpass_hdmi_dai_ops = {
+	.hw_params	= lpass_hdmi_daiops_hw_params,
+	.prepare	= lpass_hdmi_daiops_prepare,
+	.trigger	= lpass_hdmi_daiops_trigger,
+};
+EXPORT_SYMBOL_GPL(asoc_qcom_lpass_hdmi_dai_ops);
+
+static bool lpass_hdmi_regmap_writeable(struct device *dev, unsigned int reg)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	int i;
+
+	if (reg == LPASS_HDMI_TX_CTL_ADDR(v))
+		return true;
+	if (reg == LPASS_HDMI_TX_LEGACY_ADDR(v))
+		return true;
+	if (reg == LPASS_HDMI_TX_VBIT_CTL_ADDR(v))
+		return true;
+	if (reg == LPASS_HDMI_TX_PARITY_ADDR(v))
+		return true;
+	if (reg == LPASS_HDMI_TX_DP_ADDR(v))
+		return true;
+	if (reg == LPASS_HDMI_TX_SSTREAM_ADDR(v))
+		return true;
+	if (reg == LPASS_HDMITX_APP_IRQEN_REG(v))
+		return true;
+	if (reg == LPASS_HDMITX_APP_IRQCLEAR_REG(v))
+		return true;
+
+	for (i = 0; i < v->hdmi_rdma_channels; i++) {
+		if (reg == LPASS_HDMI_TX_CH_LSB_ADDR(v, i))
+			return true;
+		if (reg == LPASS_HDMI_TX_CH_MSB_ADDR(v, i))
+			return true;
+		if (reg == LPASS_HDMI_TX_DMA_ADDR(v, i))
+			return true;
+	}
+
+	for (i = 0; i < v->rdma_channels; ++i) {
+		if (reg == LPAIF_HDMI_RDMACTL_REG(v, i))
+			return true;
+		if (reg == LPAIF_HDMI_RDMABASE_REG(v, i))
+			return true;
+		if (reg == LPAIF_HDMI_RDMABUFF_REG(v, i))
+			return true;
+		if (reg == LPAIF_HDMI_RDMAPER_REG(v, i))
+			return true;
+	}
+	return false;
+}
+
+static bool lpass_hdmi_regmap_readable(struct device *dev, unsigned int reg)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	int i;
+
+	if (reg == LPASS_HDMI_TX_CTL_ADDR(v))
+		return true;
+	if (reg == LPASS_HDMI_TX_LEGACY_ADDR(v))
+		return true;
+	if (reg == LPASS_HDMI_TX_VBIT_CTL_ADDR(v))
+		return true;
+
+	for (i = 0; i < v->hdmi_rdma_channels; i++) {
+		if (reg == LPASS_HDMI_TX_CH_LSB_ADDR(v, i))
+			return true;
+		if (reg == LPASS_HDMI_TX_CH_MSB_ADDR(v, i))
+			return true;
+		if (reg == LPASS_HDMI_TX_DMA_ADDR(v, i))
+			return true;
+	}
+
+	if (reg == LPASS_HDMI_TX_PARITY_ADDR(v))
+		return true;
+	if (reg == LPASS_HDMI_TX_DP_ADDR(v))
+		return true;
+	if (reg == LPASS_HDMI_TX_SSTREAM_ADDR(v))
+		return true;
+	if (reg == LPASS_HDMITX_APP_IRQEN_REG(v))
+		return true;
+	if (reg == LPASS_HDMITX_APP_IRQSTAT_REG(v))
+		return true;
+
+	for (i = 0; i < v->rdma_channels; ++i) {
+		if (reg == LPAIF_HDMI_RDMACTL_REG(v, i))
+			return true;
+		if (reg == LPAIF_HDMI_RDMABASE_REG(v, i))
+			return true;
+		if (reg == LPAIF_HDMI_RDMABUFF_REG(v, i))
+			return true;
+		if (reg == LPAIF_HDMI_RDMAPER_REG(v, i))
+			return true;
+		if (reg == LPAIF_HDMI_RDMACURR_REG(v, i))
+			return true;
+	}
+
+	return false;
+}
+
+static bool lpass_hdmi_regmap_volatile(struct device *dev, unsigned int reg)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	int i;
+
+	if (reg == LPASS_HDMITX_APP_IRQSTAT_REG(v))
+		return true;
+	if (reg == LPASS_HDMI_TX_LEGACY_ADDR(v))
+		return true;
+
+	for (i = 0; i < v->rdma_channels; ++i) {
+		if (reg == LPAIF_HDMI_RDMACURR_REG(v, i))
+			return true;
+	}
+	return false;
+}
+
+
+struct regmap_config lpass_hdmi_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.writeable_reg = lpass_hdmi_regmap_writeable,
+	.readable_reg = lpass_hdmi_regmap_readable,
+	.volatile_reg = lpass_hdmi_regmap_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+EXPORT_SYMBOL(lpass_hdmi_regmap_config);
+
+MODULE_DESCRIPTION("QTi LPASS HDMI Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/qcom/lpass-hdmi.h b/sound/soc/qcom/lpass-hdmi.h
new file mode 100644
index 0000000..0389af0
--- /dev/null
+++ b/sound/soc/qcom/lpass-hdmi.h
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020 The Linux Foundation. All rights reserved.
+ *
+ * lpass_hdmi.h - Definitions for the QTi LPASS HDMI
+ */
+
+#ifndef __LPASS_HDMI_H__
+#define __LPASS_HDMI_H__
+
+#include <linux/regmap.h>
+
+#define LPASS_HDMITX_LEGACY_DISABLE		0x0
+#define LPASS_HDMITX_LEGACY_ENABLE		0x1
+#define LPASS_DP_AUDIO_BITWIDTH16		0x0
+#define LPASS_DP_AUDIO_BITWIDTH24		0xb
+#define LPASS_DATA_FORMAT_SHIFT			0x1
+#define LPASS_FREQ_BIT_SHIFT			24
+#define LPASS_DATA_FORMAT_LINEAR		0x0
+#define LPASS_DATA_FORMAT_NON_LINEAR	0x1
+#define LPASS_SAMPLING_FREQ32			0x3
+#define LPASS_SAMPLING_FREQ44			0x0
+#define LPASS_SAMPLING_FREQ48			0x2
+#define LPASS_TX_CTL_RESET				0x1
+#define LPASS_TX_CTL_CLEAR				0x0
+#define LPASS_SSTREAM_ENABLE			1
+#define LPASS_SSTREAM_DISABLE			0
+#define LPASS_LAYOUT_SP_DEFAULT			0xf
+#define LPASS_SSTREAM_DEFAULT_ENABLE	1
+#define LPASS_SSTREAM_DEFAULT_DISABLE	0
+#define LPASS_MUTE_ENABLE				1
+#define LPASS_MUTE_DISABLE				0
+#define LPASS_META_DEFAULT_VAL			0
+#define HW_MODE							1
+#define SW_MODE							0
+#define LEGACY_LPASS_LPAIF				1
+#define LEGACY_LPASS_HDMI				0
+#define REPLACE_VBIT					0x1
+#define LINEAR_PCM_DATA					0x0
+#define NON_LINEAR_PCM_DATA				0x1
+#define HDMITX_PARITY_CALC_EN			0x1
+#define HDMITX_PARITY_CALC_DIS			0x0
+#define LPASS_DATA_FORMAT_MASK			GENMASK(1, 1)
+#define LPASS_WORDLENGTH_MASK			GENMASK(3, 0)
+#define LPASS_FREQ_BIT_MASK				GENMASK(27, 24)
+
+#define LPASS_HDMI_TX_CTL_ADDR(v)		(v->hdmi_tx_ctl_addr)
+#define LPASS_HDMI_TX_LEGACY_ADDR(v)	(v->hdmi_legacy_addr)
+#define LPASS_HDMI_TX_VBIT_CTL_ADDR(v)	(v->hdmi_vbit_addr)
+#define LPASS_HDMI_TX_PARITY_ADDR(v)	(v->hdmi_parity_addr)
+#define LPASS_HDMI_TX_DP_ADDR(v)		(v->hdmi_DP_addr)
+#define LPASS_HDMI_TX_SSTREAM_ADDR(v)	(v->hdmi_sstream_addr)
+
+#define LPASS_HDMI_TX_CH_LSB_ADDR(v, port) \
+		(v->hdmi_ch_lsb_addr + v->ch_stride * (port))
+#define LPASS_HDMI_TX_CH_MSB_ADDR(v, port) \
+		(v->hdmi_ch_msb_addr + v->ch_stride * (port))
+#define LPASS_HDMI_TX_DMA_ADDR(v, port) \
+		(v->hdmi_dmactl_addr + v->hdmi_dma_stride * (port))
+
+struct lpass_sstream_ctl {
+	struct regmap_field *sstream_en;
+	struct regmap_field *dma_sel;
+	struct regmap_field *auto_bbit_en;
+	struct regmap_field *layout;
+	struct regmap_field *layout_sp;
+	struct regmap_field *set_sp_on_en;
+	struct regmap_field *dp_audio;
+	struct regmap_field *dp_staffing_en;
+	struct regmap_field *dp_sp_b_hw_en;
+};
+
+struct lpass_dp_metadata_ctl {
+	struct regmap_field *mute;
+	struct regmap_field *as_sdp_cc;
+	struct regmap_field *as_sdp_ct;
+	struct regmap_field *aif_db4;
+	struct regmap_field *frequency;
+	struct regmap_field *mst_index;
+	struct regmap_field *dptx_index;
+};
+
+struct lpass_hdmi_tx_ctl {
+	struct regmap_field *soft_reset;
+	struct regmap_field *force_reset;
+};
+
+struct lpass_hdmitx_dmactl {
+	struct regmap_field *use_hw_chs;
+	struct regmap_field *use_hw_usr;
+	struct regmap_field *hw_chs_sel;
+	struct regmap_field *hw_usr_sel;
+};
+
+struct lpass_vbit_ctrl {
+		struct regmap_field *replace_vbit;
+		struct regmap_field *vbit_stream;
+};
+
+struct  lpass_hdmitx_legacy {
+	struct regmap_field *legacy_en;
+};
+
+struct  lpass_hdmi_tx_parity {
+	struct regmap_field *calc_en;
+};
+
+struct  lpass_hdmi_tx_ch_lsb {
+	struct regmap_field *lsb_bits;
+};
+
+struct  lpass_hdmi_tx_ch_msb {
+	struct regmap_field *msb_bits;
+};
+
+extern int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map);
+extern struct regmap_config lpass_hdmi_regmap_config;
+extern const struct snd_soc_dai_ops asoc_qcom_lpass_hdmi_dai_ops;
+
+
+
+#endif /* __LPASS_HDMI_H__ */
diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
index 72f09b3..832a916 100644
--- a/sound/soc/qcom/lpass-ipq806x.c
+++ b/sound/soc/qcom/lpass-ipq806x.c
@@ -96,7 +96,7 @@ static int ipq806x_lpass_exit(struct platform_device *pdev)
 	return 0;
 }
 
-static int ipq806x_lpass_alloc_dma_channel(struct lpass_data *drvdata, int dir)
+static int ipq806x_lpass_alloc_dma_channel(struct lpass_data *drvdata, int dir, unsigned int dai_id)
 {
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
 		return IPQ806X_LPAIF_RDMA_CHAN_MI2S;
@@ -104,7 +104,7 @@ static int ipq806x_lpass_alloc_dma_channel(struct lpass_data *drvdata, int dir)
 		return -EINVAL;
 }
 
-static int ipq806x_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
+static int ipq806x_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, unsigned int dai_id)
 {
 	return 0;
 }
diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index 5258e60..42aebd4 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -9,7 +9,8 @@
 /* LPAIF I2S */
 
 #define LPAIF_I2SCTL_REG_ADDR(v, addr, port) \
-	(v->i2sctrl_reg_base + (addr) + v->i2sctrl_reg_stride * (port))
+	(v->i2sctrl_reg_base + (addr) + \
+	v->i2sctrl_reg_stride * (port))
 
 #define LPAIF_I2SCTL_REG(v, port)	LPAIF_I2SCTL_REG_ADDR(v, 0x0, (port))
 
@@ -70,6 +71,14 @@
 #define LPAIF_IRQSTAT_REG(v, port)	LPAIF_IRQ_REG_ADDR(v, 0x4, (port))
 #define LPAIF_IRQCLEAR_REG(v, port)	LPAIF_IRQ_REG_ADDR(v, 0xC, (port))
 
+
+#define LPASS_HDMITX_APP_IRQ_REG_ADDR(v, addr)  \
+	((v->hdmi_irq_reg_base) + (addr))
+
+#define LPASS_HDMITX_APP_IRQEN_REG(v)			LPASS_HDMITX_APP_IRQ_REG_ADDR(v, 0x4)
+#define LPASS_HDMITX_APP_IRQSTAT_REG(v)			LPASS_HDMITX_APP_IRQ_REG_ADDR(v, 0x8)
+#define LPASS_HDMITX_APP_IRQCLEAR_REG(v)		LPASS_HDMITX_APP_IRQ_REG_ADDR(v, 0xC)
+
 #define LPAIF_IRQ_BITSTRIDE		3
 
 #define LPAIF_IRQ_PER(chan)		(1 << (LPAIF_IRQ_BITSTRIDE * (chan)))
@@ -77,8 +86,22 @@
 #define LPAIF_IRQ_ERR(chan)		(4 << (LPAIF_IRQ_BITSTRIDE * (chan)))
 
 #define LPAIF_IRQ_ALL(chan)		(7 << (LPAIF_IRQ_BITSTRIDE * (chan)))
+#define LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(chan)	(1 << (14 + chan))
+#define LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(chan)	(1 << (24 + chan))
+#define LPAIF_IRQ_HDMI_METADONE		BIT(23)
 
 /* LPAIF DMA */
+#define LPAIF_HDMI_RDMA_REG_ADDR(v, addr, chan) \
+	(v->hdmi_rdma_reg_base + (addr) + v->hdmi_rdma_reg_stride * (chan))
+
+#define LPAIF_HDMI_RDMACTL_AUDINTF(id)	(id << LPAIF_RDMACTL_AUDINTF_SHIFT)
+
+#define LPAIF_HDMI_RDMACTL_REG(v, chan)		LPAIF_HDMI_RDMA_REG_ADDR(v, 0x00, (chan))
+#define LPAIF_HDMI_RDMABASE_REG(v, chan)	LPAIF_HDMI_RDMA_REG_ADDR(v, 0x04, (chan))
+#define	LPAIF_HDMI_RDMABUFF_REG(v, chan)	LPAIF_HDMI_RDMA_REG_ADDR(v, 0x08, (chan))
+#define LPAIF_HDMI_RDMACURR_REG(v, chan)	LPAIF_HDMI_RDMA_REG_ADDR(v, 0x0C, (chan))
+#define	LPAIF_HDMI_RDMAPER_REG(v, chan)		LPAIF_HDMI_RDMA_REG_ADDR(v, 0x10, (chan))
+#define	LPAIF_HDMI_RDMAPERCNT_REG(v, chan)	LPAIF_HDMI_RDMA_REG_ADDR(v, 0x14, (chan))
 
 #define LPAIF_RDMA_REG_ADDR(v, addr, chan) \
 	(v->rdma_reg_base + (addr) + v->rdma_reg_stride * (chan))
@@ -103,17 +126,22 @@
 #define	LPAIF_WRDMAPER_REG(v, chan)	LPAIF_WRDMA_REG_ADDR(v, 0x10, (chan))
 #define	LPAIF_WRDMAPERCNT_REG(v, chan)	LPAIF_WRDMA_REG_ADDR(v, 0x14, (chan))
 
-#define __LPAIF_DMA_REG(v, chan, dir, reg)  \
-	(dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
-		LPAIF_RDMA##reg##_REG(v, chan) : \
-		LPAIF_WRDMA##reg##_REG(v, chan)
-
-#define LPAIF_DMACTL_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, CTL)
-#define LPAIF_DMABASE_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, BASE)
-#define	LPAIF_DMABUFF_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, BUFF)
-#define LPAIF_DMACURR_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, CURR)
-#define	LPAIF_DMAPER_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, PER)
-#define	LPAIF_DMAPERCNT_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, PERCNT)
+#define LPAIF_INTFDMA_REG(v, chan, reg, dai_id)  \
+		((v->dai_driver[dai_id].id ==  LPASS_DP_RX) ? \
+		LPAIF_HDMI_RDMA##reg##_REG(v, chan) : \
+		 LPAIF_RDMA##reg##_REG(v, chan))
+
+#define __LPAIF_DMA_REG(v, chan, dir, reg, dai_id)  \
+	((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
+		(LPAIF_INTFDMA_REG(v, chan, reg, dai_id)) : \
+		LPAIF_WRDMA##reg##_REG(v, chan))
+
+#define LPAIF_DMACTL_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, CTL, dai_id)
+#define LPAIF_DMABASE_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, BASE, dai_id)
+#define	LPAIF_DMABUFF_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, BUFF, dai_id)
+#define LPAIF_DMACURR_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, CURR, dai_id)
+#define	LPAIF_DMAPER_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, PER, dai_id)
+#define	LPAIF_DMAPERCNT_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, PERCNT, dai_id)
 
 #define LPAIF_DMACTL_BURSTEN_SINGLE	0
 #define LPAIF_DMACTL_BURSTEN_INCR4	1
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index db0d959..a5ab5f1 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -80,6 +80,23 @@ static int lpass_platform_alloc_dmactl_fields(struct device *dev,
 					    &v->wrdma_intf, 6);
 }
 
+static int lpass_platform_alloc_hdmidmactl_fields(struct device *dev,
+					 struct regmap *map)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	struct lpaif_dmactl *rd_dmactl;
+
+	rd_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl), GFP_KERNEL);
+	if (rd_dmactl == NULL)
+		return -ENOMEM;
+
+	drvdata->hdmi_rd_dmactl = rd_dmactl;
+
+	return devm_regmap_field_bulk_alloc(dev, map, &rd_dmactl->bursten,
+					    &v->hdmi_rdma_bursten, 8);
+}
+
 static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 				      struct snd_pcm_substream *substream)
 {
@@ -90,6 +107,8 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	struct lpass_variant *v = drvdata->variant;
 	int ret, dma_ch, dir = substream->stream;
 	struct lpass_pcm_data *data;
+	struct regmap *map;
+	unsigned int dai_id = cpu_dai->driver->id;
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -99,25 +118,28 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	runtime->private_data = data;
 
 	if (v->alloc_dma_channel)
-		dma_ch = v->alloc_dma_channel(drvdata, dir);
+		dma_ch = v->alloc_dma_channel(drvdata, dir, dai_id);
 	else
 		dma_ch = 0;
 
 	if (dma_ch < 0)
 		return dma_ch;
 
-	drvdata->substream[dma_ch] = substream;
-
-	ret = regmap_write(drvdata->lpaif_map,
-			LPAIF_DMACTL_REG(v, dma_ch, dir), 0);
+	if (cpu_dai->driver->id == LPASS_DP_RX) {
+		map = drvdata->hdmiif_map;
+		drvdata->hdmi_substream[dma_ch] = substream;
+	} else {
+		map = drvdata->lpaif_map;
+		drvdata->substream[dma_ch] = substream;
+	}
+	data->dma_ch = dma_ch;
+	ret = regmap_write(map,
+			LPAIF_DMACTL_REG(v, dma_ch, dir, data->i2s_port), 0);
 	if (ret) {
 		dev_err(soc_runtime->dev,
 			"error writing to rdmactl reg: %d\n", ret);
 		return ret;
 	}
-
-	data->dma_ch = dma_ch;
-
 	snd_soc_set_runtime_hwparams(substream, &lpass_platform_pcm_hardware);
 
 	runtime->dma_bytes = lpass_platform_pcm_hardware.buffer_bytes_max;
@@ -139,14 +161,20 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 				       struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct lpass_variant *v = drvdata->variant;
 	struct lpass_pcm_data *data;
+	unsigned int dai_id = cpu_dai->driver->id;
 
 	data = runtime->private_data;
-	drvdata->substream[data->dma_ch] = NULL;
+	if (dai_id == LPASS_DP_RX)
+		drvdata->hdmi_substream[data->dma_ch] = NULL;
+	else
+		drvdata->substream[data->dma_ch] = NULL;
 	if (v->free_dma_channel)
-		v->free_dma_channel(drvdata, data->dma_ch);
+		v->free_dma_channel(drvdata, data->dma_ch, dai_id);
 
 	kfree(data);
 	return 0;
@@ -157,6 +185,7 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 					   struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -168,10 +197,15 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	int id, dir = substream->stream;
 	int bitwidth;
 	int ret, dma_port = pcm_data->i2s_port + v->dmactl_audif_start;
+	unsigned int dai_id = cpu_dai->driver->id;
 
 	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
-		dmactl = drvdata->rd_dmactl;
 		id = pcm_data->dma_ch;
+		if (dai_id == LPASS_DP_RX)
+			dmactl = drvdata->hdmi_rd_dmactl;
+		else
+			dmactl = drvdata->rd_dmactl;
+
 	} else {
 		dmactl = drvdata->wr_dmactl;
 		id = pcm_data->dma_ch - v->wrdma_channel_start;
@@ -190,18 +224,48 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 		return ret;
 	}
 
-	regmap_fields_write(dmactl->fifowm, id, LPAIF_DMACTL_FIFOWM_8);
+	ret = regmap_fields_write(dmactl->fifowm, id, LPAIF_DMACTL_FIFOWM_8);
 	if (ret) {
 		dev_err(soc_runtime->dev, "error updating fifowm field: %d\n", ret);
 		return ret;
 	}
 
-	regmap_fields_write(dmactl->intf, id, LPAIF_DMACTL_AUDINTF(dma_port));
-	if (ret) {
-		dev_err(soc_runtime->dev, "error updating audintf field: %d\n", ret);
-		return ret;
-	}
+	switch (dai_id) {
+	case LPASS_DP_RX:
+		ret = regmap_fields_write(dmactl->burst8, id,
+							LPAIF_DMACTL_BURSTEN_INCR4);
+		if (ret) {
+			dev_err(soc_runtime->dev, "error updating burst8en field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->burst16, id,
+							LPAIF_DMACTL_BURSTEN_INCR4);
+		if (ret) {
+			dev_err(soc_runtime->dev, "error updating burst16en field: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_fields_write(dmactl->dynburst, id,
+							LPAIF_DMACTL_BURSTEN_INCR4);
+		if (ret) {
+			dev_err(soc_runtime->dev, "error updating dynbursten field: %d\n", ret);
+			return ret;
+		}
+		break;
+	case MI2S_PRIMARY:
+	case MI2S_SECONDARY:
+		ret = regmap_fields_write(dmactl->intf, id,
+						LPAIF_DMACTL_AUDINTF(dma_port));
+		if (ret) {
+			dev_err(soc_runtime->dev, "error updating audio interface field: %d\n",
+					ret);
+			return ret;
+		}
 
+		break;
+	default:
+		dev_err(soc_runtime->dev, "%s: invalid  interface: %d\n", __func__, dai_id);
+		break;
+	}
 	switch (bitwidth) {
 	case 16:
 		switch (channels) {
@@ -232,16 +296,24 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 			regval = LPAIF_DMACTL_WPSCNT_ONE;
 			break;
 		case 2:
-			regval = LPAIF_DMACTL_WPSCNT_TWO;
+			regval = (dai_id == LPASS_DP_RX ?
+			LPAIF_DMACTL_WPSCNT_ONE :
+			LPAIF_DMACTL_WPSCNT_TWO);
 			break;
 		case 4:
-			regval = LPAIF_DMACTL_WPSCNT_FOUR;
+			regval = (dai_id == LPASS_DP_RX ?
+			LPAIF_DMACTL_WPSCNT_TWO :
+			LPAIF_DMACTL_WPSCNT_FOUR);
 			break;
 		case 6:
-			regval = LPAIF_DMACTL_WPSCNT_SIX;
+			regval = (dai_id == LPASS_DP_RX ?
+			LPAIF_DMACTL_WPSCNT_THREE :
+			LPAIF_DMACTL_WPSCNT_SIX);
 			break;
 		case 8:
-			regval = LPAIF_DMACTL_WPSCNT_EIGHT;
+			regval = (dai_id == LPASS_DP_RX ?
+			LPAIF_DMACTL_WPSCNT_FOUR :
+			LPAIF_DMACTL_WPSCNT_EIGHT);
 			break;
 		default:
 			dev_err(soc_runtime->dev,
@@ -251,7 +323,8 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 		}
 		break;
 	default:
-		dev_err(soc_runtime->dev, "invalid PCM config given: bw=%d, ch=%u\n",
+		dev_err(soc_runtime->dev,
+			"invalid PCM config given: bw=%d,ch=%u\n",
 			bitwidth, channels);
 		return -EINVAL;
 	}
@@ -270,15 +343,23 @@ static int lpass_platform_pcmops_hw_free(struct snd_soc_component *component,
 					 struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
 	struct lpass_variant *v = drvdata->variant;
 	unsigned int reg;
 	int ret;
+	struct regmap *map;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (dai_id == LPASS_DP_RX)
+		map = drvdata->hdmiif_map;
+	else
+		map = drvdata->lpaif_map;
 
-	reg = LPAIF_DMACTL_REG(v, pcm_data->dma_ch, substream->stream);
-	ret = regmap_write(drvdata->lpaif_map, reg, 0);
+	reg = LPAIF_DMACTL_REG(v, pcm_data->dma_ch, substream->stream, dai_id);
+	ret = regmap_write(map, reg, 0);
 	if (ret)
 		dev_err(soc_runtime->dev, "error writing to rdmactl reg: %d\n",
 			ret);
@@ -291,33 +372,44 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
 	struct lpass_variant *v = drvdata->variant;
 	struct lpaif_dmactl *dmactl;
+	struct regmap *map;
 	int ret, id, ch, dir = substream->stream;
+	unsigned int dai_id = cpu_dai->driver->id;
+
 
 	ch = pcm_data->dma_ch;
 	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
-		dmactl = drvdata->rd_dmactl;
+		if (dai_id == LPASS_DP_RX) {
+			dmactl = drvdata->hdmi_rd_dmactl;
+			map = drvdata->hdmiif_map;
+		} else {
+			dmactl = drvdata->rd_dmactl;
+			map = drvdata->lpaif_map;
+		}
+
 		id = pcm_data->dma_ch;
 	} else {
 		dmactl = drvdata->wr_dmactl;
 		id = pcm_data->dma_ch - v->wrdma_channel_start;
+		map = drvdata->lpaif_map;
 	}
 
-	ret = regmap_write(drvdata->lpaif_map,
-			LPAIF_DMABASE_REG(v, ch, dir),
-			runtime->dma_addr);
+	ret = regmap_write(map, LPAIF_DMABASE_REG(v, ch, dir, dai_id),
+				runtime->dma_addr);
 	if (ret) {
 		dev_err(soc_runtime->dev, "error writing to rdmabase reg: %d\n",
 			ret);
 		return ret;
 	}
 
-	ret = regmap_write(drvdata->lpaif_map,
-			LPAIF_DMABUFF_REG(v, ch, dir),
+	ret = regmap_write(map,
+			LPAIF_DMABUFF_REG(v, ch, dir, dai_id),
 			(snd_pcm_lib_buffer_bytes(substream) >> 2) - 1);
 	if (ret) {
 		dev_err(soc_runtime->dev, "error writing to rdmabuff reg: %d\n",
@@ -325,8 +417,8 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
 		return ret;
 	}
 
-	ret = regmap_write(drvdata->lpaif_map,
-			LPAIF_DMAPER_REG(v, ch, dir),
+	ret = regmap_write(map,
+			LPAIF_DMAPER_REG(v, ch, dir, dai_id),
 			(snd_pcm_lib_period_bytes(substream) >> 2) - 1);
 	if (ret) {
 		dev_err(soc_runtime->dev, "error writing to rdmaper reg: %d\n",
@@ -349,18 +441,26 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 					 int cmd)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
 	struct lpass_variant *v = drvdata->variant;
 	struct lpaif_dmactl *dmactl;
+	struct regmap *map;
 	int ret, ch, id;
 	int dir = substream->stream;
+	unsigned int reg_irqclr = 0, val_irqclr = 0;
+	unsigned int  reg_irqen = 0, val_irqen = 0, val_mask = 0;
+	unsigned int dai_id = cpu_dai->driver->id;
 
 	ch = pcm_data->dma_ch;
 	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
-		dmactl = drvdata->rd_dmactl;
 		id = pcm_data->dma_ch;
+		if (dai_id == LPASS_DP_RX)
+			dmactl = drvdata->hdmi_rd_dmactl;
+		else
+			dmactl = drvdata->rd_dmactl;
 	} else {
 		dmactl = drvdata->wr_dmactl;
 		id = pcm_data->dma_ch - v->wrdma_channel_start;
@@ -370,31 +470,63 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		/* clear status before enabling interrupts */
-		ret = regmap_write(drvdata->lpaif_map,
-				LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST),
-				LPAIF_IRQ_ALL(ch));
+		ret = regmap_fields_write(dmactl->enable, id,
+						 LPAIF_DMACTL_ENABLE_ON);
 		if (ret) {
 			dev_err(soc_runtime->dev,
-				"error writing to irqclear reg: %d\n", ret);
+				"error writing to rdmactl reg: %d\n", ret);
 			return ret;
 		}
+		switch (dai_id) {
+		case LPASS_DP_RX:
+			ret = regmap_fields_write(dmactl->dyncclk, id,
+					 LPAIF_DMACTL_DYNCLK_ON);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to rdmactl reg: %d\n", ret);
+				return ret;
+			}
+			map = drvdata->hdmiif_map;
+			reg_irqclr = LPASS_HDMITX_APP_IRQCLEAR_REG(v);
+			val_irqclr = (LPAIF_IRQ_ALL(ch) |
+					LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(ch) |
+					LPAIF_IRQ_HDMI_METADONE |
+					LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(ch));
+
+			reg_irqen = LPASS_HDMITX_APP_IRQEN_REG(v);
+			val_mask = (LPAIF_IRQ_ALL(ch) |
+					LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(ch) |
+					LPAIF_IRQ_HDMI_METADONE |
+					LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(ch));
+			val_irqen = (LPAIF_IRQ_ALL(ch) |
+					LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(ch) |
+					LPAIF_IRQ_HDMI_METADONE |
+					LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(ch));
+			break;
+		case MI2S_PRIMARY:
+		case MI2S_SECONDARY:
+			map = drvdata->lpaif_map;
+			reg_irqclr = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
+			val_irqclr = LPAIF_IRQ_ALL(ch);
 
-		ret = regmap_update_bits(drvdata->lpaif_map,
-				LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST),
-				LPAIF_IRQ_ALL(ch),
-				LPAIF_IRQ_ALL(ch));
+
+			reg_irqen = LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
+			val_mask = LPAIF_IRQ_ALL(ch);
+			val_irqen = LPAIF_IRQ_ALL(ch);
+			break;
+		default:
+			dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
+			return -EINVAL;
+		}
+
+		ret = regmap_write(map, reg_irqclr, val_irqclr);
 		if (ret) {
-			dev_err(soc_runtime->dev,
-				"error writing to irqen reg: %d\n", ret);
+			dev_err(soc_runtime->dev, "error writing to irqclear reg: %d\n", ret);
 			return ret;
 		}
-
-		ret = regmap_fields_write(dmactl->enable, id,
-					 LPAIF_DMACTL_ENABLE_ON);
+		ret = regmap_update_bits(map, reg_irqen, val_mask, val_irqen);
 		if (ret) {
-			dev_err(soc_runtime->dev,
-				"error writing to rdmactl reg: %d\n", ret);
+			dev_err(soc_runtime->dev, "error writing to irqen reg: %d\n", ret);
 			return ret;
 		}
 		break;
@@ -408,10 +540,38 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 				"error writing to rdmactl reg: %d\n", ret);
 			return ret;
 		}
+		switch (dai_id) {
+		case LPASS_DP_RX:
+			ret = regmap_fields_write(dmactl->dyncclk, id,
+					 LPAIF_DMACTL_DYNCLK_OFF);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to rdmactl reg: %d\n", ret);
+				return ret;
+			}
+			map = drvdata->hdmiif_map;
+			reg_irqen = LPASS_HDMITX_APP_IRQEN_REG(v);
+			val_mask = (LPAIF_IRQ_ALL(ch) |
+					LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(ch) |
+					LPAIF_IRQ_HDMI_METADONE |
+					LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(ch));
+			val_irqen = 0;
+			break;
+		case MI2S_PRIMARY:
+		case MI2S_SECONDARY:
+			map = drvdata->lpaif_map;
+			reg_irqen = LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
+			val_mask = LPAIF_IRQ_ALL(ch);
+			val_irqen = 0;
+			break;
+		default:
+			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);
+			return -EINVAL;
+		}
 
-		ret = regmap_update_bits(drvdata->lpaif_map,
-				LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST),
-				LPAIF_IRQ_ALL(ch), 0);
+		ret = regmap_update_bits(map,
+				reg_irqen,
+				val_mask, val_irqen);
 		if (ret) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqen reg: %d\n", ret);
@@ -428,25 +588,33 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
 		struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
 	struct lpass_variant *v = drvdata->variant;
 	unsigned int base_addr, curr_addr;
 	int ret, ch, dir = substream->stream;
+	struct regmap *map;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	if (dai_id == LPASS_DP_RX)
+		map = drvdata->hdmiif_map;
+	else
+		map = drvdata->lpaif_map;
 
 	ch = pcm_data->dma_ch;
 
-	ret = regmap_read(drvdata->lpaif_map,
-			LPAIF_DMABASE_REG(v, ch, dir), &base_addr);
+	ret = regmap_read(map,
+			LPAIF_DMABASE_REG(v, ch, dir, dai_id), &base_addr);
 	if (ret) {
 		dev_err(soc_runtime->dev,
 			"error reading from rdmabase reg: %d\n", ret);
 		return ret;
 	}
 
-	ret = regmap_read(drvdata->lpaif_map,
-			LPAIF_DMACURR_REG(v, ch, dir), &curr_addr);
+	ret = regmap_read(map,
+			LPAIF_DMACURR_REG(v, ch, dir, dai_id), &curr_addr);
 	if (ret) {
 		dev_err(soc_runtime->dev,
 			"error reading from rdmacurr reg: %d\n", ret);
@@ -472,14 +640,36 @@ static irqreturn_t lpass_dma_interrupt_handler(
 			int chan, u32 interrupts)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_variant *v = drvdata->variant;
 	irqreturn_t ret = IRQ_NONE;
 	int rv;
-
+	unsigned int reg = 0, val = 0;
+	struct regmap *map;
+	unsigned int dai_id = cpu_dai->driver->id;
+
+	switch (dai_id) {
+	case LPASS_DP_RX:
+		map = drvdata->hdmiif_map;
+		reg = LPASS_HDMITX_APP_IRQCLEAR_REG(v);
+		val = (LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(chan) |
+		LPAIF_IRQ_HDMI_METADONE |
+		LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(chan));
+	break;
+	case MI2S_PRIMARY:
+	case MI2S_SECONDARY:
+		map = drvdata->lpaif_map;
+		reg = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
+		val = 0;
+	break;
+	default:
+	dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
+	return -EINVAL;
+	}
 	if (interrupts & LPAIF_IRQ_PER(chan)) {
-		rv = regmap_write(drvdata->lpaif_map,
-				LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST),
-				LPAIF_IRQ_PER(chan));
+
+		rv = regmap_write(map, reg,
+				LPAIF_IRQ_PER(chan) | val);
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);
@@ -490,9 +680,8 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	}
 
 	if (interrupts & LPAIF_IRQ_XRUN(chan)) {
-		rv = regmap_write(drvdata->lpaif_map,
-				LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST),
-				LPAIF_IRQ_XRUN(chan));
+		rv = regmap_write(map, reg,
+				LPAIF_IRQ_XRUN(chan) | val);
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);
@@ -504,9 +693,8 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	}
 
 	if (interrupts & LPAIF_IRQ_ERR(chan)) {
-		rv = regmap_write(drvdata->lpaif_map,
-				LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST),
-				LPAIF_IRQ_ERR(chan));
+		rv = regmap_write(map, reg,
+				LPAIF_IRQ_ERR(chan) | val);
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);
@@ -517,6 +705,16 @@ static irqreturn_t lpass_dma_interrupt_handler(
 		ret = IRQ_HANDLED;
 	}
 
+	if (interrupts & val) {
+		rv = regmap_write(map, reg, val);
+		if (rv) {
+			dev_err(soc_runtime->dev,
+			"error writing to irqclear reg: %d\n", rv);
+			return IRQ_NONE;
+		}
+		ret = IRQ_HANDLED;
+	}
+
 	return ret;
 }
 
@@ -536,7 +734,8 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
 
 	/* Handle per channel interrupts */
 	for (chan = 0; chan < LPASS_MAX_DMA_CHANNELS; chan++) {
-		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->substream[chan]) {
+		if (irqs & LPAIF_IRQ_ALL(chan)
+			&& drvdata->substream[chan]) {
 			rv = lpass_dma_interrupt_handler(
 						drvdata->substream[chan],
 						drvdata, chan, irqs);
@@ -548,6 +747,38 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t lpass_platform_hdmiif_irq(int irq, void *data)
+{
+	struct lpass_data *drvdata = data;
+	struct lpass_variant *v = drvdata->variant;
+	unsigned int irqs;
+	int rv, chan;
+
+	rv = regmap_read(drvdata->hdmiif_map,
+			LPASS_HDMITX_APP_IRQSTAT_REG(v), &irqs);
+	if (rv) {
+		pr_err("error reading from irqstat reg: %d\n", rv);
+		return IRQ_NONE;
+	}
+
+	/* Handle per channel interrupts */
+	for (chan = 0; chan < LPASS_MAX_HDMI_DMA_CHANNELS; chan++) {
+		if (irqs & (LPAIF_IRQ_ALL(chan) | LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(chan) |
+				LPAIF_IRQ_HDMI_METADONE |
+				LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(chan))
+			&& drvdata->hdmi_substream[chan]) {
+			rv = lpass_dma_interrupt_handler(
+						drvdata->hdmi_substream[chan],
+						drvdata, chan, irqs);
+			if (rv != IRQ_HANDLED)
+				return rv;
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+
 static int lpass_platform_pcm_new(struct snd_soc_component *component,
 				  struct snd_soc_pcm_runtime *soc_runtime)
 {
@@ -649,6 +880,32 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 		return ret;
 	}
 
+	if (drvdata->hdmi_port_enable) {
+		drvdata->hdmiif_irq = platform_get_irq_byname(pdev, "lpass-irq-hdmi");
+		if (drvdata->hdmiif_irq < 0)
+			return -ENODEV;
+
+		ret = devm_request_irq(&pdev->dev, drvdata->hdmiif_irq,
+				lpass_platform_hdmiif_irq, 0, "lpass-irq-hdmi", drvdata);
+		if (ret) {
+			dev_err(&pdev->dev, "irq hdmi request failed: %d\n", ret);
+			return ret;
+		}
+		ret = regmap_write(drvdata->hdmiif_map,
+				LPASS_HDMITX_APP_IRQEN_REG(v), 0);
+		if (ret) {
+			dev_err(&pdev->dev, "error writing to hdmi irqen reg: %d\n", ret);
+			return ret;
+		}
+
+		ret = lpass_platform_alloc_hdmidmactl_fields(&pdev->dev,
+							 drvdata->hdmiif_map);
+		if (ret) {
+			dev_err(&pdev->dev,
+				"error initializing hdmidmactl fields: %d\n", ret);
+			return ret;
+		}
+	}
 	return devm_snd_soc_register_component(&pdev->dev,
 			&lpass_component_driver, NULL, 0);
 }
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 7089d4c..2bbb0b9 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2010-2011,2013-2015 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2010-2011,2013-2015,2020 The Linux Foundation. All rights reserved.
  *
  * lpass.h - Definitions for the QTi LPASS
  */
@@ -12,10 +12,15 @@
 #include <linux/compiler.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <dt-bindings/sound/sc7180-lpass.h>
+#include "lpass-hdmi.h"
 
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
 #define LPASS_MAX_MI2S_PORTS			(8)
 #define LPASS_MAX_DMA_CHANNELS			(8)
+#define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
+
+
 
 struct lpaif_i2sctl {
 	struct regmap_field *loopback;
@@ -37,6 +42,9 @@ struct lpaif_dmactl {
 	struct regmap_field *fifowm;
 	struct regmap_field *enable;
 	struct regmap_field *dyncclk;
+	struct regmap_field *burst8;
+	struct regmap_field *burst16;
+	struct regmap_field *dynburst;
 };
 
 /* Both the CPU DAI and platform drivers will access this data */
@@ -54,24 +62,29 @@ struct lpass_data {
 	/* MI2S SD lines to use for playback/capture */
 	unsigned int mi2s_playback_sd_mode[LPASS_MAX_MI2S_PORTS];
 	unsigned int mi2s_capture_sd_mode[LPASS_MAX_MI2S_PORTS];
+	int hdmi_port_enable;
 
 	/* low-power audio interface (LPAIF) registers */
 	void __iomem *lpaif;
+	void __iomem *hdmiif;
 
 	/* regmap backed by the low-power audio interface (LPAIF) registers */
 	struct regmap *lpaif_map;
+	struct regmap *hdmiif_map;
 
 	/* interrupts from the low-power audio interface (LPAIF) */
 	int lpaif_irq;
-
+	int hdmiif_irq;
 	/* SOC specific variations in the LPASS IP integration */
 	struct lpass_variant *variant;
 
 	/* bit map to keep track of static channel allocations */
 	unsigned long dma_ch_bit_map;
+	unsigned long hdmi_dma_ch_bit_map;
 
 	/* used it for handling interrupt per dma channel */
 	struct snd_pcm_substream *substream[LPASS_MAX_DMA_CHANNELS];
+	struct snd_pcm_substream *hdmi_substream[LPASS_MAX_HDMI_DMA_CHANNELS];
 
 	/* SOC specific clock list */
 	struct clk_bulk_data *clks;
@@ -81,22 +94,36 @@ struct lpass_data {
 	struct lpaif_i2sctl *i2sctl;
 	struct lpaif_dmactl *rd_dmactl;
 	struct lpaif_dmactl *wr_dmactl;
+	struct lpaif_dmactl *hdmi_rd_dmactl;
+	/* Regmap fields of HDMI_CTRL registers*/
+	struct regmap_field *hdmitx_legacy_en;
+	struct regmap_field *hdmitx_parity_calc_en;
+	struct regmap_field *hdmitx_ch_msb[LPASS_MAX_HDMI_DMA_CHANNELS];
+	struct regmap_field *hdmitx_ch_lsb[LPASS_MAX_HDMI_DMA_CHANNELS];
+	struct lpass_hdmi_tx_ctl *tx_ctl;
+	struct lpass_vbit_ctrl *vbit_ctl;
+	struct lpass_hdmitx_dmactl *hdmi_tx_dmactl[LPASS_MAX_HDMI_DMA_CHANNELS];
+	struct lpass_dp_metadata_ctl *meta_ctl;
+	struct lpass_sstream_ctl *sstream_ctl;
 };
 
 /* Vairant data per each SOC */
 struct lpass_variant {
-	u32	i2sctrl_reg_base;
-	u32	i2sctrl_reg_stride;
-	u32	i2s_ports;
 	u32	irq_reg_base;
 	u32	irq_reg_stride;
 	u32	irq_ports;
 	u32	rdma_reg_base;
 	u32	rdma_reg_stride;
 	u32	rdma_channels;
+	u32	hdmi_rdma_reg_base;
+	u32	hdmi_rdma_reg_stride;
+	u32	hdmi_rdma_channels;
 	u32	wrdma_reg_base;
 	u32	wrdma_reg_stride;
 	u32	wrdma_channels;
+	u32	i2sctrl_reg_base;
+	u32	i2sctrl_reg_stride;
+	u32	i2s_ports;
 
 	/* I2SCTL Register fields */
 	struct reg_field loopback;
@@ -109,6 +136,78 @@ struct lpass_variant {
 	struct reg_field wssrc;
 	struct reg_field bitwidth;
 
+	u32	hdmi_irq_reg_base;
+	u32	hdmi_irq_reg_stride;
+	u32	hdmi_irq_ports;
+
+	/* HDMI specific controls */
+	u32	hdmi_tx_ctl_addr;
+	u32	hdmi_legacy_addr;
+	u32	hdmi_vbit_addr;
+	u32	hdmi_ch_lsb_addr;
+	u32	hdmi_ch_msb_addr;
+	u32	ch_stride;
+	u32	hdmi_parity_addr;
+	u32	hdmi_dmactl_addr;
+	u32	hdmi_dma_stride;
+	u32	hdmi_DP_addr;
+	u32	hdmi_sstream_addr;
+
+	/* HDMI SSTREAM CTRL fields  */
+	struct reg_field sstream_en;
+	struct reg_field dma_sel;
+	struct reg_field auto_bbit_en;
+	struct reg_field layout;
+	struct reg_field layout_sp;
+	struct reg_field set_sp_on_en;
+	struct reg_field dp_audio;
+	struct reg_field dp_staffing_en;
+	struct reg_field dp_sp_b_hw_en;
+
+	/* HDMI DP METADATA CTL fields */
+	struct reg_field mute;
+	struct reg_field as_sdp_cc;
+	struct reg_field as_sdp_ct;
+	struct reg_field aif_db4;
+	struct reg_field frequency;
+	struct reg_field mst_index;
+	struct reg_field dptx_index;
+
+	/* HDMI TX CTRL fields */
+	struct reg_field soft_reset;
+	struct reg_field force_reset;
+
+	/* HDMI TX DMA CTRL */
+	struct reg_field use_hw_chs;
+	struct reg_field use_hw_usr;
+	struct reg_field hw_chs_sel;
+	struct reg_field hw_usr_sel;
+
+	/* HDMI VBIT CTRL */
+	struct reg_field replace_vbit;
+	struct reg_field vbit_stream;
+
+	/* HDMI TX LEGACY */
+	struct reg_field legacy_en;
+
+	/* HDMI TX PARITY */
+	struct reg_field calc_en;
+
+	/* HDMI CH LSB */
+	struct reg_field lsb_bits;
+
+	/* HDMI CH MSB */
+	struct reg_field msb_bits;
+
+	struct reg_field hdmi_rdma_bursten;
+	struct reg_field hdmi_rdma_wpscnt;
+	struct reg_field hdmi_rdma_fifowm;
+	struct reg_field hdmi_rdma_enable;
+	struct reg_field hdmi_rdma_dyncclk;
+	struct reg_field hdmi_rdma_burst8;
+	struct reg_field hdmi_rdma_burst16;
+	struct reg_field hdmi_rdma_dynburst;
+
 	/* RD_DMA Register fields */
 	struct reg_field rdma_intf;
 	struct reg_field rdma_bursten;
@@ -134,8 +233,8 @@ struct lpass_variant {
 	/* SOC specific initialization like clocks */
 	int (*init)(struct platform_device *pdev);
 	int (*exit)(struct platform_device *pdev);
-	int (*alloc_dma_channel)(struct lpass_data *data, int direction);
-	int (*free_dma_channel)(struct lpass_data *data, int ch);
+	int (*alloc_dma_channel)(struct lpass_data *data, int direction, unsigned int dai_id);
+	int (*free_dma_channel)(struct lpass_data *data, int ch, unsigned int dai_id);
 
 	/* SOC specific dais */
 	struct snd_soc_dai_driver *dai_driver;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

