Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 195EF18F462
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 13:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbgCWMVY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 08:21:24 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37465 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727401AbgCWMVY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 08:21:24 -0400
Received: by mail-pf1-f194.google.com with SMTP id h72so5208826pfe.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 05:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NXD1SgZW436mNJVJaMChhmgGCTlF4WiqRwqdWQvrpTs=;
        b=PTwj5hpje3JpuO1htIYsJIEXYURWCwJAp4M6WSsFzykDg2cPLjCe7XoxmgyXS2AUY+
         5SIHECIhCqNbLCFc6JeVEbjBmx03WGaqfd6Uhu+JB5/ZEsvME+6BT+r5YTWwgT2s2tl9
         Z4+00WqAAy8rirYeCMfhdCKsCGUs2B2M8lJVK1Z4X37W3/vlByoMA9owiRYVFlsQlKGn
         QvPR3hQTnBHimbWuRJHavdPTn4w10d7Rfp7wJS1fA3bUq7R8sbFPuzCLAqU2m8c8MayS
         DNjE/psIQEmK+NfaS7kpfgzsnDozs/v8Je0z5yk+FSFrmsS2O3DzMXXi8QU3hh7gz1oJ
         6g/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NXD1SgZW436mNJVJaMChhmgGCTlF4WiqRwqdWQvrpTs=;
        b=nX/nYM+RReL7+8oWMdVS7W9bnr2HqrRqJAge5CQePX/tOKCvHPLHnBtzB5knMYjFSG
         tYCX+rYAZNdidSHsqNQRKfbT2rR/ttORvV886fLd2oTWbJVWmJqK4Z8ZD8UZ7iHjwJHZ
         Q5ShLSG9s+HazoKvL5fu+RpGJ3w657kuRnvakFMoIU1Ou909p7HNsHSCR4H6SNtti18f
         D33lgkM4bRtYO4mByF58htpbhDBnzSNoto70lUkujyEwOxyRfNEXyAUULjXWSAwEoP3x
         t4/7oO24wjNgri+vP5Nj3H0sEJpLnhzpklgySfsRkvhoWtGAkYiYuaYh2Pkc5o7xZBo1
         gWoA==
X-Gm-Message-State: ANhLgQ0IbMLUuj7pGMaf3vLpmmjE7vEYCbtqjitCPoZQteZ2jOAtmEUt
        CevGF/PLasYDsFCaCpaGemkG
X-Google-Smtp-Source: ADFU+vvvdW9dxl4BGvA3NvO6he+3lvIxhs6y+Bm2bmFG2xpuoN3R5X3IdqK8weXD2Q9PHE9USxZmWQ==
X-Received: by 2002:a63:3fce:: with SMTP id m197mr20992934pga.38.1584966082907;
        Mon, 23 Mar 2020 05:21:22 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id w27sm13351438pfq.211.2020.03.23.05.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 05:21:21 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/7] bus: mhi: core: Pass module owner during client driver registration
Date:   Mon, 23 Mar 2020 17:51:02 +0530
Message-Id: <20200323122108.12851-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323122108.12851-1-manivannan.sadhasivam@linaro.org>
References: <20200323122108.12851-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The module owner field can be used to prevent the removal of kernel
modules when there are any device files associated with it opened in
userspace. Hence, modify the API to pass module owner field. For
convenience, module_mhi_driver() macro is used which takes care of
passing the module owner through THIS_MODULE of the module of the
driver and also avoiding the use of specifying the default MHI client
driver register/unregister routines.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c |  5 +++--
 include/linux/mhi.h         | 19 ++++++++++++++++++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 5fb756ca335e..eb7f556a8531 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1189,7 +1189,7 @@ static int mhi_driver_remove(struct device *dev)
 	return 0;
 }
 
-int mhi_driver_register(struct mhi_driver *mhi_drv)
+int __mhi_driver_register(struct mhi_driver *mhi_drv, struct module *owner)
 {
 	struct device_driver *driver = &mhi_drv->driver;
 
@@ -1197,12 +1197,13 @@ int mhi_driver_register(struct mhi_driver *mhi_drv)
 		return -EINVAL;
 
 	driver->bus = &mhi_bus_type;
+	driver->owner = owner;
 	driver->probe = mhi_driver_probe;
 	driver->remove = mhi_driver_remove;
 
 	return driver_register(driver);
 }
-EXPORT_SYMBOL_GPL(mhi_driver_register);
+EXPORT_SYMBOL_GPL(__mhi_driver_register);
 
 void mhi_driver_unregister(struct mhi_driver *mhi_drv)
 {
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 79cb9f898544..0e7071dbf2c3 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -514,11 +514,28 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
  */
 void mhi_unregister_controller(struct mhi_controller *mhi_cntrl);
 
+/*
+ * module_mhi_driver() - Helper macro for drivers that don't do
+ * anything special in module init/exit.  This eliminates a lot of
+ * boilerplate.  Each module may only use this macro once, and
+ * calling it replaces module_init() and module_exit()
+ */
+#define module_mhi_driver(mhi_drv) \
+	module_driver(mhi_drv, mhi_driver_register, \
+		      mhi_driver_unregister)
+
+/*
+ * Macro to avoid include chaining to get THIS_MODULE
+ */
+#define mhi_driver_register(mhi_drv) \
+	__mhi_driver_register(mhi_drv, THIS_MODULE)
+
 /**
  * mhi_driver_register - Register driver with MHI framework
  * @mhi_drv: Driver associated with the device
+ * @owner: The module owner
  */
-int mhi_driver_register(struct mhi_driver *mhi_drv);
+int __mhi_driver_register(struct mhi_driver *mhi_drv, struct module *owner);
 
 /**
  * mhi_driver_unregister - Unregister a driver for mhi_devices
-- 
2.17.1

