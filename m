Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28EC725DEAF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 17:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgIDPzq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 11:55:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbgIDPz0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 11:55:26 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0F68C06125E
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2020 08:55:21 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id 92so4957328qtb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2020 08:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2fCr1AJs9wuitAEKSrgAGHFGKqH8nNlJ97BjXbXmjcA=;
        b=nq7Yq52dWK2MdT4FH7gxEZp0TjsJOGIfGdo6BK1+4OqJeoDIhKTf2aDFJDTv6cwKiL
         AAfJNraihxLVh8bWslR94j/0QKdKlYNtwIv3yMrxjDSCQOWEIxYc6ZiE65lUItOWUTtY
         BqFB1frX+GcyJ5SqFnJy0mLNzYc7wuu3R+iYFenJhV6MSs9oxnxjXrbEGZ1RDpM5GY+T
         y8WqyyGYcT8oYzHDGnZ8tQ7tfYTprXqknoa5mg/+T0r8ub6dJ9lD13U53ryGD9+UKow6
         LAJ62Z/mLSjcPYmkMHcOGBIr5g7C3xlrml3u8u7TkDz6TWwCAA8+9cceeXtB6w+uWVVB
         vqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2fCr1AJs9wuitAEKSrgAGHFGKqH8nNlJ97BjXbXmjcA=;
        b=FSZFHlRzWUIm6lQkAVB+c6ITrpR5lwf6ne4lR64ajJsbMj43IntV1R0BaHOC8E4Ke4
         fsKGm8TmhIONFoNXFHf9ebbtw1c2L3Zp7c5unO+s+Q5nf2BmKU+o+gTw7M2RUwrbcvPG
         XICdW56pZuhfSYETvp/VKbXKNU3Z8019RHjK+/hwu0omB4+VsxQ6kREdY5wo7BCod6DI
         UvRZnx7orbgQ2t0VyQCQGIWxnXnjKZL5ANQVFrrbDUTfazgZCko4Cn+HbIiLXORT33Ij
         vzFPBayryZ8o0wpbbEj/uwmIJqLXKy+nmE9cvzDi+HQ6N/BJf39o/mvoGybE466HNe3I
         Ac9A==
X-Gm-Message-State: AOAM533Fxf14JcEiZyQYJEQcAGp/rB7/FRY2aNA0d7qgz3SgfYPQDKng
        +mMEtYXik16rV5qKhcK1xm/KMg==
X-Google-Smtp-Source: ABdhPJx6yG/QL52OZ4xkujRCTRW3+fj5Lott15EzPUVbvzCJ+ggkUIXMR0Jjrj7i70Ud68y/ORLM9w==
X-Received: by 2002:ac8:66d3:: with SMTP id m19mr9426297qtp.276.1599234920832;
        Fri, 04 Sep 2020 08:55:20 -0700 (PDT)
Received: from localhost.localdomain (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
        by smtp.gmail.com with ESMTPSA id v18sm4724473qtq.15.2020.09.04.08.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2020 08:55:20 -0700 (PDT)
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
Subject: [PATCH v3 5/8] iommu/arm-smmu-qcom: Consistently initialize stream mappings
Date:   Fri,  4 Sep 2020 15:55:10 +0000
Message-Id: <20200904155513.282067-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904155513.282067-1-bjorn.andersson@linaro.org>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Firmware that traps writes to S2CR to translate BYPASS into FAULT also
ignores writes of type FAULT. As such booting with "disable_bypass" set
will result in all S2CR registers left as configured by the bootloader.

This has been seen to result in indeterministic results, as these
mappings might linger and reference context banks that Linux is
reconfiguring.

Use the fact that BYPASS writes result in FAULT type to force all stream
mappings to FAULT.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 284761a1cd8e..70a1eaa52e14 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -195,6 +195,7 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
 	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
 	u32 reg;
+	int i;
 
 	/*
 	 * With some firmware writes to S2CR of type FAULT are ignored, and
@@ -206,9 +207,24 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 	      FIELD_PREP(ARM_SMMU_S2CR_PRIVCFG, S2CR_PRIVCFG_DEFAULT);
 	arm_smmu_gr0_write(smmu, last_s2cr, reg);
 	reg = arm_smmu_gr0_read(smmu, last_s2cr);
-	if (FIELD_GET(ARM_SMMU_S2CR_TYPE, reg) != S2CR_TYPE_BYPASS)
+	if (FIELD_GET(ARM_SMMU_S2CR_TYPE, reg) != S2CR_TYPE_BYPASS) {
 		qsmmu->bypass_broken = true;
 
+		/*
+		 * With firmware ignoring writes of type FAULT, booting the
+		 * Linux kernel with disable_bypass disabled (i.e. "enable
+		 * bypass") the initialization during probe will leave mappings
+		 * in an inconsistent state. Avoid this by configuring all
+		 * S2CRs to BYPASS.
+		 */
+		for (i = 0; i < smmu->num_mapping_groups; i++) {
+			smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
+			smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
+			smmu->s2crs[i].cbndx = 0xff;
+			smmu->s2crs[i].count = 0;
+		}
+	}
+
 	return 0;
 }
 
-- 
2.28.0

