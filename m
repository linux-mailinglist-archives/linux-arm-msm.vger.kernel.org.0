Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63C682C5802
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 16:23:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391311AbgKZPWT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 10:22:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391296AbgKZPWT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 10:22:19 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14E3C0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:18 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id 10so2474207wml.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tNd+xLAqvcNUNm4KkwNzCttW0SqoWPgvkdRlPwE5A3M=;
        b=Rnz5Bph46KFkcMeRdoNk3XC9nb9sfWf8Rn0XoAz4BFN7GUHHlHqyeTMLpwbux3LaZn
         oevwyu0ZEzDd6O9La1x6QF+FGeqWJDa45PmKigPRVMgpjJ4AkLtjviDU3WWVuMlOh/PW
         ySuNd4uguqou6wRYbH/2/RdaYQ4N6c4I9u422eCQUhu2034eP097gM7plgmQ/KJPrf1Q
         i0DzXEs41fan2F+hkILz0k/fO/CCqi2rcvSib+BrJYFbvsPMVElmHFY0Gnh8iiFv1I7s
         Xf2biHns4hkEGdsMDJoyv264YfITRmvKxMUPnSj2fb3jlTNoBAaC3mwtES/MTolQyrz2
         wz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tNd+xLAqvcNUNm4KkwNzCttW0SqoWPgvkdRlPwE5A3M=;
        b=plaQvJcb68H/cqJV+KeTWEVBYpq2fhpC56kcLFYiM630x4IEqs6PYm3ijRBJLJlSY3
         C/TVzizfLTodSe+KkkqFLBp8Y8+N+CRI7Pev46qQhkaszb3q1uF9OZwVb1tSZPCfg93H
         m5fBMrOhjxes9UCvuPj7n/7gZHC8TjaABxTlKEwVSoDUIVUI1iziZan71INonSsViJ7b
         GuEOC6DSBNHh8A8qxwgXFIHDekB1Ld1GMGKaH8Xq9nsN2Xl4+3PXhls0WedMsh5VRHds
         ljnJjFUYLOX7PmoxJVySbrsNy1vSMndTYnwOKW0ClVejWseTNjDNNRAXK1O8GBK1ujWl
         jTRQ==
X-Gm-Message-State: AOAM532CUSKu9UKF7PmqB7Ccb2/Fz2wC6hw/zedGdjeZGHmItdKS/XoV
        //sS5lXNGYqjAvs9Xr1swZueDA==
X-Google-Smtp-Source: ABdhPJw3pWXjiW2ype9knNhtDoSvXvIoRnREvyXGukOVHiMtVbKRmL03fgzLWImylIpkOTtldDU/WQ==
X-Received: by 2002:a1c:e0d4:: with SMTP id x203mr4100290wmg.68.1606404137461;
        Thu, 26 Nov 2020 07:22:17 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id l10sm2756144wme.42.2020.11.26.07.22.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:22:17 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 3/9] mhi: pci-generic: Perform hard reset on remove
Date:   Thu, 26 Nov 2020 16:29:01 +0100
Message-Id: <1606404547-10737-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Ensure that the device is hard-reset on remove to restore its initial
state and avoid further issues on subsequent probe.

This has been tested with Telit FN980m module.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index d3896ef..4363676 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -15,6 +15,8 @@
 
 #define MHI_PCI_DEFAULT_BAR_NUM 0
 
+#define DEV_RESET_REG (0xB0)
+
 /**
  * struct mhi_pci_dev_info - MHI PCI device specific information
  * @config: MHI controller configuration
@@ -166,6 +168,11 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
 	/* Nothing to do for now */
 }
 
+static inline void mhi_pci_reset(struct mhi_controller *mhi_cntrl)
+{
+	writel(1, mhi_cntrl->regs + DEV_RESET_REG);
+}
+
 static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
 			 unsigned int bar_num, u64 dma_mask)
 {
@@ -329,6 +336,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
 	mhi_power_down(mhi_cntrl, true);
 	mhi_unprepare_after_power_down(mhi_cntrl);
 	mhi_unregister_controller(mhi_cntrl);
+
+	/* MHI-layer reset could not be enough, always hard-reset the device */
+	mhi_pci_reset(mhi_cntrl);
+
 	mhi_free_controller(mhi_cntrl);
 }
 
-- 
2.7.4

