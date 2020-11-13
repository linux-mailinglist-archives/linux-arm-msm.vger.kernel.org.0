Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A106D2B1DCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 15:53:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgKMOxd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 09:53:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbgKMOxc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 09:53:32 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65631C0613D1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:32 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id k2so10246033wrx.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 06:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NI5nyGOY3ERNyQJVul1TRTO9hhACB1gWUuV76MrEk5M=;
        b=Z3MUAw2xhM2gTDaUJarLc7ChotsoJBmDgr19IbQ5UltyPFuj0eGRESVfzYgPWKEjZt
         pouXNebUI/qLKNblrEdAzyyCTwzUBA9xn/OwMPG43sODRJJPoPF7+41kQz6aQVl8pUWi
         kxYcvdexbHkOAcZSIep0GMhle3ZHXFZdurbVkTBKYvAVOO0xTjLnsIDu4j55mIFRPC7p
         grHHGXyucXQAcKGQC2qXsWzzrxGXJj4rPNaJGMVzR/3OrY7C0qfEmJgYdc5SMNbidjnF
         uBWehNvxZxnHHKO5yRFpXd8M1KDvDSKPXX8ZLl+8tnh2aHhVLdwmtg3hNV6h2MQ40DvG
         C0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NI5nyGOY3ERNyQJVul1TRTO9hhACB1gWUuV76MrEk5M=;
        b=M441Cb1hV8cJlciEtTsvi9vxWCBHhTOxxhDbX7u0oZsj4pmqpBP5QhkeE+/vXTjPMn
         OsXJOGbzzNRr8b4Cdazv772WtTRVI3KLd2Lps+4V5+PiadSZLvRiNEQuHe6sBhX6cIxK
         rzEBWYoSwYJJaba7xBH1r8yCYOMnFeGKU3VEMxaPs2ublxNcVWOQuo2uWNsFGD2zdzXs
         bN4mqyTZkVzP5EVASFrDm9yBN6aHcmGbxrSfZLOqpJtmTUGZ/0AziSK5nwPggBAFpo85
         /HbkrcIrGzDn57ND8rvbyEVnjuehLeyk8gKlNeV03EuUVIwLHNtqaYk24h3mt8S4kYus
         B6Vg==
X-Gm-Message-State: AOAM533F3DU4tEpzwZGfCvJYIOWKKFBviLrKVeNoyG3f5gL0xSl5kgN3
        PjGznoX5Rz7z+sp5qdrPVImYYQ==
X-Google-Smtp-Source: ABdhPJxg4InINTLokpQhA79X6+oS43uxLLQUKQxkkF4J5jtDS88xhH6EnJvZmGt+XMjLw0E07OZNgw==
X-Received: by 2002:adf:e506:: with SMTP id j6mr3868283wrm.411.1605279211089;
        Fri, 13 Nov 2020 06:53:31 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:304f:e9d4:6385:8ac5])
        by smtp.gmail.com with ESMTPSA id i6sm10729341wma.42.2020.11.13.06.53.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 06:53:30 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 2/8] mhi: pci-generic: Perform hard reset on remove
Date:   Fri, 13 Nov 2020 15:59:56 +0100
Message-Id: <1605279602-18749-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
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
index 13a7e4f..09c6b26 100644
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

