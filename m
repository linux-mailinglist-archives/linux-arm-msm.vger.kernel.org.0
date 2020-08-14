Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8EAF244356
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Aug 2020 04:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgHNClc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 22:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726587AbgHNClc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 22:41:32 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3801C061757;
        Thu, 13 Aug 2020 19:41:31 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id q19so3538472pll.0;
        Thu, 13 Aug 2020 19:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kSk9Ml31XbJOG2f57h64F+Z+u/H7LjegKljJVlxq3/o=;
        b=dZm6TlDHBQSDUoqkiGBlFYcIWns/dlRkwOT3McDXM9XwdsNIy+FZqBrJrcHNEuiXdc
         YTaPUe5n+liTYTvn8kmJQ8qFNj8jWO2BZBSUUKpWL8251W/wQOnP1FRxC/QAMSdpyOs7
         VVJJ6MS9omPl7AjUQsWpM1CewysGH/zjmckpIMKhXsYOowvBzwm0joLQH+Rmh1NCIKN1
         6ANfS4Of/TtKttluwjXjfgmGSbX5ohaInAcawRFucl0zqlYM1YzhIwIqoHRHPBqFUrL6
         opHCxGh7cVLw3C/R1/nghHZfbunISH20rw+ucvptJePgpYHDN0GwyCzKGX8lBm90xA5X
         Zt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kSk9Ml31XbJOG2f57h64F+Z+u/H7LjegKljJVlxq3/o=;
        b=V+XtVyWcOn5WGqSj82plZx6VEXZASq4IF8H/IB7G+Z+B0e4YntBxgMrCIgggDfPfkP
         GjieXNXPWRv6xXOv6dzXPgq9/QE7fr5OzPnmbFmAhFxxCYo9pkf3g4fw+0jai8O392aY
         eqILvf+wiV7ascVOZdfQx7D/QkjxIxmBRqKUd4CEu0aKVXfx+GI93SE+QmomPmIsFwpK
         RTo2Uvig0GNB5roDpWqHZVAY/OOekjLd5VbAKpg3hgOBWFTcGEYzaD+MmuyXxIjq8Opz
         Rh1ONDfHfV6PdDpkVNkUJ42Gv+gty5jqxrlBQO4c/lIawUy8Dm1KuL/lM9FSxZgpH1mN
         qnGw==
X-Gm-Message-State: AOAM530P8hfOJhinOsZ0VBr+t5krJNcQwtJ5VLpmO9JFfF9g4f5A7R1Z
        4+/Du+UCCTSYKsZxUQLNvXw=
X-Google-Smtp-Source: ABdhPJxNn9klKSCknXigoCt+QGQ9ZakXboaSv2q1rJpsSjEUNzxRP5coR+a+bHMh9UIMN9ZO2/rSaA==
X-Received: by 2002:a17:90a:6d96:: with SMTP id a22mr484182pjk.165.1597372891324;
        Thu, 13 Aug 2020 19:41:31 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id x18sm7127549pfc.93.2020.08.13.19.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 19:41:30 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-msm@vger.kernel.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Pritesh Raithatha <praithatha@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 08/19] iommu/arm-smmu: constify some helpers
Date:   Thu, 13 Aug 2020 19:41:03 -0700
Message-Id: <20200814024114.1177553-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810222657.1841322-1-jcrouse@codeaurora.org>
References: <20200810222657.1841322-1-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Sprinkle a few `const`s where helpers don't need write access.

Signed-off-by: Rob Clark <robdclark@chromium.org>
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

