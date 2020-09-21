Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F2D7272B24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 18:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbgIUQKf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 12:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727062AbgIUQKf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 12:10:35 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D977CC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:10:34 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id u3so32451pjr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 09:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=s8QQquLL4oGKh6uhiaB6MoxZtKFnQbbrDA+3b3PoVuU=;
        b=Zi2U3hS5M6EGhoGn5mKRXB07Bcv1/S1tkfmfTtxc1SQ6NFrZ7Qno8QCqlFBnj5xVGo
         iQbOHHl1HP2PhKXv2+CNP6OXtK3j0XmiI8RJU1KqaJZ7DNar38nd8KYdsjnmd9lIML/X
         u1hcHuJnhox50tEnkKPlKIZvbjqyu8Vm8EjUk/3ACRFXPKUZylpwGSz1T+KR6gB7BiJT
         PYfG9mv/Lo8XoFfvTV3ZY4f4igck1RsbP+BCBXvRQC6tEWn+e243qGPQliTJbhdSXx1G
         Ttx3jUDDRUO/monukP979Othht1LqBIaTVw9GjN6EyWeCTYUIqF+lDmqlReWWVmlCRde
         SGNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=s8QQquLL4oGKh6uhiaB6MoxZtKFnQbbrDA+3b3PoVuU=;
        b=O7zzrmcticTNsqjT92Kwmms7ToIgcAyDgEeC2E9CAym3ww5Xem+Fe7dFCu4arRbrmW
         7jV3w9FQsI05c/yR641iUdGGrYtNdhf+L4PNIW0gwuCULmHfmF6rx4jetx4FZIaypDd0
         PFIwdDA3W+eVk6PB6AbX2NqmQ9K3OPexgDOSNfRUQgPHwBKI+vCuKPWrddF4F6j1/FMs
         BtguPWvTEu0CnWEcqa+ht8EBsWyfWmc3e9Ep/TP6KQkXg7+kv7qQaGujYjm2QDsxVThT
         wl4hcjo5Yvmsxia2E+g0KvFG59IpoSx8Vg9sYx3+VHdUrb+Uu8GyaAZK8rnfKhOXFogt
         DXRQ==
X-Gm-Message-State: AOAM533SpWNRVU8rBN3g9yKtDcueC10VLp95L/5wgTi8d8uNt8TH6v36
        Gbh20jtnfxoU3Fw5RB1lAuP3j3lpHWVd
X-Google-Smtp-Source: ABdhPJxM8pxvY6U98jZYzYtId38lEuA44xz3LcayRJ8O8C7y0ehGeliqpDfU/erXTGe1qv5PJMe8tw==
X-Received: by 2002:a17:90a:a613:: with SMTP id c19mr85910pjq.119.1600704634320;
        Mon, 21 Sep 2020 09:10:34 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id f4sm9204577pgr.68.2020.09.21.09.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:10:33 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 10/18] bus: mhi: core: Introduce APIs to allocate and free the MHI controller
Date:   Mon, 21 Sep 2020 21:38:07 +0530
Message-Id: <20200921160815.28071-12-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
References: <20200921160815.28071-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Client devices should use the APIs provided to allocate and free
the MHI controller structure. This will help ensure that the
structure is zero-initialized and there are no false positives
with respect to reading any values such as the serial number or
the OEM PK hash.

Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c | 16 ++++++++++++++++
 include/linux/mhi.h         | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index e2011ec46b92..f69a2f3d039d 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -954,6 +954,22 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_unregister_controller);
 
+struct mhi_controller *mhi_alloc_controller(void)
+{
+	struct mhi_controller *mhi_cntrl;
+
+	mhi_cntrl = kzalloc(sizeof(*mhi_cntrl), GFP_KERNEL);
+
+	return mhi_cntrl;
+}
+EXPORT_SYMBOL_GPL(mhi_alloc_controller);
+
+void mhi_free_controller(struct mhi_controller *mhi_cntrl)
+{
+	kfree(mhi_cntrl);
+}
+EXPORT_SYMBOL_GPL(mhi_free_controller);
+
 int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
 {
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 0c97f4bc5fae..6b987e8cc438 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -527,6 +527,18 @@ struct mhi_driver {
 #define to_mhi_driver(drv) container_of(drv, struct mhi_driver, driver)
 #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
 
+/**
+ * mhi_alloc_controller - Allocate the MHI Controller structure
+ * Allocate the mhi_controller structure using zero initialized memory
+ */
+struct mhi_controller *mhi_alloc_controller(void);
+
+/**
+ * mhi_free_controller - Free the MHI Controller structure
+ * Free the mhi_controller structure which was previously allocated
+ */
+void mhi_free_controller(struct mhi_controller *mhi_cntrl);
+
 /**
  * mhi_register_controller - Register MHI controller
  * @mhi_cntrl: MHI controller to register
-- 
2.17.1

