Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F2E23B672
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 10:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729809AbgHDIJF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Aug 2020 04:09:05 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:22741 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729776AbgHDIJE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Aug 2020 04:09:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596528543; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=l3x3tlaoTx6ops3BcE1LpsDCo+WNUwz80fZ4ZeEToec=; b=w7SOzNIu8J/ldtAGVJq3doh1lmKFhN2AF88yWhPZoi+7y2JLy77foaNUYfjfCQWfFi8PHhCd
 S/rcCHsXCe3Y87OGZpz77sf6NMK5r1V+iefBsWqdH3LUMwnOeSj53w9MhLFFuA7epzhKbAch
 5G7fz0Bu1CMlTYVsyE9WgxePia0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5f29179b9fdcd87189b5bd82 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 08:08:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A2145C43453; Tue,  4 Aug 2020 08:08:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rohkumar-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rohitkr)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 56755C433CA;
        Tue,  4 Aug 2020 08:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 56755C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rohitkr@codeaurora.org
From:   Rohit kumar <rohitkr@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>
Subject: [PATCH v5 09/12] ASoC: qcom: lpass-sc7180: Add platform driver for lpass audio
Date:   Tue,  4 Aug 2020 13:37:30 +0530
Message-Id: <1596528453-11437-10-git-send-email-rohitkr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
References: <1596528453-11437-1-git-send-email-rohitkr@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ajit Pandey <ajitp@codeaurora.org>

Add platform driver for configuring sc7180 lpass core I2S and
DMA configuration to support playback & capture to external codecs
connected over primary & secondary MI2S interfaces.

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig        |   5 +
 sound/soc/qcom/Makefile       |   2 +
 sound/soc/qcom/lpass-sc7180.c | 216 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 223 insertions(+)
 create mode 100644 sound/soc/qcom/lpass-sc7180.c

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 5d6b246..b47d2bdd 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -24,6 +24,11 @@ config SND_SOC_LPASS_APQ8016
 	select SND_SOC_LPASS_CPU
 	select SND_SOC_LPASS_PLATFORM
 
+config SND_SOC_LPASS_SC7180
+	tristate
+	select SND_SOC_LPASS_CPU
+	select SND_SOC_LPASS_PLATFORM
+
 config SND_SOC_STORM
 	tristate "ASoC I2S support for Storm boards"
 	depends on SND_SOC_QCOM
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 41b2c7a..7972c94 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -4,11 +4,13 @@ snd-soc-lpass-cpu-objs := lpass-cpu.o
 snd-soc-lpass-platform-objs := lpass-platform.o
 snd-soc-lpass-ipq806x-objs := lpass-ipq806x.o
 snd-soc-lpass-apq8016-objs := lpass-apq8016.o
+snd-soc-lpass-sc7180-objs := lpass-sc7180.o
 
 obj-$(CONFIG_SND_SOC_LPASS_CPU) += snd-soc-lpass-cpu.o
 obj-$(CONFIG_SND_SOC_LPASS_PLATFORM) += snd-soc-lpass-platform.o
 obj-$(CONFIG_SND_SOC_LPASS_IPQ806X) += snd-soc-lpass-ipq806x.o
 obj-$(CONFIG_SND_SOC_LPASS_APQ8016) += snd-soc-lpass-apq8016.o
