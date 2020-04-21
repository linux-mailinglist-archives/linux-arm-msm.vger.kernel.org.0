Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B34E1B2E4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 19:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgDUR3z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 13:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726378AbgDUR3u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 13:29:50 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D583BC061BD3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 10:29:50 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t16so5489627plo.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2020 10:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9rz6rrT6JS8gYjAobTtkYKP4z/sTny8QWqFoZElORnw=;
        b=EBRtV21IlL6LgpAascZ0qEd/iwHnkvajsKftBGT9dkMt2qh4djdfS5byXkgme35b2X
         x0A8sWm8yjqXu76q+PCDCml87tYS1gf4GOc13TKbosjzVnlXP++oyBHRaNREiL8owwkm
         vHn3RcgIb/VX03Yh31EnwqqF++pV1MVFc0L34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9rz6rrT6JS8gYjAobTtkYKP4z/sTny8QWqFoZElORnw=;
        b=loOL40V317eGMcSGyT5hh9Ku2ykkfik0scXvfHZnaEVQGoXDhCPr1/IBgPe4iw38Kl
         S5yPhWGFDQng0DpIMvLieWa2n9B3OtY4ngJDF1LwCVMPuKV1Ip7rTsJY3friUZEl6I0U
         dO1YOQRk2iP8ssDnWi5Y3wCHxyvDe0YHEJhHn2R7QPFZAaA6GtFMH87fDRklo7IfjXL3
         efx741UUYUpRvfBP4ZR1Cae8ZzDj9dNBwdSVKceyRJtOe5+n4WykIdvUK9jVzkNSz5kP
         Y8N+RccParsOfwgKmO3FJyK+pIAfC00DCTP9UyR1sJq+a5GaiBT53iFfksmynuT4yK26
         jUbw==
X-Gm-Message-State: AGi0Pua+9OG4y9ObOSoes9WhMOAqf4cdcujC6729euFP/0RkV8mm8fbJ
        fsV3LkCQTNnKiI07X2XxnRIX1yAy7B0mPA==
X-Google-Smtp-Source: APiQypJkr9V3JpyUMxdLmmas3PwNv9yxm81ERtQmpZ5jI9NNajrFSr6az47FhGo+DqAvQsiyc+zS+Q==
X-Received: by 2002:a17:902:904a:: with SMTP id w10mr17503360plz.17.1587490190199;
        Tue, 21 Apr 2020 10:29:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id v127sm2874816pfv.77.2020.04.21.10.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 10:29:49 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rafael.j.wysocki@intel.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mkshah@codeaurora.org, swboyd@chromium.org, mka@chromium.org,
        evgreen@chromium.org, Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] soc: qcom: rpmh-rsc: Remove the pm_lock
Date:   Tue, 21 Apr 2020 10:29:08 -0700
Message-Id: <20200421102745.v3.3.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid>
X-Mailer: git-send-email 2.26.1.301.g55bc3eb7cb9-goog
In-Reply-To: <20200421102745.v3.1.I2d44fc0053d019f239527a4e5829416714b7e299@changeid>
References: <20200421102745.v3.1.I2d44fc0053d019f239527a4e5829416714b7e299@changeid>
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
 drivers/soc/qcom/rpmh-rsc.c      | 70 +++++++++++++++++++++-----------
 drivers/soc/qcom/rpmh.c          | 25 ++++++++----
 3 files changed, 68 insertions(+), 38 deletions(-)

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
index 992c79920e69..060be10bc491 100644
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
@@ -787,36 +786,62 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
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
+	if (ret == NOTIFY_BAD) {
+		/* Double-check if we're here because someone else is up */
+		if (cpus_in_pm < num_online_cpus())
+			ret = NOTIFY_OK;
+		else
+			/* We won't be called w/ CPU_PM_ENTER_FAILED */
+			atomic_dec(&drv->cpus_in_pm);
+	}
 
-exit:
-	spin_unlock(&drv->pm_lock);
 	return ret;
 }
 
@@ -959,7 +984,6 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
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

