Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D370C1C3A49
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 14:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbgEDMzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 08:55:20 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59212 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728465AbgEDMyS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 08:54:18 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200504125415euoutp02903a0604fb7a9e98767c34c511ad9138~L1Gx7piA31839718397euoutp02r
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2020 12:54:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200504125415euoutp02903a0604fb7a9e98767c34c511ad9138~L1Gx7piA31839718397euoutp02r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1588596856;
        bh=SFZ/7lR7IpjrKlKSLmU4abJrB2xlg5tDaklhAbe7jX0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eMeCEPzHTZBxBizPvf9pXo/5N++dSt0Sp8EtWcKAVl2yNMNjPevL2aNDdcp2j42Oe
         +Sok/9QVhg0LiIvh6lxgageGWOZIA1e896Qe2ga9wBQ/A+cAN3FDPznzXGhN1/x9UH
         aFyggdoMkvc8APoh/uv1GakQuFgWGr12PTU/9B+Q=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200504125415eucas1p200586e88883ec1cdbf36f79bba25a4ad~L1GxkwCJn2246922469eucas1p2e;
        Mon,  4 May 2020 12:54:15 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 36.12.60698.77010BE5; Mon,  4
        May 2020 13:54:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200504125415eucas1p2757f9a71add8c7547bc8f85906468113~L1GxNC5to2267422674eucas1p2u;
        Mon,  4 May 2020 12:54:15 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200504125415eusmtrp1e1284d4f03879fd64553ffa12e4072a2~L1GxMVuIW2497724977eusmtrp1X;
        Mon,  4 May 2020 12:54:15 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-4c-5eb010771511
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 66.06.07950.77010BE5; Mon,  4
        May 2020 13:54:15 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200504125414eusmtip2198d08fccd13a642afb1d3d0a06c7de6~L1Gwe7ZaQ0241602416eusmtip2W;
        Mon,  4 May 2020 12:54:14 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 08/21] drm: msm: fix sg_table nents vs. orig_nents misuse
Date:   Mon,  4 May 2020 14:53:46 +0200
Message-Id: <20200504125359.5678-8-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200504125359.5678-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0VSWUwTURT1dabToVAdCpEXJBBr1IgIEkBHAQPExAnhw+CPwYhUGFoiBdKy
        /9igglaqshihgKKi7LIKWMJWlmpZJCwGkQYRBSE0YlgiqCBlAP/Odt+5uXk4wu9gW+NhEdG0
        NEIYLsC4aF3XSt+xOKIy8HjHnB2p7HvHIquyKtjkel0aQg4t/cDI3OleQBaXdrLI/BZ3cnFo
        gkVWT35gk2ktvRxyUJ2LkeUdeg45/fQXQrbNf2WT+owO4LWHKntcBqim5XyUeqPSc6j65c9s
        avyulkXVFFynPq1NIlTGSCGgGj/KMUqrHuVQ92pLALVQbXveLIDrEUKHh8XSUqczQVxx6Zc1
        ELXMj9cZ3ORATiiACQ4JV/ileQxRAC7OJ4oAXH2/jjJkEUClepHFkAUAM1/oONsjOTU9gDEK
        AVSk52E7I8sF1SxjCiOcocKgwIzYkrgF4FulmTGEECoEftf83jQsCD+YoxtGjRglDsIUXTZb
        AXCcR3jA8akTTJsdLK1sRYyyCeEJs5WHjc9AYpQD1cqHGJM5C0v1eSwGW8BZbe3WpjawOyMV
        ZQZuADjRV85hSCqAg0lZgEm5w7G+VczYgBBHYIXaiZG94WDe9OY+kNgNRwzmRhnZgOl1jxBG
        5sHbyXwmfQiqtK92atv6BxAGU/DOkmrrvu0ArvSPgwfATvW/LB+AEmBFx8gkIlrmEkHHOcqE
        EllMhMgxOFJSDTb+VveadqkBNP+5qgEEDgRmvIsLFYF8tjBWliDRAIgjAktew80NiRciTEik
        pZFXpDHhtEwD9uGowIrn8mzmMp8QCaPpazQdRUu3XRZuYi0HvKCT8W7W6fx1JLEn0TcYjxxW
        nNv784JfQFF7aPNfgzfu1aUQ+/sunW48WpXEXzNNbg6db/jW4+g5JRUl2x+w8N41a1rkWh9n
        OmqjLdaIZtlDwc7745/YrKbc11/ys+130Ou9Ol/nOvo0Pbd9uThXP2Be6+QjPpWJxvuLfR1m
        WgWoTCx0tkekMuE/ZvP2N1cDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsVy+t/xe7rlAhviDM5u5bToPXeSyWLjjPWs
        Fv+3TWS2uPL1PZvFnOdnGS1Wrj7KZLFgv7XFlysPmSw2Pb7GajFx/1l2i8u75rBZrD1yl93i
        +cIfzBYHPzxhtbg7+QijA7/HmnlrGD32flvA4rFz1l12j+3fHrB63O8+zuSxeUm9x+1/j5k9
        Jt9Yzuix+2YDm8fxXbfYPfq2rGL0+LxJLoAnSs+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRS
        z9DYPNbKyFRJ384mJTUnsyy1SN8uQS9j9aN/jAXfhCpOvTVtYGwQ6GLk5JAQMJGYvfkMYxcj
        F4eQwFJGiZer3rBAJGQkTk5rYIWwhSX+XOtigyj6xChxrnsTWIJNwFCi6y1EQkSgk1FiWvdH
        dhCHWWAJs0Tf1EtsIFXCAj4Ss09dBRvLIqAq0X5qJlA3BwevgI3E/WdmEBvkJVZvOMAMEuYU
        sJWY2asOEhYSyJe4+/QfywRGvgWMDKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECo2jbsZ9b
        djB2vQs+xCjAwajEw7vh6/o4IdbEsuLK3EOMEhzMSiK8O1qAQrwpiZVVqUX58UWlOanFhxhN
        gU6ayCwlmpwPjPC8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2M
        LcIGjmedQ/1YHl9ymXz1wByNa79Co7TVvrHUFMvMfzxVudXZ+pfOlSlvDSTKP9fP6OqvU7T7
        G6hW8FuZ91r3s/q34pyrjsQ0bH+8r3jjg9LHH/tcl1gbd5dJBt64xsLHnCRodzb2f0r5zk1m
        O25veW0VVTzZ73/LhL8PXgcU/oiffTsn7s4CJZbijERDLeai4kQAb5PeGrgCAAA=
