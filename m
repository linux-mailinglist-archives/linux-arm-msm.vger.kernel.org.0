Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA72247977
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:02:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729231AbgHQWCN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728131AbgHQWCI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:02:08 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5E4C061389;
        Mon, 17 Aug 2020 15:02:08 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 17so8912917pfw.9;
        Mon, 17 Aug 2020 15:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vh+B4OHEn3CAh3E4JWZmp8fkzNNMb5LEBb6Hamyy8Tc=;
        b=A+ipIHkMF8gSbU2qxbIPkth7Xd5hnDhbG/xfzFxikCp7gozfKEE0WZbczG/SpSUl79
         FEBFCLmpYRVbXcGnjqRsN2O7olp4xmXFBibwC9ZcZM4WdclRCJYO+FleKiTu9TQQNVbI
         oxHxR7ClPcoFyDd7mjFPDDR5GItFaR0/a9XPhhSig/u79nO5hElPlVZpodpbLHeCxQgr
         nBh5i9Pg4xj8IXtxvFQmkdrT6/tavdqVtMdkt0w/NLZCom+KMgKlS27Mg0Fbs2jvIDZf
         lGhKkA95oQ8BoJXS9ZThHkSg4Xbn1pdxab2vCQtmyTlSgnKHgNATJo/sxnJ0VFNeJM/p
         0Tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vh+B4OHEn3CAh3E4JWZmp8fkzNNMb5LEBb6Hamyy8Tc=;
        b=l5mJ7ZWfYNndysbdopuLmfDI09XcDQMPqEVp+JqzY+r2UvoOEU4iHmS6V1v2WmAnyT
         QO5pFoyepoKK3G0ajG78gCnbba+/Gu/OtY5zDWMwLs7Vm7wcYTo7pWAPO9bodvKJDWo1
         byUg1mKUhc71u0teEwn5Ws8wXYvoQY/dVX2ccmnGDuHQZnha+jJfr2SS9GhDjfL238XZ
         auPO1qS88lA//IY/FFaoKO3HIG/wWNpWjpvhzqRCIM1YaVsjK5FsPPnBFCSuQmRpcZXf
         Fv5F2wm5Z2P0O8S7i9ZoSM2ppTXXxyR0zLXd/O5qI+Bj1YuNUariWjSMCZc3cDXu8gQZ
         xOUA==
X-Gm-Message-State: AOAM532tTeMllGoGbmjITx7s0fYXwwxrE0iSwO6vdknCRs28oXL2+Pd2
        HJrhXlxBcclZ5PegDz2dv0g=
X-Google-Smtp-Source: ABdhPJzZqlSB4cxItB1nk6gfLaWEO1yStLDbKWU0wfwm1eTYggskCKQrU9eOBeEV5Yk8vrdW3yx+jA==
X-Received: by 2002:a05:6a00:44:: with SMTP id i4mr13223151pfk.276.1597701727957;
        Mon, 17 Aug 2020 15:02:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id c15sm21041573pfo.115.2020.08.17.15.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 15:02:06 -0700 (PDT)
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
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 02/20] iommu/arm-smmu: Pass io-pgtable config to implementation specific function
Date:   Mon, 17 Aug 2020 15:01:27 -0700
Message-Id: <20200817220238.603465-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
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

