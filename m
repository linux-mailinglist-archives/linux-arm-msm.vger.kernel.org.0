Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A613B4361
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 14:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbhFYMhT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 08:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231526AbhFYMhK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 08:37:10 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7959C0617AF
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 05:34:39 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id f10so4671576plg.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 05:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=26+KEZ0Hx72pvjQJfrOEoIc8ilnySOUXy/nlBhCQtpo=;
        b=YotlkkYFXipWrpHhbZnc7WPGJNhr6V4C7LtlckRCgvhIXOmkT9k9C4UEA3ym2/Ocqc
         ACXDQTu4TKQXGwoAJyvMkKdhbJDnmRSA6mzagez11GgFs/sBPOH/vcWB2qKcf6r2obbJ
         G+/QOhEkRs/cvE6z065OQYyqU1BwkFp4q/97q3Vzcov+DV2tfRRgsERYUjjX1soqi+uA
         s+HVgMVBKVZgVauxLGGTdhD1ltHOuoP1sIVvry3uMBA5D3Lfy2IXhjQoIQ7klGPHYwTv
         SQVX/fLGN4WBi/Vi1p8sviuonS5HaVCe7by3V8sqrBD5RmgOvUzJdbLJi303B66OXHmm
         kGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=26+KEZ0Hx72pvjQJfrOEoIc8ilnySOUXy/nlBhCQtpo=;
        b=Z831REhaDIHncI/c0HcYJNcQoZcn/IkGar9uNJSGrVHPJTNl7a6OuoNWpDCDq5aGqT
         KsZiVh2NPz4ZnKFcMUs9fN/v0FfkZW0qEan68ArSXXDcAjJTOxK0C4KC1iSTveMIQ4JM
         ID1/tmYESGXuRgeAODAX2871GswA0BzeqXDTFMNZgwP+EpvLh0dJhS/wm7MIV7uSRI7x
         EvXDERygSDZw8v2TD74Yo8SUXGP3hnXr7RaVvd4yDN1gY+qSLy6Qab0zV5SFYsXlcCwt
         0Q4a/NpUnciXhhfV1i/NfhO7laKOQFrI5tpfR/is/ySCXqn6qPLOQKo7Ar54vCVAmSox
         ywsQ==
X-Gm-Message-State: AOAM532qwSyyUKtRi4hpDY4hracs+Yfgr9ce+IU2FZ/Tt815+W3Cqhbw
        6ChPXhEEL4movqjtRGfGgRJm
X-Google-Smtp-Source: ABdhPJwplSV63K+fkZ99OOy7UJeouvBSrWrq86D2Mln3h3nVy3MtgOQYk6zuMQyDJAgNMohhnnKcEg==
X-Received: by 2002:a17:90a:2e87:: with SMTP id r7mr20900741pjd.232.1624624479187;
        Fri, 25 Jun 2021 05:34:39 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
        by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 05:34:38 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org,
        Jeffrey Hugo <quic_jhugo@quicinc.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 05/10] bus: mhi: core: Set BHI/BHIe offsets on power up preparation
Date:   Fri, 25 Jun 2021 18:03:50 +0530
Message-Id: <20210625123355.11578-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
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

