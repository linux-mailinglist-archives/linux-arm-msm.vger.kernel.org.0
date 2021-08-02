Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505233DCFF0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Aug 2021 07:13:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231136AbhHBFNi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 01:13:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbhHBFNi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 01:13:38 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027A2C06175F
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 Aug 2021 22:13:29 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id e21so18374731pla.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Aug 2021 22:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=26+KEZ0Hx72pvjQJfrOEoIc8ilnySOUXy/nlBhCQtpo=;
        b=Gc7k5WBLgtQ3f+qEEwp+chkg6CWMWBQdmb3KztQKuqS4hsq0h+ov5dgY7wkXUmM72E
         UJ61Waltl0m9sCfuWXFyZFtgwDs7M+M/SCizhWWG4TptTA51EBv3xpiZynzf79h7lX1j
         yiTb3VaJTGmAbySaPey3W8cSlGOASFJ4ejm6HaLf7ZcnzOF1sPsW7Yy/u4HpzToJf3Dx
         y7BjK599UR0+KYI5neaYG7IzJZTgXiQs6r5IPKOWMOmqriSm+GgcfzMrBpc0TSzw0ZIp
         9QW7xBCwF8VoW4hFdJnT0sgVPJPJ7eSCdwUv488ddPfdyhq5/Wi9JU1Yx5cMyCrL1ID9
         WWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=26+KEZ0Hx72pvjQJfrOEoIc8ilnySOUXy/nlBhCQtpo=;
        b=I9vE6FYYNyMeNv74nrSaUFxgaJv/7dyHSnEpwl2k4+Qcz0x4L3orxIBaHvlr57ayJI
         IxvOL0JyN/njEVIqLtXkNttHBXyeF362pNQfYIfdvAfvPMVU77vK20wNitCX1VWDw3A6
         Fws56JukF31RrE5EAG0ryvky3BE3l6QAeKzOE+ZxARFplQox+fgQrZzLu4qyJCiCy5C0
         kS3/Utt3iaG41QaGe4BUDKh2Q0L5ApNFWIHkr3Yh/3J5pjZYjgYkRW030BVbDdC5jQlR
         HqTOo37e1ttxG7KTd9WqcflgamU2ZEzB8bj3plXW8IySZq1r6b8WGB03xyA/i2rji8BG
         V/+A==
X-Gm-Message-State: AOAM530KI1q6UcpzayGAy2+hlkvpt8xh77yACnnKCgPJ4Hc/jdpIQnvH
        VntHZuVmavBf3XeOBeliVdg+
X-Google-Smtp-Source: ABdhPJysxfeDSnjkqOWcRq/135t8nSdBqZ9/7xIhFh4V/bvZwPF/VfhKJm0YnmIHOq1dFC2b2bfTsw==
X-Received: by 2002:a17:90a:b10f:: with SMTP id z15mr6086796pjq.56.1627881208529;
        Sun, 01 Aug 2021 22:13:28 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:6e99:242f:6391:b1b4:1ad8:fbdf])
        by smtp.gmail.com with ESMTPSA id x26sm9947000pfm.77.2021.08.01.22.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 22:13:28 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 03/10] bus: mhi: core: Set BHI/BHIe offsets on power up preparation
Date:   Mon,  2 Aug 2021 10:42:48 +0530
Message-Id: <20210802051255.5771-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
References: <20210802051255.5771-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Set the BHI and/or BHIe offsets in mhi_prepare_for_power_up(),
rearrange the function, and remove the equivalent from
mhi_async_power_up(). This helps consolidate multiple checks
in different parts of the driver and can help MHI fail early on
before power up begins if the offsets are not read correctly.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1620330705-40192-2-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 42 ++++++++++++++++++++-----------------
 drivers/bus/mhi/core/pm.c   | 28 ++++---------------------
 2 files changed, 27 insertions(+), 43 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index c81b377fca8f..11c7a3d3c9bf 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1063,7 +1063,7 @@ EXPORT_SYMBOL_GPL(mhi_free_controller);
 int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-	u32 bhie_off;
+	u32 bhi_off, bhie_off;
 	int ret;
 
 	mutex_lock(&mhi_cntrl->pm_mutex);
@@ -1072,29 +1072,36 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 	if (ret)
 		goto error_dev_ctxt;
 
