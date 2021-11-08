Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46284449A8A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 18:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239564AbhKHRPM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 12:15:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbhKHRPM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 12:15:12 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF503C061570;
        Mon,  8 Nov 2021 09:12:27 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id e65so15720483pgc.5;
        Mon, 08 Nov 2021 09:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hGvO+FT4c2EJbxVYCDLmWLN/y9tCrxnSNXxEMsXuwNQ=;
        b=PEXo9EJ8iyOs6JYtLc/77yuf3gv2+qmOaRxZ/t9gKovlJPftYz0nG0N+vgAMQrzQ4i
         kNkOdJBlkeE/hZ6MODTHJLLrwXgvJnT/K6EX0chnqcK2yGVtopLE3UZg2leAGvZbl3LN
         64kttVS3G4UKARK1dMYKiUjOGmY8M4KlUB4uGdl56x8atLwBvciap3B2qM5Ve4ah0rbR
         JHeHvQRBp6QyA02S3Ok6G2ObBMX0tOjwcBU/elZbj5iChuMAeeb29F1iO9YXCuDr0WmS
         3dA5OVsnzNLM6MuM5kv8tGGk+wI0/n1LaF7IdCi20tMea79itbKo6koYALO1VLXF6R48
         n96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hGvO+FT4c2EJbxVYCDLmWLN/y9tCrxnSNXxEMsXuwNQ=;
        b=H8v7jyuw9MKhekIH4jq8NfangMFWKBExjcFrYsO75Mmv0ZiG0TmJqyJbRbE5FLqcAx
         liRaCriFtYVD2W041QstEfQ+728WzEPeN5lMibGjEQqMVbxalbFPXB78Uj/pyh37nPm3
         278UlEmF5KaPTkPHSpOCh8yZAuTISx8D7qWoAHINQQlZAvWteXOPKCQ9tSi9kGPa6e4u
         gbmY7LzKbCX152oCAZFzihl5gEU5y2wJgG+VjgcZTFb6BHf//5ywRotXbM9530xJ6RuA
         h1z5kyRlMyG8NrOXnQ6NUC6iAujl3NEGNIrJXeD0tmcXgVval07O+9pR7EChBGmSyfBx
         YaWA==
X-Gm-Message-State: AOAM531Wg5CibJh5lX3PSfgS/RpLPEAMoV+FPdG9GaM6ZVQM7L1tkTKI
        hYsFCkbzrRxZ+xHeSiOTsUhzYdle7v4=
X-Google-Smtp-Source: ABdhPJzliYBpPaMk022dk/QMrNH7Vg6W2agrDSJIDzTqNmxTzHAPQJOF1S2MqpYK5Ecosi0pxfxalA==
X-Received: by 2002:a62:5ec2:0:b0:44d:47e2:4b3b with SMTP id s185-20020a625ec2000000b0044d47e24b3bmr82851281pfb.38.1636391547336;
        Mon, 08 Nov 2021 09:12:27 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id p16sm12810610pgd.78.2021.11.08.09.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 09:12:26 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iommu/arm-smmu-qcom: Fix TTBR0 read
Date:   Mon,  8 Nov 2021 09:17:23 -0800
Message-Id: <20211108171724.470973-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

It is a 64b register, lets not lose the upper bits.

Fixes: ab5df7b953d8 ("iommu/arm-smmu-qcom: Add an adreno-smmu-priv callback to get pagefault info")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 55690af1b25d..c998960495b4 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -51,7 +51,7 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
 	info->far = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_FAR);
 	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
-	info->ttbr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
+	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
 	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
 }
 
-- 
2.31.1

