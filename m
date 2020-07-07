Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF6421792B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2020 22:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728752AbgGGURH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jul 2020 16:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728699AbgGGURG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jul 2020 16:17:06 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 903BBC061755
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2020 13:17:06 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id z3so9611183pfn.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2020 13:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YRNXLfXkEnloDVfNSoeRyJNNX40mgSiHGZ6Wuoalny4=;
        b=ZwncCXRK6l1VG7QSOJiRPOwV5x2CH1bxGTFsKoDVW7JX/wMkzJqc4zcw5J3pUVUOcq
         HzmJ9ly+VJzodlPnROsFPDglXmNrQteBhGkCrgI9RbibjcOhjHoxEc3HeTZZGNnfPl6e
         VFInjfpHtwLcQsZz5PYk2hdmakKaKvIqV6+P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YRNXLfXkEnloDVfNSoeRyJNNX40mgSiHGZ6Wuoalny4=;
        b=dxIzKn9jfftezIp0XpcxQskWGW5BfnonlnHmA1opz2sAo4eL+vgrVKJN3FJC5tSMlj
         cX643jNFrolbJukaoqTKcUJQFCLeOphrhOgN+gUxnf12saQGpyCKImm7mgmFfBSnZOaY
         NW3X9ETC2+14iruyxqfs6KuxhE/0dFSbxZcbWRYLGgf6wEbvLXHiBYQ0w3y5bSFi7sAx
         oa6/8Gh/Dx752/U4aA5AhY8v2V/QjvRu/Nq7z2nhqoB52qiSqxSy0TsmuEugj9xw9n7N
         zMTgH8xjPul/drIFb7tmD/1xMAQXC10EQr3++P9TcpIeEBzgSM1QaQ6J6yn86uUtFjh0
         Yb7w==
X-Gm-Message-State: AOAM531Mcetv/vGaqZxGaXYAzdqQy0rrM/Xw9tDV+s+0VBlJTVrsJXtK
        JfMC/4IVmF4iuqL/wgRoAhZU0w==
X-Google-Smtp-Source: ABdhPJy8BoXCvL5f7CuqgJneTnjO+BcgSip9UTzWmDjPpsIbiLLyJdAmItQ01LEKO6BhO/NduQecbQ==
X-Received: by 2002:aa7:858c:: with SMTP id w12mr29376916pfn.143.1594153026110;
        Tue, 07 Jul 2020 13:17:06 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id i23sm7166097pfq.206.2020.07.07.13.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2020 13:17:05 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Mark Brown <broonie@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, Akash Asthana <akashast@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org,
        ctheegal@codeaurora.org, mkshah@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 1/2] spi: spi-qcom-qspi: Avoid clock setting if not needed
Date:   Tue,  7 Jul 2020 13:16:40 -0700
Message-Id: <20200707131607.1.Ia7cb4f41ce93d37d0a764b47c8a453ce9e9c70ef@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200707201641.2030532-1-dianders@chromium.org>
References: <20200707201641.2030532-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As per recent changes to the spi-qcom-qspi, now when we set the clock
we'll call into the interconnect framework and also call the OPP API.
Those are expensive operations.  Let's avoid calling them if possible.
This has a big impact on getting transfer rates back up to where they
were (or maybe slightly better) before those patches landed.

Fixes: cff80645d6d3 ("spi: spi-qcom-qspi: Add interconnect support")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This applies atop the Qualcomm tree after Rajendra's ("spi:
spi-qcom-qspi: Use OPP API to set clk/perf state") patch and I'd hope
it could land there with Mark's Ack just like the patch it Fixes did.

 drivers/spi/spi-qcom-qspi.c | 43 ++++++++++++++++++++++++++++---------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 18a59aa23ef8..322b88c22a86 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -144,6 +144,7 @@ struct qcom_qspi {
 	struct icc_path *icc_path_cpu_to_qspi;
 	struct opp_table *opp_table;
 	bool has_opp_table;
+	unsigned long last_speed;
 	/* Lock to protect data accessed by IRQs */
 	spinlock_t lock;
 };
@@ -226,19 +227,13 @@ static void qcom_qspi_handle_err(struct spi_master *master,
 	spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
-static int qcom_qspi_transfer_one(struct spi_master *master,
-				  struct spi_device *slv,
-				  struct spi_transfer *xfer)
+static int qcom_qspi_set_speed(struct qcom_qspi *ctrl, unsigned long speed_hz)
 {
-	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
 	int ret;
-	unsigned long speed_hz;
-	unsigned long flags;
 	unsigned int avg_bw_cpu;
 
-	speed_hz = slv->max_speed_hz;
-	if (xfer->speed_hz)
-		speed_hz = xfer->speed_hz;
+	if (speed_hz == ctrl->last_speed)
+		return 0;
 
 	/* In regular operation (SBL_EN=1) core must be 4x transfer clock */
 	ret = dev_pm_opp_set_rate(ctrl->dev, speed_hz * 4);
@@ -259,6 +254,28 @@ static int qcom_qspi_transfer_one(struct spi_master *master,
 		return ret;
 	}
 
+	ctrl->last_speed = speed_hz;
+
+	return 0;
+}
+
+static int qcom_qspi_transfer_one(struct spi_master *master,
+				  struct spi_device *slv,
+				  struct spi_transfer *xfer)
+{
+	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
+	int ret;
+	unsigned long speed_hz;
+	unsigned long flags;
+
+	speed_hz = slv->max_speed_hz;
+	if (xfer->speed_hz)
+		speed_hz = xfer->speed_hz;
+
+	ret = qcom_qspi_set_speed(ctrl, speed_hz);
+	if (ret)
+		return ret;
+
 	spin_lock_irqsave(&ctrl->lock, flags);
 
 	/* We are half duplex, so either rx or tx will be set */
@@ -602,7 +619,13 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
 		return ret;
 	}
 
-	return clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
+	ret = clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
+	if (ret)
+		return ret;
+
+	dev_pm_opp_set_rate(dev, ctrl->last_speed * 4);
+
+	return 0;
 }
 
 static int __maybe_unused qcom_qspi_suspend(struct device *dev)
-- 
2.27.0.383.g050319c2ae-goog

