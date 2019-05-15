Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37EFE1F4BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 14:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfEOMq4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 08:46:56 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45308 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726911AbfEOMqz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 08:46:55 -0400
Received: by mail-pl1-f195.google.com with SMTP id a5so1282943pls.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2019 05:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b3HyjACi/MsUUs/bdvxi48Ab6BnFJ6ZhEKEib98a4qc=;
        b=Xql7xL76UlYG2HgQrNw2rS48dkmsc4mtYUzCNuPcx9exYI1ZmEu7lZqz2wZCRpSq5N
         P/62eA1WGojofeojjMEVVfykGFGMoC0h24yl2IGMP+MMD6n/+9xLNayyFAwmk67CqnR1
         m8FLpulEhu3q1K43A5KpMSgYNY/9ZQFxlv1sLLC+Y4jO+Ip0fUJakXQ0r3SGBP8eKC6y
         8c8qARg+kB1bO3KBeiRnMVlAPDwWif2wtpKXbjbo5qVDDAOu6rngr7KYzRQuR7hO5Gmh
         lcl5CLLB06Ib9xN7L7Nu/HtKO3R428g2WTFCp36Qq7GME8YG4fu4z4pF+aWoLIZ6h2KQ
         NZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b3HyjACi/MsUUs/bdvxi48Ab6BnFJ6ZhEKEib98a4qc=;
        b=WVMSYE5GNQ7h6lI5mIP1MZi1E+dbP34FI29yEiITC98KsLjR6zTdwQ4j5vA4CTifdT
         X6We88YjWy5mU8EdGnrrdkdTtYYkA6pMoDzsJtgcQ3WVBfIkjVT90oOM+YVpR+LrCG3R
         WnD2zALmAZ/kit3SEcbezsTXHNB9IOO45OqoiTSloVZmU286lH51kE5ZEAYhyjtJZ57z
         0W5KTCA3LW9WO/1qp1p53b2hkoA7lSzvyembSgTFrC4DOu/k3Wi3w840nLKjVzc4w6gZ
         ZKrGjrVXTymoXhctzv26TEwYsX5fqiZPMbpw1TFjAByIVxvc9WbZHhnxLJ3jAbHpZnti
         sMGQ==
X-Gm-Message-State: APjAAAVNkHxjUIDPDvSs3IVBbvIkofg1o1GbE+Vdbaya5g3ez+WFVkx/
        Otg/Lqj7wPxGyQc5aVu1SkyffTOzlcBnH/8/XfI8cQ==
X-Google-Smtp-Source: APXvYqwTSlq+glzh8dvBA9RnhTgkzA0FJBG+kmyFPUzc3vgEhgrnY6HSdtm+CvmJk20OFdPWunOILeeGu3jijFHRxb0=
X-Received: by 2002:a17:902:4181:: with SMTP id f1mr22625568pld.22.1557924414679;
 Wed, 15 May 2019 05:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190506185207.31069-1-tmurphy@arista.com> <20190506185207.31069-3-tmurphy@arista.com>
 <20190507064000.GB5173@infradead.org>
In-Reply-To: <20190507064000.GB5173@infradead.org>
From:   Tom Murphy <tmurphy@arista.com>
Date:   Wed, 15 May 2019 13:46:43 +0100
Message-ID: <CAPL0++5AUyVHexpsE86PfXxmQgDHfxjSSoAAGXM5c7Mdix=OZQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] iommu/dma-iommu: Handle deferred devices
To:     Christoph Hellwig <hch@infradead.org>
Cc:     iommu@lists.linux-foundation.org, Tom Murphy <murphyt7@tcd.ie>,
        Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

like this?

In that case we need to add a call to iommu_dma_alloc_remap.

From 862aeebb601008cf863e3aff4ff8ed7cefebeefa Mon Sep 17 00:00:00 2001
From: Tom Murphy <tmurphy@tmurphy-419tom-0.sjc.aristanetworks.com>
Date: Wed, 15 May 2019 05:43:25 -0700
Subject: [PATCH] iommu/dma-iommu: Handle deferred devices

