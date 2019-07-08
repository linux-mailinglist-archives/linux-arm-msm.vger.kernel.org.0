Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7076B628DA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2019 21:01:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388975AbfGHTBD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 15:01:03 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43720 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388540AbfGHTBC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 15:01:02 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A606560E59; Mon,  8 Jul 2019 19:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562612460;
        bh=TS0wlrofdZ9G9964YwYXdJXHhjE2yp06YT1ABAcNFQk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EOfcj9vywO46toGM7V32+PozzcFFQcxD5BsQ+50rj45iiPIG3vSjmi8jj5qAkiBHG
         BfTj3C6O2p++4ze9Pphyz5iYXp2fdWsQC8rWS8oJQaN/8QMfgRWutEh3puURIHgjNP
         uMY86n/J7g6GXVIrNTj+i04qEuj1Sz0HxUMsB7W8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C08B960FED;
        Mon,  8 Jul 2019 19:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562612455;
        bh=TS0wlrofdZ9G9964YwYXdJXHhjE2yp06YT1ABAcNFQk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YhHmJh1yBt5fIw/19zSzMoSW2W+iZ7X/ZfmqCGYxCDk5ls9JwX0Gvlkg6iita2DxV
         plmypfwcbb+ZnnHEzh2DYwodJ49NnPBBcBuPzmn3BuhYvurTXk4KdZ4EajZRU7DNIT
         IvBlDrFBZsQ/VNIjlFiFHcdZkiBVwJaA5dBFRo0g=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C08B960FED
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        baolu.lu@linux.intel.com, Will Deacon <will@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v2 2/3] iommu/io-pgtable-arm: Add support for AARCH64 split pagetables
Date:   Mon,  8 Jul 2019 13:00:46 -0600
Message-Id: <1562612447-19856-3-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562612447-19856-1-git-send-email-jcrouse@codeaurora.org>
References: <1562612447-19856-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a new sub-format ARM_64_LPAE_SPLIT_S1 to create and set up split
pagetables (TTBR0 and TTBR1). The initialization function sets up the
correct va_size and sign extension bits and programs the TCR registers.
Split pagetable formats use their own own map/unmap wrappers to ensure
that the correct pagetable is selected based on the incoming iova but
most of the heavy lifting is common to the other formats.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/iommu/io-pgtable-arm.c | 261 +++++++++++++++++++++++++++++++++++++----
 drivers/iommu/io-pgtable.c     |   1 +
 include/linux/io-pgtable.h     |   2 +
 3 files changed, 240 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 161a7d56..aec35e5 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -118,7 +118,12 @@
 #define ARM_LPAE_TCR_TG0_64K		(1 << 14)
 #define ARM_LPAE_TCR_TG0_16K		(2 << 14)
 
+#define ARM_LPAE_TCR_TG1_4K		(0 << 30)
+#define ARM_LPAE_TCR_TG1_64K		(1 << 30)
+#define ARM_LPAE_TCR_TG1_16K		(2 << 30)
+
 #define ARM_LPAE_TCR_SH0_SHIFT		12
+#define ARM_LPAE_TCR_SH1_SHIFT		28
 #define ARM_LPAE_TCR_SH0_MASK		0x3
 #define ARM_LPAE_TCR_SH_NS		0
 #define ARM_LPAE_TCR_SH_OS		2
@@ -126,6 +131,8 @@
 
 #define ARM_LPAE_TCR_ORGN0_SHIFT	10
 #define ARM_LPAE_TCR_IRGN0_SHIFT	8
+#define ARM_LPAE_TCR_ORGN1_SHIFT	26
+#define ARM_LPAE_TCR_IRGN1_SHIFT	24
 #define ARM_LPAE_TCR_RGN_MASK		0x3
 #define ARM_LPAE_TCR_RGN_NC		0
 #define ARM_LPAE_TCR_RGN_WBWA		1
@@ -136,6 +143,7 @@
 #define ARM_LPAE_TCR_SL0_MASK		0x3
 
 #define ARM_LPAE_TCR_T0SZ_SHIFT		0
+#define ARM_LPAE_TCR_T1SZ_SHIFT		16
 #define ARM_LPAE_TCR_SZ_MASK		0xf
 
 #define ARM_LPAE_TCR_PS_SHIFT		16
