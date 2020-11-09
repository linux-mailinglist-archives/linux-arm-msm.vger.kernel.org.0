Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813E82AC62F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 21:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730852AbgKIUrr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 15:47:47 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:51128 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730782AbgKIUrq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 15:47:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604954866; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=r0d7EyWfKzUQa59bYiXNyyq8NkCyioadxwXdx9xDQYw=; b=OKYxJDls7rQGAnPCiAUNhoNPR04ONhzVcoZBndaVOND4ALoJhXhh1WwbNK4WJ5qqG6JtRSN3
 5wEem7KoOZfbIahhmZZOFQ+37OUio4XBRaWcUGwKA4hPYd9E7JNaKAqcIUlepL5yS0wXpX3e
 8YU1xc10LvQfjVvZjQAzqJggRjU=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fa9aaf2f8c560b580a21d50 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 20:47:46
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2004FC43387; Mon,  9 Nov 2020 20:47:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E989DC43382;
        Mon,  9 Nov 2020 20:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E989DC43382
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 09/12] bus: mhi: core: Check for IRQ availability during registration
Date:   Mon,  9 Nov 2020 12:47:28 -0800
Message-Id: <1604954851-23396-10-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
References: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 2 +-
 drivers/bus/mhi/core/pm.c   | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 877e40c..2534f1c 100644
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

