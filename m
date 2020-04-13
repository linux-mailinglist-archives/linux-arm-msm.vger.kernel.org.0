Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E6051A6FD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 01:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389984AbgDMX1s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 19:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728469AbgDMX1r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 19:27:47 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BFD0C0A3BE2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 16:27:47 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t4so3957881plq.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 16:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rvH3n61ScP/pqhYRoi/YBAQRraGiMFMdWWKH2owSxzw=;
        b=eB+Q8LTJp7xRStQmoEjZEn5NHSzCtNkSjB0y/rjJ39JeORNT6nV4CCyXZhL2Lr4rbZ
         iTX4Xcvv4k3av8C5bSK5TgLjMaV2MzZOAtzDKrdMLL9KMqIjsVabCg0VQ2H5A7sKTJFt
         hOApg5PocN/VQQCibGALR55t/rcKJa4igxS8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rvH3n61ScP/pqhYRoi/YBAQRraGiMFMdWWKH2owSxzw=;
        b=uV/NYn+4D3VNYluuJa7RyfAOWCjy9auOEVUaokw22D5QKOfQ9vr3r41AifbGa2Vddg
         WdiNyc+LgHtgpAdDgNWrsDOVl184lXfWr9oi1ezMAPzS2h7mukx3UlVJgm/odYrAU+v4
         D6A+e+qXKglKX4s86/9RpVGjFw3AFR8cuLtrVFZ+gyWYBm22Wgi8h+V5UnAaAEFP+j5N
         BMjsqHgvwEnAwrp9Nf7L5d6KinPgkp6N6MeqCNoZNQ9U7OxieSqDUoZ+XRzh6oxXUIun
         LKYJLY8GLP4+DAkAUvJEe1AXpj0v9zYOga03Hns7NTFGyXQzkGToXHTgsnxiB3fmH98g
         x8Mw==
X-Gm-Message-State: AGi0PuYd31pDZdGv5gqsYRd4pvbDy9jUGfiivatQ3/8izdDvHFjjcvyH
        EdIaXBOrKVYPigS4AVRTzATiCA==
X-Google-Smtp-Source: APiQypLpGFp5RDCZcrbVkh5O3C4n9buM5wfuZbVvrS2BWlJfAPc2KBoNrTNgUBpsT9nNYe3sAgt8+w==
X-Received: by 2002:a17:90b:3691:: with SMTP id mj17mr12848306pjb.114.1586820466863;
        Mon, 13 Apr 2020 16:27:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id i128sm403974pfc.149.2020.04.13.16.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 16:27:46 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Adrian Hunter <adrian.hunter@intel.com>,
        Ritesh Harjani <riteshh@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Venkat Gopalakrishnan <venkatg@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Konstantin Dorfman <kdorfman@codeaurora.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Subhash Jadavani <subhashj@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: [PATCH] mmc: cqhci: Avoid false "cqhci: CQE stuck on" by not open-coding timeout loop
Date:   Mon, 13 Apr 2020 16:27:27 -0700
Message-Id: <20200413162717.1.Idece266f5c8793193b57a1ddb1066d030c6af8e0@changeid>
X-Mailer: git-send-email 2.26.0.110.g2183baf09c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Open-coding a timeout loop invariably leads to errors with handling
the timeout properly in one corner case or another.  In the case of
cqhci we might report "CQE stuck on" even if it wasn't stuck on.
You'd just need this sequence of events to happen in cqhci_off():

1. Call ktime_get().
2. Something happens to interrupt the CPU for > 100 us (context switch
   or interrupt).
3. Check time and; set "timed_out" to true since > 100 us.
4. Read CQHCI_CTL.
5. Both "reg & CQHCI_HALT" and "timed_out" are true, so break.
6. Since "timed_out" is true, falsely print the error message.

Rather than fixing the polling loop, use readx_poll_timeout() like
many people do.  This has been time tested to handle the corner cases.

Fixes: a4080225f51d ("mmc: cqhci: support for command queue enabled host")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/mmc/host/cqhci.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/mmc/host/cqhci.c b/drivers/mmc/host/cqhci.c
index c2239ee2c0ef..75934f3c117e 100644
--- a/drivers/mmc/host/cqhci.c
+++ b/drivers/mmc/host/cqhci.c
@@ -5,6 +5,7 @@
 #include <linux/delay.h>
 #include <linux/highmem.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
@@ -349,12 +350,16 @@ static int cqhci_enable(struct mmc_host *mmc, struct mmc_card *card)
 /* CQHCI is idle and should halt immediately, so set a small timeout */
 #define CQHCI_OFF_TIMEOUT 100
 
+static u32 cqhci_read_ctl(struct cqhci_host *cq_host)
+{
+	return cqhci_readl(cq_host, CQHCI_CTL);
+}
+
 static void cqhci_off(struct mmc_host *mmc)
 {
 	struct cqhci_host *cq_host = mmc->cqe_private;
-	ktime_t timeout;
-	bool timed_out;
 	u32 reg;
+	int err;
 
 	if (!cq_host->enabled || !mmc->cqe_on || cq_host->recovery_halt)
 		return;
@@ -364,15 +369,9 @@ static void cqhci_off(struct mmc_host *mmc)
 
 	cqhci_writel(cq_host, CQHCI_HALT, CQHCI_CTL);
 
-	timeout = ktime_add_us(ktime_get(), CQHCI_OFF_TIMEOUT);
-	while (1) {
-		timed_out = ktime_compare(ktime_get(), timeout) > 0;
-		reg = cqhci_readl(cq_host, CQHCI_CTL);
-		if ((reg & CQHCI_HALT) || timed_out)
-			break;
-	}
-
-	if (timed_out)
+	err = readx_poll_timeout(cqhci_read_ctl, cq_host, reg,
+				 reg & CQHCI_HALT, 0, CQHCI_OFF_TIMEOUT);
+	if (err < 0)
 		pr_err("%s: cqhci: CQE stuck on\n", mmc_hostname(mmc));
 	else
 		pr_debug("%s: cqhci: CQE off\n", mmc_hostname(mmc));
-- 
2.26.0.110.g2183baf09c-goog

