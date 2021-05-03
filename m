Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F1E372106
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 22:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhECUBs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 16:01:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31785 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229570AbhECUBr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 16:01:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620072054; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Wuobg4eBDGvYUWgobsliNOV3/u1xddo8tZNEDxUkFTQ=; b=UYHNQ0YmeaG2Ws7CbnA996h4bO9YTnoGzlyUF5ZGW3yWgbvDGfO/zls5tDIxloew6XWjE9SX
 Q6cmhuAKvSkcghogrXGzmLAKjV4gtYBwJU2aC/qtntD9jdXq/Jlz2vDn+sHTIXkNOQJWQzzQ
 m3NlA10WLelMktsEk34engxXlLs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 609056708166b7eff7a4902e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 May 2021 20:00:48
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 872CEC433D3; Mon,  3 May 2021 20:00:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A887AC433F1;
        Mon,  3 May 2021 20:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A887AC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2] bus: mhi: core: Improve debug messages for power up
Date:   Mon,  3 May 2021 13:00:38 -0700
Message-Id: <1620072038-36160-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Improve error message to be more descriptive if a failure occurs
with an invalid power up execution environment. Additionally, add
a debug log to print the execution environment and MHI state
before a power up is attempted to confirm if the device is in an
expected state. This helps clarify reasons for power up failures
such as the device being found in a PBL or Emergency Download
Mode execution environment and the host expected a full power up
with Pass-Through and no image loading involved.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
v2: Use power up instead of power on and update commit text with an example.

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

