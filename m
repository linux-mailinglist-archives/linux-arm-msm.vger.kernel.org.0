Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 867DB2555A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 18:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729192AbfEUQPT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 12:15:19 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33944 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729183AbfEUQPS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 12:15:18 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 45B2361AA8; Tue, 21 May 2019 16:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455317;
        bh=wBZB+LFIv8r0uTFu6MNzs2A3S+65mKQ9oZ1KI8mimLg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EmO2nzJYN/YE0JhEauyANunkbwX1fl35tXCZJDrYKWmQ9QDJhAZlIiYpLc+Iq0zoG
         hiEyEqmBoiaiJD9+/4hnr/Bi+Y10REqadjEs4U7z/1qaivKki53gsm6EUlfR7eTBZX
         KjHqz6MCFl1i5b9lmcCxVFy6zqYSfhk6ULqjzDYg=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B1A0961A86;
        Tue, 21 May 2019 16:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558455269;
        bh=wBZB+LFIv8r0uTFu6MNzs2A3S+65mKQ9oZ1KI8mimLg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ek7yM0JTN7/EroFyqpNnwY+9yO09i01GBdDvXdsoRObaxi723hceSPWLOpHNhW90G
         sEGFubvEg2b0OX8da5+gnHGWnS2oPmnO5ZNHJUxNLjvxd6aF/KRB5n1vqNPa3aBY0Q
         0sNpQi/FUSSBCuPsIOCwkTu0DCN2+v5GB1+aeHPg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B1A0961A86
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
        hoegsberg@google.com, dianders@chromium.org,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 13/15] drm/msm: Add support for IOMMU auxiliary domains
Date:   Tue, 21 May 2019 10:14:01 -0600
Message-Id: <1558455243-32746-14-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
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

 drivers/gpu/drm/msm/msm_iommu.c | 97 +++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mmu.h   |  4 ++
 2 files changed, 101 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
index 1926329..adf9f18 100644
--- a/drivers/gpu/drm/msm/msm_iommu.c
+++ b/drivers/gpu/drm/msm/msm_iommu.c
@@ -21,9 +21,21 @@
 struct msm_iommu {
 	struct msm_mmu base;
 	struct iommu_domain *domain;
+	u64 ttbr;
+	u32 asid;
 };
 #define to_msm_iommu(x) container_of(x, struct msm_iommu, base)
 
+/*
+ * The asid is currently unused for arm-smmu-v2 since all the pagetable
+ * switching does a TLBIALL but still assign a somewhat unique number per
+ * instance to leave open the possibility of being smarter about it
+ *
+ * Accepted range is 32 to 255 (starting at 32 gives a cushion for the asids
+ * assigned to the real context banks in the arm-smmu driver.
+ */
+static int msm_iommu_asid = 32;
+
 static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 		unsigned long iova, int flags, void *arg)
 {
@@ -34,6 +46,47 @@ static int msm_fault_handler(struct iommu_domain *domain, struct device *dev,
 	return 0;
 }
 
+static int msm_iommu_aux_attach(struct msm_mmu *mmu, const char * const *names,
+			    int cnt)
+{
+	struct msm_iommu *iommu = to_msm_iommu(mmu);
+	int ret;
+
+	/* Attach the aux device */
+	ret = iommu_aux_attach_device(iommu->domain, mmu->dev);
+	if (ret)
+		return ret;
+
+	/* Get the base address of the pagetable */
+	ret = iommu_domain_get_attr(iommu->domain, DOMAIN_ATTR_PTBASE,
+		&iommu->ttbr);
+	if (ret)
+		return ret;
+
+	/*
+	 * Assign an asid for the instance even though the code doesn't
+	 * currently support per-asid TLB invalidation. There isn't any
+	 * protection on this so two instances could in theory end up with the
+	 * same ASID but that would have very minor performance implications if
+	 * per-ASID TLB invalidation were to be enabled in the future
+	 */
+	iommu->asid = msm_iommu_asid++;
+
+	if (msm_iommu_asid > 0xff)
+		msm_iommu_asid = 32;
+
+	return 0;
+}
+
+static void msm_iommu_aux_detach(struct msm_mmu *mmu, const char * const *names,
+			     int cnt)
+{
+	struct msm_iommu *iommu = to_msm_iommu(mmu);
+
+	iommu->ttbr = 0;
+	iommu->asid = 0;
+}
+
 static int msm_iommu_attach(struct msm_mmu *mmu, const char * const *names,
 			    int cnt)
 {
@@ -86,6 +139,50 @@ static const struct msm_mmu_funcs funcs = {
 		.destroy = msm_iommu_destroy,
 };
 
+static const struct msm_mmu_funcs aux_funcs = {
+		.attach = msm_iommu_aux_attach,
+		.detach = msm_iommu_aux_detach,
+		.map = msm_iommu_map,
+		.unmap = msm_iommu_unmap,
+		.destroy = msm_iommu_destroy,
+};
+
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
+
+struct msm_mmu *msm_iommu_new_instance(struct device *dev)
+{
+	struct msm_iommu *iommu;
+
+	iommu = kzalloc(sizeof(*iommu), GFP_KERNEL);
+	if (!iommu)
+		return ERR_PTR(-ENOMEM);
+
+	/* Create a new domain that will be attached as an aux domain */
+	iommu->domain = iommu_domain_alloc(&platform_bus_type);
+	if (!iommu->domain) {
+		kfree(iommu);
+		return ERR_PTR(-ENOMEM);
+	}
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
index d21b266..f430903 100644
--- a/drivers/gpu/drm/msm/msm_mmu.h
+++ b/drivers/gpu/drm/msm/msm_mmu.h
@@ -46,6 +46,10 @@ static inline void msm_mmu_init(struct msm_mmu *mmu, struct device *dev,
 struct msm_mmu *msm_iommu_new(struct device *dev, struct iommu_domain *domain);
 struct msm_mmu *msm_gpummu_new(struct device *dev, struct msm_gpu *gpu);
 
+struct msm_mmu *msm_iommu_new_instance(struct device *dev);
+
+bool msm_iommu_get_ptinfo(struct msm_mmu *mmu, u64 *ttbr, u32 *asid);
+
 static inline void msm_mmu_set_fault_handler(struct msm_mmu *mmu, void *arg,
 		int (*handler)(void *arg, unsigned long iova, int flags))
 {
-- 
2.7.4

