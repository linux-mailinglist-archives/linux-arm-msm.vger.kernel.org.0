Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22DD2DDB67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Dec 2020 23:32:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732101AbgLQWaS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Dec 2020 17:30:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732046AbgLQWaR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Dec 2020 17:30:17 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DA16C06138C
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 14:29:37 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id d2so300943pfq.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Dec 2020 14:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CBG392X/fqmC2FSSXnmbfDW/za8PCEWVRQmenaYl98s=;
        b=bxppXRLfzJvnGAGc3fb6OnIE3ujPsvT95MFOws56MX/JbWAlK5gzLVxiZNFCFaoPra
         nxX6xV731je5sR5ERkvOu+PfYaYkFH+m/pDhjX5uINXic1eTb+Q/X1ySdvlzpnaRv0Su
         bnu2f2U5pNb0ZPqxh27TQqg+1Hs2gsKSk1SK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CBG392X/fqmC2FSSXnmbfDW/za8PCEWVRQmenaYl98s=;
        b=SankqjjNTXh+MdWEAs+Rn/+CNU/8qrXatKqozwcLX8VbqTCuAgH0nhUGDvhIdrTNqa
         s23g6wrbpLrwTsjywfzDZQIxShWjA4b9rRKykN65+VXVxlqu37Xtvu0La0/HSApPr/Kf
         triwMIXlSgEoiTog9r5pes+tRWryCn4AuRnv99r7zzOQUrXzR9Q49M6WMBJZPZZKqBAX
         IS9QT8ipyxyZM3fUjyfqm686ITRtq0cBlveh1W8yGwHPuKqjZNmqR+Kv3et6t0X+BMeO
         TUGZTrxJCykGjEz59ZB8SkPygN+5lALqw1CB7Qegxuh2UxwHfKELM1YB1w72nbWhzZw5
         ip1g==
X-Gm-Message-State: AOAM532gJ4uGnN3bIX/hcE6L5BzoWaWscFX5qJ8yqVHa8L/W2IOCV9l6
        b72m/O8vJwLUbZb/7MwaMIRa/P66n4RzmQ==
X-Google-Smtp-Source: ABdhPJwFi9/LiWzp30bFETjaBqAuGxtXVQg8FuhDxbCnWrm4vKWfvuxAT/6hNRSeijaYpd23S3WT9g==
X-Received: by 2002:a63:1521:: with SMTP id v33mr1375689pgl.30.1608244176903;
        Thu, 17 Dec 2020 14:29:36 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id gm18sm5805850pjb.55.2020.12.17.14.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 14:29:36 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     msavaliy@qti.qualcomm.com, Stephen Boyd <swboyd@chromium.org>,
        akashast@codeaurora.org,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dilip Kota <dkota@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org
Subject: [PATCH v3 2/4] spi: spi-geni-qcom: Fail new xfers if xfer/cancel/abort pending
Date:   Thu, 17 Dec 2020 14:29:12 -0800
Message-Id: <20201217142842.v3.2.Ibade998ed587e070388b4bf58801f1107a40eb53@changeid>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
In-Reply-To: <20201217142842.v3.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
References: <20201217142842.v3.1.I99ee04f0cb823415df59bd4f550d6ff5756e43d6@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If we got a timeout when trying to send an abort command then it means
that we just got 3 timeouts in a row:

1. The original timeout that caused handle_fifo_timeout() to be
   called.
2. A one second timeout waiting for the cancel command to finish.
3. A one second timeout waiting for the abort command to finish.

SPI is clocked by the controller, so nothing (aside from a hardware
fault or a totally broken sequencer) should be causing the actual
commands to fail in hardware.  However, even though the hardware
itself is not expected to fail (and it'd be hard to predict how we
should handle things if it did), it's easy to hit the timeout case by
simply blocking our interrupt handler from running for a long period
of time.  Obviously the system is in pretty bad shape if a interrupt
handler is blocked for > 2 seconds, but there are certainly bugs (even
bugs in other unrelated drivers) that can make this happen.

Let's make things a bit more robust against this case.  If we fail to
abort we'll set a flag and then we'll block all future transfers until
we have no more interrupts pending.

