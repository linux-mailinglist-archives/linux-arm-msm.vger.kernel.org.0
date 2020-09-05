Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4251025EA2A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 22:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728828AbgIEUE4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 16:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728837AbgIEUEz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 16:04:55 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCB2C061244;
        Sat,  5 Sep 2020 13:04:55 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id s2so4571069pjr.4;
        Sat, 05 Sep 2020 13:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ExFb876Zpeyb1xoghNKq/lathY4dq7rmwE6M/oL73CQ=;
        b=T5hzkFVJ906JGMEGcKzWOIyfp4RZO093Wgyzbv3F8qEos8PoXpghOhJPYdnPqHOE9d
         tRckNjK7Lb9T4PX3poifyFY6PsJfV9V1wpOQU0QuU7QGgYtqx5ngy8bIyDV8kqeyFDPN
         tuPUvhIR5/DeC3c8Bf/y+BaLGA2Xdp7cxc882CDBXvGwbSAuogBqIWywBd1rO4/yt430
         Orlwi/mIssTh3pd4sEgnH7r38fD35d9BJWnPaVrqMhRn0yhya+Ik+EZ57jsuQNkJgcX5
         6pxJmO6E4AXXPMhS5xSij0iEciaP4yNv32wCwgnJsvmAWG7+wFC9u6/gAYEAMSGNJ7pN
         /t/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ExFb876Zpeyb1xoghNKq/lathY4dq7rmwE6M/oL73CQ=;
        b=gD2ks6lX93yR3eR9TRemVneWkNMmy8BAKwtiCt3rh/wf8cZsfT3nmZaiKZe5/vdtzF
         lQI+ecnscRChZBiqWTjAk6jGbv0ROJo0QmraCIvXW4stBJlfbkFyBhOfSo6Ve0nbiO1y
         C1X72RDzQveUsM6G0z8uHqS51fOTgUvPhQxMrbpVlgOueJcGCmTzYbFKQH8H/asoaZC1
         ZvICmR9d7zuVmEsq5O5riMz9PjoRFDyrbC6ftyoHwPNSjfnI/+R1BP2LfmQzBP/ZdU4N
         vfIT6UFUXLQXJsHvXmzQkfz+h5pQPd8txrQXD1g2IsYooBnOa5Nx3VkllxMdpz02ZIIV
         MTwg==
X-Gm-Message-State: AOAM533uzzXTRAO4lBUJRFbFhEjjaeIU/4kQv0jZgVOsIxK/6RHMNMgo
        9JsPxRMgnr91hdA/DA0jH3g=
X-Google-Smtp-Source: ABdhPJwrvjF9LVJOg5UrKaixKkZOaQCEUmOTh1VsmLMJvfbpixbh1oqxeYJIfz/zv4DDASl+uqUl8g==
X-Received: by 2002:a17:902:8d82:: with SMTP id v2mr14095552plo.180.1599336295014;
        Sat, 05 Sep 2020 13:04:55 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id y195sm10492742pfc.137.2020.09.05.13.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:04:53 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v17 15/20] iommu/arm-smmu: Constify some helpers
Date:   Sat,  5 Sep 2020 13:04:21 -0700
Message-Id: <20200905200454.240929-16-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
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
index 9aaacc906597..1a746476927c 100644
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

