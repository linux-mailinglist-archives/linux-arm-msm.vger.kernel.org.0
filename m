Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1599E4C170E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Feb 2022 16:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242200AbiBWPk3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Feb 2022 10:40:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242229AbiBWPkY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Feb 2022 10:40:24 -0500
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42411BDE5D;
        Wed, 23 Feb 2022 07:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645630794; x=1677166794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=QQ/2viS8Q9L2cIJS//+xhXEH9b7Enj4QgQhXozzmraA=;
  b=vBUbees0gjAVrV09kjxOrEhPlWi7xw8hulEQ67IkHjBGuwxgigQ9jTOy
   NfpaYkYcQH6ujw3ZMqv9W7zBH+NIo6dZxFIQGV3T8qYdS+GshWRA+XZA3
   3QLyRSrVcqa3vucHVVs1oZ/VXsJEW+QNskM5DlvSbfYPlKKD2xpH7QM+t
   4=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Feb 2022 07:39:54 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:39:53 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 23 Feb 2022 07:39:53 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Wed, 23 Feb 2022 07:39:47 -0800
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
Subject: [PATCH v15 05/10] ASoC: qcom: Add register definition for codec rddma and wrdma
Date:   Wed, 23 Feb 2022 21:09:00 +0530
Message-ID: <1645630745-25051-6-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645630745-25051-1-git-send-email-quic_srivasam@quicinc.com>
References: <1645630745-25051-1-git-send-email-quic_srivasam@quicinc.com>
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

Add register definitions for codec read dma and write dma
lpass interface.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/lpass-lpaif-reg.h | 127 +++++++++++++++++++++++++++++++++++++--
 sound/soc/qcom/lpass.h           |  21 +++++++
 2 files changed, 142 insertions(+), 6 deletions(-)

diff --git a/sound/soc/qcom/lpass-lpaif-reg.h b/sound/soc/qcom/lpass-lpaif-reg.h
index 2eb03ad..6d9d9d1 100644
--- a/sound/soc/qcom/lpass-lpaif-reg.h
+++ b/sound/soc/qcom/lpass-lpaif-reg.h
@@ -74,6 +74,21 @@
 #define LPAIF_IRQSTAT_REG(v, port)	LPAIF_IRQ_REG_ADDR(v, 0x4, (port))
 #define LPAIF_IRQCLEAR_REG(v, port)	LPAIF_IRQ_REG_ADDR(v, 0xC, (port))
 
+/* LPAIF RXTX IRQ */
+#define LPAIF_RXTX_IRQ_REG_ADDR(v, addr, port) \
+		(v->rxtx_irq_reg_base + (addr) + v->rxtx_irq_reg_stride * (port))
+
+#define LPAIF_RXTX_IRQEN_REG(v, port) LPAIF_RXTX_IRQ_REG_ADDR(v, 0x0, port)
+#define LPAIF_RXTX_IRQSTAT_REG(v, port) LPAIF_RXTX_IRQ_REG_ADDR(v, 0x4, port)
+#define LPAIF_RXTX_IRQCLEAR_REG(v, port) LPAIF_RXTX_IRQ_REG_ADDR(v, 0xC, port)
+
+/* LPAIF VA IRQ */
+#define LPAIF_VA_IRQ_REG_ADDR(v, addr, port) \
+		(v->va_irq_reg_base + (addr) + v->va_irq_reg_stride * (port))
+
+#define LPAIF_VA_IRQEN_REG(v, port) LPAIF_VA_IRQ_REG_ADDR(v, 0x0, port)
+#define LPAIF_VA_IRQSTAT_REG(v, port) LPAIF_VA_IRQ_REG_ADDR(v, 0x4, port)
+#define LPAIF_VA_IRQCLEAR_REG(v, port) LPAIF_VA_IRQ_REG_ADDR(v, 0xC, port)
 
 #define LPASS_HDMITX_APP_IRQ_REG_ADDR(v, addr)  \
 	((v->hdmi_irq_reg_base) + (addr))
@@ -139,12 +154,112 @@
 		(LPAIF_INTFDMA_REG(v, chan, reg, dai_id)) : \
 		LPAIF_WRDMA##reg##_REG(v, chan))
 
