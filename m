Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE5922B9B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 00:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgGWWhO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 18:37:14 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:61666 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728244AbgGWWhO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 18:37:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595543833; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=1GwQrNQCSG7I+ITNe/q8t3Qe1WXR3VW3IkHkTvo6IBg=; b=eCHLLP3NlMtUbSF2XfX75NQ1C4nCngPPyk5VQSfFrxLgBASNaXljDkY6XPIksqMx0J8d2fqK
 gKgIFdNC2qsgccqIxo7iF4mY7UN+b7vscnv8Wo0qMWPLsR6Gdh7No+lyyqy2JAbxonuCDiSB
 KPwJE7Mueg6M2DnUEeJGV0QdAuU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-east-1.postgun.com with SMTP id
 5f1a11058423214e13237d9c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Jul 2020 22:36:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 44571C433C6; Thu, 23 Jul 2020 22:36:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A86D5C433A1;
        Thu, 23 Jul 2020 22:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A86D5C433A1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v5 04/10] bus: mhi: core: Trigger host resume if suspended during mhi_device_get()
Date:   Thu, 23 Jul 2020 15:36:36 -0700
Message-Id: <1595543802-17859-5-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595543802-17859-1-git-send-email-bbhatt@codeaurora.org>
References: <1595543802-17859-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is possible that the host may be suspending or suspended and may
not allow an outgoing device wake assert immediately if a client has
requested for it. Ensure that the host wakes up and allows for it so
the client does not have to wait for an external trigger or an
outgoing packet to be queued for the host resume to occur.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index b227d41..27bb471 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1112,6 +1112,9 @@ void mhi_device_get(struct mhi_device *mhi_dev)
 
 	mhi_dev->dev_wake++;
 	read_lock_bh(&mhi_cntrl->pm_lock);
+	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
+		mhi_trigger_resume(mhi_cntrl);
+
 	mhi_cntrl->wake_get(mhi_cntrl, true);
 	read_unlock_bh(&mhi_cntrl->pm_lock);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

