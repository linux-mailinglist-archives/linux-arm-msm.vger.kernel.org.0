Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2794E2CB975
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388527AbgLBJob (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:44:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388545AbgLBJoa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:30 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7829FC0613D6
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:43:10 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id q10so905275pfn.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VefEV681jSKxcJU1jLAzMKiv4DpHh1pRZytDsbLE6rI=;
        b=EKp9MPdvCHsGtHxa+NUUvBYTlS664LJUQRa3H/N3KWIxDe/2XFurkuOlBJgQ0jx/6+
         AJrT1h3oNYdoUViXsbU8jXcUByIqK0+TgHrJynwb0EifTjvedBD5PgtMAl4x+5F9A0Ys
         sYGhcxpMAKIIKkoBzfsqUrjxIG5fU+Qsq2kyEvmeeBWtQbHYSUcy3DlF8w+x1a2dj1r6
         ZfAc9mNt8qaVUhYc60rjUHjmSspesmIp59ULrFA3/3C/2beMNSAgDyJvxrUUKxtrZD23
         7ZvK8Be5+CFC3MNR6zy21fE2TeINU/RXH9tfjY3bXVpBzXHWknyJKutPWeJ0obXJ7PGu
         9QNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VefEV681jSKxcJU1jLAzMKiv4DpHh1pRZytDsbLE6rI=;
        b=tpdkNguT6SIpeSLm0N0WByESUEoet/nI5+OkEdln6NxlWg0lgwVzYxcY9FlK6C5F7+
         i5VBurHS4RqOMMP45Jv6j4RXLl1MO2ojVuNLgP15nMvVx7WSf/sE4ptdR0JeH6zgr7ha
         ZfNbCBOfZ0nFcHhk6q0AHk9+sGfv/aK9Cf7eGJmlDEb2BG1YgnPSpSp4vhXSnOyWOAjZ
         v3QzQCuLC9InRx76jfgnNAzl04wTC3B1lFFA/JxyRhezHIVSNcMipBNvbAbVANmKcyRu
         002rCVjOIWf3H6L40wfkJrvg3rJTZYRieKJUUxsCKMr2mPXYkR/4DxAMGWIVR2Yz1OUt
         HwnA==
X-Gm-Message-State: AOAM533/KLLcUWlUq/8LvaWkIijpoZbez2VltOSmA4tlmLARDkxIO9OR
        H6yy1uozkCiu63YgZCvojTju
X-Google-Smtp-Source: ABdhPJwev7vA1dTZdgTLqnc/1geQ0xdkcXa7rF9r2e5KJxeOQ6rVC6r307SGgj5FvqvuQJpTxE84Xg==
X-Received: by 2002:a62:ed11:0:b029:19a:e1cd:ca96 with SMTP id u17-20020a62ed110000b029019ae1cdca96mr2092823pfh.38.1606902189977;
        Wed, 02 Dec 2020 01:43:09 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:43:09 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 11/29] bus: mhi: core: Rename RDDM download function to use proper words
Date:   Wed,  2 Dec 2020 15:11:41 +0530
Message-Id: <20201202094159.107075-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

mhi_download_rddm_img() uses a shorter version of the word image.
Expand it and rename the function to mhi_download_rddm_image().

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c | 4 ++--
 include/linux/mhi.h         | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 6b6fd9668c3b..16244cc8fbe7 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -147,7 +147,7 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 }
 
 /* Download RDDM image from device */
-int mhi_download_rddm_img(struct mhi_controller *mhi_cntrl, bool in_panic)
+int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic)
 {
 	void __iomem *base = mhi_cntrl->bhie;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
@@ -169,7 +169,7 @@ int mhi_download_rddm_img(struct mhi_controller *mhi_cntrl, bool in_panic)
 
 	return (rx_status == BHIE_RXVECSTATUS_STATUS_XFER_COMPL) ? 0 : -EIO;
 }
-EXPORT_SYMBOL_GPL(mhi_download_rddm_img);
+EXPORT_SYMBOL_GPL(mhi_download_rddm_image);
 
 static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 			    const struct mhi_buf *mhi_buf)
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 9225d5551d69..52b3c60bf9bb 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -645,12 +645,12 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl);
 int mhi_pm_resume(struct mhi_controller *mhi_cntrl);
 
 /**
- * mhi_download_rddm_img - Download ramdump image from device for
- *                         debugging purpose.
+ * mhi_download_rddm_image - Download ramdump image from device for
+ *                           debugging purpose.
  * @mhi_cntrl: MHI controller
  * @in_panic: Download rddm image during kernel panic
  */
-int mhi_download_rddm_img(struct mhi_controller *mhi_cntrl, bool in_panic);
+int mhi_download_rddm_image(struct mhi_controller *mhi_cntrl, bool in_panic);
 
 /**
  * mhi_force_rddm_mode - Force device into rddm mode
-- 
2.25.1

