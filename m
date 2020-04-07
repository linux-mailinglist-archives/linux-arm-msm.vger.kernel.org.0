Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 415451A18D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 01:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgDGXvL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 19:51:11 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44934 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbgDGXvL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 19:51:11 -0400
Received: by mail-pl1-f193.google.com with SMTP id h11so1824459plr.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 16:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VRUQrpcD0mEX27IehvT81s6G5+K5gT9dnSht2dkEZpg=;
        b=TRU2IUEK918o7xqwDAoCm+4WtSXS1dYsrfNx3LZ8JbV1HpgRAaEUzqpbyampK0QrtU
         Db11PrZl6NGiZ8eVN/cUS1S4X2gU9Koc5S+/axgQ+IjaKoQq8bgWjwpTw5DW2iTYrvtM
         4Gpa8fwA5huSGgBju4rMG6JBqTIWo6pS0RP8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VRUQrpcD0mEX27IehvT81s6G5+K5gT9dnSht2dkEZpg=;
        b=ovkoVlb3lgkQk0eiZ5sFnhpiHXvIVidoDXpMiGya3zJngINq2PLUotJnt0x7K/rePG
         x/f3XFpoxZAeobePKf0EF19vtaeW/lgBVPk76507Ve/PA112K1oJVw4wmmhAnYJpGKAE
         LSM9lSTvSnPEOlGASY+9HdNHsWrg+fb4qkFdbVx6zLkzpahX2Sjd33N7t4xaU6xrG+st
         s+EXM9vX6lx8pISspBPfjLx3rzAdtOjtp/E8WckLif8uGd0AjO57sXiMjkNy1GOQ7sT1
         WqrwIxN8lOzFOEMJ2Ulv1KZmVCSVCQ8Q3hgPjHR8Nr/6jXytYYV3BsG/u8okFgLGLpE7
         rCUA==
X-Gm-Message-State: AGi0PuZUyX9bF8dHUrmIHqQLJpMBkwtUppGSwT2Q70bOtIAmYZzH66xh
        +HN8TFP8IapkPZeuuvAbSOSGWw==
X-Google-Smtp-Source: APiQypKPQQKTt1fbSqZ+dufZ8A2LJWt8q3h7go+/iYg3uKe9hPHT51Hit+FaMfteemESmbO5JyVjsw==
X-Received: by 2002:a17:902:be14:: with SMTP id r20mr4715305pls.270.1586303466383;
        Tue, 07 Apr 2020 16:51:06 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id s27sm14467165pgn.90.2020.04.07.16.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 16:51:05 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>
Cc:     mka@chromium.org, Lina Iyer <ilina@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, swboyd@chromium.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/10] drivers: qcom: rpmh-rsc: Caller handles tcs_invalidate() exclusivity
Date:   Tue,  7 Apr 2020 16:50:23 -0700
Message-Id: <20200407164915.v3.9.I07c1f70e0e8f2dc0004bd38970b4e258acdc773e@changeid>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
In-Reply-To: <20200407235024.260460-1-dianders@chromium.org>
References: <20200407235024.260460-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Auditing tcs_invalidate() made me worried.  Specifically I saw that it
used spin_lock(), not spin_lock_irqsave().  That always worries me
unless I can trace for sure that I'm in the interrupt handler or that
someone else already disabled interrupts.

Looking more at it, there is actually no reason for these locks
anyway.  Specifically the only reason you'd ever call
rpmh_rsc_invalidate() is if you cared that the sleep/wake TCSes were
empty.  That means that they need to continue to be empty even after
rpmh_rsc_invalidate() returns.  The only way that can happen is if the
caller already has done something to keep all other RPMH users out.
It should be noted that even though the caller is only worried about
making sleep/wake TCSes empty, they also need to worry about stopping
active-only transfers if they need to handle the case where
active-only transfers might borrow the wake TCS.

At the moment rpmh_rsc_invalidate() is only called in PM code from the
last CPU.  If that later changes the caller will still need to solve
the above problems themselves, so these locks will never be useful.

