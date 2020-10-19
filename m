Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93B69292D6C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 20:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730552AbgJSSWq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 14:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730464AbgJSSWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 14:22:46 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571ECC0613D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 11:22:46 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id m22so558908ots.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2020 11:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8WNcSTvyJjqPsluOX/aQHxo6wZkO11EjVoorR/ZeenI=;
        b=bFyiA3AgOGUPXSmlD9ln5iZpm2IIkGqCKw/60r0m/Cx4zD4T3E0nqY3ega31Z0G4VI
         HDUVN+RNPyfDT0q1cl1jJmiVwmTvX9jinwXYJYbBO3AndeqrWxw9dVVpqQzIYbBazf7H
         sFyncVWqYaHCD3gaVlMmsB9+whr4jlJXjuZGiOiz6r6vM7Capkd+ZH8KYvwXBixNTfkz
         snT5x1MjjB3Tqh6MJxwHwZXcrbpI/im+BZUPMW/HSglDnM1XQeQHpOfD//3cc8O2jngy
         gy+dOM9EIubZPx/PXHr2KXGetlHK0fHHNO46kQjJzJg3dJ32eb+R5nzuubOOtwvCFcYe
         17Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8WNcSTvyJjqPsluOX/aQHxo6wZkO11EjVoorR/ZeenI=;
        b=UMI32iOUuzDi/PLXgWC4EDSHoLywbUYkSFDVRCJCbDbjVXs8hVAccZ21eij6nWE5mA
         I3mSTg7BUe08bY8k0ZSS4eObqxRWK5/MFNz7YjcIS4583VcODuJk+LfyqkKmG5vw1Kn0
         FCBdFwQSCQBG5s+g6Mk8ORQDqYrj0x3pKkqbUXL2HXZUZ1q6lfCvVTmpWcxOv1e0xjpY
         SKlECi5UyUtTGGabYryJIagbWAkvnN2uIuQAVD6esRPbM5q8O2aUT/r1wQfZN+nmaZ7W
         eDxJS4VCE0yITDcA8RuXh87KYvUGx/iFz2HOZvee+uMW2QZzj/Fqy/Cn+w2x3Ir1aCGu
         wOLg==
X-Gm-Message-State: AOAM532QxFYIA6AOQTxugNQuhzO7A83rz0hWeqPLRZKSlFaQyYyLEQvJ
        hR90dOnTzzVgu9HNlGuUQU+MoQ==
X-Google-Smtp-Source: ABdhPJzVeqVCQDNjLcs4loM+bM++jSYOB3qz5YDAugy+gXljNRXkI2CN8pviTsuIzrWxZhciQsuOTw==
X-Received: by 2002:a05:6830:2368:: with SMTP id r8mr915212oth.75.1603131765704;
        Mon, 19 Oct 2020 11:22:45 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o8sm175296oog.47.2020.10.19.11.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 11:22:45 -0700 (PDT)
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
Subject: [PATCH v5 1/3] iommu/arm-smmu: Allow implementation specific write_s2cr
Date:   Mon, 19 Oct 2020 11:23:21 -0700
Message-Id: <20201019182323.3162386-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
References: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The firmware found in some Qualcomm platforms intercepts writes to the
S2CR register in order to replace the BYPASS type with FAULT. Further
more it treats faults at this level as catastrophic and restarts the
device.

Add support for providing implementation specific versions of the S2CR
write function, to allow the Qualcomm driver to work around this
behavior.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Return early instead of indenting the rest of the function

 drivers/iommu/arm/arm-smmu/arm-smmu.c | 13 ++++++++++---
 drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index dad7fa86fbd4..bcbacf22331d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -929,9 +929,16 @@ static void arm_smmu_write_smr(struct arm_smmu_device *smmu, int idx)
 static void arm_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
 {
 	struct arm_smmu_s2cr *s2cr = smmu->s2crs + idx;
-	u32 reg = FIELD_PREP(ARM_SMMU_S2CR_TYPE, s2cr->type) |
-		  FIELD_PREP(ARM_SMMU_S2CR_CBNDX, s2cr->cbndx) |
-		  FIELD_PREP(ARM_SMMU_S2CR_PRIVCFG, s2cr->privcfg);
+	u32 reg;
+
+	if (smmu->impl && smmu->impl->write_s2cr) {
+		smmu->impl->write_s2cr(smmu, idx);
+		return;
+	}
+
+	reg = FIELD_PREP(ARM_SMMU_S2CR_TYPE, s2cr->type) |
+	      FIELD_PREP(ARM_SMMU_S2CR_CBNDX, s2cr->cbndx) |
+	      FIELD_PREP(ARM_SMMU_S2CR_PRIVCFG, s2cr->privcfg);
 
 	if (smmu->features & ARM_SMMU_FEAT_EXIDS && smmu->smrs &&
 	    smmu->smrs[idx].valid)
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 1a746476927c..b71647eaa319 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -436,6 +436,7 @@ struct arm_smmu_impl {
 	int (*alloc_context_bank)(struct arm_smmu_domain *smmu_domain,
 				  struct arm_smmu_device *smmu,
 				  struct device *dev, int start);
+	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
 };
 
 #define INVALID_SMENDX			-1
-- 
2.28.0

