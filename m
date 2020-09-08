Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2452E2617EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 19:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731669AbgIHRp0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 13:45:26 -0400
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:50790
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731658AbgIHRoz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 13:44:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599587093;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=QVVIPer97Ar67tKmA7olD8kvzRTdRB3lAU0ZcEX+QwE=;
        b=dP1fTpc11o6GaF4KFNp0+QT+UDZGTftA/nNeeJElebehxhTGLF1Gzdq75B0xawnM
        cUzSYUmJj2i2EgadFKZ4EjngQJiwp1XcTFn+LK8/I9N0Yqgqcs7c2YtTLhid7VoBXuZ
        tfBWaQ5WGeXvH9pFfe1nt+MoKU9jJbP7RDXNZAJU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599587093;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=QVVIPer97Ar67tKmA7olD8kvzRTdRB3lAU0ZcEX+QwE=;
        b=cctzh8Z745AiB5m2mMf61D0X+3wK/UcXQfOfRBvqmz0NIdw/xY0RpOeWUS1jifU8
        /QW+QPVtbngVE6jP3lS2VlliJzx3HH7MMlkbq2YAWO6GzTOOJkmFkQtK2BzbU9290y+
        U/Uk9xeStiKk4cb/3RqP8W974f+D7xx2oKhhs444=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1AADC43385
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
Subject: [PATCH v4 3/5] ASoC: qcom: Add support for lpass hdmi driver
Date:   Tue, 8 Sep 2020 17:44:53 +0000
Message-ID: <010101746ed20a76-6936a943-2a7a-4ea3-a1de-d0c3b6bbc892-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599587037-6742-1-git-send-email-srivasam@codeaurora.org>
References: <1599587037-6742-1-git-send-email-srivasam@codeaurora.org>
X-SES-Outgoing: 2020.09.08-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>

Upadate lpass cpu and platform driver to support audio over dp.
Also add lpass-hdmi.c and lpass-hdmi.h.

Signed-off-by: Srinivasa Rao <srivasam@codeaurora.org>
Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
---
 sound/soc/qcom/Kconfig           |   5 +
 sound/soc/qcom/Makefile          |   2 +
 sound/soc/qcom/lpass-cpu.c       |  66 ++--
 sound/soc/qcom/lpass-hdmi.c      | 684 +++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/lpass-hdmi.h      | 129 ++++++++
 sound/soc/qcom/lpass-lpaif-reg.h |  48 ++-
 sound/soc/qcom/lpass-platform.c  | 304 +++++++++++++----
 sound/soc/qcom/lpass.h           |  84 ++++-
 8 files changed, 1237 insertions(+), 85 deletions(-)
 create mode 100644 sound/soc/qcom/lpass-hdmi.c
 create mode 100644 sound/soc/qcom/lpass-hdmi.h

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index a607ace..509584c 100644
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
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 1ee6d8b..566d79a 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -554,6 +554,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *match;
 	int ret, i, dai_id;
+	unsigned int id;
 
 	dsp_of_node = of_parse_phandle(pdev->dev.of_node, "qcom,adsp", 0);
 	if (dsp_of_node) {
@@ -572,8 +573,10 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 	drvdata->variant = (struct lpass_variant *)match->data;
 	variant = drvdata->variant;
+	id = variant->dai_driver->id;
 
-	of_lpass_cpu_parse_dai_data(dev, drvdata);
+	if (id != HDMI)
+		of_lpass_cpu_parse_dai_data(dev, drvdata);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
@@ -584,18 +587,33 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		return PTR_ERR((void const __force *)drvdata->lpaif);
 	}
 
