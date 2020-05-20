Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15C231DA69D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 02:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgETAbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 20:31:03 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:21923 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728466AbgETAbC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 20:31:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589934662; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=nYdqJl/+cJjw0ASKWTqA2nWiG8fIOftxbKtxBp4bd1w=; b=e4FxQ6XVMFQrHXYUrNEeRXKcmDDuiJiE4ZIFF8ZpAXQi8l4/mkfN79/LOh6x1uN8b6cB/uJ0
 qMa8A9ZBRJpP/kMT/xXwN4m8rr0ncDFswDpOP8/b1Uxk3QSswtCtW7ZCDodZ3V5MU00fNosK
 D5AlL5s5GWTrOhU0heF8YS3+9qk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec47a30.7f1286f18340-smtp-out-n05;
 Wed, 20 May 2020 00:30:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 21EE6C43391; Wed, 20 May 2020 00:30:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bbhatt-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 33F46C433C8;
        Wed, 20 May 2020 00:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 33F46C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v1 4/6] bus: mhi: core: Use common name for BHI firmware load function
Date:   Tue, 19 May 2020 17:30:29 -0700
Message-Id: <1589934631-22752-5-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589934631-22752-1-git-send-email-bbhatt@codeaurora.org>
References: <1589934631-22752-1-git-send-email-bbhatt@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

mhi_fw_load_sbl() function is currently used to transfer SBL or EDL
images over BHI (Boot Host Interface). Moreover, its contents do not
indicate anything regarding support for a specific set of images. Since
it can be used for any image download over BHI, it can be appropriately
renamed mhi_fw_load_bhi() instead.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/core/boot.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 24422f5..34ce102 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -218,7 +218,7 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 	return (!ret) ? -ETIMEDOUT : 0;
 }
 
-static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
+static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 			   dma_addr_t dma_addr,
 			   size_t size)
 {
@@ -245,7 +245,7 @@ static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
 	}
 
 	session_id = MHI_RANDOM_U32_NONZERO(BHI_TXDB_SEQNUM_BMSK);
-	dev_dbg(dev, "Starting SBL download via BHI. Session ID:%u\n",
+	dev_dbg(dev, "Starting SBL/EDL download via BHI. Session ID:%u\n",
 		session_id);
 	mhi_write_reg(mhi_cntrl, base, BHI_STATUS, 0);
 	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_HIGH,
@@ -446,9 +446,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 		return;
 	}
 
-	/* Download SBL image */
+	/* Download SBL or EDL image using BHI */
 	memcpy(buf, firmware->data, size);
-	ret = mhi_fw_load_sbl(mhi_cntrl, dma_addr, size);
+	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
 	mhi_free_coherent(mhi_cntrl, size, buf, dma_addr);
 
 	if (!mhi_cntrl->fbc_download || ret || mhi_cntrl->ee == MHI_EE_EDL)
@@ -456,7 +456,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	/* Error or in EDL mode, we're done */
 	if (ret) {
-		dev_err(dev, "MHI did not load SBL, ret:%d\n", ret);
+		dev_err(dev, "MHI did not load SBL/EDL image, ret:%d\n", ret);
 		return;
 	}
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
