Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17AF3C01D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2019 11:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfI0JJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Sep 2019 05:09:56 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37893 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfI0JJ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Sep 2019 05:09:56 -0400
Received: by mail-wr1-f68.google.com with SMTP id w12so1831227wro.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2019 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gVA/w0d2QWMzk0mJERhCeM6+8qnZiMPqI0NO/jhQ/j0=;
        b=eEv4Fwdh0pKiRgTd7B+EjixtmSqNuJRkv5XvtTVqWqDQGeLn3vI6OnLxqfMGfKl++v
         SlE30ctasb7M/IB2m4PlKU3EF0gXP4nBSORk/elCm4vvpU0U8AD2rB+bdRz8ClkbIO0G
         L8WpVctLB5e42o/qE9i5gslMYR81fSV89eOzC9PRBRJJoDOoIXeb0CkkOogjbMVNkuf3
         GTUNhDzE1AKmRldtFH+AtoNAodsEmaSrCOoCCwkF9wlmAjR2kPkRXcy9Z8FGaDEjt69C
         pdXnm2lmaYT38JEmQ+UWg7takuMVaCbpVWMDoMy2b8ix81+GXOfVo+yBO4sm8NEoYizc
         T0tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gVA/w0d2QWMzk0mJERhCeM6+8qnZiMPqI0NO/jhQ/j0=;
        b=dK9Ut5GdC2fLfYa1h6U+dy+CtsnMZy8RLezgOWxnoDT8eYq5knwD8I4InKNyxxiT89
         negfO7YykZoPn3HtSfk0YETOUM95ibChlqL61domcmnVia40vOQir+zJOyRmmsWpz+Dr
         3+tKsJ32ebPoVfn56BpKb+jw3nNLvpu7kabZOIxyQ6zYwzIuUGoLLTYXPRe2jdci10rg
         QtRCAyAayD9AJH+1C58eHEAcWTbvNLR+Jj2SrWhhJB7Z3uRMtIX96Ym0KZEKS8Pq+g/6
         +Z/tK7pD0bLgyRXwRbo2amuWp1l7C70Wg4rPQH4/4WzBRLUiNS9IndqVkCK8+uk6EYNz
         P+Lw==
X-Gm-Message-State: APjAAAWG3DO+7U+h18pLLh0TDEpxX3PNYurQDLJQmiy8ksKtKNXW6UB/
        d1AnzBNwIlZWISi1ueGidVxb4CXxJZM=
X-Google-Smtp-Source: APXvYqxVKsiXL1Z2wTAdpcGgdahPsNpSu6ApZ18dtwjjc5bXfkSvKuV99jMnkb11JfefA9bA7MQWPw==
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr2139684wrv.248.1569575393628;
        Fri, 27 Sep 2019 02:09:53 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id b62sm6037791wmc.13.2019.09.27.02.09.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Sep 2019 02:09:53 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, marijns95@gmail.com,
        agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH v2 2/6] iommu/qcom: Write TCR before TTBRs to fix ASID access behavior
Date:   Fri, 27 Sep 2019 11:09:43 +0200
Message-Id: <20190927090947.11175-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190927090947.11175-1-kholk11@gmail.com>
References: <20190927090947.11175-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

As also stated in the arm-smmu driver, we must write the TCR before
writing the TTBRs, since the TCR determines the access behavior of
some fields.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iommu/qcom_iommu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 5837556af147..8431fb97a50f 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -245,6 +245,13 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 			ctx->secure_init = true;
 		}
 
+		/* TCR */
+		iommu_writel(ctx, ARM_SMMU_CB_TCR2,
+				(pgtbl_cfg.arm_lpae_s1_cfg.tcr >> 32) |
+				FIELD_PREP(TCR2_SEP, TCR2_SEP_UPSTREAM));
+		iommu_writel(ctx, ARM_SMMU_CB_TCR,
+				pgtbl_cfg.arm_lpae_s1_cfg.tcr);
+
 		/* TTBRs */
 		iommu_writeq(ctx, ARM_SMMU_CB_TTBR0,
 				pgtbl_cfg.arm_lpae_s1_cfg.ttbr[0] |
@@ -253,13 +260,6 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 				pgtbl_cfg.arm_lpae_s1_cfg.ttbr[1] |
 				FIELD_PREP(TTBRn_ASID, ctx->asid));
 
-		/* TCR */
-		iommu_writel(ctx, ARM_SMMU_CB_TCR2,
-				(pgtbl_cfg.arm_lpae_s1_cfg.tcr >> 32) |
-				FIELD_PREP(TCR2_SEP, TCR2_SEP_UPSTREAM));
-		iommu_writel(ctx, ARM_SMMU_CB_TCR,
-				pgtbl_cfg.arm_lpae_s1_cfg.tcr);
-
 		/* MAIRs (stage-1 only) */
 		iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR0,
 				pgtbl_cfg.arm_lpae_s1_cfg.mair[0]);
-- 
2.21.0

