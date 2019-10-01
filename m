Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C250BC4361
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 00:02:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728595AbfJAWCQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 18:02:16 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35251 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727701AbfJAWCQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 18:02:16 -0400
Received: by mail-wr1-f67.google.com with SMTP id v8so17312088wrt.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 15:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZWSfHME9EykpkSiHCNCJB/NwhqPlKPFe6uMd6py2CPE=;
        b=fxDetqauz2qVab6Zd8VXL+wVSRJbcMNO0D3eOA1NzypHpQwyToC6/4I9k3EfuUkeIX
         r82wKjOX3m8xkYCyxk2Qhtwxlh4A8CsoLvuEDMvctksM94719BzY6M2bLlG6xV5q9YsZ
         lNIvFqwWd+SHRsT8vjv1rGhR5Qg1W/FmZj2X1lDdLH8whDcNqF6zz/RdaJbP8JBVMeHz
         +XpbfWIrgCASC3+/6jyAmePSLWikS1Sph2cUlD7Yv9a1pObF1EFXCGMhqavGj5MMe4XS
         GZLpbBDkEm9oCxuSoisg7NGWS6+UFA+fsP1vBk1WLPF2swpTlZFFxOTkE6Ov6ty23BOP
         w32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZWSfHME9EykpkSiHCNCJB/NwhqPlKPFe6uMd6py2CPE=;
        b=ML/ykcvZY50c6cHEGy8MYfeMLrUnv48EhIQy7IPOViCqUmQs4S8rWpDUTV3xKGomqj
         r8xASr/FO4ZImbRpu0jHnzk3xdjZo+V6YkGgF3vmo6v6z7ZFmaqfu4WrQt4F61ratjw/
         REtxDLV+qlduT6exGmOt9jvqX2m9gqEqyn88stcpwPWAkb3KgJzSCMusyYTBDNRnd+2g
         ItnkFJFm5Ove3bbK6NozTAL2Jz5pVqzPw3pwQrUog3Fo88IG1MtVRWnIBmXjaJSsMEUB
         ZMoWD1uja3bOhKYmaF1NKKT9Mq29cMD0Z8YV1N0Z4Aoo+noWwSr8lVE83V5g+wAOzsx7
         xxqg==
X-Gm-Message-State: APjAAAVQe9Qh5n0BCeU/4TdYi4YtY8BUkbItwht1beiQKmdiXPQYBKx0
        vdXhZpnyJKpUHgysL1vgSOeft0OeWCN7rg==
X-Google-Smtp-Source: APXvYqyiIg92FfVfzsrEl4WLpXrMJyEXKmp4ILR9KQGQ1MRZiH6cppKHE4JOqji2Lzvdids5LbCA0Q==
X-Received: by 2002:a5d:4ac6:: with SMTP id y6mr3797938wrs.102.1569967333528;
        Tue, 01 Oct 2019 15:02:13 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id v16sm21811219wrt.12.2019.10.01.15.02.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 15:02:12 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v4 5/7] iommu/qcom: Add support for AArch64 IOMMU pagetables
Date:   Wed,  2 Oct 2019 00:02:03 +0200
Message-Id: <20191001220205.6423-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001220205.6423-1-kholk11@gmail.com>
References: <20191001220205.6423-1-kholk11@gmail.com>
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
index ba0b77889f02..72ae0595efff 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
@@ -47,6 +47,8 @@ to non-secure vs secure interrupt line.
                      secure lines.  (Ie. if the iommu contains secure
                      context banks)
 - qcom,ctx-num     : The number associated to the context bank
+- qcom,use-aarch64-pagetables : Switch to AArch64 pagetable format on all
+                                contexts declared in this IOMMU
 
 
 ** Examples:
diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index b4a38ef129e3..dac77dbec0f0 100644
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
 
-		iova = (iova >> 12) << 12;
-		iova |= ctx->asid;
+		if (qcom_iommu->use_aarch64_pt) {
+			iova >>= 12;
+			iova |= (u64)ctx->asid << 48;
+		} else {
+			iova = (iova >> 12) << 12;
+			iova |= ctx->asid;
+		}
 		do {
 			iommu_writel(ctx, reg, iova);
 			iova += granule;
@@ -244,6 +251,8 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	struct qcom_iommu_domain *qcom_domain = to_qcom_iommu_domain(domain);
 	struct io_pgtable_ops *pgtbl_ops;
 	struct io_pgtable_cfg pgtbl_cfg;
+	enum io_pgtable_fmt pgtbl_fmt;
+	unsigned long ias, oas;
 	int i, ret = 0;
 	u32 reg;
 
@@ -251,16 +260,25 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
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
 		.tlb		= &qcom_flush_ops,
 		.iommu_dev	= qcom_iommu->dev,
 	};
 
 	qcom_domain->iommu = qcom_iommu;
-	pgtbl_ops = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &pgtbl_cfg, fwspec);
+	pgtbl_ops = alloc_io_pgtable_ops(pgtbl_fmt, &pgtbl_cfg, fwspec);
 	if (!pgtbl_ops) {
 		dev_err(qcom_iommu->dev, "failed to allocate pagetable ops\n");
 		ret = -ENOMEM;
@@ -274,6 +292,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 
 	for (i = 0; i < fwspec->num_ids; i++) {
 		struct qcom_iommu_ctx *ctx = to_ctx(fwspec, fwspec->ids[i]);
+		u32 tcr[2];
 
 		if (!ctx->secure_init) {
 			ret = qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, ctx->asid);
@@ -286,12 +305,25 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 
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
@@ -869,6 +901,9 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
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

