Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6915BEDCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2019 02:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729805AbfD3Aa7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Apr 2019 20:30:59 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:46578 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729736AbfD3Aar (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Apr 2019 20:30:47 -0400
Received: by mail-ed1-f68.google.com with SMTP id d1so10700504edd.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Apr 2019 17:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bg64VLgrTHAQ2Ab/C2XohrmQD4QDVl67cM2UuLtB85g=;
        b=f6Dp2aF+AQ2hfyBUZOzQ9edOxLejBdxd/d+b7vmqJ49AgMwsKZABDAtX4n3BleHhY+
         yDoeSC56zJ4xqp8WwxoRHIVQCkeiYfrCBQMSci6oelyr6fE0Lxs0O2Bfu8C5O3//cyfW
         FahgFQY4fx7Y/ERsB8hoeS/g64DgSgOTyLq1WTRGkuW0h7JXDUG/BFwXvO0uuBDX7s6y
         PpYgBn56Afv9tWBxVCojRLm6p8ArrZYR1o3PGbBJM0Wsd0pAIZfvdrhpdFQogvZPz+83
         /6PciPxd3GquaTmQJzpQQKtCKileeL7KNFoF+uAoWLYtmsdD/ovc9pU4MAhCdxlhOOOK
         M3Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bg64VLgrTHAQ2Ab/C2XohrmQD4QDVl67cM2UuLtB85g=;
        b=OXeRN7DulR5+NSzr2txOK290NEfjj//EpXtRMPeltQPC//dFSuYWRT1BPFOG0kk9so
         t3BoqGe3EoEAlixf2MPyiUM95z/IYFTTsudNtM+j9HRx5rPwSOZmdqj2xbeQfUCLWrt4
         KN0XtGoEXIJBz4wCanfQyp7Bqq08oxpnAhBcpqTb79i571zntSSCpe5aBT/zhLIs/3Sw
         90vNAGnUAWWGHsb6haNdoQ6jml+RM69hb48GW7fqrVpsCb5QI5ZTLtxJmy0S9UV4O6mC
         AV3drPIYrZwZKwSBJ0IMI+DhJZqzjpqQlHXNS9IdzNfgTUoafdXs6A7X6iyRP1UKEeJr
         11VQ==
X-Gm-Message-State: APjAAAW0RbkfZbnrPPVPJT8sJK/2EJtRLLaFDvLcRq3D16Jg1EasFzoi
        O009nU9Q9FZJSdTZc0Eel/z2zQ==
X-Google-Smtp-Source: APXvYqz3Lqa3h5r+dpiSHfG6YXNtigFNvVeESo//k0DzDB7K9XCGt1gkvxldGzMttuBBJ9hJJgQ25A==
X-Received: by 2002:a17:906:d20a:: with SMTP id w10mr13322035ejz.219.1556584245430;
        Mon, 29 Apr 2019 17:30:45 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:a0:bc00:7d76:7b66:68:3b5f])
        by smtp.gmail.com with ESMTPSA id a9sm9424163edt.93.2019.04.29.17.30.44
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 17:30:44 -0700 (PDT)
From:   Tom Murphy <tmurphy@arista.com>
To:     iommu@lists.linux-foundation.org
Cc:     murphyt7@tcd.ie, Tom Murphy <tmurphy@arista.com>,
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
Subject: [PATCH v2 2/4] iommu/dma-iommu: Handle deferred devices
Date:   Tue, 30 Apr 2019 01:29:49 +0100
Message-Id: <20190430002952.18909-3-tmurphy@arista.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430002952.18909-1-tmurphy@arista.com>
References: <20190430002952.18909-1-tmurphy@arista.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Handle devices which defer their attach to the iommu in the dma-iommu api

Signed-off-by: Tom Murphy <tmurphy@arista.com>
---
 drivers/iommu/dma-iommu.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7a96c2c8f56b..c18f74ad1e8b 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -322,6 +322,17 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 	return iova_reserve_iommu_regions(dev, domain);
 }
 
+static int handle_deferred_device(struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	const struct iommu_ops *ops = domain->ops;
+
+	if (ops->is_attach_deferred && ops->is_attach_deferred(domain, dev))
+		return iommu_attach_device(domain, dev);
+
+	return 0;
+}
+
 /**
  * dma_info_to_prot - Translate DMA API directions and attributes to IOMMU API
  *                    page flags.
@@ -835,6 +846,8 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 	bool coherent = dev_is_dma_coherent(dev);
 	dma_addr_t dma_handle;
 
+	handle_deferred_device(dev);
+
 	dma_handle =__iommu_dma_map(dev, phys, size,
 			dma_info_to_prot(dir, coherent, attrs),
 			iommu_get_dma_domain(dev));
@@ -849,6 +862,8 @@ static void iommu_dma_unmap_page(struct device *dev, dma_addr_t dma_handle,
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 
+	handle_deferred_device(dev);
+
 	if (!dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_SKIP_CPU_SYNC)) {
 		phys_addr_t phys = iommu_iova_to_phys(domain, dma_handle);
 
@@ -873,6 +888,8 @@ static int __finalise_sg(struct device *dev, struct scatterlist *sg, int nents,
 	unsigned int cur_len = 0, max_len = dma_get_max_seg_size(dev);
 	int i, count = 0;
 
+	handle_deferred_device(dev);
+
 	for_each_sg(sg, s, nents, i) {
 		/* Restore this segment's original unaligned fields first */
 		unsigned int s_iova_off = sg_dma_address(s);
@@ -1022,6 +1039,8 @@ static void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
 	struct scatterlist *tmp;
 	int i;
 
+	handle_deferred_device(dev);
+
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) == 0)
 		iommu_dma_sync_sg_for_cpu(dev, sg, nents, dir);
 
@@ -1042,6 +1061,8 @@ static void iommu_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
 static dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
+	handle_deferred_device(dev);
+
 	return __iommu_dma_map(dev, phys, size,
 			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO,
 			iommu_get_dma_domain(dev));
@@ -1050,12 +1071,15 @@ static dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
 static void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
+	handle_deferred_device(dev);
+
 	__iommu_dma_unmap(iommu_get_dma_domain(dev), handle, size);
 }
 
 static void *iommu_dma_alloc(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
+	handle_deferred_device(dev);
 	gfp |= __GFP_ZERO;
 
 #ifdef CONFIG_DMA_DIRECT_REMAP
@@ -1076,6 +1100,8 @@ static void iommu_dma_free(struct device *dev, size_t size, void *cpu_addr,
 {
 	struct page *page;
 
+	handle_deferred_device(dev);
+
 	/*
 	 * cpu_addr can be one of 4 things depending on how it was allocated:
 	 *
@@ -1115,6 +1141,8 @@ static int iommu_dma_mmap(struct device *dev, struct vm_area_struct *vma,
 	unsigned long pfn;
 	int ret;
 
+	handle_deferred_device(dev);
+
 	vma->vm_page_prot = arch_dma_mmap_pgprot(dev, vma->vm_page_prot, attrs);
 
 	if (dma_mmap_from_dev_coherent(dev, vma, cpu_addr, size, &ret))
@@ -1143,6 +1171,8 @@ static int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
 	struct page *page;
 	int ret;
 
+	handle_deferred_device(dev);
+
 #ifdef CONFIG_DMA_DIRECT_REMAP
 	if (is_vmalloc_addr(cpu_addr)) {
 		if (!(attrs & DMA_ATTR_FORCE_CONTIGUOUS))
-- 
2.17.1

