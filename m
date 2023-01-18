Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5C20670F9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 02:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbjARBKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Jan 2023 20:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbjARBKN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Jan 2023 20:10:13 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D11E38022
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 17:04:32 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id u19so79543640ejm.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jan 2023 17:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ia6PJ00ok9cEymn8enyY2PYCyA6AZjLOXu797C5a9s=;
        b=E//sT9BoyQi9rflqbCE7cBVOBL7x9aLNUIP0a5EFLT1F7CokVFU/mIH1B4WhYJJCo1
         d6RhUmkcGsMQqfyaJo0f19BFktz05b4mngE2NnzFXrEPETtStx9R3n5xu26/qmzSPfno
         PsHZLRTPpfdHlTD31cHeAu5KpvHd79guMMfFtdnibz8HwGGy4dBNlAMe0siKR9Rjji+Q
         uBeoLw509d6H2F+0uhqbO0uxomLeLWr5xBL7G1fugHTQvxog8PHyaoP6fhYwMGpOWM4i
         JQGvpAxzSUG7HYJLkjxTvoSK3D3j3BUp5mHJqfxKC53YYaq91CY46ORLNWnAy3dKK0bq
         vf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ia6PJ00ok9cEymn8enyY2PYCyA6AZjLOXu797C5a9s=;
        b=bV0lyJu8JD5uzhBZAJFdKl5wfUUC5Ny3YOXLMixITkh0SW9ymKgFKr32eunnkChCKC
         pFaeDm7izVYA9lIa7xkcdKyOIptGRKKXqqKztHiUo03SdNxENT9lyJtZE6sRncVM5APZ
         TPDLJOWsbTfEI9YxGhRPGRM6FxlVFmPwx80p9Rz3hQB+dvv3Nr9Us+EupaDbQdcO9Djt
         RuQ7Gn02wU6t7+hDtSeuktyDh6TvJHgk6JoujyuIfNYPtIaLWsVo9FdiwgL+/cuDbcKw
         sgXpbUUd+vDsa2oN45nZ5KpEIFfWz29lmlmlvCAuPxSXtJ//bbrdsVNOdc6PXkmwLXze
         1nDg==
X-Gm-Message-State: AFqh2koe+vm5yx2gyyMLgkxcSxuHGU0RhCk+Dys2G8pDf/t+OR8qUS0p
        Q4NZQRpfHOhFyfnxozd8AmcEhjmLtAbFn/yx
X-Google-Smtp-Source: AMrXdXuJGW38L6ANUwkgfLvjvYywzGnqVvkXtM8qcmSVImEvyfloVXTpj/h/hZia2+2d+pLJb3wQjA==
X-Received: by 2002:a17:906:7d51:b0:7c0:efb9:bc0e with SMTP id l17-20020a1709067d5100b007c0efb9bc0emr4734917ejp.62.1674003870832;
        Tue, 17 Jan 2023 17:04:30 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090609c100b007e0e2e35205sm13988953eje.143.2023.01.17.17.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 17:04:30 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/msm/mdss: convert UBWC setup to use match data
Date:   Wed, 18 Jan 2023 03:04:26 +0200
Message-Id: <20230118010428.1671443-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
References: <20230118010428.1671443-1-dmitry.baryshkov@linaro.org>
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

To simplify adding new platforms and to make settings more obvious,
rewrite the UBWC setup to use the data structure to pass platform config
rather than just calling the functions direcly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 181 +++++++++++++++++++--------------
 1 file changed, 105 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 02646e4bb4cd..799672b88716 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -16,9 +16,6 @@
 #include "msm_drv.h"
 #include "msm_kms.h"
 
-/* for DPU_HW_* defines */
-#include "disp/dpu1/dpu_hw_catalog.h"
-
 #define HW_REV				0x0
 #define HW_INTR_STATUS			0x0010
 
@@ -29,6 +26,16 @@
 
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
+struct msm_mdss_data {
+	u32 ubwc_version;
+	/* can be read from register 0x58 */
+	u32 ubwc_dec_version;
+	u32 ubwc_swizzle;
+	u32 ubwc_static;
+	u32 highest_bank_bit;
+	u32 macrotile_mode;
+};
+
 struct msm_mdss {
 	struct device *dev;
 
@@ -40,6 +47,7 @@ struct msm_mdss {
 		unsigned long enabled_mask;
 		struct irq_domain *domain;
 	} irq_controller;
+	const struct msm_mdss_data *mdss_data;
 	struct icc_path *path[2];
 	u32 num_paths;
 };
@@ -182,46 +190,40 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 #define UBWC_3_0 0x30000000
 #define UBWC_4_0 0x40000000
 
-static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
-				       u32 ubwc_static)
+static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
-	writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
+	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+
+	writel_relaxed(data->ubwc_static, msm_mdss->mmio + UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
-				       unsigned int ubwc_version,
-				       u32 ubwc_swizzle,
-				       u32 highest_bank_bit,
-				       u32 macrotile_mode)
+static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 {
-	u32 value = (ubwc_swizzle & 0x1) |
-		    (highest_bank_bit & 0x3) << 4 |
-		    (macrotile_mode & 0x1) << 12;
+	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	u32 value = (data->ubwc_swizzle & 0x1) |
+		    (data->highest_bank_bit & 0x3) << 4 |
+		    (data->macrotile_mode & 0x1) << 12;
 
-	if (ubwc_version == UBWC_3_0)
+	if (data->ubwc_version == UBWC_3_0)
 		value |= BIT(10);
 
-	if (ubwc_version == UBWC_1_0)
+	if (data->ubwc_version == UBWC_1_0)
 		value |= BIT(8);
 
 	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
 }
 
