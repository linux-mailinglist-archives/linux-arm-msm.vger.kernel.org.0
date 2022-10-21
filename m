Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D783607D0F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 18:56:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiJUQ4n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 12:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbiJUQ41 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 12:56:27 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00524C14
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:56:01 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id j4so6300478lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R20V3yfkrUP6/lROP/c6xfh9kgofHKni16w9tt+lh1I=;
        b=HR/Eg71dN6Z94vqDP0qVQrPyEUO1yTQYRmPJyiwie0KvPifnol9hPPPJ126FVyHCBX
         9pYeEqCjvsSytMDpUxg3vld53GiRZ4GIFBdQoDIVNUxbZQXmy5Um0t1Av2t60Q9wP31b
         fyazrIYLoJbXNERT2FAROQKtwxu0AL6QcH3CJUWioYuaHlo3RW4bP+E4yd8uMrFNXHvw
         h5051iRG6ZLABRVvL1qMCJp5MirCC3DxdLVgrnYQ+f9OtfWWiP+tCmfTpZI9oAua4cys
         lYXjzrjMBNqgfzcpWkMkGUbpxs4ZK+djwxK1wnrUL2ZrGkoH6VGYFXr1TyqNRFlKYfA7
         8W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R20V3yfkrUP6/lROP/c6xfh9kgofHKni16w9tt+lh1I=;
        b=BglwJRq+XNoGpXcWsHn2vt9j9yRklAZCs4Vdx6YHv6SW/19gcCsDoqNCVoZaPs933N
         Uu4MT0aT0quGmwB9qG22sLhU0xZZon7eM72rScsoQpeV7FvY/0sugEUCuS+GKnIkJnct
         jCwzqVxUaPqekxEKVY4xYUnoH4doLHUfO9BKjLFFv3uCLQYnqlC+YYfC4GHEfIeRJrIN
         8LZSuZVpJOWYTXRMOs9yA7l0L+FLHjVQdHP0kAQCVjmHAt9gSiiQc2Pq+jddrQufoMkF
         aES6RtN+eOPDVGrWb+P/79hvqSa1iYNCTS1BVm4/pYjKdJ6MBQyYZxgn9FG5969bE/f2
         g87A==
X-Gm-Message-State: ACrzQf0dzS63cgCESC/yQxzf5srVBzokcwn5gFul+Av0gn3vi+fh3ZZ7
        R9LZLIIFLw5r1/9bbGqY8FzYtg==
X-Google-Smtp-Source: AMsMyM6F9QRR8Rb5ZhpSgEddG1MHahxDn3EbBDX4LQbGaYGcq9QruT+pDoyf0bs+dQVFGQPJjNptlA==
X-Received: by 2002:ac2:5616:0:b0:4a2:61f6:85e9 with SMTP id v22-20020ac25616000000b004a261f685e9mr6839567lfd.419.1666371348373;
        Fri, 21 Oct 2022 09:55:48 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a056512078400b004946e72711bsm3218532lfr.76.2022.10.21.09.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:55:48 -0700 (PDT)
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
Subject: [RFC PATCH 8/9] iommu/arm-smmu-qcom: Stop using mmu500 reset for v2 MMUs
Date:   Fri, 21 Oct 2022 19:55:33 +0300
Message-Id: <20221021165534.2334329-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
References: <20221021165534.2334329-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The arm_mmu500_reset() writes into registers specific for MMU500. For
the generic ARM SMMU v2 these registers (sACR) are defined as
'implementation defined'. Downstream Qualcomm driver for SMMUv2 doesn't
touch them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 41 ++++++++++++++++------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 20cbb39cb670..9abc40c00f3e 100644
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
@@ -467,21 +488,21 @@ static const struct qcom_smmu_match_data sdm845_smmu_500_data = {
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
 	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_500_impl0_data },
-	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
-	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_v2_data },
+	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &sdm845_smmu_500_data },
 	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_500_impl0_data },
-- 
2.35.1

