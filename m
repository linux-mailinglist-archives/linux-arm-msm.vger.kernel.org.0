Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2431C434B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 19:50:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730508AbgEDRus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 13:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730487AbgEDRup (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 13:50:45 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367C7C061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 10:50:45 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id h12so111163pjz.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 10:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QoGX7VgExngW8F3pN57T0qpSAdZI6hLoffCgVYGEFII=;
        b=V5QJxm5MXsrkYaHWiiCzHrAhUYPrCYdbuVJCpAIxfkkVl8n2S5n4NirZwU0mZRgozm
         xWG30m0dorbF5fN87TiHOo3Mm/gmBEefow4XSDbhtSRwpaBqAXWGkN2sxiJHbIpQbX/G
         zVog10dO9xOHhdJYQflrhyBgqp0KqTuo2sgB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QoGX7VgExngW8F3pN57T0qpSAdZI6hLoffCgVYGEFII=;
        b=gfb+zTxKBNEZuvln5hF/dx6CkV/7HLyavdCWTR3D6cMOCoz1hr4lBoIQGPUFYKwxeC
         LSwm2bQYLaKM6GaoILqD1asd2iDUcc3oa3euAjMEVBhzZsdZO0C1d0SDDGnUOZDM+LI3
         XFmPrfII5JWhih4sk04GE11tZhJljoRehNFJILnv7dWTjrLk3RSkn6HoGeCwL9bw6eZ9
         wzKmKgRzVqMpDysKZOkh+szLvKG1XOKyrfn4H1SJdDle/ZWOEbwA1dFqed2bAtFH2Ckk
         c+kzX3Mdnnad1QlhNsXwZCEW/K0tVJT1yyNjXuof2DnbPS4+HqBYNjL0+FBOmdaNse8F
         M7gw==
X-Gm-Message-State: AGi0PuZ7nBlDVaP+zwzGOrGBwXXqDhMlYmfSBcbMZOZ3IYJMCI+4cPuU
        oM+Hg2NYUiC3FR3Ci6MOCsCLKg==
X-Google-Smtp-Source: APiQypKLiJgRDf/jOzSxT9ddcH8Ih7DokQ2ghb53kPLaHSagGrlK2SQnkDIsWyAVV8sFeDVIIKAF6Q==
X-Received: by 2002:a17:90a:2281:: with SMTP id s1mr190292pjc.68.1588614644527;
        Mon, 04 May 2020 10:50:44 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id t3sm9402062pfq.110.2020.05.04.10.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 10:50:43 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     evgreen@chromium.org, swboyd@chromium.org, mka@chromium.org,
        mkshah@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/5] soc: qcom: rpmh-rsc: Simplify locking by eliminating the per-TCS lock
Date:   Mon,  4 May 2020 10:50:18 -0700
Message-Id: <20200504104917.v6.4.Ib8dccfdb10bf6b1fb1d600ca1c21d9c0db1ef746@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200504104917.v6.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
References: <20200504104917.v6.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The rpmh-rsc code had both a driver-level lock (sometimes referred to
in comments as drv->lock) and a lock per-TCS.  The idea was supposed
to be that there would be times where you could get by with just
locking a TCS lock and therefor other RPMH users wouldn't be blocked.

The above didn't work out so well.

Looking at tcs_write() the bigger drv->lock was held for most of the
function anyway.  Only the __tcs_buffer_write() and
__tcs_set_trigger() calls were called without holding the drv->lock.
It actually turns out that in tcs_write() we don't need to hold the
drv->lock for those function calls anyway even if the per-TCS lock
isn't there anymore.  From the newly added comments in the code, this
is because:
- We marked "tcs_in_use" under lock.
- Once "tcs_in_use" has been marked nobody else could be writing
  to these registers until the interrupt goes off.
- The interrupt can't go off until we trigger w/ the last line
  of __tcs_set_trigger().
Thus, from a tcs_write() point of view, the per-TCS lock was useless.