Fixes: 561de45f72bd ("spi: spi-geni-qcom: Add SPI driver support for GENI based QUP")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- spin the lock in spi_geni_is_abort_still_pending() if abort pending.

Changes in v2:
- Make this just about the failed abort.

 drivers/spi/spi-geni-qcom.c | 59 +++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 6939c6cabe91..cf3db40ae5ba 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -83,6 +83,7 @@ struct spi_geni_master {
 	spinlock_t lock;
 	int irq;
 	bool cs_flag;
+	bool abort_failed;
 };
 
 static int get_spi_clk_cfg(unsigned int speed_hz,
@@ -141,8 +142,49 @@ static void handle_fifo_timeout(struct spi_master *spi,
 	spin_unlock_irq(&mas->lock);
 
 	time_left = wait_for_completion_timeout(&mas->abort_done, HZ);
-	if (!time_left)
+	if (!time_left) {
 		dev_err(mas->dev, "Failed to cancel/abort m_cmd\n");
+
+		/*
+		 * No need for a lock since SPI core has a lock and we never
+		 * access this from an interrupt.
+		 */
+		mas->abort_failed = true;
+	}
+}
+
+static bool spi_geni_is_abort_still_pending(struct spi_geni_master *mas)
+{
+	struct geni_se *se = &mas->se;
+	u32 m_irq, m_irq_en;
+
+	if (!mas->abort_failed)
+		return false;
+
+	/*
+	 * The only known case where a transfer times out and then a cancel
+	 * times out then an abort times out is if something is blocking our
+	 * interrupt handler from running.  Avoid starting any new transfers
+	 * until that sorts itself out.
+	 */
+	spin_lock_irq(&mas->lock);
+	m_irq = readl(se->base + SE_GENI_M_IRQ_STATUS);
+	m_irq_en = readl(se->base + SE_GENI_M_IRQ_EN);
+	spin_unlock_irq(&mas->lock);
+
+	if (m_irq & m_irq_en) {
+		dev_err(mas->dev, "Interrupts pending after abort: %#010x\n",
+			m_irq & m_irq_en);
+		return true;
+	}
+
+	/*
+	 * If we're here the problem resolved itself so no need to check more
+	 * on future transfers.
+	 */
+	mas->abort_failed = false;
+
+	return false;
 }
 
 static void spi_geni_set_cs(struct spi_device *slv, bool set_flag)
@@ -158,9 +200,15 @@ static void spi_geni_set_cs(struct spi_device *slv, bool set_flag)
 	if (set_flag == mas->cs_flag)
 		return;
 
+	pm_runtime_get_sync(mas->dev);
+
+	if (spi_geni_is_abort_still_pending(mas)) {
+		dev_err(mas->dev, "Can't set chip select\n");
+		goto exit;
+	}
+
 	mas->cs_flag = set_flag;
 
-	pm_runtime_get_sync(mas->dev);
 	spin_lock_irq(&mas->lock);
 	reinit_completion(&mas->cs_done);
 	if (set_flag)
@@ -173,6 +221,7 @@ static void spi_geni_set_cs(struct spi_device *slv, bool set_flag)
 	if (!time_left)
 		handle_fifo_timeout(spi, NULL);
 
+exit:
 	pm_runtime_put(mas->dev);
 }
 
@@ -280,6 +329,9 @@ static int spi_geni_prepare_message(struct spi_master *spi,
 	int ret;
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
 
+	if (spi_geni_is_abort_still_pending(mas))
+		return -EBUSY;
+
 	ret = setup_fifo_params(spi_msg->spi, spi);
 	if (ret)
 		dev_err(mas->dev, "Couldn't select mode %d\n", ret);
@@ -509,6 +561,9 @@ static int spi_geni_transfer_one(struct spi_master *spi,
 {
 	struct spi_geni_master *mas = spi_master_get_devdata(spi);
 
+	if (spi_geni_is_abort_still_pending(mas))
+		return -EBUSY;
+
 	/* Terminate and return success for 0 byte length transfer */
 	if (!xfer->len)
 		return 0;
-- 
2.29.2.684.gfbc64c5ab5-goog

