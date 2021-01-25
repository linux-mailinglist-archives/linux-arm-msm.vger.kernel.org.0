Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A715302231
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 07:43:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbhAYGmu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 01:42:50 -0500
Received: from a1.mail.mailgun.net ([198.61.254.60]:34409 "EHLO
        a1.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbhAYGWJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 01:22:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611555689; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=A575rBuWWTIMOtrYPVjJaiHGzO6AU6bUAjGofeZOHKM=; b=ehFTHA2nBGMnvMOJbFKfeeLuIQClthyizMV0X3cD1WF+0/K186/oRm/ZY13ZVhzKrPO0c1ET
 xLVR8uRDBMLFiVdK1wD0bqmV9vG7elgsDZdPgCRP3R6DoLhr0Mon5Rbc34V4N0ir2lnfGxOc
 GiiWrKutxy2O15sOrjES/Z7PBEs=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 600e6345fb02735e8c9e93a6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 Jan 2021 06:20:53
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AB59DC43461; Mon, 25 Jan 2021 06:20:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6C222C433ED;
        Mon, 25 Jan 2021 06:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6C222C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        tkjos@google.com, dianders@chromium.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v2 3/3] soc: qcom: rpmh: Conditionally check lockdep_assert_irqs_disabled()
Date:   Mon, 25 Jan 2021 11:50:37 +0530
Message-Id: <1611555637-7688-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611555637-7688-1-git-send-email-mkshah@codeaurora.org>
References: <1611555637-7688-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

lockdep_assert_irqs_disabled() was added to check rpmh_flush()
can only be invoked when irqs are disabled from last CPU,
this is true for APPS RSC as the last CPU going to deepest low
power mode is writing sleep and wake TCSes.

However platform drivers can invoke rpmh_write_sleep_and_wake()
to immediately write cached sleep and wake sets to TCSes from any
CPU. Conditionally check if rpmh_flush() is invoked from last CPU
then do not check for irqs disabled as such RSCs can write sleep
and wake TCSes at any point.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
Changes in v2:
- Update rpmh_flush() to show if its called from last CPU or not
- Drop solver client flag as rpmh_flush() able to check if called from
  last CPU or not
---
 drivers/soc/qcom/rpmh-internal.h |  2 +-
 drivers/soc/qcom/rpmh-rsc.c      |  3 ++-
 drivers/soc/qcom/rpmh.c          | 23 +++++++++++++++++------
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index 79486d6..f351780 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -136,6 +136,6 @@ void rpmh_rsc_invalidate(struct rsc_drv *drv);
 int rpmh_rsc_mode_solver_set(struct rsc_drv *drv, bool enable);
 
 void rpmh_tx_done(const struct tcs_request *msg, int r);
-int rpmh_flush(struct rpmh_ctrlr *ctrlr);
+int rpmh_flush(struct rpmh_ctrlr *ctrlr, bool from_last_cpu);
 
 #endif /* __RPM_INTERNAL_H__ */
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index 1c1f5b0..a67bcd6 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -841,7 +841,8 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
 	 * CPU.
 	 */
 	if (spin_trylock(&drv->lock)) {
-		if (rpmh_rsc_ctrlr_is_busy(drv) || rpmh_flush(&drv->client))
+		if (rpmh_rsc_ctrlr_is_busy(drv) ||
+		    rpmh_flush(&drv->client, true))
 			ret = NOTIFY_BAD;
 		spin_unlock(&drv->lock);
 	} else {
diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index 725b8f0..682c566 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -458,22 +458,33 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
  * rpmh_flush() - Flushes the buffered sleep and wake sets to TCSes
  *
  * @ctrlr: Controller making request to flush cached data
+ * @from_last_cpu: Set if invoked from last cpu with irqs disabled
  *
  * Return:
  * * 0          - Success
  * * Error code - Otherwise
  */
-int rpmh_flush(struct rpmh_ctrlr *ctrlr)
+int rpmh_flush(struct rpmh_ctrlr *ctrlr, bool from_last_cpu)
 {
 	struct cache_req *p;
 	int ret = 0;
 
-	lockdep_assert_irqs_disabled();
+	/*
+	 * rpmh_flush() can be called when we think we're running
+	 * on the last CPU with irqs_disabled or when RPMH client
+	 * explicitly requests to write sleep and wake data.
+	 * (for e.g. when in solver mode clients can requests to flush)
+	 *
+	 * Conditionally check for irqs_disabled only when called
+	 * from last cpu.
+	 */
+
+	if (from_last_cpu)
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
@@ -526,7 +537,7 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
  */
 int rpmh_write_sleep_and_wake(const struct device *dev)
 {
-	return rpmh_flush(get_rpmh_ctrlr(dev));
+	return rpmh_flush(get_rpmh_ctrlr(dev), false);
 }
 EXPORT_SYMBOL(rpmh_write_sleep_and_wake);
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

