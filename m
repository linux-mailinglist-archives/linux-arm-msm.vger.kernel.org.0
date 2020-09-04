Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C171025DEB0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 17:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbgIDPzt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 11:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgIDPz0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 11:55:26 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3504C061262
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 08:55:23 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id f11so3243602qvw.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 08:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I9v8itQxrG/5qOmlIkuGPstFjTonnbsCxHmLWx5pBPk=;
        b=fH/8s/VsjUJd9NSfQnY9KSqjr01isFkiTOEHv966Pm+qJr0SntP+xw7DkVPurY+FVA
         TGhOoJlnm9Ues2qE+3G7rkDWz7QaZWbR3ioFcET9S2eEFANNMRSLMlEwWT+67pEu3h/J
         gtFEX/W6HDjTk/bNacLk+NKv/yYQfcg4gHrZ8cvLLQd7heB4VMYFsmq5HuYBHzojcJzM
         jvbXrNuQYord9V5/QeTX2bg15dsqvN7uIXH2fypYBVmveFk3IlBSq5h0rr0SsYd92wbL
         r3AXp+pONiHH4M+LMJeGIBSd2WYLFWvUSPInCsoZgV6fJqA9+OEe5uEsFaU2oP25C6v1
         PfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I9v8itQxrG/5qOmlIkuGPstFjTonnbsCxHmLWx5pBPk=;
        b=cxHMezF7XWFjF+yfaZU9Vsjokttn7Xfj5bLZ8eDfFRFPpFgnjEwcEmSHqTKPEKW22v
         C86PRX6obUI2a+BHbqrYF5k+ZZJ9+tHIAAy0e4XOId0wms/nMdpd2XSZJyP53gMfIr/G
         WW5pKxU+obN5z9YWNxe28NrIysNfhNhVNVvb4dbOYNU+0WqdpnZIwjprm0YYP1aNJqOI
         yYiuNhMc3Odxt2Wym1QSpm4RDtO7JO0aDQdxIboh6phINBJyHUKm2EmGmYydndDp89pw
         xB0H081g4Xyupuo35mzPn242w0rQQB6rsV0wUmkHeaiflW3AgFesNxRDuSGF9RwgnXR/
         0Eqw==
X-Gm-Message-State: AOAM530vMGAci10MPi5y94lhrB9EDTcsH0ZGjwFE7Y3JWyobcXthqkIc
        LC2twQH5glTSox9Y1E3Bi3G3wA==
X-Google-Smtp-Source: ABdhPJxQteuxg6Yjoj7fVR6WxdpZueTzVWR2/XBC+gGtJOSWv7p5AUuXED5I8jk4ofSy9cwnePazOA==
X-Received: by 2002:a0c:c988:: with SMTP id b8mr7690156qvk.192.1599234922927;
        Fri, 04 Sep 2020 08:55:22 -0700 (PDT)
Received: from localhost.localdomain (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id v18sm4724473qtq.15.2020.09.04.08.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:55:22 -0700 (PDT)
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
Subject: [PATCH v3 7/8] iommu/arm-smmu: Provide helper for allocating identity domain
Date:   Fri,  4 Sep 2020 15:55:12 +0000
Message-Id: <20200904155513.282067-8-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904155513.282067-1-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some platform implementations needs to be able to allocate a domain for
emulating identity mappings using a context bank without translation.
Provide a helper function to allocate such a domain.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Extracted from previous arm_smmu_setup_identity() implementation

 drivers/iommu/arm/arm-smmu/arm-smmu.c | 25 +++++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 4c4d302cd747..3c06146dfdb9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1924,6 +1924,31 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+struct iommu_domain *arm_smmu_alloc_identity_domain(struct arm_smmu_device *smmu)
+{
+	struct iommu_domain *identity;
+	int ret;
+
+	/* Create a IDENTITY domain to use for all inherited streams */
+	identity = arm_smmu_domain_alloc(IOMMU_DOMAIN_IDENTITY);
+	if (!identity) {
+		dev_err(smmu->dev, "failed to create identity domain\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	identity->pgsize_bitmap = smmu->pgsize_bitmap;
+	identity->type = IOMMU_DOMAIN_IDENTITY;
+	identity->ops = &arm_smmu_ops;
+
+	ret = arm_smmu_init_domain_context(identity, smmu, NULL);
+	if (ret < 0) {
+		dev_err(smmu->dev, "failed to initialize identity domain: %d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	return identity;
+}
+
 struct arm_smmu_match_data {
 	enum arm_smmu_arch_version version;
 	enum arm_smmu_implementation model;
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index f58164976e74..fbdf3d7ca70d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -537,4 +537,6 @@ struct arm_smmu_device *qcom_adreno_smmu_impl_init(struct arm_smmu_device *smmu)
 void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx);
 int arm_mmu500_reset(struct arm_smmu_device *smmu);
 
+struct iommu_domain *arm_smmu_alloc_identity_domain(struct arm_smmu_device *smmu);
+
 #endif /* _ARM_SMMU_H */
-- 
2.28.0

