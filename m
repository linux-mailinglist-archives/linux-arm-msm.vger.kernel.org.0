Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 236C81BA96E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2020 18:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728292AbgD0P7o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 11:59:44 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:39760 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727073AbgD0P7n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 11:59:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588003183; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/9q73TN0qA+ILuWfO7wpBj99H8TUww0pz6HfMXIUEPg=; b=fL3L2jyoQ8Buzbm8aYXFI/ebh3fIRQQX6FrZuMXyfoXYbfcwfrD08+2bdvhSialjUY6tM6q4
 HfkuDNylLT28ws4UsZ5bifzfwlnGJSl2wBGknczmw6LcYGXT+Rx3RGnhaEUUm5xhBorZmrMF
 02y0r0r1UyjTt6RU06y3LgQzLdk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea7016a.7fb6b94110a0-smtp-out-n01;
 Mon, 27 Apr 2020 15:59:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9E7F6C433BA; Mon, 27 Apr 2020 15:59:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B7438C432C2;
        Mon, 27 Apr 2020 15:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B7438C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v3 5/6] bus: mhi: core: Handle syserr during power_up
Date:   Mon, 27 Apr 2020 09:59:12 -0600
Message-Id: <1588003153-13139-6-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588003153-13139-1-git-send-email-jhugo@codeaurora.org>
References: <1588003153-13139-1-git-send-email-jhugo@codeaurora.org>
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
index dc83d65..239619b 100644
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
