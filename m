Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92BE45ED78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 13:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377130AbhKZMK7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 07:10:59 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:64793 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1377307AbhKZMI5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 07:08:57 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637928344; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bTPZjwnaQITfwjHTfDI+KdJNJ0Z/980dAJ591hm8yrQ=; b=hsZ0Cgs44P9Q3adtVdK6Tx7sFSYz8O/0HXUtiLqwRoZfIuV4IDrGU/5F43QIXP5Ls9mYV4NM
 0Wdiba5t8X05PdjPX4HSPhk/PbR+BHyZkh+IGOjqNKUMLx9K4k+bg2l+uYAjxUqm7eeyT7hA
 160J61lsWbu99Iv2j8EGpAkHmmM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 61a0cd981abc6f02d0f0a43d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 26 Nov 2021 12:05:44
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 21320C43617; Fri, 26 Nov 2021 12:05:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E352C4338F;
        Fri, 26 Nov 2021 12:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6E352C4338F
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
Subject: [PATCH v6 07/10] ASoC: qcom: Add regmap config support for codec dma driver
Date:   Fri, 26 Nov 2021 17:34:39 +0530
Message-Id: <1637928282-2819-8-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
References: <1637928282-2819-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update regmap configuration for supporting headset playback and
capture and DMIC capture using codec dma interface

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Co-developed-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
---
 sound/soc/qcom/lpass-cpu.c | 185 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 70feb9e..6403f7c 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -28,6 +28,8 @@
 #define LPASS_CPU_I2S_SD2_3_MASK	GENMASK(3, 2)
 #define LPASS_CPU_I2S_SD0_1_2_MASK	GENMASK(2, 0)
 #define LPASS_CPU_I2S_SD0_1_2_3_MASK	GENMASK(3, 0)
+#define LPASS_REG_READ 1
+#define LPASS_REG_WRITE 0
 
 /*
  * Channel maps for Quad channel playbacks on MI2S Secondary
@@ -798,6 +800,189 @@ static struct regmap_config lpass_hdmi_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static bool __lpass_rxtx_regmap_accessible(struct device *dev, unsigned int reg, bool rw)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	int i;
+
+	for (i = 0; i < v->rxtx_irq_ports; ++i) {
+		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (reg == LPAIF_RXTX_IRQEN_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+	}
+
+	for (i = 0; i < v->rxtx_rdma_channels; ++i) {
+		if (reg == LPAIF_CDC_RDMACTL_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (reg == LPAIF_CDC_RDMABASE_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (reg == LPAIF_CDC_RDMABUFF_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (rw == LPASS_REG_READ) {
+			if (reg == LPAIF_CDC_RDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
+				return true;
+		}
+		if (reg == LPAIF_CDC_RDMAPER_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (reg == LPAIF_CDC_RDMA_INTF_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+	}
+
+	for (i = 0; i < v->rxtx_wrdma_channels; ++i) {
+		if (reg == LPAIF_CDC_WRDMACTL_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+		if (reg == LPAIF_CDC_WRDMABASE_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+		if (reg == LPAIF_CDC_WRDMABUFF_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+		if (rw == LPASS_REG_READ) {
+			if (reg == LPAIF_CDC_WRDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
+				return true;
+		}
+		if (reg == LPAIF_CDC_WRDMAPER_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+		if (reg == LPAIF_CDC_WRDMA_INTF_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+	}
+	return false;
+}
+
+static bool lpass_rxtx_regmap_writeable(struct device *dev, unsigned int reg)
+{
+	return __lpass_rxtx_regmap_accessible(dev, reg, LPASS_REG_WRITE);
+}
+
+static bool lpass_rxtx_regmap_readable(struct device *dev, unsigned int reg)
+{
+	return __lpass_rxtx_regmap_accessible(dev, reg, LPASS_REG_READ);
+}
+
+static bool lpass_rxtx_regmap_volatile(struct device *dev, unsigned int reg)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	int i;
+
+	for (i = 0; i < v->rxtx_irq_ports; ++i) {
+		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+	}
+
+	for (i = 0; i < v->rxtx_rdma_channels; ++i)
+		if (reg == LPAIF_CDC_RDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+
+	for (i = 0; i < v->rxtx_wrdma_channels; ++i)
+		if (reg == LPAIF_CDC_WRDMACURR_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+
+	return false;
+}
+
+static bool __lpass_va_regmap_accessible(struct device *dev, unsigned int reg, bool rw)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	int i;
+
+	for (i = 0; i < v->va_irq_ports; ++i) {
+		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (reg == LPAIF_RXTX_IRQEN_REG(v, i, LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_VA_TX0))
+			return true;
+	}
+
+	for (i = 0; i < v->va_wrdma_channels; ++i) {
+		if (reg == LPAIF_CDC_WRDMACTL_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (reg == LPAIF_CDC_WRDMABASE_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (reg == LPAIF_CDC_WRDMABUFF_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (rw == LPASS_REG_READ) {
+			if (reg == LPAIF_CDC_WRDMACURR_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+				return true;
+		}
+		if (reg == LPAIF_CDC_WRDMAPER_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (reg == LPAIF_CDC_WRDMA_INTF_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+	}
+	return false;
+}
+
+static bool lpass_va_regmap_writeable(struct device *dev, unsigned int reg)
+{
+	return __lpass_va_regmap_accessible(dev, reg, LPASS_REG_WRITE);
+}
+
+static bool lpass_va_regmap_readable(struct device *dev, unsigned int reg)
+{
+	return __lpass_va_regmap_accessible(dev, reg, LPASS_REG_READ);
+}
+
+static bool lpass_va_regmap_volatile(struct device *dev, unsigned int reg)
+{
+	struct lpass_data *drvdata = dev_get_drvdata(dev);
+	struct lpass_variant *v = drvdata->variant;
+	int i;
+
+	for (i = 0; i < v->va_irq_ports; ++i) {
+		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i, LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i, LPASS_CDC_DMA_VA_TX0))
+			return true;
+	}
+
+	for (i = 0; i < v->va_wrdma_channels; ++i) {
+		if (reg == LPAIF_CDC_WRDMACURR_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+	}
+
+	return false;
+}
+
+static struct regmap_config lpass_rxtx_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.writeable_reg = lpass_rxtx_regmap_writeable,
+	.readable_reg = lpass_rxtx_regmap_readable,
+	.volatile_reg = lpass_rxtx_regmap_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
+static struct regmap_config lpass_va_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.writeable_reg = lpass_va_regmap_writeable,
+	.readable_reg = lpass_va_regmap_readable,
+	.volatile_reg = lpass_va_regmap_volatile,
+	.cache_type = REGCACHE_FLAT,
+};
+
 static unsigned int of_lpass_cpu_parse_sd_lines(struct device *dev,
 						struct device_node *node,
 						const char *name)
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

