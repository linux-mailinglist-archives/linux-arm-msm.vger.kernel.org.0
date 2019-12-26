Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5314B12AF18
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2019 23:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfLZWRt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 17:17:49 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33762 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbfLZWRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 17:17:46 -0500
Received: by mail-pl1-f195.google.com with SMTP id c13so10964274pls.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 14:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tubUT90M6ZUsQq/NCNWX8+4auD3W82M3BMPow6ghbj8=;
        b=UQmFVNA7UILTF3d5FkPUjDuMXwndbRHZm1U93zjabv/K6dGhtSfmt4s9JIg+xMq75d
         Y23XDZw4It10l4QHXqaDJ2gjQ7UgsgsYKUABY6o6xlTM6PcI9JGpvxzOiNBkPbauQJQX
         rOb03V74Q2iuvkeRbjoJ25qWSvTN+tewTjT3wPd/ueVoyCzibclmSE33cOkd0g/LLhFE
         PwN21iKGHN6E0QaX+a9jOmpxp/0FWhAO0E6515STbaiPfJvHp37nOVMDlntvCQ+pVwZD
         /Ct2qloyyzoXbev8IsVQDmVybAPP5fOQHljHSIHCexni+dNs47E8KE1BxAOlCHWLI6ls
         AFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tubUT90M6ZUsQq/NCNWX8+4auD3W82M3BMPow6ghbj8=;
        b=B4wYxP+8J9wONcX+EGlDY/G6MyIRM/Ictn/lzoQvJReDD5WR5G83ebG0Tqgfn6mOgl
         LdeGxcCvmOyl0EYIRbWHlgMe5wB7gW2gIocuixjVvXKRWaEA7Tzn8rRYIYZx8g5HI8Ic
         zF1eSin7ImAzQqxKCwogSIHpKO9Ug29JUcLR7u0APKw8Jk0c9A6zMJmN/ZoS+En0aIas
         GKVihBZKnebVxR6Axy7bQoJSWqR4yWEtpZY1hYHQUnn7YnS2hAWSRB2zn13Qr/YR4JdO
         KMG64zTWQ/xfRXNrHL/wPi7GToECpXad9+VCQ82PqwkS+ICmn+SOEF0fY/DXvOjYzSfn
         adwA==
X-Gm-Message-State: APjAAAVHzYd0a8mgPlZyhxMhdCEuHOxUEvJas6n7WGXnqwH0UgZEX54W
        E/ZJAY8/jWyjnGqO1qmeJmWTAQ==
X-Google-Smtp-Source: APXvYqzsnGwMryOZ8OSkxJxnL0bgVLu9XUOFhXRRLNcQ4apGus/dVePA/bPEIWlQsBQNQtZUk1Rydw==
X-Received: by 2002:a17:90a:9f04:: with SMTP id n4mr22039896pjp.76.1577398665952;
        Thu, 26 Dec 2019 14:17:45 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 2sm11779409pjh.19.2019.12.26.14.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 14:17:45 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Patrick Daly <pdaly@codeaurora.org>,
        Pratik Patel <pratikp@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Subject: [PATCH 1/3] iommu/arm-smmu: Don't blindly use first SMR to calculate mask
Date:   Thu, 26 Dec 2019 14:17:07 -0800
Message-Id: <20191226221709.3844244-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191226221709.3844244-1-bjorn.andersson@linaro.org>
References: <20191226221709.3844244-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the SMRs inherited from the bootloader the first SMR might actually
be valid and in use. As such probing the SMR mask using the first SMR
might break a stream in use. Search for an unused stream and use this to
probe the SMR mask.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since RFC:
- Deal with EXIDS
- Use arm_smmu_gr0_read/write()

 drivers/iommu/arm-smmu.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 4f1a350d9529..6ca6a4e072c8 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -945,24 +945,43 @@ static void arm_smmu_write_sme(struct arm_smmu_device *smmu, int idx)
  */
 static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
 {
+	u32 s2cr;
 	u32 smr;
+	int idx;
 
 	if (!smmu->smrs)
 		return;
 
+	for (idx = 0; idx < smmu->num_mapping_groups; idx++) {
+		if (smmu->features & ARM_SMMU_FEAT_EXIDS) {
+			s2cr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_S2CR(idx));
+			if (!FIELD_GET(S2CR_EXIDVALID, s2cr))
+				break;
+		} else {
+			smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(idx));
+			if (!FIELD_GET(SMR_VALID, smr))
+				break;
+		}
+	}
+
+	if (idx == smmu->num_mapping_groups) {
+		dev_err(smmu->dev, "Unable to compute streamid_mask\n");
+		return;
+	}
+
 	/*
 	 * SMR.ID bits may not be preserved if the corresponding MASK
 	 * bits are set, so check each one separately. We can reject
 	 * masters later if they try to claim IDs outside these masks.
 	 */
 	smr = FIELD_PREP(SMR_ID, smmu->streamid_mask);
-	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_SMR(0), smr);
-	smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(0));
+	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_SMR(idx), smr);
+	smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(idx));
 	smmu->streamid_mask = FIELD_GET(SMR_ID, smr);
 
 	smr = FIELD_PREP(SMR_MASK, smmu->streamid_mask);
-	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_SMR(0), smr);
-	smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(0));
+	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_SMR(idx), smr);
+	smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(idx));
 	smmu->smr_mask_mask = FIELD_GET(SMR_MASK, smr);
 }
 
-- 
2.24.0