-#define LPAIF_DMACTL_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, CTL, dai_id)
-#define LPAIF_DMABASE_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, BASE, dai_id)
-#define	LPAIF_DMABUFF_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, BUFF, dai_id)
-#define LPAIF_DMACURR_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, CURR, dai_id)
-#define	LPAIF_DMAPER_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, PER, dai_id)
-#define	LPAIF_DMAPERCNT_REG(v, chan, dir, dai_id) __LPAIF_DMA_REG(v, chan, dir, PERCNT, dai_id)
+#define LPAIF_DMACTL_REG(v, chan, dir, dai_id) \
+	(is_cdc_dma_port(dai_id) ? \
+	__LPAIF_CDC_DMA_REG(v, chan, dir, CTL, dai_id) : \
+	__LPAIF_DMA_REG(v, chan, dir, CTL, dai_id))
+#define LPAIF_DMABASE_REG(v, chan, dir, dai_id) \
+	(is_cdc_dma_port(dai_id) ? \
+	__LPAIF_CDC_DMA_REG(v, chan, dir, BASE, dai_id) : \
+	__LPAIF_DMA_REG(v, chan, dir, BASE, dai_id))
+#define LPAIF_DMABUFF_REG(v, chan, dir, dai_id) \
+	(is_cdc_dma_port(dai_id) ? \
+	__LPAIF_CDC_DMA_REG(v, chan, dir, BUFF, dai_id) : \
+	__LPAIF_DMA_REG(v, chan, dir, BUFF, dai_id))
+#define LPAIF_DMACURR_REG(v, chan, dir, dai_id) \
+	(is_cdc_dma_port(dai_id) ? \
+	__LPAIF_CDC_DMA_REG(v, chan, dir, CURR, dai_id) : \
+	__LPAIF_DMA_REG(v, chan, dir, CURR, dai_id))
+#define LPAIF_DMAPER_REG(v, chan, dir, dai_id)  \
+	(is_cdc_dma_port(dai_id) ? \
+	__LPAIF_CDC_DMA_REG(v, chan, dir, PER, dai_id) : \
+	__LPAIF_DMA_REG(v, chan, dir, PER, dai_id))
+#define LPAIF_DMAPERCNT_REG(v, chan, dir, dai_id) \
+	(is_cdc_dma_port(dai_id) ? \
+	__LPAIF_CDC_DMA_REG(v, chan, dir, PERCNT, dai_id) : \
+	__LPAIF_DMA_REG(v, chan, dir, PERCNT, dai_id))
+
+#define LPAIF_CDC_RDMA_REG_ADDR(v, addr, chan, dai_id) \
+	(is_rxtx_cdc_dma_port(dai_id) ? \
+	(v->rxtx_rdma_reg_base + (addr) + v->rxtx_rdma_reg_stride * (chan)) : \
+	(v->va_rdma_reg_base + (addr) + v->va_rdma_reg_stride * (chan)))
+
+#define LPAIF_CDC_RXTX_RDMACTL_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x00, (chan), dai_id)
+#define LPAIF_CDC_RXTX_RDMABASE_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x04, (chan), dai_id)
+#define LPAIF_CDC_RXTX_RDMABUFF_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x08, (chan), dai_id)
+#define LPAIF_CDC_RXTX_RDMACURR_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
+#define LPAIF_CDC_RXTX_RDMAPER_REG(v, chan, dai_id) \
+		LPAIF_CDC_RDMA_REG_ADDR(v, 0x10, (chan), dai_id)
+#define LPAIF_CDC_RXTX_RDMA_INTF_REG(v, chan, dai_id) \
+	LPAIF_CDC_RDMA_REG_ADDR(v, 0x50, (chan), dai_id)
+
+#define LPAIF_CDC_VA_RDMACTL_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x00, (chan), dai_id)
+#define LPAIF_CDC_VA_RDMABASE_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x04, (chan), dai_id)
+#define LPAIF_CDC_VA_RDMABUFF_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x08, (chan), dai_id)
+#define LPAIF_CDC_VA_RDMACURR_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
+#define LPAIF_CDC_VA_RDMAPER_REG(v, chan, dai_id) LPAIF_CDC_RDMA_REG_ADDR(v, 0x10, (chan), dai_id)
+#define LPAIF_CDC_VA_RDMA_INTF_REG(v, chan, dai_id) \
+	LPAIF_CDC_RDMA_REG_ADDR(v, 0x50, (chan), dai_id)
+
+#define LPAIF_CDC_WRDMA_REG_ADDR(v, addr, chan, dai_id) \
+	(is_rxtx_cdc_dma_port(dai_id) ? \
+	(v->rxtx_wrdma_reg_base + (addr) + \
+		v->rxtx_wrdma_reg_stride * (chan - v->rxtx_wrdma_channel_start)) : \
+	(v->va_wrdma_reg_base + (addr) + \
+		v->va_wrdma_reg_stride * (chan - v->va_wrdma_channel_start)))
+
+#define LPAIF_CDC_RXTX_WRDMACTL_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x00, (chan), dai_id)
+#define LPAIF_CDC_RXTX_WRDMABASE_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x04, (chan), dai_id)
+#define LPAIF_CDC_RXTX_WRDMABUFF_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x08, (chan), dai_id)
+#define LPAIF_CDC_RXTX_WRDMACURR_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
+#define LPAIF_CDC_RXTX_WRDMAPER_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x10, (chan), dai_id)
+#define LPAIF_CDC_RXTX_WRDMA_INTF_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x50, (chan), dai_id)
+
+#define LPAIF_CDC_VA_WRDMACTL_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x00, (chan), dai_id)
+#define LPAIF_CDC_VA_WRDMABASE_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x04, (chan), dai_id)
+#define LPAIF_CDC_VA_WRDMABUFF_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x08, (chan), dai_id)
+#define LPAIF_CDC_VA_WRDMACURR_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x0C, (chan), dai_id)
+#define LPAIF_CDC_VA_WRDMAPER_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x10, (chan), dai_id)
+#define LPAIF_CDC_VA_WRDMA_INTF_REG(v, chan, dai_id) \
+	LPAIF_CDC_WRDMA_REG_ADDR(v, 0x50, (chan), dai_id)
+
+#define __LPAIF_CDC_RDDMA_REG(v, chan, dir, reg, dai_id) \
+		(is_rxtx_cdc_dma_port(dai_id) ? LPAIF_CDC_RXTX_RDMA##reg##_REG(v, chan, dai_id) : \
+			LPAIF_CDC_VA_RDMA##reg##_REG(v, chan, dai_id))
+
+#define __LPAIF_CDC_WRDMA_REG(v, chan, dir, reg, dai_id) \
+		(is_rxtx_cdc_dma_port(dai_id) ? LPAIF_CDC_RXTX_WRDMA##reg##_REG(v, chan, dai_id) : \
+			LPAIF_CDC_VA_WRDMA##reg##_REG(v, chan, dai_id))
+
+#define __LPAIF_CDC_DMA_REG(v, chan, dir, reg, dai_id) \
+		((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
+			__LPAIF_CDC_RDDMA_REG(v, chan, dir, reg, dai_id) : \
+			__LPAIF_CDC_WRDMA_REG(v, chan, dir, reg, dai_id))
+
+#define LPAIF_CDC_INTF_REG(v, chan, dir, dai_id) \
+		((dir ==  SNDRV_PCM_STREAM_PLAYBACK) ? \
+		LPAIF_CDC_RDMA_INTF_REG(v, chan, dai_id) : \
+		LPAIF_CDC_WRDMA_INTF_REG(v, chan, dai_id))
+
+#define LPAIF_INTF_REG(v, chan, dir, dai_id) \
+		(is_cdc_dma_port(dai_id) ? \
+		LPAIF_CDC_INTF_REG(v, chan, dir, dai_id) : \
+		LPAIF_DMACTL_REG(v, chan, dir, dai_id))
 
 #define LPAIF_DMACTL_BURSTEN_SINGLE	0
 #define LPAIF_DMACTL_BURSTEN_INCR4	1
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index b3752a3..210a099 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -38,6 +38,27 @@
 			return -EINVAL;         \
 	} while (0)
 
+static inline bool is_cdc_dma_port(int dai_id)
+{
+	switch (dai_id) {
+	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
+	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
+	case LPASS_CDC_DMA_VA_TX0 ... LPASS_CDC_DMA_VA_TX8:
+		return true;
+	}
+	return false;
+}
+
+static inline bool is_rxtx_cdc_dma_port(int dai_id)
+{
+	switch (dai_id) {
+	case LPASS_CDC_DMA_RX0 ... LPASS_CDC_DMA_RX9:
+	case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX8:
+		return true;
+	}
+	return false;
+}
+
 struct lpaif_i2sctl {
 	struct regmap_field *loopback;
 	struct regmap_field *spken;
-- 
2.7.4

