Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7636259A5A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 18:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729778AbgIAQsZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 12:48:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732270AbgIAQrW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 12:47:22 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E42E5C061244;
        Tue,  1 Sep 2020 09:47:21 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ds1so912597pjb.1;
        Tue, 01 Sep 2020 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TkWyTxARTuQIVpZ4nA1zGbs/CkLTaav5w1kzBb9PxHE=;
        b=J04apcnc9yNiayNZvi3RYs6LgZ8DqVcJmH8Wr7KTsf3utcG6+8ceh5GGe5HDRit6bk
         MdnphK+NGv+I+f/0sk1/MaAHJmh7Ktms/5w3cL3HrJf3mZ0W5ysTqzr+uVCGsNi54rdD
         rbMoWwFeCig9zC+wiWq9md/RLsMrviLGxPOZZN0NOe+0xEB+j0laN7Xo5Owln6TF29+P
         eh6M6tnKd8cTmhDBIPYHE863ookRQ6I8lmDX0mV5Uhc8sLnydbYSbjJvwbMYCh4oJk0n
         Nqh1wBWRypBsmGZYuXraOizi28hKZ/p3WEGvqXA1NuPh18aROFbAVr8B1Uj4YI8vwNGK
         jMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TkWyTxARTuQIVpZ4nA1zGbs/CkLTaav5w1kzBb9PxHE=;
        b=c3uzM+RaeshuYTXdOIu1nmU2WbYgolRuBZ6cRXEcGKKgZtz56bbk0LEFzJakCGuV8L
         7tB9iHmn82x2NbG1bhAP2I3tLTB4n2jkc9YB4DutbqfUpz0MaIFAHsuzCIkSMjE48qww
         0gQ9m9VynG8Z3YTWPqOZkgxG1CKEwIuIIRCU9iFoF77snw3yL7K/YalpFImuuyKIHe8x
         T6cs2O7M+R6j+mHtevDR95jVT6Y36O7ijs03fplUfh9wqhqdY5kPd04WfL0cNNwykYNx
         qJapRFlqsW2g/PQ0s+56M5jlWztBAupYHlXH4WKB7UEgROd8dkFDTIlmyJ5Ot2WlcCWj
         MRhQ==
X-Gm-Message-State: AOAM531AoTvksjQ78cGu1bMCFiOa1jhZRHuAcZrvBmU1TQtpiLWe8cuR
        2HAjV5bAP2RsdaYw0d4ueS8=
X-Google-Smtp-Source: ABdhPJzPwgooR5I07lG6agi4o+XJIiUnZtxaG2d2E6PYRW6u09VjILA4cchEz56ubddK4K9nWje7yw==
X-Received: by 2002:a17:902:407:: with SMTP id 7mr2182544ple.167.1598978841446;
        Tue, 01 Sep 2020 09:47:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id u2sm2036508pjj.57.2020.09.01.09.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 09:47:20 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v16 15/20] iommu/arm-smmu: Constify some helpers
Date:   Tue,  1 Sep 2020 09:46:32 -0700
Message-Id: <20200901164707.2645413-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200901164707.2645413-1-robdclark@gmail.com>
References: <20200901164707.2645413-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Sprinkle a few `const`s where helpers don't need write access.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 59ff3fc5c6c8..27c83333fc50 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -377,7 +377,7 @@ struct arm_smmu_master_cfg {
 	s16				smendx[];
 };
 
-static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
+static inline u32 arm_smmu_lpae_tcr(const struct io_pgtable_cfg *cfg)
 {
 	u32 tcr = FIELD_PREP(ARM_SMMU_TCR_TG0, cfg->arm_lpae_s1_cfg.tcr.tg) |
 		FIELD_PREP(ARM_SMMU_TCR_SH0, cfg->arm_lpae_s1_cfg.tcr.sh) |
@@ -398,13 +398,13 @@ static inline u32 arm_smmu_lpae_tcr(struct io_pgtable_cfg *cfg)
 	return tcr;
 }
 
-static inline u32 arm_smmu_lpae_tcr2(struct io_pgtable_cfg *cfg)
+static inline u32 arm_smmu_lpae_tcr2(const struct io_pgtable_cfg *cfg)
 {
 	return FIELD_PREP(ARM_SMMU_TCR2_PASIZE, cfg->arm_lpae_s1_cfg.tcr.ips) |
 	       FIELD_PREP(ARM_SMMU_TCR2_SEP, ARM_SMMU_TCR2_SEP_UPSTREAM);
 }
 
-static inline u32 arm_smmu_lpae_vtcr(struct io_pgtable_cfg *cfg)
+static inline u32 arm_smmu_lpae_vtcr(const struct io_pgtable_cfg *cfg)
 {
 	return ARM_SMMU_VTCR_RES1 |
 	       FIELD_PREP(ARM_SMMU_VTCR_PS, cfg->arm_lpae_s2_cfg.vtcr.ps) |
-- 
2.26.2

