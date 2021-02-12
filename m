Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7CD131A6E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 22:29:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbhBLV2e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 16:28:34 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:55975 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232057AbhBLV2d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 16:28:33 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613165287; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=iahau7b0RP23BqJ1mHFpNKNC9lJ0XkgdYICyLtBm1lc=; b=AdQFgRokYZ78K524zkKoYmT7ySRz9/3OmwDvXat1Xa/+6xQILRzlc68e7rQnqV0yzemN+ckL
 klNBRLAc7OOjFAURar5LnE95G6f8Vs8O17R3jzKx8WMgmHNqQhkdP9t2Z/HeeevcqmODjJUf
 mwdeg8MMfxtWvPHhoZ9SZ5GQT3c=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6026f2cc4bd23a05ae37a145 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Feb 2021 21:27:40
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 10D45C43462; Fri, 12 Feb 2021 21:27:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EA27AC433ED;
        Fri, 12 Feb 2021 21:27:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EA27AC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     bbhatt@codeaurora.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH] bus: mhi: core: Fix check for syserr at power_up
Date:   Fri, 12 Feb 2021 14:27:23 -0700
Message-Id: <1613165243-23359-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The check to see if we have reset the device after detecting syserr at
power_up is inverted.  wait_for_event_timeout() returns 0 on failure,
and a positive value on success.  The check is looking for non-zero
as a failure, which is likely to incorrectly cause a device init failure
if syserr was detected at power_up.  Fix this.

Fixes: e18d4e9fa79b ("bus: mhi: core: Handle syserr during power_up")
Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/bus/mhi/core/pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 681960c..36ab7aa 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1092,7 +1092,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 							   &val) ||
 					!val,
 				msecs_to_jiffies(mhi_cntrl->timeout_ms));
-		if (ret) {
+		if (!ret) {
 			ret = -EIO;
 			dev_info(dev, "Failed to reset MHI due to syserr state\n");
 			goto error_bhi_offset;
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

