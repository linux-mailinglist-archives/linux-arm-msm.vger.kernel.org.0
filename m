Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C636C435F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2019 00:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbfJAWCO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 18:02:14 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39587 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727701AbfJAWCN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 18:02:13 -0400
Received: by mail-wr1-f66.google.com with SMTP id r3so17300564wrj.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 15:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xSQ3Gd/I78crTYWoKFJLF2LHykp/l0XNK/1ec4ayqbI=;
        b=t249MXs++5WyIF3X50Nkg/LnfbT6WM1mHZpRGivgeImeFlsqtd6GwDxawpSD0sFfoZ
         D2r6fOGps5fUNtZscW/c2jyOBVjUM0QdgwVaLKJu2HFRHcwyEx2SZoHgK7rkNMzaK5J9
         tRLCzMgd7b6rh3Iw49RxI7sps2fJ6nfUQtj0UFja2TrZKExyiFkyrO28b9eGORbToX96
         1iyZtGkPIpwbrohedj1RX80zf/pbAsT6HS9z8ahOuK67QUdP5rA3fVl5hy9J0Utnd0SZ
         bLKbexglc8AZFn9R/bIVREpe48hx4wLZ4D6+FPDtVieJ4Re6wHg+hDNojNVDoxd2cDLB
         84MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xSQ3Gd/I78crTYWoKFJLF2LHykp/l0XNK/1ec4ayqbI=;
        b=eBmnhWi/8TabMiG5JrKFcUFiZBsimKfITgDqllWnAKeXXzoFcPvB53USDxz8YhdzEH
         GWkfwW+To334u7piAxEsHtDgsOljAKq4lUR5qdg9Pw+5/NPkKlz+Jfm2udPblZJr89Pi
         yhizAMjznX0ZhRvJCcFpSkPHSmd5lBl/ORaMbyZpgMGix8ZiGep5nSx97QcFB21/7ytt
         QrYo3ClA2UmGXncp1TCJN/z65qZQ8n8mY0gsQHtvLTyn5QgNFWwjuEJPth/C7LIRlums
         6w5mjZtxSY2xF0/aN9liTvpJ7cfqJB6IY0b55lY2mJzGWbi9kEssygPoTyX+iGI7z+3Y
         /qhQ==
X-Gm-Message-State: APjAAAXsWFfWPvApn5bLP+lLazCzVbdR8MLLpBQnIWulziD4xaMPPfrq
        nN5536ckref0NUyy82xYIgcEUN0T0/T9Ew==
X-Google-Smtp-Source: APXvYqy1rskAcZSc9NovPC2LsJevqHjabSz0LpyN/SnQGRbcaQZj1rMNs2D0coMhRjTTbYPo3Ie7pQ==
X-Received: by 2002:adf:a415:: with SMTP id d21mr18413810wra.94.1569967331329;
        Tue, 01 Oct 2019 15:02:11 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id v16sm21811219wrt.12.2019.10.01.15.02.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 15:02:10 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v4 3/7] iommu/qcom: Write TCR before TTBRs to fix ASID access behavior
Date:   Wed,  2 Oct 2019 00:02:01 +0200
Message-Id: <20191001220205.6423-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001220205.6423-1-kholk11@gmail.com>
References: <20191001220205.6423-1-kholk11@gmail.com>
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
index 504ca69adc5a..c8957ec83b92 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -267,6 +267,13 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
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
@@ -275,13 +282,6 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
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