Looking at rpmh_rsc_write_ctrl_data(), only the per-TCS lock was held.
It turns out, though, that this function already needs to be called
with the equivalent of the drv->lock held anyway (we either need to
hold drv->lock as we will in a future patch or we need to know no
other CPUs could be running as happens today).  Specifically
rpmh_rsc_write_ctrl_data() might be writing to a TCS that has been
borrowed for writing an active transation but it never checks this.

Let's eliminate this extra overhead and avoid possible AB BA locking
headaches.

Suggested-by: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v6: None
Changes in v5:
- without it the => without holding the
- Copy why tcs_write() could release drv->lock early to commit msg.
- goto err => goto unlock
- Verbosify comment, saying trigger meant end of __tcs_set_trigger().

Changes in v4: None
Changes in v3:
- ("soc: qcom: rpmh-rsc: Simplify locking...") new for v3.

Changes in v2: None

 drivers/soc/qcom/rpmh-internal.h | 13 ++------
 drivers/soc/qcom/rpmh-rsc.c      | 55 +++++++++++++++-----------------
 2 files changed, 28 insertions(+), 40 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index dba8510c0669..1f2857b3f38e 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -28,7 +28,6 @@ struct rsc_drv;
  * @offset:    Start of the TCS group relative to the TCSes in the RSC.
  * @num_tcs:   Number of TCSes in this type.
  * @ncpt:      Number of commands in each TCS.
- * @lock:      Lock for synchronizing this TCS writes.
  * @req:       Requests that are sent from the TCS; only used for ACTIVE_ONLY
  *             transfers (could be on a wake/sleep TCS if we are borrowing for
  *             an ACTIVE_ONLY transfer).
@@ -48,7 +47,6 @@ struct tcs_group {
 	u32 offset;
 	int num_tcs;
 	int ncpt;
-	spinlock_t lock;
 	const struct tcs_request *req[MAX_TCS_PER_TYPE];
 	DECLARE_BITMAP(slots, MAX_TCS_SLOTS);
 };
@@ -103,14 +101,9 @@ struct rpmh_ctrlr {
  * @tcs_in_use:         S/W state of the TCS; only set for ACTIVE_ONLY
  *                      transfers, but might show a sleep/wake TCS in use if
  *                      it was borrowed for an active_only transfer.  You
- *                      must hold both the lock in this struct and the
- *                      tcs_lock for the TCS in order to mark a TCS as
- *                      in-use, but you only need the lock in this structure
- *                      (aka the drv->lock) to mark one freed.
- * @lock:               Synchronize state of the controller.  If you will be
- *                      grabbing this lock and a tcs_lock at the same time,
- *                      grab the tcs_lock first so we always have a
- *                      consistent lock ordering.
+ *                      must hold the lock in this struct (AKA drv->lock) in
+ *                      order to update this.
+ * @lock:               Synchronize state of the controller.
  * @pm_lock:            Synchronize during PM notifications.
  *                      Used when solver mode is not present.
  * @client:             Handle to the DRV's client.
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 298d4a003c1a..bf4c5f4ee07d 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -179,11 +179,7 @@ static void write_tcs_reg_sync(struct rsc_drv *drv, int reg, int tcs_id,
  *
  * Returns true if nobody has claimed this TCS (by setting tcs_in_use).
  *
- * Context: Must be called with the drv->lock held or the tcs_lock for the TCS
- *          being tested. If only the tcs_lock is held then it is possible that
- *          this function will return that a tcs is still busy when it has been
- *          recently been freed but it will never return free when a TCS is
- *          actually in use.
+ * Context: Must be called with the drv->lock held.
  *
  * Return: true if the given TCS is free.
  */
@@ -242,8 +238,6 @@ void rpmh_rsc_invalidate(struct rsc_drv *drv)
  * This is normally pretty straightforward except if we are trying to send
  * an ACTIVE_ONLY message but don't have any active_only TCSes.
  *
- * Called without drv->lock held and with no tcs_lock locks held.
- *
  * Return: A pointer to a tcs_group or an ERR_PTR.
  */
 static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
@@ -581,24 +575,19 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 	if (IS_ERR(tcs))
 		return PTR_ERR(tcs);
 
-	spin_lock_irqsave(&tcs->lock, flags);
-	spin_lock(&drv->lock);
+	spin_lock_irqsave(&drv->lock, flags);
 	/*
 	 * The h/w does not like if we send a request to the same address,
 	 * when one is already in-flight or being processed.
 	 */
 	ret = check_for_req_inflight(drv, tcs, msg);
-	if (ret) {
-		spin_unlock(&drv->lock);
-		goto done_write;
-	}
+	if (ret)
+		goto unlock;
 
-	tcs_id = find_free_tcs(tcs);
-	if (tcs_id < 0) {
-		ret = tcs_id;
-		spin_unlock(&drv->lock);
-		goto done_write;
-	}
+	ret = find_free_tcs(tcs);
+	if (ret < 0)
+		goto unlock;
+	tcs_id = ret;
 
 	tcs->req[tcs_id - tcs->offset] = msg;
 	set_bit(tcs_id, drv->tcs_in_use);
@@ -612,13 +601,22 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 		write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, 0);
 		enable_tcs_irq(drv, tcs_id, true);
 	}
