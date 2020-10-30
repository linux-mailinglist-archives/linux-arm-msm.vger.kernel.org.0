Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 440BA29FADF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 02:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgJ3Bwn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 21:52:43 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:15865 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726290AbgJ3BwP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 21:52:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604022734; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=F0sxjXnBEh783fVjnu6ncFGsGt2oqOPfmKrhbhWQZjM=; b=m5UhqsNw4NvaYltnW9+aDHF0xGUzS178MUIf8S6S+yZMfmdyMV0+oM6kM2Ck/w0xjGbFxdgd
 Snfg8BnhqdanccQgHSdJf1+MNcDoVuvnEs5sE+2ebSPQQaeiUNwnFH1dv3XVZ3J9+SnEZIil
 kvujOpt2ho4YGQMRKLXxZ86dRn0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f9b71ced292ba49082b20e5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 01:52:14
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7AD31C433F0; Fri, 30 Oct 2020 01:52:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D72E2C433C9;
        Fri, 30 Oct 2020 01:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D72E2C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 05/12] bus: mhi: core: Prevent sending multiple RDDM entry callbacks
Date:   Thu, 29 Oct 2020 18:51:56 -0700
Message-Id: <1604022723-34578-6-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604022723-34578-1-git-send-email-bbhatt@codeaurora.org>
References: <1604022723-34578-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If an mhi_power_down() is initiated after the device has entered
RDDM and a status callback was provided for it, it is possible
that another BHI interrupt fires while waiting for the MHI
RESET to be cleared. If that happens, MHI host would have moved
a "disabled" execution environment and the check to allow sending
an RDDM status callback will pass when it is should not. Add a
check to see if MHI is in an active state before proceeding.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 1f32d67..172b48b 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -399,6 +399,10 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 
 	 /* If device supports RDDM don't bother processing SYS error */
 	if (mhi_cntrl->rddm_image) {
+		/* host may be performing a device power down already */
+		if (!mhi_is_active(mhi_cntrl))
+			goto exit_intvec;
+
 		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
 			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
 			wake_up_all(&mhi_cntrl->state_event);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

