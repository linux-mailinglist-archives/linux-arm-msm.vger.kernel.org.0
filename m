Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4DA2AC640
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 21:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729969AbgKIUsV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 15:48:21 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:51128 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730555AbgKIUro (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 15:47:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604954864; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=JXwwA4GCOCIzmT5F1tbDtHpZe52qrjVA5fHe0ObdTnQ=; b=D2o2uzLYVEWIjClQHXbQkTdkwSVg9bc0kfqowfLKubPq6oae16ydr2zgYxv5id0jqe6Sersy
 MnBAkMZ4J0jiOwOW22ZM7hOVTLXMGN6L0y8wZclvZwTflXzod5D6KDi8HYEt5nLcjv4QHO61
 ziD1Ofg86WWRuEw3G34BK9TAX98=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fa9aaf0b82e1b98c650da30 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 20:47:44
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 924D0C433CB; Mon,  9 Nov 2020 20:47:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CC286C433F0;
        Mon,  9 Nov 2020 20:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CC286C433F0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 07/12] bus: mhi: core: Use appropriate label in firmware load handler API
Date:   Mon,  9 Nov 2020 12:47:26 -0800
Message-Id: <1604954851-23396-8-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
References: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct the "error_read" label to say "error_ready_state" as that
is the appropriate usage of the label.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 7b57bb9a..c2546bf 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -497,7 +497,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	if (ret) {
 		dev_err(dev, "MHI did not enter READY state\n");
-		goto error_read;
+		goto error_ready_state;
 	}
 
 	/* Wait for the SBL event */
@@ -508,7 +508,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	if (!ret || MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		dev_err(dev, "MHI did not enter SBL\n");
-		goto error_read;
+		goto error_ready_state;
 	}
 
 	/* Start full firmware image download */
@@ -524,7 +524,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	return;
 
-error_read:
+error_ready_state:
 	mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
 	mhi_cntrl->fbc_image = NULL;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

