Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A97287ED2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 00:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730686AbgJHWw5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 18:52:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728605AbgJHWw5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 18:52:57 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF55DC0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2020 15:52:56 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id w21so742544plq.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2020 15:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HcqrOYUaXP7xqOn/NCvrxZmfWKkHczVuHn5c3tWtj90=;
        b=Bbt7BHTQpUC509D9VqIW+84cqAfUbbUetNRXXmTbL/g+l8QvgAkOlL7EbFub/nmrmM
         uTAxHGvQhME9a7aFL1xgFO2S/b/Y3k0wp+TenPAvNHvyHD03gBOkoVSuLKt8nvF5N7/a
         6t4FaCCKq6QI1NAXULkYXP8VX78WE1IsCvtqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HcqrOYUaXP7xqOn/NCvrxZmfWKkHczVuHn5c3tWtj90=;
        b=CWHaIj7J3b1ws886IZi0jVIusZq1rVSpt700AK7lPN3lWRE3D4PTfDhIC4TB2lX444
         4w3aSqPeNBM4NujgAcWHFc7kKjhEGKucb9tzBXDJA3OgoBsgzdugMl27JF4AZ0aGBHdB
         TFW8keCS5kFaTUVQ7FGTUQqd5+ceni+wMQKek7SZKjqlZqMHJlrDScrWkM33Tjs/P2Mn
         +//G+gTniTMKR/47qCTQMx1XRaa8uxwddGQuskdGfLMAmtQIYpFeB1Yx69VqwOqFLrBW
         GfHi6k+RGks2HfekuQhp9A5rTmdl+HMq9ECvFgJl5XWdzg9byk26Bul2ao82HxlYMBO6
         34Dg==
X-Gm-Message-State: AOAM5305iLFQNxkXoVD0r9JeBgPEd6JN8fqqtlRK0W0iicTOwYzAvJoI
        ltZ9a84qKEWUPWoE99EKyqucAg==
X-Google-Smtp-Source: ABdhPJyXF/5NsHMNTh0qCN74yGdZp3X5pFGM+vRbQ2c2GzcDpoXUjRfqQN55djiYs6v965D6j7vQsg==
X-Received: by 2002:a17:902:6545:b029:d3:d1fc:ff28 with SMTP id d5-20020a1709026545b02900d3d1fcff28mr9585066pln.34.1602197576452;
        Thu, 08 Oct 2020 15:52:56 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id jx17sm8386369pjb.10.2020.10.08.15.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 15:52:55 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-i2c@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Mukesh Kumar Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] soc: qcom: geni: More properly switch to DMA mode
Date:   Thu,  8 Oct 2020 15:52:33 -0700
Message-Id: <20201008155154.1.Ifdb1b69fa3367b81118e16e9e4e63299980ca798@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <20201008225235.2035820-1-dianders@chromium.org>
References: <20201008225235.2035820-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On geni-i2c transfers using DMA, it was seen that if you program the
command (I2C_READ) before calling geni_se_rx_dma_prep() that it could
cause interrupts to fire.  If we get unlucky, these interrupts can
just keep firing (and not be handled) blocking further progress and
hanging the system.

In commit 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA transfer race")
we avoided that by making sure we didn't program the command until
after geni_se_rx_dma_prep() was called.  While that avoided the
problems, it also turns out to be invalid.  At least in the TX case we
started seeing sporadic corrupted transfers.  This is easily seen by
adding an msleep() between the DMA prep and the writing of the
command, which makes the problem worse.  That means we need to revert
that commit and find another way to fix the bogus IRQs.

Specifically, after reverting commit 02b9aec59243 ("i2c:
i2c-qcom-geni: Fix DMA transfer race"), I put some traces in.  I found
that the when the interrupts were firing like crazy:
- "m_stat" had bits for M_RX_IRQ_EN, M_RX_FIFO_WATERMARK_EN set.
- "dma" was set.

Further debugging showed that I could make the problem happen more
reliably by adding an "msleep(1)" any time after geni_se_setup_m_cmd()
ran up until geni_se_rx_dma_prep() programmed the length.

A rather simple fix is to change geni_se_select_dma_mode() so it's a
true inverse of geni_se_select_fifo_mode() and disables all the FIFO
related interrupts.  Now the problematic interrupts can't fire and we
can program things in the correct order without worrying.

As part of this, let's also change the writel_relaxed() in the prepare
function to a writel() so that our DMA is guaranteed to be prepared
now that we can't rely on geni_se_setup_m_cmd()'s writel().

NOTE: the only current user of GENI_SE_DMA in mainline is i2c.

Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
Fixes: 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA transfer race")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/soc/qcom/qcom-geni-se.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index d0e4f520cff8..751a49f6534f 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -289,10 +289,23 @@ static void geni_se_select_fifo_mode(struct geni_se *se)
 
 static void geni_se_select_dma_mode(struct geni_se *se)
 {
+	u32 proto = geni_se_read_proto(se);
 	u32 val;
 
 	geni_se_irq_clear(se);
 
+	val = readl_relaxed(se->base + SE_GENI_M_IRQ_EN);
+	if (proto != GENI_SE_UART) {
+		val &= ~(M_CMD_DONE_EN | M_TX_FIFO_WATERMARK_EN);
+		val &= ~(M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
+	}
+	writel_relaxed(val, se->base + SE_GENI_M_IRQ_EN);
+
+	val = readl_relaxed(se->base + SE_GENI_S_IRQ_EN);
+	if (proto != GENI_SE_UART)
+		val &= ~S_CMD_DONE_EN;
+	writel_relaxed(val, se->base + SE_GENI_S_IRQ_EN);
+
 	val = readl_relaxed(se->base + SE_GENI_DMA_MODE_EN);
 	val |= GENI_DMA_MODE_EN;
 	writel_relaxed(val, se->base + SE_GENI_DMA_MODE_EN);
@@ -651,7 +664,7 @@ int geni_se_tx_dma_prep(struct geni_se *se, void *buf, size_t len,
 	writel_relaxed(lower_32_bits(*iova), se->base + SE_DMA_TX_PTR_L);
 	writel_relaxed(upper_32_bits(*iova), se->base + SE_DMA_TX_PTR_H);
 	writel_relaxed(GENI_SE_DMA_EOT_BUF, se->base + SE_DMA_TX_ATTR);
-	writel_relaxed(len, se->base + SE_DMA_TX_LEN);
+	writel(len, se->base + SE_DMA_TX_LEN);
 	return 0;
 }
 EXPORT_SYMBOL(geni_se_tx_dma_prep);
@@ -688,7 +701,7 @@ int geni_se_rx_dma_prep(struct geni_se *se, void *buf, size_t len,
 	writel_relaxed(upper_32_bits(*iova), se->base + SE_DMA_RX_PTR_H);
 	/* RX does not have EOT buffer type bit. So just reset RX_ATTR */
 	writel_relaxed(0, se->base + SE_DMA_RX_ATTR);
-	writel_relaxed(len, se->base + SE_DMA_RX_LEN);
+	writel(len, se->base + SE_DMA_RX_LEN);
 	return 0;
 }
 EXPORT_SYMBOL(geni_se_rx_dma_prep);
-- 
2.28.0.1011.ga647a8990f-goog

