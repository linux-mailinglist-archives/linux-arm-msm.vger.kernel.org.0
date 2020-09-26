Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93998279947
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727499AbgIZNAN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:00:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729093AbgIZNAL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:00:11 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8616C0613D3;
        Sat, 26 Sep 2020 06:00:10 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id j2so6855239wrx.7;
        Sat, 26 Sep 2020 06:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eMld5gY+2zvkyoWP4cdMGVU0dV27KoJaLDxKtwGwGLw=;
        b=tiXXJpYzUvhrdD8vLBz52cA1Xryg8QnRxF5Vvj4CD1UYFpJ4gZWwfHjbOH0/uyRx0D
         O/B7N0jLT5yTYDayB0yrr4euzD6DCYo2RtRckWk92nl0NfWWgd5oBcXkUGcCf3yVJjNj
         /MfY7ARJVFg7jA7rtFTEcLk3YgBbSlLDjd+7jBZpzQJ68Fn8a2Vi9/f5nYoh9KMkY/kb
         Zok5LC+yYrfRDDwkkAJs5UuHprRkl5Aljt1EgY5qcV/cy/4WxLq0a8by1TCjSh6aevuz
         76hCDNiN+0giaPfjnHlb9yHR3mafxv7ebw9bdA+Dq8CbfD1HC3QDqTCK7jzrCo2Ga7Vl
         GnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eMld5gY+2zvkyoWP4cdMGVU0dV27KoJaLDxKtwGwGLw=;
        b=OHOMANjQlS22eEPOgbwZqaMJps0lU3Sep1bzAQjL/TlhQwY3cfWm9D63TKnvmpIF5a
         G11N0hxrz+qpHYYiNzYdZGy+7G6W/DxIfFp0FWKuDvnDpqyKTtG+0vn+ec7nI9jTCe3I
         mYtuzEstVPeODUw44ykEIgb/eQR+3HSFyWEK07SzRQghGxQAwp86jGXQkzG1sJ3vUUig
         4KdhmKHfAPDXbvzb1/LT4JATmqtsAJibzOHVGsDF/oVwEEACRvZCvJull6grsyuKKtw5
         mpkc2b8iUrTReDNe3raZRLTy8M/35mmUG00YwusmNkP9MUd5Y3fWIl4LTgnpYdIZM6vE
         IooQ==
X-Gm-Message-State: AOAM530RyzOYsoIuJois0EIetJ+AULdXX6KlNrv0GrHNSYiwu7XGnRDx
        punm9spteCxu+dIREV0tGXQ=
X-Google-Smtp-Source: ABdhPJyX9Pl2HPvTtJFa+EQBU2CcFjI2zDkLLJXHjvlXOdf/yDfQGadlMN2YIudnBdFmBttCOlnnCg==
X-Received: by 2002:adf:c3cc:: with SMTP id d12mr9607388wrg.399.1601125209518;
        Sat, 26 Sep 2020 06:00:09 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id b11sm6462896wrt.38.2020.09.26.06.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:00:09 -0700 (PDT)
From:   kholk11@gmail.com
To:     will@kernel.org
Cc:     robin.murphy@arm.com, joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] iommu/arm-smmu-qcom: Rename qcom_smmu_impl to qcom_smmu500_impl
Date:   Sat, 26 Sep 2020 14:59:57 +0200
Message-Id: <20200926130004.13528-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130004.13528-1-kholk11@gmail.com>
References: <20200926130004.13528-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Rename qcom_smmu_impl to qcom_smmu500_impl, as it refers only to the
MMU-500 in Qualcomm SoCs, in preparation for adding implementation
details for ones having SMMUv2.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index be4318044f96..7859fd0db22a 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -60,7 +60,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
 	return 0;
 }
 
-static const struct arm_smmu_impl qcom_smmu_impl = {
+static const struct arm_smmu_impl qcom_smmu500_impl = {
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = qcom_smmu500_reset,
 };
@@ -75,7 +75,7 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 
 	qsmmu->smmu = *smmu;
 
-	qsmmu->smmu.impl = &qcom_smmu_impl;
+	qsmmu->smmu.impl = &qcom_smmu500_impl;
 	devm_kfree(smmu->dev, smmu);
 
 	return &qsmmu->smmu;
-- 
2.28.0

