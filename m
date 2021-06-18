Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7BD13ACD66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 16:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbhFROVL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 10:21:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:58750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234472AbhFROVJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 10:21:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB5C861222;
        Fri, 18 Jun 2021 14:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624025940;
        bh=6Us+RX3nl4iAlpEY6I+lqz2fIEguQp5Np4nXwZxMqZw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k8lqdYl7MvypBonkaG8UM1gOUkoU1UNs3JJ5Hfa37GsqZlHnv9JCLLd7nKnnwr6G3
         LZn/aUz5+2rmAmBH3MLtjzXSQtXyArQhLEYs6iCaYzXoTBqjDRSfHNaHr0eTHCT4RJ
         zUh79kIiR8F62Cbo8sQrPYIVH8p4YeEFVx2ghp/DB2+AKsfzXoGNGi5ototVKxPMRc
         YHLtJln4Z491PHpHWbV4S6wKwfv4ol5OWR3fWgIhuxEk7w4iyFX0Q4UuNeokXMnQb5
         FdAnfwZs3BFW7QRU0r7Hi8nTi2j6ZeG3Nl93VtCirvQ3+68w6FHqZcNcZj3d1xy43A
         kYIMxu63ft8IA==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] soc: qcom: geni: Add support for gpi dma
Date:   Fri, 18 Jun 2021 19:48:39 +0530
Message-Id: <20210618141839.3777270-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210618141839.3777270-1-vkoul@kernel.org>
References: <20210618141839.3777270-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GPI DMA is one of the DMA modes supported on geni, this adds support to
enable that mode

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/soc/qcom/qcom-geni-se.c | 32 +++++++++++++++++++++++++++++++-
 include/linux/qcom-geni-se.h    |  5 +++--
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 08d645b90ed3..40a0a1f88070 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -307,6 +307,32 @@ static void geni_se_select_dma_mode(struct geni_se *se)
 		writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
 }
 
+static void geni_se_select_gpi_mode(struct geni_se *se)
+{
+	unsigned int gpi_event_en;
+	unsigned int m_irq_en;
+	unsigned int s_irq_en;
+
+	geni_se_irq_clear(se);
+	writel(0, se->base + SE_IRQ_EN);
+
+	s_irq_en = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
+	s_irq_en &= ~S_CMD_DONE_EN;
+	writel(s_irq_en, se->base + SE_GENI_S_IRQ_EN);
+
+	m_irq_en = readl(se->base + SE_GENI_M_IRQ_EN);
+	m_irq_en &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN |
+		      M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
+	writel(m_irq_en, se->base + SE_GENI_M_IRQ_EN);
+
+	writel(GENI_DMA_MODE_EN, se->base + SE_GENI_DMA_MODE_EN);
+
+	gpi_event_en = readl(se->base + SE_GSI_EVENT_EN);
+	gpi_event_en |= (DMA_RX_EVENT_EN | DMA_TX_EVENT_EN |
+			 GENI_M_EVENT_EN | GENI_S_EVENT_EN);
+	writel(gpi_event_en, se->base + SE_GSI_EVENT_EN);
+}
+
 /**
  * geni_se_select_mode() - Select the serial engine transfer mode
  * @se:		Pointer to the concerned serial engine.
@@ -314,7 +340,8 @@ static void geni_se_select_dma_mode(struct geni_se *se)
  */
 void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
 {
-	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA);
+	WARN_ON(mode != GENI_SE_FIFO && mode != GENI_SE_DMA &&
+		mode != GENI_GPI_DMA);
 
 	switch (mode) {
 	case GENI_SE_FIFO:
@@ -323,6 +350,9 @@ void geni_se_select_mode(struct geni_se *se, enum geni_se_xfer_mode mode)
 	case GENI_SE_DMA:
 		geni_se_select_dma_mode(se);
 		break;
+	case GENI_GPI_DMA:
+		geni_se_select_gpi_mode(se);
+		break;
 	case GENI_SE_INVALID:
 	default:
 		break;
diff --git a/include/linux/qcom-geni-se.h b/include/linux/qcom-geni-se.h
index 5fda675c5cfe..336b682392b1 100644
--- a/include/linux/qcom-geni-se.h
+++ b/include/linux/qcom-geni-se.h
@@ -11,8 +11,9 @@
 /* Transfer mode supported by GENI Serial Engines */
 enum geni_se_xfer_mode {
 	GENI_SE_INVALID,
-	GENI_SE_FIFO,
-	GENI_SE_DMA,
+	GENI_SE_FIFO, /* FIFO mode */
+	GENI_GPI_DMA, /* GSI aka GPI DMA mode */
+	GENI_SE_DMA,  /* SE DMA mode */
 };
 
 /* Protocols supported by GENI Serial Engines */
-- 
2.31.1

