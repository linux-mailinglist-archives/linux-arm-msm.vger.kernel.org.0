Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFBBD4B53EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Feb 2022 16:00:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345241AbiBNO7c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Feb 2022 09:59:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355520AbiBNO7a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Feb 2022 09:59:30 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BC6B849;
        Mon, 14 Feb 2022 06:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1644850763; x=1676386763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=ngCYcUx+P6Dtxjl7rqG1A3PsNFvM/gX6DS/1nmW25EY=;
  b=GfIqkuWpWCzh8cMHIHJ73jgDImYqg9+F8YPFtgRSyvN2v9lFIEeVT4sh
   lWQG+533qdb0Y4LxFfqE1WXddY91iYzmIsfULkrZdrmQUWuD5Zye/B7Uq
   CwxbAjAUzjPzF7X3w+V2dUvFato+pWwcvTPEUPPXoCz/IHRKATYuoxq/k
   Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 14 Feb 2022 06:59:22 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 06:59:22 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 14 Feb 2022 06:59:21 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Mon, 14 Feb 2022 06:59:16 -0800
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
Subject: [RESEND v13 06/10] ASoC: qcom: Add regmap config support for codec dma driver
Date:   Mon, 14 Feb 2022 20:28:24 +0530
Message-ID: <1644850708-11099-7-git-send-email-quic_srivasam@quicinc.com>
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

Update regmap configuration for supporting headset playback and
capture and DMIC capture using codec dma interface

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-cpu.c | 185 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 185 insertions(+)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 3bd9eb3..4fb9669 100644
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
+		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i))
+			return true;
+		if (reg == LPAIF_RXTX_IRQEN_REG(v, i))
+			return true;
+		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i))
+			return true;
+	}
+
+	for (i = 0; i < v->rxtx_rdma_channels; ++i) {
+		if (reg == LPAIF_CDC_RXTX_RDMACTL_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (reg == LPAIF_CDC_RXTX_RDMABASE_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (reg == LPAIF_CDC_RXTX_RDMABUFF_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (rw == LPASS_REG_READ) {
+			if (reg == LPAIF_CDC_RXTX_RDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
+				return true;
+		}
+		if (reg == LPAIF_CDC_RXTX_RDMAPER_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+		if (reg == LPAIF_CDC_RXTX_RDMA_INTF_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+	}
+
+	for (i = 0; i < v->rxtx_wrdma_channels; ++i) {
+		if (reg == LPAIF_CDC_RXTX_WRDMACTL_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+		if (reg == LPAIF_CDC_RXTX_WRDMABASE_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+		if (reg == LPAIF_CDC_RXTX_WRDMABUFF_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+		if (rw == LPASS_REG_READ) {
+			if (reg == LPAIF_CDC_RXTX_WRDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
+				return true;
+		}
+		if (reg == LPAIF_CDC_RXTX_WRDMAPER_REG(v, i + v->rxtx_wrdma_channel_start,
+							LPASS_CDC_DMA_TX3))
+			return true;
+		if (reg == LPAIF_CDC_RXTX_WRDMA_INTF_REG(v, i + v->rxtx_wrdma_channel_start,
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
+		if (reg == LPAIF_RXTX_IRQCLEAR_REG(v, i))
+			return true;
+		if (reg == LPAIF_RXTX_IRQSTAT_REG(v, i))
+			return true;
+	}
+
+	for (i = 0; i < v->rxtx_rdma_channels; ++i)
+		if (reg == LPAIF_CDC_RXTX_RDMACURR_REG(v, i, LPASS_CDC_DMA_RX0))
+			return true;
+
+	for (i = 0; i < v->rxtx_wrdma_channels; ++i)
+		if (reg == LPAIF_CDC_RXTX_WRDMACURR_REG(v, i + v->rxtx_wrdma_channel_start,
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
+		if (reg == LPAIF_VA_IRQCLEAR_REG(v, i))
+			return true;
+		if (reg == LPAIF_VA_IRQEN_REG(v, i))
+			return true;
+		if (reg == LPAIF_VA_IRQSTAT_REG(v, i))
+			return true;
+	}
+
+	for (i = 0; i < v->va_wrdma_channels; ++i) {
+		if (reg == LPAIF_CDC_VA_WRDMACTL_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (reg == LPAIF_CDC_VA_WRDMABASE_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (reg == LPAIF_CDC_VA_WRDMABUFF_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (rw == LPASS_REG_READ) {
+			if (reg == LPAIF_CDC_VA_WRDMACURR_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+				return true;
+		}
+		if (reg == LPAIF_CDC_VA_WRDMAPER_REG(v, i + v->va_wrdma_channel_start,
+							LPASS_CDC_DMA_VA_TX0))
+			return true;
+		if (reg == LPAIF_CDC_VA_WRDMA_INTF_REG(v, i + v->va_wrdma_channel_start,
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
+		if (reg == LPAIF_VA_IRQCLEAR_REG(v, i))
+			return true;
+		if (reg == LPAIF_VA_IRQSTAT_REG(v, i))
+			return true;
+	}
+
+	for (i = 0; i < v->va_wrdma_channels; ++i) {
+		if (reg == LPAIF_CDC_VA_WRDMACURR_REG(v, i + v->va_wrdma_channel_start,
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
2.7.4

