Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8E03279949
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 15:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729283AbgIZNAO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 09:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728466AbgIZNAM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 09:00:12 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F39DDC0613D4;
        Sat, 26 Sep 2020 06:00:11 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id m6so6910440wrn.0;
        Sat, 26 Sep 2020 06:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bY8xzUZwfiRgG++8UhbUZ4PhMonRbvfxxs1/C1VhNr8=;
        b=bh7kQkJwX2m931m/aoB/kEq4oBF/pUu4FaDCgI1FK44ZubMuxK8CfmGFL2NtcUaa4g
         4jorXQKRCP3vcizvjaFTUCq8GEvfZdiPQ1qqEGcewDwl3NB+DTBN6fJm3jiZq0zSc0p5
         +mhGTmRvvtT6T9Fua4KpcGCTS+8y69RKs2/9cCsAMivHwFHUl+4RPoBTzeeP68vav2BQ
         e6Nd+2DO9dnIiksFJ7+S7UJEJuuduiic1yT3YG0ItIyrNzBVbuaJUeSdyCXEoZmflDhM
         k5p8XCyrT9ajdJOyXOlSzThp4PVmk9NWuO3zkYKnNAWymwRa5CapmPc54KF0dVFikUja
         BFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bY8xzUZwfiRgG++8UhbUZ4PhMonRbvfxxs1/C1VhNr8=;
        b=Hy+l16mecyjyM3mlkRaEoLgBsCWBGsX8E/MSpPlc7T0kB8pi3SvqxQ3dFZb1QXqSyA
         5mnjyrzbW4j2VzVkcSi7Fu6krvOaPjGBuZA18tT4UDJCRRWDMQWKfQj3BHv+H2Xh/QAB
         NwGYcTXq1qZFyoDKVC+fIMZcH5h3vwBlKMbQrFLOnq2XErofzyvyvVGbfUQBWFOwX5Nq
         PohRzs/XO6AGtyVA7YhXavfTzlEIfBLqXL1uQSelTTX0nicxmmrXJoCdBENH4rmpctSh
         x5LSNwOv4bqpjyNiHB0Ja81oWM3Lg1h8rT4djVmfHrY4qWjrVmoUZ4cxYkh3YZDr2A5Y
         wiTw==
X-Gm-Message-State: AOAM530VIBlxatZ/2ZPuzRf6cex9bTwIjyIJrS+moojrEQEQXb7mGqYO
        VJu9ZdvExOQM8J7TdSkAJN8PPHljwQkHAw==
X-Google-Smtp-Source: ABdhPJyVK04EKr7pFq0l3qQczUszF+ln+iNUYNkyLlGdTas05FXQL/BmnqnjiRQDIhHluJ1TDk4wnA==
X-Received: by 2002:adf:b306:: with SMTP id j6mr9052769wrd.279.1601125210585;
        Sat, 26 Sep 2020 06:00:10 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id b11sm6462896wrt.38.2020.09.26.06.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:00:10 -0700 (PDT)
From:   kholk11@gmail.com
To:     will@kernel.org
Cc:     robin.murphy@arm.com, joro@8bytes.org, bjorn.andersson@linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] iommu/arm-smmu-qcom: Add QC SMMUv2 VA Size quirk for SDM660
Date:   Sat, 26 Sep 2020 14:59:58 +0200
Message-Id: <20200926130004.13528-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926130004.13528-1-kholk11@gmail.com>
References: <20200926130004.13528-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Some IOMMUs are getting set-up for Shared Virtual Address, but:
1. They are secured by the Hypervisor, so any configuration
   change will generate a hyp-fault and crash the system
2. This 39-bits Virtual Address size deviates from the ARM
   System MMU Architecture specification for SMMUv2, hence
   it is non-standard. In this case, the only way to keep the
   IOMMU as the firmware did configure it, is to hardcode a
   maximum VA size of 39 bits (because of point 1).

This gives the need to add implementation details bits for
at least some of the SoCs having this kind of configuration,
which are at least SDM630, SDM636 and SDM660.

These implementation details will be enabled on finding the
qcom,sdm660-smmu-v2 compatible.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  3 ++-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 31 +++++++++++++++++++++-
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index f4ff124a1967..9d753f8af2cc 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -216,7 +216,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 	if (of_device_is_compatible(np, "nvidia,tegra194-smmu"))
 		return nvidia_smmu_impl_init(smmu);
 
-	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
+	if (of_device_is_compatible(np, "qcom,sdm660-smmu-v2") ||
+	    of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
 	    of_device_is_compatible(np, "qcom,sc7180-smmu-500") ||
 	    of_device_is_compatible(np, "qcom,sm8150-smmu-500") ||
 	    of_device_is_compatible(np, "qcom,sm8250-smmu-500"))
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 7859fd0db22a..f5bbfe86ef30 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -65,8 +65,33 @@ static const struct arm_smmu_impl qcom_smmu500_impl = {
 	.reset = qcom_smmu500_reset,
 };
 
+static int qcom_smmuv2_cfg_probe(struct arm_smmu_device *smmu)
+{
+	/*
+	 * Some IOMMUs are getting set-up for Shared Virtual Address, but:
+	 * 1. They are secured by the Hypervisor, so any configuration
+	 *    change will generate a hyp-fault and crash the system
+	 * 2. This 39-bits Virtual Address size deviates from the ARM
+	 *    System MMU Architecture specification for SMMUv2, hence
+	 *    it is non-standard. In this case, the only way to keep the
+	 *    IOMMU as the firmware did configure it, is to hardcode a
+	 *    maximum VA size of 39 bits (because of point 1).
+	 */
+	if (smmu->va_size > 39UL)
+		dev_notice(smmu->dev,
+			   "\tenabling workaround for QCOM SMMUv2 VA size\n");
+	smmu->va_size = min(smmu->va_size, 39UL);
+
+	return 0;
+}
+
+static const struct arm_smmu_impl qcom_smmuv2_impl = {
+	.cfg_probe = qcom_smmuv2_cfg_probe,
+};
+
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
+	const struct device_node *np = smmu->dev->of_node;
 	struct qcom_smmu *qsmmu;
 
 	qsmmu = devm_kzalloc(smmu->dev, sizeof(*qsmmu), GFP_KERNEL);
@@ -75,7 +100,11 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 
 	qsmmu->smmu = *smmu;
 
-	qsmmu->smmu.impl = &qcom_smmu500_impl;
+	if (of_device_is_compatible(np, "qcom,sdm660-smmu-v2")) {
+		qsmmu->smmu.impl = &qcom_smmuv2_impl;
+	} else {
+		qsmmu->smmu.impl = &qcom_smmu500_impl;
+	}
 	devm_kfree(smmu->dev, smmu);
 
 	return &qsmmu->smmu;
-- 
2.28.0

