Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECDC616CD6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231494AbiKBSog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:44:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbiKBSoc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:44:32 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A52E2DA84
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:44:30 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id a15so26198782ljb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eS5/1V/GAZTj0wx1nC8lVRnmAA2hcBoZzSa5GaT0bcg=;
        b=mkzeI0++KNp/kYlwIEfDTUXnlsOVxNwO5PNKyBQRYh0q9OiEItamhw12rQktbfrzH9
         /Q1F9hyN6AtFyjc4REcS5WbUE/KQYxT47mW9071CbUWsk/t05LEuoJkWzJeCNEx/1A9Y
         70qrrCDqgAQS2kjRGugq21WSTmO8akUjZ34L+bv+LUNsSJ4llOthS+etmF7ZXjDFauxl
         +ks5o3lDNEf49dHEUQ14d7yfAn9HWRFII5FwPZnAKQcDbvOzBbpA/2V3F0stNvA7QsJs
         R0X1UkotQlEdliRhvTTYje3XtaOB8XuSbzjCAqtf+/WLqgUO3OVPrV0KMMJ5iDW9qcZL
         fIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eS5/1V/GAZTj0wx1nC8lVRnmAA2hcBoZzSa5GaT0bcg=;
        b=f6GQ2wu2owtloG8ci2j0rF4ENkrTGqaFwWANHo7ihPZ3HuSOh3TzwDK29ycqOF8td6
         3OLRWXZHG4EbzI0Y1RLIIB04nYUch7kBvh02Sa0neZHoSiC6I3pCaFkmUe4o9mxqAp9y
         GbDJzYePrhusVFz1KqMRwCob6DByrhU/8ih3jDEu90t5Eu9HkeGWJiL4KNHpXhWPYpKr
         tOc7Wg/wU+fnqjd5unAjaG6ieuZn4Zy0vLj7gEhoiz0EMDA19icTFOX09U8jMki1BrDP
         kO6B/2wVHxSPaZGH+WXhgRcUnpORq+pMOM3nhStlu6aQrceyL6a127sLXWSBPhDGVzFQ
         G8fg==
X-Gm-Message-State: ACrzQf0WLEFDOeO8ubaryTSKtmOwTBPEkdoWaeP25v5gNAxarFYWloOZ
        XL1/tLnY7gz/ZTcR3SoYQfJIEQ==
X-Google-Smtp-Source: AMsMyM6MjWgyZxZZlO7LmlheCpAMxtnjPNQyni1i/taASUiYWrlD/JIpbXnJx+RmY3f5Kf8xwaPjiA==
X-Received: by 2002:a2e:9208:0:b0:277:46da:16d2 with SMTP id k8-20020a2e9208000000b0027746da16d2mr8754366ljg.161.1667414668645;
        Wed, 02 Nov 2022 11:44:28 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:44:28 -0700 (PDT)
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
Subject: [RFC PATCH v2 09/11] iommu/arm-smmu-qcom: Merge table from arm-smmu-qcom-debug into match data
Date:   Wed,  2 Nov 2022 21:44:18 +0300
Message-Id: <20221102184420.534094-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
References: <20221102184420.534094-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is little point in having a separate match table in
arm-smmu-qcom-debug.c. Merge it into the main match data table in
arm-smmu-qcom.c

Note, this also enables debug support for sm6375 and ACPI-based sc8180x
systems, since these SoCs are expected to support tlb_sync debug.

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 91 -------------------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 46 +++++++---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    | 16 +++-
 3 files changed, 43 insertions(+), 110 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 6eed8e67a0ca..74e9ef2fd580 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -10,16 +10,6 @@
 #include "arm-smmu.h"
 #include "arm-smmu-qcom.h"
 
-enum qcom_smmu_impl_reg_offset {
-	QCOM_SMMU_TBU_PWR_STATUS,
-	QCOM_SMMU_STATS_SYNC_INV_TBU_ACK,
-	QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR,
-};
-
-struct qcom_smmu_config {
-	const u32 *reg_offset;
-};
-
 void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu)
 {
 	int ret;
@@ -59,84 +49,3 @@ void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu)
 			tbu_pwr_status, sync_inv_ack, sync_inv_progress);
 	}
 }
