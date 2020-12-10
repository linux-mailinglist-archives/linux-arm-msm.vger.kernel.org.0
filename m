Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77FB22D57B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 10:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgLJJ4w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 04:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728680AbgLJJ4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 04:56:36 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBD3C061793
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:55:56 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id k14so4805607wrn.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=FcTurwR3UY1mQFez+TFw8NFlAeaWCMFUhGGUVyVnIPk=;
        b=twbAFaGnEe6Y3ou5PlJcciRESvYfDRMcAQxrCGBMuY+mPmsK5UyJ/TAxUeB/fSwp8N
         mQpj0ftGb+6aqRFtFN9syZ4ru14IElwGPX8qJySgk+vz2BU/hMhcdb3JrSZb7zOofK18
         m507buh1CxEECilGMvh9sMbOA1Kdl1X0piz5Ufx1vSC0wY8fNl+2zJ2D3pL+poVmMRec
         ODpYy1/OiDyrOxMdtoBOPNoRl0AivJJ8H3dSLOMYmyBgrcD26jIrPa24zW2ikOVxP9+4
         9R+QbZemHmJr1q0+yyN7qXf1IWnvdZos5TQK1v8fw3IrsjzyJRrdW/8evedues0hINpu
         dnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=FcTurwR3UY1mQFez+TFw8NFlAeaWCMFUhGGUVyVnIPk=;
        b=HypHofWq38GD/IFAxZcHvc2Hs5wWOPN4YwizaOTZ7kwMHYUFMUbt+gkz9bRmnuB72s
         3LCO9FCuVnpl76++1O00qLEhd3FxfvgJ9VAxFEhpm3bKw76MNdj8raD20w46VFVGVnYn
         AMOkPqSyTsiqkr4b07fCzXDvdBG7KX/gD27E20gsZEekG5nLx3oQyb/1SEEzPdvFQNkl
         1ys1Y76G5XfTTXj44uvG/mSsPFh10F1hdKz8UetP6RXwtZElFnlJSO2uZNxymRyWLyv4
         KL9r69RwkQfydR0w87nTugY4me6LrirUSD6UNLiOO+ZuYTxY8YjPuOxaDTCXs9DPTJau
         SMJQ==
X-Gm-Message-State: AOAM531R9OpiyzAJvVv/JL5VLTQrUbeQLP3aOqPz94kfHlJ+M8bGepKq
        86aO5444BTw3ty2R5h87THvC6Oor064BN/QL
X-Google-Smtp-Source: ABdhPJwqzqC6Ie7VaweG4L6ptMPrQQawWRU++SC3WVCvxtghwHaJXbbFNbv6z/fRD67ho0xgS5DFHA==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr172459wrt.223.1607594155715;
        Thu, 10 Dec 2020 01:55:55 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:4468:1cc2:be0c:233f])
        by smtp.gmail.com with ESMTPSA id l16sm9043721wrx.5.2020.12.10.01.55.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 01:55:55 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4 01/10] mhi: Add mhi_controller_initialize helper
Date:   Thu, 10 Dec 2020 11:02:46 +0100
Message-Id: <1607594575-31590-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This function allows to initialize a mhi_controller structure.
Today, it only zeroing the structure.

Use this function from mhi_alloc_controller so that any further
initialization can be factorized in initalize function.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/init.c | 7 +++++++
 include/linux/mhi.h         | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 96cde9c..4acad28 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1021,11 +1021,18 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_unregister_controller);
 
+void mhi_initialize_controller(struct mhi_controller *mhi_cntrl)
+{
+	memset(mhi_cntrl, 0, sizeof(*mhi_cntrl));
+}
+EXPORT_SYMBOL_GPL(mhi_initialize_controller);
+
 struct mhi_controller *mhi_alloc_controller(void)
 {
 	struct mhi_controller *mhi_cntrl;
 
 	mhi_cntrl = kzalloc(sizeof(*mhi_cntrl), GFP_KERNEL);
+	mhi_initialize_controller(mhi_cntrl);
 
 	return mhi_cntrl;
 }
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 04cf7f3..2754742 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -537,6 +537,12 @@ struct mhi_driver {
 #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
 
 /**
+ * mhi_initialize_controller - Initialize MHI Controller structure
+ * @mhi_cntrl: MHI controller structure to initialize
+ */
+void mhi_initialize_controller(struct mhi_controller *mhi_cntrl);
+
+/**
  * mhi_alloc_controller - Allocate the MHI Controller structure
  * Allocate the mhi_controller structure using zero initialized memory
  */
-- 
2.7.4