+obj-$(CONFIG_SND_SOC_LPASS_SC7180) += snd-soc-lpass-sc7180.o
 
 # Machine
 snd-soc-storm-objs := storm.o
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
new file mode 100644
index 00000000..b4c6a04
--- /dev/null
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -0,0 +1,216 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ *
+ * lpass-sc7180.c -- ALSA SoC platform-machine driver for QTi LPASS
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <dt-bindings/sound/sc7180-lpass.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+
+#include "lpass-lpaif-reg.h"
+#include "lpass.h"
+
+static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
+	[MI2S_PRIMARY] = {
+		.id = MI2S_PRIMARY,
+		.name = "Primary MI2S",
+		.playback = {
+			.stream_name = "Primary Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.capture = {
+			.stream_name = "Primary Capture",
+			.formats = SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
+		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
+	},
+
+	[MI2S_SECONDARY] = {
+		.id = MI2S_SECONDARY,
+		.name = "Secondary MI2S",
+		.playback = {
+			.stream_name = "Secondary Playback",
+			.formats	= SNDRV_PCM_FMTBIT_S16,
+			.rates = SNDRV_PCM_RATE_48000,
+			.rate_min	= 48000,
+			.rate_max	= 48000,
+			.channels_min	= 2,
+			.channels_max	= 2,
+		},
+		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
+		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
+	},
+};
+
+static int sc7180_lpass_alloc_dma_channel(struct lpass_data *drvdata,
+					   int direction)
+{
+	struct lpass_variant *v = drvdata->variant;
+	int chan = 0;
+
+	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		chan = find_first_zero_bit(&drvdata->dma_ch_bit_map,
+					v->rdma_channels);
+
+		if (chan >= v->rdma_channels)
+			return -EBUSY;
+	} else {
+		chan = find_next_zero_bit(&drvdata->dma_ch_bit_map,
+					v->wrdma_channel_start +
+					v->wrdma_channels,
+					v->wrdma_channel_start);
+
+		if (chan >=  v->wrdma_channel_start + v->wrdma_channels)
+			return -EBUSY;
+	}
+
+	set_bit(chan, &drvdata->dma_ch_bit_map);
+
+	return chan;
+}
+
+static int sc7180_lpass_free_dma_channel(struct lpass_data *drvdata, int chan)
+{
+	clear_bit(chan, &drvdata->dma_ch_bit_map);
+
+	return 0;
+}
+
+static int sc7180_lpass_init(struct platform_device *pdev)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+	struct lpass_variant *variant = drvdata->variant;
+	struct device *dev = &pdev->dev;
+	int ret, i;
+
+	drvdata->clks = devm_kcalloc(dev, variant->num_clks,
+				     sizeof(*drvdata->clks), GFP_KERNEL);
+	drvdata->num_clks = variant->num_clks;
+
+	for (i = 0; i < drvdata->num_clks; i++)
+		drvdata->clks[i].id = variant->clk_name[i];
+
+	ret = devm_clk_bulk_get(dev, drvdata->num_clks, drvdata->clks);
+	if (ret) {
+		dev_err(dev, "Failed to get clocks %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
+	if (ret) {
+		dev_err(dev, "sc7180 clk_enable failed\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int sc7180_lpass_exit(struct platform_device *pdev)
+{
+	struct lpass_data *drvdata = platform_get_drvdata(pdev);
+
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+
+	return 0;
+}
+
+static struct lpass_variant sc7180_data = {
+	.i2sctrl_reg_base	= 0x1000,
+	.i2sctrl_reg_stride	= 0x1000,
+	.i2s_ports		= 3,
+	.irq_reg_base		= 0x9000,
+	.irq_reg_stride		= 0x1000,
+	.irq_ports		= 3,
+	.rdma_reg_base		= 0xC000,
+	.rdma_reg_stride	= 0x1000,
+	.rdma_channels		= 5,
+	.dmactl_audif_start	= 1,
+	.wrdma_reg_base		= 0x18000,
+	.wrdma_reg_stride	= 0x1000,
+	.wrdma_channel_start	= 5,
+	.wrdma_channels		= 4,
+
+	.loopback		= REG_FIELD_ID(0x1000, 17, 17, 3, 0x1000),
+	.spken			= REG_FIELD_ID(0x1000, 16, 16, 3, 0x1000),
+	.spkmode		= REG_FIELD_ID(0x1000, 11, 15, 3, 0x1000),
+	.spkmono		= REG_FIELD_ID(0x1000, 10, 10, 3, 0x1000),
+	.micen			= REG_FIELD_ID(0x1000, 9, 9, 3, 0x1000),
+	.micmode		= REG_FIELD_ID(0x1000, 4, 8, 3, 0x1000),
+	.micmono		= REG_FIELD_ID(0x1000, 3, 3, 3, 0x1000),
+	.wssrc			= REG_FIELD_ID(0x1000, 2, 2, 3, 0x1000),
+	.bitwidth		= REG_FIELD_ID(0x1000, 0, 0, 3, 0x1000),
+
+	.rdma_dyncclk		= REG_FIELD_ID(0xC000, 21, 21, 5, 0x1000),
+	.rdma_bursten		= REG_FIELD_ID(0xC000, 20, 20, 5, 0x1000),
+	.rdma_wpscnt		= REG_FIELD_ID(0xC000, 16, 19, 5, 0x1000),
+	.rdma_intf		= REG_FIELD_ID(0xC000, 12, 15, 5, 0x1000),
+	.rdma_fifowm		= REG_FIELD_ID(0xC000, 1, 5, 5, 0x1000),
+	.rdma_enable		= REG_FIELD_ID(0xC000, 0, 0, 5, 0x1000),
+
+	.wrdma_dyncclk		= REG_FIELD_ID(0x18000, 22, 22, 4, 0x1000),
+	.wrdma_bursten		= REG_FIELD_ID(0x18000, 21, 21, 4, 0x1000),
+	.wrdma_wpscnt		= REG_FIELD_ID(0x18000, 17, 20, 4, 0x1000),
+	.wrdma_intf		= REG_FIELD_ID(0x18000, 12, 16, 4, 0x1000),
+	.wrdma_fifowm		= REG_FIELD_ID(0x18000, 1, 5, 4, 0x1000),
+	.wrdma_enable		= REG_FIELD_ID(0x18000, 0, 0, 4, 0x1000),
+
+	.clk_name		= (const char*[]) {
+				   "pcnoc-sway-clk",
+				   "audio-core",
+				   "pcnoc-mport-clk",
+				},
+	.num_clks		= 3,
+	.dai_driver		= sc7180_lpass_cpu_dai_driver,
+	.num_dai		= ARRAY_SIZE(sc7180_lpass_cpu_dai_driver),
+	.dai_osr_clk_names      = (const char *[]) {
+				   "mclk0",
+				   "null",
+				},
+	.dai_bit_clk_names      = (const char *[]) {
+				   "mi2s-bit-clk0",
+				   "mi2s-bit-clk1",
+				},
+	.init			= sc7180_lpass_init,
+	.exit			= sc7180_lpass_exit,
+	.alloc_dma_channel	= sc7180_lpass_alloc_dma_channel,
+	.free_dma_channel	= sc7180_lpass_free_dma_channel,
+};
+
+static const struct of_device_id sc7180_lpass_cpu_device_id[] = {
+	{.compatible = "qcom,sc7180-lpass-cpu", .data = &sc7180_data},
+	{}
+};
+
+static struct platform_driver sc7180_lpass_cpu_platform_driver = {
+	.driver = {
+		.name = "sc7180-lpass-cpu",
+		.of_match_table = of_match_ptr(sc7180_lpass_cpu_device_id),
+	},
+	.probe = asoc_qcom_lpass_cpu_platform_probe,
+	.remove = asoc_qcom_lpass_cpu_platform_probe,
+};
+
+module_platform_driver(sc7180_lpass_cpu_platform_driver);
+
+MODULE_DESCRIPTION("SC7180 LPASS CPU DRIVER");
+MODULE_LICENSE("GPL v2");
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

