Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1BD8BF275
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 14:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbfIZMFY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 08:05:24 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38771 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfIZMFX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 08:05:23 -0400
Received: by mail-wr1-f66.google.com with SMTP id w12so1754735wro.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Sep 2019 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gVA/w0d2QWMzk0mJERhCeM6+8qnZiMPqI0NO/jhQ/j0=;
        b=cGy6tD1MRdVovih9rp/bCfOWWw14MpAMrP+XkmaHkV5XpsCX1VKcnoFuwLurkZkgqo
         mLI1DjGIq0yLEppfJPl5VsRuFPWP0JRNgXWA5YSKzrMphho4+Vt/Vnogl/bm6FLFX21e
         VMCk0VbY28C68hJLyqlmiqVtQjOpx6gQZvp33b/79YvORwxhU07ZpUxM79qMI5wlGzTH
         3x1ffVMm9Xzt1K8cySaIYJZOCWsyo0+Lnv8JT5HEUA4yFmf8oa7ueJSsAED3czogD83P
         Z1u7QyB0TNOM4yGNntYvv3ptx5cvynog6CXrjxwlq1UT9xd+dHvcT3TDVCkrqr2x/mDC
         4SiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gVA/w0d2QWMzk0mJERhCeM6+8qnZiMPqI0NO/jhQ/j0=;
        b=co7Aw4nrshLY2epJEJQQzf8yfHMyPxSH6TX/FxpUuiGCpcMq3O5bvTPCnDIiebZ+jo
         QZYanOcrlJBp9QZmwISjhAnOPo2I+nSIQg2fMbXhT3ORKoyhpwnYwiJK+Ep6B+tyrBFT
         WgQAqLd4J31Zc47maKMMgW+nffxx2zYm0ou4QF9Zx5GnKVQySsoePIZJlnRdWDoXh+vT
         f92jKStine/s41VMeBCiqkkofXK4nyQulcruvS80yZ5mwE/Zbv3d2tLGHTqtgo/f3iLk
         ZGMbYHuqtoSFlyE5w4iBhq835Nly8aOlyCdX6ZQI1L1KuzLTvZ0UjkYpWBGOhAyfbK+I
         Y++w==
X-Gm-Message-State: APjAAAX/j+AwNXVnTYCaYzsit0YjJVe9eKD5w1lvciQqnCMgrzdCJt80
        2FZopV5fSh4lSgIc0TPymlB4CWlY8HE=
X-Google-Smtp-Source: APXvYqxdeIvz1c0FbYOZg6KWon1O1Msr3Uir5+wivy4bKJ4u8iKLs+/H/e0udgdoUCQIpIGHeRpvdg==
X-Received: by 2002:adf:e292:: with SMTP id v18mr2942943wri.232.1569499521180;
        Thu, 26 Sep 2019 05:05:21 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id d193sm5289584wmd.0.2019.09.26.05.05.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 05:05:20 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     iommu@lists.linux-foundation.org, marijns95@gmail.com,
        agross@kernel.org, robdclark@gmail.com, joro@8bytes.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 2/6] iommu/qcom: Write TCR before TTBRs to fix ASID access behavior
Date:   Thu, 26 Sep 2019 14:05:12 +0200
Message-Id: <20190926120516.4981-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926120516.4981-1-kholk11@gmail.com>
References: <20190926120516.4981-1-kholk11@gmail.com>
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

