Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 303DD44F36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 00:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbfFMWjX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 18:39:23 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46137 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfFMWjX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 18:39:23 -0400
Received: by mail-ed1-f65.google.com with SMTP id d4so446048edr.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 15:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8su+LTkJ3gu2cKId6zqNGdio1nz4zdi4nwIHQT6LW2c=;
        b=JS+r5933+fWnWQ/iL9KFp6vvmc39vjWY4aRQgEQUu1LHWyJrIRUXht606UlZxnurzI
         KAZLXBy3sIe36V/9BqMsC+vFbmjMnVY97ZzJCtRgYx8mdzAE7wVffMFLBO6UqxUWabJz
         0Hz+OFHE49MVr7p7JzNgIvA7ge1zMROlXfBGhix+41c3+QmSSkVaLXEUSaz7w2Anb43A
         p7ZG1gGsFVDTPk6FbKEwSNEUZ12beSwqVxE0k6szS1Aw+RC1JWhFHl1yrwzCSOaWKO0U
         RhQWM8WCkxOXdm2nnnmop1AtPe0bhW1GtbPyhmT0+gh/oNrPgb0xrnAUDwg81BqDyFwo
         RLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8su+LTkJ3gu2cKId6zqNGdio1nz4zdi4nwIHQT6LW2c=;
        b=Bp4/CgVITnPnoFZazKzwnb+m6x5PEPar01093p9Ninp4ELKWPQRYEX+gH5kZekunI7
         E/Mp6eFomql3el4k0WfZX8VP8mEqaw2rLzIerY5ZIvAnKMFQuQNAkoH9RWHSf7MpOanz
         OGEFU3hh7gLhaVeg7Es/NNxoPd3ZSHmkzm4sQKSANrc4xB3fcsxpoGRA1PKYoevZ57jv
         knP6/MXPgQe3J9L0suXK+WjF1u+35eigNRygQo5uDw038wK3KY6CB70MRaC2vI9pUga7
         pXwbLoKRbLmWBqiwtxOZudHZ3N7WDNOGnJLY9FhEs+y3c8LToV7mhpcnxw/mTH6Hvr/W
         ixbg==
X-Gm-Message-State: APjAAAW2tMj3sZfsXXIxMHOLFyUCVjwyYg1XGNePjxAg8ighpUhrw4+w
        3TPL6gzQGlORczQZuJT4KUbDQg==
X-Google-Smtp-Source: APXvYqwiLsgtWLoYPPZl+fyjinK6XDv3NWeGJwWa5Qvs5fKDD2WwJE8mSwCbHvv+PkgMGDmQa9RuEQ==
X-Received: by 2002:a17:906:32d2:: with SMTP id k18mr20071313ejk.232.1560465562018;
        Thu, 13 Jun 2019 15:39:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:a0:bc00:8042:d435:a754:1f22])
        by smtp.googlemail.com with ESMTPSA id s16sm216522eji.27.2019.06.13.15.39.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 15:39:21 -0700 (PDT)
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
Subject: [PATCH v4 1/5] iommu/amd: Remove unnecessary locking from AMD iommu driver
Date:   Thu, 13 Jun 2019 23:38:56 +0100
Message-Id: <20190613223901.9523-2-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613223901.9523-1-murphyt7@tcd.ie>
References: <20190613223901.9523-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We can remove the mutex lock from amd_iommu_map and amd_iommu_unmap.
iommu_map doesn’t lock while mapping and so no two calls should touch
the same iova range. The AMD driver already handles the page table page
allocations without locks so we can safely remove the locks.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/amd_iommu.c       | 10 +---------
 drivers/iommu/amd_iommu_types.h |  1 -
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 73740b969e62..065639e090fe 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -2858,7 +2858,6 @@ static void protection_domain_free(struct protection_domain *domain)
 static int protection_domain_init(struct protection_domain *domain)
 {
 	spin_lock_init(&domain->lock);
-	mutex_init(&domain->api_lock);
 	domain->id = domain_id_alloc();
 	if (!domain->id)
 		return -ENOMEM;
@@ -3045,9 +3044,7 @@ static int amd_iommu_map(struct iommu_domain *dom, unsigned long iova,
 	if (iommu_prot & IOMMU_WRITE)
 		prot |= IOMMU_PROT_IW;
 
-	mutex_lock(&domain->api_lock);
 	ret = iommu_map_page(domain, iova, paddr, page_size, prot, GFP_KERNEL);
-	mutex_unlock(&domain->api_lock);
 
 	domain_flush_np_cache(domain, iova, page_size);
 
@@ -3058,16 +3055,11 @@ static size_t amd_iommu_unmap(struct iommu_domain *dom, unsigned long iova,
 			   size_t page_size)
 {
 	struct protection_domain *domain = to_pdomain(dom);
-	size_t unmap_size;
 
 	if (domain->mode == PAGE_MODE_NONE)
 		return 0;
 
-	mutex_lock(&domain->api_lock);
-	unmap_size = iommu_unmap_page(domain, iova, page_size);
-	mutex_unlock(&domain->api_lock);
-
-	return unmap_size;
+	return iommu_unmap_page(domain, iova, page_size);
 }
 
 static phys_addr_t amd_iommu_iova_to_phys(struct iommu_domain *dom,
diff --git a/drivers/iommu/amd_iommu_types.h b/drivers/iommu/amd_iommu_types.h
index 52c35d557fad..5d5f5d009b19 100644
--- a/drivers/iommu/amd_iommu_types.h
+++ b/drivers/iommu/amd_iommu_types.h
@@ -461,7 +461,6 @@ struct protection_domain {
 	struct iommu_domain domain; /* generic domain handle used by
 				       iommu core code */
 	spinlock_t lock;	/* mostly used to lock the page table*/
-	struct mutex api_lock;	/* protect page tables in the iommu-api path */
 	u16 id;			/* the domain id written to the device table */
 	int mode;		/* paging mode (0-6 levels) */
 	u64 *pt_root;		/* page table root pointer */
-- 
2.20.1

