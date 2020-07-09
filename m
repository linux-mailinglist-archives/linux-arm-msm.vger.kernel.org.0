Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 887402197A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 07:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgGIFCD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 01:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgGIFBo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 01:01:44 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A587EC08C5CE
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 22:01:43 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id j20so494079pfe.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 22:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fL1oj/82czdR0WXUznCgbOV1KIBa6gJW0wdl0Fe8bqk=;
        b=YQWuQBQH2GSEZE8K4EI/Gew9fg1AI6MpHL0uRHUylnIff9sxijznzxDBhh0+EguiC3
         nPQaHnHAyeNKdx99gIzgFq3df+1a/ehZVV2I6ySRKyX3IfkQUfRsGNWC0w/WeiKfU6oi
         yzyYjpbROlG19Zuw4csOp62AY8ifnBblwcGo4ZHdYoUriQ3cGGw8mBKSAk+zOXqPJdFV
         MLjR1dq/Yv3w3bS11+j4uGeq0PZfwU88ItxE5IY5qbW/nMGO90Mk4xQjbm7W6Y8QozWe
         E+KYwEDC4Af+CwQl+dbh/ewI/SNpahBBYVME/IKZnlzjYbjUMqBTFdzzERsOBo1iCZuJ
         p7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fL1oj/82czdR0WXUznCgbOV1KIBa6gJW0wdl0Fe8bqk=;
        b=f3sjLN5pEHth6YBHvbf9pBGp5DrisRv2c5G/G53QBt9iawSesolJX6uberl2psrbuq
         FNl4MQlakd3eyLnf4ShY/QMdJ3w2c+yaST7xmC79hmBG5urhWtM5r0roCMzPjZCyv38Y
         KFd4o1cm8kUp9JXxuvbbAiYVVLoKRm5/gfS4IOX/Cjvxn/JuMhZl8I2NL9v0Dz98cTH7
         5Ynv+LBdjGf4wwGSZXOlQ1K3MD73RV0C5vWHtpIo+HMsbX82FfFEE97STvoDH6ctRi4L
         /yt0fZqJnvuYkcuxO7d15xIcI6c3aKbYdm4A6f88J7bxilnq9r2V9FV5zN6IIAnVESG5
         L3Ng==
X-Gm-Message-State: AOAM5319w5uAoyP34jf1q70UZ5OPFVMKLit0rMTaPPKf+fhDCw6C3Ior
        RkgONx1hsr/jivFOIvLm0e+gtw==
X-Google-Smtp-Source: ABdhPJyCvUhg3Z54pWl5PZR4ipfWmNp9zxcFYtuOj/BIJz3aWWsj8AWlwbK8reSTeGRPCPOiYOhZpQ==
X-Received: by 2002:a05:6a00:807:: with SMTP id m7mr58259929pfk.246.1594270903096;
        Wed, 08 Jul 2020 22:01:43 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h15sm999974pjc.14.2020.07.08.22.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 22:01:42 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/5] iommu/arm-smmu: Emulate bypass by using context banks
Date:   Wed,  8 Jul 2020 22:01:42 -0700
Message-Id: <20200709050145.3520931-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
References: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some firmware found on various Qualcomm platforms traps writes to S2CR
of type BYPASS and writes FAULT into the register. This prevents us from
marking the streams for the display controller as BYPASS to allow
continued scanout of the screen through the initialization of the ARM
SMMU.

This adds a Qualcomm specific cfg_probe function, which probes the
behavior of the S2CR registers and if found faulty enables the related
quirk. Based on this quirk context banks are allocated for IDENTITY
domains as well, but with ARM_SMMU_SCTLR_M omitted.

The result is valid stream mappings, without translation.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/arm-smmu-qcom.c | 21 +++++++++++++++++++++
 drivers/iommu/arm-smmu.c      | 14 ++++++++++++--
 drivers/iommu/arm-smmu.h      |  3 +++
 3 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index cf01d0215a39..e8a36054e912 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -23,6 +23,26 @@ static const struct of_device_id qcom_smmu_client_of_match[] = {
 	{ }
 };
 
