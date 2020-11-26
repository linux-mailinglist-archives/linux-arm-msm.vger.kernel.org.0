Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BD92C51F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 11:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387851AbgKZKTC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 05:19:02 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:10880 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387692AbgKZKTC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 05:19:02 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606385941; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=OjEE2fQz+mShxwnREioiMJDo4aCYGC1JU+LVyLbVZKI=; b=d5Vp1f5xgjjItJUuJ/OTYXBs1E06wr5toHJKoTZ+5W4t3FeXJkO/98Sv2eSp26UFQmR6dtlX
 MAn2ieV/tL+Dvdo11qVEB0Bf2b82TSqnBQXztrvyLcs4h8IRJNcPupflQAb0Q8Q+/P1DKOSo
 4dCP/AU+c29ramtdyurRp+txeqs=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fbf810e4146c5eefd1be52e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Nov 2020 10:18:54
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 36990C43461; Thu, 26 Nov 2020 10:18:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6C9A8C433ED;
        Thu, 26 Nov 2020 10:18:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6C9A8C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, andy.gross@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        tkjos@google.com, dianders@chromium.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH 3/3] soc: qcom: rpmh: Conditionally check lockdep_assert_irqs_disabled()
Date:   Thu, 26 Nov 2020 15:48:18 +0530
Message-Id: <1606385898-8609-4-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606385898-8609-1-git-send-email-mkshah@codeaurora.org>
References: <1606385898-8609-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

lockdep_assert_irqs_disabled() was added to check rpmh_flush()
can only be invoked when irqs are disabled, this is true for
APPS RSC as the last CPU going to deepest low power mode is
writing sleep and wake TCSes.

However for RSCs that support solver mode, drivers can invoke
rpmh_write_sleep_and_wake() to immediately write cached sleep
and wake sets to TCSes from any CPU. Conditionally check if RSC
controller supports 'HW solver' mode then do not check for irqs
disabled as such RSCs can write sleepand wake TCSes at any point.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/rpmh-internal.h |  5 +++++
 drivers/soc/qcom/rpmh-rsc.c      |  3 +++
 drivers/soc/qcom/rpmh.c          | 26 ++++++++++++++++++++++----
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index 79486d6..39fa3c5 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -17,6 +17,9 @@
 #define MAX_TCS_NR			(MAX_TCS_PER_TYPE * TCS_TYPE_NR)
 #define MAX_TCS_SLOTS			(MAX_CMDS_PER_TCS * MAX_TCS_PER_TYPE)
 
+/* CTRLR specific flags */
+#define SOLVER_PRESENT			1
+
 struct rsc_drv;
 
 /**
@@ -78,6 +81,7 @@ struct rpmh_request {
  * @cache_lock: synchronize access to the cache data
  * @dirty: was the cache updated since flush
  * @in_solver_mode: Controller is busy in solver mode
+ * @flags: Controller specific flags
  * @batch_cache: Cache sleep and wake requests sent as batch
  */
 struct rpmh_ctrlr {
@@ -85,6 +89,7 @@ struct rpmh_ctrlr {
 	spinlock_t cache_lock;
 	bool dirty;
 	bool in_solver_mode;
+	u32 flags;
 	struct list_head batch_cache;
 };
 
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index ffb4ca7..4caaddf 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -1031,6 +1031,9 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
 	if (!solver_config) {
 		drv->rsc_pm.notifier_call = rpmh_rsc_cpu_pm_callback;
 		cpu_pm_register_notifier(&drv->rsc_pm);
+		drv->client.flags &= ~SOLVER_PRESENT;
+	} else {
+		drv->client.flags |= SOLVER_PRESENT;
 	}
 
 	/* Enable the active TCS to send requests immediately */
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 725b8f0..604d511 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -83,6 +83,9 @@ static int check_ctrlr_state(struct rpmh_ctrlr *ctrlr, enum rpmh_state state)
 	if (state != RPMH_ACTIVE_ONLY_STATE)
 		return ret;
 
+	if (!(ctrlr->flags & SOLVER_PRESENT))
+		return ret;
+
 	/* Do not allow sending active votes when in solver mode */
 	spin_lock(&ctrlr->cache_lock);
 	if (ctrlr->in_solver_mode)
@@ -468,12 +471,24 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 	struct cache_req *p;
 	int ret = 0;
 
-	lockdep_assert_irqs_disabled();
+	/*
+	 * For RSC that don't have solver mode,
+	 * rpmh_flush() is only called when we think we're running
+	 * on the last CPU with irqs_disabled.
+	 *
+	 * For RSC that have solver mode,
+	 * rpmh_flush() can be invoked with irqs enabled by any CPU.
+	 *
+	 * Conditionally check for irqs_disabled only when solver mode
+	 * is not available.
+	 */
+
+	if (!(ctrlr->flags & SOLVER_PRESENT))
+		lockdep_assert_irqs_disabled();
 
 	/*
-	 * Currently rpmh_flush() is only called when we think we're running
-	 * on the last processor.  If the lock is busy it means another
-	 * processor is up and it's better to abort than spin.
+	 * If the lock is busy it means another transaction is on going,
+	 * in such case it's better to abort than spin.
 	 */
 	if (!spin_trylock(&ctrlr->cache_lock))
 		return -EBUSY;
@@ -568,6 +583,9 @@ int rpmh_mode_solver_set(const struct device *dev, bool enable)
 	int ret;
 	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
 
+	if (!(ctrlr->flags & SOLVER_PRESENT))
+		return -EINVAL;
+
 	spin_lock(&ctrlr->cache_lock);
 	ret = rpmh_rsc_mode_solver_set(ctrlr_to_drv(ctrlr), enable);
 	if (!ret)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

