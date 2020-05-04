Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE051C434C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 19:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730509AbgEDRus (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 13:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730103AbgEDRur (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 13:50:47 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A435DC061A10
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 10:50:46 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 18so5893123pfv.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2020 10:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xw4h437qvLy2mYjj+MQBwz4pxDYWlSxmhi/ZXfl3fCQ=;
        b=I+F4nyILjXhX/88Bu7YZiKc3sqkEuRpdkt2O3hFIoCP5bhMrxFv0YuXNOUQiO10i9H
         twEdJXFKKRHxexrmxK6C574k3Fsp0e8IE6oMh9CyJ8R+h1uurc0bRs4kaPk12+jZNCMw
         4t9NXaIZBjf0UVxdJI0DEbImSYLH4Rd4FehPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xw4h437qvLy2mYjj+MQBwz4pxDYWlSxmhi/ZXfl3fCQ=;
        b=kA9Pk7VFJNDW0y4TyUO9v1Oth9IKpk5NrabyyyOihija/mDfythCOvGbXT9p+QerhO
         /aNd4+n+hCpYOFG6G6hAbeB4/auRNMCS7BXCeVpVU+zFtn5JclvODiN9hVf3XhwgSQbd
         TDPPiiUAbQbnQBVrF7s4FwPtgWIqA2cFh7K8+JCdGdnk1wX2KApP7XKesRpJqha3MCL2
         xLo4p5Bbrugj2G/551IRMTsmokrPA2tBTdzLXGJ9BCrwzKkDBy+ft3DHZndoFPTefTcA
         dJV+ix/j3PZHk0xhtxMlOpLrAidcbc+c7ytH4GahQikAJIq7IKaqJMh6/9mdNE8W8jQI
         2mpg==
X-Gm-Message-State: AGi0PuZG/c5xOVXMtuDPWUF48Ijqu1N91gsA62koVxuHEm0o6dlYNvMF
        aEI67qQl6fagVtgJCGZcEIdTfA==
X-Google-Smtp-Source: APiQypKzFG8D0Fin0M/3FShFTnJ6U+aTxrBd4TIZoftPVQu9mfxx4bIDXI3eG16K6tKNxliaG5zffg==
X-Received: by 2002:a63:f853:: with SMTP id v19mr116744pgj.342.1588614645748;
        Mon, 04 May 2020 10:50:45 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id t3sm9402062pfq.110.2020.05.04.10.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 10:50:45 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     evgreen@chromium.org, swboyd@chromium.org, mka@chromium.org,
        mkshah@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 5/5] soc: qcom: rpmh-rsc: Remove the pm_lock
Date:   Mon,  4 May 2020 10:50:19 -0700
Message-Id: <20200504104917.v6.5.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
In-Reply-To: <20200504104917.v6.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
References: <20200504104917.v6.1.Ic7096b3b9b7828cdd41cd5469a6dee5eb6abf549@changeid>
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
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v6: None
Changes in v5: None
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
 drivers/soc/qcom/rpmh-rsc.c      | 75 ++++++++++++++++++++------------
 drivers/soc/qcom/rpmh.c          | 25 +++++++----
 3 files changed, 67 insertions(+), 44 deletions(-)

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
index bf4c5f4ee07d..571aa1012f23 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -737,6 +737,8 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
  * SLEEP and WAKE sets. If AMCs are busy, controller can not enter
  * power collapse, so deny from the last cpu's pm notification.
  *
+ * Context: Must be called with the drv->lock held.
+ *
  * Return:
  * * False		- AMCs are idle
  * * True		- AMCs are busy
@@ -751,9 +753,6 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
 	 * dedicated TCS for active state use, then re-purposed wake TCSes
 	 * should be checked for not busy, because we used wake TCSes for
 	 * active requests in this case.
-	 *
-	 * Since this is called from the last cpu, need not take drv->lock
-	 * before checking tcs_is_free().
 	 */
 	if (!tcs->num_tcs)
 		tcs = &drv->tcs[WAKE_TCS];
@@ -788,43 +787,62 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
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
-		ret = NOTIFY_DONE;
-		goto exit;
+		return NOTIFY_DONE;
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
 
@@ -967,7 +985,6 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
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
2.26.2.526.g744177e7f7-goog

