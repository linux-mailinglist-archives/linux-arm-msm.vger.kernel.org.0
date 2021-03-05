Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 057DB32F383
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 20:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbhCETIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 14:08:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhCETI0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 14:08:26 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB420C061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 11:08:25 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id n22so2376596wmc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 11:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=634De0VmcZftqA0EsYtSRssGeJ1lMakbJs+e7qthPxU=;
        b=TMMbvn7IqgceEw2QLrz/yNpja+KaG2awcVxCZmB+rZzYcqBx48C0uwMXq3khyYXqRt
         xKAAz9ZLpTwSxDnmTkNFTe1i/o0SYVRf2gvEFrdg3IPR4+RyCYS+We09VE/IDeBwM6hd
         3+skIwth+kCHTWRXZzuXHmPPmzhaeNA71mBHKZKuCW6FH19zRRTEYfbmuUB10plgf03V
         CZQ+40cPmAvVaEIiLcfuSFapUIMJTIFj8/TkcqNM7DWxXyMx4nOaIRlNXeiho5WnAczk
         IaagPjARzZPyvoQv1i6oBUwtMOiUaek8JBbGUwB62vjJDzuB6HoXvz9OE89X/Qau9neT
         6mnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=634De0VmcZftqA0EsYtSRssGeJ1lMakbJs+e7qthPxU=;
        b=PGO80/fpyutuR5uvIwInMteUth1Hcgv7t8Z03dGuqxJUYQPOMStXBvjIN9dbx7FSG9
         xrgeHx8ZVyLDE+PeydVhfDGrRzV1n5BEIxu2EpgqXJhFTMkpdmW8WWQ8SP8I/fYwT1Eb
         2Y/LO57wJivpEQdNsrAwUbptnwZkZeingLeet8usd3sk88qcobJ7yrhZL9f49POxHCVE
         BOBRwNhImSalwcddpAuhKhY7Mm7bpeS2CYGHc+aCcXr18o4s646X+TUyJCjU0E0l95mZ
         VpCy7zv8ICl9WKQrmmEDH+DFhtdlh5mbUvuuMptF21ojz5Qx8HerY0LmqgbAcAKjjOZf
         fr1Q==
X-Gm-Message-State: AOAM530scuJl/qqwBbgYioqBKJJiZGJXCgygQKdXTPw7rqf94ikByD5D
        j5LMuvEucpyxcl6QV0JzD2pLow==
X-Google-Smtp-Source: ABdhPJxQAUgSvKM337C/W7z2U7vp56iZr0Pcn9MVv7TTkcKNQNPWoylG2kbEy7mH5jwOaU1QEQBaeQ==
X-Received: by 2002:a7b:c1c9:: with SMTP id a9mr9945055wmj.145.1614971304570;
        Fri, 05 Mar 2021 11:08:24 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:55da:a740:2edb:1c7e])
        by smtp.gmail.com with ESMTPSA id c11sm5355437wrs.28.2021.03.05.11.08.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 11:08:24 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 4/6] mhi: pci_generic: No-Op for device_wake operations
Date:   Fri,  5 Mar 2021 20:16:46 +0100
Message-Id: <1614971808-22156-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
References: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The wake_db register presence is highly speculative and can fuze MHI
devices. Indeed, currently the wake_db register address is defined at
entry 127 of the 'Channel doorbell array', thus writing to this address
is equivalent to ringing the doorbell for channel 127, causing trouble
with some devics (e.g. SDX24 based modems) that get an unexpected
channel 127 doorbell interrupt.

This change fixes that issue by setting wake get/put as no-op for
pci_generic devices. The wake device sideband mechanism seems really
specific to each device, and is AFAIK not defined by the MHI spec.

It also removes zeroing initialization of wake_db register during MMIO
initialization, the register being set via wake_get/put accessors few
cycles later during M0 transition.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: reword commit message
 v3: no change

 drivers/bus/mhi/core/init.c   |  2 --
 drivers/bus/mhi/pci_generic.c | 18 ++++++++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 2159dbc..32eb90f 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -510,8 +510,6 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 
 	/* Setup wake db */
 	mhi_cntrl->wake_db = base + val + (8 * MHI_DEV_WAKE_DB);
-	mhi_write_reg(mhi_cntrl, mhi_cntrl->wake_db, 4, 0);
-	mhi_write_reg(mhi_cntrl, mhi_cntrl->wake_db, 0, 0);
 	mhi_cntrl->wake_set = false;
 
 	/* Setup channel db address for each channel in tre_ring */
diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index c274e65..4685a83 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -312,6 +312,21 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
 	}
 }
 
+static void mhi_pci_wake_get_nop(struct mhi_controller *mhi_cntrl, bool force)
+{
+	/* no-op */
+}
+
+static void mhi_pci_wake_put_nop(struct mhi_controller *mhi_cntrl, bool override)
+{
+	/* no-op */
+}
+
+static void mhi_pci_wake_toggle_nop(struct mhi_controller *mhi_cntrl)
+{
+	/* no-op */
+}
+
 static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
 {
 	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
@@ -515,6 +530,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->status_cb = mhi_pci_status_cb;
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
+	mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
+	mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
+	mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
 
 	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
 	if (err)
-- 
2.7.4

