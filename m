Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4420525DEAE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 17:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726114AbgIDPzq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 11:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbgIDPz0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 11:55:26 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A5E1C061263
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 08:55:25 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id u3so6706960qkd.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 08:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D1yn3SCzU30h04jFGZXM8u3sA7NFVzSbPZqsPP+oWTg=;
        b=e29uwL+EpSoES/+z1K7U/GWcIt61CkRtvS0de6u87FjQ4LIGnpTSAeb20AmUaBcCZ8
         qtWzRwMAkZO+FFYyxWZgTURdUzTgq6bhfj60DTRKFmf9wWPT10+0oU/yOGpjFBtn9Yab
         oAuX8ffQuctwoR52w0eq8k+Qv0iHkXxsn4ZzCB7xDfRKFO6+vWmJc2uHQb5HuinMDXj0
         4x11oTIlnbY00jrQyfglYGC0moCfhrkmlrCmXpOejfircLaXWuz1uHJerPmGG6PAYKWP
         Bep1fwiC1Nn43wd0BDxFgDLF5fMFxZJxsemZJJfrYPg9oMu1dtnkwBanuwslteLyGari
         kW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D1yn3SCzU30h04jFGZXM8u3sA7NFVzSbPZqsPP+oWTg=;
        b=BorM+mne5vzGRCpPVaunQ+2KQCFJ5n3F+8fpsbe/5HBTiKX9iTN8UoMKSn41VyrMme
         Si/GvP/IppN1eOn5EsnYilEZjuJNk7Uh7TiTY9FCiY7mwXcqUx/3Q4UQRKxN/ft39Jd9
         tF0FncvG1TSQGQA7aYUrm5yJbj49drVDwcMnBmO1CoaJTd7b8iwMcMKPGqAz+70inQZT
         XW0NSAa/RBhO6oIKUSXsethuyYZgCXcPZR29RNjJpdtbp2H8TogbkJNJcKoKdxGjByt/
         J5ry6hvYgFiRHq1L+rGSn2168Tf8U9vf8dhArlifiLVOHT74PzQspWJuattBqXRaC8LU
         +u4A==
X-Gm-Message-State: AOAM532DYb0e5Krn+upRj8N/OSVd7rVlSgIDCx50MgAbqhNIo2BAWZXr
        Iwvu5qnRFJztScRUkn0W+G4iiQ==
X-Google-Smtp-Source: ABdhPJyFYlEUGi9gN4pbIp7iXdUMIwRXrisWYKCYwXf+631ilHcizfoLcG9kkcGDBzyGaKjC1Bz+iw==
X-Received: by 2002:a37:6108:: with SMTP id v8mr7108268qkb.264.1599234924005;
        Fri, 04 Sep 2020 08:55:24 -0700 (PDT)
Received: from localhost.localdomain (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id v18sm4724473qtq.15.2020.09.04.08.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:55:23 -0700 (PDT)
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
Subject: [PATCH v3 8/8] iommu/arm-smmu-qcom: Setup identity domain for boot mappings
Date:   Fri,  4 Sep 2020 15:55:13 +0000
Message-Id: <20200904155513.282067-9-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904155513.282067-1-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With many Qualcomm platforms not having functional S2CR BYPASS a
temporary IOMMU domain, without translation, needs to be allocated in
order to allow these memory transactions.

Unfortunately the boot loader uses the first few context banks, so
rather than overwriting a active bank the last context bank is used and
streams are diverted here during initialization.

This also performs the readback of SMR registers for the Qualcomm
platform, to trigger the mechanism.

This is based on prior work by Thierry Reding and Laurentiu Tudor.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Combined from pieces spread between the Qualcomm impl and generic code in v2.
- Moved to use the newly introduced inherit_mapping op.

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 70a1eaa52e14..a54302190932 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -12,6 +12,7 @@
 struct qcom_smmu {
 	struct arm_smmu_device smmu;
 	bool bypass_broken;
+	struct iommu_domain *identity;
 };
 
 static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
@@ -228,6 +229,37 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+static int qcom_smmu_inherit_mappings(struct arm_smmu_device *smmu)
+{
+	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	int cbndx;
+	u32 smr;
+	int i;
+
+	qsmmu->identity = arm_smmu_alloc_identity_domain(smmu);
+	if (IS_ERR(qsmmu->identity))
+		return PTR_ERR(qsmmu->identity);
+
+	cbndx = to_smmu_domain(qsmmu->identity)->cfg.cbndx;
+
+	for (i = 0; i < smmu->num_mapping_groups; i++) {
+		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
+
+		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
+			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
+			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
+			smmu->smrs[i].valid = true;
+
+			smmu->s2crs[i].type = S2CR_TYPE_TRANS;
+			smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
+			smmu->s2crs[i].cbndx = cbndx;
+			smmu->s2crs[i].count++;
+		}
+	}
+
+	return 0;
+}
+
 static int qcom_smmu_def_domain_type(struct device *dev)
 {
 	const struct of_device_id *match =
@@ -270,6 +302,7 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
 	.cfg_probe = qcom_smmu_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = qcom_smmu500_reset,
+	.inherit_mappings = qcom_smmu_inherit_mappings,
 };
 
 static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
-- 
2.28.0

