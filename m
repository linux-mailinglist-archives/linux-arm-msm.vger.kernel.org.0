Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 441A0607D03
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Oct 2022 18:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbiJUQ4e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Oct 2022 12:56:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbiJUQ4L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Oct 2022 12:56:11 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04EE94B4A0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:55:50 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id c20so4514580ljj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Oct 2022 09:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swEbnkg16JzzdPkO3o6RjQHUGeEyRg5rGzCMEolyHdw=;
        b=HkR8YNN7zkfwR4bQHZNTSesmB9AFrAG9KhmXnjBBxFqTUi+iowSCAb9Xj9rS18adNQ
         D1X02hrKZ1fF7SaF2c/WGDAf/xvC6ARYbWPvgzH0xjtMo/ljWSts1VlsSbttdhWTEYIE
         7rA+d73GQw30rnOAVqP+bcxfopZbuUNZ9MJBKE+jETwnBfe0l3LcRZ9yyeaF92jfalLN
         vJfUYp19A3LIMtWCbPBQjnigBI2BiMGIrQHARzGIFCs0/yjz1RN9kmTo9zz6JN4dObOV
         2ydUPpqjLsVSlR+q3e2jqTFHZu71JCarWEhn0ukUMeDHCJ3veLNqgoOu3hStyRRI3f6n
         98EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swEbnkg16JzzdPkO3o6RjQHUGeEyRg5rGzCMEolyHdw=;
        b=j/j0Vawv2Jh8+utefrfPDXgqkIoB5ReR4KysbJPBoSuL5ccWHgOID2HTiOViHETAbu
         tnkw5PaFMXDQG3dDE/JhD41BP83hBXbuQrObeRS56DVTGL0XDA8AFujeRGM70XytcIM8
         rlEaWtgV3oVnNl6xCizoHlRuBrM9qPkt/nkQTMjWbUSwtbQq2ffuPVzHRoRWv+3alXcf
         aU46SzLbYL3Y4HxqIbbuGAwF5+vyhNEV6Zrq4H34R0PpRLRrRIA4Xqln9UbHk+vTNUvo
         7UOklfoVgEC//V/3+5wKgkaMdlvujTgMHaQvpnnnJo9LywrdHxd9IlyEmi/b93tlDqth
         r1lA==
X-Gm-Message-State: ACrzQf2W6yVVBq+mRqYgya2wGUrxH0+5wg25DNvYpsfNu9BWQ6lNbsh8
        LDfdYsubrxgbdURQYof8boZp/Q==
X-Google-Smtp-Source: AMsMyM72D25evGBxUYTZdeE4xtBjug0bsR2/qvu56ipW4kRLRSgqK5NdHKPs568C9UVsg5sutvZ7xw==
X-Received: by 2002:a2e:a9a9:0:b0:261:bf5a:8ff3 with SMTP id x41-20020a2ea9a9000000b00261bf5a8ff3mr7175563ljq.252.1666371338356;
        Fri, 21 Oct 2022 09:55:38 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a056512078400b004946e72711bsm3218532lfr.76.2022.10.21.09.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 09:55:37 -0700 (PDT)
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
Subject: [RFC PATCH 4/9] iommu/arm-smmu-qcom: Move implementation data into match data
Date:   Fri, 21 Oct 2022 19:55:29 +0300
Message-Id: <20221021165534.2334329-5-dmitry.baryshkov@linaro.org>
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

In preparation to rework of the implementation and configuration
details, make qcom_smmu_create() accept new qcom_smmu_match_data
structure pointer. Make implementation a field in this struct.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 58 ++++++++++++++--------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  4 ++
 2 files changed, 42 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index b2708de25ea3..bd228b7d6817 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -405,10 +405,18 @@ static const struct arm_smmu_impl qcom_adreno_smmu_impl = {
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
-		const struct arm_smmu_impl *impl)
+		const struct qcom_smmu_match_data *data)
 {
+	const struct arm_smmu_impl *impl;
 	struct qcom_smmu *qsmmu;
 
+	if (!data)
+		return ERR_PTR(-EINVAL);
+
+	impl = data->impl;
+	if (!impl)
+		return smmu;
+
 	/* Check to make sure qcom_scm has finished probing */
 	if (!qcom_scm_is_available())
 		return ERR_PTR(-EPROBE_DEFER);
@@ -423,22 +431,30 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	return &qsmmu->smmu;
 }
 
+static const struct qcom_smmu_match_data qcom_smmu_data = {
+	.impl = &qcom_smmu_impl,
+};
+
+static const struct qcom_smmu_match_data qcom_adreno_smmu_data = {
+	.impl = &qcom_adreno_smmu_impl,
+};
+
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
-	{ .compatible = "qcom,msm8998-smmu-v2" },
-	{ .compatible = "qcom,qcm2290-smmu-500" },
-	{ .compatible = "qcom,sc7180-smmu-500" },
-	{ .compatible = "qcom,sc7280-smmu-500" },
-	{ .compatible = "qcom,sc8180x-smmu-500" },
-	{ .compatible = "qcom,sc8280xp-smmu-500" },
-	{ .compatible = "qcom,sdm630-smmu-v2" },
-	{ .compatible = "qcom,sdm845-smmu-500" },
-	{ .compatible = "qcom,sm6125-smmu-500" },
-	{ .compatible = "qcom,sm6350-smmu-500" },
-	{ .compatible = "qcom,sm6375-smmu-500" },
-	{ .compatible = "qcom,sm8150-smmu-500" },
-	{ .compatible = "qcom,sm8250-smmu-500" },
-	{ .compatible = "qcom,sm8350-smmu-500" },
-	{ .compatible = "qcom,sm8450-smmu-500" },
+	{ .compatible = "qcom,msm8998-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,qcm2290-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sc7180-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sc7280-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sc8180x-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sc8280xp-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sdm630-smmu-v2", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sdm845-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm6125-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm6350-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_data },
+	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_data },
 	{ }
 };
 
@@ -453,12 +469,13 @@ static struct acpi_platform_list qcom_acpi_platlist[] = {
 struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	const struct device_node *np = smmu->dev->of_node;
+	const struct of_device_id *match;
 
 #ifdef CONFIG_ACPI
 	if (np == NULL) {
 		/* Match platform for ACPI boot */
 		if (acpi_match_platform_list(qcom_acpi_platlist) >= 0)
-			return qcom_smmu_create(smmu, &qcom_smmu_impl);
+			return qcom_smmu_create(smmu, &qcom_smmu_data);
 	}
 #endif
 
@@ -469,10 +486,11 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 	 * features if the order is changed.
 	 */
 	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
-		return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
+		return qcom_smmu_create(smmu, &qcom_adreno_smmu_data);
 
-	if (of_match_node(qcom_smmu_impl_of_match, np))
-		return qcom_smmu_create(smmu, &qcom_smmu_impl);
+	match = of_match_node(qcom_smmu_impl_of_match, np);
+	if (match)
+		return qcom_smmu_create(smmu, match->data);
 
 	return smmu;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 99ec8f8629a0..2424f10b7110 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -14,6 +14,10 @@ struct qcom_smmu {
 	u32 stall_enabled;
 };
 
+struct qcom_smmu_match_data {
+	const struct arm_smmu_impl *impl;
+};
+
 #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
 void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu);
 const void *qcom_smmu_impl_data(struct arm_smmu_device *smmu);
-- 
2.35.1

