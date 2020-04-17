Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BEDC1AD3A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2020 02:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728095AbgDQAc2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 20:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725858AbgDQAc1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 20:32:27 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18807C061A0F
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 17:32:27 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id g6so229317pgs.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 17:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O5M7k9W0OZBs6fPGDG0Yd8nXmD/8Hb/zPUrWgfttv7A=;
        b=be00fdjpL+KdtUrMjjlPYyNs83xj0lGoIq//rekuBpaVs+citV7fWm6S0A+4sG4GWk
         yx8DpwM1Vj0X/c/ZeqkkEJJJe2V+n1yc0pqTUFEfiAwY/e+iZoOGNSOCSd0o5FsIlwAD
         pLj0/EgI/0ti5w5VD10Ofe3JeqcaX6tpkyA+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O5M7k9W0OZBs6fPGDG0Yd8nXmD/8Hb/zPUrWgfttv7A=;
        b=CBRHUdnongYYmLrBNV1R0zdMkgfl73vcGFOQFBjvjGkdzw6+MhkjEwdh075HTj3TDF
         il/Xclb3Lhp4jV5A9XuuIY1MlbBPsgEM2A5UylfxMfd9+T7Ykz7WKVuLxDZM3OzHjvyp
         66hcQ/h/yr9EQ39NsIFnJ7ZPR8c1Rm0ATgCVVyo1XzszBRKr9hrjcCDWZ5FDBqauHc60
         ZrHXZm9DBzi69vAJ2wVNp5IdxZRo+9FhVVWpGvQcYisCaI80t0bqe6hAlEqiZ5CYVxYH
         qpW/94H+X9DogSDMj60veTJTNDourTENv1TzdeDOYMSCgtVEa33CAWERzTB9wsL3eWlt
         5S0g==
X-Gm-Message-State: AGi0PuYxApeYwTkuYkD3u1J/zfhhT8Puba29dtvtzvf1BL3aY67gGMOT
        KjLoNhf2BOQj1poVwEXigmwIAw==
X-Google-Smtp-Source: APiQypIyVbweRxps1eFrtcIdnDGT85JazN+lRBCqVD8AaYPz9SRZBy012T5fn+arH3gfDK61IGqvsg==
X-Received: by 2002:a62:f252:: with SMTP id y18mr493442pfl.3.1587083546107;
        Thu, 16 Apr 2020 17:32:26 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id 18sm18090658pfv.118.2020.04.16.17.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2020 17:32:25 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mkshah@codeaurora.org, evgreen@chromium.org, swboyd@chromium.org,
        mka@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] soc: qcom: rpmh-rsc: Remove the pm_lock
Date:   Thu, 16 Apr 2020 17:32:00 -0700
Message-Id: <20200416173145.v2.2.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200416173145.v2.1.I2d44fc0053d019f239527a4e5829416714b7e299@changeid>
References: <20200416173145.v2.1.I2d44fc0053d019f239527a4e5829416714b7e299@changeid>
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

