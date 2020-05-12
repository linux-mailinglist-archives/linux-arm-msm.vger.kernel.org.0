Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 590FF1CEA71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 04:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728115AbgELCDW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 22:03:22 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:41432 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728073AbgELCDV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 22:03:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589249000; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=2g53dCdQCv7gFi9EsXPVGxHD6wMKmmDOZGGpFURnlk4=; b=nFdsSVXqNJ78YRAk3jdBEqHBEJOFY77HQQ4Ick48bIS0q1TjpKjDaCS7gqxfnENPdVIfXw8/
 aEOSjNtsHw7VL6Xe7avCssW9UfgykrOto9etd8Qmd1f2Dbnbn5aYBV539WvLcDOUcODELMIB
 0IKvqqnBcG+2676lF3UsGIx6NMk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eba03e8.7f9bb043f1b8-smtp-out-n01;
 Tue, 12 May 2020 02:03:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0B039C433F2; Tue, 12 May 2020 02:03:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 501CCC433CB;
        Tue, 12 May 2020 02:03:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 501CCC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v1 5/5] bus: mhi: core: Handle write lock properly in mhi_pm_m0_transition
Date:   Mon, 11 May 2020 19:03:09 -0700
Message-Id: <1589248989-23824-6-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
References: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Take write lock only to protect db_mode member of mhi channel.
This allows rest of the mhi channels to just take read lock which
fine grains the locking. It prevents channel readers to starve if
they try to enter critical section after a writer.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/core/pm.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 345f197..de5abb2 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -288,14 +288,18 @@ int mhi_pm_m0_transition(struct mhi_controller *mhi_cntrl)
 	for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
 		struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
 
-		write_lock_irq(&mhi_chan->lock);
-		if (mhi_chan->db_cfg.reset_req)
+		if (mhi_chan->db_cfg.reset_req) {
+			write_lock_irq(&mhi_chan->lock);
 			mhi_chan->db_cfg.db_mode = true;
+			write_unlock_irq(&mhi_chan->lock);
+		}
+
+		read_lock_irq(&mhi_chan->lock);
 
 		/* Only ring DB if ring is not empty */
 		if (tre_ring->base && tre_ring->wp  != tre_ring->rp)
 			mhi_ring_chan_db(mhi_cntrl, mhi_chan);
-		write_unlock_irq(&mhi_chan->lock);
+		read_unlock_irq(&mhi_chan->lock);
 	}
 
 	mhi_cntrl->wake_put(mhi_cntrl, false);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