@@ -152,6 +160,14 @@
 #define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
 #define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
 
+#define ARM_LPAE_TCR_SEP_SHIFT		47
+#define ARM_LPAE_TCR_SEP_31		(0x0ULL << ARM_LPAE_TCR_SEP_SHIFT)
+#define ARM_LPAE_TCR_SEP_35		(0x1ULL << ARM_LPAE_TCR_SEP_SHIFT)
+#define ARM_LPAE_TCR_SEP_39		(0x2ULL << ARM_LPAE_TCR_SEP_SHIFT)
+#define ARM_LPAE_TCR_SEP_41		(0x3ULL << ARM_LPAE_TCR_SEP_SHIFT)
+#define ARM_LPAE_TCR_SEP_43		(0x4ULL << ARM_LPAE_TCR_SEP_SHIFT)
+#define ARM_LPAE_TCR_SEP_UPSTREAM	(0x7ULL << ARM_LPAE_TCR_SEP_SHIFT)
+
 #define ARM_LPAE_MAIR_ATTR_SHIFT(n)	((n) << 3)
 #define ARM_LPAE_MAIR_ATTR_MASK		0xff
 #define ARM_LPAE_MAIR_ATTR_DEVICE	0x04
@@ -179,11 +195,12 @@ struct arm_lpae_io_pgtable {
 	struct io_pgtable	iop;
 
 	int			levels;
+	u32			sep;
 	size_t			pgd_size;
 	unsigned long		pg_shift;
 	unsigned long		bits_per_level;
 
-	void			*pgd;
+	void			*pgd[2];
 };
 
 typedef u64 arm_lpae_iopte;
@@ -426,7 +443,8 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
 	arm_lpae_iopte pte;
 
 	if (data->iop.fmt == ARM_64_LPAE_S1 ||
-	    data->iop.fmt == ARM_32_LPAE_S1) {
+	    data->iop.fmt == ARM_32_LPAE_S1 ||
+	    data->iop.fmt == ARM_64_LPAE_SPLIT_S1) {
 		pte = ARM_LPAE_PTE_nG;
 		if (!(prot & IOMMU_WRITE) && (prot & IOMMU_READ))
 			pte |= ARM_LPAE_PTE_AP_RDONLY;
@@ -470,11 +488,10 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
 	return pte;
 }
 
-static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
-			phys_addr_t paddr, size_t size, int iommu_prot)
+static int _arm_lpae_map(struct arm_lpae_io_pgtable *data, unsigned long iova,
+			phys_addr_t paddr, size_t size, int iommu_prot,
+			arm_lpae_iopte *ptep)
 {
-	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
-	arm_lpae_iopte *ptep = data->pgd;
 	int ret, lvl = ARM_LPAE_START_LVL(data);
 	arm_lpae_iopte prot;
 
@@ -497,12 +514,39 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
 	return ret;
 }
 
+static int arm_lpae_split_map(struct io_pgtable_ops *ops, unsigned long iova,
+		phys_addr_t paddr, size_t size, int iommu_prot)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	unsigned long mask = 1UL << data->sep;
+	arm_lpae_iopte *ptep;
+
+	if (iova & mask) {
+		ptep = data->pgd[1];
+		iova &= (mask - 1);
+	} else
+		ptep = data->pgd[0];
+
+	return _arm_lpae_map(data, iova, paddr, size, iommu_prot, ptep);
+}
+
+static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
+			phys_addr_t paddr, size_t size, int iommu_prot)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+
+	return _arm_lpae_map(data, iova, paddr, size, iommu_prot, data->pgd[0]);
+}
+
 static void __arm_lpae_free_pgtable(struct arm_lpae_io_pgtable *data, int lvl,
 				    arm_lpae_iopte *ptep)
 {
 	arm_lpae_iopte *start, *end;
 	unsigned long table_size;
 
+	if (!ptep)
+		return;
+
 	if (lvl == ARM_LPAE_START_LVL(data))
 		table_size = data->pgd_size;
 	else
@@ -532,7 +576,8 @@ static void arm_lpae_free_pgtable(struct io_pgtable *iop)
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_to_data(iop);
 
-	__arm_lpae_free_pgtable(data, ARM_LPAE_START_LVL(data), data->pgd);
+	__arm_lpae_free_pgtable(data, ARM_LPAE_START_LVL(data), data->pgd[0]);
+	__arm_lpae_free_pgtable(data, ARM_LPAE_START_LVL(data), data->pgd[1]);
 	kfree(data);
 }
 
