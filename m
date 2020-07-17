Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD1D222FD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 02:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726195AbgGQAQi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 20:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbgGQAQ2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 20:16:28 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A16EC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 17:16:28 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z3so4493164pfn.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 17:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iuuJuMaKgUlLRcc6gFCZ7HFqvJc6qzprtp/8FUZq9U4=;
        b=oGrAw2FWu08q1/KU6m+pJhAwavDgdIcPCeC2VO0HBZ36u6jVuMdY/1nf8t3PfztDxd
         UrUWUVv0AnWLdoKgefsdSYVgpZ4NShv34c7RawVdolP1zjCL4B7AapAXY3oXguBRoRCk
         PF7+1abGWRfMifqD+JULmyLXmWqVVqxxGalfipSqKUxJKGVGQ7TKDI8yZKyevy5YgWxZ
         hSf2uxu+JjBVs9go3Z0QmwRI8M8NXaIWEXiYdzEZdGq9x0D7Fe6x5rpTci8Z2TXY5VGF
         jHPoBeSe8mZhLDOeSB3SGkZLm4ZnuqsBMDyArUSRqy5ww1GBBGt/gDcd4aeLhToTI/hF
         JDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iuuJuMaKgUlLRcc6gFCZ7HFqvJc6qzprtp/8FUZq9U4=;
        b=kW5poekGjs9VyvdUdiaxcdBvguTzTY2SND5KEKfpFMZ0wEC1SmX+k7dpgwq4mQwvxW
         qN+13w/MR1XmoyHEKCQkmQmh9tIXpEIDsQyz9f49xQhgGGIc4jkFKTOA1GzcRd0Rl45n
         ro0TiOfyUABx/f3Yb/HB/gvWs9SzAwVLDEG+CsfKv72ODa6hWCfLLVlDysEIBk7nIiOS
         SKOhNEzt4ojNTtqDjMv5J6m9nk9gWJ/4eDTdO6B2lbq7bxOtsm8NkooKkHAc0+6O18T4
         /hmDjSw7R9HtTN69lNkDP4rvagtjSmJes46CIJD5iuvX5MMKdLQk+NKfA68b/NIuI3ao
         RB1A==
X-Gm-Message-State: AOAM531BdWYV6Q6V7R9pQn8G0jC6ZXjzO5sBMNz1BrVIaFYOFoYCovUv
        NPqvJgO9QxbWMC9qAvQx0V1gBA==
X-Google-Smtp-Source: ABdhPJwSZZ9bKl9IV9ztWA8mR2McxctG8Dmv5bJM8VuXAimbsGQd1EoPEyeJ0iHJ6beRLFNWkuNlnA==
X-Received: by 2002:a63:1e4d:: with SMTP id p13mr6161160pgm.387.1594944987760;
        Thu, 16 Jul 2020 17:16:27 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r7sm6211950pgu.51.2020.07.16.17.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 17:16:27 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 4/5] iommu/arm-smmu-qcom: Consistently initialize stream mappings
Date:   Thu, 16 Jul 2020 17:16:18 -0700
Message-Id: <20200717001619.325317-5-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200717001619.325317-1-bjorn.andersson@linaro.org>
References: <20200717001619.325317-1-bjorn.andersson@linaro.org>
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

Tested-by: John Stultz <john.stultz@linaro.org>
Tested-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Fixed subject spelling mistake
- Picked up tested-by

 drivers/iommu/arm-smmu-qcom.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu-qcom.c b/drivers/iommu/arm-smmu-qcom.c
index d95a5ee8c83c..10eb024981d1 100644
--- a/drivers/iommu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm-smmu-qcom.c
@@ -27,6 +27,7 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 {
 	unsigned int last_s2cr = ARM_SMMU_GR0_S2CR(smmu->num_mapping_groups - 1);
 	u32 reg;
+	int i;
 
 	/*
 	 * With some firmware writes to S2CR of type FAULT are ignored, and
@@ -37,9 +38,24 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 					    FIELD_PREP(ARM_SMMU_S2CR_CBNDX, 0xff) |
 					    FIELD_PREP(ARM_SMMU_S2CR_PRIVCFG, S2CR_PRIVCFG_DEFAULT));
 	reg = arm_smmu_gr0_read(smmu, last_s2cr);
-	if (FIELD_GET(ARM_SMMU_S2CR_TYPE, reg) != S2CR_TYPE_BYPASS)
+	if (FIELD_GET(ARM_SMMU_S2CR_TYPE, reg) != S2CR_TYPE_BYPASS) {
 		smmu->qcom_bypass_quirk = true;
 
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
2.26.2

