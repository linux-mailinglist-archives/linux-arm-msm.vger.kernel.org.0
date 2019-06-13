Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2853B44F48
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 00:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbfFMWjf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 18:39:35 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46158 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbfFMWjd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 18:39:33 -0400
Received: by mail-ed1-f66.google.com with SMTP id d4so446562edr.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 15:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VIfV1OsDOCOIqv6MGdwh5qyRNpWkUFsV6JcVvbdsKMU=;
        b=JTF8mvZhJ/EJnKSb2g8yYVwCI7gY6AOBJvHEmxI98vcIdBtLCHSGqNBLdR66ae+p3N
         Gz0InBZJxBwcsA2tjrxO7l/2SbOW9EC/J1NpN0q7ctUvhDyiy6gcYSquuay1uuRjHT0l
         YMCpGS8YP90uVBR7O2fFjUN4fpSk/Um0odBXe4DqJz7/xdmuiw3TAlj0hxdMDoWq/uEX
         RG3tSMQSl86NA27lig6IIG+QyQL9PoQFyZu2igpH5UvBqmMPLOASs5VkPg6T4OTwrWrD
         sx/2LKFbOUyC2/QeLMuD34t20k1dyG1V73h2F+lWe0JPXWsoQ86NzkR4a3bo6x0/xWPW
         M2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VIfV1OsDOCOIqv6MGdwh5qyRNpWkUFsV6JcVvbdsKMU=;
        b=eS8KqaSQP1CH/0c9ZbVnX0siHgND9YWLzibtbz2nNiE4cnZY81UOqL0bcYq/6viGwZ
         13aOijwJnw3hSO4AIgW+V5Ufyu51LyLumXDdzpmMTOqpaCyrf6HXZ0GGwjcdT8Gi4X4g
         r9AacrOVDMMWXGHiZOTOhUBfnhcSvZsb6KdimQMiN/rqWayQgFqWsH4Nd+VUePlMh64p
         0ITfK71+0/CT8pXlnceVJvmlcsk7LE98kG6A//t0VipwW6iyFCnYHvlBUvOQM+Ul8Po8
         vRIf7LyqmjLnQver3iXrsVqBl41MjC6NXJK7TTvRR+9DKO666XD+ZBxDPUcAjGAzwGhF
         mLog==
X-Gm-Message-State: APjAAAUcI+JNgiwrvlxY+XjE6YZnGbORIqZvv3voryUeG68BORS1fnOd
        oEhFjbnxk2a1BMn8IvmIvfe1oMrFkUMmxQ==
X-Google-Smtp-Source: APXvYqztuOfR2YM2Du1Zdlax7/DpXIkbSCgn46ot/nG+g0htY0BBU7yj7/Fpx5Lf97ZANT/nGWWzUg==
X-Received: by 2002:a50:a941:: with SMTP id m1mr99843943edc.157.1560465571973;
        Thu, 13 Jun 2019 15:39:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:a0:bc00:8042:d435:a754:1f22])
        by smtp.googlemail.com with ESMTPSA id s16sm216522eji.27.2019.06.13.15.39.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 15:39:31 -0700 (PDT)
From:   Tom Murphy <murphyt7@tcd.ie>
To:     iommu@lists.linux-foundation.org
Cc:     Tom Murphy <murphyt7@tcd.ie>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH v4 3/5] iommu/dma-iommu: Handle deferred devices
Date:   Thu, 13 Jun 2019 23:38:58 +0100
Message-Id: <20190613223901.9523-4-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613223901.9523-1-murphyt7@tcd.ie>
References: <20190613223901.9523-1-murphyt7@tcd.ie>
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
index e64dbbcde63c..f303bbe20e51 100644
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
@@ -462,6 +478,9 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 	size_t iova_off = 0;
 	dma_addr_t iova;
 
+	if (unlikely(handle_deferred_device(dev, domain)))
+		return DMA_MAPPING_ERROR;
+
 	if (cookie->type == IOMMU_DMA_IOVA_COOKIE) {
 		iova_off = iova_offset(&cookie->iovad, phys);
 		size = iova_align(&cookie->iovad, size + iova_off);
@@ -583,6 +602,9 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 
 	*dma_handle = DMA_MAPPING_ERROR;
 
+	if (unlikely(handle_deferred_device(dev, domain)))
+		return NULL;
+
 	min_size = alloc_sizes & -alloc_sizes;
 	if (min_size < PAGE_SIZE) {
 		min_size = PAGE_SIZE;
@@ -715,7 +737,7 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 	dma_addr_t dma_handle;
 
-	dma_handle =__iommu_dma_map(dev, phys, size, prot);
+	dma_handle = __iommu_dma_map(dev, phys, size, prot);
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    dma_handle != DMA_MAPPING_ERROR)
 		arch_sync_dma_for_device(dev, phys, size, dir);
@@ -825,6 +847,9 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	unsigned long mask = dma_get_seg_boundary(dev);
 	int i;
 
+	if (unlikely(handle_deferred_device(dev, domain)))
+		return 0;
+
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 		iommu_dma_sync_sg_for_device(dev, sg, nents, dir);
 
-- 
2.20.1

