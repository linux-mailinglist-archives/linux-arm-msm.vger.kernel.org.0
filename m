Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60EFA1B2E4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 19:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726709AbgDUR3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 13:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725930AbgDUR3t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 13:29:49 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0E1C0610D5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 10:29:49 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id v63so475472pfb.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 10:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SazG4WFAeC3QfLHqe6GAARwPa7vGsUvjsWRd+613Rn8=;
        b=HMGCiqdHU+FAvRLiD3j5pJLKHXONEYE5n4mL/1oFN3tN/m2w/DYMg/TomWxSJbZ747
         j/1qO7W8L5wIRLl8HhmQRi9IlYM6PmGNGq5775cJ3WJrCrEJiXZr2YcFNXao6hSbLTYR
         Oehw+POVvkCIeQI4E6Hx/57ejYEq4X2DAxlSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SazG4WFAeC3QfLHqe6GAARwPa7vGsUvjsWRd+613Rn8=;
        b=VHc6ySbpciH+Gdeh70EyX1KVRbX39KOjGajN22UVEW1GSSklU6EGkAkBihoMEkMdaW
         mA4Gv+SpbVRUJ0Ee0oCjUyXg4Qp106Ph9oFPL4ha//W/ydvF6tZOF/s1G8OZ3Xyn33o2
         tQnd/OHT586GV30N90WRFEFiPLq/Nl7fd/wLq0iEpLQTLzoqemw9Jn0KFisrxBCHusgX
         Gv1S6zWzo9Z1zIg3VWAzh+sT/OeRJ4hZ79h7R7HBzz9JiRgYbgIFVVbQ/0LAIWU5P3q4
         /MiRB/Onu0Rr/LBY//TW3zP6NSrdXfwAUwFiBsC9QcO4ZSC3RUgdS8dgEXG8DnlsIeZP
         SFfQ==
X-Gm-Message-State: AGi0Pua5hJNYp6V9XtZ/y22u1Z/inDHSYRZhGs0jAYODBwRFOLZ+uvhx
        Uivvf/VFk5XKcoDsRw9eyBNzFA==
X-Google-Smtp-Source: APiQypKBXHnf7R5vi1eJXkk3Gbjk67wYrsre0XjrI8aqqokyYltfhiJRffuFU2FEShsKlGJYz3XGYg==
X-Received: by 2002:a63:1a16:: with SMTP id a22mr23192709pga.264.1587490189029;
        Tue, 21 Apr 2020 10:29:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id v127sm2874816pfv.77.2020.04.21.10.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 10:29:48 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mkshah@codeaurora.org, swboyd@chromium.org, mka@chromium.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] soc: qcom: rpmh-rsc: Simplify locking by eliminating the per-TCS lock
Date:   Tue, 21 Apr 2020 10:29:07 -0700
Message-Id: <20200421102745.v3.2.Ib8dccfdb10bf6b1fb1d600ca1c21d9c0db1ef746@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421102745.v3.1.I2d44fc0053d019f239527a4e5829416714b7e299@changeid>
References: <20200421102745.v3.1.I2d44fc0053d019f239527a4e5829416714b7e299@changeid>
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
__tcs_set_trigger() calls were called without it the drv->lock.  It
actually turns out that in tcs_write() we don't need to hold the
drv->lock for those function calls anyway even if the per-TCS lock
isn't there anymore.  Thus, from a tcs_write() point of view, the
per-TCS lock was useless.

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
---

Changes in v3:
- ("soc: qcom: rpmh-rsc: Simplify locking...") new for v3.

Changes in v2: None

 drivers/soc/qcom/rpmh-internal.h | 13 ++------
 drivers/soc/qcom/rpmh-rsc.c      | 54 ++++++++++++++------------------
 2 files changed, 27 insertions(+), 40 deletions(-)

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
index a9e15699f55f..992c79920e69 100644
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
+		goto err;
 
-	tcs_id = find_free_tcs(tcs);
-	if (tcs_id < 0) {
-		ret = tcs_id;
-		spin_unlock(&drv->lock);
-		goto done_write;
-	}
+	ret = find_free_tcs(tcs);
+	if (ret < 0)
+		goto err;
+	tcs_id = ret;
 
 	tcs->req[tcs_id - tcs->offset] = msg;
 	set_bit(tcs_id, drv->tcs_in_use);
@@ -612,13 +601,21 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
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
+	 * - The interrupt can't go off until we trigger.
+	 */
 	__tcs_buffer_write(drv, tcs_id, 0, msg);
 	__tcs_set_trigger(drv, tcs_id, true);
 
-done_write:
-	spin_unlock_irqrestore(&tcs->lock, flags);
+	return 0;
+err:
+	spin_unlock_irqrestore(&drv->lock, flags);
 	return ret;
 }
 
@@ -673,8 +670,6 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
  * Only for use on sleep/wake TCSes since those are the only ones we maintain
  * tcs->slots for.
  *
- * Must be called with the tcs_lock for the group held.
- *
  * Return: -ENOMEM if there was no room, else 0.
  */
 static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
@@ -709,25 +704,25 @@ static int find_slots(struct tcs_group *tcs, const struct tcs_request *msg,
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
@@ -756,8 +751,8 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
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
@@ -879,7 +874,6 @@ static int rpmh_probe_tcs_config(struct platform_device *pdev,
 		tcs->type = tcs_cfg[i].type;
 		tcs->num_tcs = tcs_cfg[i].n;
 		tcs->ncpt = ncpt;
-		spin_lock_init(&tcs->lock);
 
 		if (!tcs->num_tcs || tcs->type == CONTROL_TCS)
 			continue;
-- 
2.26.1.301.g55bc3eb7cb9-goog

