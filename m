Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E57322E51
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 17:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233354AbhBWQFu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 11:05:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbhBWQFm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 11:05:42 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76765C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 08:05:00 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id v1so23103264wrd.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 08:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=WeSebR/ZV/BYGJ7gsNH4ODN5Eyz5/hdYAmVMHO/uxJA=;
        b=K0qgit6upDlNGSQhisBhwhyJKliSX8DnHLuR1BgTiB0AR3d+JoPEk5Ck4CJTWlRzUh
         9ew208LrfcTBhTUL+++KDZs7AxM5JujjwIHGnOiDp2EJD0mNF8OiSN3E6TJb7OBHgOu6
         D5CAaTcm60aAGaST00/DmjIvFN0AhTVMXytUUzhhnpvS7hzkqGXBksHwpCer00/dB+nh
         26stYq41Bp3WhxTJgm32iYUzlaDXi9XLn2oVcXzIiIn2Ea1NsHoDuFemygSKmjmM6jVV
         WmllmFQCUTekTCuG24TQxt4uGr9wx5LOWdF8rh6hyMGR+armsVbDGqtOzU606tfDqjSs
         D/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WeSebR/ZV/BYGJ7gsNH4ODN5Eyz5/hdYAmVMHO/uxJA=;
        b=U6xHX5B34aQNhofq1yKY7rop0DnN4FWpJvBZUqiUGz4y2si4MhlGZroh1cV6yuzmLr
         MgFdbRjlhIm6Z62gSMQkFaopZDidToJqMtYPkCsgy8tXSShOnyH+TMROKo65qoppraWO
         CIAS9zduGip71kaeBVvwuxbPXy27udN0SFgkgbiUTsqzGerxUuzoV1KeDG6CFaC8pLFs
         MGW1pe32ou0yRO2Jxqs5VqU7ZgZvOS7NDX7jlc15f0qM3H41gXCgXoECkFEWy1iCoFXj
         X4nA2SkPD0eUjtxdvl78zAXxWmiXXlyBdNL1+++NWbs01t2L5FkMvaXzXwLdOWG9lSFK
         YCMg==
X-Gm-Message-State: AOAM530HUEeDbcKd0F/RrDSxWSR6Fno1OgpHa9EEq2p3YAluqe/UUzRg
        HepoWAblCiOdinAEF5j6IMUPdg==
X-Google-Smtp-Source: ABdhPJzD+McSvCr7I7hA5qhMuj7ra4Yy3WE6xps2NVfo9HaawnsEQPvEMhQqTGuWzB0kOcXMunBDAw==
X-Received: by 2002:a5d:638a:: with SMTP id p10mr2245375wru.286.1614096299127;
        Tue, 23 Feb 2021 08:04:59 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:80e4:8084:68e5:90f])
        by smtp.gmail.com with ESMTPSA id o124sm3385251wmo.41.2021.02.23.08.04.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Feb 2021 08:04:58 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, carl.yin@quectel.com,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] mhi: pci_generic: No-Op for device_wake operations
Date:   Tue, 23 Feb 2021 17:13:01 +0100
Message-Id: <1614096781-30646-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
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
 v2: add missing mhi core change

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
index 4fc543c..d4e8c9c 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -347,6 +347,21 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
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
@@ -550,6 +565,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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

