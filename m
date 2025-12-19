Return-Path: <linux-arm-msm+bounces-85971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC71CD17B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8EE533020147
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5602834CFBA;
	Fri, 19 Dec 2025 18:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ykRwGRLj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62A034D921
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 18:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170008; cv=none; b=dSIB6BR2fXjiDC16hpLO4AvQp3jnsMLbptUQ39tk9VxMrVWrM+bNUPljtvAwNjK0ckPfLLwpUXEWnnkj14NdloKyyfllBQ/JmyBzZMWEOe8MhSy/t2Nzj2z7D5FRWrJPb6robIlw8nVSL9mMR7gFEkOwuAO5U7H8roNVhq3BUD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170008; c=relaxed/simple;
	bh=FbqCU44UbDeLMjzyPzJaS9f973pnQtgvV2R7iee1h3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q5xqC6qLIT28YgmdfIv96EhEOE0VavaQxoOXpZNPtXAd/AY+1T4b8eOWmGqNqf1StGrcopYVmuBiqrB6K8xPb1QOnje62kF5YrI48hdN3YYsILN4K2Pe2siuJMTA7nV/9uPNcide1QJGJEQ2wiu5ih7cICbm4gdhII8w8k/fSdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ykRwGRLj; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=blWFti2tFPKyEyaGfXOc6NvTt/uLRQso2G+suyw4GtU=; b=ykRwGRLjoAFK64oxwV8+/J/SF2
	WdYo2v82JUuGB2qNdnWfisKxszkRcTgRw+lWNRzThvJsnJpFo9MrudRFfq8n8+z7+mQMBnePhyO32
	UnsxCh+YN+xkU+psGOjZE5ef9xGYPyBDa65LKrhU0eTmUDf0SwWMRmfhcfjKOLOZIt6Fo6lOrJtjZ
	73AFfA6sPJciaGw1KT3FJ+wuR29iJXzix1rPlr/cZKWrnqk1uG90a2pULux0T4teZWBUdEcyg8uUe
	KJIFQWYRL7gVpPVF53kTL36qE5ecmq73wp4D1UcbQnhCeUa6C2CGY+c1+vgwCT5dYOlfgc7TNZ+ut
	mkBANM9A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfV0-0000000AqkV-1vLz;
	Fri, 19 Dec 2025 18:46:46 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 19/19] drm/msm: msm_iommu.c: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:38 -0800
Message-ID: <20251219184638.1813181-20-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct or add kernel-doc comments to eliminate all warnings:

Warning: ../drivers/gpu/drm/msm/msm_iommu.c:381 expecting prototype for
 alloc_pt(). Prototype was for msm_iommu_pagetable_alloc_pt() instead
Warning: ../drivers/gpu/drm/msm/msm_iommu.c:426 expecting prototype for
 free_pt(). Prototype was for msm_iommu_pagetable_free_pt() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_iommu.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- linux-next-20251119.orig/drivers/gpu/drm/msm/msm_iommu.c
+++ linux-next-20251119/drivers/gpu/drm/msm/msm_iommu.c
@@ -364,7 +364,7 @@ msm_iommu_pagetable_prealloc_cleanup(str
 }
 
 /**
- * alloc_pt() - Custom page table allocator
+ * msm_iommu_pagetable_alloc_pt() - Custom page table allocator
  * @cookie: Cookie passed at page table allocation time.
  * @size: Size of the page table. This size should be fixed,
  * and determined at creation time based on the granule size.
@@ -416,7 +416,7 @@ msm_iommu_pagetable_alloc_pt(void *cooki
 
 
 /**
- * free_pt() - Custom page table free function
+ * msm_iommu_pagetable_free_pt() - Custom page table free function
  * @cookie: Cookie passed at page table allocation time.
  * @data: Page table to free.
  * @size: Size of the page table. This size should be fixed,

