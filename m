Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CB628DCC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 11:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730419AbgJNJTy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 05:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730424AbgJNJTk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 05:19:40 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF90C0613DE
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 14:26:25 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id e7so596297pfn.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 14:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mufC+Ap9xnkOPtTpdL6qCz85PvFDmFdb1oHbD9woAtU=;
        b=bG5DDyWe1hHiGqKx0Rliz987Jdvd1KBLnhOpKw7zvVhHSUayWhHukVEUoD0lRf9Hff
         NwP2nkVaqDESF/XxzgRbUjxLDBXspHDDSufLm3UZTGCqOEA6K0cIPeeUXaQHq6FxB9Mb
         9xNCKsDx8gIEgtXsFA98LMkMtUz3VK5iIQlvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mufC+Ap9xnkOPtTpdL6qCz85PvFDmFdb1oHbD9woAtU=;
        b=NVLN3xlgrKcU7fOe9rxUEnCh5FFlU1ueqjfhPPW52yf52mrFg2HyxIdvRbmpdKYfRx
         UqUWN0t9L5t+0sG61vK6WFZXEd/sfRJtJeUyxjpl1zG037ivc6hCD0NpVqXIg+A7pOpG
         YtBVHcdwhuBqRjrF6EGqHMsOeudfv2x1LqEvO3crCj2ZmeNvG+YFzlYtW13OHeoZ0pTj
         JE9M0BFzb1WFk3eKrfGjeKvvzQiNiPBHa2tqXdlLWUqoI9zJyD1sFTTv07I4C3M292kK
         yHNwring/WFiXLPBdf7SmkRlvOwfki+CoXatNkP5ZgCbhcFJ2Y7xq60MQJJbHUlFUdlI
         glAg==
X-Gm-Message-State: AOAM533YBx+GrEOTBA6t7HF5i5A1r0OPP5g/QZJH2qBr0AD4Oczkw6ZJ
        8GR1Pj04l1FGPcSmUSs65+l11Q==
X-Google-Smtp-Source: ABdhPJw+h+grE52QGnT2LkbzYI8gkajzy92W3dKZksdWwf6EhrdGgjFBRQymoUTAneV6TKBnCrjltQ==
X-Received: by 2002:a63:3747:: with SMTP id g7mr1248978pgn.190.1602624385221;
        Tue, 13 Oct 2020 14:26:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id b15sm167713pju.16.2020.10.13.14.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 14:26:24 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>
Cc:     linux-i2c@vger.kernel.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Mukesh Savaliya <msavaliy@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
Date:   Tue, 13 Oct 2020 14:25:29 -0700
Message-Id: <20201013142448.v2.2.I7b22281453b8a18ab16ef2bfd4c641fb1cc6a92c@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <20201013212531.428538-1-dianders@chromium.org>
References: <20201013212531.428538-1-dianders@chromium.org>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Akash Asthana <akashast@codeaurora.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

(no changes since v1)

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

