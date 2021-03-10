Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5CF33490E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 21:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbhCJUmy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 15:42:54 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:37034 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232067AbhCJUmc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 15:42:32 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615408952; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=y9dG7dshC+k0sBZNCdzBkLkCPX7Wmt3l2cPIISsNooE=; b=WaQOi2bccZapIvLzWIWRdv67Z0/d911rL4xM5qm7hWbdR3R2V0ZjQUNTRB0c9PbPfzzjY4C+
 LJv0UFPcww3BoXvfAXzbQK5SI3VuvKPc5Bdpus5hqrVcGAVlbTTHOGnBjB5Ku8tWsPnJ/bW+
 we6TibLgpDlAVip2PMb63hPmzXM=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 60492f236e1c22bc8d55257f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 20:42:11
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 74BBCC43461; Wed, 10 Mar 2021 20:42:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 26331C433C6;
        Wed, 10 Mar 2021 20:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 26331C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v2 RESEND] bus: mhi: core: Wait for ready state after reset
Date:   Wed, 10 Mar 2021 13:41:58 -0700
Message-Id: <1615408918-7242-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After the device has signaled the end of reset by clearing the reset bit,
it will automatically reinit MHI and the internal device structures.  Once
That is done, the device will signal it has entered the ready state.

Signaling the ready state involves sending an interrupt (MSI) to the host
which might cause IOMMU faults if it occurs at the wrong time.

If the controller is being powered down, and possibly removed, then the
reset flow would only wait for the end of reset.  At which point, the host
and device would start a race.  The host may complete its reset work, and
remove the interrupt handler, which would cause the interrupt to be
disabled in the IOMMU.  If that occurs before the device signals the ready
state, then the IOMMU will fault since it blocked an interrupt.  While
harmless, the fault would appear like a serious issue has occurred so let's
silence it by making sure the device hits the ready state before the host
completes its reset processing.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/pm.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index adb0e80..414da4f 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -467,7 +467,7 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
 
 	/* Trigger MHI RESET so that the device will not access host memory */
 	if (!MHI_PM_IN_FATAL_STATE(mhi_cntrl->pm_state)) {
-		u32 in_reset = -1;
+		u32 in_reset = -1, ready = 0;
 		unsigned long timeout = msecs_to_jiffies(mhi_cntrl->timeout_ms);
 
 		dev_dbg(dev, "Triggering MHI Reset in device\n");
@@ -490,6 +490,21 @@ static void mhi_pm_disable_transition(struct mhi_controller *mhi_cntrl)
 		 * hence re-program it
 		 */
 		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
+
+		if (!MHI_IN_PBL(mhi_get_exec_env(mhi_cntrl))) {
+			/* wait for ready to be set */
+			ret = wait_event_timeout(mhi_cntrl->state_event,
+						 mhi_read_reg_field(mhi_cntrl,
+							mhi_cntrl->regs,
+							MHISTATUS,
+							MHISTATUS_READY_MASK,
+							MHISTATUS_READY_SHIFT,
+							&ready)
+						 || ready, timeout);
+			if (!ret || !ready)
+				dev_warn(dev,
+					"Device failed to enter READY state\n");
+		}
 	}
 
 	dev_dbg(dev,
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

