Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A851D8E9BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 13:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731227AbfHOLKl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 07:10:41 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32944 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731211AbfHOLKl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 07:10:41 -0400
Received: by mail-pf1-f193.google.com with SMTP id g2so1208204pfq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2019 04:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wEXYBj4ZBszv35LjPu3E0u6/kt/85OrrD2EeNCzkUBc=;
        b=XPPWwuG3BDtz9zLilW2olnPQ8ky35xrZG26qdZoB3LKh+/iwHAy+bQF2KDrKdeZV2N
         CMTiP1KN8tbu+2JHXJXi4WMKf7pv6aJchfGyVAIQeRPVOA5SHX+VjgzKcX/YdgQ2Q49J
         WHVoRkKJQkRRYx/ESCBuBgwYULgKq63cchemUhQyQD+fGZ/EwFT7thT98qu4z4y1OJOr
         KUn/PiuD6xKX7UW6sGW0qNLIpt/JJJS6XPXy2MM+c1i9GQSQcdjzaTzojhkUzjY+53Zo
         QQZXJx9rjkb87RL67ZGpbXqvGzPC8NuSgWdiBT9lKeJvkxiOGe+F68SjIGE3NiZJVCHu
         f0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wEXYBj4ZBszv35LjPu3E0u6/kt/85OrrD2EeNCzkUBc=;
        b=PgmRWqckutYCIzqHIfBdiQw+XKheJ3q3457LzfRg1ySOXvwjc5uiMhO8FX41oALhPv
         LNYDJXRY6pOblLkjKSt4fgjVAUJHsXTMA6iifLVFNW8LtPLKNVwDYpFFhJi0BdVDIpuk
         qthtrHY+VygXYBr8ObCUWt/7RYUjNEvkQPaZPx8aLrYmjW8x4VXqs7D6Y/En1wB1cucg
         v2ZJF7W/bwxJ6U9K4556yb+iW910gtyuHdtn0MB1RYd1N5Gr6mngHlDiqEBkyfz48Y27
         zpSc8R6JhCvCSYTIfwAtnOR5cSZXZYbHLbbaGZGhv1Gslhl1HHxlTHaECDGlmA1AArI+
         x0Vg==
X-Gm-Message-State: APjAAAWV22Pr1ytC2SOK2Pbc94jiFL1dQiHlHqnqf+95KxIY/daKR5w8
        bqKmOfcOSiKitkkzjVJvqFSpzA==
X-Google-Smtp-Source: APXvYqzSB4whsCSMrGCbOhHnYoZ8j/zh/fuAVTXq5C215cfTrXcxsBzvL3L0WHO6kT05nQmnVEnbRg==
X-Received: by 2002:aa7:91cc:: with SMTP id z12mr4887018pfa.76.1565867440836;
        Thu, 15 Aug 2019 04:10:40 -0700 (PDT)
Received: from localhost.localdomain ([2404:e801:200e:19c4:6c3f:b548:3a9c:7867])
        by smtp.googlemail.com with ESMTPSA id z13sm1042678pjn.32.2019.08.15.04.10.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 15 Aug 2019 04:10:40 -0700 (PDT)
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
Subject: [PATCH V5 3/5] iommu/dma-iommu: Handle deferred devices
Date:   Thu, 15 Aug 2019 12:09:41 +0100
Message-Id: <20190815110944.3579-4-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815110944.3579-1-murphyt7@tcd.ie>
References: <20190815110944.3579-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Handle devices which defer their attach to the iommu in the dma-iommu api

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/dma-iommu.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 2712fbc68b28..906b7fa14d3c 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
 #include <linux/vmalloc.h>
+#include <linux/crash_dump.h>
 
 struct iommu_dma_msi_page {
 	struct list_head	list;
@@ -351,6 +352,21 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 	return iova_reserve_iommu_regions(dev, domain);
 }
 
+static int handle_deferred_device(struct device *dev,
+	struct iommu_domain *domain)
+{
+	const struct iommu_ops *ops = domain->ops;
+
+	if (!is_kdump_kernel())
+		return 0;
+
+	if (unlikely(ops->is_attach_deferred &&
+		ops->is_attach_deferred(domain, dev)))
+		return iommu_attach_device(domain, dev);
+
+	return 0;
+}
+
 /**
  * dma_info_to_prot - Translate DMA API directions and attributes to IOMMU API
  *                    page flags.
@@ -463,6 +479,9 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 	size_t iova_off = iova_offset(iovad, phys);
 	dma_addr_t iova;
 
+	if (unlikely(handle_deferred_device(dev, domain)))
+		return DMA_MAPPING_ERROR;
+
 	size = iova_align(iovad, size + iova_off);
 
 	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
@@ -581,6 +600,9 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 
 	*dma_handle = DMA_MAPPING_ERROR;
 
+	if (unlikely(handle_deferred_device(dev, domain)))
+		return NULL;
+
 	min_size = alloc_sizes & -alloc_sizes;
 	if (min_size < PAGE_SIZE) {
 		min_size = PAGE_SIZE;
@@ -713,7 +735,7 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 	dma_addr_t dma_handle;
 
-	dma_handle =__iommu_dma_map(dev, phys, size, prot);
+	dma_handle = __iommu_dma_map(dev, phys, size, prot);
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    dma_handle != DMA_MAPPING_ERROR)
 		arch_sync_dma_for_device(dev, phys, size, dir);
@@ -823,6 +845,9 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	unsigned long mask = dma_get_seg_boundary(dev);
 	int i;
 
+	if (unlikely(handle_deferred_device(dev, domain)))
+		return 0;
+
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		iommu_dma_sync_sg_for_device(dev, sg, nents, dir);
 
-- 
2.20.1