-	lpass_cpu_regmap_config.max_register = LPAIF_WRDMAPER_REG(variant,
+	if (id != HDMI) {
+		lpass_cpu_regmap_config.max_register = LPAIF_WRDMAPER_REG(variant,
 						variant->wrdma_channels +
 						variant->wrdma_channel_start);
 
-	drvdata->lpaif_map = devm_regmap_init_mmio(dev, drvdata->lpaif,
-			&lpass_cpu_regmap_config);
-	if (IS_ERR(drvdata->lpaif_map)) {
-		dev_err(dev, "error initializing regmap: %ld\n",
+		drvdata->lpaif_map = devm_regmap_init_mmio(dev, drvdata->lpaif,
+								&lpass_cpu_regmap_config);
+		if (IS_ERR(drvdata->lpaif_map)) {
+			dev_err(dev, "error initializing regmap: %ld\n",
+				PTR_ERR(drvdata->lpaif_map));
+			return PTR_ERR(drvdata->lpaif_map);
+		}
+	} else {
+#ifdef CONFIG_SND_SOC_LPASS_SC7180
+		lpass_hdmi_regmap_config.max_register = LPAIF_HDMI_RDMAPER_REG(variant,
+					variant->rdma_channels);
+		drvdata->lpaif_map = devm_regmap_init_mmio(dev, drvdata->lpaif,
+					&lpass_hdmi_regmap_config);
+		if (IS_ERR(drvdata->lpaif_map)) {
+			dev_err(dev, "error initializing regmap: %ld\n",
 			PTR_ERR(drvdata->lpaif_map));
-		return PTR_ERR(drvdata->lpaif_map);
+			return PTR_ERR(drvdata->lpaif_map);
+		}
+#else
+		return -EINVAL;
+#endif
 	}
-
 	if (variant->init) {
 		ret = variant->init(pdev);
 		if (ret) {
@@ -606,6 +624,9 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 
 	for (i = 0; i < variant->num_dai; i++) {
 		dai_id = variant->dai_driver[i].id;
+		if (dai_id == HDMI)
+			continue;
+
 		drvdata->mi2s_osr_clk[dai_id] = devm_clk_get(dev,
 					     variant->dai_osr_clk_names[i]);
 		if (IS_ERR(drvdata->mi2s_osr_clk[dai_id])) {
@@ -629,18 +650,27 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* Allocation for i2sctl regmap fields */
-	drvdata->i2sctl = devm_kzalloc(&pdev->dev, sizeof(struct lpaif_i2sctl),
-					GFP_KERNEL);
+	if (id != HDMI) {
+		/* Allocation for i2sctl regmap fields */
+		drvdata->i2sctl = devm_kzalloc(&pdev->dev, sizeof(struct lpaif_i2sctl),
+						GFP_KERNEL);
 
-	/* Initialize bitfields for dai I2SCTL register */
-	ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
-						drvdata->lpaif_map);
-	if (ret) {
-		dev_err(dev, "error init i2sctl field: %d\n", ret);
-		return ret;
+		/* Initialize bitfields for dai I2SCTL register */
+		ret = lpass_cpu_init_i2sctl_bitfields(dev, drvdata->i2sctl,
+							drvdata->lpaif_map);
+		if (ret)
+			dev_err(dev, "error init i2sctl field: %d\n", ret);
+	} else {
+#ifdef CONFIG_SND_SOC_LPASS_SC7180
+		ret = lpass_hdmi_init_bitfields(dev, drvdata->lpaif_map);
+		if (ret) {
+			dev_err(dev, "%s error  hdmi init failed\n", __func__);
+			return ret;
+		}
+#else
+		return -EINVAL;
+#endif
 	}
-
 	ret = devm_snd_soc_register_component(dev,
 					      &lpass_cpu_comp_driver,
 					      variant->dai_driver,
diff --git a/sound/soc/qcom/lpass-hdmi.c b/sound/soc/qcom/lpass-hdmi.c
new file mode 100644
index 0000000..7e18113
--- /dev/null
+++ b/sound/soc/qcom/lpass-hdmi.c
@@ -0,0 +1,684 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020 The Linux Foundation. All rights reserved.
+ *
+ * lpass-hdmi.c -- ALSA SoC HDMI-CPU DAI driver for QTi LPASS HDMI
+ */
+
+#include <linux/clk.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <dt-bindings/sound/sc7180-lpass.h>
+#include "lpass-lpaif-reg.h"
+#include "lpass.h"
+#include "lpass-hdmi.h"
+
+int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	unsigned int i;
+	struct lpass_hdmi_tx_ctl *tx_ctl;
+	struct lpass_hdmitx_legacy *legacy;
+	struct lpass_vbit_ctrl *vbit_ctl;
+	struct lpass_hdmi_tx_parity *tx_parity;
+	struct lpass_dp_metadata_ctl *meta_ctl;
+	struct lpass_sstream_ctl *sstream_ctl;
+	struct lpass_hdmi_tx_ch_msb *ch_msb;
+	struct lpass_hdmi_tx_ch_lsb *ch_lsb;
+	struct lpass_hdmitx_dmactl *hdmi_tx_dmactl;
+
+	drvdata->tx_ctl = devm_kzalloc(dev, sizeof(struct lpass_hdmi_tx_ctl),
+					GFP_KERNEL);
+	if (drvdata->tx_ctl == NULL)
+		return -ENOMEM;
+
+	tx_ctl = drvdata->tx_ctl;
+	tx_ctl->soft_reset = devm_regmap_field_alloc(dev, map,
+				v->soft_reset);
+	tx_ctl->force_reset = devm_regmap_field_alloc(dev, map,
+				v->force_reset);
+	if (IS_ERR(tx_ctl->soft_reset) || IS_ERR(tx_ctl->force_reset))
+		return -EINVAL;
+
+	drvdata->legacy = devm_kzalloc(dev, sizeof(struct lpass_hdmitx_legacy),
+					GFP_KERNEL);
+	if (drvdata->legacy == NULL)
+		return -ENOMEM;
+
+	legacy = drvdata->legacy;
+	legacy->legacy_en = devm_regmap_field_alloc(dev, map,
+				v->legacy_en);
+	if (IS_ERR(legacy->legacy_en))
+		return -EINVAL;
+
+	drvdata->vbit_ctl = devm_kzalloc(dev, sizeof(struct lpass_vbit_ctrl),
+					GFP_KERNEL);
+	if (drvdata->vbit_ctl == NULL)
+		return -ENOMEM;
+
+	vbit_ctl = drvdata->vbit_ctl;
+	vbit_ctl->replace_vbit = devm_regmap_field_alloc(dev, map,
+					v->replace_vbit);
+	vbit_ctl->vbit_stream = devm_regmap_field_alloc(dev, map,
+					v->vbit_stream);
+	if (IS_ERR(vbit_ctl->replace_vbit) || IS_ERR(vbit_ctl->vbit_stream))
+		return -EINVAL;
+
+	drvdata->tx_parity = devm_kzalloc(dev,
+		sizeof(struct  lpass_hdmi_tx_parity), GFP_KERNEL);
+
+	if (drvdata->tx_parity == NULL)
+		return -ENOMEM;
+
+	tx_parity = drvdata->tx_parity;
+	tx_parity->calc_en = devm_regmap_field_alloc(dev, map, v->calc_en);
+
+	if (IS_ERR(tx_parity->calc_en))
+		return -EINVAL;
+
+	drvdata->meta_ctl = devm_kzalloc(dev,
+		sizeof(struct lpass_dp_metadata_ctl), GFP_KERNEL);
+
+	if (drvdata->meta_ctl == NULL)
+		return -ENOMEM;
+
+	meta_ctl = drvdata->meta_ctl;
+	meta_ctl->mute = devm_regmap_field_alloc(dev, map, v->mute);
+	meta_ctl->as_sdp_cc = devm_regmap_field_alloc(dev, map,
+						v->as_sdp_cc);
+	meta_ctl->as_sdp_ct = devm_regmap_field_alloc(dev, map,
+						v->as_sdp_ct);
+	meta_ctl->aif_db4 = devm_regmap_field_alloc(dev, map,
+						v->aif_db4);
+	meta_ctl->frequency = devm_regmap_field_alloc(dev, map,
+						v->frequency);
+	meta_ctl->mst_index = devm_regmap_field_alloc(dev, map,
+						v->mst_index);
+	meta_ctl->dptx_index = devm_regmap_field_alloc(dev, map,
+						v->dptx_index);
+
+	if (IS_ERR(meta_ctl->mute) || IS_ERR(meta_ctl->as_sdp_cc) ||
+		IS_ERR(meta_ctl->as_sdp_ct) || IS_ERR(meta_ctl->aif_db4) ||
+		IS_ERR(meta_ctl->frequency) || IS_ERR(meta_ctl->mst_index) ||
+		IS_ERR(meta_ctl->dptx_index))
+		return -EINVAL;
+
+	drvdata->sstream_ctl = devm_kzalloc(dev,
+		sizeof(struct lpass_sstream_ctl), GFP_KERNEL);
+	if (drvdata->sstream_ctl == NULL)
+		return -ENOMEM;
+
+	sstream_ctl = drvdata->sstream_ctl;
+	sstream_ctl->sstream_en = devm_regmap_field_alloc(dev, map,
+						v->sstream_en);
+	sstream_ctl->dma_sel = devm_regmap_field_alloc(dev, map,
+						v->dma_sel);
+	sstream_ctl->auto_bbit_en = devm_regmap_field_alloc(dev, map,
+						v->auto_bbit_en);
+	sstream_ctl->layout = devm_regmap_field_alloc(dev, map,
+						v->layout);
+	sstream_ctl->layout_sp = devm_regmap_field_alloc(dev, map,
+						v->layout_sp);
+	sstream_ctl->dp_audio = devm_regmap_field_alloc(dev, map,
+						v->dp_audio);
+	sstream_ctl->set_sp_on_en = devm_regmap_field_alloc(dev, map,
+						v->set_sp_on_en);
+	sstream_ctl->dp_staffing_en = devm_regmap_field_alloc(dev, map,
+						v->dp_staffing_en);
+	sstream_ctl->dp_sp_b_hw_en = devm_regmap_field_alloc(dev, map,
+						v->dp_sp_b_hw_en);
+
+	if (IS_ERR(sstream_ctl->sstream_en) || IS_ERR(sstream_ctl->dma_sel) ||
+		IS_ERR(sstream_ctl->auto_bbit_en) ||
+		IS_ERR(sstream_ctl->layout) || IS_ERR(sstream_ctl->layout_sp) ||
+		IS_ERR(sstream_ctl->dp_audio) ||
+		IS_ERR(sstream_ctl->set_sp_on_en) ||
+		IS_ERR(sstream_ctl->dp_staffing_en) ||
+		IS_ERR(sstream_ctl->dp_sp_b_hw_en))
+		return -EINVAL;
+
+	for (i = 0; i < LPASS_MAX_HDMI_DMA_CHANNELS; i++) {
+		drvdata->ch_msb[i] = devm_kzalloc(dev,
+			sizeof(struct lpass_hdmi_tx_ch_msb), GFP_KERNEL);
+		if (drvdata->ch_msb[i] == NULL)
+			return -ENOMEM;
+
+		ch_msb = drvdata->ch_msb[i];
+
+		ch_msb->msb_bits = devm_regmap_field_alloc(dev, map,
+							v->msb_bits);
+		if (IS_ERR(ch_msb->msb_bits))
+			return -EINVAL;
+
+		drvdata->ch_lsb[i] = devm_kzalloc(dev,
+			sizeof(struct lpass_hdmi_tx_ch_lsb), GFP_KERNEL);
+		if (drvdata->ch_lsb[i] == NULL)
+			return -ENOMEM;
+
+		ch_lsb = drvdata->ch_lsb[i];
+		ch_lsb->lsb_bits = devm_regmap_field_alloc(dev, map,
+					v->lsb_bits);
+		if (IS_ERR(ch_lsb->lsb_bits))
+			return -EINVAL;
+
+
+		drvdata->hdmi_tx_dmactl[i] = devm_kzalloc(dev,
+			sizeof(struct lpass_hdmitx_dmactl), GFP_KERNEL);
+		if (drvdata->hdmi_tx_dmactl[i] == NULL)
+			return -ENOMEM;
+
+		hdmi_tx_dmactl = drvdata->hdmi_tx_dmactl[i];
+		hdmi_tx_dmactl->use_hw_chs = devm_regmap_field_alloc(dev, map,
+						v->use_hw_chs);
+		hdmi_tx_dmactl->use_hw_usr = devm_regmap_field_alloc(dev, map,
+						v->use_hw_usr);
+		hdmi_tx_dmactl->hw_chs_sel = devm_regmap_field_alloc(dev, map,
+						v->hw_chs_sel);
+		hdmi_tx_dmactl->hw_usr_sel = devm_regmap_field_alloc(dev, map,
+						v->hw_usr_sel);
+		if (IS_ERR(hdmi_tx_dmactl->use_hw_chs) ||
+			IS_ERR(hdmi_tx_dmactl->use_hw_usr) ||
+			IS_ERR(hdmi_tx_dmactl->hw_chs_sel) ||
+			IS_ERR(hdmi_tx_dmactl->hw_usr_sel))
+			return -EINVAL;
+	}
+	return 0;
+
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
+
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
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to softreset enable : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->tx_ctl->soft_reset, LPASS_TX_CTL_CLEAR);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to softreset disable : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->legacy->legacy_en,
+				LPASS_HDMITX_LEGACY_DISABLE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to legacy_en field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->tx_parity->calc_en,
+				HDMITX_PARITY_CALC_EN);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to tx_parity field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->vbit_ctl->replace_vbit,
+					REPLACE_VBIT);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to  replace vbit field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->vbit_ctl->vbit_stream,
+					LINEAR_PCM_DATA);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to vbit stream field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->ch_msb[0]->msb_bits, ch_sts_buf1);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to ch_sts_buf1 field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->ch_lsb[0]->lsb_bits, ch_sts_buf0);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to ch_sts_buf0 field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->use_hw_chs,
+				HW_MODE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to use_hw_chs field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->hw_chs_sel,
+				SW_MODE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to hw_chs_sel field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->use_hw_usr,
+				HW_MODE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to use_hw_usr field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->hdmi_tx_dmactl[0]->hw_usr_sel,
+				SW_MODE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to hw_usr_sel field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->meta_ctl->mute,
+				LPASS_MUTE_ENABLE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to mute field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->meta_ctl->as_sdp_cc,
+				channels - 1);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to as_sdp_cc field: %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->meta_ctl->as_sdp_ct,
+				LPASS_META_DEFAULT_VAL);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to as_sdp_ct field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->meta_ctl->aif_db4,
+				LPASS_META_DEFAULT_VAL);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to aif_db4 field: %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->meta_ctl->frequency, sampling_freq);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to frequency field: %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->meta_ctl->mst_index,
+				LPASS_META_DEFAULT_VAL);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to mst_index : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->meta_ctl->dptx_index,
+				LPASS_META_DEFAULT_VAL);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to dptx_index field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->sstream_ctl->sstream_en,
+				LPASS_SSTREAM_DISABLE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to sstream_en field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->sstream_ctl->dma_sel, ch);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to dma_sel field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->sstream_ctl->auto_bbit_en,
+				LPASS_SSTREAM_DEFAULT_ENABLE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to auto_bbit_en field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->sstream_ctl->layout,
+				LPASS_SSTREAM_DEFAULT_DISABLE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to layout field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->sstream_ctl->layout_sp,
+				LPASS_LAYOUT_SP_DEFAULT);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to layout_sp field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->sstream_ctl->dp_audio,
+				LPASS_SSTREAM_DEFAULT_ENABLE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to dp_audio field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->sstream_ctl->set_sp_on_en,
+				LPASS_SSTREAM_DEFAULT_ENABLE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to set_sp_on_en field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->sstream_ctl->dp_sp_b_hw_en,
+				LPASS_SSTREAM_DEFAULT_ENABLE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to dp_sp_b_hw_en field : %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->sstream_ctl->dp_staffing_en,
+				LPASS_SSTREAM_DEFAULT_ENABLE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to dp_staffing_en field: %d\n",
+				__func__, ret);
+		return ret;
+	}
+	return ret;
+}
+
+
+
+static int lpass_hdmi_daiops_prepare(struct snd_pcm_substream *substream,
+		struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	int ret;
+
+	ret = regmap_field_write(drvdata->sstream_ctl->sstream_en,
+					LPASS_SSTREAM_ENABLE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to sstream_en field: %d\n",
+					__func__, ret);
+		return ret;
+	}
+
+	ret = regmap_field_write(drvdata->meta_ctl->mute,
+					LPASS_MUTE_DISABLE);
+	if (ret) {
+		dev_err(dai->dev, "%s error writing to mute field : %d\n",
+				__func__, ret);
+		return ret;
+	}
+	return ret;
+}
+
+static int lpass_hdmi_daiops_trigger(struct snd_pcm_substream *substream,
+		int cmd, struct snd_soc_dai *dai)
+{
+	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
+	int ret = -EINVAL;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+
+		ret = regmap_field_write(drvdata->sstream_ctl->sstream_en,
+					LPASS_SSTREAM_ENABLE);
+		if (ret) {
+			dev_err(dai->dev, "%s error writing to sstream_en field: %d\n",
+				__func__, ret);
+			return ret;
+		}
+
+		ret = regmap_field_write(drvdata->meta_ctl->mute,
+					LPASS_MUTE_DISABLE);
+		if (ret) {
+			dev_err(dai->dev, "%s error writing to mute field : %d\n",
+				__func__, ret);
+			return ret;
+		}
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+
+		ret = regmap_field_write(drvdata->sstream_ctl->sstream_en,
+					LPASS_SSTREAM_DISABLE);
+		if (ret) {
+			dev_err(dai->dev, "%s error writing to sstream_en field: %d\n",
+				__func__, ret);
+			return ret;
+		}
+
+		ret = regmap_field_write(drvdata->meta_ctl->mute,
+					LPASS_MUTE_ENABLE);
+		if (ret) {
+			dev_err(dai->dev, "%s error writing to mute field : %d\n",
+				__func__, ret);
+			return ret;
+		}
+
+		ret = regmap_field_write(drvdata->sstream_ctl->dp_audio, 0);
+		if (ret) {
+			dev_err(dai->dev, "%s error writing to dp_audio field: %d\n",
+					__func__, ret);
+			return ret;
+		}
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
+
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
+
+	for (i = 0; i < v->rdma_channels; i++) {
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
+
+	if (reg == LPASS_HDMITX_APP_IRQEN_REG(v))
+		return true;
+	if (reg == LPASS_HDMITX_APP_IRQCLEAR_REG(v))
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
+
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
+	for (i = 0; i < v->rdma_channels; i++) {
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
+
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
+	return true;
+
+}
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
index 0000000..f91f322
--- /dev/null
+++ b/sound/soc/qcom/lpass-hdmi.h
@@ -0,0 +1,129 @@
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
+#include <linux/clk.h>
+#include <linux/compiler.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#define LPASS_HDMITX_LEGACY_DISABLE		0x0
+#define LPASS_HDMITX_LEGACY_ENABLE		0x1
+#define LPASS_DP_AUDIO_BITWIDTH16		0x0
+#define LPASS_DP_AUDIO_BITWIDTH24		0xb
+#define LPASS_DATA_FORMAT_SHIFT			0x1
+#define LPASS_DATA_FORMAT_MASK			0x2
+#define LPASS_FREQ_BIT_SHIFT			24
+#define LPASS_FREQ_BIT_MASK			0xf000000
+#define LPASS_DATA_FORMAT_LINEAR		0x0
+#define LPASS_DATA_FORMAT_NON_LINEAR		0x1
+#define LPASS_SAMPLING_FREQ32			0x3
+#define LPASS_SAMPLING_FREQ44			0x0
+#define LPASS_SAMPLING_FREQ48			0x2
+#define LPASS_TX_CTL_RESET			0x1
+#define LPASS_TX_CTL_CLEAR			0x0
+#define LPASS_SSTREAM_ENABLE			1
+#define LPASS_SSTREAM_DISABLE			0
+#define LPASS_LAYOUT_SP_DEFAULT			0xf
+#define LPASS_SSTREAM_DEFAULT_ENABLE		1
+#define LPASS_SSTREAM_DEFAULT_DISABLE		0
+#define LPASS_WORDLENGTH_MASK			0xf
+#define LPASS_MUTE_ENABLE			1
+#define LPASS_MUTE_DISABLE			0
+#define LPASS_META_DEFAULT_VAL			0
+#define HW_MODE					1
+#define SW_MODE					0
+#define LEGACY_LPASS_LPAIF			1
+#define LEGACY_LPASS_HDMI			0
+#define REPLACE_VBIT				0x1
+#define LINEAR_PCM_DATA				0x0
+#define NON_LINEAR_PCM_DATA			0x1
+#define HDMITX_PARITY_CALC_EN			0x1
+#define HDMITX_PARITY_CALC_DIS			0x0
+
+
+#define LPASS_HDMI_TX_CTL_ADDR(v) \
+		(v->hdmi_tx_ctl_addr)
+
+#define LPASS_HDMI_TX_LEGACY_ADDR(v) \
+		(v->hdmi_legacy_addr)
+#define LPASS_HDMI_TX_VBIT_CTL_ADDR(v) \
+		(v->hdmi_vbit_addr)
+#define LPASS_HDMI_TX_CH_LSB_ADDR(v, port) \
+		(v->hdmi_ch_lsb_addr + \
+		v->ch_stride * (port))
+#define LPASS_HDMI_TX_CH_MSB_ADDR(v, port) \
+		(v->hdmi_ch_msb_addr + \
+		v->ch_stride * (port))
+#define LPASS_HDMI_TX_DMA_ADDR(v, port) \
+		(v->hdmi_dmactl_addr + \
+		v->hdmi_dma_stride * (port))
+#define LPASS_HDMI_TX_PARITY_ADDR(v) \
+		(v->hdmi_parity_addr)
+#define LPASS_HDMI_TX_DP_ADDR(v) \
+		(v->hdmi_DP_addr)
+#define LPASS_HDMI_TX_SSTREAM_ADDR(v) \
+		(v->hdmi_sstream_addr)
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
+#endif /* __LPASS_HDMI_H__ */
diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index 5258e60..ecf9be1 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -70,6 +70,29 @@
 #define LPAIF_IRQSTAT_REG(v, port)	LPAIF_IRQ_REG_ADDR(v, 0x4, (port))
 #define LPAIF_IRQCLEAR_REG(v, port)	LPAIF_IRQ_REG_ADDR(v, 0xC, (port))
 
+
+#define LPASS_HDMITX_APP_IRQ_REG_ADDR(v, addr)  \
+	((v->irq_reg_base) + (addr))
+
+#define LPASS_HDMITX_APP_IRQEN_REG(v)			LPASS_HDMITX_APP_IRQ_REG_ADDR(v, 0x4)
+#define LPASS_HDMITX_APP_IRQSTAT_REG(v)			LPASS_HDMITX_APP_IRQ_REG_ADDR(v, 0x8)
+#define LPASS_HDMITX_APP_IRQCLEAR_REG(v)		LPASS_HDMITX_APP_IRQ_REG_ADDR(v, 0xC)
+
+#define IRQ_EN(v, port)\
+		((v->dai_driver->id == HDMI) ? \
+		LPASS_HDMITX_APP_IRQEN_REG(v) : \
+		  LPAIF_IRQEN_REG(v, port))
+
+#define IRQ_STAT(v, port)\
+		((v->dai_driver->id == HDMI) ? \
+		LPASS_HDMITX_APP_IRQSTAT_REG(v) : \
+		  LPAIF_IRQSTAT_REG(v, port))
+
+#define IRQ_CLEAR(v, port)\
+		((v->dai_driver->id == HDMI) ? \
+		LPASS_HDMITX_APP_IRQCLEAR_REG(v) : \
+		  LPAIF_IRQCLEAR_REG(v, port))
+
 #define LPAIF_IRQ_BITSTRIDE		3
 
 #define LPAIF_IRQ_PER(chan)		(1 << (LPAIF_IRQ_BITSTRIDE * (chan)))
@@ -77,8 +100,22 @@
 #define LPAIF_IRQ_ERR(chan)		(4 << (LPAIF_IRQ_BITSTRIDE * (chan)))
 
 #define LPAIF_IRQ_ALL(chan)		(7 << (LPAIF_IRQ_BITSTRIDE * (chan)))
+#define LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(chan)	(1 << (14 + chan))
+#define LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(chan)	(1 << (24 + chan))
+#define LPAIF_IRQ_HDMI_METADONE		BIT(23)
 
 /* LPAIF DMA */
+#define LPAIF_HDMI_RDMA_REG_ADDR(v, addr, chan) \
+	(v->rdma_reg_base + (addr) + v->rdma_reg_stride * (chan))
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
@@ -103,10 +140,15 @@
 #define	LPAIF_WRDMAPER_REG(v, chan)	LPAIF_WRDMA_REG_ADDR(v, 0x10, (chan))
 #define	LPAIF_WRDMAPERCNT_REG(v, chan)	LPAIF_WRDMA_REG_ADDR(v, 0x14, (chan))
 
+#define LPAIF_INTFDMA_REG(v, chan, reg)  \
+		((v->dai_driver->id ==  HDMI) ? \
+		LPAIF_HDMI_RDMA##reg##_REG(v, chan) : \
+		 LPAIF_RDMA##reg##_REG(v, chan))
+
 #define __LPAIF_DMA_REG(v, chan, dir, reg)  \
-	(dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
-		LPAIF_RDMA##reg##_REG(v, chan) : \
-		LPAIF_WRDMA##reg##_REG(v, chan)
+	((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
+		(LPAIF_INTFDMA_REG(v, chan, reg)) : \
+		LPAIF_WRDMA##reg##_REG(v, chan))
 
 #define LPAIF_DMACTL_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, CTL)
 #define LPAIF_DMABASE_REG(v, chan, dir) __LPAIF_DMA_REG(v, chan, dir, BASE)
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index df692ed..3422fa4 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -23,7 +23,7 @@ struct lpass_pcm_data {
 	int i2s_port;
 };
 
-#define LPASS_PLATFORM_BUFFER_SIZE	(16 * 1024)
+#define LPASS_PLATFORM_BUFFER_SIZE	(24 *  2 * 1024)
 #define LPASS_PLATFORM_PERIODS		2
 
 static const struct snd_pcm_hardware lpass_platform_pcm_hardware = {
@@ -56,44 +56,73 @@ static int lpass_platform_alloc_dmactl_fields(struct device *dev,
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 	struct lpass_variant *v = drvdata->variant;
 	struct lpaif_dmactl *rd_dmactl, *wr_dmactl;
+	unsigned int dai_id = v->dai_driver->id;
+
 
 	drvdata->rd_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
 					  GFP_KERNEL);
 	if (drvdata->rd_dmactl == NULL)
 		return -ENOMEM;
 
-	drvdata->wr_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl),
-					  GFP_KERNEL);
-	if (drvdata->wr_dmactl == NULL)
-		return -ENOMEM;
-
 	rd_dmactl = drvdata->rd_dmactl;
-	wr_dmactl = drvdata->wr_dmactl;
 
 	rd_dmactl->bursten = devm_regmap_field_alloc(dev, map, v->rdma_bursten);
 	rd_dmactl->wpscnt = devm_regmap_field_alloc(dev, map, v->rdma_wpscnt);
 	rd_dmactl->fifowm = devm_regmap_field_alloc(dev, map, v->rdma_fifowm);
-	rd_dmactl->intf = devm_regmap_field_alloc(dev, map, v->rdma_intf);
 	rd_dmactl->enable = devm_regmap_field_alloc(dev, map, v->rdma_enable);
 	rd_dmactl->dyncclk = devm_regmap_field_alloc(dev, map, v->rdma_dyncclk);
 
 	if (IS_ERR(rd_dmactl->bursten) || IS_ERR(rd_dmactl->wpscnt) ||
-	    IS_ERR(rd_dmactl->fifowm) || IS_ERR(rd_dmactl->intf) ||
-	    IS_ERR(rd_dmactl->enable) || IS_ERR(rd_dmactl->dyncclk))
+	    IS_ERR(rd_dmactl->fifowm) || IS_ERR(rd_dmactl->dyncclk) ||
+	    IS_ERR(rd_dmactl->enable))
 		return -EINVAL;
 
-	wr_dmactl->bursten = devm_regmap_field_alloc(dev, map, v->wrdma_bursten);
-	wr_dmactl->wpscnt = devm_regmap_field_alloc(dev, map, v->wrdma_wpscnt);
-	wr_dmactl->fifowm = devm_regmap_field_alloc(dev, map, v->wrdma_fifowm);
-	wr_dmactl->intf = devm_regmap_field_alloc(dev, map, v->wrdma_intf);
-	wr_dmactl->enable = devm_regmap_field_alloc(dev, map, v->wrdma_enable);
-	wr_dmactl->dyncclk = devm_regmap_field_alloc(dev, map, v->wrdma_dyncclk);
+	switch (dai_id) {
+	case HDMI:
+		rd_dmactl->burst8 = devm_regmap_field_alloc(dev, map, v->rdma_burst8);
+		rd_dmactl->burst16 = devm_regmap_field_alloc(dev, map, v->rdma_burst16);
+		rd_dmactl->dynburst = devm_regmap_field_alloc(dev, map, v->rdma_dynburst);
 
-	if (IS_ERR(wr_dmactl->bursten) || IS_ERR(wr_dmactl->wpscnt) ||
-	    IS_ERR(wr_dmactl->fifowm) || IS_ERR(wr_dmactl->intf) ||
-	    IS_ERR(wr_dmactl->enable) || IS_ERR(wr_dmactl->dyncclk))
-		return -EINVAL;
+		if (IS_ERR(rd_dmactl->burst8) || IS_ERR(rd_dmactl->burst16) ||
+			IS_ERR(rd_dmactl->dynburst))
+			return -EINVAL;
+		break;
+	case MI2S_PRIMARY:
+	case MI2S_SECONDARY:
+		rd_dmactl->intf = devm_regmap_field_alloc(dev, map, v->rdma_intf);
+		if (IS_ERR(rd_dmactl->intf))
+			return -EINVAL;
 
+		drvdata->wr_dmactl = devm_kzalloc(dev,
+				sizeof(struct lpaif_dmactl), GFP_KERNEL);
+		if (drvdata->wr_dmactl == NULL)
+			return -ENOMEM;
+
+		wr_dmactl = drvdata->wr_dmactl;
+
+		wr_dmactl->bursten = devm_regmap_field_alloc(dev, map,
+							v->wrdma_bursten);
+		wr_dmactl->wpscnt = devm_regmap_field_alloc(dev, map,
+							v->wrdma_wpscnt);
+		wr_dmactl->fifowm = devm_regmap_field_alloc(dev, map,
+							v->wrdma_fifowm);
+		wr_dmactl->intf = devm_regmap_field_alloc(dev, map,
+							v->wrdma_intf);
+		wr_dmactl->enable = devm_regmap_field_alloc(dev, map,
+							v->wrdma_enable);
+		wr_dmactl->dyncclk = devm_regmap_field_alloc(dev, map,
+							v->wrdma_dyncclk);
+
+		if (IS_ERR(wr_dmactl->bursten) || IS_ERR(wr_dmactl->wpscnt) ||
+			IS_ERR(wr_dmactl->fifowm) || IS_ERR(wr_dmactl->intf) ||
+			IS_ERR(wr_dmactl->enable) || IS_ERR(wr_dmactl->dyncclk))
+			return -EINVAL;
+		break;
+	default:
+		dev_err(dev, "%s: alloc dma channels failed for %d interface\n",
+				__func__, dai_id);
+		break;
+	}
 	return 0;
 }
 
@@ -106,7 +135,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct lpass_variant *v = drvdata->variant;
 	int ret, dma_ch, dir = substream->stream;
-	struct lpass_pcm_data *data;
+	struct lpass_pcm_data *data = NULL;
 
 	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -174,6 +203,7 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 					   struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -184,7 +214,9 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	struct lpaif_dmactl *dmactl;
 	int id, dir = substream->stream;
 	int bitwidth;
-	int ret, dma_port = pcm_data->i2s_port + v->dmactl_audif_start;
+	int ret;
+	int dma_port = pcm_data->i2s_port + v->dmactl_audif_start;
+	unsigned int dai_id = cpu_dai->driver->id;
 
 	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
 		dmactl = drvdata->rd_dmactl;
@@ -207,18 +239,48 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
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
+	case HDMI:
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
@@ -249,16 +311,24 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 			regval = LPAIF_DMACTL_WPSCNT_ONE;
 			break;
 		case 2:
-			regval = LPAIF_DMACTL_WPSCNT_TWO;
+			regval = (dai_id == HDMI ?
+			LPAIF_DMACTL_WPSCNT_ONE :
+			LPAIF_DMACTL_WPSCNT_TWO);
 			break;
 		case 4:
-			regval = LPAIF_DMACTL_WPSCNT_FOUR;
+			regval = (dai_id == HDMI ?
+			LPAIF_DMACTL_WPSCNT_TWO :
+			LPAIF_DMACTL_WPSCNT_FOUR);
 			break;
 		case 6:
-			regval = LPAIF_DMACTL_WPSCNT_SIX;
+			regval = (dai_id == HDMI ?
+			LPAIF_DMACTL_WPSCNT_THREE :
+			LPAIF_DMACTL_WPSCNT_SIX);
 			break;
 		case 8:
-			regval = LPAIF_DMACTL_WPSCNT_EIGHT;
+			regval = (dai_id == HDMI ?
+			LPAIF_DMACTL_WPSCNT_FOUR :
+			LPAIF_DMACTL_WPSCNT_EIGHT);
 			break;
 		default:
 			dev_err(soc_runtime->dev,
@@ -268,7 +338,8 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 		}
 		break;
 	default:
-		dev_err(soc_runtime->dev, "invalid PCM config given: bw=%d, ch=%u\n",
+		dev_err(soc_runtime->dev,
+			"invalid PCM config given: bw=%d,ch=%u\n",
 			bitwidth, channels);
 		return -EINVAL;
 	}
@@ -366,6 +437,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 					 int cmd)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
@@ -373,6 +445,9 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 	struct lpaif_dmactl *dmactl;
 	int ret, ch, id;
 	int dir = substream->stream;
+	unsigned int reg_irqclr = 0, val_irqclr = 0;
+	unsigned int  reg_irqen = 0, val_irqen = 0, val_mask = 0;
+	unsigned int dai_id = cpu_dai->driver->id;
 
 	ch = pcm_data->dma_ch;
 	if (dir ==  SNDRV_PCM_STREAM_PLAYBACK) {
@@ -387,31 +462,65 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
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
+		case HDMI:
+			ret = regmap_fields_write(dmactl->dyncclk, id,
+					 LPAIF_DMACTL_DYNCLK_ON);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to rdmactl reg: %d\n", ret);
+				return ret;
+			}
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
+			 reg_irqclr = LPAIF_IRQCLEAR_REG(v,
+					LPAIF_IRQ_PORT_HOST);
+			 val_irqclr = LPAIF_IRQ_ALL(ch);
 
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
+		ret = regmap_write(drvdata->lpaif_map, reg_irqclr, val_irqclr);
 		if (ret) {
 			dev_err(soc_runtime->dev,
-				"error writing to irqen reg: %d\n", ret);
+			"error writing to irqclear reg: %d\n", ret);
 			return ret;
 		}
-
-		ret = regmap_fields_write(dmactl->enable, id,
-					 LPAIF_DMACTL_ENABLE_ON);
+		ret = regmap_update_bits(drvdata->lpaif_map,
+		reg_irqen, val_mask, val_irqen);
 		if (ret) {
 			dev_err(soc_runtime->dev,
-				"error writing to rdmactl reg: %d\n", ret);
+			"error writing to irqen reg: %d\n", ret);
 			return ret;
 		}
 		break;
