Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6172709D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 04:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgISCCu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 22:02:50 -0400
Received: from so254-54.mailgun.net ([198.61.254.54]:32247 "EHLO
        so254-54.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgISCCt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 22:02:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600480968; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=lIkCnDZFc2xALKNOJj7KGUxO+9zysNF4oB8Aevw2h1o=; b=d0GjQQ5lJs8lF4lLJ+dASeARLfymz6J9m6Kd5NIRTft2DisdF9U3x8Rt0qWzmLdxsB4eFmbj
 7bI/OdADFUYOlMsGND8d4RjUPvUEwoZxMn7Vw0nx9dQZyFxYhqBkZfZIjutXEVlWH65DAg1Q
 kMwrQh/rMkK83bMnCay33bpro00=
X-Mailgun-Sending-Ip: 198.61.254.54
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f6566c828e87a878b2cde3a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 19 Sep 2020 02:02:48
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D348BC433FF; Sat, 19 Sep 2020 02:02:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC4FDC433C8;
        Sat, 19 Sep 2020 02:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC4FDC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 07/10] bus: mhi: core: Move to SYS_ERROR regardless of RDDM capability
Date:   Fri, 18 Sep 2020 19:02:32 -0700
Message-Id: <1600480955-16827-8-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In some cases, the entry of device to RDDM execution environment
can occur after a significant amount of time has elapsed after the
SYS_ERROR state change event has arrived. This can result in scenarios
where users of the MHI bus are unaware of the error state of the
device. Hence, moving the MHI bus to a SYS_ERROR detected state will
prevent further client activity and wait for the RDDM entry.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 2cff5dd..1c8e332 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -376,6 +376,7 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 	enum mhi_state state = MHI_STATE_MAX;
 	enum mhi_pm_state pm_state = 0;
 	enum mhi_ee_type ee = 0;
+	bool handle_rddm = false;
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
@@ -400,6 +401,17 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 	 /* If device supports RDDM don't bother processing SYS error */
 	if (mhi_cntrl->rddm_image) {
 		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
+			/* prevent clients from queueing any more packets */
+			write_lock_irq(&mhi_cntrl->pm_lock);
+			pm_state = mhi_tryset_pm_state(mhi_cntrl,
+						       MHI_PM_SYS_ERR_DETECT);
+			if (pm_state == MHI_PM_SYS_ERR_DETECT)
+				handle_rddm = true;
+			write_unlock_irq(&mhi_cntrl->pm_lock);
+		}
+
+		if (handle_rddm) {
+			dev_err(dev, "RDDM event occurred!\n");
 			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
 			wake_up_all(&mhi_cntrl->state_event);
 		}
@@ -733,19 +745,15 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 				break;
 			case MHI_STATE_SYS_ERR:
 			{
-				enum mhi_pm_state new_state;
-
-				/* skip SYS_ERROR handling if RDDM supported */
-				if (mhi_cntrl->ee == MHI_EE_RDDM ||
-				    mhi_cntrl->rddm_image)
-					break;
+				enum mhi_pm_state state = MHI_PM_STATE_MAX;
 
 				dev_dbg(dev, "System error detected\n");
 				write_lock_irq(&mhi_cntrl->pm_lock);
-				new_state = mhi_tryset_pm_state(mhi_cntrl,
+				if (mhi_cntrl->ee != MHI_EE_RDDM)
+					state = mhi_tryset_pm_state(mhi_cntrl,
 							MHI_PM_SYS_ERR_DETECT);
 				write_unlock_irq(&mhi_cntrl->pm_lock);
-				if (new_state == MHI_PM_SYS_ERR_DETECT)
+				if (state == MHI_PM_SYS_ERR_DETECT)
 					mhi_pm_sys_err_handler(mhi_cntrl);
 				break;
 			}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