@@ -643,11 +688,28 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 	return __arm_lpae_unmap(data, iova, size, lvl + 1, ptep);
 }
 
+static size_t arm_lpae_split_unmap(struct io_pgtable_ops *ops,
+				   unsigned long iova, size_t size)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	unsigned long mask = 1UL << data->sep;
+	arm_lpae_iopte *ptep;
+	int lvl = ARM_LPAE_START_LVL(data);
+
+	if (iova & mask) {
+		ptep = data->pgd[1];
+		iova &= (mask - 1);
+	} else
+		ptep = data->pgd[0];
+
+	return __arm_lpae_unmap(data, iova, size, lvl, ptep);
+}
+
 static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
 			     size_t size)
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
-	arm_lpae_iopte *ptep = data->pgd;
+	arm_lpae_iopte *ptep = data->pgd[0];
 	int lvl = ARM_LPAE_START_LVL(data);
 
 	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias)))
@@ -656,11 +718,11 @@ static size_t arm_lpae_unmap(struct io_pgtable_ops *ops, unsigned long iova,
 	return __arm_lpae_unmap(data, iova, size, lvl, ptep);
 }
 
-static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
-					 unsigned long iova)
+static phys_addr_t _arm_lpae_iova_to_phys(struct arm_lpae_io_pgtable *data,
+					  unsigned long iova,
+					  arm_lpae_iopte *ptep)
 {
-	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
-	arm_lpae_iopte pte, *ptep = data->pgd;
+	arm_lpae_iopte pte;
 	int lvl = ARM_LPAE_START_LVL(data);
 
 	do {
@@ -692,6 +754,31 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 	return iopte_to_paddr(pte, data) | iova;
 }
 
+
+static phys_addr_t arm_lpae_split_iova_to_phys(struct io_pgtable_ops *ops,
+					       unsigned long iova)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+	unsigned long mask = 1UL << data->sep;
+	arm_lpae_iopte *ptep;
+
+	if (iova & mask) {
+		ptep = data->pgd[1];
+		iova &= (mask - 1);
+	} else
+		ptep = data->pgd[0];
+
+	return _arm_lpae_iova_to_phys(data, iova, ptep);
+}
+
+static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
+					 unsigned long iova)
+{
+	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
+
+	return _arm_lpae_iova_to_phys(data, iova, data->pgd[0]);
+}
+
 static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
 {
 	unsigned long granule, page_sizes;
@@ -771,6 +858,9 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	pgd_bits = va_bits - (data->bits_per_level * (data->levels - 1));
 	data->pgd_size = 1UL << (pgd_bits + ilog2(sizeof(arm_lpae_iopte)));
 
+	data->pgd[0] = NULL;
+	data->pgd[1] = NULL;
+
 	data->iop.ops = (struct io_pgtable_ops) {
 		.map		= arm_lpae_map,
 		.unmap		= arm_lpae_unmap,
@@ -780,8 +870,8 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	return data;
 }
 
-static struct io_pgtable *
-arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
+static struct arm_lpae_io_pgtable *
+_arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg)
 {
 	u64 reg;
 	struct arm_lpae_io_pgtable *data;
@@ -845,8 +935,6 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 
 	reg |= (64ULL - cfg->ias) << ARM_LPAE_TCR_T0SZ_SHIFT;
 
-	/* Disable speculative walks through TTBR1 */
-	reg |= ARM_LPAE_TCR_EPD1;
 	cfg->arm_lpae_s1_cfg.tcr = reg;
 
 	/* MAIRs */
@@ -863,24 +951,143 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	cfg->arm_lpae_s1_cfg.mair[1] = 0;
 
 	/* Looking good; allocate a pgd */
-	data->pgd = __arm_lpae_alloc_pages(data->pgd_size, GFP_KERNEL, cfg);
-	if (!data->pgd)
+	data->pgd[0] = __arm_lpae_alloc_pages(data->pgd_size, GFP_KERNEL, cfg);
+	if (!data->pgd[0])
 		goto out_free_data;
 
 	/* Ensure the empty pgd is visible before any actual TTBR write */
 	wmb();
 
 	/* TTBRs */
-	cfg->arm_lpae_s1_cfg.ttbr[0] = virt_to_phys(data->pgd);
+	cfg->arm_lpae_s1_cfg.ttbr[0] = virt_to_phys(data->pgd[0]);
 	cfg->arm_lpae_s1_cfg.ttbr[1] = 0;
+	return data;
+
+out_free_data:
+	kfree(data);
+	return NULL;
+}
+
+
+/* Allocate split pagetables */
+static struct io_pgtable *
+arm_64_lpae_alloc_pgtable_split_s1(struct io_pgtable_cfg *cfg, void *cookie)
+{
+	u64 reg;
+	struct arm_lpae_io_pgtable *data;
+	u32 sep;
+
+	/* Figure out what the sign extension bit should be */
+	switch (cfg->ias) {
+	case 32:
+	case 36:
+	case 40:
+	case 42:
+	case 44:
+		sep = cfg->ias - 1;
+		/* Adjust the address size to account for the extension bit */
+		cfg->ias--;
+		break;
+	case 48:
+		/* IAS of 48 is a special case, it has a dedicated bit */
+		sep = 48;
+		break;
+	default:
+		return NULL;
+	}
+
+	data = _arm_64_lpae_alloc_pgtable_s1(cfg);
+	if (!data)
+		return NULL;
+
+	/* Add the TTBR1 settings */
+	reg = cfg->arm_lpae_s1_cfg.tcr;
+
+	/* TCR */
+	reg |= (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH1_SHIFT) |
+	      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN1_SHIFT) |
+	      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN1_SHIFT);
+
+	switch (ARM_LPAE_GRANULE(data)) {
+	case SZ_4K:
+		reg |= ARM_LPAE_TCR_TG1_4K;
+		break;
+	case SZ_16K:
+		reg |= ARM_LPAE_TCR_TG1_16K;
+		break;
+	case SZ_64K:
+		reg |= ARM_LPAE_TCR_TG1_64K;
+		break;
+	}
+
+	reg |= (64ULL - cfg->ias) << ARM_LPAE_TCR_T1SZ_SHIFT;
+
+	switch (sep) {
+	case 31:
+		reg |= ARM_LPAE_TCR_SEP_31;
+		break;
+	case 35:
+		reg |= ARM_LPAE_TCR_SEP_35;
+		break;
+	case 39:
+		reg |= ARM_LPAE_TCR_SEP_39;
+		break;
+	case 41:
+		reg |= ARM_LPAE_TCR_SEP_41;
+		break;
+	case 43:
+		reg |= ARM_LPAE_TCR_SEP_43;
+		break;
+	case 48:
+		reg |= ARM_LPAE_TCR_SEP_UPSTREAM;
+		break;
+	}
+
+	cfg->arm_lpae_s1_cfg.tcr = reg;
+
+	/* Allocate the TTBR1 pagetable */
+	data->pgd[1] = __arm_lpae_alloc_pages(data->pgd_size, GFP_KERNEL, cfg);
+	if (!data->pgd[1])
+		goto out_free_data;
+
+	/* Override the data ops with split table specific ops */
+	data->iop.ops = (struct io_pgtable_ops) {
+		.map		= arm_lpae_split_map,
+		.unmap		= arm_lpae_split_unmap,
+		.iova_to_phys	= arm_lpae_split_iova_to_phys,
+	};
+
+	/*
+	 * remember the sign extension bit, we'll need it later to figure out
+	 * which pagetable to use
+	 */
+	data->sep = sep;
+
+	/* Ensure the empty pgd is visible before any actual TTBR write */
+	wmb();
+
+	cfg->arm_lpae_s1_cfg.ttbr[1] = virt_to_phys(data->pgd[1]);
 	return &data->iop;
 
 out_free_data:
