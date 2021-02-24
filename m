Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0CC32477B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 00:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236281AbhBXXYS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 18:24:18 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:34056 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236233AbhBXXYG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 18:24:06 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614209023; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=fb3S0XyukQ8p2PVAxoSk3ODE/pSG696brbqnf0MzyqQ=; b=bXIozzoRx4sIhQVoGfGX8cvOkbHi0QtA3IZnrRckImf9N/hqhck+tZoisxv0dBKN11qUF92u
 ayLA2FVndgVCIb44oh4PSwKk5CvMPOG+UceP8ckmV/xE1KJBK6Pix9ZCnysbhZjiivZQxnve
 lrro6PCh+YLXNVmH7+RI9xVdA/Q=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6036dfe34511108a81eca1de (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 23:23:15
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 60515C43465; Wed, 24 Feb 2021 23:23:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 78704C43463;
        Wed, 24 Feb 2021 23:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 78704C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v6 4/4] bus: mhi: core: Update debug prints to include local device state
Date:   Wed, 24 Feb 2021 15:23:05 -0800
Message-Id: <1614208985-20851-5-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update debug prints to include local device in the BHI interrupt
handler. This helps show transitions better between MHI states.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 9715f51..4540f9e 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -440,9 +440,10 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 
 	state = mhi_get_mhi_state(mhi_cntrl);
 	ee = mhi_get_exec_env(mhi_cntrl);
-	dev_dbg(dev, "local ee:%s device ee:%s dev_state:%s\n",
-		TO_MHI_EXEC_STR(mhi_cntrl->ee), TO_MHI_EXEC_STR(ee),
-		TO_MHI_STATE_STR(state));
+	dev_dbg(dev, "local ee: %s state: %s device ee: %s state: %s\n",
+		TO_MHI_EXEC_STR(mhi_cntrl->ee),
+		TO_MHI_STATE_STR(mhi_cntrl->dev_state),
+		TO_MHI_EXEC_STR(ee), TO_MHI_STATE_STR(state));
 
 	if (state == MHI_STATE_SYS_ERR) {
 		dev_dbg(dev, "System error detected\n");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

