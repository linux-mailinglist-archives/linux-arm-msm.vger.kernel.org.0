Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF1211BE923
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 22:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727794AbgD2Uwr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 16:52:47 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:31163 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727768AbgD2Uwr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 16:52:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588193567; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=lCTsgEWMTt3U5oHW/87m59ypKpEeo0ETAuLI4cY6/+c=; b=Dz1vmcCfR0U4etY2/L7qyEXfnscJQnJkxnQ1oQHEKTVekTBCdKcUiQuxBnMZ9mbmeh1jjBN+
 VN1p4w4Zdeti+Qo3Y6AlB4vD/n+36Pgelm8weKL5lbUMf60gz2sAL8IjR67nX2jDk0+QRvXb
 ORLMik21WXlPE/5YSS++qhuu2UM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea9e91b.7f737703ff80-smtp-out-n03;
 Wed, 29 Apr 2020 20:52:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 96DB9C433BA; Wed, 29 Apr 2020 20:52:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A32F7C433F2;
        Wed, 29 Apr 2020 20:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A32F7C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 8/9] bus: mhi: core: Improve debug logs for loading firmware
Date:   Wed, 29 Apr 2020 13:52:30 -0700
Message-Id: <1588193551-31439-9-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1588193551-31439-1-git-send-email-bbhatt@codeaurora.org>
References: <1588193551-31439-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add log messages to track boot flow errors and timeouts in SBL or AMSS
firmware loading to aid in debug.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 4e49a0e..0bc9c50 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -121,7 +121,8 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 		ee = mhi_get_exec_env(mhi_cntrl);
 	}
 
-	dev_dbg(dev, "Waiting for image download completion, current EE: %s\n",
+	dev_dbg(dev,
+		"Waiting for RDDM image download via BHIe, current EE:%s\n",
 		TO_MHI_EXEC_STR(ee));
 
 	while (retry--) {
@@ -152,11 +153,14 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 int mhi_download_rddm_img(struct mhi_controller *mhi_cntrl, bool in_panic)
 {
 	void __iomem *base = mhi_cntrl->bhie;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	u32 rx_status;
 
 	if (in_panic)
 		return __mhi_download_rddm_in_panic(mhi_cntrl);
 
+	dev_dbg(dev, "Waiting for RDDM image download via BHIe\n");
+
 	/* Wait for the image download to complete */
 	wait_event_timeout(mhi_cntrl->state_event,
 			   mhi_read_reg_field(mhi_cntrl, base,
@@ -174,6 +178,7 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 			    const struct mhi_buf *mhi_buf)
 {
 	void __iomem *base = mhi_cntrl->bhie;
+	struct device *dev = &mhi_cntrl->mhi_dev->dev;
 	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
 	u32 tx_status, sequence_id;
 	int ret;
@@ -184,6 +189,7 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 		return -EIO;
 	}
 
+	dev_dbg(dev, "Starting AMSS download via BHIe\n");
 	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECADDR_HIGH_OFFS,
 		      upper_32_bits(mhi_buf->dma_addr));
 
@@ -441,7 +447,12 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 		release_firmware(firmware);
 
 	/* Error or in EDL mode, we're done */
-	if (ret || mhi_cntrl->ee == MHI_EE_EDL)
+	if (ret) {
+		dev_err(dev, "MHI did not load SBL, ret:%d\n", ret);
+		return;
+	}
+
+	if (mhi_cntrl->ee == MHI_EE_EDL)
 		return;
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
@@ -469,8 +480,10 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	if (!mhi_cntrl->fbc_download)
 		return;
 
-	if (ret)
+	if (ret) {
+		dev_err(dev, "MHI did not enter READY state\n");
 		goto error_read;
+	}
 
 	/* Wait for the SBL event */
 	ret = wait_event_timeout(mhi_cntrl->state_event,
@@ -488,6 +501,8 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	ret = mhi_fw_load_amss(mhi_cntrl,
 			       /* Vector table is the last entry */
 			       &image_info->mhi_buf[image_info->entries - 1]);
+	if (ret)
+		dev_err(dev, "MHI did not load AMSS, ret:%d\n", ret);
 
 	release_firmware(firmware);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