Continuing to audit tcs_invalidate(), I found a bug.  The function
didn't properly check for a borrowed TCS if we hadn't recently written
anything into the TCS.  Specifically, if we've never written to the
WAKE_TCS (or we've flushed it recently) then tcs->slots is empty.
We'll early-out and we'll never call tcs_is_free().

I thought about fixing this bug by either deleting the early check for
bitmap_empty() or possibly only doing it if we knew we weren't on a
TCS that could be borrowed.  However, I think it's better to just
delete the checks.

As argued above it's up to the caller to make sure that all other
users of RPMH are quiet before tcs_invalidate() is called.  Since
callers need to handle the zero-active-TCS case anyway that means they
need to make sure that make sure the active-only transfers are quiet
before calling too.  The one way tcs_invalidate() gets called today is
through rpmh_rsc_cpu_pm_callback() which calls
rpmh_rsc_ctrlr_is_busy() to handle this.  When we have another path to
get to tcs_invalidate() it will also need to come up with something
similar and it won't need this extra check either.  If we later find
some code path that actually needs this check back in (and somehow
manages to be race free) we can always add it back in.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Replaced ("irqsave()...") + ("...never -EBUSY") w/ ("Caller handles...")

Changes in v2: None

 drivers/soc/qcom/rpmh-internal.h |  2 +-
 drivers/soc/qcom/rpmh-rsc.c      | 38 +++++++++++---------------------
 drivers/soc/qcom/rpmh.c          |  5 +----
 3 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index f06350cbc9a2..dba8510c0669 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -132,7 +132,7 @@ struct rsc_drv {
 int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg);
 int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv,
 			     const struct tcs_request *msg);
-int rpmh_rsc_invalidate(struct rsc_drv *drv);
+void rpmh_rsc_invalidate(struct rsc_drv *drv);
 
 void rpmh_tx_done(const struct tcs_request *msg, int r);
 int rpmh_flush(struct rpmh_ctrlr *ctrlr);
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 10c026b2e1bc..a3b015196f15 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -198,50 +198,38 @@ static bool tcs_is_free(struct rsc_drv *drv, int tcs_id)
  * This will clear the "slots" variable of the given tcs_group and also
  * tell the hardware to forget about all entries.
  *
- * Return: 0 if no problem, or -EAGAIN if the caller should try again in a
- *         bit. Caller should make sure to enable interrupts between tries.
+ * The caller must ensure that no other RPMH actions are happening when this
+ * function is called, since otherwise the device may immediately become
+ * used again even before this function exits.
  */
-static int tcs_invalidate(struct rsc_drv *drv, int type)
+static void tcs_invalidate(struct rsc_drv *drv, int type)
 {
 	int m;
 	struct tcs_group *tcs = &drv->tcs[type];
 
-	spin_lock(&tcs->lock);
-	if (bitmap_empty(tcs->slots, MAX_TCS_SLOTS)) {
-		spin_unlock(&tcs->lock);
-		return 0;
-	}
+	/* Caller ensures nobody else is running so no lock */
+	if (bitmap_empty(tcs->slots, MAX_TCS_SLOTS))
+		return;
 
 	for (m = tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
-		if (!tcs_is_free(drv, m)) {
-			spin_unlock(&tcs->lock);
-			return -EAGAIN;
-		}
 		write_tcs_reg_sync(drv, RSC_DRV_CMD_ENABLE, m, 0);
 		write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, m, 0);
 	}
 	bitmap_zero(tcs->slots, MAX_TCS_SLOTS);
-	spin_unlock(&tcs->lock);
-
-	return 0;
 }
 
 /**
  * rpmh_rsc_invalidate() - Invalidate sleep and wake TCSes.
  * @drv: The RSC controller.
  *
- * Return: 0 if no problem, or -EAGAIN if the caller should try again in a
- *         bit. Caller should make sure to enable interrupts between tries.
+ * The caller must ensure that no other RPMH actions are happening when this
+ * function is called, since otherwise the device may immediately become
+ * used again even before this function exits.
  */
-int rpmh_rsc_invalidate(struct rsc_drv *drv)
+void rpmh_rsc_invalidate(struct rsc_drv *drv)
 {
-	int ret;
-
-	ret = tcs_invalidate(drv, SLEEP_TCS);
-	if (!ret)
-		ret = tcs_invalidate(drv, WAKE_TCS);
-
-	return ret;
+	tcs_invalidate(drv, SLEEP_TCS);
+	tcs_invalidate(drv, WAKE_TCS);
 }
 
 /**
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 88f88015ef03..02171c192aa1 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -439,7 +439,6 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
  *
  * Return:
  * * 0          - Success
- * * -EAGAIN    - Retry again
  * * Error code - Otherwise
  */
 int rpmh_flush(struct rpmh_ctrlr *ctrlr)
@@ -453,9 +452,7 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 	}
 
 	/* Invalidate the TCSes first to avoid stale data */
-	ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
-	if (ret)
-		return ret;
+	rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
 
 	/* First flush the cached batch requests */
 	ret = flush_batch(ctrlr);
-- 
2.26.0.292.g33ef6b2f38-goog

