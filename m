Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB755628688
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 18:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238096AbiKNRGp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 12:06:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238115AbiKNRGo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 12:06:44 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 229672D745
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:43 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id c25so14055480ljr.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 09:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkB+OW5gQvtUckPAf5pe2SDM/ZhPU3JSoshAUjdn34I=;
        b=IswsjxOOufQ5uUM9UBgvbMBKS2mh+Gck2LPC8FnHyHO75f88zVraxNOjVjto0RqwgB
         WnQJu+MSOf4AJ4M/BV7OmYrpcrrztjZICUsYkr6okBp/cy+pGLq9qNXW4qTOoR1YpBvE
         f+nvJGc4h+/uKY5K7dEZdWdU0dlgcQlUjB1Bn6pfmFcq6hu9o3wyv0fIEH9raEnmS3pN
         9QmOXX/+LqAgat32X4NJXRR0qrIC24PlIaVxL3QuKWgkqzP05wz3AvGyCPHVCqBcNXp/
         Vu7negQeiBry0huOqWZ7Xp7akK+M3cWigUoYFwxHLF7d/h+e5uLXOjd+gAQA0rf7Hcvv
         A4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkB+OW5gQvtUckPAf5pe2SDM/ZhPU3JSoshAUjdn34I=;
        b=HmdZ8q6ykpYDLhzM3hk08CJ5tPNgwGfdr2bXIPw4EPCsuuxHyc+HRT/pLV9tgVGCNC
         umVtU8/ltGefN3FmDXb2UqLGcomjokMCsc2TvmpkZStElFtEAEgnmq530VM0uSJaKDH2
         Fa0QZBjaLl77qyegGv+ug7vFyiw1ZXbXghAwro+/ucNi/eXS1+PgBiHzqfqe3DxUPzRO
         JXLHr3uczKAvVWrgX/Luv3hsWXglheF+mcUBLZe2su/vdv5Fj24/qbbYHdHDBWV1YPOZ
         TQHWYR4pLO8mbaXRD3HRtdJsJ8zb5kCzaJdO9NYXinBk6enkPlSYum4lrjwie1VvIO0o
         CqXA==
X-Gm-Message-State: ANoB5pniCPJbsGLD4rIpSwtCfOVhxtn8clO9jp1ByIHCRAHFH23TiMDY
        hpHOzE7eR4XBNW0MDj/1ge+G/g==
X-Google-Smtp-Source: AA0mqf7ZTOQ5iikcPt8w4dfnD40+yWQCIUPvKjgNeWYyiNQp4/584Xx0+qw44l0FbdnT1lgWqI3GcQ==
X-Received: by 2002:a05:651c:388:b0:277:75fb:1fc5 with SMTP id e8-20020a05651c038800b0027775fb1fc5mr4501286ljp.405.1668445601440;
        Mon, 14 Nov 2022 09:06:41 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 09:06:41 -0800 (PST)
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
Subject: [PATCH v1 06/10] iommu/arm-smmu-qcom: Move the qcom,adreno-smmu check into qcom_smmu_create
Date:   Mon, 14 Nov 2022 20:06:31 +0300
Message-Id: <20221114170635.1406534-7-dmitry.baryshkov@linaro.org>
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
index a7bd49e44bca..e61194127772 100644
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
 	{ .compatible = "qcom,qdu1000-smmu-500", .data = &qcom_smmu_data  },
@@ -448,6 +460,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sdm845-smmu-v2", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sdm845-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sm6115-smmu-500", .data = &qcom_smmu_data },
 	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
@@ -481,15 +494,6 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
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

