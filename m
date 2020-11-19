Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C7E2B8FF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 11:15:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgKSKM4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 05:12:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgKSKM4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 05:12:56 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2923CC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 02:12:56 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id c198so4710453wmd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2020 02:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BTvK4ua59BAOEk/Uuq1mlhXhvA7x+OAsYo9uIExTcMc=;
        b=r9sixEbCK5+nDt9lay31hyYZuiHEM20a2Kvw5cezkUkmcLt3YdFBZLsPG1lO5ixbEZ
         ujsgIeZHXvSjJCiUru2jfhFClI2dWD3YwC9YIvGc+/TaDiAmQRZ5724/lCsGqsFNItl6
         shI8ehCh33E+Tn573b4M6HypYjJZsX54bugkCtlD2SNBm9KEDH6mPp2uDhExAoPXqHIS
         d7mo+AZ3Oc0IIdYxHhV7fMC0beXUa7np+PESuOWtv2WS3GL2WOijN2qtziRYxyB5DD1g
         AsmBqoXn/arRPdQeDi5f7bRH4BSsJ2nyec4hej8scbbOmxgGT1gcFq/ANmrhpUiN4s8/
         yh2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BTvK4ua59BAOEk/Uuq1mlhXhvA7x+OAsYo9uIExTcMc=;
        b=eGZtVgDUxUGKK8ZhErw++SeKEMcKe4A+pWkHrkMc6XZSyI7pR9WD0VbX4a5zft/k+v
         BN3+8pRoO/U2mAHiklfP06MFLlGsCWme2FTYgoYLOG5+hphrZAlGRH+OBF9Jro0L9iSU
         nsUneHbdIhd8V0b7d6chMRVDyLa8K3j3fFEPBKIzNPrtF6PoUTXWxEkYzvT0VQoxp0Hb
         u/EJJmdb3/vrvu4UjRYLeyPugNk9O+Uh9RXVMUyIlZS+oqd2QHNGnOyrx228YTUl6IKr
         aQHqYjvacflsLTC2RRfLUUn1baIimsSpKyHZlypN6Jrt/HAnowfA9IiRkC2rHvNGtHte
         tX5w==
X-Gm-Message-State: AOAM530kP48Ogkk+4q0+9HqtaiMKjd+WHwMHHIOP3gPj+aLq9Hg4vi83
        6MxNFNgLKZnD9KjRo7k5Qw6uLz94UVlkBIIDEaM=
X-Google-Smtp-Source: ABdhPJzvyr/wVTDn6lueQDDVNDXgP8v+zY+0QoJhrxfbkYHYIocqjNPp1cnJqQAxs2CHYRt3CYcc+g==
X-Received: by 2002:a1c:63d7:: with SMTP id x206mr3796411wmb.34.1605780774760;
        Thu, 19 Nov 2020 02:12:54 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:7d55:3d93:6a7d:2684])
        by smtp.gmail.com with ESMTPSA id a18sm8399579wme.18.2020.11.19.02.12.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2020 02:12:53 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH] mhi: pci_generic: Fix implicit conversion warning
Date:   Thu, 19 Nov 2020 11:19:31 +0100
Message-Id: <1605781171-29093-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the following warning with explicit cast:

warning: implicit conversion from 'unsigned long long' to
'dma_addr_t' (aka 'unsigned int')
mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/bus/mhi/pci_generic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 17c6448..3337c6d 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -411,7 +411,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl = &mhi_pdev->mhi_cntrl;
 	mhi_cntrl->cntrl_dev = &pdev->dev;
 	mhi_cntrl->iova_start = 0;
-	mhi_cntrl->iova_stop = DMA_BIT_MASK(info->dma_data_width);
+	mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(info->dma_data_width);
 	mhi_cntrl->fw_image = info->fw;
 	mhi_cntrl->edl_image = info->edl;
 
-- 
2.7.4