@@ -425,10 +534,37 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 				"error writing to rdmactl reg: %d\n", ret);
 			return ret;
 		}
+		switch (dai_id) {
+		case HDMI:
+			ret = regmap_fields_write(dmactl->dyncclk, id,
+					 LPAIF_DMACTL_DYNCLK_OFF);
+			if (ret) {
+				dev_err(soc_runtime->dev,
+					"error writing to rdmactl reg: %d\n", ret);
+				return ret;
+			}
+
+			reg_irqen = LPASS_HDMITX_APP_IRQEN_REG(v);
+			val_mask = (LPAIF_IRQ_ALL(ch) |
+					LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(ch) |
+					LPAIF_IRQ_HDMI_METADONE |
+					LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(ch));
+			val_irqen = 0;
+			break;
+		case MI2S_PRIMARY:
+		case MI2S_SECONDARY:
+			reg_irqen = LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
+			val_mask = LPAIF_IRQ_ALL(ch);
+			val_irqen = 0;
+			break;
+		default:
+			dev_err(soc_runtime->dev, "%s: invalid %d interface\n", __func__, dai_id);
+			return -EINVAL;
+		}
 
 		ret = regmap_update_bits(drvdata->lpaif_map,
-				LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST),
-				LPAIF_IRQ_ALL(ch), 0);
+				reg_irqen,
+				val_mask, val_irqen);
 		if (ret) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqen reg: %d\n", ret);