-
-/* Implementation Defined Register Space 0 register offsets */
-static const u32 qcom_smmu_impl0_reg_offset[] = {
-	[QCOM_SMMU_TBU_PWR_STATUS]		= 0x2204,
-	[QCOM_SMMU_STATS_SYNC_INV_TBU_ACK]	= 0x25dc,
-	[QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR]	= 0x2670,
-};
-
-static const struct qcom_smmu_config qcm2290_smmu_cfg = {
-	.reg_offset = qcom_smmu_impl0_reg_offset,
-};
-
-static const struct qcom_smmu_config sc7180_smmu_cfg = {
-	.reg_offset = qcom_smmu_impl0_reg_offset,
-};
-
-static const struct qcom_smmu_config sc7280_smmu_cfg = {
-	.reg_offset = qcom_smmu_impl0_reg_offset,
-};
-
-static const struct qcom_smmu_config sc8180x_smmu_cfg = {
-	.reg_offset = qcom_smmu_impl0_reg_offset,
-};
-
-static const struct qcom_smmu_config sc8280xp_smmu_cfg = {
-	.reg_offset = qcom_smmu_impl0_reg_offset,
-};
-
-static const struct qcom_smmu_config sm6125_smmu_cfg = {
-	.reg_offset = qcom_smmu_impl0_reg_offset,
-};
-
-static const struct qcom_smmu_config sm6350_smmu_cfg = {
-	.reg_offset = qcom_smmu_impl0_reg_offset,
-};
-
-static const struct qcom_smmu_config sm8150_smmu_cfg = {
-	.reg_offset = qcom_smmu_impl0_reg_offset,
-};
-
-static const struct qcom_smmu_config sm8250_smmu_cfg = {
-	.reg_offset = qcom_smmu_impl0_reg_offset,
-};
-
-static const struct qcom_smmu_config sm8350_smmu_cfg = {
-	.reg_offset = qcom_smmu_impl0_reg_offset,
-};
-
-static const struct qcom_smmu_config sm8450_smmu_cfg = {
-	.reg_offset = qcom_smmu_impl0_reg_offset,
-};
-
-static const struct of_device_id __maybe_unused qcom_smmu_impl_debug_match[] = {
-	{ .compatible = "qcom,msm8998-smmu-v2" },
-	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcm2290_smmu_cfg },
-	{ .compatible = "qcom,sc7180-smmu-500", .data = &sc7180_smmu_cfg },
-	{ .compatible = "qcom,sc7280-smmu-500", .data = &sc7280_smmu_cfg},
-	{ .compatible = "qcom,sc8180x-smmu-500", .data = &sc8180x_smmu_cfg },
-	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &sc8280xp_smmu_cfg },
-	{ .compatible = "qcom,sdm630-smmu-v2" },
-	{ .compatible = "qcom,sdm845-smmu-500" },
-	{ .compatible = "qcom,sm6125-smmu-500", .data = &sm6125_smmu_cfg},
-	{ .compatible = "qcom,sm6350-smmu-500", .data = &sm6350_smmu_cfg},
-	{ .compatible = "qcom,sm8150-smmu-500", .data = &sm8150_smmu_cfg },
-	{ .compatible = "qcom,sm8250-smmu-500", .data = &sm8250_smmu_cfg },
-	{ .compatible = "qcom,sm8350-smmu-500", .data = &sm8350_smmu_cfg },
-	{ .compatible = "qcom,sm8450-smmu-500", .data = &sm8450_smmu_cfg },
-	{ }
-};
-
-const void *qcom_smmu_impl_data(struct arm_smmu_device *smmu)
-{
-	const struct of_device_id *match;
-	const struct device_node *np = smmu->dev->of_node;
-
-	match = of_match_node(qcom_smmu_impl_debug_match, np);
-	if (!match)
-		return NULL;
-
-	return match->data;
-}
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 75bc770ccf8c..20cbb39cb670 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -430,11 +430,22 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 		return ERR_PTR(-ENOMEM);
 
 	qsmmu->smmu.impl = impl;
-	qsmmu->cfg = qcom_smmu_impl_data(smmu);
+	qsmmu->cfg = data->cfg;
 
 	return &qsmmu->smmu;
 }
 
+/* Implementation Defined Register Space 0 register offsets */
+static const u32 qcom_smmu_impl0_reg_offset[] = {
+	[QCOM_SMMU_TBU_PWR_STATUS]		= 0x2204,
+	[QCOM_SMMU_STATS_SYNC_INV_TBU_ACK]	= 0x25dc,
+	[QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR]	= 0x2670,
+};
+
+static const struct qcom_smmu_config qcom_smmu_impl0_cfg = {
+	.reg_offset = qcom_smmu_impl0_reg_offset,
+};
+
 /*
  * It is not yet possible to use MDP SMMU with the bypass quirk on the msm8996,
  * there are not enough context banks.
@@ -452,26 +463,33 @@ static const struct qcom_smmu_match_data qcom_smmu_data = {
 static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
 	.impl = &sdm845_smmu_500_impl,
 	/* No adreno impl, on sdm845 it is handled by separete sdm845-smmu-v2. */
+	/* No debug configuration */
+};
+
+static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
+	.impl = &qcom_smmu_impl,
+	.adreno_impl = &qcom_adreno_smmu_impl,
+	.cfg = &qcom_smmu_impl0_cfg,
 };
 
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
 	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
-	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ }
 };
 
@@ -492,7 +510,7 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 	if (np == NULL) {
 		/* Match platform for ACPI boot */
 		if (acpi_match_platform_list(qcom_acpi_platlist) >= 0)
-			return qcom_smmu_create(smmu, &qcom_smmu_data);
+			return qcom_smmu_create(smmu, &qcom_smmu_500_impl0_data);
 	}
 #endif
 
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 424d8d342ce0..593910567b88 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -14,20 +14,26 @@ struct qcom_smmu {
 	u32 stall_enabled;
 };
 
+enum qcom_smmu_impl_reg_offset {
+	QCOM_SMMU_TBU_PWR_STATUS,
+	QCOM_SMMU_STATS_SYNC_INV_TBU_ACK,
+	QCOM_SMMU_MMU2QSS_AND_SAFE_WAIT_CNTR,
+};
+
+struct qcom_smmu_config {
+	const u32 *reg_offset;
+};
+
 struct qcom_smmu_match_data {
+	const struct qcom_smmu_config *cfg;
 	const struct arm_smmu_impl *impl;
 	const struct arm_smmu_impl *adreno_impl;
 };
 
 #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
 void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu);
-const void *qcom_smmu_impl_data(struct arm_smmu_device *smmu);
 #else
 static inline void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu) { }
-static inline const void *qcom_smmu_impl_data(struct arm_smmu_device *smmu)
-{
-	return NULL;
-}
 #endif
 
 #endif /* _ARM_SMMU_QCOM_H */
-- 
2.35.1