Handle devices which defer their attach to the iommu in the dma-iommu api

Signed-off-by: Tom Murphy <tmurphy@arista.com>
---
 drivers/iommu/dma-iommu.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7f313cfa9..a48ae906d 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -22,6 +22,7 @@
 #include <linux/pci.h>
 #include <linux/scatterlist.h>
 #include <linux/vmalloc.h>
+#include <linux/crash_dump.h>

 struct iommu_dma_msi_page {
     struct list_head    list;
@@ -323,6 +324,21 @@ static int iommu_dma_init_domain(struct
iommu_domain *domain, dma_addr_t base,
     return iova_reserve_iommu_regions(dev, domain);
 }

+static int handle_deferred_device(struct device *dev,
+        struct iommu_domain *domain)
+{
+    const struct iommu_ops *ops = domain->ops;
+
+    if (!is_kdump_kernel())
+        return 0;
+
+    if (unlikely(ops->is_attach_deferred &&
+            ops->is_attach_deferred(domain, dev)))
+        return iommu_attach_device(domain, dev);
+
+    return 0;
+}
+
 /**
  * dma_info_to_prot - Translate DMA API directions and attributes to IOMMU API
  *                    page flags.
@@ -432,6 +448,9 @@ static dma_addr_t __iommu_dma_map(struct device
*dev, phys_addr_t phys,
     size_t iova_off = 0;
     dma_addr_t iova;

+    if (unlikely(handle_deferred_device(dev, domain)))
+        return DMA_MAPPING_ERROR;
+
     if (cookie->type == IOMMU_DMA_IOVA_COOKIE) {
         iova_off = iova_offset(&cookie->iovad, phys);
         size = iova_align(&cookie->iovad, size + iova_off);
@@ -609,6 +628,9 @@ static void *iommu_dma_alloc_remap(struct device
*dev, size_t size,
     dma_addr_t iova;
     void *vaddr;

+    if (unlikely(handle_deferred_device(dev, domain)))
+        return DMA_MAPPING_ERROR;
+
     *dma_handle = DMA_MAPPING_ERROR;

     min_size = alloc_sizes & -alloc_sizes;
@@ -836,7 +858,7 @@ static dma_addr_t iommu_dma_map_page(struct device
*dev, struct page *page,
     bool coherent = dev_is_dma_coherent(dev);
     dma_addr_t dma_handle;

-    dma_handle =__iommu_dma_map(dev, phys, size,
+    dma_handle = __iommu_dma_map(dev, phys, size,
             dma_info_to_prot(dir, coherent, attrs),
             iommu_get_dma_domain(dev));
     if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
@@ -954,6 +976,9 @@ static int iommu_dma_map_sg(struct device *dev,
struct scatterlist *sg,
     unsigned long mask = dma_get_seg_boundary(dev);
     int i;

+    if (unlikely(handle_deferred_device(dev, domain)))
+        return 0;
+
     if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
         iommu_dma_sync_sg_for_device(dev, sg, nents, dir);

-- 
2.20.0

On Tue, May 7, 2019 at 7:40 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, May 06, 2019 at 07:52:04PM +0100, Tom Murphy wrote:
> > +static int handle_deferred_device(struct device *dev)
> > +{
> > +     struct iommu_domain *domain;
> > +     const struct iommu_ops *ops;
> > +
> > +     if (!is_kdump_kernel())
> > +             return 0;
> > +
> > +     domain = iommu_get_domain_for_dev(dev);
>
> > -     dma_handle =__iommu_dma_map(dev, phys, size,
> > +     if (unlikely(handle_deferred_device(dev)))
> > +             return DMA_MAPPING_ERROR;
> > +
> > +     dma_handle = __iommu_dma_map(dev, phys, size,
>
> __iommu_dma_map already looks up the domain, and as far as I can
> tell all callers need the handle_deferred_device call.  Should we
> just move it to there and pass the domain from the caller?
>
> Also shouldn't the iommu_attach_device call inside
> handle_deferred_device also get an unlikely marker?
