Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 673CD2AC63C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 21:48:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbgKIUsN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 15:48:13 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:23154 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730667AbgKIUrp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 15:47:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604954865; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=sG+Hz7q1w0f+xVvgAmIqgk5pLO8+fZGC0xGXb78HCWI=; b=H3dcbPfMRWY9MJburjz1/V7hbSQ1jNR8r9rWIRRs/v5oWwKxl4CUvuy5RP96wSs7d34//F8c
 Qz61iVEktZEmSEKlCmLtlsz4Rf5irIjxyl0KQfScyHKETrFJotn0fihwfLFEuGiUPlzOa/Aa
 WVupe1l1zoRwORzoDXmCM+I+4P8=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fa9aaf0f8c560b580a21b3a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 20:47:44
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2A475C43385; Mon,  9 Nov 2020 20:47:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61DAFC433C6;
        Mon,  9 Nov 2020 20:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61DAFC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 08/12] bus: mhi: core: Move to an error state on mission mode failure
Date:   Mon,  9 Nov 2020 12:47:27 -0800
Message-Id: <1604954851-23396-9-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
References: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the host receives a mission mode event and by the time it can get
to processing it, the register accesses fail implying a connectivity
error, MHI should move to an error state. This helps avoid longer wait
times from a synchronous power up perspective and accurately reflects
the MHI execution environment and power management states.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 0299196..06adea2 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -383,10 +383,14 @@ static int mhi_pm_mission_mode_transition(struct mhi_controller *mhi_cntrl)
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state))
 		mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
-	write_unlock_irq(&mhi_cntrl->pm_lock);
 
-	if (!MHI_IN_MISSION_MODE(mhi_cntrl->ee))
+	if (!MHI_IN_MISSION_MODE(mhi_cntrl->ee)) {
+		mhi_cntrl->pm_state = MHI_PM_LD_ERR_FATAL_DETECT;
+		write_unlock_irq(&mhi_cntrl->pm_lock);
+		wake_up_all(&mhi_cntrl->state_event);
 		return -EIO;
+	}
+	write_unlock_irq(&mhi_cntrl->pm_lock);
 
 	wake_up_all(&mhi_cntrl->state_event);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

