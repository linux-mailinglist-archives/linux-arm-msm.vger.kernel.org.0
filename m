Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E848607D09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 18:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiJUQ4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 12:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbiJUQ4W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 12:56:22 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FCD412790E
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:55:59 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id bs14so4503915ljb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cESQiHdnTIBG9AoCf3SijZknTaDBV8WJegnhlZwXYdY=;
        b=TgBkFDCMXFpDtFOQIEu8nOSiTQzWefdI/ODwEEsIMFOEO6iPOmYZKc5J2Y+1L8ncP+
         86h4bjuWBwjcLr9SgS2os0Etmyhe8FLyEptGRgoT2iQc/vA/e2aY1ENeakZydm5pMm9+
         nuZe5MylCFswqPcNRTSWOmjogoOdMddMUjQZw8+KvBisMSTKodJvznbD/VPFgWD/ibai
         +WIIuZesF1wt2i6LqwGdPTqyX/QqcHet4HPAOvV3Ntep+aEkg/yWIbNL8l1XSf15Uj/S
         IfTfu2eSCoz3SCNpV6nBjUADkzhEOXgopLRYBJ/55VQ/TYaILXARflOA0aZmy8jVlbIX
         TLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cESQiHdnTIBG9AoCf3SijZknTaDBV8WJegnhlZwXYdY=;
        b=Dohw03uzsgmw/ROS2MYsK7PF5f8oq9UF4bJYS0sez5W6XPAtYfh32Lb2/4HlXyq8tj
         UCoLQd1L7ZIBr2/Ustq4mUey5fhi10uXv1bHOaU1ygOqKxWP0zWAv33ki1yGx312Jouv
         +rIbarOxJ9pYgvdsg0D6MtjXmc+b1rTB0VaqopcCKInH1M3LaF6bZxmytAHLFJOCl2Um
         hUH1agU5pNsJQFnJdq8AXUOdz8IyMdLiqWyXx6Uh5n21fYSSHdi4RMM1b1FXyE5ndxCk
         lxdgRq5Pkrxf5dh+Y0oLI4uTVEPVhtu5fiSTiPib4PU7g6XxRdo/iST7bAf6FIz+UHS4
         HXnw==
X-Gm-Message-State: ACrzQf17XOkVV+gffLbea9WLvvzux2Mz3liJnM3Q0nCFTWrF2djn12xe
        YRX11A9VMXesZiI/AfyLtxnQMw==
X-Google-Smtp-Source: AMsMyM5DUaZ1nIBNqKtx8MK7zVdQGsmFOID0AgkzC4rdKD2wTXYy53ncTd07uHdvS0tlbGSbyLb3bQ==
X-Received: by 2002:a2e:9f12:0:b0:26e:8558:c6a5 with SMTP id u18-20020a2e9f12000000b0026e8558c6a5mr7334707ljk.135.1666371347744;
        Fri, 21 Oct 2022 09:55:47 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a056512078400b004946e72711bsm3218532lfr.76.2022.10.21.09.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:55:47 -0700 (PDT)
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
Subject: [RFC PATCH 7/9] iommu/arm-smmu-qcom: Merge table from arm-smmu-qcom-debug into match data
Date:   Fri, 21 Oct 2022 19:55:32 +0300
Message-Id: <20221021165534.2334329-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
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

