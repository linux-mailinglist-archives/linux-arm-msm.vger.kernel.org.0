Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1220E244335
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 04:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgHNCk6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 22:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbgHNCk5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 22:40:57 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9487C061757;
        Thu, 13 Aug 2020 19:40:57 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ep8so3700148pjb.3;
        Thu, 13 Aug 2020 19:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vh+B4OHEn3CAh3E4JWZmp8fkzNNMb5LEBb6Hamyy8Tc=;
        b=b1Nn+BeMMREhr/xsqOUt71SjYE8YipMwszKzo5jG3bFHT41NMAEGv87PqJbvzBoTzy
         6b/cLlgDD5/5PW4ST6p5hm24g1aSt/zJL6vWBbZ4VvsIGASZVOdL8XN84BQeoBqDbNeM
         BQrGnxlONVmRT69y8o2Z/umv8giNT7tSsxCwohfWaw0fKUb2EDbisY42eWD5fIfZTqQn
         gMNc4fUN1Elxy0nAISiKJJ9d/MoVTUzcDB1ANoP4tY/wsoX0Kl9CJOfc+UE97ihyapnT
         e5MvFj0a94BRJPyfPhU3upK2h65RSJ6aYJKa645c6g9k7d9qcwJ8/s6kwE9YCAiqVaLL
         h93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vh+B4OHEn3CAh3E4JWZmp8fkzNNMb5LEBb6Hamyy8Tc=;
        b=cc8JEDFKVA7ZWbJrLdIEKT9xFLhwScMesFpl2Mk2CgjLGkkrxvVLwhZ9sidiI9ysxi
         ceBT0TDIORscfp/FzCYReBadOnofanY1kNtjQNhQ08YeamHTxDgmUcYPybp9me8XJ5Y+
         8D2BVCdv92q8bCdLvl7Vo1s2A7g+nIjRjZI7i/wBhbV+ZtSiZnyXEsByOhz0/nj9U/sj
         W2Obb9xFen+jSvUo4xEwKNzmUx/xlLwPsvVrNrIxDdyNcEby9DPOasEsz15PDXpjEla5
         F4Ye6RmHxtPldNTayrC8qDUzEzI+qGKuQrS2ddtWCd2EFwJXYMRVbbfizQKtvhasGeNo
         /eQg==
X-Gm-Message-State: AOAM531OJXicGTfmaXCqecdh7OecIUG2OqqYvYf/TKrtm5PgklRvUAly
        t+ZpsCBENGfgVdXc5EGGb3M=
X-Google-Smtp-Source: ABdhPJyhhKdUyI/chNSsrpl7lcoB1vpSmNbVdbKkkayGFGLTS9vBb0ca0GN0/ePIemLJruAF+TIhWA==
X-Received: by 2002:a17:902:a404:: with SMTP id p4mr577375plq.35.1597372857314;
        Thu, 13 Aug 2020 19:40:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id n18sm6397759pgd.91.2020.08.13.19.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 19:40:55 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 02/19] iommu/arm-smmu: Pass io-pgtable config to implementation specific function
Date:   Thu, 13 Aug 2020 19:40:57 -0700
Message-Id: <20200814024114.1177553-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jordan Crouse <jcrouse@codeaurora.org>

Construct the io-pgtable config before calling the implementation specific
init_context function and pass it so the implementation specific function
can get a chance to change it before the io-pgtable is created.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  3 ++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 11 ++++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  3 ++-
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index f4ff124a1967..a9861dcd0884 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -68,7 +68,8 @@ static int cavium_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static int cavium_init_context(struct arm_smmu_domain *smmu_domain)
+static int cavium_init_context(struct arm_smmu_domain *smmu_domain,
+		struct io_pgtable_cfg *pgtbl_cfg)
 {
 	struct cavium_smmu *cs = container_of(smmu_domain->smmu,
 					      struct cavium_smmu, smmu);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 09c42af9f31e..37d8d49299b4 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -795,11 +795,6 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		cfg->asid = cfg->cbndx;
 
 	smmu_domain->smmu = smmu;
-	if (smmu->impl && smmu->impl->init_context) {
-		ret = smmu->impl->init_context(smmu_domain);
-		if (ret)
-			goto out_unlock;
-	}
 
 	pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= smmu->pgsize_bitmap,
@@ -810,6 +805,12 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		.iommu_dev	= smmu->dev,
 	};
 
+	if (smmu->impl && smmu->impl->init_context) {
+		ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg);
+		if (ret)
+			goto out_clear_smmu;
+	}
+
 	if (smmu_domain->non_strict)
 		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index d890a4a968e8..83294516ac08 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -386,7 +386,8 @@ struct arm_smmu_impl {
 			    u64 val);
 	int (*cfg_probe)(struct arm_smmu_device *smmu);
 	int (*reset)(struct arm_smmu_device *smmu);
-	int (*init_context)(struct arm_smmu_domain *smmu_domain);
+	int (*init_context)(struct arm_smmu_domain *smmu_domain,
+			struct io_pgtable_cfg *cfg);
 	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
 			 int status);
 	int (*def_domain_type)(struct device *dev);
-- 
2.26.2