-	spin_unlock(&drv->lock);
+	spin_unlock_irqrestore(&drv->lock, flags);
 
+	/*
+	 * These two can be done after the lock is released because:
+	 * - We marked "tcs_in_use" under lock.
+	 * - Once "tcs_in_use" has been marked nobody else could be writing
+	 *   to these registers until the interrupt goes off.
+	 * - The interrupt can't go off until we trigger w/ the last line
+	 *   of __tcs_set_trigger() below.
+	 */
 	__tcs_buffer_write(drv, tcs_id, 0, msg);
 	__tcs_set_trigger(drv, tcs_id, true);
 
-done_write:
-	spin_unlock_irqrestore(&tcs->lock, flags);
+	return 0;
+unlock:
+	spin_unlock_irqrestore(&drv->lock, flags);
 	return ret;
 }
 
@@ -673,8 +671,6 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
  * Only for use on sleep/wake TCSes since those are the only ones we maintain
  * tcs->slots for.
  *
- * Must be called with the tcs_lock for the group held.
- *
  * Return: -ENOMEM if there was no room, else 0.
  */
 static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
@@ -709,25 +705,25 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
  * This should only be called for for sleep/wake state, never active-only
  * state.
  *
+ * The caller must ensure that no other RPMH actions are happening and the
+ * controller is idle when this function is called since it runs lockless.
+ *
  * Return: 0 if no error; else -error.
  */
 int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
 {
 	struct tcs_group *tcs;
 	int tcs_id = 0, cmd_id = 0;
-	unsigned long flags;
 	int ret;
 
 	tcs = get_tcs_for_msg(drv, msg);
 	if (IS_ERR(tcs))
 		return PTR_ERR(tcs);
 
-	spin_lock_irqsave(&tcs->lock, flags);
 	/* find the TCS id and the command in the TCS to write to */
 	ret = find_slots(tcs, msg, &tcs_id, &cmd_id);
 	if (!ret)
 		__tcs_buffer_write(drv, tcs_id, cmd_id, msg);
-	spin_unlock_irqrestore(&tcs->lock, flags);
 
 	return ret;
 }
@@ -756,8 +752,8 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
 	 * should be checked for not busy, because we used wake TCSes for
 	 * active requests in this case.
 	 *
-	 * Since this is called from the last cpu, need not take drv or tcs
-	 * lock before checking tcs_is_free().
+	 * Since this is called from the last cpu, need not take drv->lock
+	 * before checking tcs_is_free().
 	 */
 	if (!tcs->num_tcs)
 		tcs = &drv->tcs[WAKE_TCS];
@@ -886,7 +882,6 @@ static int rpmh_probe_tcs_config(struct platform_device *pdev,
 		tcs->type = tcs_cfg[i].type;
 		tcs->num_tcs = tcs_cfg[i].n;
 		tcs->ncpt = ncpt;
-		spin_lock_init(&tcs->lock);
 
 		if (!tcs->num_tcs || tcs->type == CONTROL_TCS)
 			continue;
-- 
2.26.2.526.g744177e7f7-goog

