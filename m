Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 427B7ACFEE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2019 18:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730107AbfIHQ5C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Sep 2019 12:57:02 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45400 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730108AbfIHQ5C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Sep 2019 12:57:02 -0400
Received: by mail-pf1-f193.google.com with SMTP id y72so7620071pfb.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Sep 2019 09:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RfHmYWiMThI6XBXa2YE269JhY5zyIOLGivfX/oOORWs=;
        b=DmYpORWJqyzijh72UcrIWdFFAa+ww/GFK6qzQZmnCCIq+YOTGiYhGxXGAJUM66+ViZ
         biwANpSj16S/IWvPLXicptTlojpKqRsl76xoCqv73zpCCmI3Ry414D3qf2XQVJbLRkYz
         MKnJeO0BCQbCSPBcJvHk9ZwcjQJmI1fqHAOJBw/kpdeXEc9zDiUH7BWR7nt5hq2VV4VR
         TAj4QqkEciqMizmYpSv4Bxfifj1yjQ+HWcpbGVpdYl9a40kDFvNZUQAn1t+nqa9RKoq8
         fG0I7ETsqgdcF+2BV6wQGXzS4yhP6Cp/jMrleb7Yt2880pcKUcT3rXZGljbub+Wz2vpU
         Y6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RfHmYWiMThI6XBXa2YE269JhY5zyIOLGivfX/oOORWs=;
        b=ToWrWp5RChrA/IYu2O4hm7Hg+CoUpRjF4lqkO45/avGH5ztovd6YgibfuyoDQXfMmo
         OemOGGfOLbfHrJ57sgSbn+h5kziAE04DvIuke33C4ZfEXBZdjahFVA04xiAr0AACv0Mr
         06dG02WjfZPjDnEnQu4j5HK8uwlBHKRzw7P0umwLvQ9nqD4ci2mmgxxVMR888NTxB5vS
         Ay/+H+57rHPih/ossHnk7U9Cz7qzeAG5K+ED6nQygVviIt96Pwm9HYLHaXac/gWJuEvw
         J/RCaIf8mzZ4QEn4q8cd2iQXaqdxi2EhDSKqq9rD+9luYlxG8LZXH1o8csDu51ArIP5I
         47UQ==
X-Gm-Message-State: APjAAAX3ZDPSAQJFX4sUvJ8r+CROonmXBr1xIcIBnJwL3UuZlo3ztgYx
        jjQ/Y3zeQze/hQnxrB+1qmYDHQ==
X-Google-Smtp-Source: APXvYqwb14B4be5Dly+SGA8/U+UtNd3CILzif54GYTzQtR0eqj4U9DtUfUiUL561KlrtajOkqtGwTA==
X-Received: by 2002:a17:90a:28c5:: with SMTP id f63mr11263462pjd.67.1567961821142;
        Sun, 08 Sep 2019 09:57:01 -0700 (PDT)
Received: from localhost.localdomain ([24.244.23.109])
        by smtp.googlemail.com with ESMTPSA id f188sm13834631pfa.170.2019.09.08.09.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2019 09:57:00 -0700 (PDT)
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
Subject: [PATCH V6 1/5] iommu/amd: Remove unnecessary locking from AMD iommu driver
Date:   Sun,  8 Sep 2019 09:56:37 -0700
Message-Id: <20190908165642.22253-2-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190908165642.22253-1-murphyt7@tcd.ie>
References: <20190908165642.22253-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With or without locking it doesn't make sense for two writers to be
writing to the same IOVA range at the same time. Even with locking we
still have a race condition, whoever gets the lock first, so we still
can't be sure what the result will be. With locking the result will be
more sane, it will be correct for the last writer, but still useless
because we can't be sure which writer will get the lock last. It's a
fundamentally broken design to have two writers writing to the same
IOVA range at the same time.

So we can remove the locking and work on the assumption that no two
writers will be writing to the same IOVA range at the same time.

The only exception is when we have to allocate a middle page in the page
tables, the middle page can cover more than just the IOVA range a writer
has been allocated. However this isn't an issue in the AMD driver
because it can atomically allocate middle pages using "cmpxchg64()".

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

