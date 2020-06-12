Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 429471F728B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 05:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726552AbgFLDkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 23:40:20 -0400
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:48937 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726364AbgFLDkU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 23:40:20 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07488;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0U.JoNap_1591933214;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0U.JoNap_1591933214)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 12 Jun 2020 11:40:15 +0800
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
To:     joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        matthias.bgg@gmail.com, robdclark@gmail.com, robh@kernel.org,
        tomeu.vizoso@collabora.com, steven.price@arm.com,
        alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     baolin.wang@linux.alibaba.com, baolin.wang7@gmail.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] iommu: Mark __iommu_map/__iommu_map_sg as static
Date:   Fri, 12 Jun 2020 11:39:54 +0800
Message-Id: <ab722e9970739929738066777b8ee7930e32abd5.1591930156.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
In-Reply-To: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
References: <cover.1591930156.git.baolin.wang@linux.alibaba.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now the __iommu_map() and __iommu_map_sg() are used only in iommu.c
file, so mark them as static.

Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 drivers/iommu/iommu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 8584f48..14eca9f 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2174,8 +2174,8 @@ static size_t iommu_pgsize(struct iommu_domain *domain,
 	return pgsize;
 }
 
-int __iommu_map(struct iommu_domain *domain, unsigned long iova,
-	      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
+static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
+		       phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	const struct iommu_ops *ops = domain->ops;
 	unsigned long orig_iova = iova;
@@ -2325,9 +2325,9 @@ size_t iommu_unmap_fast(struct iommu_domain *domain,
 }
 EXPORT_SYMBOL_GPL(iommu_unmap_fast);
 
-size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
-		    struct scatterlist *sg, unsigned int nents, int prot,
-		    gfp_t gfp)
+static size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
+			     struct scatterlist *sg, unsigned int nents, int prot,
+			     gfp_t gfp)
 {
 	size_t len = 0, mapped = 0;
 	phys_addr_t start;
-- 
1.8.3.1

