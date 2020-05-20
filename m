Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607711DA695
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 02:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgETAan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 20:30:43 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:24690 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728345AbgETAan (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 20:30:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589934642; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=OdYhjBKMQ6RWOSENJbzrmFx92mOQNyawWELNsr+IZCM=; b=rGH/UhG4yFx5Te0umUFqW3CXafdDdQhn6luVAtEdPsN1kq7H3OJ1XGURhhhyWQhf5AhzYbCy
 GLBQswEnEgLg8N9GbpAs3hE+ByPhRlG5C5LE+3YfNkUNRUqhVNRtXms2omKXtZ3rjie4npck
 khcM4ir9GJhQe9EGWMNFj0KmeJk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec47a30.7f2e202db228-smtp-out-n05;
 Wed, 20 May 2020 00:30:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DE7C3C433CA; Wed, 20 May 2020 00:30:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1FD94C43387;
        Wed, 20 May 2020 00:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1FD94C43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 6/6] bus: mhi: core: Process execution environment changes serially
Date:   Tue, 19 May 2020 17:30:31 -0700
Message-Id: <1589934631-22752-7-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589934631-22752-1-git-send-email-bbhatt@codeaurora.org>
References: <1589934631-22752-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In current design, whenever the "bhi" interrupt is fired, the execution
environment is updated. This can cause race conditions and impede any
ongoing power up or power down processing. For example, if a power down
is in progress and the host has updated the execution environment to a
local "disabled" state, any BHI interrupt could replace it with the
execution environment from the BHI EE register. Another example would
be that the device can enter mission mode while the device creation for
SBL is still ongoing leading to multiple attempts at opening the same
channel.

Ensure that EE changes are handled only from appropriate places and
occur one after another.

For RDDM, handle it as a critical event directly from the interrupt
handler and remove RDDM EE change event from the control event ring to
prevent the driver from issuing multiple callbacks. SBL handling
requires no change. For AMSS/mission mode, hold off the update until
the client is notified with a status callback.

To sum it up, ensure client readiness before processing mission mode and
move to an error state as soon as possible to avoid a bad state.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 12 ++++--------
 drivers/bus/mhi/core/pm.c   | 21 +++++++++++++++++----
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index da32c23..d25f321 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -385,8 +385,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 	}
 
 	state = mhi_get_mhi_state(mhi_cntrl);
-	ee = mhi_cntrl->ee;
-	mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
+	ee = mhi_get_exec_env(mhi_cntrl);
 	dev_dbg(dev, "local ee:%s device ee:%s dev_state:%s\n",
 		TO_MHI_EXEC_STR(mhi_cntrl->ee), TO_MHI_EXEC_STR(ee),
 		TO_MHI_STATE_STR(state));
@@ -399,7 +398,9 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 			goto exit_intvec;
 		}
 
-		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
+		if (ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
+			mhi_cntrl->ee = MHI_EE_RDDM;
+
 			/* prevent clients from queueing any more packets */
 			pm_state = mhi_tryset_pm_state(mhi_cntrl,
 						       MHI_PM_SYS_ERR_DETECT);
@@ -794,11 +795,6 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 				st = DEV_ST_TRANSITION_MISSION_MODE;
 				break;
 			case MHI_EE_RDDM:
-				mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
-				write_lock_irq(&mhi_cntrl->pm_lock);
-				mhi_cntrl->ee = event;
-				write_unlock_irq(&mhi_cntrl->pm_lock);
-				wake_up_all(&mhi_cntrl->state_event);
 				break;
 			default:
 				dev_err(dev,
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 5041df9..4407338 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -377,22 +377,35 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_event *mhi_event;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
+	enum mhi_ee_type ee = MHI_EE_MAX;
 	int i, ret;
 
 	dev_dbg(dev, "Processing Mission Mode transition\n");
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
-		mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
+		ee = mhi_get_exec_env(mhi_cntrl);
 	write_unlock_irq(&mhi_cntrl->pm_lock);
 
-	if (!MHI_IN_MISSION_MODE(mhi_cntrl->ee))
+	if (!MHI_IN_MISSION_MODE(ee)) {
+		dev_err(dev, "Invalid EE for Mission Mode: %s\n",
+			TO_MHI_EXEC_STR(ee));
 		return -EIO;
+	}
 
-	wake_up_all(&mhi_cntrl->state_event);
-
+	/*
+	 * let controller prepare for mission mode before making the execution
+	 * environment change so as to defer core driver activity
+	 */
 	mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_MISSION_MODE);
 
+	/* ready the core driver for mission mode */
+	write_lock_irq(&mhi_cntrl->pm_lock);
+	mhi_cntrl->ee = ee;
+	write_unlock_irq(&mhi_cntrl->pm_lock);
+
+	wake_up_all(&mhi_cntrl->state_event);
+
 	/* Force MHI to be in M0 state before continuing */
 	ret = __mhi_device_get_sync(mhi_cntrl);
 	if (ret)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