+static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
+{
+	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
+	u32 reg;
+
+	/*
+	 * With some firmware writes to S2CR of type FAULT are ignored, and
+	 * writing BYPASS will end up as FAULT in the register. Perform a write
+	 * to S2CR to detect if this is the case with the current firmware.
+	 */
+	arm_smmu_gr0_write(smmu, last_s2cr, FIELD_PREP(ARM_SMMU_S2CR_TYPE, S2CR_TYPE_BYPASS) |
+					    FIELD_PREP(ARM_SMMU_S2CR_CBNDX, 0xff) |
+					    FIELD_PREP(ARM_SMMU_S2CR_PRIVCFG, S2CR_PRIVCFG_DEFAULT));
+	reg = arm_smmu_gr0_read(smmu, last_s2cr);
+	if (FIELD_GET(ARM_SMMU_S2CR_TYPE, reg) != S2CR_TYPE_BYPASS)
+		smmu->qcom_bypass_quirk = true;
+
+	return 0;
+}
+
 static int qcom_smmu_def_domain_type(struct device *dev)
 {
 	const struct of_device_id *match =
@@ -61,6 +81,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
 }
 
 static const struct arm_smmu_impl qcom_smmu_impl = {
+	.cfg_probe = qcom_smmu_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = qcom_smmu500_reset,
 };
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 2e27cf9815ab..f33eda3117fa 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -654,7 +654,9 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 
 	/* SCTLR */
 	reg = ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE | ARM_SMMU_SCTLR_AFE |
-	      ARM_SMMU_SCTLR_TRE | ARM_SMMU_SCTLR_M;
+	      ARM_SMMU_SCTLR_TRE;
+	if (cfg->m)
+		reg |= ARM_SMMU_SCTLR_M;
 	if (stage1)
 		reg |= ARM_SMMU_SCTLR_S1_ASIDPNE;
 	if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
@@ -678,7 +680,11 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	if (smmu_domain->smmu)
 		goto out_unlock;
 
-	if (domain->type == IOMMU_DOMAIN_IDENTITY) {
+	/*
+	 * Nothing to do for IDENTITY domains,unless disabled context banks are
+	 * used to emulate bypass mappings on Qualcomm platforms.
+	 */
+	if (domain->type == IOMMU_DOMAIN_IDENTITY && !smmu->qcom_bypass_quirk) {
 		smmu_domain->stage = ARM_SMMU_DOMAIN_BYPASS;
 		smmu_domain->smmu = smmu;
 		goto out_unlock;
@@ -826,6 +832,10 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 	domain->geometry.aperture_end = (1UL << ias) - 1;
 	domain->geometry.force_aperture = true;
 
+	/* Enable translation for non-identity context banks */
+	if (domain->type != IOMMU_DOMAIN_IDENTITY)
+		cfg->m = true;
+
 	/* Initialise the context bank with our page table cfg */
 	arm_smmu_init_context_bank(smmu_domain, &pgtbl_cfg);
 	arm_smmu_write_context_bank(smmu, cfg->cbndx);
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index d172c024be61..a71d193073e4 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -305,6 +305,8 @@ struct arm_smmu_device {
 
 	/* IOMMU core code handle */
 	struct iommu_device		iommu;
+
+	bool				qcom_bypass_quirk;
 };
 
 enum arm_smmu_context_fmt {
@@ -323,6 +325,7 @@ struct arm_smmu_cfg {
 	};
 	enum arm_smmu_cbar_type		cbar;
 	enum arm_smmu_context_fmt	fmt;
+	bool				m;
 };
 #define ARM_SMMU_INVALID_IRPTNDX	0xff
 
-- 
2.26.2

