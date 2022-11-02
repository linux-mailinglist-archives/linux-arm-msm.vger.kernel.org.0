Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF8CA616CC5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 19:44:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbiKBSoa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 14:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbiKBSo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 14:44:28 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6122D75B
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 11:44:27 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id d3so26245697ljl.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 11:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpoNzp/lFFD2J9GDEQtGGFHJo4tc64cqOd0TEEdjnIQ=;
        b=GnuIxYmgkf5vaKWonMso3tm6I/RqQuBLK1bZRK0KLrMUO/6f9ix87bwGf/v2Vddxv3
         UkGQH6TBvFCG94sCmjUtlHNKYAdgYUry3kfpNfUUMl8Y1zSMIYH9I9yF5hR43Thwor+s
         j48nKS2HTLDQuBVaKLVIje+xUJ5PAkOA/xcOl+Pn+PSewPCGGQ300+/8+YbE0UomYzIG
         jH7fnbKN85JFl9ymKe2qm96UkLdyBcQKGcJn9DPkkt1eUKdHSdG1KN3mUFX81XfHAged
         ByT2FHtf9O953cMLoyV5yIxmVMkrKNHafLT6Hpq/9m2XcG/BFnbyUzflRZXwdcjaZbTP
         k2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpoNzp/lFFD2J9GDEQtGGFHJo4tc64cqOd0TEEdjnIQ=;
        b=60xDmpsTys0Nx3SyA4C2/Sijh/vl0eCRtqkgHhosQ+u+evzQAAS4IA1J3zYo7IOALE
         uSUe/mm8vbbAuEUFAkZztvPAVSY2c8bOV9ag+U4BHmHRHHcIPi0W6sHsH1kXrP9fsLf9
         RbagFNuVMs/VW9UVJza/zODfTbc9hAbL2U1s1WGCW9scE3vAnAx2EpprGpd/J5wbRjUi
         XfJIdJFzJDtGjvQuSSMFhtHtNIGQqbR+6WYNMgD8Xc9xi91PuxRNiCY6ZIBlX9qIPr9D
         /9qcOP5a/4ynmoj0p1CqhIQkrURQcti3SxAu2UllMcT2J413OFQvown1B94MF8ZphyXk
         RiAA==
X-Gm-Message-State: ACrzQf1pv628ImjH3I9KvSd5hAeCfylfaGtVuW7uGGkS3Vj29x0/NO04
        Nf8jCXalb9sy9kIQ26JjGWf0ig==
X-Google-Smtp-Source: AMsMyM5sHzbedMi4/10fp+PYKIyDZ+6rF/xqpn0bjztxVh2qiPT6hUjcVpB3bTBM6i23j57m/erkiw==
X-Received: by 2002:a05:651c:239b:b0:277:5175:4fa0 with SMTP id bk27-20020a05651c239b00b0027751754fa0mr7528227ljb.327.1667414667120;
        Wed, 02 Nov 2022 11:44:27 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t8-20020a05651c204800b00277092c03e7sm2277540ljo.33.2022.11.02.11.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:44:26 -0700 (PDT)
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
Subject: [RFC PATCH v2 07/11] iommu/arm-smmu-qcom: Move the qcom,adreno-smmu check into qcom_smmu_create
Date:   Wed,  2 Nov 2022 21:44:16 +0300
Message-Id: <20221102184420.534094-8-dmitry.baryshkov@linaro.org>
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

Move special handling of qcom,adreno-smmu into qcom_smmu_create()
function. This allows us to further customize the Adreno SMMU
implementation.

Note, this also adds two entries to the qcom_smmu_impl_of_match table.
They were used with the qcom,adreno-smmu compat and were handled by the
removed clause.

Reviewed-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Tested-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 32 ++++++++++++----------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  1 +
 2 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index bd228b7d6817..c3bcd6eb2f42 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -407,13 +407,18 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 		const struct qcom_smmu_match_data *data)
 {
+	const struct device_node *np = smmu->dev->of_node;
 	const struct arm_smmu_impl *impl;
 	struct qcom_smmu *qsmmu;
 
 	if (!data)
 		return ERR_PTR(-EINVAL);
 
-	impl = data->impl;
+	if (np && of_device_is_compatible(np, "qcom,adreno-smmu"))
+		impl = data->adreno_impl;
+	else
+		impl = data->impl;
+
 	if (!impl)
 		return smmu;
 
@@ -431,15 +436,22 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	return &qsmmu->smmu;
 }
 
-static const struct qcom_smmu_match_data qcom_smmu_data = {
-	.impl = &qcom_smmu_impl,
+/*
+ * It is not yet possible to use MDP SMMU with the bypass quirk on the msm8996,
+ * there are not enough context banks.
+ */
+static const struct qcom_smmu_match_data msm8996_smmu_data = {
+	.impl = NULL,
+	.adreno_impl = &qcom_adreno_smmu_impl,
 };
 
-static const struct qcom_smmu_match_data qcom_adreno_smmu_data = {
-	.impl = &qcom_adreno_smmu_impl,
+static const struct qcom_smmu_match_data qcom_smmu_data = {
+	.impl = &qcom_smmu_impl,
+	.adreno_impl = &qcom_adreno_smmu_impl,
 };
 
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
+	{ .compatible = "qcom,msm8996-smmu-v2", .data = &msm8996_smmu_data },
 	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_data },
@@ -447,6 +459,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_data },
@@ -479,15 +492,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 	}
 #endif
 
-	/*
-	 * Do not change this order of implementation, i.e., first adreno
-	 * smmu impl and then apss smmu since we can have both implementing
-	 * arm,mmu-500 in which case we will miss setting adreno smmu specific
-	 * features if the order is changed.
-	 */
-	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
-		return qcom_smmu_create(smmu, &qcom_adreno_smmu_data);
-
 	match = of_match_node(qcom_smmu_impl_of_match, np);
 	if (match)
 		return qcom_smmu_create(smmu, match->data);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 2424f10b7110..424d8d342ce0 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -16,6 +16,7 @@ struct qcom_smmu {
 
 struct qcom_smmu_match_data {
 	const struct arm_smmu_impl *impl;
+	const struct arm_smmu_impl *adreno_impl;
 };
 
 #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
-- 
2.35.1

