Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02320BF278
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 14:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbfIZMFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 08:05:25 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:52839 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfIZMFZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 08:05:25 -0400
Received: by mail-wm1-f67.google.com with SMTP id r19so2457991wmh.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 05:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sU9LGzm25m7VZZPogRsBDM2tG6wZORjJNn8G8mv06GY=;
        b=bPlmIWMqsfl8ZAfuh/aBXpi4hC3cut+/yLP89KvOzHf684MaN+wxWn8M32T84p2d0B
         AJPv9VYmjdLUkDZ1f0HXVxfYN7cvSFc7RrTeUe3PT3txnxlR8mXMp/mSj++lfrsCCUP7
         xau/PPshZu+J5ulERk1ZbX23zXb8hrWa3qOViqeNS0pNt4vgZ0P5Gls1TT5FWVMYKnH6
         eiXKQ4xaAdAzbjZokq1b1fgMLwJGSSRc1qtcpIyuQerBqBD+vXwTJOCJD6rxq+QZtUOo
         jNpA+Sopnq51T3GY2Oh5raJHQfSG8rD5K2ZfdYvqc06XEIMn0ndRl9wryMwKw+57oMNi
         H5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sU9LGzm25m7VZZPogRsBDM2tG6wZORjJNn8G8mv06GY=;
        b=PFMmpgzMlUQN4U9O92EF+mWI2q4Df5PHAKcqtN9LO2YNvURE4Tli0Xl6r1bP2SrHCh
         AAlfxzR9oZG6AYvlk/GkjZ1sXYCOejqUNzA+baSDFZUpuapaS5qU6Y7FGGszixscAERh
         l3DRburB0qmbne2OjrBByDg2xiiVeSz1aCcKwMNNKNGxhB3Kgy1WRKTOm46quwtX1H2E
         HenbC4WaGKmKLmf1MIJTAwcluinYXlPzat+Dz88edVw+VvP3nXsv2n+MuTZ1GfLI9bGp
         oVcBX9QaLW+201zppIgIOTx701JK3b5xk4QN6T21QcPjE4RlqujF5djJTJNxoYqh+x/p
         /NUg==
X-Gm-Message-State: APjAAAVSnLzjVT1XvBROdRG8ka1437yeqNC7Rke5L1LVyiId2Dbimxo3
        952SO2KgvzKcrnfMIk/aDVx3UKG6s0U=
X-Google-Smtp-Source: APXvYqxVWTrsRb8oFVbw1gZHNMoT+7W7CEoKwY9OUqlbc2si7VSoXCsLKQwqF3gHNLg2GCh9t9rpxQ==
X-Received: by 2002:a1c:2d11:: with SMTP id t17mr2787148wmt.147.1569499522699;
        Thu, 26 Sep 2019 05:05:22 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id d193sm5289584wmd.0.2019.09.26.05.05.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 05:05:22 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, marijns95@gmail.com,
        agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 4/6] iommu/qcom: Add support for AArch64 IOMMU pagetables
Date:   Thu, 26 Sep 2019 14:05:14 +0200
Message-Id: <20190926120516.4981-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926120516.4981-1-kholk11@gmail.com>
References: <20190926120516.4981-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Some IOMMUs associated with some TZ firmwares may support switching
to the AArch64 pagetable format by sending a "set pagetable format"
scm command indicating the IOMMU secure ID and the context number
to switch.

Add a DT property "qcom,use-aarch64-pagetables" for this driver to
send this command to the secure world and to switch the pagetable
format to benefit of the ARM64 IOMMU pagetables, where possible.

Note that, even though the command should be valid to switch each
context, the property is made global because:
1. It doesn't make too much sense to switch only one or two
   context(s) to AA64 instead of just the entire thing
2. Some IOMMUs will go crazy and produce spectacular results when
   trying to mix up the pagetables on a per-context basis.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/iommu/qcom,iommu.txt  |  2 +
 drivers/iommu/qcom_iommu.c                    | 55 +++++++++++++++----
 2 files changed, 47 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
index 98102b323196..a4dd76b8c566 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
@@ -39,6 +39,8 @@ to non-secure vs secure interrupt line.
   - reg            : Base address and size of context bank within the iommu
   - interrupts     : The context fault irq.
   - qcom,ctx-num   : The number associated to the context bank
+  - qcom,use-aarch64-pagetables : Switch to AArch64 pagetable format on all
+                                  contexts declared in this IOMMU
 
 ** Optional properties:
 
diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 2f31da2e7add..233ef496af27 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -48,6 +48,7 @@ struct qcom_iommu_dev {
 	void __iomem		*local_base;
 	u32			 sec_id;
 	u8			 num_ctxs;
+	bool			 use_aarch64_pt;
 	struct qcom_iommu_ctx	*ctxs[0];   /* indexed by asid-1 */
 };
 
