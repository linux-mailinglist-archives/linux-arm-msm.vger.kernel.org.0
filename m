Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE82E1B4FA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2020 23:55:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgDVVza (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Apr 2020 17:55:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgDVVza (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Apr 2020 17:55:30 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06FF6C03C1A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 14:55:30 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d24so1476447pll.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 14:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KtQzPrZ+vwce/bSxnGi4bn7K6J5NCLu1Fr1QTTaBT78=;
        b=EIluXLTHtPu3c5CaIMQkXgns139LyT7/kHAMIqCQKWAHxjR1ofPjBSSjrtsJAGnoaA
         DUtViwaUo1XzLtSamtsfNknRp9n0uIOJIbmEIW2Y0yXUDqKDUqUTVQS6PmUc8VWoi5+C
         +Fv1GRrInwz3THPc//eT6/KD8z60TuEgzYkak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KtQzPrZ+vwce/bSxnGi4bn7K6J5NCLu1Fr1QTTaBT78=;
        b=czKQBNa9wf94SBGD40CGrIn/dgRPuHBsADssXMDyZRLKFartDE+/AGipOFvvAPVQxQ
         TP0Kle9Zm6+3QVAmWOIbwiyZXUZJ2jzALlX/Q5uQ6epMGdCesEmPMiYF3H/da0vBQo0s
         zfDxec9yYefmTKeEdEPeCFgo/yj+1YgQnmokdihKfXYh0u6rSLsYvd6BKVTfk2+RDcQQ
         Q/+NWQjKnbhDmE6Fv5c52kPZ3GIfK66puYiZ2YjVINnql5SRY5XSi/+oFmVV0ehXbpKF
         3tOuqARmRJ1wEOMFYtH/l5C11yUXlPYxaDRek2YKn7oXlnN+a0T09S6+Me7wrdW/L07q
         s0BQ==
X-Gm-Message-State: AGi0PubmpUnVUlhzKRJDrxNXV8Ir1b//VjbzBEMrbf2rMW3u+GGIwCbj
        U01aA4uioGOkJES0jC316wDp9Q==
X-Google-Smtp-Source: APiQypK+MpCj9ipmidWDIOP3u/BEviX6atJDBnZjXe5XOv9yhGrwbLz+AE5XyX5h0cwaB1yFl2H3Eg==
X-Received: by 2002:a17:902:6b01:: with SMTP id o1mr802854plk.100.1587592529267;
        Wed, 22 Apr 2020 14:55:29 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id r4sm211072pgi.6.2020.04.22.14.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 14:55:28 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, swboyd@chromium.org, mkshah@codeaurora.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/5] soc: qcom: rpmh-rsc: Remove the pm_lock
Date:   Wed, 22 Apr 2020 14:55:03 -0700
Message-Id: <20200422145408.v4.5.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
References: <20200422145408.v4.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It has been postulated that the pm_lock is bad for performance because
a CPU currently running rpmh_flush() could block other CPUs from
coming out of idle.  Similarly CPUs coming out of / going into idle
all need to contend with each other for the spinlock just to update
the variable tracking who's in PM.

Let's optimize this a bit.  Specifically:

- Use a count rather than a bitmask.  This is faster to access and
  also means we can use the atomic_inc_return() function to really
  detect who the last one to enter PM was.
- Accept that it's OK if we race and are doing the flush (because we
  think we're last) while another CPU is coming out of idle.  As long
  as we block that CPU if/when it tries to do an active-only transfer
  we're OK.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Rebased atop split-out fixes.

Changes in v3:
- Rebased atop patch to get rid of per-TCS lock.
- Removed bogus comment in rpmh_flush().
- thelock => the lock.
- Do one last double-check to try to avoid returning NOTIFY_BAD.

Changes in v2:
- Always grab drv->lock first to ensure lock ordering.
- Grab the cache_lock in rpmh_flush().
- Comments about why num_online_cpus() is OK.
- Return NOTIFY_DONE for things we don't care about.
- Use trylock to avoid spinning in CPU_PM code.
- !rpmh_flush() should have been rpmh_flush(), so we were alwys failing.
- Account for CPU_PM_ENTER_FAILED not being called if we return NOTIFY_BAD.

 drivers/soc/qcom/rpmh-internal.h | 11 +++--
 drivers/soc/qcom/rpmh-rsc.c      | 72 ++++++++++++++++++++------------
 drivers/soc/qcom/rpmh.c          | 25 +++++++----
 3 files changed, 66 insertions(+), 42 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index 1f2857b3f38e..ef60e790a750 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -95,7 +95,7 @@ struct rpmh_ctrlr {
  * @num_tcs:            Number of TCSes in this DRV.
  * @rsc_pm:             CPU PM notifier for controller.
  *                      Used when solver mode is not present.
- * @cpus_entered_pm:    CPU mask for cpus in idle power collapse.
+ * @cpus_in_pm:         Number of CPUs not in idle power collapse.
  *                      Used when solver mode is not present.
  * @tcs:                TCS groups.
  * @tcs_in_use:         S/W state of the TCS; only set for ACTIVE_ONLY
@@ -103,9 +103,9 @@ struct rpmh_ctrlr {
  *                      it was borrowed for an active_only transfer.  You
  *                      must hold the lock in this struct (AKA drv->lock) in
  *                      order to update this.
- * @lock:               Synchronize state of the controller.
- * @pm_lock:            Synchronize during PM notifications.
- *                      Used when solver mode is not present.
+ * @lock:               Synchronize state of the controller.  If RPMH's cache
+ *                      lock will also be held, the order is: drv->lock then
+ *                      cache_lock.
  * @client:             Handle to the DRV's client.
  */
 struct rsc_drv {
@@ -114,11 +114,10 @@ struct rsc_drv {
 	int id;
 	int num_tcs;
 	struct notifier_block rsc_pm;
-	struct cpumask cpus_entered_pm;
+	atomic_t cpus_in_pm;
 	struct tcs_group tcs[TCS_TYPE_NR];
 	DECLARE_BITMAP(tcs_in_use, MAX_TCS_NR);
 	spinlock_t lock;
-	spinlock_t pm_lock;
 	struct rpmh_ctrlr client;
 };
 
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 71cebe7fd452..060be10bc491 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -736,6 +736,8 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
  * SLEEP and WAKE sets. If AMCs are busy, controller can not enter
  * power collapse, so deny from the last cpu's pm notification.
  *
+ * Context: Must be called with the drv->lock held.
+ *
  * Return:
  * * False		- AMCs are idle
  * * True		- AMCs are busy
@@ -750,9 +752,6 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
 	 * dedicated TCS for active state use, then re-purposed wake TCSes
 	 * should be checked for not busy, because we used wake TCSes for
 	 * active requests in this case.
-	 *
-	 * Since this is called from the last cpu, need not take drv->lock
-	 * before checking tcs_is_free().
 	 */
 	if (!tcs->num_tcs)
 		tcs = &drv->tcs[WAKE_TCS];
@@ -787,42 +786,62 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
 {
 	struct rsc_drv *drv = container_of(nfb, struct rsc_drv, rsc_pm);
 	int ret = NOTIFY_OK;
-
-	spin_lock(&drv->pm_lock);
+	int cpus_in_pm;
 
 	switch (action) {
 	case CPU_PM_ENTER:
-		cpumask_set_cpu(smp_processor_id(), &drv->cpus_entered_pm);
-
-		if (!cpumask_equal(&drv->cpus_entered_pm, cpu_online_mask))
-			goto exit;
+		cpus_in_pm = atomic_inc_return(&drv->cpus_in_pm);
+		/*
+		 * NOTE: comments for num_online_cpus() point out that it's
+		 * only a snapshot so we need to be careful. It should be OK
+		 * for us to use, though.  It's important for us not to miss
+		 * if we're the last CPU going down so it would only be a
+		 * problem if a CPU went offline right after we did the check
+		 * AND that CPU was not idle AND that CPU was the last non-idle
+		 * CPU. That can't happen. CPUs would have to come out of idle
+		 * before the CPU could go offline.
+		 */
+		if (cpus_in_pm < num_online_cpus())
+			return NOTIFY_OK;
 		break;
 	case CPU_PM_ENTER_FAILED:
 	case CPU_PM_EXIT:
-		cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_pm);
-		goto exit;
+		atomic_dec(&drv->cpus_in_pm);
+		return NOTIFY_OK;
 	default:
 		return NOTIFY_DONE;
 	}
 
-	ret = rpmh_rsc_ctrlr_is_busy(drv);
-	if (ret) {
-		ret = NOTIFY_BAD;
-		goto exit;
+	/*
+	 * It's likely we're on the last CPU. Grab the drv->lock and write
+	 * out the sleep/wake commands to RPMH hardware. Grabbing the lock
+	 * means that if we race with another CPU coming up we are still
+	 * guaranteed to be safe. If another CPU came up just after we checked
+	 * and has grabbed the lock or started an active transfer then we'll
+	 * notice we're busy and abort. If another CPU comes up after we start
+	 * flushing it will be blocked from starting an active transfer until
+	 * we're done flushing. If another CPU starts an active transfer after
+	 * we release the lock we're still OK because we're no longer the last
+	 * CPU.
+	 */
+	if (spin_trylock(&drv->lock)) {
+		if (rpmh_rsc_ctrlr_is_busy(drv) || rpmh_flush(&drv->client))
+			ret = NOTIFY_BAD;
+		spin_unlock(&drv->lock);
+	} else {
+		/* Another CPU must be up */
+		return NOTIFY_OK;
 	}
 
-	ret = rpmh_flush(&drv->client);
-	if (ret)
-		ret = NOTIFY_BAD;
-	else
-		ret = NOTIFY_OK;
-
-exit:
-	if (ret == NOTIFY_BAD)
-		/* We won't be called w/ CPU_PM_ENTER_FAILED */
-		cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_pm);
+	if (ret == NOTIFY_BAD) {
+		/* Double-check if we're here because someone else is up */
+		if (cpus_in_pm < num_online_cpus())
+			ret = NOTIFY_OK;
+		else
+			/* We won't be called w/ CPU_PM_ENTER_FAILED */
+			atomic_dec(&drv->cpus_in_pm);
+	}
 
-	spin_unlock(&drv->pm_lock);
 	return ret;
 }
 
@@ -965,7 +984,6 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	solver_config = solver_config >> DRV_HW_SOLVER_SHIFT;
 	if (!solver_config) {
 		drv->rsc_pm.notifier_call = rpmh_rsc_cpu_pm_callback;
-		spin_lock_init(&drv->pm_lock);
 		cpu_pm_register_notifier(&drv->rsc_pm);
 	}
 
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index d1626a1328d7..f2b5b46ccd1f 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -435,9 +435,6 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
  *
  * @ctrlr: Controller making request to flush cached data
  *
- * This function is called from sleep code on the last CPU
- * (thus no spinlock needed).
- *
  * Return:
  * * 0          - Success
  * * Error code - Otherwise
@@ -445,13 +442,21 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
 int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 {
 	struct cache_req *p;
-	int ret;
+	int ret = 0;
 
 	lockdep_assert_irqs_disabled();
 
+	/*
+	 * Currently rpmh_flush() is only called when we think we're running
+	 * on the last processor.  If the lock is busy it means another
+	 * processor is up and it's better to abort than spin.
+	 */
+	if (!spin_trylock(&ctrlr->cache_lock))
+		return -EBUSY;
+
 	if (!ctrlr->dirty) {
 		pr_debug("Skipping flush, TCS has latest data.\n");
-		return 0;
+		goto exit;
 	}
 
 	/* Invalidate the TCSes first to avoid stale data */
@@ -460,7 +465,7 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 	/* First flush the cached batch requests */
 	ret = flush_batch(ctrlr);
 	if (ret)
-		return ret;
+		goto exit;
 
 	list_for_each_entry(p, &ctrlr->cache, list) {
 		if (!is_req_valid(p)) {
@@ -471,16 +476,18 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 		ret = send_single(ctrlr, RPMH_SLEEP_STATE, p->addr,
 				  p->sleep_val);
 		if (ret)
-			return ret;
+			goto exit;
 		ret = send_single(ctrlr, RPMH_WAKE_ONLY_STATE, p->addr,
 				  p->wake_val);
 		if (ret)
-			return ret;
+			goto exit;
 	}
 
 	ctrlr->dirty = false;
 
-	return 0;
+exit:
+	spin_unlock(&ctrlr->cache_lock);
+	return ret;
 }
 
 /**
-- 
2.26.1.301.g55bc3eb7cb9-goog

