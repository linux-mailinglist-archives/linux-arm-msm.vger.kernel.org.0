Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 028842CB96E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388509AbgLBJoT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:44:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388508AbgLBJoR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:17 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F690C094241
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:43:38 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id p6so820190plr.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w1qiZN/4S+9EMfWyy+8/u8wFtLnh3UkIHeGY4tC9U34=;
        b=zjf7dqj9hi2/BvOyAMs9XQ39ZYbjNabsET/QZakL/4MpzRgj4wOZg0CsnlY2V1y+8+
         m6JdzUQ8cnT4nm6CRs0q/PvTx/hIouMTTtNNuteE6fa8q5chTEVplfFDwA9ki2gZTYjG
         wO0pcULhGhzHM+bpqqM5p7zg3xzJFjkux5IhRcTrQaPTbn8salQyrWvtQR6jBhfvxo21
         i7gkC9F5QnjH6PhHTzXB0EmpoSJ33brqRVYwD2bvpmnASLxnBBVVM/FkvWAgOQu9NTWP
         44YvYTMHjG9N/KKWru3yuxxv952M/FHimSsCkpC96vyjvPxZTAbQhoFRy7ZSDsS/63Bb
         wmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w1qiZN/4S+9EMfWyy+8/u8wFtLnh3UkIHeGY4tC9U34=;
        b=XuJB0ATy7oTk3CSGk5xXZIbaeB1kHvAtYrh1UwKESWSQXIDNY+N4K9lCsMHHUK5Rxl
         svfqzeX8uQEPMj4UQetQWCL4UFD9yZ/3nX4pz7liJZrrMv+x9DCUbgZMQJ+MXMTeDa10
         dCGT37y/R21CHijcT6aF12OQAC7ziFywrj26Us8bx3qXfR0j+sUYce3VU10ngcr5ziQ7
         VWeXdBPHz9moso1cQqdo2pxsnw17RDjMBtHtZjE9lRL6WA2qBBP5iEdhRZANVWV8+fkF
         Bb7HwrvasUJX0/i5HFGBq70MI2RwKwZrOe6HJ1fRUDj0fTjTxtxM1wD0GJzQxtjIeyuF
         Ukfg==
X-Gm-Message-State: AOAM531m35EScisrr+5itTQ+tt8gvtwJfKc1T27NWZanarCutysaAj7N
        GpeWr2+EdveutWLdxMtNMjGQ
X-Google-Smtp-Source: ABdhPJyUBGZf0zRq1kYDq+2EEadjYlqpqZtoOsS/Zsiz+hnhGsAtvcAxzpqSIiWsZ37rks2CxK9JfA==
X-Received: by 2002:a17:902:b783:b029:da:6567:f244 with SMTP id e3-20020a170902b783b02900da6567f244mr1811669pls.45.1606902217527;
        Wed, 02 Dec 2020 01:43:37 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:43:36 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 18/29] bus: mhi: core: Move to an error state on any firmware load failure
Date:   Wed,  2 Dec 2020 15:11:48 +0530
Message-Id: <20201202094159.107075-19-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Move MHI to a firmware download error state for a failure to find
the firmware files or to load SBL or EBL image using BHI/BHIe. This
helps detect an error state sooner and shortens the wait for a
synchronous power up timeout.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 2d7752cd9ccc..7b57bb9a3080 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -428,13 +428,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 						     !mhi_cntrl->seg_len))) {
 		dev_err(dev,
 			"No firmware image defined or !sbl_size || !seg_len\n");
-		return;
+		goto error_fw_load;
 	}
 
 	ret = request_firmware(&firmware, fw_name, dev);
 	if (ret) {
 		dev_err(dev, "Error loading firmware: %d\n", ret);
-		return;
+		goto error_fw_load;
 	}
 
 	size = (mhi_cntrl->fbc_download) ? mhi_cntrl->sbl_size : firmware->size;
@@ -446,7 +446,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	buf = mhi_alloc_coherent(mhi_cntrl, size, &dma_addr, GFP_KERNEL);
 	if (!buf) {
 		release_firmware(firmware);
-		return;
+		goto error_fw_load;
 	}
 
 	/* Download image using BHI */
@@ -454,17 +454,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
 	mhi_free_coherent(mhi_cntrl, size, buf, dma_addr);
 
-	if (!mhi_cntrl->fbc_download || ret || mhi_cntrl->ee == MHI_EE_EDL)
-		release_firmware(firmware);
-
 	/* Error or in EDL mode, we're done */
 	if (ret) {
 		dev_err(dev, "MHI did not load image over BHI, ret: %d\n", ret);
-		return;
+		release_firmware(firmware);
+		goto error_fw_load;
 	}
 
-	if (mhi_cntrl->ee == MHI_EE_EDL)
+	if (mhi_cntrl->ee == MHI_EE_EDL) {
+		release_firmware(firmware);
 		return;
+	}
 
 	write_lock_irq(&mhi_cntrl->pm_lock);
 	mhi_cntrl->dev_state = MHI_STATE_RESET;
@@ -477,13 +477,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	if (mhi_cntrl->fbc_download) {
 		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
 					   firmware->size);
-		if (ret)
-			goto error_alloc_fw_table;
+		if (ret) {
+			release_firmware(firmware);
+			goto error_fw_load;
+		}
 
 		/* Load the firmware into BHIE vec table */
 		mhi_firmware_copy(mhi_cntrl, firmware, mhi_cntrl->fbc_image);
 	}
 
+	release_firmware(firmware);
+
 fw_load_ee_pthru:
 	/* Transitioning into MHI RESET->READY state */
 	ret = mhi_ready_state_transition(mhi_cntrl);
@@ -512,11 +516,11 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	ret = mhi_fw_load_bhie(mhi_cntrl,
 			       /* Vector table is the last entry */
 			       &image_info->mhi_buf[image_info->entries - 1]);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "MHI did not load image over BHIe, ret: %d\n",
 			ret);
-
-	release_firmware(firmware);
+		goto error_fw_load;
+	}
 
 	return;
 
@@ -524,6 +528,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
 	mhi_cntrl->fbc_image = NULL;
 
-error_alloc_fw_table:
-	release_firmware(firmware);
+error_fw_load:
+	mhi_cntrl->pm_state = MHI_PM_FW_DL_ERR;
+	wake_up_all(&mhi_cntrl->state_event);
 }
-- 
2.25.1

