Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 461661A1213
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 18:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgDGQva (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 12:51:30 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:44521 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726608AbgDGQv3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 12:51:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586278289; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=GwM28tXHyTVLLRgeS3lHKUJcxxN/qgERFpLmSBazGwI=; b=uqt7nVfa3X5GmSX0puQ5f55zE/oGLm+yGZTknjS2mMP/Q5TAm6gk1jbUcc6tZYxhZzlUh4Tj
 6UlVC91m6eO7/DKrYuQLmb78NfjOI3/aqynqeOYSPYTRwCg8AIrh7SgdsfMdATcH2V+K5Q+n
 mze0LFWYyvAkRXLzUhaovmPoKJU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8caf8d.7f2d6b02dce0-smtp-out-n02;
 Tue, 07 Apr 2020 16:51:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C50C2C433BA; Tue,  7 Apr 2020 16:51:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9EB2C433F2;
        Tue,  7 Apr 2020 16:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9EB2C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v2 1/5] bus: mhi: core: Handle syserr during power_up
Date:   Tue,  7 Apr 2020 10:50:26 -0600
Message-Id: <1586278230-29565-2-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586278230-29565-1-git-send-email-jhugo@codeaurora.org>
References: <1586278230-29565-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MHI device may be in the syserr state when we attempt to init it in
power_up().  Since we have no local state, the handling is simple -
reset the device and wait for it to transition out of the reset state.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/pm.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 52690cb..3285c9e 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -9,6 +9,7 @@
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
 #include <linux/interrupt.h>
+#include <linux/iopoll.h>
 #include <linux/list.h>
 #include <linux/mhi.h>
 #include <linux/module.h>
@@ -760,6 +761,7 @@ static void mhi_deassert_dev_wake(struct mhi_controller *mhi_cntrl,
 
 int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 {
+	enum mhi_state state;
 	enum mhi_ee_type current_ee;
 	enum dev_st_transition next_state;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
@@ -829,6 +831,24 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 		goto error_bhi_offset;
 	}
 
+	state = mhi_get_mhi_state(mhi_cntrl);
+	if (state == MHI_STATE_SYS_ERR) {
+		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
+		ret = readl_poll_timeout(mhi_cntrl->regs + MHICTRL, val,
+					 !(val & MHICTRL_RESET_MASK), 1000,
+					 mhi_cntrl->timeout_ms * 1000);
+		if (ret) {
+			dev_info(dev, "Failed to reset MHI due to syserr state\n");
+			goto error_bhi_offset;
+		}
+
+		/*
+		 * device cleares INTVEC as part of RESET processing,
+		 * re-program it
+		 */
+		mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
+	}
+
 	/* Transition to next state */
 	next_state = MHI_IN_PBL(current_ee) ?
 		DEV_ST_TRANSITION_PBL : DEV_ST_TRANSITION_READY;
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
