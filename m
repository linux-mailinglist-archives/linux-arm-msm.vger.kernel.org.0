Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7A7A1A1214
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 18:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbgDGQvb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 12:51:31 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:36139 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726552AbgDGQva (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 12:51:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586278290; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=b1pY8cTgRt+LvatfRduM8QYisMGaxGkElw95LNjYo9I=; b=XlPer97RoTnwcs3PTJM3wXsBQCtqkXFAPbKrUU3C+k23W/SGMDTzRzLJ4cKl4WKZSoMMp6pU
 KdAQtrN9WwfsiE+WrHZlYpdHetKTG28ITnAur0jUsd1qW6wKREmvJcqe+TOVAkoM/mkhTbIu
 BFaaQCexCLfQeAl2QuB9n+SMflc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8caf92.7fe15d194490-smtp-out-n05;
 Tue, 07 Apr 2020 16:51:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0755DC44788; Tue,  7 Apr 2020 16:51:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72B08C433BA;
        Tue,  7 Apr 2020 16:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 72B08C433BA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v2 3/5] bus: mhi: core: Remove link_status() callback
Date:   Tue,  7 Apr 2020 10:50:28 -0600
Message-Id: <1586278230-29565-4-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586278230-29565-1-git-send-email-jhugo@codeaurora.org>
References: <1586278230-29565-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the MHI core detects invalid data due to a PCI read, it calls into
the controller via link_status() to double check that the link is infact
down.  All in all, this is pretty pointless, and racy.  There are no good
reasons for this, and only drawbacks.

Its pointless because chances are, the controller is going to do the same
thing to determine if the link is down - attempt a PCI access and compare
the result.  This does not make the link status decision any smarter.

Its racy because its possible that the link was down at the time of the
MHI core access, but then recovered before the controller access.  In this
case, the controller will indicate the link is not down, and the MHI core
will precede to use a bad value as the MHI core does not attempt to retry
the access.

Retrying the access in the MHI core is a bad idea because again, it is
racy - what if the link is down again?  Furthermore, there may be some
higher level state associated with the link status, that is now invalid
because the link went down.

The only reason why the MHI core could see "invalid" data when doing a PCI
access, that is actually valid, is if the register actually contained the
PCI spec defined sentinel for an invalid access.  In this case, it is
arguable that the MHI implementation broken, and should be fixed, not
worked around.

Therefore, remove the link_status() callback before anyone attempts to
implement it.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 6 ++----
 drivers/bus/mhi/core/main.c | 5 ++---
 include/linux/mhi.h         | 2 --
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index b38359c..2af08d57 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -812,10 +812,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 	if (!mhi_cntrl)
 		return -EINVAL;
 
-	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put)
-		return -EINVAL;
-
-	if (!mhi_cntrl->status_cb || !mhi_cntrl->link_status)
+	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
+	    !mhi_cntrl->status_cb)
 		return -EINVAL;
 
 	ret = parse_config(mhi_cntrl, config);
diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index eb4256b..473278b8 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -20,9 +20,8 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
 {
 	u32 tmp = readl(base + offset);
 
-	/* If there is any unexpected value, query the link status */
-	if (PCI_INVALID_READ(tmp) &&
-	    mhi_cntrl->link_status(mhi_cntrl))
+	/* If the value is invalid, the link is down */
+	if (PCI_INVALID_READ(tmp))
 		return -EIO;
 
 	*out = tmp;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index ad19960..be704a4 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -335,7 +335,6 @@ struct mhi_controller_config {
  * @syserr_worker: System error worker
  * @state_event: State change event
  * @status_cb: CB function to notify power states of the device (required)
- * @link_status: CB function to query link status of the device (required)
  * @wake_get: CB function to assert device wake (optional)
  * @wake_put: CB function to de-assert device wake (optional)
  * @wake_toggle: CB function to assert and de-assert device wake (optional)
@@ -417,7 +416,6 @@ struct mhi_controller {
 
 	void (*status_cb)(struct mhi_controller *mhi_cntrl,
 			  enum mhi_callback cb);
-	int (*link_status)(struct mhi_controller *mhi_cntrl);
 	void (*wake_get)(struct mhi_controller *mhi_cntrl, bool override);
 	void (*wake_put)(struct mhi_controller *mhi_cntrl, bool override);
 	void (*wake_toggle)(struct mhi_controller *mhi_cntrl);
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
