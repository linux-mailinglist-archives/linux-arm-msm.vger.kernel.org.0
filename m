Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C56034DD83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Mar 2021 03:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbhC3B2y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Mar 2021 21:28:54 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24557 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbhC3B2q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Mar 2021 21:28:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617067726; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=dXEXVZfmxlq42bBC/WO127UuKGCrpmc0hgZ+knD4aN4=; b=MUjy2Lp6xbJpz90Bg534ELeN/j1gMJKMGenGuAG2HEZ/IwQAfKxUwBxYiWRZgpyXxRFKR8MV
 PjwIP0rHs7P098AxJlrDKfM2LV8uvTCAQb03ncLbBa26b+FvpncQWQYq53yw+iTpRytQ75Wf
 qBmEB5OFqSfutCjkutZS4pbQ9Pc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60627ec03f4005d0759e4a33 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Mar 2021 01:28:32
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8CED8C43464; Tue, 30 Mar 2021 01:28:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 53817C433CA;
        Tue, 30 Mar 2021 01:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 53817C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com,
        loic.poulain@linaro.org, abickett@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 3/7] bus: mhi: core: Handle EDL mode entry appropriately
Date:   Mon, 29 Mar 2021 18:28:20 -0700
Message-Id: <1617067704-28850-4-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org>
References: <1617067704-28850-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Device entering EDL or Emergency Download Mode will be in a
SYS_ERROR MHI state. This requires MHI host to proceed with the
EDL image download over BHI before device can enter an MHI READY
state and proceed with further bootup. Allow this to be handled
by relying on the execution environment check after SYS_ERROR
processing to determine whether to wait for an MHI READY or
download the EDL image over BHI after moving MHI PM state to
Power on Reset internally. This way handling is contained well
within the MHI core driver and helps pave the way for Flash
Programmer execution environment functionality.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/pm.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index fbe9447..b65222e 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -564,6 +564,7 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
 static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 {
 	enum mhi_pm_state cur_state, prev_state;
+	enum dev_st_transition next_state;
 	struct mhi_event *mhi_event;
 	struct mhi_cmd_ctxt *cmd_ctxt;
 	struct mhi_cmd *mhi_cmd;
@@ -677,7 +678,23 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 		er_ctxt->wp = er_ctxt->rbase;
 	}
 
-	mhi_ready_state_transition(mhi_cntrl);
+	/* Transition to next state */
+	if (MHI_IN_PBL(mhi_get_exec_env(mhi_cntrl))) {
+		write_lock_irq(&mhi_cntrl->pm_lock);
+		cur_state = mhi_tryset_pm_state(mhi_cntrl, MHI_PM_POR);
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+		if (cur_state != MHI_PM_POR) {
+			dev_err(dev, "Error moving to state %s from %s\n",
+				to_mhi_pm_state_str(MHI_PM_POR),
+				to_mhi_pm_state_str(cur_state));
+			goto exit_sys_error_transition;
+		}
+		next_state = DEV_ST_TRANSITION_PBL;
+	} else {
+		next_state = DEV_ST_TRANSITION_READY;
+	}
+
+	mhi_queue_state_transition(mhi_cntrl, next_state);
 
 exit_sys_error_transition:
 	dev_dbg(dev, "Exiting with PM state: %s, MHI state: %s\n",
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

