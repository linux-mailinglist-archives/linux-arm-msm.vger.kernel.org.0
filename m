Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24D07C01DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2019 11:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726284AbfI0JKA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Sep 2019 05:10:00 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:43540 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbfI0JKA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Sep 2019 05:10:00 -0400
Received: by mail-wr1-f68.google.com with SMTP id q17so1810363wrx.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2019 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OGNly6Vphv4Itb2RkdK4y5BItxcdcc9y36+Z8tgTcg0=;
        b=D1A8whOxqTnPyfllVyOo5GUyHH22JDWdvQC5wS14rOykrm6oXxi/V5GFZltXKFdMHb
         VZnIkAioDjmgJftBRWcCnWqUdKMNSh4H4t+unuF5/f50AjwON9p0X0lKEt8RfMnZlfdK
         ZdgQfAvpsBuBMWGc/ynfvxSjY4RnCFi7S0TdYCa3IWeUpvYnepmdALTIVAI01eiib1Rv
         ofE/IMxfDpbg0+DmXNQR42QeoWONfkMrCtua6SHLyhhgD6CNBNX260oGlbKOYOACVR4w
         FyLNYYVhHiIBRHb1osjLLiigFbuXSmnaS4cnye84eeloC3uOkOhAgxvplY/XS9zi9pLo
         8p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OGNly6Vphv4Itb2RkdK4y5BItxcdcc9y36+Z8tgTcg0=;
        b=rVlQiV8XhCLWO8wT+uoaDNddjUREfhzKsEkAma5VHE4o9DF16pXwmktOl5UKu0h5ax
         M74aFZHUapMhwBByVQSQvJow+DZDaUPCxj3XxGTfotaN9el7QSlKiV1vTipTsRSjkOsO
         0eceewHogoWbE0Qvknf+w04P6g19NIKb9qZo4R+fMP9D1yXxsF44zuteDbwNOPTaOv6l
         SPR81BZm7q4auYECx/zddeVPyVM3mI3Ca5Fd6TdAOzvG3lcvJXYtDquFqKY0b1Hgxs4D
         s9KIkRzXKyXIV9cPGSHnUjLs9f/tXNLNHI3NGDf/NQxbT3G5emqmLCN2ZyPJB10N7isU
         1CYQ==
X-Gm-Message-State: APjAAAXQ80iZBqvsuZWbC2CxpGdjizMcwxBfeUZDh7/ZtAwWCrlbeT2d
        gikksq1qJvGchSLRblQZAwD+LLVrWeI=
X-Google-Smtp-Source: APXvYqyLUk60co2pvzNJ6RPKFw6KfagzRfLG0nZmbQ9wr6rfa33FqxbfqApVgK8/rwVUtrB+sBRw1w==
X-Received: by 2002:a5d:5048:: with SMTP id h8mr2053286wrt.280.1569575395940;
        Fri, 27 Sep 2019 02:09:55 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id b62sm6037791wmc.13.2019.09.27.02.09.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 02:09:55 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, marijns95@gmail.com,
        agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 4/6] iommu/qcom: Add support for AArch64 IOMMU pagetables
Date:   Fri, 27 Sep 2019 11:09:45 +0200
Message-Id: <20190927090947.11175-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190927090947.11175-1-kholk11@gmail.com>
References: <20190927090947.11175-1-kholk11@gmail.com>
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

