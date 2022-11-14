Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5932F62868B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 18:06:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238116AbiKNRGq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 12:06:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238147AbiKNRGp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 12:06:45 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229762D1E0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:44 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id d20so14025135ljc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJsRikfnRLu3deSYcn++faXtckS1l23BHpGOU9UhFWw=;
        b=GWHy4EgGCogdO6+XalHTr/JlYtU9YsfE78OjNxgdyVFNklPvYOa9xhjg/8ENMkX5zf
         R3DPxdSr4KOgY9pUaG9OoJTVw9CgmcQggYSb6E5p2Tqo9WI4ab9xHynS+5bCmI40Zgdh
         RwYUTBAad/OfjXusjtPzfkAz4t0JSqdKb3OoIJVI/hG8rqPl5Dwdq1QAkJAXZlq27wBS
         Lo7/aUvFG2gWSpYbCgRhAEFZ4+++fU7uc+5tlWM2oa3xbY4yQv25d9fQus1MXyyF6VwX
         lKqOm0Kqjw8QOtaaacZuAxevF11gWo4xeTxNrf3mNu0OMAWR2rTFC7si203wYDiJ4x91
         X8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJsRikfnRLu3deSYcn++faXtckS1l23BHpGOU9UhFWw=;
        b=hU0vOvH2RlPb7+zGSW0+1GhMZFlXRzjAMqo65pC101LqYsaqHyLLJdQJB27zwbby61
         4zbNr+SG0nkkC85pzjChMZH/BkY5YZrVs2J7mm26OWjZ4g8W+2fxva9nlUmuDk2WIyfI
         EELN9RtwMZL7yzgs6+vS3rANvEeUncnaZ5vUHYktgFomQ2jjiqox29HFzz+BToou6IoT
         O6PkvMIfFiwczYOK2KHDN/q/BzGtJ0p+xRdrB+BpcRrjnEXFoDRZ04onONNtHh8wx6Nz
         JcoBNqhv1IQmLmUfVJPb90WHmRiyAdvX7AfaG/eYpjecYbzGOtpPXoC1s5spCvRRATLx
         kdEQ==
X-Gm-Message-State: ANoB5plyKRTMpJ5VACpbL6QXNCaKCF/Tgfzll3O2KCDkjA7H0tnvfDRY
        J3ZQ0jJ/K6F5pz17zFmTQfX4rA==
X-Google-Smtp-Source: AA0mqf7nacmK4UzsEft4cZKZK7CgZH40eDj+79SSh03+6+cCBR1tlhnS1LACye67NZhI7TD6We5EtQ==
X-Received: by 2002:a2e:54f:0:b0:26f:a90a:fd82 with SMTP id 76-20020a2e054f000000b0026fa90afd82mr4813022ljf.248.1668445603674;
        Mon, 14 Nov 2022 09:06:43 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 09:06:43 -0800 (PST)
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
Subject: [PATCH v1 09/10] iommu/arm-smmu-qcom: Stop using mmu500 reset for v2 MMUs
Date:   Mon, 14 Nov 2022 20:06:34 +0300
Message-Id: <20221114170635.1406534-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
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

The arm_mmu500_reset() writes into registers specific for MMU500. For
the generic ARM SMMU v2 these registers (sACR) are defined as
'implementation defined'. Downstream Qualcomm driver for SMMUv2 doesn't
touch them.

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 41 ++++++++++++++++------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 1843bcd81402..b93aaa0594d3 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -376,7 +376,15 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 	return ret;
 }
 
-static const struct arm_smmu_impl qcom_smmu_impl = {
+static const struct arm_smmu_impl qcom_smmu_v2_impl = {
+	.init_context = qcom_smmu_init_context,
+	.cfg_probe = qcom_smmu_cfg_probe,
+	.def_domain_type = qcom_smmu_def_domain_type,
+	.write_s2cr = qcom_smmu_write_s2cr,
+	.tlb_sync = qcom_smmu_tlb_sync,
+};
+
+static const struct arm_smmu_impl qcom_smmu_500_impl = {
 	.init_context = qcom_smmu_init_context,
 	.cfg_probe = qcom_smmu_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
@@ -394,7 +402,15 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
 	.tlb_sync = qcom_smmu_tlb_sync,
 };
 
-static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
+static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
+	.init_context = qcom_adreno_smmu_init_context,
+	.def_domain_type = qcom_smmu_def_domain_type,
+	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
+	.write_sctlr = qcom_adreno_smmu_write_sctlr,
+	.tlb_sync = qcom_smmu_tlb_sync,
+};
+
+static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.init_context = qcom_adreno_smmu_init_context,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = arm_mmu500_reset,
@@ -452,12 +468,17 @@ static const struct qcom_smmu_config qcom_smmu_impl0_cfg = {
  */
 static const struct qcom_smmu_match_data msm8996_smmu_data = {
 	.impl = NULL,
-	.adreno_impl = &qcom_adreno_smmu_impl,
+	.adreno_impl = &qcom_adreno_smmu_v2_impl,
+};
+
+static const struct qcom_smmu_match_data qcom_smmu_v2_data = {
+	.impl = &qcom_smmu_v2_impl,
+	.adreno_impl = &qcom_adreno_smmu_v2_impl,
 };
 
 static const struct qcom_smmu_match_data qcom_smmu_data = {
-	.impl = &qcom_smmu_impl,
-	.adreno_impl = &qcom_adreno_smmu_impl,
+	.impl = &qcom_smmu_500_impl,
+	.adreno_impl = &qcom_adreno_smmu_500_impl,
 };
 
 static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
@@ -470,22 +491,22 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
 };
 
 static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
-	.impl = &qcom_smmu_impl,
-	.adreno_impl = &qcom_adreno_smmu_impl,
+	.impl = &qcom_smmu_500_impl,
+	.adreno_impl = &qcom_adreno_smmu_500_impl,
 	.cfg = &qcom_smmu_impl0_cfg,
 };
 
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
-	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,qdu1000-smmu-500", .data = &qcom_smmu_500_impl0_data  },
 	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
-	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
+	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
 	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_500_impl0_data},
 	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_500_impl0_data },
-- 
2.35.1