X-CMS-MailID: 20200504125415eucas1p2757f9a71add8c7547bc8f85906468113
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200504125415eucas1p2757f9a71add8c7547bc8f85906468113
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200504125415eucas1p2757f9a71add8c7547bc8f85906468113
References: <20200504125017.5494-1-m.szyprowski@samsung.com>
        <20200504125359.5678-1-m.szyprowski@samsung.com>
        <CGME20200504125415eucas1p2757f9a71add8c7547bc8f85906468113@eucas1p2.samsung.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Documentation/DMA-API-HOWTO.txt states that dma_map_sg returns the
numer of the created entries in the DMA address space. However the
subsequent calls to dma_sync_sg_for_{device,cpu} and dma_unmap_sg must be
called with the original number of entries passed to dma_map_sg. The
sg_table->nents in turn holds the result of the dma_map_sg call as stated
in include/linux/scatterlist.h. Adapt the code to obey those rules.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
For more information, see '[PATCH v2 00/21] DRM: fix struct sg_table nents
vs. orig_nents misuse' thread: https://lkml.org/lkml/2020/5/4/373
---
 drivers/gpu/drm/msm/msm_gem.c   | 8 ++++----
 drivers/gpu/drm/msm/msm_iommu.c | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5a6a79f..54c3bbb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -54,10 +54,10 @@ static void sync_for_device(struct msm_gem_object *msm_obj)
 
 	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
 		dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+			msm_obj->sgt->orig_nents, DMA_BIDIRECTIONAL);
 	} else {
 		dma_map_sg(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+			msm_obj->sgt->orig_nents, DMA_BIDIRECTIONAL);
 	}
 }
 
@@ -67,10 +67,10 @@ static void sync_for_cpu(struct msm_gem_object *msm_obj)
 
 	if (get_dma_ops(dev) && IS_ENABLED(CONFIG_ARM64)) {
 		dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+			msm_obj->sgt->orig_nents, DMA_BIDIRECTIONAL);
 	} else {
 		dma_unmap_sg(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+			msm_obj->sgt->orig_nents, DMA_BIDIRECTIONAL);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index ad58cfe..b0ca084 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -43,7 +43,8 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64_t iova,
 	struct msm_iommu *iommu = to_msm_iommu(mmu);
 	size_t ret;
 
-	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->nents, prot);
+	ret = iommu_map_sg(iommu->domain, iova, sgt->sgl, sgt->orig_nents,
+			   prot);
 	WARN_ON(!ret);
 
 	return (ret == len) ? 0 : -EINVAL;
-- 
1.9.1

