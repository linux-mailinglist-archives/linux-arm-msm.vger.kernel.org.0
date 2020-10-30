Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF2D29FACE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 02:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgJ3BwX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 21:52:23 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:29468 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726359AbgJ3BwT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 21:52:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604022739; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=muClZ3aEgtW2SVMTa7yNNtr5APzEcgr+2RBahZX568o=; b=c/ud4dv+6emgiFvhgCpOwtFyIv7E4+FH5pCqkSFX/Wj1ICBZZNz24qlBPZ/HmLe3UP5vrrBa
 C35pHMFr0BK4jWKAWx6TbGKOzcazAGQs+qhKIiwYpEdPBS9u4x14jueV0XjZr+fSG1XrCxPM
 hhkEq9W7JCmtlDRft3F9BGjUh1c=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f9b71d252a6c59f17fb873f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 01:52:18
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 43A25C43387; Fri, 30 Oct 2020 01:52:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EAE6C43382;
        Fri, 30 Oct 2020 01:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EAE6C43382
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 12/12] bus: mhi: core: Remove MHI event ring IRQ handlers when powering down
Date:   Thu, 29 Oct 2020 18:52:03 -0700
Message-Id: <1604022723-34578-13-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604022723-34578-1-git-send-email-bbhatt@codeaurora.org>
References: <1604022723-34578-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

While powering down, the device may or may not acknowledge an MHI
RESET issued by host for a graceful shutdown scenario and end up
sending an incoming data packet after tasklets have been killed.
If a rogue device sends this interrupt for a data transfer event
ring update, it can result in a tasklet getting scheduled while a
clean up is ongoing or has completed and cause access to freed
memory leading to a NULL pointer exception. Remove the interrupt
handlers for MHI event rings early on to avoid this scenario.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/pm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index ffbf6f5..28e2b87 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -627,6 +627,7 @@ static void mhi_pm_sys_error_transition(struct mhi_controller *mhi_cntrl)
 	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
 		if (mhi_event->offload_ev)
 			continue;
+		free_irq(mhi_cntrl->irq[mhi_event->irq], mhi_event);
 		tasklet_kill(&mhi_event->task);
 	}
 
@@ -1164,7 +1165,7 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
 	/* Wait for shutdown to complete */
 	flush_work(&mhi_cntrl->st_worker);
 
-	mhi_deinit_free_irq(mhi_cntrl);
+	free_irq(mhi_cntrl->irq[0], mhi_cntrl);
 
 	if (!mhi_cntrl->pre_init) {
 		/* Free all allocated resources */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

