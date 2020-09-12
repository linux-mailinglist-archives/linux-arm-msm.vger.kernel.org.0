Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 566C3267C84
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Sep 2020 23:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgILVIr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Sep 2020 17:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgILVIU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Sep 2020 17:08:20 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAEDEC061786
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 14:08:18 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 67so8676530pgd.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2020 14:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nT97JuHeIYEYuVntShwpzBJaTAHIXhzgnidrheouJoQ=;
        b=H7l8JzFpvQ98TLFd8MPo4am/gruKkYODBqBTRy+4TWWz1HuEQ64Y/vb/Of/CJoeV5g
         /4BtxCx2BpegSKNkdkI6DUiM+tG4vNjzxEod4JGU/TQZm9bBnda8PRUS8JNgor6Yxlxw
         zvnsl+nxifZtZRCk5kypYL8Cs0T9Xlw0LtuqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nT97JuHeIYEYuVntShwpzBJaTAHIXhzgnidrheouJoQ=;
        b=YzaqCrTVbQ2QoMekCe6URpfxiLr5YbFPd3xgA2ehoJoeL5hCVDSu7uYG/R1JMI3+8s
         ns+kp2JAch7jx6oV+04qFk4k+8wlLvjBW2zoxv7fEa9D677bNPOv83Po7VORNiPk8QlK
         LrJq/gD6fi0igNDCJNcafT+eJu5B0OWJyyNxfPMMTyrUvfxI5vyosN4stIwu/CPyOemd
         +Kvf0nff4dFpK6wHCkbJlIg3ubvYJrNvgeUFnPsrj0ctXDptuCylcJkQKuE7xfx0TT2m
         qMPBtZELVbEcFWby5zJcXjM+RrHPtMRecoaE2xkbM9SoWEX0RXtDv7iLabUdUHOKZF71
         bHmQ==
X-Gm-Message-State: AOAM531q89IPejBOKHwF/lRBV8ELMHqYpUAIf2dtJO8Xkb2mYYmvUONZ
        Aj4peP6vj8sf8HrrOHcMnGR14A==
X-Google-Smtp-Source: ABdhPJzxE9TcIeDb6yHHRDq49CWtiiptA89EirhaSk6k7v+xw7TfDzUfpYKHZwjkx+Pxbz/o8kG2oQ==
X-Received: by 2002:a62:bd0d:: with SMTP id a13mr7570502pff.39.1599944898254;
        Sat, 12 Sep 2020 14:08:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id e10sm3369020pgb.45.2020.09.12.14.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2020 14:08:17 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Akash Asthana <akashast@codeaurora.org>, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: [PATCH 2/3] spi: spi-geni-qcom: Don't program CS_TOGGLE again and again
Date:   Sat, 12 Sep 2020 14:08:00 -0700
Message-Id: <20200912140730.2.I33e571179986850b4ec17042e813d0b08fb1b9c1@changeid>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
In-Reply-To: <20200912140730.1.Ie67fa32009b94702d56232c064f1d89065ee8836@changeid>
References: <20200912140730.1.Ie67fa32009b94702d56232c064f1d89065ee8836@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We always toggle the chip select manually in spi-geni-qcom so that we
can properly implement the Linux API.  There's no reason to program
this to the hardware on every transfer.  Program it once at init and
be done with it.

This saves some part of a microsecond of overhead on each transfer.
While not really noticeable on any real world benchmarks, we might as
well save the time.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/spi/spi-geni-qcom.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 7f0bf0dec466..92d88bf85a90 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -290,6 +290,7 @@ static int spi_geni_init(struct spi_geni_master *mas)
 {
 	struct geni_se *se = &mas->se;
 	unsigned int proto, major, minor, ver;
+	u32 spi_tx_cfg;
 
 	pm_runtime_get_sync(mas->dev);
 
@@ -322,6 +323,11 @@ static int spi_geni_init(struct spi_geni_master *mas)
 
 	geni_se_select_mode(se, GENI_SE_FIFO);
 
+	/* We always control CS manually */
+	spi_tx_cfg = readl(se->base + SE_SPI_TRANS_CFG);
+	spi_tx_cfg &= ~CS_TOGGLE;
+	writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
+
 	pm_runtime_put(mas->dev);
 	return 0;
 }
@@ -331,7 +337,7 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
 				u16 mode, struct spi_master *spi)
 {
 	u32 m_cmd = 0;
-	u32 spi_tx_cfg, len;
+	u32 len;
 	struct geni_se *se = &mas->se;
 	int ret;
 
@@ -350,7 +356,6 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
 	spin_lock_irq(&mas->lock);
 	spin_unlock_irq(&mas->lock);
 
-	spi_tx_cfg = readl(se->base + SE_SPI_TRANS_CFG);
 	if (xfer->bits_per_word != mas->cur_bits_per_word) {
 		spi_setup_word_len(mas, mode, xfer->bits_per_word);
 		mas->cur_bits_per_word = xfer->bits_per_word;
@@ -364,8 +369,6 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
 	mas->tx_rem_bytes = 0;
 	mas->rx_rem_bytes = 0;
 
-	spi_tx_cfg &= ~CS_TOGGLE;
-
 	if (!(mas->cur_bits_per_word % MIN_WORD_LEN))
 		len = xfer->len * BITS_PER_BYTE / mas->cur_bits_per_word;
 	else
@@ -384,7 +387,6 @@ static void setup_fifo_xfer(struct spi_transfer *xfer,
 		writel(len, se->base + SE_SPI_RX_TRANS_LEN);
 		mas->rx_rem_bytes = xfer->len;
 	}
-	writel(spi_tx_cfg, se->base + SE_SPI_TRANS_CFG);
 
 	/*
 	 * Lock around right before we start the transfer since our
-- 
2.28.0.618.gf4bc123cb7-goog

