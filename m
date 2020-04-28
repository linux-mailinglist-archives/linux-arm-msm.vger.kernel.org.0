Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E32791BB450
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 05:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgD1C7r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Apr 2020 22:59:47 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:16653 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726413AbgD1C7q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Apr 2020 22:59:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588042786; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=PsWaXjUR/K6H4tZBz0YQk+NEUWg8eY6N673gPQl/964=; b=G0DrHWe2oaQtyeLe64C2NNfYjAgpwXvR9l0TzUpvM9bZmSH7IC6KlzAt068WJLF0GeiQ5ZjM
 lP5am4Q5kYW90yL6j7GfnR4VLUg67SsJKjd2hwSXf7EOppkDsBWp0AD6nnhLTTvl7zw9roM4
 ZvUb+X8ili4aGEN1ruLAoG/kVPc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea79c1f.7fa7b9424928-smtp-out-n03;
 Tue, 28 Apr 2020 02:59:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 274E1C44788; Tue, 28 Apr 2020 02:59:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9A842C432C2;
        Tue, 28 Apr 2020 02:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9A842C432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 6/8] bus: mhi: core: Return appropriate error codes for AMSS load failure
Date:   Mon, 27 Apr 2020 19:59:24 -0700
Message-Id: <1588042766-17496-7-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588042766-17496-1-git-send-email-bbhatt@codeaurora.org>
References: <1588042766-17496-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When loading AMSS firmware using BHIe protocol, return -ETIMEDOUT if no
response is received within the timeout or return -EIO in case of a
protocol returned failure or an MHI error state.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index bc70edc..4e49a0e 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -176,6 +176,7 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 	void __iomem *base = mhi_cntrl->bhie;
 	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
 	u32 tx_status, sequence_id;
+	int ret;
 
 	read_lock_bh(pm_lock);
 	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
@@ -198,19 +199,19 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 	read_unlock_bh(pm_lock);
 
 	/* Wait for the image download to complete */
-	wait_event_timeout(mhi_cntrl->state_event,
-			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state) ||
-			   mhi_read_reg_field(mhi_cntrl, base,
-					      BHIE_TXVECSTATUS_OFFS,
-					      BHIE_TXVECSTATUS_STATUS_BMSK,
-					      BHIE_TXVECSTATUS_STATUS_SHFT,
-					      &tx_status) || tx_status,
-			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
-
-	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
+	ret = wait_event_timeout(mhi_cntrl->state_event,
+				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state) ||
+				 mhi_read_reg_field(mhi_cntrl, base,
+						    BHIE_TXVECSTATUS_OFFS,
+						   BHIE_TXVECSTATUS_STATUS_BMSK,
+						   BHIE_TXVECSTATUS_STATUS_SHFT,
+						    &tx_status) || tx_status,
+				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
+	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state) ||
+	    tx_status != BHIE_TXVECSTATUS_STATUS_XFER_COMPL)
 		return -EIO;
 
-	return (tx_status == BHIE_TXVECSTATUS_STATUS_XFER_COMPL) ? 0 : -EIO;
+	return (!ret) ? -ETIMEDOUT : 0;
 }
 
 static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