+	__arm_lpae_free_pages(data->pgd[0], data->pgd_size, cfg);
 	kfree(data);
 	return NULL;
 }
 
 static struct io_pgtable *
+arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
+{
+	struct arm_lpae_io_pgtable *data;
+
+	data = _arm_64_lpae_alloc_pgtable_s1(cfg);
+	if (!data)
+		return NULL;
+
+	return &data->iop;
+}
+
+static struct io_pgtable *
 arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 {
 	u64 reg, sl;
@@ -960,15 +1167,15 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	cfg->arm_lpae_s2_cfg.vtcr = reg;
 
 	/* Allocate pgd pages */
-	data->pgd = __arm_lpae_alloc_pages(data->pgd_size, GFP_KERNEL, cfg);
-	if (!data->pgd)
+	data->pgd[0] = __arm_lpae_alloc_pages(data->pgd_size, GFP_KERNEL, cfg);
+	if (!data->pgd[0])
 		goto out_free_data;
 
 	/* Ensure the empty pgd is visible before any actual TTBR write */
 	wmb();
 
 	/* VTTBR */
-	cfg->arm_lpae_s2_cfg.vttbr = virt_to_phys(data->pgd);
+	cfg->arm_lpae_s2_cfg.vttbr = virt_to_phys(data->pgd[0]);
 	return &data->iop;
 
 out_free_data:
@@ -1041,6 +1248,11 @@ struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s1_init_fns = {
 	.free	= arm_lpae_free_pgtable,
 };
 
+struct io_pgtable_init_fns io_pgtable_arm_64_lpae_split_s1_init_fns = {
+	.alloc	= arm_64_lpae_alloc_pgtable_split_s1,
+	.free	= arm_lpae_free_pgtable,
+};
+
 struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s2_init_fns = {
 	.alloc	= arm_64_lpae_alloc_pgtable_s2,
 	.free	= arm_lpae_free_pgtable,
@@ -1095,9 +1307,9 @@ static void __init arm_lpae_dump_ops(struct io_pgtable_ops *ops)
 
 	pr_err("cfg: pgsize_bitmap 0x%lx, ias %u-bit\n",
 		cfg->pgsize_bitmap, cfg->ias);
-	pr_err("data: %d levels, 0x%zx pgd_size, %lu pg_shift, %lu bits_per_level, pgd @ %p\n",
+	pr_err("data: %d levels, 0x%zx pgd_size, %lu pg_shift, %lu bits_per_level, pgd @ %p %p\n",
 		data->levels, data->pgd_size, data->pg_shift,
-		data->bits_per_level, data->pgd);
+		data->bits_per_level, data->pgd[0], data->pgd[1]);
 }
 
 #define __FAIL(ops, i)	({						\
@@ -1112,6 +1324,7 @@ static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
 	static const enum io_pgtable_fmt fmts[] = {
 		ARM_64_LPAE_S1,
 		ARM_64_LPAE_S2,
+		ARM_64_LPAE_SPLIT_S1,
 	};
 
 	int i, j;
diff --git a/drivers/iommu/io-pgtable.c b/drivers/iommu/io-pgtable.c
index ced53e5..ed1985f 100644
--- a/drivers/iommu/io-pgtable.c
+++ b/drivers/iommu/io-pgtable.c
@@ -20,6 +20,7 @@ io_pgtable_init_table[IO_PGTABLE_NUM_FMTS] = {
 	[ARM_64_LPAE_S1] = &io_pgtable_arm_64_lpae_s1_init_fns,
 	[ARM_64_LPAE_S2] = &io_pgtable_arm_64_lpae_s2_init_fns,
 	[ARM_MALI_LPAE] = &io_pgtable_arm_mali_lpae_init_fns,
+	[ARM_64_LPAE_SPLIT_S1] = &io_pgtable_arm_64_lpae_split_s1_init_fns,
 #endif
 #ifdef CONFIG_IOMMU_IO_PGTABLE_ARMV7S
 	[ARM_V7S] = &io_pgtable_arm_v7s_init_fns,
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index b5a450a..2ed0e6a 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -10,6 +10,7 @@ enum io_pgtable_fmt {
 	ARM_32_LPAE_S1,
 	ARM_32_LPAE_S2,
 	ARM_64_LPAE_S1,
+	ARM_64_LPAE_SPLIT_S1,
 	ARM_64_LPAE_S2,
 	ARM_V7S,
 	ARM_MALI_LPAE,
@@ -211,6 +212,7 @@ extern struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s1_init_fns;
 extern struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s2_init_fns;
 extern struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s1_init_fns;
 extern struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s2_init_fns;
+extern struct io_pgtable_init_fns io_pgtable_arm_64_lpae_split_s1_init_fns;
 extern struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns;
 extern struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns;
 
-- 
2.7.4

