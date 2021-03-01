Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E381C328366
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 17:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237662AbhCAQS1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 11:18:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237706AbhCAQRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 11:17:46 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A21BC06178B
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 08:17:03 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id n4so16786778wrx.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 08:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=eo+X6BiOa6FPRqtHpKr5U0LHaHSn2ylI7MnexnfxeYU=;
        b=QXFMtjxpTC+3z4uslhvfLVtxhpZupCRhjTOM1hp4LOe0caEIlRh/q3Dc5f/en20tae
         oUrJRWpKvE8VKREm71eXa+A8Yx3Jv+lT3A5Trcu1MSdX3i2Sawyh4e2IVamOYmX8Braf
         1RlY/YcHZeObbCvkpGrJlIv//r7jG8zfqYIZPoFl9QOBijUR2fDbBFgPcGdBMit80JwZ
         Bgm8gMTsI9r6uWOwLRNy+o6yEwqj/emZZ/nYURO+4nWg/BHdQMuZEPjlW8xUNBT/Rz3Z
         Bng/QMySk+w8e9krsE8ZxT6QbtTFcukgakHFzzSq8+yH/ikUQzMaawZih/CVXPLCLa8F
         GCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=eo+X6BiOa6FPRqtHpKr5U0LHaHSn2ylI7MnexnfxeYU=;
        b=twpbkCA92UqwwG1EozHjOmDs/bdILTwawInM1YO3vihVj1u0BwYGUpvddv2+uQgTVl
         emZf8PWr5aeBX2eWAAdeRKNTPy2Ti30VZX0KWvJDSuGCYlvyTT4dSdW08LN2GL/34KwE
         9x+T3FLgr+8ITeBknBNtMfAHApJh2kAv4h/2F4W8jm4DGVx2sJOU49Ru/0qWAr8/EOOV
         9GCDuDiawAauKRf8wVsr/AxhleNctC1SOKuwAqCaB6U3S4JAOJXVgFgw9t5k1pQjK9th
         M527If8NsYQ4nWkakCmKkjya6uG0tNzCkAe7pwAgZG6PSvNm+q+AYXUehBK5yL54YjXF
         Mh8g==
X-Gm-Message-State: AOAM532CrJIIcK6DbFlHlffm4ZEcMRSbLuR9mRWK9sqOOc6Sr1mUSTqn
        M8c/bee9lW3y/DYvKZURiHgHeg==
X-Google-Smtp-Source: ABdhPJwSIdCF/ZEJkSHjH/3slXW92HpXsgoqJKnpJyWL8tNsvcA2jq62dUeYRkoK797dcNWE4uArQw==
X-Received: by 2002:a05:6000:2cf:: with SMTP id o15mr17283408wry.184.1614615422153;
        Mon, 01 Mar 2021 08:17:02 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:5a20:c00c:6ec3:cc84])
        by smtp.gmail.com with ESMTPSA id w6sm3919789wrl.49.2021.03.01.08.17.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 08:17:01 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 4/6] mhi: pci_generic: No-Op for device_wake operations
Date:   Mon,  1 Mar 2021 17:25:09 +0100
Message-Id: <1614615911-18794-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
References: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The wake_db register presence is highly speculative and can fuze MHI
devices. Indeed, currently the wake_db register address is defined at
entry 127 of the 'Channel doorbell array', thus writing to this address
is equivalent to ringing the doorbell for channel 127, causing trouble
with some device that get an unexpected channel 127 doorbell interrupt.

This change fixes that issue by setting wake get/put as no-op for
pci_generic devices. The wake device sideband mechanism seems really
specific to each device, and is AFAIK no defined by the MHI spec.

It also removes zeroing initialization of wake_db register during MMIO
initialization, the register being set via wake_get/put accessors few
cycles later during M0 transition.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
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
index 87bab93..8423293 100644
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

