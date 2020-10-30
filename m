Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F68C29FC89
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 05:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgJ3ELP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 00:11:15 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:15581 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgJ3ELL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 00:11:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604031071; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=uDkB0j/nHi+yko6XBTUhnB4d9dN2gZbTP2OcDO6gRrY=; b=a/sDQrh5LvZROKb2n8gFZSOdUdYzqMM72Axa9y3U1BWowsB3I9fWYxgvKvB/mH32CdjwOCyr
 N5+mQNnLtcaPEJ3z7KGv4Hza+BzSlhO2LSIOBsiF3KcjfXsT/TSKL3DkFbnXnCBcsEUZQEGd
 LFwa4zMDj166mrd4mSUh4qdVegI=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f9b925ed292ba49084dc76f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 04:11:10
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0F157C433C9; Fri, 30 Oct 2020 04:11:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1EE3DC43385;
        Fri, 30 Oct 2020 04:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1EE3DC43385
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 09/12] bus: mhi: core: Check for IRQ availability during registration
Date:   Thu, 29 Oct 2020 21:10:54 -0700
Message-Id: <1604031057-32820-10-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604031057-32820-1-git-send-email-bbhatt@codeaurora.org>
References: <1604031057-32820-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Current design allows a controller to register with MHI successfully
without the need to have any IRQs available for use. If no IRQs are
available, power up requests to MHI can fail after a successful
registration with MHI. Improve the design by checking for the number
of IRQs available sooner within the mhi_regsiter_controller() API as
it is required to be specified by the controller.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/init.c | 2 +-
 drivers/bus/mhi/core/pm.c   | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 23b6dd6..5dd9e39 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -858,7 +858,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 
 	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
 	    !mhi_cntrl->status_cb || !mhi_cntrl->read_reg ||
-	    !mhi_cntrl->write_reg)
+	    !mhi_cntrl->write_reg || !mhi_cntrl->nr_irqs)
 		return -EINVAL;
 
 	ret = parse_config(mhi_cntrl, config);
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 06adea2..1d04e401 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -926,9 +926,6 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	dev_info(dev, "Requested to power ON\n");
 
-	if (mhi_cntrl->nr_irqs < 1)
-		return -EINVAL;
-
 	/* Supply default wake routines if not provided by controller driver */
 	if (!mhi_cntrl->wake_get || !mhi_cntrl->wake_put ||
 	    !mhi_cntrl->wake_toggle) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

