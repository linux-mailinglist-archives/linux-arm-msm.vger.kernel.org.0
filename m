Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4B2226AD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 18:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731264AbgGTPvp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 11:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731269AbgGTPvo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 11:51:44 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F04C061794;
        Mon, 20 Jul 2020 08:51:44 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t6so10476115pgq.1;
        Mon, 20 Jul 2020 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J3DxpFDz2en6MDVSIDSJcw1EYyuDLb4b/ATPWNGpNV8=;
        b=JZT0n3IZ2gmQ8fpJFxdKTwqEWfpNF++ce0QdDWhdVdxr95qPcbh12WKSRwbsQLeSSF
         vAT5atm2XlURTCu3d+jZSJCMxlZNyPAOO2j0kNv8yW0UOfJDr+zQQBgzZ5CeDlnY3Ptf
         jGJTd5Xt11Y0jEMIIqDZPJk75Bpb4IrrNV36FiMwXtJiUQS50pxXu7P39aIG2aiRlvHN
         KEqVgJcjiVJlsd5cNwVYM1g45AHN/FEGXcd+gixlyZTmyGViSl/DU97wDlm14vYG9Nxu
         1BZbiZ1wHE+1mNtgl3942CsfrPTStdowCFujfvelJCYljzBDFDIojreFa2jBdiMik/eM
         p3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J3DxpFDz2en6MDVSIDSJcw1EYyuDLb4b/ATPWNGpNV8=;
        b=tflvJnxs75RY/E1GpiS4mF8rzXvrboKZhZ+ual84JV7mngo9R4d1i9WT/cHgokeHWq
         hz/0yydOhhYMF5O+B6+EjRPlaCm5YincXWFlwTSdRnphFTyghunxAID6e0hKz5Ohvfmk
         I70wUStpgRqFQ0AfTziOV8+rucrnuvPN5U4ljYbebzwOUP1UL5eQNbUzpItZ1x2SbKke
         OrMxtiQM5Nc4eRvJmj7YdrIxRvheoq2eh9Y+YdNO1hPbNN3lhzhiJUnkeD5wwInn/WjR
         01k3q99CECG3NPrlW+e+0rRu2Re6j55/9UIdH2AnkKOCeWjwKXoFHeVJ8dXG2Wfw9KKe
         mcAQ==
X-Gm-Message-State: AOAM532Vw1vtzUEpcqy4iuZJjq45RZA7jGIshIQTXyqYbrXV0NOHjScR
        2LqSpJwRPUt84zbFzSXSdDE=
X-Google-Smtp-Source: ABdhPJzC1AV8b2NC4pIEODxLLgIgLr/0Kx8Shaq9WssLYQ8JPbaXLtX5iMiXFAjy+mcm9+SNoW4n6Q==
X-Received: by 2002:aa7:9570:: with SMTP id x16mr21351591pfq.124.1595260304185;
        Mon, 20 Jul 2020 08:51:44 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id z9sm15604146pgh.94.2020.07.20.08.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 08:51:42 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org
Cc:     linux-arm-msm@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iommu/qcom: Use domain rather than dev as tlb cookie
Date:   Mon, 20 Jul 2020 08:52:17 -0700
Message-Id: <20200720155217.274994-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The device may be torn down, but the domain should still be valid.  Lets
use that as the tlb flush ops cookie.

Fixes a problem reported in [1]

[1] https://lkml.org/lkml/2020/7/20/104

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
Note I don't have a good setup to test this atm, but I think it should
work.

 drivers/iommu/qcom_iommu.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index c3e1fbd1988c..d176df569af8 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -65,6 +65,7 @@ struct qcom_iommu_domain {
 	struct mutex		 init_mutex; /* Protects iommu pointer */
 	struct iommu_domain	 domain;
 	struct qcom_iommu_dev	*iommu;
+	struct iommu_fwspec	*fwspec;
 };
 
 static struct qcom_iommu_domain *to_qcom_iommu_domain(struct iommu_domain *dom)
@@ -84,9 +85,9 @@ static struct qcom_iommu_dev * to_iommu(struct device *dev)
 	return dev_iommu_priv_get(dev);
 }
 
-static struct qcom_iommu_ctx * to_ctx(struct device *dev, unsigned asid)
+static struct qcom_iommu_ctx * to_ctx(struct qcom_iommu_domain *d, unsigned asid)
 {
-	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
+	struct qcom_iommu_dev *qcom_iommu = d->iommu;
 	if (!qcom_iommu)
 		return NULL;
 	return qcom_iommu->ctxs[asid - 1];
@@ -118,14 +119,12 @@ iommu_readq(struct qcom_iommu_ctx *ctx, unsigned reg)
 
 static void qcom_iommu_tlb_sync(void *cookie)
 {
-	struct iommu_fwspec *fwspec;
-	struct device *dev = cookie;
+	struct qcom_iommu_domain *qcom_domain = cookie;
+	struct iommu_fwspec *fwspec = qcom_domain->fwspec;
 	unsigned i;
 
-	fwspec = dev_iommu_fwspec_get(dev);
-
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
 		unsigned int val, ret;
 
 		iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
@@ -139,14 +138,12 @@ static void qcom_iommu_tlb_sync(void *cookie)
 
 static void qcom_iommu_tlb_inv_context(void *cookie)
 {
-	struct device *dev = cookie;
-	struct iommu_fwspec *fwspec;
+	struct qcom_iommu_domain *qcom_domain = cookie;
+	struct iommu_fwspec *fwspec = qcom_domain->fwspec;
 	unsigned i;
 
-	fwspec = dev_iommu_fwspec_get(dev);
-
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
 		iommu_writel(ctx, ARM_SMMU_CB_S1_TLBIASID, ctx->asid);
 	}
 
@@ -156,16 +153,14 @@ static void qcom_iommu_tlb_inv_context(void *cookie)
 static void qcom_iommu_tlb_inv_range_nosync(unsigned long iova, size_t size,
 					    size_t granule, bool leaf, void *cookie)
 {
-	struct device *dev = cookie;
-	struct iommu_fwspec *fwspec;
+	struct qcom_iommu_domain *qcom_domain = cookie;
+	struct iommu_fwspec *fwspec = qcom_domain->fwspec;
 	unsigned i, reg;
 
 	reg = leaf ? ARM_SMMU_CB_S1_TLBIVAL : ARM_SMMU_CB_S1_TLBIVA;
 
-	fwspec = dev_iommu_fwspec_get(dev);
-
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
 		size_t s = size;
 
 		iova = (iova >> 12) << 12;
@@ -256,7 +251,9 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	};
 
 	qcom_domain->iommu = qcom_iommu;
-	pgtbl_ops = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &pgtbl_cfg, dev);
+	qcom_domain->fwspec = fwspec;
+
+	pgtbl_ops = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &pgtbl_cfg, qcom_domain);
 	if (!pgtbl_ops) {
 		dev_err(qcom_iommu->dev, "failed to allocate pagetable ops\n");
 		ret = -ENOMEM;
@@ -269,7 +266,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	domain->geometry.force_aperture = true;
 
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
 
 		if (!ctx->secure_init) {
 			ret = qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, ctx->asid);
@@ -419,7 +416,7 @@ static void qcom_iommu_detach_dev(struct iommu_domain *domain, struct device *de
 
 	pm_runtime_get_sync(qcom_iommu->dev);
 	for (i = 0; i < fwspec->num_ids; i++) {
-		struct qcom_iommu_ctx *ctx = to_ctx(dev, fwspec->ids[i]);
+		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
 
 		/* Disable the context bank: */
 		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
-- 
2.26.2