-	/*
-	 * Allocate RDDM table if specified, this table is for debugging purpose
-	 */
-	if (mhi_cntrl->rddm_size) {
-		mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
-				     mhi_cntrl->rddm_size);
+	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &bhi_off);
+	if (ret) {
+		dev_err(dev, "Error getting BHI offset\n");
+		goto error_reg_offset;
+	}
+	mhi_cntrl->bhi = mhi_cntrl->regs + bhi_off;
 
-		/*
-		 * This controller supports RDDM, so we need to manually clear
-		 * BHIE RX registers since POR values are undefined.
-		 */
+	if (mhi_cntrl->fbc_download || mhi_cntrl->rddm_size) {
 		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIEOFF,
 				   &bhie_off);
 		if (ret) {
 			dev_err(dev, "Error getting BHIE offset\n");
-			goto bhie_error;
+			goto error_reg_offset;
 		}
-
 		mhi_cntrl->bhie = mhi_cntrl->regs + bhie_off;
+	}
+
+	if (mhi_cntrl->rddm_size) {
+		/*
+		 * This controller supports RDDM, so we need to manually clear
+		 * BHIE RX registers since POR values are undefined.
+		 */
 		memset_io(mhi_cntrl->bhie + BHIE_RXVECADDR_LOW_OFFS,
 			  0, BHIE_RXVECSTATUS_OFFS - BHIE_RXVECADDR_LOW_OFFS +
 			  4);
-
+		/*
+		 * Allocate RDDM table for debugging purpose if specified
+		 */
+		mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->rddm_image,
+				     mhi_cntrl->rddm_size);
 		if (mhi_cntrl->rddm_image)
 			mhi_rddm_prepare(mhi_cntrl, mhi_cntrl->rddm_image);
 	}
@@ -1103,11 +1110,8 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 
 	return 0;
 
-bhie_error:
-	if (mhi_cntrl->rddm_image) {
-		mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->rddm_image);
-		mhi_cntrl->rddm_image = NULL;
-	}
+error_reg_offset:
+	mhi_deinit_dev_ctxt(mhi_cntrl);
 
 error_dev_ctxt:
 	mutex_unlock(&mhi_cntrl->pm_mutex);
diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index bbf6cd04861e..ff7cdc8653ef 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -1059,28 +1059,8 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	if (ret)
 		goto error_setup_irq;
 
-	/* Setup BHI offset & INTVEC */
+	/* Setup BHI INTVEC */
 	write_lock_irq(&mhi_cntrl->pm_lock);
-	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIOFF, &val);
-	if (ret) {
-		write_unlock_irq(&mhi_cntrl->pm_lock);
-		goto error_bhi_offset;
-	}
-
-	mhi_cntrl->bhi = mhi_cntrl->regs + val;
-
-	/* Setup BHIE offset */
-	if (mhi_cntrl->fbc_download) {
-		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, BHIEOFF, &val);
-		if (ret) {
-			write_unlock_irq(&mhi_cntrl->pm_lock);
-			dev_err(dev, "Error reading BHIE offset\n");
-			goto error_bhi_offset;
-		}
-
-		mhi_cntrl->bhie = mhi_cntrl->regs + val;
-	}
-
 	mhi_write_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_INTVEC, 0);
 	mhi_cntrl->pm_state = MHI_PM_POR;
 	mhi_cntrl->ee = MHI_EE_MAX;
@@ -1091,7 +1071,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 	if (!MHI_IN_PBL(current_ee) && current_ee != MHI_EE_AMSS) {
 		dev_err(dev, "Not a valid EE for power on\n");
 		ret = -EIO;
-		goto error_bhi_offset;
+		goto error_async_power_up;
 	}
 
 	state = mhi_get_mhi_state(mhi_cntrl);
@@ -1110,7 +1090,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 		if (!ret) {
 			ret = -EIO;
 			dev_info(dev, "Failed to reset MHI due to syserr state\n");
-			goto error_bhi_offset;
+			goto error_async_power_up;
 		}
 
 		/*
@@ -1132,7 +1112,7 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
 
 	return 0;
 
-error_bhi_offset:
+error_async_power_up:
 	mhi_deinit_free_irq(mhi_cntrl);
 
 error_setup_irq:
-- 
2.25.1

