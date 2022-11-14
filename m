Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 162E1628692
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 18:06:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238115AbiKNRGt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 12:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238152AbiKNRGr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 12:06:47 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9993A2D74E
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:44 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id g12so20374675lfh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3H2jzBKRf3N6Ll1FXT6iR1iUypo5j1F1+ZbcfadNwHs=;
        b=FX1alPdHiCGAK3ABSyU+dmJM/GQdYxZLOwr0Fur4w97BwDbLLLMaUHgLzgMl7kV5Br
         XMspVZuHwkpBtRUKUAKMSzvhzCYAxwj41+4atuTmU5NELu6MtzcUhy2uS3Pmy8iirwMd
         nCxVwdBlwOElowvLmU/5zvzTNFubLalRJvRVIue1otrYZ38pAUC56srIE5fSYOswAR1T
         dYGmn1yaK4f5mJFw63N5dNQXo6ODazPn+uzs1RtM7teo3PqqrylbdhoYYX9g8n50g7QL
         +UPd08aDhAjPYwYEu+t2SIBM1JLlRizsV9SatGsXNNeOLUAxkjzQaNl0n6cx8jarjFM4
         CrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3H2jzBKRf3N6Ll1FXT6iR1iUypo5j1F1+ZbcfadNwHs=;
        b=PecOw8uCmkryzUGeBkXrnmchJn5Hm6su1aNBk9zA19+ClEEbRDgv4YmuovVwnS4Uhi
         EXu4UYp0tLndcxcTCLsJePFdAznP8y1EsYdOxXs4AZEWu0SO8vLfSNQ8j+uyvx7gdbC9
         h65d+VlGp5YbpsNCczRXb/WJ4PL1LM+SSZjw8A9LmN5jcRIu9U03409ZL+IqA0mGwVtu
         B4Dbq8WL0bCAEht0Y+DPl3HWkbh+aICStl/m3aNZFIYG0HeMumSwEZRVlMAOsOxuIkIS
         Adu6UTDoLDvqPBgWwbMsKmZw5EFKM2XV1VR9EAVLRg+0KRe9BC0fNV7hsJ+qIBcM1k+5
         SdRQ==
X-Gm-Message-State: ANoB5plDL816WZMs5t+yT1Y32wyBwit5UDPaJT/GybDruIg3c1uvuY8U
        XS7Km9s7HF1MheWNMOtww2X0fg==
X-Google-Smtp-Source: AA0mqf4Co76tOrNs1fJ5JrpDDeCwCtyXS/KcwT8PNjTKrrZzi6rZlLQv5lR0A6i1nuiilVU76AJEIA==
X-Received: by 2002:a19:911a:0:b0:4a2:7e2a:d2e1 with SMTP id t26-20020a19911a000000b004a27e2ad2e1mr5014777lfd.641.1668445602903;
        Mon, 14 Nov 2022 09:06:42 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 09:06:42 -0800 (PST)
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
Subject: [PATCH v1 08/10] iommu/arm-smmu-qcom: Merge table from arm-smmu-qcom-debug into match data
Date:   Mon, 14 Nov 2022 20:06:33 +0300
Message-Id: <20221114170635.1406534-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
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

Note, this also enables debug support for qdu1000, sm6115, sm6375 and
ACPI-based sc8180x systems, since these SoCs are expected to support
tlb_sync debug.

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../iommu/arm/arm-smmu/arm-smmu-qcom-debug.c  | 91 -------------------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 50 ++++++----
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h    | 16 +++-
 3 files changed, 45 insertions(+), 112 deletions(-)

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
index 6dc7fa918799..1843bcd81402 100644
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
@@ -455,28 +466,35 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
 	 * No need for adreno impl here. On sdm845 the Adreno SMMU is handled
 	 * by the separate sdm845-smmu-v2 device.
 	 */
+	/* Also no debug configuration. */
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
-	{ .compatible = "qcom,qdu1000-smmu-500", .data = &qcom_smmu_data  },
-	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,qdu1000-smmu-500", .data = &qcom_smmu_500_impl0_data  },
+	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
-	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
+	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ }
 };
 
@@ -497,7 +515,7 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
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

