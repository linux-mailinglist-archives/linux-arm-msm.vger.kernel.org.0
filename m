Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C9FD616CCC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbiKBSoc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231519AbiKBSo3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:44:29 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3472D1D3
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:44:28 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p8so29607914lfu.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJC177DkC5zjDb//RixgxqsIIGO8K8xkt6ZHUyljVqY=;
        b=y+NGkDxs49tj6XpgyGvVX/WzxDlBM4tu0Ac+AbzPSdp2j6eY4VozZ3Y6GeIcCuxju2
         i+7pyxT5PINLDCiekeWI/AEEF/tetpKLHSWA7wvSnRbloXrqsHwcgeqZ443WfHFDi9v5
         HEBp8n4ZN45RAs+yicDTRTh+2c02e+cvmbolzua/0FOC+SI7za9ogxdMsHH2J6i4UcUB
         veUUAKaxj72+39wXrT/PGpJQLjFS5HOkU36OfIq9nLs/JlXyj1+isjhElmALh+LP8QZ8
         3WupDdnfsSetHHWDKmUgQyzQniHkOWlO+hBwvjS1GJZqbvXTM4uL9erWsX7FtpC1yldq
         3sNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nJC177DkC5zjDb//RixgxqsIIGO8K8xkt6ZHUyljVqY=;
        b=qZ55vyIQrFgVzRH1ovMTUVr92oIeOWRMxeRiqJlgXEv18xfeX+1no4vJ9ZNwzFGdQj
         40Btm5cQukUvNhEI9ByHzyj2dM0qSkpU1PqRkpNAjdSLNzaues7mfIpddqfkJuD5ijS/
         XdDFTq5LlBrMJ7hBQF3y2o5lQQ8KQXVk0ncN1c7UiMqVGF2luAe/SzYcIMoU5de7lmLz
         0onrXXyWtfQe9wgC9H3Gd8TfClgeGp7ZrXY7mjCcnZpvif5lDvYAdn3yOYsnOT3b3KTn
         xOKFGgG8eDtwUh1/xlDSSnXXNbqGJ4Pg5ICId/8SChJGJgVWvaCP7v5iUZrKF21BgfFk
         WTCg==
X-Gm-Message-State: ACrzQf1NPn4wIfjBnUBIdsUwax9nUn+/XukwKZpP4Pl192rYnL1bbCOn
        6mOmOPpyOSTvW/LgSiTtZkFBEA==
X-Google-Smtp-Source: AMsMyM5uQXHsV1EJpGa4+IpbKNmYP35Ees33+t5hFPJX1bIoW4QnMZPIUI8SMyD2nXveFDwlr5aUVw==
X-Received: by 2002:a05:6512:398d:b0:4a2:7d72:8629 with SMTP id j13-20020a056512398d00b004a27d728629mr9458708lfu.445.1667414667837;
        Wed, 02 Nov 2022 11:44:27 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:44:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Vinod Koul <vkoul@kernel.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH v2 08/11] iommu/arm-smmu-qcom: provide separate implementation for SDM845-smmu-500
Date:   Wed,  2 Nov 2022 21:44:17 +0300
Message-Id: <20221102184420.534094-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is only one platform, which needs special care in the reset
function, the SDM845. Add special handler for sdm845 and drop the
qcom_smmu500_reset() function.

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 34 ++++++++++++----------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index c3bcd6eb2f42..75bc770ccf8c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -361,6 +361,8 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 {
 	int ret;
 
+	arm_mmu500_reset(smmu);
+
 	/*
 	 * To address performance degradation in non-real time clients,
 	 * such as USB and UFS, turn off wait-for-safe on sdm845 based boards,
@@ -374,23 +376,20 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 	return ret;
 }
 
-static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
-{
-	const struct device_node *np = smmu->dev->of_node;
-
-	arm_mmu500_reset(smmu);
-
-	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500"))
-		return qcom_sdm845_smmu500_reset(smmu);
-
-	return 0;
-}
-
 static const struct arm_smmu_impl qcom_smmu_impl = {
 	.init_context = qcom_smmu_init_context,
 	.cfg_probe = qcom_smmu_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
-	.reset = qcom_smmu500_reset,
+	.reset = arm_mmu500_reset,
+	.write_s2cr = qcom_smmu_write_s2cr,
+	.tlb_sync = qcom_smmu_tlb_sync,
+};
+
+static const struct arm_smmu_impl sdm845_smmu_500_impl = {
+	.init_context = qcom_smmu_init_context,
+	.cfg_probe = qcom_smmu_cfg_probe,
+	.def_domain_type = qcom_smmu_def_domain_type,
+	.reset = qcom_sdm845_smmu500_reset,
 	.write_s2cr = qcom_smmu_write_s2cr,
 	.tlb_sync = qcom_smmu_tlb_sync,
 };
@@ -398,7 +397,7 @@ static const struct arm_smmu_impl qcom_smmu_impl = {
 static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
 	.init_context = qcom_adreno_smmu_init_context,
 	.def_domain_type = qcom_smmu_def_domain_type,
-	.reset = qcom_smmu500_reset,
+	.reset = arm_mmu500_reset,
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
@@ -450,6 +449,11 @@ static const struct qcom_smmu_match_data qcom_smmu_data = {
 	.adreno_impl = &qcom_adreno_smmu_impl,
 };
 
+static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
+	.impl = &sdm845_smmu_500_impl,
+	/* No adreno impl, on sdm845 it is handled by separete sdm845-smmu-v2. */
+};
+
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
 	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
@@ -460,7 +464,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sdm845-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
 	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_data },
-- 
2.35.1

