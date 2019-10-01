Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A98FBC3998
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 17:56:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727402AbfJAP4x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 11:56:53 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37727 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbfJAP4x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 11:56:53 -0400
Received: by mail-wm1-f68.google.com with SMTP id f22so3837010wmc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Oct 2019 08:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xSQ3Gd/I78crTYWoKFJLF2LHykp/l0XNK/1ec4ayqbI=;
        b=V1vQ89R/Kqditgwc5pKk80fE3GZCa1M2VMFrKsoiHVsSFzdubkBC1dSY7cp+F+4CnG
         yx4S5GcUUx4RCfC/He6n3wJO/TBKg+4Fbfw+DYfxdIXNIsjTMb79xbXGBsY1CApbJ73e
         B7fL9Kmxgv7T9BrBuHV8WHnFMhdEanjkFF9lvqpzD+6vEXsVCEWZ6UAmnL/448APy6/s
         o2EurwEEHTBGAhKdcpAZaJ5NFX5zZ/pSY7CH5Q5XOJPr6k0Tgkl41hrpBRkMD3Z5AxWv
         bOYrdDUvbswO1RIwb4KyP7VVipZyURCrTj6MBgh/g2AmvzD6QFiy0ImJORliolT+hx8j
         +RVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xSQ3Gd/I78crTYWoKFJLF2LHykp/l0XNK/1ec4ayqbI=;
        b=lrxaqOBlnSHulUYLrv+kyBQOB0kUmXtZRtPPxcabTbd7Ssm1mkKuJzZS94KuFK4LF4
         AY7usH8WMiRtBy6vd/EL65HW4k5G+aIKEwN6Xf21jYZ+nKEM102erLQiZghl3xmhoUrK
         JEk7kOTAISK4l1PmVrWutYwJjr0uLYxbrqtg6UNpZHqajiptJLmgMIlcmmrTmvY9hscB
         iq0p7YKxvoxAFPQEPo0SC//G4h9rilpiGKkljZyS3Ll4dKfuzS2Nn0WazIZ4yVWrGrCy
         99/hS70aYczL8SEY+jAPyXbsUqc4ZANkf45GmB665HYW1bLHPVO5L2Js0AGmT5KC0u9J
         9R1A==
X-Gm-Message-State: APjAAAUT0aRckfMSBEgpJfUzoY6t4Kaf52pU3haZj6P9F/coELC4Z2qK
        mTzCYFAbtgUZ4F+EbsqpfLAoY6Zi34j1kg==
X-Google-Smtp-Source: APXvYqwzXz9dBSJ6C4W1d7sa97hjPnTKpVydssMEIdV2ySVhM7Ui5kvvVHIhHD6bkb2OOpa+uWFoqA==
X-Received: by 2002:a05:600c:24d1:: with SMTP id 17mr4341973wmu.104.1569945411253;
        Tue, 01 Oct 2019 08:56:51 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id h63sm6209136wmf.15.2019.10.01.08.56.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 08:56:50 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, iommu@lists.linux-foundation.org,
        marijns95@gmail.com, agross@kernel.org, robdclark@gmail.com,
        joro@8bytes.org
Subject: [PATCH v3 3/7] iommu/qcom: Write TCR before TTBRs to fix ASID access behavior
Date:   Tue,  1 Oct 2019 17:56:37 +0200
Message-Id: <20191001155641.37117-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001155641.37117-1-kholk11@gmail.com>
References: <20191001155641.37117-1-kholk11@gmail.com>
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

