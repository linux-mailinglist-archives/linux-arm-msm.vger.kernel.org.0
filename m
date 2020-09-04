Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B07F25DEB6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 17:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgIDP4D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 11:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726937AbgIDPzT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 11:55:19 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CBCC061249
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 08:55:18 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id q5so4503323qkc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 08:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cqOydC4P7PfDdkAhN3VGNKHPJJ431uRaailmt1kgaeU=;
        b=CJgMpx43qvc9byFhCZEm4/SvL1LvLGr9/CsL3bEH8cddixy5T8h5M48QlyKChSENHN
         1Mp4gnVrKUsEcY+Zvd2qjlsVZf5YkEaRHfnHyTzeSSLlrwG/PHrSyTzkQQFCpAsQpUHH
         /ga6s7nNWwtc9MCgLx8cJ7JuWU4DbMfgJn9Mcny+8PrcdQyid92MSarw3ah/r+aWD8y9
         Y2C4R/Mwos3AkmPQRDcED2x0vbj5V8mG5GcXZRDagt429AEGnzV4BNtAdc2oyPy/jYtW
         vmK2oXorZkRIx4xxxPzHCfn9x00d/5y08meh8VAM0QgWNkEs3yCi4wO/QgFASYWDo4sO
         fqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cqOydC4P7PfDdkAhN3VGNKHPJJ431uRaailmt1kgaeU=;
        b=mFYF9a+chUF23vbmVdjJlygZmFhoeWEajHgHUK0cYhDMHBpmCDQVcMUiSfgPxBM/Qb
         /gLbin9foI0eB4xtC1y0hqEKO0EkCgMUP9ydWwCiafZZ3yLW/TIp2sEleWkCKyEWL7+1
         Fg0NCCQPtwTkAZhNuEx1YYRyzDcXFt5ytZ22P4A2JZHeQgjNpZaZRCV8mdYoqNNIK0+H
         MNwxNGD3XbjLpr9e13raIysK/XfOP/n+9w6Om9Fk8EP+k/0rh+/ROdv2TKuSk9ibCRoc
         8TbPonkuLZzz3g2AVAoKP/BlzmaW1TC0JxosPIiYN0KzX54CsVjMlSK9UOyYevE6RStD
         sMPA==
X-Gm-Message-State: AOAM533y/j8Q5IG2cJH8Br4jryD264KmfWOE3kaOF/9RyyaVws5GuQDK
        lMLATHY2OAxX1UaTU2vCJdfAeQ==
X-Google-Smtp-Source: ABdhPJwHcjVR8gvpVo5cc8Zutt5nJd/mELZ/BVmZZWe+VuF+L6dgLXd87rsYat09jN3kKHXviyEKTA==
X-Received: by 2002:a05:620a:211c:: with SMTP id l28mr8189345qkl.395.1599234917217;
        Fri, 04 Sep 2020 08:55:17 -0700 (PDT)
Received: from localhost.localdomain (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id v18sm4724473qtq.15.2020.09.04.08.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:55:16 -0700 (PDT)
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
Subject: [PATCH v3 2/8] iommu/arm-smmu: Delay modifying domain during init
Date:   Fri,  4 Sep 2020 15:55:07 +0000
Message-Id: <20200904155513.282067-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904155513.282067-1-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Delay modifications to the domain during arm_smmu_init_domain_context()
until we've allocated a context bank. This will allow us to postpone the
special handling of identity domains until the platform specific context
bank allocator has been executed, in a later patch.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- New patch to allow us to rely on the impl specific alloc_context_bank().

 drivers/iommu/arm/arm-smmu/arm-smmu.c | 40 +++++++++++++++------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index e19d7bdc7674..add2e1807e21 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -645,6 +645,9 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	irqreturn_t (*context_fault)(int irq, void *dev);
+	struct arm_smmu_cfg new_cfg = *cfg;
+	enum arm_smmu_domain_stage new_stage = smmu_domain->stage;
+	const struct iommu_flush_ops *flush_ops;
 
 	mutex_lock(&smmu_domain->init_mutex);
 	if (smmu_domain->smmu)
@@ -675,9 +678,9 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	 * Note that you can't actually request stage-2 mappings.
 	 */
 	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
-		smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
+		new_stage = ARM_SMMU_DOMAIN_S2;
 	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
-		smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
+		new_stage = ARM_SMMU_DOMAIN_S1;
 
 	/*
 	 * Choosing a suitable context format is even more fiddly. Until we
@@ -688,32 +691,32 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	 * support to be a superset of AArch32 support...
 	 */
 	if (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_L)
-		cfg->fmt = ARM_SMMU_CTX_FMT_AARCH32_L;
+		new_cfg.fmt = ARM_SMMU_CTX_FMT_AARCH32_L;
 	if (IS_ENABLED(CONFIG_IOMMU_IO_PGTABLE_ARMV7S) &&
 	    !IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_ARM_LPAE) &&
 	    (smmu->features & ARM_SMMU_FEAT_FMT_AARCH32_S) &&
-	    (smmu_domain->stage == ARM_SMMU_DOMAIN_S1))
-		cfg->fmt = ARM_SMMU_CTX_FMT_AARCH32_S;
-	if ((IS_ENABLED(CONFIG_64BIT) || cfg->fmt == ARM_SMMU_CTX_FMT_NONE) &&
+	    (new_stage == ARM_SMMU_DOMAIN_S1))
+		new_cfg.fmt = ARM_SMMU_CTX_FMT_AARCH32_S;
+	if ((IS_ENABLED(CONFIG_64BIT) || new_cfg.fmt == ARM_SMMU_CTX_FMT_NONE) &&
 	    (smmu->features & (ARM_SMMU_FEAT_FMT_AARCH64_64K |
 			       ARM_SMMU_FEAT_FMT_AARCH64_16K |
 			       ARM_SMMU_FEAT_FMT_AARCH64_4K)))
