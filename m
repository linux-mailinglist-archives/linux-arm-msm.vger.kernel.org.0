Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE4551CEA6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 04:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728557AbgELCDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 22:03:21 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:26060 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728301AbgELCDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 22:03:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589248999; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=JFe5jJsc8mR74mgiCC9H6ktYU5WkCtR8x4l1RwjvGMA=; b=GqkKHC5t88gfS1PTofZTQF6h2wl3ygdpR9z/BNNLJ8BcxG+V3JvnYEU74h6q/8weQPdqqFIq
 nimGAMuB2XPN6Kkirl7AdchoURimzYwMWp78hMfVNOqG1ien31HAySw5m0kgjmccU5PctviF
 spiKhy+7fQyxPvJLYdG35Gw9FPI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eba03e7.7fc765f123b0-smtp-out-n03;
 Tue, 12 May 2020 02:03:19 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6B6C9C433F2; Tue, 12 May 2020 02:03:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D937AC43636;
        Tue, 12 May 2020 02:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D937AC43636
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v1 4/5] bus: mhi: core: Do not process SYS_ERROR if RDDM is supported
Date:   Mon, 11 May 2020 19:03:08 -0700
Message-Id: <1589248989-23824-5-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
References: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Devices that support RDDM do not require processing SYS_ERROR as it is
deemed redundant. Avoid SYS_ERROR processing if RDDM is supported by
the device.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 467c0ba..1f622ce 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -397,9 +397,9 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 	}
 	write_unlock_irq(&mhi_cntrl->pm_lock);
 
-	/* If device in RDDM don't bother processing SYS error */
-	if (mhi_cntrl->ee == MHI_EE_RDDM) {
-		if (mhi_cntrl->ee != ee) {
+	 /* If device supports RDDM don't bother processing SYS error */
+	if (mhi_cntrl->rddm_image) {
+		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
 			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
 			wake_up_all(&mhi_cntrl->state_event);
 		}
@@ -735,6 +735,11 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 			{
 				enum mhi_pm_state new_state;
 
+				/* skip SYS_ERROR handling if RDDM supported */
+				if (mhi_cntrl->ee == MHI_EE_RDDM ||
+				    mhi_cntrl->rddm_image)
+					break;
+
 				dev_dbg(dev, "System error detected\n");
 				write_lock_irq(&mhi_cntrl->pm_lock);
 				new_state = mhi_tryset_pm_state(mhi_cntrl,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
