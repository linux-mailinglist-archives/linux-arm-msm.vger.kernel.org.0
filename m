Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BF927D514
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Sep 2020 19:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728157AbgI2RxP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Sep 2020 13:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727740AbgI2RxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Sep 2020 13:53:12 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01692C0613D1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:12 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id s31so4459604pga.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2020 10:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=s8QQquLL4oGKh6uhiaB6MoxZtKFnQbbrDA+3b3PoVuU=;
        b=w+L+sbwyRqd/kUR4yOGRGKdcsW/vsqagEE4b5dBd+YZKGnvdQsXZIBd9wcC/ybuR9j
         T7xFQt1xsUbYCz6dxITSbJakrbbfwg2yt9unakKKSuoKQMy1GZVgxjwaBMavfEw3i4Tr
         NAVXHpX/AC9aIGapsZW9STs+y+0B+nydyTceAKIzdjNjN7rbitqaaa39jv/LriDADxOV
         B6aytMZypc8wlDkBQNAk6DFmC8bh/tqG9Cbtmz7IwF6+7wR5dM0hkUuSIhqCM/f84Mle
         nvTVPOwkFfK6KEEGSt5gWB25g3UPqYFyYV7Z6pNumelyFgweCgn5uFCVthcy5Jom+UIG
         eESg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=s8QQquLL4oGKh6uhiaB6MoxZtKFnQbbrDA+3b3PoVuU=;
        b=YeNwyRDYgEnUNwISducyzoIuwTod+2gHc4353yk+7YT/KtaT3Ct2NOr9sAOvHMQiX5
         oplJQ14GBV+8SMMrRhGY5CHaiQqQq2UcT+9v6xP83elSzXH60IHz7XBV8vh+QK1S/++H
         8SQfyXnFMRuKUFOfWN6S+2ll6uywDIeEbizf32hgDGM04ngDOduMopgkVFC6hBT5dGZD
         Obw7K2ftkr1Dt0flHWESdeUsc+CwJMQlea/xVCIsBH5H+I479mHwF2r1xovJL7e93qqi
         2Wq98AzBL9NMyXu90WSlUXjnxBvJejhvZXHCkreJ+SlydLPr9TR1EIjawUv5uuT6B56z
         pA1g==
X-Gm-Message-State: AOAM530D4JTThlDk1LUp/nr/puFCkFfZczZKC86R4L/WlMuB7PCVkiHp
        pw4varxzyJXlE+42fl1f6ezy
X-Google-Smtp-Source: ABdhPJzXApVxJD/OdfawaQJ6lvpnhJEEL/Vu27J/Mxk/eyfZZxlBsNg5eOebe+WoBS9z3WuVZsiAUA==
X-Received: by 2002:a65:4642:: with SMTP id k2mr3992637pgr.41.1601401991461;
        Tue, 29 Sep 2020 10:53:11 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id r188sm6271046pfc.67.2020.09.29.10.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 10:53:10 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 10/19] bus: mhi: core: Introduce APIs to allocate and free the MHI controller
Date:   Tue, 29 Sep 2020 23:22:09 +0530
Message-Id: <20200929175218.8178-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
References: <20200929175218.8178-1-manivannan.sadhasivam@linaro.org>
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

