Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610F7287ED9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Oct 2020 00:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730755AbgJHWxE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Oct 2020 18:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728605AbgJHWxA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Oct 2020 18:53:00 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF141C0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2020 15:52:58 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r10so5540569pgb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2020 15:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JqHlvYS/nUyuuUVkp5zanpXouWo0jl8ps/632AK5Tl4=;
        b=YOE0Wl3PeOp/Btq95AWsudLkZhaYipMAqAe17Y6oLaTjaqlL2QCzfBTTeD20EdMvoL
         fXLPpqXgsiF5aRQD8FwAuI82R+k5kZf/R8dPcPli2/VIZu9ZAlyK4df7MGZVev521chQ
         gdibFwzbcjksBBNG4J6EMOpv6+wiccx1P0PaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JqHlvYS/nUyuuUVkp5zanpXouWo0jl8ps/632AK5Tl4=;
        b=GkC2k0jUON2C/7kkx/m2yXQaSnzPLAdfSfThAhL0w/0sohMD6m24NgTVYECf+jBFtx
         5tmPQouqcp20Kke/1NP1xD+tBfKEWVTBEeuyVNqWl+/8CA9A+SiYSO0EkYp3u2FsCVJp
         TeJywDuoijg8DndCo/2yufR415VCt/WtlyzHaGPZMHraIB62WXu16HZrnWdNZq9XhrAO
         ++STuq7YAXVCjNwBLmne90KL3zq2lcMrc5r8VtCcsxLx4OsJHaEmnorsTwNrtIc96xc7
         fuuq7FRse9kQA17vDPgUKY4MTi5LpXiLczz4Bd0VTjf/wDbfQ9kK26Dvo6t/+SwzztPw
         Ozdw==
X-Gm-Message-State: AOAM531OehrsE9epyZPko5gUj9l8JiaNtYOiXbPIryRYhQl6OGTUT/KL
        2aZoIjYMFKwRZnR08sHpVVe4+A==
X-Google-Smtp-Source: ABdhPJyLMsvK9tWb74s1XR8v4qYe6UeK5+cQ51iDyu1MToPy/Tz9RvaCeozqlVgNRBBIKEMwQmzLFg==
X-Received: by 2002:a62:d10b:0:b029:152:56c0:df72 with SMTP id z11-20020a62d10b0000b029015256c0df72mr9933786pfg.10.1602197578485;
        Thu, 08 Oct 2020 15:52:58 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id jx17sm8386369pjb.10.2020.10.08.15.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 15:52:57 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-i2c@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
Date:   Thu,  8 Oct 2020 15:52:34 -0700
Message-Id: <20201008155154.2.I7b22281453b8a18ab16ef2bfd4c641fb1cc6a92c@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <20201008225235.2035820-1-dianders@chromium.org>
References: <20201008225235.2035820-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 02b9aec59243c6240fc42884acc958602146ddf6.

As talked about in the patch ("soc: qcom: geni: More properly switch
to DMA mode"), swapping the order of geni_se_setup_m_cmd() and
geni_se_xx_dma_prep() can sometimes cause corrupted transfers.  Thus
we traded one problem for another.  Now that we've debugged the
problem further and fixed the geni helper functions to more disable
FIFO interrupts when we move to DMA mode we can revert it and end up
with (hopefully) zero problems!

To be explicit, the patch ("soc: qcom: geni: More properly switch
to DMA mode") is a prerequisite for this one.

Fixes: 02b9aec59243 ("i2c: i2c-qcom-geni: Fix DMA transfer race")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/i2c/busses/i2c-qcom-geni.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index dead5db3315a..32b2a9921b14 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -367,6 +367,7 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
 
 	writel_relaxed(len, se->base + SE_I2C_RX_TRANS_LEN);
+	geni_se_setup_m_cmd(se, I2C_READ, m_param);
 
 	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
@@ -374,8 +375,6 @@ static int geni_i2c_rx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		dma_buf = NULL;
 	}
 
-	geni_se_setup_m_cmd(se, I2C_READ, m_param);
-
 	time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
 	if (!time_left)
 		geni_i2c_abort_xfer(gi2c);
@@ -409,6 +408,7 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		geni_se_select_mode(se, GENI_SE_FIFO);
 
 	writel_relaxed(len, se->base + SE_I2C_TX_TRANS_LEN);
+	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
 
 	if (dma_buf && geni_se_tx_dma_prep(se, dma_buf, len, &tx_dma)) {
 		geni_se_select_mode(se, GENI_SE_FIFO);
@@ -416,8 +416,6 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 		dma_buf = NULL;
 	}
 
-	geni_se_setup_m_cmd(se, I2C_WRITE, m_param);
-
 	if (!dma_buf) /* Get FIFO IRQ */
 		writel_relaxed(1, se->base + SE_GENI_TX_WATERMARK_REG);
 
-- 
2.28.0.1011.ga647a8990f-goog