@@ -489,14 +625,32 @@ static irqreturn_t lpass_dma_interrupt_handler(
 			int chan, u32 interrupts)
 {
 	struct snd_soc_pcm_runtime *soc_runtime = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_variant *v = drvdata->variant;
 	irqreturn_t ret = IRQ_NONE;
 	int rv;
+	unsigned int reg = 0, val = 0;
+	unsigned int dai_id = cpu_dai->driver->id;
 
 	if (interrupts & LPAIF_IRQ_PER(chan)) {
-		rv = regmap_write(drvdata->lpaif_map,
-				LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST),
-				LPAIF_IRQ_PER(chan));
+		switch (dai_id) {
+		case HDMI:
+			reg = LPASS_HDMITX_APP_IRQCLEAR_REG(v);
+			val = (LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(chan) |
+			LPAIF_IRQ_HDMI_METADONE |
+			LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(chan));
+			break;
+		case MI2S_PRIMARY:
+		case MI2S_SECONDARY:
+			reg = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
+			val = 0;
+			break;
+		default:
+			dev_err(soc_runtime->dev, "%s: invalid  %d interface\n", __func__, dai_id);
+			return -EINVAL;
+		}
+		rv = regmap_write(drvdata->lpaif_map, reg,
+				LPAIF_IRQ_PER(chan) | val);
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);
@@ -507,9 +661,8 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	}
 
 	if (interrupts & LPAIF_IRQ_XRUN(chan)) {
-		rv = regmap_write(drvdata->lpaif_map,
-				LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST),
-				LPAIF_IRQ_XRUN(chan));
+		rv = regmap_write(drvdata->lpaif_map, reg,
+				LPAIF_IRQ_XRUN(chan) | val);
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);
@@ -521,9 +674,8 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	}
 
 	if (interrupts & LPAIF_IRQ_ERR(chan)) {
-		rv = regmap_write(drvdata->lpaif_map,
-				LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST),
-				LPAIF_IRQ_ERR(chan));
+		rv = regmap_write(drvdata->lpaif_map, reg,
+				LPAIF_IRQ_ERR(chan) | val);
 		if (rv) {
 			dev_err(soc_runtime->dev,
 				"error writing to irqclear reg: %d\n", rv);
@@ -534,6 +686,16 @@ static irqreturn_t lpass_dma_interrupt_handler(
 		ret = IRQ_HANDLED;
 	}
 
+	if (interrupts & val) {
+		rv = regmap_write(drvdata->lpaif_map, reg, val);
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
 
@@ -543,9 +705,11 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
 	struct lpass_variant *v = drvdata->variant;
 	unsigned int irqs;
 	int rv, chan;
+	unsigned int val;
+	unsigned int dai_id = v->dai_driver->id;
 
 	rv = regmap_read(drvdata->lpaif_map,
-			LPAIF_IRQSTAT_REG(v, LPAIF_IRQ_PORT_HOST), &irqs);
+			IRQ_STAT(v, LPAIF_IRQ_PORT_HOST), &irqs);
 	if (rv) {
 		pr_err("error reading from irqstat reg: %d\n", rv);
 		return IRQ_NONE;
@@ -553,7 +717,22 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
 
 	/* Handle per channel interrupts */
 	for (chan = 0; chan < LPASS_MAX_DMA_CHANNELS; chan++) {
-		if (irqs & LPAIF_IRQ_ALL(chan) && drvdata->substream[chan]) {
+		switch (dai_id) {
+		case HDMI:
+			val = LPAIF_IRQ_HDMI_REQ_ON_PRELOAD(chan) |
+				LPAIF_IRQ_HDMI_METADONE |
+				LPAIF_IRQ_HDMI_SDEEP_AUD_DIS(chan);
+			break;
+		case MI2S_PRIMARY:
+		case MI2S_SECONDARY:
+			val = 0;
+			break;
+		default:
+			pr_err("%s: invalid  %d interface\n", __func__, dai_id);
+			return -EINVAL;
+		}
+		if (irqs & (LPAIF_IRQ_ALL(chan) | val)
+			&& drvdata->substream[chan]) {
 			rv = lpass_dma_interrupt_handler(
 						drvdata->substream[chan],
 						drvdata, chan, irqs);
@@ -644,15 +823,14 @@ int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 
 	/* ensure audio hardware is disabled */
 	ret = regmap_write(drvdata->lpaif_map,
-			LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST), 0);
+			IRQ_EN(v, LPAIF_IRQ_PORT_HOST), 0);
 	if (ret) {
 		dev_err(&pdev->dev, "error writing to irqen reg: %d\n", ret);
 		return ret;
 	}
 
 	ret = devm_request_irq(&pdev->dev, drvdata->lpaif_irq,
-			lpass_platform_lpaif_irq, IRQF_TRIGGER_RISING,
-			"lpass-irq-lpaif", drvdata);
+		lpass_platform_lpaif_irq, 0, pdev->name, drvdata);
 	if (ret) {
 		dev_err(&pdev->dev, "irq request failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 51c9991..3c2a64a 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -12,10 +12,14 @@
 #include <linux/compiler.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <dt-bindings/sound/sc7180-lpass.h>
 
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
 #define LPASS_MAX_MI2S_PORTS			(8)
 #define LPASS_MAX_DMA_CHANNELS			(8)
+#define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
+
+
 
 struct lpaif_i2sctl {
 	struct regmap_field *loopback;
@@ -32,6 +36,9 @@ struct lpaif_i2sctl {
 
 struct lpaif_dmactl {
 	struct regmap_field *bursten;
+	struct regmap_field *burst8;
+	struct regmap_field *burst16;
+	struct regmap_field *dynburst;
 	struct regmap_field *wpscnt;
 	struct regmap_field *intf;
 	struct regmap_field *fifowm;
@@ -81,6 +88,17 @@ struct lpass_data {
 	struct lpaif_i2sctl *i2sctl;
 	struct lpaif_dmactl *rd_dmactl;
 	struct lpaif_dmactl *wr_dmactl;
+
+	/* Regmap fields of HDMI_CTRL registers*/
+	struct lpass_hdmi_tx_ctl *tx_ctl;
+	struct lpass_hdmitx_legacy *legacy;
+	struct lpass_vbit_ctrl *vbit_ctl;
+	struct lpass_hdmi_tx_ch_msb *ch_msb[LPASS_MAX_HDMI_DMA_CHANNELS];
+	struct lpass_hdmi_tx_ch_lsb *ch_lsb[LPASS_MAX_HDMI_DMA_CHANNELS];
+	struct lpass_hdmi_tx_parity *tx_parity;
+	struct lpass_hdmitx_dmactl *hdmi_tx_dmactl[LPASS_MAX_HDMI_DMA_CHANNELS];
+	struct lpass_dp_metadata_ctl *meta_ctl;
+	struct lpass_sstream_ctl *sstream_ctl;
 };
 
 /* Vairant data per each SOC */
@@ -98,6 +116,19 @@ struct lpass_variant {
 	u32	wrdma_reg_stride;
 	u32	wrdma_channels;
 
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
 	/* I2SCTL Register fields */
 	struct reg_field loopback;
 	struct reg_field spken;
@@ -111,6 +142,9 @@ struct lpass_variant {
 
 	/* RD_DMA Register fields */
 	struct reg_field rdma_bursten;
+	struct reg_field rdma_burst8;
+	struct reg_field rdma_burst16;
+	struct reg_field rdma_dynburst;
 	struct reg_field rdma_wpscnt;
 	struct reg_field rdma_intf;
 	struct reg_field rdma_fifowm;
@@ -125,6 +159,52 @@ struct lpass_variant {
 	struct reg_field wrdma_enable;
 	struct reg_field wrdma_dyncclk;
 
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
 	/**
 	 * on SOCs like APQ8016 the channel control bits start
 	 * at different offset to ipq806x
@@ -154,5 +234,7 @@ int asoc_qcom_lpass_cpu_platform_remove(struct platform_device *pdev);
 int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);
 int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
 extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
-
+extern const struct snd_soc_dai_ops asoc_qcom_lpass_hdmi_dai_ops;
+struct regmap_config lpass_hdmi_regmap_config;
+extern int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map);
 #endif /* __LPASS_H__ */
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

