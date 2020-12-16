Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5042DC91B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Dec 2020 23:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730228AbgLPWnK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 17:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730199AbgLPWnK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 17:43:10 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54EA9C061282
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 14:42:30 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id x126so8746175pfc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 14:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbZxiG/JD9YQXv2sQzFlyfu39bBLP48QnsSoq2lBxGQ=;
        b=IB9ftPWqhkJ4XfQ0uT62WOhCnW1scqBjf/Vu/VT1F2BkMYqlYsaNMwYuz85LTtBYHa
         W//kvue5VoM869pvuCSbkQV6qMW3s2ZT7kRPssW5MJlk1Ih8KMcog/Evox8zJvC4DDus
         FOMzbBs4C5TZnId1htBYIrrYQ70J2TGXpUPWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbZxiG/JD9YQXv2sQzFlyfu39bBLP48QnsSoq2lBxGQ=;
        b=ptyugb+0N/OGwHqYI1RueHiCzaKCBoI+6O+AtyXwtPxITr1AYGmzjfduH4bfkoRjgj
         DlJqXvXZAREjXTs333hopSWIg/UvPJNowINnxm462CRBgssRS13AXFHqUyhNp+x49Y0R
         4dorUSZFUZocIdhPHNcajwqLo0ScQWQQhvjxxpeIWn/t8z0f17NyYaJ5VQlNY1GkWJkw
         hPlfJ4q83oqPHIEd9b89LjrdGdH/1RvNnJUf6aIkFXas1CTSojpOdfFxxazpSv3E13xc
         JIwo6nCIR943NzLeBgD7Nf6RhWr0CFOT3tmhUZpMHZXepubAVp+BuulF1+j9z8ALIg0e
         cVJg==
X-Gm-Message-State: AOAM530uasXwm0jHFC4sEMIx6i7+eJOG146mBR09+b7mWH6u/CwKpdmJ
        1DvAAOX5iDKXjkL+PvFkssrA/g==
X-Google-Smtp-Source: ABdhPJxxOPgyfgV1lE6ycXNrKq/uEGEznucC4Jaqs5lrvh2F69meDN9DL54tbwtdzGXgbgHJdVc2XQ==
X-Received: by 2002:a65:5687:: with SMTP id v7mr30380250pgs.249.1608158549883;
        Wed, 16 Dec 2020 14:42:29 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id q26sm3561703pfl.219.2020.12.16.14.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 14:42:29 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     msavaliy@qti.qualcomm.com, akashast@codeaurora.org,
        Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dilip Kota <dkota@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: [PATCH v2 1/4] spi: spi-geni-qcom: Fix geni_spi_isr() NULL dereference in timeout case
Date:   Wed, 16 Dec 2020 14:41:49 -0800
Message-Id: <20201216144114.v2.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 7ba9bdcb91f6 ("spi: spi-geni-qcom: Don't keep a local state
variable") we changed handle_fifo_timeout() so that we set
"mas->cur_xfer" to NULL to make absolutely sure that we don't mess
with the buffers from the previous transfer in the timeout case.

Unfortunately, this caused the IRQ handler to dereference NULL in some
cases.  One case:

  CPU0                           CPU1
  ----                           ----
                                 setup_fifo_xfer()
                                  geni_se_setup_m_cmd()
                                 <hardware starts transfer>
                                 <transfer completes in hardware>
                                 <hardware sets M_RX_FIFO_WATERMARK_EN in m_irq>
                                 ...
                                 handle_fifo_timeout()
                                  spin_lock_irq(mas->lock)
                                  mas->cur_xfer = NULL
                                  geni_se_cancel_m_cmd()
                                  spin_unlock_irq(mas->lock)

  geni_spi_isr()
   spin_lock(mas->lock)
   if (m_irq & M_RX_FIFO_WATERMARK_EN)
    geni_spi_handle_rx()
     mas->cur_xfer NULL dereference!

tl;dr: Seriously delayed interrupts for RX/TX can lead to timeout
handling setting mas->cur_xfer to NULL.

Let's check for the NULL transfer in the TX and RX cases and reset the
watermark or clear out the fifo respectively to put the hardware back
into a sane state.

NOTE: things still could get confused if we get timeouts all the way
through handle_fifo_timeout() and then start a new transfer because
interrupts from the old transfer / cancel / abort could still be
pending.  A future patch will help this corner case.

Fixes: 561de45f72bd ("spi: spi-geni-qcom: Add SPI driver support for GENI based QUP")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- (ptr == NULL) => (!ptr).
- Addressed loop nits in geni_spi_handle_rx().
- Commit message rewording from Stephen.

 drivers/spi/spi-geni-qcom.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 25810a7eef10..bf55abbd39f1 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -354,6 +354,12 @@ static bool geni_spi_handle_tx(struct spi_geni_master *mas)
 	unsigned int bytes_per_fifo_word = geni_byte_per_fifo_word(mas);
 	unsigned int i = 0;
 
+	/* Stop the watermark IRQ if nothing to send */
+	if (!mas->cur_xfer) {
+		writel(0, se->base + SE_GENI_TX_WATERMARK_REG);
+		return false;
+	}
+
 	max_bytes = (mas->tx_fifo_depth - mas->tx_wm) * bytes_per_fifo_word;
 	if (mas->tx_rem_bytes < max_bytes)
 		max_bytes = mas->tx_rem_bytes;
@@ -396,6 +402,14 @@ static void geni_spi_handle_rx(struct spi_geni_master *mas)
 		if (rx_last_byte_valid && rx_last_byte_valid < 4)
 			rx_bytes -= bytes_per_fifo_word - rx_last_byte_valid;
 	}
+
+	/* Clear out the FIFO and bail if nowhere to put it */
+	if (mas->cur_xfer == NULL) {
+		while (i++ < DIV_ROUND_UP(rx_bytes, bytes_per_fifo_word))
+			readl(se->base + SE_GENI_RX_FIFOn);
+		return;
+	}
+
 	if (mas->rx_rem_bytes < rx_bytes)
 		rx_bytes = mas->rx_rem_bytes;
 
-- 
2.29.2.684.gfbc64c5ab5-goog

