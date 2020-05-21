Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1ADE1DD3C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 19:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730161AbgEURDd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 13:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730081AbgEURDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 13:03:32 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E28A6C061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:03:32 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id 5so3368527pjd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YtxBsNcbjxYaraBBLc9LHB2kflGQYubfrn2EZIQwrU0=;
        b=b4LS6EOrYJ77BRIRZ6pJ5vVyrlCp5wg95KEK1sPqN6gxGXAkd2wcD8TTW8Sek9FQMx
         sfMVFbnlmlsY3Hx25u6yvpu+gsfZ4chiK+7yZgLa9JsZAJFzqQRpSpJDpS0o+JoTXBNV
         IAWRY9VpGrAloV6/qeSMc43R+lc7AToLeDB3tB66THs/JiqNYl6Pxhn1njxW28SkFgFM
         6rFBtTu112DCrhUZ6rO/xcwaDB68P/s7yseyyRUtzKghotL0YAGJRe7DMbhyoRLcRPZ/
         GB3wOapfTdKm1axHODM+BEUa6AjmG5fWCCQYxiAsQJx2+zhkm2ENXCA+5XTbV2bZtegU
         6j6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YtxBsNcbjxYaraBBLc9LHB2kflGQYubfrn2EZIQwrU0=;
        b=DbCHS53ut2T3dLunm2JU8qSQ1wKHdN1u3uJX6gN6LdZvXmvnWntrwKbmrcrIXaVzZG
         tNNehJGPk8HJzP0Ot9nGVBRXrpHLp4sMfCkoovb6NfmpaLpKQpOjUD9KO47T8krwKIEE
         Zs2qYDz4NXGa1yafEv7k/8gYIw0NRypkX4bb0qvW70COO8QdryOe8VE+WoGXtSoAIOFG
         CndXHHG4JVdPl/0DCm0vimbRBH1ySTaJBcu/3HGlse+GIPJkhn44bfUZ7ux3J/Ati315
         kV/h33oph7SLDPC6mLiqchGa0OkoEZhozSkgIETDidWn8Bp0C7tK4QGWtRooP+SqJvzP
         8odg==
X-Gm-Message-State: AOAM531uEJ1fXJ0iHRR6bW6Te87lYv+Y9Y2++M1GU7RcovSJZUPhHASE
        sLDaLtbAdrsyfM26krLr7k9q
X-Google-Smtp-Source: ABdhPJz0iOQTtcPaebEEwAJTWKYsd502KMhJzhCJ2v9aWfem8Z1ZcaR1nf+xTbh4u10X9B1luFMBMQ==
X-Received: by 2002:a17:90b:a13:: with SMTP id gg19mr12498675pjb.49.1590080612407;
        Thu, 21 May 2020 10:03:32 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:69f:45f2:3d8d:3719:f568:7ee9])
        by smtp.gmail.com with ESMTPSA id e26sm4874693pff.137.2020.05.21.10.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 10:03:31 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH 07/14] bus: mhi: core: Improve debug logs for loading firmware
Date:   Thu, 21 May 2020 22:32:42 +0530
Message-Id: <20200521170249.21795-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521170249.21795-1-manivannan.sadhasivam@linaro.org>
References: <20200521170249.21795-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Add log messages to track boot flow errors and timeouts in SBL or AMSS
firmware loading to aid in debug.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index cf6dc5a2361c..80e4d7609aaa 100644
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
 
@@ -435,7 +441,12 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
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
@@ -463,8 +474,10 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	if (!mhi_cntrl->fbc_download)
 		return;
 
-	if (ret)
+	if (ret) {
+		dev_err(dev, "MHI did not enter READY state\n");
 		goto error_read;
+	}
 
 	/* Wait for the SBL event */
 	ret = wait_event_timeout(mhi_cntrl->state_event,
@@ -482,6 +495,8 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
 	ret = mhi_fw_load_amss(mhi_cntrl,
 			       /* Vector table is the last entry */
 			       &image_info->mhi_buf[image_info->entries - 1]);
+	if (ret)
+		dev_err(dev, "MHI did not load AMSS, ret:%d\n", ret);
 
 	release_firmware(firmware);
 
-- 
2.17.1

