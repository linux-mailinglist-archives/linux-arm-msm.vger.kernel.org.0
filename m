Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8866125DEB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 17:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgIDP4E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 11:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbgIDPzR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 11:55:17 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB6FEC061245
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 08:55:16 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id e5so4956254qth.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 08:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gCgPYkIuen689JCGS9C+yWcxF9Wf5xvuT4fGLsIR6s4=;
        b=f327XpYNWc6l2rv9RF9YVwix3cQ2zUGItQvb76pIc9b0ZZkAec70KgXCmFe1JTlQPX
         H7KHWTKF4ebNKtJJmF+TbCugfIYbU2jdqDcwNT+/YNzahtv31duzVXAfMO+ObDXFwd4P
         NJ5GqDhX/siqbOaqP7g3+ksdGLNPEWZWR0vlJkfD9LmXJcMQbYIk12lmuxQGqDhU7/Ru
         LxHMs6d/rjNQ0a8rObQ1GjEBRFMA5GiRpv4/MQnxJWg66Oe7gn0saucFFtw97AyPcssA
         UqaSTYkqvvnVF+4ciJRWw3mDV3o3GWfTbonqPO/r1cRQVtr3SAYaixzOl3psh9evNe5u
         e5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gCgPYkIuen689JCGS9C+yWcxF9Wf5xvuT4fGLsIR6s4=;
        b=VKq11yV2EFoDHTh0q9NF+ExHL/QTcW3BfVln1D0js+SdLBtK7ByM9I3++56Sw3bnMi
         XSDOXI8B+aPGeXgM3KcRlE/ucy/hm3t8S+IO7HVfWYwi81W2Tibc8rBvEbsTGxQB1hW5
         gRjip3ExoKqyn4Kz3j18ztoxFb+2FnVGK97ABUHotuznCWjaoQFV9p7KOwdEarU3/O7C
         pbY+StubtwgeWl4Pnc58+BIK+pk5p8h4j2tm1oT8ZL4UaWmiy+oSpPr6gp82rf9l7x/e
         s1lJJSes+kMFqAJNiBvPGacAGo90mlj/Ji1IgBZjJfhdq0yEk31ohePM6YY1uuM7QCKT
         NiVw==
X-Gm-Message-State: AOAM532gLhH2nMyHgZ33KHjpila9fFvIa6mCTzGRv/81q5UHuwCgtmR0
        4jtDkFeOotdc5KqdHZgJMZ5z4A==
X-Google-Smtp-Source: ABdhPJwQAqxRfEZO2Wpzgm/mVc29sreI4hBEc/PRL/deVoZlJprAw461csvwoALQd2PBInXlQ29TIQ==
X-Received: by 2002:ac8:3933:: with SMTP id s48mr9112374qtb.294.1599234916004;
        Fri, 04 Sep 2020 08:55:16 -0700 (PDT)
Received: from localhost.localdomain (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id v18sm4724473qtq.15.2020.09.04.08.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:55:15 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/8] iommu/arm-smmu: Refactor context bank allocation
Date:   Fri,  4 Sep 2020 15:55:06 +0000
Message-Id: <20200904155513.282067-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904155513.282067-1-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Extract the conditional invocation of the platform defined
alloc_context_bank() to a separate function to keep
arm_smmu_init_domain_context() cleaner.

Instead pass a reference to the arm_smmu_device as parameter to the
call. Also remove the count parameter, as this can be read from the
newly passed object.

This allows us to not assign smmu_domain->smmu before attempting to
allocate the context bank and as such we don't need to roll back this
assignment on failure.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Note that this series applies ontop of:
https://lore.kernel.org/linux-arm-msm/20200901164707.2645413-1-robdclark@gmail.com/

This could either go on its own, or be squashed with "[PATCH v16 14/20]
iommu/arm-smmu: Prepare for the adreno-smmu implementation" from Rob's series.

Changes since v2:
- New patch

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  6 ++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 23 ++++++++++++----------
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  3 ++-
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 2aa6249050ff..0663d7d26908 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -91,9 +91,10 @@ static int qcom_adreno_smmu_set_ttbr0_cfg(const void *cookie,
 }
 
 static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
-		struct device *dev, int start, int count)
+					       struct arm_smmu_device *smmu,
+					       struct device *dev, int start)
 {
-	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	int count;
 
 	/*
 	 * Assign context bank 0 to the GPU device so the GPU hardware can
@@ -104,6 +105,7 @@ static int qcom_adreno_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_doma
 		count = 1;
 	} else {
 		start = 1;
+		count = smmu->num_context_banks;
 	}
 
 	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index bbec5793faf8..e19d7bdc7674 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -623,6 +623,16 @@ void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	arm_smmu_cb_write(smmu, idx, ARM_SMMU_CB_SCTLR, reg);
 }
 
+static int arm_smmu_alloc_context_bank(struct arm_smmu_domain *smmu_domain,
+				       struct arm_smmu_device *smmu,
+				       struct device *dev, unsigned int start)
+{
+	if (smmu->impl && smmu->impl->alloc_context_bank)
+		return smmu->impl->alloc_context_bank(smmu_domain, smmu, dev, start);
+
+	return __arm_smmu_alloc_bitmap(smmu->context_map, start, smmu->num_context_banks);
+}
+
 static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 					struct arm_smmu_device *smmu,
 					struct device *dev)
@@ -741,20 +751,13 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		goto out_unlock;
 	}
 
-	smmu_domain->smmu = smmu;
-
-	if (smmu->impl && smmu->impl->alloc_context_bank)
-		ret = smmu->impl->alloc_context_bank(smmu_domain, dev,
-				start, smmu->num_context_banks);
-	else
-		ret = __arm_smmu_alloc_bitmap(smmu->context_map, start,
-				      smmu->num_context_banks);
-
+	ret = arm_smmu_alloc_context_bank(smmu_domain, smmu, dev, start);
 	if (ret < 0) {
-		smmu_domain->smmu = NULL;
 		goto out_unlock;
 	}
 
+	smmu_domain->smmu = smmu;
+
 	cfg->cbndx = ret;
 	if (smmu->version < ARM_SMMU_V2) {
 		cfg->irptndx = atomic_inc_return(&smmu->irptndx);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 2df3a70a8a41..ddf2ca4c923d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -437,7 +437,8 @@ struct arm_smmu_impl {
 	irqreturn_t (*global_fault)(int irq, void *dev);
 	irqreturn_t (*context_fault)(int irq, void *dev);
 	int (*alloc_context_bank)(struct arm_smmu_domain *smmu_domain,
-			struct device *dev, int start, int max);
+				  struct arm_smmu_device *smmu,
+				  struct device *dev, int start);
 };
 
 #define INVALID_SMENDX			-1
-- 
2.28.0

