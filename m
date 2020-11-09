Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334C82AC62A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 21:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729452AbgKIUro (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 15:47:44 -0500
Received: from z5.mailgun.us ([104.130.96.5]:27449 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730205AbgKIUrl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 15:47:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604954861; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=bEEwVROBrSUxgXDAFycu3i5WXULTU9krChFLEaA0JyA=; b=YljDpAO5OGE5kThrjdASXVXtOzuTcKj5CLjdmHHVvqnzd05K5oQERTusT3UW6DoquPjADSZv
 Ti8hAiuQkAFYoMd6IfPRuDoON29ezU0ljbTBsTFu+72mloAgowTsZWvFywEFl6/ylaBng66d
 8oYFTRdiru40Yv/rq/rOFvuBAK8=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fa9aaedc1b74298b7e5b632 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 20:47:41
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5D38DC433C6; Mon,  9 Nov 2020 20:47:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 75450C433CB;
        Mon,  9 Nov 2020 20:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 75450C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v4 01/12] bus: mhi: core: Use appropriate names for firmware load functions
Date:   Mon,  9 Nov 2020 12:47:20 -0800
Message-Id: <1604954851-23396-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
References: <1604954851-23396-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

mhi_fw_load_sbl() function is currently used to transfer SBL or EDL
images over BHI (Boot Host Interface). Same goes with mhi_fw_load_amss()
which uses BHIe. However, the contents of these functions do not
indicate support for a specific set of images. Since these can be used
for any image download over BHI or BHIe, rename them based on the
protocol used.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 6f0cfb9..2d7752c 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -176,7 +176,7 @@ int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
 }
 EXPORT_SYMBOL_GPL(mhi_download_rddm_image);
 
-static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
+static int mhi_fw_load_bhie(struct mhi_controller *mhi_cntrl,
 			    const struct mhi_buf *mhi_buf)
 {
 	void __iomem *base = mhi_cntrl->bhie;
@@ -192,7 +192,7 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 	}
 
 	sequence_id = MHI_RANDOM_U32_NONZERO(BHIE_TXVECSTATUS_SEQNUM_BMSK);
-	dev_dbg(dev, "Starting AMSS download via BHIe. Sequence ID:%u\n",
+	dev_dbg(dev, "Starting image download via BHIe. Sequence ID: %u\n",
 		sequence_id);
 	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECADDR_HIGH_OFFS,
 		      upper_32_bits(mhi_buf->dma_addr));
@@ -223,7 +223,7 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 	return (!ret) ? -ETIMEDOUT : 0;
 }
 
-static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
+static int mhi_fw_load_bhi(struct mhi_controller *mhi_cntrl,
 			   dma_addr_t dma_addr,
 			   size_t size)
 {
@@ -250,7 +250,7 @@ static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
 	}
 
 	session_id = MHI_RANDOM_U32_NONZERO(BHI_TXDB_SEQNUM_BMSK);
-	dev_dbg(dev, "Starting SBL download via BHI. Session ID:%u\n",
+	dev_dbg(dev, "Starting image download via BHI. Session ID: %u\n",
 		session_id);
 	mhi_write_reg(mhi_cntrl, base, BHI_STATUS, 0);
 	mhi_write_reg(mhi_cntrl, base, BHI_IMGADDR_HIGH,
@@ -449,9 +449,9 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 		return;
 	}
 
-	/* Download SBL image */
+	/* Download image using BHI */
 	memcpy(buf, firmware->data, size);
-	ret = mhi_fw_load_sbl(mhi_cntrl, dma_addr, size);
+	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
 	mhi_free_coherent(mhi_cntrl, size, buf, dma_addr);
 
 	if (!mhi_cntrl->fbc_download || ret || mhi_cntrl->ee == MHI_EE_EDL)
@@ -459,7 +459,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	/* Error or in EDL mode, we're done */
 	if (ret) {
-		dev_err(dev, "MHI did not load SBL, ret:%d\n", ret);
+		dev_err(dev, "MHI did not load image over BHI, ret: %d\n", ret);
 		return;
 	}
 
@@ -509,11 +509,12 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 
 	/* Start full firmware image download */
 	image_info = mhi_cntrl->fbc_image;
-	ret = mhi_fw_load_amss(mhi_cntrl,
+	ret = mhi_fw_load_bhie(mhi_cntrl,
 			       /* Vector table is the last entry */
 			       &image_info->mhi_buf[image_info->entries - 1]);
 	if (ret)
-		dev_err(dev, "MHI did not load AMSS, ret:%d\n", ret);
+		dev_err(dev, "MHI did not load image over BHIe, ret: %d\n",
+			ret);
 
 	release_firmware(firmware);
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