Changes in v2:
- Always grab drv->lock first to ensure lock ordering.
- Grab the cache_lock in rpmh_flush().
- Comments about why num_online_cpus() is OK.
- Return NOTIFY_DONE for things we don't care about.
- Use trylock to avoid spinning in CPU_PM code.
- !rpmh_flush() should have been rpmh_flush(), so we were alwys failing.
- Account for CPU_PM_ENTER_FAILED not being called if we return NOTIFY_BAD.

 drivers/soc/qcom/rpmh-internal.h | 13 +++---
 drivers/soc/qcom/rpmh-rsc.c      | 75 ++++++++++++++++++++++----------
 drivers/soc/qcom/rpmh.c          | 22 +++++++---
 3 files changed, 73 insertions(+), 37 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index dba8510c0669..f378c0f5e66d 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -97,7 +97,7 @@ struct rpmh_ctrlr {
  * @num_tcs:            Number of TCSes in this DRV.
  * @rsc_pm:             CPU PM notifier for controller.
  *                      Used when solver mode is not present.
- * @cpus_entered_pm:    CPU mask for cpus in idle power collapse.
+ * @cpus_in_pm:         Number of CPUs not in idle power collapse.
  *                      Used when solver mode is not present.
  * @tcs:                TCS groups.
  * @tcs_in_use:         S/W state of the TCS; only set for ACTIVE_ONLY
@@ -109,10 +109,10 @@ struct rpmh_ctrlr {
  *                      (aka the drv->lock) to mark one freed.
  * @lock:               Synchronize state of the controller.  If you will be
  *                      grabbing this lock and a tcs_lock at the same time,
- *                      grab the tcs_lock first so we always have a
- *                      consistent lock ordering.
- * @pm_lock:            Synchronize during PM notifications.
- *                      Used when solver mode is not present.
+ *                      grab the this lock first so we always have a
+ *                      consistent lock ordering.  If RPMH's cache lock will
+ *                      also be held, the order is: drv->lock, cache_lock,
+ *                      tcs_lock.
  * @client:             Handle to the DRV's client.
  */
 struct rsc_drv {
@@ -121,11 +121,10 @@ struct rsc_drv {
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
index a9e15699f55f..5ef4dd9c72ae 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -581,8 +581,9 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 	if (IS_ERR(tcs))
 		return PTR_ERR(tcs);
 
-	spin_lock_irqsave(&tcs->lock, flags);
+	local_irq_save(flags);
 	spin_lock(&drv->lock);
+	spin_lock(&tcs->lock);
 	/*
 	 * The h/w does not like if we send a request to the same address,
 	 * when one is already in-flight or being processed.
@@ -612,13 +613,20 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
 		write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, 0);
 		enable_tcs_irq(drv, tcs_id, true);
 	}
+
+	/*
+	 * Though we grabbed drv->lock first (to keep lock ordering consistent),
+	 * we release it first.  This is fine as long as we don't try to grab
+	 * it again until we release our tcs->lock.
+	 */
 	spin_unlock(&drv->lock);
 
 	__tcs_buffer_write(drv, tcs_id, 0, msg);
 	__tcs_set_trigger(drv, tcs_id, true);
 
 done_write:
-	spin_unlock_irqrestore(&tcs->lock, flags);
+	spin_unlock(&tcs->lock);
+	local_irq_restore(flags);
 	return ret;
 }
 
@@ -741,6 +749,8 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
  * SLEEP and WAKE sets. If AMCs are busy, controller can not enter
  * power collapse, so deny from the last cpu's pm notification.
  *
+ * Context: Must be called with the drv->lock held.
+ *
  * Return:
  * * False		- AMCs are idle
  * * True		- AMCs are busy
@@ -755,9 +765,6 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
 	 * dedicated TCS for active state use, then re-purposed wake TCSes
 	 * should be checked for not busy, because we used wake TCSes for
 	 * active requests in this case.
-	 *
-	 * Since this is called from the last cpu, need not take drv or tcs
-	 * lock before checking tcs_is_free().
 	 */
 	if (!tcs->num_tcs)
 		tcs = &drv->tcs[WAKE_TCS];
@@ -792,36 +799,57 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
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
+	default:
+		return NOTIFY_DONE;
 	}
 
-	ret = rpmh_rsc_ctrlr_is_busy(drv);
-	if (ret) {
+	/*
+	 * It's likely we're on the last CPU. Grab the drv->lock and write
+	 * out the sleep/wake commands to RPMH hardware. Grabbing the lock
+	 * means that if we race with another CPU coming up we are still
+	 * guaranteed to be safe. If another CPU came up just after we checked
+	 * and has grabbed thelock or started an active transfer then we'll
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
 		ret = NOTIFY_BAD;
-		goto exit;
 	}
 
-	ret = rpmh_flush(&drv->client);
-	if (ret)
-		ret = NOTIFY_BAD;
-	else
-		ret = NOTIFY_OK;
+	/* If we reject we won't be called w/ CPU_PM_ENTER_FAILED */
+	if (ret == NOTIFY_BAD)
+		atomic_dec(&drv->cpus_in_pm);
 
-exit:
-	spin_unlock(&drv->pm_lock);
 	return ret;
 }
 
@@ -965,7 +993,6 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	solver_config = solver_config >> DRV_HW_SOLVER_SHIFT;
 	if (!solver_config) {
 		drv->rsc_pm.notifier_call = rpmh_rsc_cpu_pm_callback;
-		spin_lock_init(&drv->pm_lock);
 		cpu_pm_register_notifier(&drv->rsc_pm);
 	}
 
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 3abbb08cd6e1..3ba08bd14fa2 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -445,13 +445,21 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
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
@@ -460,7 +468,7 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 	/* First flush the cached batch requests */
 	ret = flush_batch(ctrlr);
 	if (ret)
-		return ret;
+		goto exit;
 
 	list_for_each_entry(p, &ctrlr->cache, list) {
 		if (!is_req_valid(p)) {
@@ -471,16 +479,18 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
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

