Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3099C24799C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 00:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgHQWCw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 18:02:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729356AbgHQWCq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 18:02:46 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D646C061389;
        Mon, 17 Aug 2020 15:02:46 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id i10so3227362pgk.1;
        Mon, 17 Aug 2020 15:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kSk9Ml31XbJOG2f57h64F+Z+u/H7LjegKljJVlxq3/o=;
        b=nm/7SGgFRX0ihleRm7Q/XK7LVekmqJHuZ8oj9lP9CXD13fVd5gAP4NJNxTI0IaLTxZ
         6kwlK7LnBgaTtgYgQvAvN+F/TS+W036JQTWR5A95BntVFHtn1Egf507kL/nDY6eSYeiW
         S2hw4HSkdzN3br8ULMam/Io8JPcv962Y2NhD37Pge/yHTDasRg9THH5VYLxdIjds6dPu
         KAoc/Uazrql0SH+b2l4IieEO/bnVDC0zQLKK/twIMcQd9Uc3VOJ/cSZyXUzDPYlbQohr
         D2dVmTOcCWM9zWqDClw0UlKxGXIXJG2AGsnS/UUhwpVyTg3FnnmTZX+UFSp3voLU/YOW
         046w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kSk9Ml31XbJOG2f57h64F+Z+u/H7LjegKljJVlxq3/o=;
        b=NIySl/1N6YF9iJrcplSWrZaguqHBr2MT7tgWI7UvxON6ekyCWpq0Qb0HvqdGDzvwQx
         uHnIbqP3uTNg645c5Cxj62c/uy+FxQFkfAL7rqjGel9tCx8EXNNNoRGhnmA/uQYSzTcg
         nVWKQP0/cziURbKAejh3YDHp+VAXFor5GuunzVgC20t2S5G7uG0vQ536mpBrcA5toku0
         P116vhQyISq7xxJT2kAOIvSe0DyRSWB3fCa+/vZCcjpeY82t//JMqqZruhnvg6Gsryo5
         Z7JgpdJHLAvFYpNU7iHyMn+0MPG0SXpSA3WUqMDBMTAJ3V/zdEpexr7UhwX6dJelCJ9U
         lcdw==
X-Gm-Message-State: AOAM5313XMnomDiFq+OAIe/DG7GnhJkVlPK6KcTtjsOuR0omdtZBf+Xh
        kWRike9P0pRV7H97y+2XsijjrXPRDI+2qnZX
X-Google-Smtp-Source: ABdhPJyjHBznYe1foLjUKpz2EMXIaHb/X83JWzeO7X2OC6dD70uDdc8FCs5HAivVMepCakOji61d4Q==
X-Received: by 2002:aa7:9427:: with SMTP id y7mr12635340pfo.12.1597701765593;
        Mon, 17 Aug 2020 15:02:45 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id g5sm21307016pfh.168.2020.08.17.15.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 15:02:44 -0700 (PDT)
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
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 08/20] iommu/arm-smmu: constify some helpers
Date:   Mon, 17 Aug 2020 15:01:33 -0700
Message-Id: <20200817220238.603465-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
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

