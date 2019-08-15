Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5B18E9B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 13:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731051AbfHOLK0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 07:10:26 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42172 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731043AbfHOLKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 07:10:25 -0400
Received: by mail-pl1-f193.google.com with SMTP id y1so961458plp.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2019 04:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H8YsE1R3VKt11b2vPfO5I4rTXhEDtbvh4/hWRhbqtaM=;
        b=AnsHS7DAOfX5goOT/7evKdCXr6zqdTp/mu4gAJneCWRt/pzazl5g48d/5ntrFMrNNH
         B1/atoeIrOUdUUAbllqXfzF9mKNyr51bhxPeWSW+r32uhrGINmH4vzPLsNXL0Q780o9K
         XBx8jtsyOtkAMHMB3YX2GiZDGWHmdw+iAzpeDKmLOkiAWjx1MSkRphfwLIcwTqmRI9Pi
         5fo7jyW4eBFEcNY07LXxnDW9rcMST7iKX22YEIIJ6EZ+zeEAgLfeCQwzMFG6ItH1xQ+I
         tVOY9pELjohMsN1MUUpj2sZ64VBC8ecPsaXdQtDg8KVNKfJSpeV7SahJHjCJF4TD7uKO
         WldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H8YsE1R3VKt11b2vPfO5I4rTXhEDtbvh4/hWRhbqtaM=;
        b=CGG7JV2BY8eyg14LgdfmN3VRJCBbTnb1aq5h7w87lpt5psmBHgs9lGATGhxo/lSTMK
         Rkh1opQKLUfOCLZ92D1BS68qgJ99Fd5iZm7yCX4TcNgD1fiR8yL82dqR9vEKdrpBREkT
         5qBBGzKrbWOcC6wYqGsPfYH6/5HZ5SPbMp/rQRuJwfPMoq3KMjquBlG/Ue91ufyKU0Ah
         tKd3bdSArR4ZNiMALu/R8EjSYY7bF9F09/iv/8yuhyltZNc+qYxTnHGWmlMQMRhUvm/H
         uGdqfzFF/EkX2vtk4VkcwKzs5Jv2T6mgZJP+d2gztK5O3pEgnDY3BptK3GnC/vyV1rS9
         cDVA==
X-Gm-Message-State: APjAAAVrmvoLDiG1qulQiF3DCsdPYNyVVnWFsuBLeWZBkcHx/bS9kNFM
        7arvHZTjLTwOqmmMCdJ7t5FbPg==
X-Google-Smtp-Source: APXvYqxQmRTy6JR018gdfwbztNI2AL0CrwPSVdVGydFo6FztH+8DnZHDDGjukvyliCw9mNFUO6BPnA==
X-Received: by 2002:a17:902:4383:: with SMTP id j3mr3725604pld.69.1565867425139;
        Thu, 15 Aug 2019 04:10:25 -0700 (PDT)
Received: from localhost.localdomain ([2404:e801:200e:19c4:6c3f:b548:3a9c:7867])
        by smtp.googlemail.com with ESMTPSA id z13sm1042678pjn.32.2019.08.15.04.10.18
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 15 Aug 2019 04:10:24 -0700 (PDT)
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
Subject: [PATCH V5 1/5] iommu/amd: Remove unnecessary locking from AMD iommu driver
Date:   Thu, 15 Aug 2019 12:09:39 +0100
Message-Id: <20190815110944.3579-2-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815110944.3579-1-murphyt7@tcd.ie>
References: <20190815110944.3579-1-murphyt7@tcd.ie>
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
index 008da21a2592..1948be7ac8f8 100644
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
index 9ac229e92b07..b764e1a73dcf 100644
--- a/drivers/iommu/amd_iommu_types.h
+++ b/drivers/iommu/amd_iommu_types.h
@@ -468,7 +468,6 @@ struct protection_domain {
 	struct iommu_domain domain; /* generic domain handle used by
 				       iommu core code */
 	spinlock_t lock;	/* mostly used to lock the page table*/
-	struct mutex api_lock;	/* protect page tables in the iommu-api path */
 	u16 id;			/* the domain id written to the device table */
 	int mode;		/* paging mode (0-6 levels) */
 	u64 *pt_root;		/* page table root pointer */
-- 
2.20.1

