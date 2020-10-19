Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5D9292D78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 20:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbgJSSW7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 14:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730710AbgJSSWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 14:22:49 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A73CDC0613D0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 11:22:47 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id h62so525325oth.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y5fNqoL1fwVXzRoGLdhjgGjKn0H5ZhfiH9MEwllD/6E=;
        b=OTz9mUw0OYOkF+/xpWHYVhItGhBW6akviDkDx1yCTgro7wI2gTIkIonv6xdt4B4uuw
         gslPeIfjwSYj39iPXBJZAhq9tJruKkYVR5wwfJV1IzfXuat2vAQGzRQw+D94UU/BHXrt
         anK2LjGHLKW1i17ayHJh3wwgG8K8VTsZwP4vzNvCKrQwXq/2cHt8ldkIqSgXz4P8lOTp
         20q8teCg7ioBGrKxxo24rhD/R02SS7Tj5vr4kJAFoS6HvIHKZ0fLjCD7BIPN2eph2BB+
         zHL3pVc+idQf+fYjuc+FLxmnc9JvxuLOMQw6u8U2BR4TevDJnbKT7Gduugq+W1ZYotXV
         P6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y5fNqoL1fwVXzRoGLdhjgGjKn0H5ZhfiH9MEwllD/6E=;
        b=E7jbYyD6gSDZAHxLkplu6FUHFIo0Rb1fLWymFqxoNCF9sqkw2qNyPpIsXOtoOcEDEn
         vm6VtzuAiW0MjUOkKjGQ/9NIGB1xs1epF+/iinJhPZNUtHzRbfDMMLHReXegzXUqJ0U4
         7qfDjPWGAnov+wUehFpJql22zglC/UjqYAkAUnJHrVTyWh+W02VEQ1J1Omj/KiRwoN0l
         8kSFXTC3UiIrYzh0K//UINC0Bk6CenS/uXxXfYiv7GeA08T3YJAvf4IB2ZDo07jbFvxE
         QiCDxjpI0ENo5O+ylWT7I83p1e9UzjwpLM2Pjj8CINsRvSEhZFD8bUZ/k1M0Ppn3lv1J
         n+RQ==
X-Gm-Message-State: AOAM5332ZAHyYpfw2sTela3IifPzvHKUYCKFTWurYaV3mF2Rf5CJzm8/
        L/O5jsBFL/dz0va1V3MfnmtIQ6GsjWN+UA==
X-Google-Smtp-Source: ABdhPJz3wQQ65x7rCRGuRiOD/lEinJpwbkX3sUptNu3HmaIQTCVTBlcQfpdKY5yqjTfNAFucQx80DQ==
X-Received: by 2002:a05:6830:19fd:: with SMTP id t29mr868207ott.307.1603131767028;
        Mon, 19 Oct 2020 11:22:47 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o8sm175296oog.47.2020.10.19.11.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 11:22:46 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        Rob Clark <robdclark@chromium.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 2/3] iommu/arm-smmu-qcom: Read back stream mappings
Date:   Mon, 19 Oct 2020 11:23:22 -0700
Message-Id: <20201019182323.3162386-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
References: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm boot loader configures stream mapping for the peripherals
that it accesses and in particular it sets up the stream mapping for the
display controller to be allowed to scan out a splash screen or EFI
framebuffer.

Read back the stream mappings during initialization and make the
arm-smmu driver maintain the streams in bypass mode.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Don't increment s2cr[i]->count, as this is not actually needed to survive
  probe deferral

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index be4318044f96..48627fcf6bed 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -23,6 +23,28 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ }
 };
 
+static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
+{
+	u32 smr;
+	int i;
+
+	for (i = 0; i < smmu->num_mapping_groups; i++) {
+		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
+
+		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
+			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
+			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
+			smmu->smrs[i].valid = true;
+
+			smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
+			smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
+			smmu->s2crs[i].cbndx = 0xff;
+		}
+	}
+
+	return 0;
+}
+
 static int qcom_smmu_def_domain_type(struct device *dev)
 {
 	const struct of_device_id *match =
@@ -61,6 +83,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
 }
 
 static const struct arm_smmu_impl qcom_smmu_impl = {
+	.cfg_probe = qcom_smmu_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = qcom_smmu500_reset,
 };
-- 
2.28.0

