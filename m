Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A51C22CB659
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 09:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387863AbgLBIGY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 03:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387654AbgLBIGY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 03:06:24 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB509C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 00:05:43 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id s8so2184148wrw.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 00:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3vkg3QCDYxxdBRRj9L2KE+6nqjT6vjcUV47jDZn4/Bo=;
        b=R0lxUUCbZQo+jatgsZMTUYasLI5uz1TzNHpyAfzWZMqF71PUR1AspPOOuRo6y3uIFX
         gPMH0Q1Fh5YO5KXxwUtpV511jkrW/nlA2DcHS52SStJMhGrQuNIWlQ6lYvEbXm1cHqDa
         E8wGVw33su8SFvcmr+F+BDupx/ZmqzSFcoIutmPmUXnO7j1+FyInYYaNLLRD7AtU7BZL
         rihKE4oC1EJVfbnd1UeA2D7R7W40p5L3zAMCyD9OguMqwGMY6fvaR2vi6w8pevHlCwH7
         4xe05dWf/A/GXV7FCnTp5elYtnIeNxRqMcpfJS1ppcI+XkYO9gwTTExpmZuTaC5rv3sH
         ppvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3vkg3QCDYxxdBRRj9L2KE+6nqjT6vjcUV47jDZn4/Bo=;
        b=OX3Iany5QHSffK1W6jEr3HhQpH4l27gR/TomE2qhw/kob1sJPOaNSLXn3qv0Bplm3w
         jYJtBBxdxQe7Y87KVpiFQcKoCquhKLNRSk19N+ImFIzy0lfJLfLwXWuZ5x8dbyAz0s8y
         saWQEAeOPzQwG7LCoSWIiI2PBeyRkfYXoU4N8Mi+dxlIaKDfcUJPSgTq3sW/bZS80LNz
         3z3LE3UBDUo/MsqFcQlenXBJiLm1EfKxFnI3FJy53a9jLGS3mZX1wMG0foNlvrDh0KLL
         JkXZ1dklb6nfcEzstntrYnVR4CaWi+g1nhJl8yBVxrN2HLwD8K2wmLzkg2crZdmHkQQD
         4l+A==
X-Gm-Message-State: AOAM531uxVQO/6PYWr52rE88FJNHCUThbg9p8jE1vxhdjubmMOjRJE2m
        tIdjjIK9lruJB3CcoLIyg29ITg==
X-Google-Smtp-Source: ABdhPJztPAOMyXkdetRPopCmxaLCquYT5AhakWl+Zon20PoszfFB8njbchguQKWV/TV6TZIt6vBAeQ==
X-Received: by 2002:adf:93e6:: with SMTP id 93mr1763826wrp.197.1606896342556;
        Wed, 02 Dec 2020 00:05:42 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id d16sm1071640wrw.17.2020.12.02.00.05.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 00:05:42 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2] mhi: pci_generic: Fix implicit conversion warning
Date:   Wed,  2 Dec 2020 09:12:30 +0100
Message-Id: <1606896750-18198-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the following warning with explicit cast:

warning: implicit conversion from 'unsigned long long' to
'dma_addr_t' (aka 'unsigned int')
mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);

Fixes: 855a70c12021 ("bus: mhi: Add MHI PCI support for WWAN modems")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reported-by: kernel test robot <lkp@intel.com>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
---
 v2: Add fixes tag

 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index cfee0db..0912885 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -406,7 +406,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_initialize_controller(mhi_cntrl);
 	mhi_cntrl->cntrl_dev = &pdev->dev;
 	mhi_cntrl->iova_start = 0;
-	mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
+	mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(info->dma_data_width);
 	mhi_cntrl->fw_image = info->fw;
 	mhi_cntrl->edl_image = info->edl;
 
-- 
2.7.4