-		cfg->fmt = ARM_SMMU_CTX_FMT_AARCH64;
+		new_cfg.fmt = ARM_SMMU_CTX_FMT_AARCH64;
 
-	if (cfg->fmt == ARM_SMMU_CTX_FMT_NONE) {
+	if (new_cfg.fmt == ARM_SMMU_CTX_FMT_NONE) {
 		ret = -EINVAL;
 		goto out_unlock;
 	}
 
-	switch (smmu_domain->stage) {
+	switch (new_stage) {
 	case ARM_SMMU_DOMAIN_S1:
-		cfg->cbar = CBAR_TYPE_S1_TRANS_S2_BYPASS;
+		new_cfg.cbar = CBAR_TYPE_S1_TRANS_S2_BYPASS;
 		start = smmu->num_s2_context_banks;
 		ias = smmu->va_size;
 		oas = smmu->ipa_size;
-		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
+		if (new_cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64) {
 			fmt = ARM_64_LPAE_S1;
-		} else if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
+		} else if (new_cfg.fmt == ARM_SMMU_CTX_FMT_AARCH32_L) {
 			fmt = ARM_32_LPAE_S1;
 			ias = min(ias, 32UL);
 			oas = min(oas, 40UL);
@@ -722,7 +725,7 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 			ias = min(ias, 32UL);
 			oas = min(oas, 32UL);
 		}
-		smmu_domain->flush_ops = &arm_smmu_s1_tlb_ops;
+		flush_ops = &arm_smmu_s1_tlb_ops;
 		break;
 	case ARM_SMMU_DOMAIN_NESTED:
 		/*
@@ -730,11 +733,11 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		 * involved.
 		 */
 	case ARM_SMMU_DOMAIN_S2:
-		cfg->cbar = CBAR_TYPE_S2_TRANS;
+		new_cfg.cbar = CBAR_TYPE_S2_TRANS;
 		start = 0;
 		ias = smmu->ipa_size;
 		oas = smmu->pa_size;
-		if (cfg->fmt == ARM_SMMU_CTX_FMT_AARCH64) {
+		if (new_cfg.fmt == ARM_SMMU_CTX_FMT_AARCH64) {
 			fmt = ARM_64_LPAE_S2;
 		} else {
 			fmt = ARM_32_LPAE_S2;
@@ -742,9 +745,9 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 			oas = min(oas, 40UL);
 		}
 		if (smmu->version == ARM_SMMU_V2)
-			smmu_domain->flush_ops = &arm_smmu_s2_tlb_ops_v2;
+			flush_ops = &arm_smmu_s2_tlb_ops_v2;
 		else
-			smmu_domain->flush_ops = &arm_smmu_s2_tlb_ops_v1;
+			flush_ops = &arm_smmu_s2_tlb_ops_v1;
 		break;
 	default:
 		ret = -EINVAL;
@@ -757,6 +760,9 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	}
 
 	smmu_domain->smmu = smmu;
+	smmu_domain->cfg = new_cfg;
+	smmu_domain->stage = new_stage;
+	smmu_domain->flush_ops = flush_ops;
 
 	cfg->cbndx = ret;
 	if (smmu->version < ARM_SMMU_V2) {
-- 
2.28.0

