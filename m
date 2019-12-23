Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81DF2129A1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Dec 2019 19:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfLWS7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Dec 2019 13:59:31 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45551 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbfLWS7a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Dec 2019 13:59:30 -0500
Received: by mail-pg1-f195.google.com with SMTP id b9so9228389pgk.12;
        Mon, 23 Dec 2019 10:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yYuhXbk2VYWkJUHqsC8Dp7ziko2oh3QWGKXaw3BKzKQ=;
        b=bIrbocA75GjiXkwSJP3C51ubVyAnSLI/fBMTmh6962W79PT4Tqv+1+Mjw3cq7AGKFU
         jHYIhsxDoH7RHVORa6yJexdhOgetkpm/PkZ6ybiEGu0rEOpFeiagFzU/A8ajKUUkgukz
         3AsjKYBf3/aZo2PMmRXKMgxEkfrblyUVI3V0AYfA5DshVaGFTRxoepTY4p6RKBua5+RC
         hwdBV6ESUTN2NcyHSsnNvmOAqmENn4PYY7sviRlsrgrPKRl79k7z6YX1VvUkJpHwbF8l
         d6ihCxrqxgEDPq21x1NWyz3OWGl9kB/2yiUVsYw2xw4mEWhcBS8hcPRUPF2UdAVwvS+g
         6lSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yYuhXbk2VYWkJUHqsC8Dp7ziko2oh3QWGKXaw3BKzKQ=;
        b=NzFJe6RgP03ZMnoRN54UVUnQ/iA29zPMlvi7/KTAeziwLAG3RhH3LYBi2s/MiN97gk
         IWLZwU1UD3CFNSp6Um99QwmeIdT1B1RkS7/QcccYEbV5q3iIpfdMYGSZEJtRpeOnhsVH
         i4bxRh4afK5K9yNfOgGb04UYXwdtgvkw41AhTT/IR5p7wOMYsS1+0lVCmzvbMwlCTtkl
         9f0OsaVqSiKyfDY046IsYo0eRigib0GnBTdQeaMNXH2xD/Ue0AEdfICtBJWRaOA+9oav
         brbH0aQUxt6y3u8AUcZEKt5S9e/uXsTFjSIilIFtqyCj5rhUKrS89wLSKAAkrjt/JRev
         y3SA==
X-Gm-Message-State: APjAAAW6ByncUoFFtpyo5x5LtEm5skZW1KUfqEs/axVZc7hr0K57IcKp
        lTvKIgxVODZCOD+dewSX+jU=
X-Google-Smtp-Source: APXvYqxUB7sZmq8y8VINmqjxcxw1nx5P7rd/13e79L+vtzHV6ANBCs8nm6SgxE2CIKPWmst9f3sWdw==
X-Received: by 2002:aa7:9ab6:: with SMTP id x22mr33198806pfi.260.1577127569760;
        Mon, 23 Dec 2019 10:59:29 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id e1sm26283596pfl.98.2019.12.23.10.59.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2019 10:59:29 -0800 (PST)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     m.szyprowski@samsung.com, joro@8bytes.org, kgene@kernel.org,
        krzk@kernel.org, matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, heiko@sntech.de,
        mst@redhat.com, jasowang@redhat.com,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        virtualization@lists.linux-foundation.org
Cc:     Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 4/6] iommu/ipmmu-vmsa: convert to devm_platform_ioremap_resource
Date:   Mon, 23 Dec 2019 18:59:16 +0000
Message-Id: <20191223185918.9877-5-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223185918.9877-1-tiny.windzz@gmail.com>
References: <20191223185918.9877-1-tiny.windzz@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/iommu/ipmmu-vmsa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index d02edd2751f3..3124e28fee85 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -1015,7 +1015,6 @@ static const struct of_device_id ipmmu_of_ids[] = {
 static int ipmmu_probe(struct platform_device *pdev)
 {
 	struct ipmmu_vmsa_device *mmu;
-	struct resource *res;
 	int irq;
 	int ret;
 
@@ -1033,8 +1032,7 @@ static int ipmmu_probe(struct platform_device *pdev)
 	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(40));
 
 	/* Map I/O memory and request IRQ. */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mmu->base = devm_ioremap_resource(&pdev->dev, res);
+	mmu->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mmu->base))
 		return PTR_ERR(mmu->base);
 
-- 
2.17.1

