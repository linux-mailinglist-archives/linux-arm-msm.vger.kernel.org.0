Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 895AD14C2D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 23:16:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgA1WQ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 17:16:27 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:27282 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726437AbgA1WQ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 17:16:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580249785; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=GpI+mTVrUBvTTsjKcw+tKygwnL3f9JdTCVmD4fbxwzA=; b=oAlubNf5+da601/EyOT5lkeexVxA8Brw/6PFvxUiBg4n/O/EgmOR1quk1vatRPtia6bKNsNy
 bW5hzfhZXmVlxh4pc1G4OLRokha8MvxFaG5hiHPd1dFVQcSIBaExDjF/lNpTUWTxuTZxsAMb
 z+L9dhA4vToEH2ZmOVpNQzK2x1c=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e30b2b6.7f1a43dd1a08-smtp-out-n03;
 Tue, 28 Jan 2020 22:16:22 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7D5C2C433CB; Tue, 28 Jan 2020 22:16:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 17571C4479F;
        Tue, 28 Jan 2020 22:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 17571C4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     iommu@lists.linux-foundation.org
Cc:     robin.murphy@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v1 3/6] drm/msm/adreno: ADd support for IOMMU auxiliary domains
Date:   Tue, 28 Jan 2020 15:16:07 -0700
Message-Id: <1580249770-1088-4-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
References: <1580249770-1088-1-git-send-email-jcrouse@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for creating a auxiliary domain from the IOMMU device to
implement per-instance pagetables. Also add a helper function to
return the pagetable base address (ttbr) and asid to the caller so
that the GPU target code can set up the pagetable switch.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/msm_iommu.c | 72 +++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h   |  3 ++
 2 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index e773ef8..df0d70a 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -7,9 +7,17 @@
 #include "msm_drv.h"
 #include "msm_mmu.h"
 
+/*
+ * It is up to us to assign ASIDS for our instances. Start at 32 to give a
+ * cushion to account for ASIDS assigned to real context banks
+ */
+static int msm_iommu_asid = 32;
+
 struct msm_iommu {
 	struct msm_mmu base;
 	struct iommu_domain *domain;
+	u64 ttbr;
+	int asid;
 };
 #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
 
@@ -58,6 +66,20 @@ static void msm_iommu_destroy(struct msm_mmu *mmu)
 	kfree(iommu);
 }
 
+static void msm_iommu_aux_detach(struct msm_mmu *mmu)
+{
+	struct msm_iommu *iommu = to_msm_iommu(mmu);
+
+	iommu_aux_detach_device(iommu->domain, mmu->dev);
+}
+
+static const struct msm_mmu_funcs aux_funcs = {
+		.detach = msm_iommu_aux_detach,
+		.map = msm_iommu_map,
+		.unmap = msm_iommu_unmap,
+		.destroy = msm_iommu_destroy,
+};
+
 static const struct msm_mmu_funcs funcs = {
 		.detach = msm_iommu_detach,
 		.map = msm_iommu_map,
@@ -65,6 +87,56 @@ static const struct msm_mmu_funcs funcs = {
 		.destroy = msm_iommu_destroy,
 };
 
+bool msm_iommu_get_ptinfo(struct msm_mmu *mmu, u64 *ttbr, u32 *asid)
+{
+	struct msm_iommu *iommu = to_msm_iommu(mmu);
+
+	if (!iommu->ttbr)
+		return false;
+
+	if (ttbr)
+		*ttbr = iommu->ttbr;
+	if (asid)
+		*asid = iommu->asid;
+
+	return true;
+}
+
+struct msm_mmu *msm_iommu_new_instance(struct device *dev,
+		struct iommu_domain *domain)
+{
+	struct msm_iommu *iommu;
+	u64 ptbase;
+	int ret;
+
+	ret = iommu_aux_attach_device(domain, dev);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = iommu_domain_get_attr(domain, DOMAIN_ATTR_PTBASE, &ptbase);
+	if (ret) {
+		iommu_aux_detach_device(domain, dev);
+		return ERR_PTR(ret);
+	}
+
+	iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
+	if (!iommu) {
+		iommu_aux_detach_device(domain, dev);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	iommu->domain = domain;
+	iommu->ttbr = ptbase;
+	iommu->asid = msm_iommu_asid++;
+
+	if (msm_iommu_asid > 0xff)
+		msm_iommu_asid = 32;
+
+	msm_mmu_init(&iommu->base, dev, &aux_funcs);
+
+	return &iommu->base;
+}
+
 struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain)
 {
 	struct msm_iommu *iommu;
diff --git a/drivers/gpu/drm/msm/msm_mmu.h b/drivers/gpu/drm/msm/msm_mmu.h
index bae9e8e..65a5cb2 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -32,6 +32,9 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 }
 
 struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
+struct msm_mmu *msm_iommu_new_instance(struct device *dev,
+		struct iommu_domain *domain);
+bool msm_iommu_get_ptinfo(struct msm_mmu *mmu, u64 *ttbr, u32 *asid);
 struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
 
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
-- 
2.7.4
