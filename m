Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE33F3D9A08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 02:17:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232837AbhG2AR4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 20:17:56 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:17068 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232827AbhG2AR4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 20:17:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627517874; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=fG0L255WTmZR0Oti+x7xgTmjSfhj9hnFQipkUdam2CI=; b=fKOb5rLu5TcxtSkannMo9kS7JyWCKi1K2fyNbFF0i2FOu25SYLpkx0dSah9SOQBjcTKuChcA
 NEUQ+n4I0AUpQ18aBRj8j9FBtFg3zG60g3l4v1nWM6Fx2c20GxE7CfTltXoldDdcA00T8uVA
 oyiBUpoE+SgF5WVObcIbzbLNGK4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6101f3af17c2b4047dd5214e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 00:17:51
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5AE51C43147; Thu, 29 Jul 2021 00:17:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5693FC433F1;
        Thu, 29 Jul 2021 00:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5693FC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v2 1/2] bus: mhi: core: Move serial number read to power up phase
Date:   Wed, 28 Jul 2021 17:17:39 -0700
Message-Id: <1627517860-39417-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627517860-39417-1-git-send-email-bbhatt@codeaurora.org>
References: <1627517860-39417-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In some cases device may boot straight to ready and move to AMSS
execution environment. Serial number and OEM PK Hash values would
remain unpopulated in those scenarios. Move the reads for those
power up preparation phase for controllers to always have them
populated.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c | 17 +----------------
 drivers/bus/mhi/core/init.c | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 0a97262..e13d34c 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -394,28 +394,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	void *buf;
 	dma_addr_t dma_addr;
 	size_t size;
-	int i, ret;
+	int ret;
 
 	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
 		dev_err(dev, "Device MHI is not in valid state\n");
 		return;
 	}
 
-	/* save hardware info from BHI */
-	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_SERIALNU,
-			   &mhi_cntrl->serial_number);
-	if (ret)
-		dev_err(dev, "Could not capture serial number via BHI\n");
-
-	for (i = 0; i < ARRAY_SIZE(mhi_cntrl->oem_pk_hash); i++) {
-		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_OEMPKHASH(i),
-				   &mhi_cntrl->oem_pk_hash[i]);
-		if (ret) {
-			dev_err(dev, "Could not capture OEM PK HASH via BHI\n");
-			break;
-		}
-	}
-
 	/* wait for ready on pass through or any other execution environment */
 	if (mhi_cntrl->ee != MHI_EE_EDL && mhi_cntrl->ee != MHI_EE_PBL)
 		goto fw_load_ready_state;
diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 5aaca6d..d98a14b 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1065,7 +1065,7 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	u32 bhi_off, bhie_off;
-	int ret;
+	int i, ret;
 
 	mutex_lock(&mhi_cntrl->pm_mutex);
 
@@ -1124,6 +1124,21 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 
 	mutex_unlock(&mhi_cntrl->pm_mutex);
 
+	/* save hardware info from BHI */
+	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_SERIALNU,
+			   &mhi_cntrl->serial_number);
+	if (ret)
+		dev_err(dev, "Could not capture serial number via BHI\n");
+
+	for (i = 0; i < ARRAY_SIZE(mhi_cntrl->oem_pk_hash); i++) {
+		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_OEMPKHASH(i),
+				   &mhi_cntrl->oem_pk_hash[i]);
+		if (ret) {
+			dev_err(dev, "Could not capture OEM PK HASH via BHI\n");
+			break;
+		}
+	}
+
 	return 0;
 
 error_reg_offset:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