@@ -153,11 +154,17 @@ static void qcom_iommu_tlb_inv_range_nosync(unsigned long iova, size_t size,
 	reg = leaf ? ARM_SMMU_CB_S1_TLBIVAL : ARM_SMMU_CB_S1_TLBIVA;
 
 	for (i = 0; i < fwspec->num_ids; i++) {
+		struct qcom_iommu_dev *qcom_iommu = to_iommu(fwspec);
 		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
 		size_t s = size;
 
-		iova &= ~12UL;
-		iova |= ctx->asid;
+		if (qcom_iommu->use_aarch64_pt) {
+			iova >>= 12;
+			iova |= (u64)ctx->asid << 48;
+		} else {
+			iova &= ~12UL;
+			iova |= ctx->asid;
+		}
 		do {
 			iommu_writel(ctx, reg, iova);
 			iova += granule;
@@ -222,6 +229,8 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
 	struct io_pgtable_ops *pgtbl_ops;
 	struct io_pgtable_cfg pgtbl_cfg;
+	enum io_pgtable_fmt pgtbl_fmt;
+	unsigned long ias, oas;
 	int i, ret = 0;
 	u32 reg;
 
@@ -229,16 +238,25 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	if (qcom_domain->iommu)
 		goto out_unlock;
 
+	if (qcom_iommu->use_aarch64_pt) {
+		pgtbl_fmt = ARM_64_LPAE_S1;
+		ias = oas = 48;
+	} else {
+		pgtbl_fmt = ARM_32_LPAE_S1;
+		ias = 32;
+		oas = 40;
+	}
+
 	pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= qcom_iommu_ops.pgsize_bitmap,
-		.ias		= 32,
-		.oas		= 40,
+		.ias		= ias,
+		.oas		= oas,
 		.tlb		= &qcom_gather_ops,
 		.iommu_dev	= qcom_iommu->dev,
 	};
 
 	qcom_domain->iommu = qcom_iommu;
-	pgtbl_ops = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &pgtbl_cfg, fwspec);
+	pgtbl_ops = alloc_io_pgtable_ops(pgtbl_fmt, &pgtbl_cfg, fwspec);
 	if (!pgtbl_ops) {
 		dev_err(qcom_iommu->dev, "failed to allocate pagetable ops\n");
 		ret = -ENOMEM;
@@ -252,6 +270,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 
 	for (i = 0; i < fwspec->num_ids; i++) {
 		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
+		u32 tcr[2];
 
 		if (!ctx->secure_init) {
 			ret = qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, ctx->asid);
@@ -264,12 +283,25 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 
 		qcom_iommu_reset_ctx(ctx);
 
+		tcr[0] = pgtbl_cfg.arm_lpae_s1_cfg.tcr;
+		tcr[1] = pgtbl_cfg.arm_lpae_s1_cfg.tcr >> 32;
+		tcr[1] |= FIELD_PREP(TCR2_SEP, TCR2_SEP_UPSTREAM);
+
+		if (qcom_iommu->use_aarch64_pt) {
+			/* This shall not fail, or spectacular things happen */
+			if (qcom_scm_iommu_set_pt_format(qcom_iommu->sec_id,
+							 ctx->asid, 1)) {
+				dev_warn(qcom_iommu->dev,
+					 "Cannot set AArch64 pt format\n");
+				goto out_clear_iommu;
+			}
+
+			tcr[1] |= TCR2_AS;
+		}
+
 		/* TCR */
-		iommu_writel(ctx, ARM_SMMU_CB_TCR2,
-				(pgtbl_cfg.arm_lpae_s1_cfg.tcr >> 32) |
-				FIELD_PREP(TCR2_SEP, TCR2_SEP_UPSTREAM));
-		iommu_writel(ctx, ARM_SMMU_CB_TCR,
-				pgtbl_cfg.arm_lpae_s1_cfg.tcr);
+		iommu_writel(ctx, ARM_SMMU_CB_TCR2, tcr[1]);
+		iommu_writel(ctx, ARM_SMMU_CB_TCR, tcr[0]);
 
 		/* TTBRs */
 		iommu_writeq(ctx, ARM_SMMU_CB_TTBR0,
@@ -844,6 +876,9 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (of_property_read_bool(dev->of_node, "qcom,use-aarch64-pagetables"))
+		qcom_iommu->use_aarch64_pt = true;
+
 	if (qcom_iommu_has_secure_context(qcom_iommu)) {
 		ret = qcom_iommu_sec_ptbl_init(dev);
 		if (ret) {
-- 
2.21.0

