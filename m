Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3038E9C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 13:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731293AbfHOLKx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 07:10:53 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43976 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731217AbfHOLKt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 07:10:49 -0400
Received: by mail-pg1-f196.google.com with SMTP id k3so1157223pgb.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2019 04:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rq9oE/+ABrAqTFJN5so5jGPiSZbG95oHkV+cKhmZyPI=;
        b=v0n9o//BaoQ1ESwTpE6LtJwM0UMlZU6SHT31oFerAYe/9QP4IZ43sL++jjJ0lO7I0r
         33cFC5OPDHrUbaK1kRyeDxXqJw2kxWv1QBDKSRUAQYrFStgCOFm5F+WNNMG+odjGyiZr
         /nlAC34vY56gV4YH0EknAGiSIPRMu5D4jUi++DxYjMgJWJcvn7Trmg3g8cjHIW/PoZht
         I/MzH4/h0Y00wXwjjED/qhh151NQx8hzpG2BjjF6k/JBGMhtwrhWIiYFTHUGgQ31Zgu3
         3jTVnlzHTiNwLqrywAN5HiEUhVZ8Pcr9uu/E3P1MS3NDkKTzXbAxW83+7o1w3VSOxUBu
         pqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rq9oE/+ABrAqTFJN5so5jGPiSZbG95oHkV+cKhmZyPI=;
        b=Ybh8uOB9gW75H4xOEuRXZGpmOji1b9KULn3zDj2nXLTfLcqSd4l7YnTvtixmN317I9
         9lUL7dDVcVAMLARKiFwuAYN/TENglvRlfdhTNaBj++iD5ytO3wsbW4oaIRaYPp8Xjc+x
         hrxJzi0kIuL2LNDQZEw9psJPP0COC7slIR8QkgEyyoj+KCMPzN30CfD4cr+LpkcxhtRD
         Tzc2a3W3pddlpe44XFaC6SmXtgHP2czHOPsdTWhNo5jj2WZzRgPI37PwPtmC3YPpb247
         rCdonGyMNn0gnY5IFAdO3QcgGJ63U6LqVui87Hzsr1ZzFgm+siiE0yWi0yltwQgbrMsH
         xX7A==
X-Gm-Message-State: APjAAAVDIls4N/zd00Uj61cJw2zERzQoHc0zjM2Tpcs7ljMVBObPhFkT
        ttjzuyVHD0KPbOnO1VNUbUMt5w==
X-Google-Smtp-Source: APXvYqy/ZF1W56BYZyMWgqSYtJ5QoXnk2Q5jOdJW84PVtYVDa3GxlwLtVVqiFXWVLJYqEOcXHYdi2Q==
X-Received: by 2002:a65:6546:: with SMTP id a6mr3208852pgw.220.1565867448258;
        Thu, 15 Aug 2019 04:10:48 -0700 (PDT)
Received: from localhost.localdomain ([2404:e801:200e:19c4:6c3f:b548:3a9c:7867])
        by smtp.googlemail.com with ESMTPSA id z13sm1042678pjn.32.2019.08.15.04.10.41
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 15 Aug 2019 04:10:47 -0700 (PDT)
From:   Tom Murphy <murphyt7@tcd.ie>
To:     iommu@lists.linux-foundation.org
Cc:     Tom Murphy <murphyt7@tcd.ie>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH V5 4/5] iommu/dma-iommu: Use the dev->coherent_dma_mask
Date:   Thu, 15 Aug 2019 12:09:42 +0100
Message-Id: <20190815110944.3579-5-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815110944.3579-1-murphyt7@tcd.ie>
References: <20190815110944.3579-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the dev->coherent_dma_mask when allocating in the dma-iommu ops api.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/dma-iommu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 906b7fa14d3c..b9a3ab02434b 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -471,7 +471,7 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 }
 
 static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
-		size_t size, int prot)
+		size_t size, int prot, dma_addr_t dma_mask)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -484,7 +484,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 
 	size = iova_align(iovad, size + iova_off);
 
-	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
+	iova = iommu_dma_alloc_iova(domain, size, dma_mask, dev);
 	if (!iova)
 		return DMA_MAPPING_ERROR;
 
@@ -735,7 +735,7 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 	dma_addr_t dma_handle;
 
-	dma_handle = __iommu_dma_map(dev, phys, size, prot);
+	dma_handle = __iommu_dma_map(dev, phys, size, prot, dma_get_mask(dev));
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    dma_handle != DMA_MAPPING_ERROR)
 		arch_sync_dma_for_device(dev, phys, size, dir);
@@ -938,7 +938,8 @@ static dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	return __iommu_dma_map(dev, phys, size,
-			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO);
+			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO,
+			dma_get_mask(dev));
 }
 
 static void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
@@ -1041,7 +1042,8 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 	if (!cpu_addr)
 		return NULL;
 
-	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot);
+	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot,
+			dev->coherent_dma_mask);
 	if (*handle == DMA_MAPPING_ERROR) {
 		__iommu_dma_free(dev, size, cpu_addr);
 		return NULL;
-- 
2.20.1