-static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
-				       unsigned int ubwc_version,
-				       u32 ubwc_swizzle,
-				       u32 ubwc_static,
-				       u32 highest_bank_bit,
-				       u32 macrotile_mode)
+static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 {
-	u32 value = (ubwc_swizzle & 0x7) |
-		    (ubwc_static & 0x1) << 3 |
-		    (highest_bank_bit & 0x7) << 4 |
-		    (macrotile_mode & 0x1) << 12;
+	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	u32 value = (data->ubwc_swizzle & 0x7) |
+		    (data->ubwc_static & 0x1) << 3 |
+		    (data->highest_bank_bit & 0x7) << 4 |
+		    (data->macrotile_mode & 0x1) << 12;
 
 	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
 
-	if (ubwc_version == UBWC_3_0) {
+	if (data->ubwc_version == UBWC_3_0) {
 		writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
 		writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
 	} else {
@@ -233,7 +235,6 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret;
-	u32 hw_rev;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
@@ -249,57 +250,36 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	}
 
 	/*
-	 * HW_REV requires MDSS_MDP_CLK, which is not enabled by the mdss on
-	 * mdp5 hardware. Skip reading it for now.
+	 * Register access requires MDSS_MDP_CLK, which is not enabled by the
+	 * mdss on mdp5 hardware. Skip it for now.
 	 */
-	if (msm_mdss->is_mdp5)
+	if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
 		return 0;
 
-	hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
-	dev_dbg(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
-	dev_dbg(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
-		readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
-
 	/*
 	 * ubwc config is part of the "mdss" region which is not accessible
 	 * from the rest of the driver. hardcode known configurations here
 	 *
 	 * Decoder version can be read from the UBWC_DEC_HW_VERSION reg,
-	 * UBWC_n and the rest of params comes from hw_catalog.
-	 * Unforunately this driver can not access hw catalog, so we have to
-	 * hardcode them here.
+	 * UBWC_n and the rest of params comes from hw data.
 	 */
-	switch (hw_rev) {
-	case DPU_HW_VER_500:
-	case DPU_HW_VER_501:
-		msm_mdss_setup_ubwc_dec_30(msm_mdss, UBWC_3_0, 0, 2, 0);
-		break;
-	case DPU_HW_VER_600:
-		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
+	switch (msm_mdss->mdss_data->ubwc_dec_version) {
+	case UBWC_2_0:
+		msm_mdss_setup_ubwc_dec_20(msm_mdss);
 		break;
-	case DPU_HW_VER_620:
-		/* UBWC_2_0 */
-		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
+	case UBWC_3_0:
+		msm_mdss_setup_ubwc_dec_30(msm_mdss);
 		break;
-	case DPU_HW_VER_630:
-		/* UBWC_2_0 */
-		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x11f);
+	case UBWC_4_0:
+		msm_mdss_setup_ubwc_dec_40(msm_mdss);
 		break;
-	case DPU_HW_VER_700:
-		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
-		break;
-	case DPU_HW_VER_720:
-		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
-		break;
-	case DPU_HW_VER_800:
-		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 2, 1);
-		break;
-	case DPU_HW_VER_810:
-	case DPU_HW_VER_900:
-		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
+	default:
+		dev_err(msm_mdss->dev, "Unuspported UBWC decoder version %x\n",
+			msm_mdss->mdss_data->ubwc_dec_version);
+		dev_err(msm_mdss->dev, "HW_REV: 0x%x\n",
+			readl_relaxed(msm_mdss->mmio + HW_REV));
+		dev_err(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
+			readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
 		break;
 	}
 
@@ -490,6 +470,8 @@ static int mdss_probe(struct platform_device *pdev)
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);
 
+	mdss->mdss_data = of_device_get_match_data(&pdev->dev);
+
 	platform_set_drvdata(pdev, mdss);
 
 	/*
@@ -519,21 +501,68 @@ static int mdss_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct msm_mdss_data sc7180_data = {
+	.ubwc_version = UBWC_2_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_static = 0x1e,
+};
+
+static const struct msm_mdss_data sc7280_data = {
+	.ubwc_version = UBWC_3_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	.highest_bank_bit = 1,
+	.macrotile_mode = 1,
+};
+
+static const struct msm_mdss_data sc8280xp_data = {
+	.ubwc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	.highest_bank_bit = 2,
+	.macrotile_mode = 1,
+};
+
+static const struct msm_mdss_data sm8150_data = {
+	.ubwc_version = UBWC_3_0,
+	.ubwc_dec_version = UBWC_3_0,
+	.highest_bank_bit = 2,
+};
+
+static const struct msm_mdss_data sm6115_data = {
+	.ubwc_version = UBWC_1_0,
+	.ubwc_dec_version = UBWC_2_0,
+	.ubwc_swizzle = 7,
+	.ubwc_static = 0x11f,
+};
+
+static const struct msm_mdss_data sm8250_data = {
+	.ubwc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_3_0,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+};
+
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
-	{ .compatible = "qcom,sc7180-mdss" },
-	{ .compatible = "qcom,sc7280-mdss" },
+	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
+	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
 	{ .compatible = "qcom,sc8180x-mdss" },
-	{ .compatible = "qcom,sc8280xp-mdss" },
-	{ .compatible = "qcom,sm6115-mdss" },
-	{ .compatible = "qcom,sm8150-mdss" },
-	{ .compatible = "qcom,sm8250-mdss" },
-	{ .compatible = "qcom,sm8350-mdss" },
-	{ .compatible = "qcom,sm8450-mdss" },
-	{ .compatible = "qcom,sm8550-mdss" },
+	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
+	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
+	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
+	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
+	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
+	{ .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
+	{ .compatible = "qcom,sm8550-mdss", .data = &sm8250_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.39.0

