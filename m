Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFE622FF3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 04:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727078AbgG1CCv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jul 2020 22:02:51 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:38685 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727020AbgG1CCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jul 2020 22:02:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595901770; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=1GwQrNQCSG7I+ITNe/q8t3Qe1WXR3VW3IkHkTvo6IBg=; b=AJWV+JSGrlg+XCGJ93A85L9VW38x9qXjUo6LZKV1Li5fEjDXY6cVryHNnEpJv/EOpAYRhqTr
 kJqshFyaGunRgKkFHkkLqfz2Ose7xqiX9HJNak1IMLokrsi+VidNlqazN9WjkhrfWruuDQsd
 M5TG3RQA+92sTO0XQQyHYxtkJUs=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f1f87397186ea1ee1763744 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 02:02:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B987DC433B6; Tue, 28 Jul 2020 02:02:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1D03DC433AF;
        Tue, 28 Jul 2020 02:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1D03DC433AF
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v6 04/11] bus: mhi: core: Trigger host resume if suspended during mhi_device_get()
Date:   Mon, 27 Jul 2020 19:02:13 -0700
Message-Id: <1595901740-27379-5-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595901740-27379-1-git-send-email-bbhatt@codeaurora.org>
References: <1595901740-27379-1-git-send-email-bbhatt@codeaurora.org>
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

