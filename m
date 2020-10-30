Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA34129FADE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 02:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgJ3Bwm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 21:52:42 -0400
Received: from z5.mailgun.us ([104.130.96.5]:59408 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726316AbgJ3BwQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 21:52:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604022735; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Jyvek/c6lIid48UaEZHpOQPl/gpSLmzHNt+y9QNDwCs=; b=NC4nS+6/UfaEazV/S6rg2OUj06FGGnkpESqoajtJvmdW1K/ZZGT+8zjasQF5fqJfazvCl8hI
 Sgu7BUKKXIgF8V0Q+tK7YwsN0QrimUgB+Bq4NPlsYKg2Z9EFa3xwY8aBwleBXvMOehecIDwX
 X5UcVZVD6kggKlikrIN+FB3zWpY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f9b71cfd292ba49082b21e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 01:52:15
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8373CC433CB; Fri, 30 Oct 2020 01:52:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E2DC2C433C9;
        Fri, 30 Oct 2020 01:52:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E2DC2C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 07/12] bus: mhi: core: Use appropriate label in firmware load handler API
Date:   Thu, 29 Oct 2020 18:51:58 -0700
Message-Id: <1604022723-34578-8-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604022723-34578-1-git-send-email-bbhatt@codeaurora.org>
References: <1604022723-34578-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct the "error_read" label to say "error_ready_state" as that
is the appropriate usage of the label.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index cec5010..6b4c51e 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -494,7 +494,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	if (ret) {
 		dev_err(dev, "MHI did not enter READY state\n");
-		goto error_read;
+		goto error_ready_state;
 	}
 
 	/* Wait for the SBL event */
@@ -505,7 +505,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		dev_err(dev, "MHI did not enter SBL\n");
-		goto error_read;
+		goto error_ready_state;
 	}
 
 	/* Start full firmware image download */
@@ -521,7 +521,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	return;
 
-error_read:
+error_ready_state:
 	mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
 	mhi_cntrl->fbc_image = NULL;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

