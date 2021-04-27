Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D277436BCCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 03:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234084AbhD0BCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Apr 2021 21:02:23 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15520 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232022AbhD0BCX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Apr 2021 21:02:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619485301; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=cQE9JilDJOa2KhIhSxMGyaQm0GJIxSgp8uqfU3KSHp4=; b=ucZWfYfeld5nvdMcOOkuLfN36/6Zy8B5xseDP/RT0AjjKOxH6d6hJ1lb/pjWcLPvmODshJ1Y
 XpQZmPu2B1n+dRmF05RZwkCflr0689ALHujeApPyGoUvPrjLRGVkKeo+7pGafrKApku9Rjfg
 fd3Rd0OcMPIs13Y/wzaeOQHjc1g=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60876274853c0a2c46625b2c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 01:01:40
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DFD94C43217; Tue, 27 Apr 2021 01:01:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CEC9EC433D3;
        Tue, 27 Apr 2021 01:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CEC9EC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH] bus: mhi: core: Improve debug messages for power on
Date:   Mon, 26 Apr 2021 18:00:57 -0700
Message-Id: <1619485258-35689-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Improve error message to be more descriptive if a failure occurs
with an invalid power on execution environment. Also add a debug
message to print the execution environment and MHI state before
a power on is attempted to get a better view of device states.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/pm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index adf426c..f4a8b9a 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1076,12 +1076,16 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	/* Confirm that the device is in valid exec env */
 	if (!MHI_IN_PBL(current_ee) && current_ee != MHI_EE_AMSS) {
-		dev_err(dev, "Not a valid EE for power on\n");
+		dev_err(dev, "%s is not a valid EE for power on\n",
+			TO_MHI_EXEC_STR(current_ee));
 		ret = -EIO;
 		goto error_async_power_up;
 	}
 
 	state = mhi_get_mhi_state(mhi_cntrl);
+	dev_dbg(dev, "Attempting power on with EE: %s, state: %s\n",
+		TO_MHI_EXEC_STR(current_ee), TO_MHI_STATE_STR(state));
+
 	if (state == MHI_STATE_SYS_ERR) {
 		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
 		ret = wait_event_timeout(mhi_cntrl->state_event,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

