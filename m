Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6796D201FB7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 04:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731779AbgFTCWk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 22:22:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731744AbgFTCWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 22:22:36 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C13C0613F0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 19:22:36 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id g12so4735942pll.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jun 2020 19:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jYMqxDbYGVsmzfyOoyUgQX25c2OVSiaityK3R4E49i0=;
        b=lot0pPrzjqlyDxv/SuV8XI7m9aTybBuOj1YqRPlx678kbiLzlnzGAjqq4CDeiA7ivp
         AL9UQXicMdxZNhF2FlHGrtMSgojN3TX06x2mWcseGXicmI1+hH/rgHQ70vWJizdA/X2U
         EKwwKyj5basYb7+AS5nUox1ZMLD/BTJeWPglc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jYMqxDbYGVsmzfyOoyUgQX25c2OVSiaityK3R4E49i0=;
        b=MzGXQBOTFfrijU3fxwiumbtdatWz7DcqMIoD70tPWGkUbkKeTNPRbZBxWPGr9FsF6b
         /mf3In+jhoID5nEBvwRMs57M5PX/2Tm+jxM5TYYYGGhgpfDOcG4bSrZxPmgWI/ZQQr7z
         Js+AyvZtvJZsPBi2tb3CY7Fdau8RgHOSBhbcik2H/QGcOJpkA9FL0mny5RvPXMPIt7kO
         LmX/MkpoGVmHKU3+kpZBwAzCIgex5J5flq2ygb/J1rhw5KH7CtrSe3ZZMIT0PDivpw99
         meKoE5Hya0PtG6OxPREsIsjWQjgEO8RFjYCNZGum/DDI7YzsBz6gsvu49zLiQ4niKIcp
         7fGw==
X-Gm-Message-State: AOAM530l8ZCRmX5x+m5pg3MIZxZOXyihBD9nrRpssj6v4DO7cngaNCVT
        NHs/vHGz6/6Swfdqm3je6WolBw==
X-Google-Smtp-Source: ABdhPJwV7Cpi88hQLo8D8HNN2earezSETvGWeKRiYxB+TMAW7r/NxE9wqpd6OZ9QAGCgnCahxPkjtA==
X-Received: by 2002:a17:902:7d89:: with SMTP id a9mr10289321plm.309.1592619755935;
        Fri, 19 Jun 2020 19:22:35 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id m14sm6241911pjv.12.2020.06.19.19.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 19:22:35 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Alok Chauhan <alokc@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v1 1/2] spi: spi-geni-qcom: Simplify setup_fifo_xfer()
Date:   Fri, 19 Jun 2020 19:22:32 -0700
Message-Id: <20200620022233.64716-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
In-Reply-To: <20200620022233.64716-1-swboyd@chromium.org>
References: <20200620022233.64716-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The definition of SPI_FULL_DUPLEX (3) is really SPI_TX_ONLY (1) ORed
with SPI_RX_ONLY (2). Let's drop the define and simplify the code here a
bit by collapsing the setting of 'm_cmd' into conditions that are the
same.

This is a non-functional change, just cleanup to consolidate code.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/spi/spi-geni-qcom.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 0c534d151370..d8f03ffb8594 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -51,7 +51,6 @@
 /* M_CMD OP codes for SPI */
 #define SPI_TX_ONLY		1
 #define SPI_RX_ONLY		2
-#define SPI_FULL_DUPLEX		3
 #define SPI_TX_RX		7
 #define SPI_CS_ASSERT		8
 #define SPI_CS_DEASSERT		9
@@ -353,12 +352,6 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
 
 	mas->tx_rem_bytes = 0;
 	mas->rx_rem_bytes = 0;
-	if (xfer->tx_buf && xfer->rx_buf)
-		m_cmd = SPI_FULL_DUPLEX;
-	else if (xfer->tx_buf)
-		m_cmd = SPI_TX_ONLY;
-	else if (xfer->rx_buf)
-		m_cmd = SPI_RX_ONLY;
 
 	spi_tx_cfg &= ~CS_TOGGLE;
 
@@ -369,12 +362,14 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
 	len &= TRANS_LEN_MSK;
 
 	mas->cur_xfer = xfer;
-	if (m_cmd & SPI_TX_ONLY) {
+	if (xfer->tx_buf) {
+		m_cmd |= SPI_TX_ONLY;
 		mas->tx_rem_bytes = xfer->len;
 		writel(len, se->base + SE_SPI_TX_TRANS_LEN);
 	}
 
-	if (m_cmd & SPI_RX_ONLY) {
+	if (xfer->rx_buf) {
+		m_cmd |= SPI_RX_ONLY;
 		writel(len, se->base + SE_SPI_RX_TRANS_LEN);
 		mas->rx_rem_bytes = xfer->len;
 	}
-- 
Sent by a computer, using git, on the internet

