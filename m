Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7DF6465A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 01:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiLHAI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 19:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbiLHAIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 19:08:55 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F1398BD2B
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 16:08:54 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id cf42so25444582lfb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 16:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1Ikr2FvvhgzNt0kU27nBgUrdbiSfG2vNFlP2dDVTHs=;
        b=VQBte6MFoYwlUkLoD79y3YMxEwUqfvgXN+Nc5sRUlAsJjkTErwdrF+V/CKOMPeZpjg
         BDf7SK8vB51+3MFUjr7lvtIxXP0FzFokav14bJCYhLuyTCjR5vWgJBKw8CIwRoHQYGxD
         nYj83JLnfvYvCvYdZ9S4NwOf7gbkq5/zRTw+GfxjaMaIrc+aHFyQ+hOeoAiU9J17Sn0G
         PaIXmRj8miKxy+1G6SGQFu/Qdo6irZ7breGbepqj7mBOrJC7qKNcVwUyaRKxWmc2WpcQ
         yfVR2GHksXPmzo0LuGsQ17akMfGX2MdL8Tqjy9QPCPZ9Wfl05S69ypozh/+UBdRIr+ht
         cVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1Ikr2FvvhgzNt0kU27nBgUrdbiSfG2vNFlP2dDVTHs=;
        b=NmbRaryqEScWxS3918PXocbD0CPx81QgsppYjegBaI1uK9cNffi/tm9i5yJ1777sbq
         /E/Axq7qKs0i+lX9SBrjfsjd9uUtwZQAvmRX0NZXpdB1fXOnCkvgSE7tEPDf9Ye7HCye
         4ziGItNLuhDIuBXgP6Byo4doNkltu8W77w+edcUHEJ6+qlHOLL6QPGMuvoHBFyUAbntN
         UM/eEzyI7wyp8nBZ8hI8KDrOLVvRTz2p5QYtnuIx6jTIOv/ow616IzIYTpxAw3hR9h68
         W+uVMXJkCCuPxsYNqWlPb9KlPDfWV6eWkKuyH5+dZTQyCG/vCc20gkrENX0MDkh02oTO
         tqWA==
X-Gm-Message-State: ANoB5pm/VofpBdssKknaZvlnvkMIzyI1aiAa4UBBQ796NljN9caNEKzP
        sAkkzEuIg7+iPSCEf1YyjZ7vqw==
X-Google-Smtp-Source: AA0mqf62HG2CgyXqtDj6Wr8hznjx6FdsA5/EAOkI3BHGNetCEwLKLRyQIr0PwPc6Xs13U3JbybzPDQ==
X-Received: by 2002:a05:6512:1508:b0:4a2:4b01:8466 with SMTP id bq8-20020a056512150800b004a24b018466mr33696309lfb.34.1670458132490;
        Wed, 07 Dec 2022 16:08:52 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z6-20020ac25de6000000b004a2c447598fsm2062992lfq.159.2022.12.07.16.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 16:08:52 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 1/4] drm/msm/mdss: convert UBWC setup to use match data
Date:   Thu,  8 Dec 2022 02:08:47 +0200
Message-Id: <20221208000850.312548-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/msm_mdss.c | 158 ++++++++++++++++++++-------------
 1 file changed, 94 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 92773e0a8fda..2219c1bd59a9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -29,6 +29,14 @@
 
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
+struct msm_mdss_data {
+	u32 ubwc_version;
+	u32 ubwc_swizzle;
+	u32 ubwc_static;
+	u32 highest_bank_bit;
+	u32 macrotile_mode;
+};
+
 struct msm_mdss {
 	struct device *dev;
 
@@ -40,6 +48,7 @@ struct msm_mdss {
 		unsigned long enabled_mask;
 		struct irq_domain *domain;
 	} irq_controller;
+	const struct msm_mdss_data *mdss_data;
 	struct icc_path *path[2];
 	u32 num_paths;
 };
@@ -180,46 +189,40 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
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
@@ -232,6 +235,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret;
 	u32 hw_rev;
+	u32 ubwc_dec_hw_version;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
@@ -250,53 +254,36 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	 * HW_REV requires MDSS_MDP_CLK, which is not enabled by the mdss on
 	 * mdp5 hardware. Skip reading it for now.
 	 */
-	if (msm_mdss->is_mdp5)
+	if (msm_mdss->is_mdp5 || !msm_mdss->mdss_data)
 		return 0;
 
 	hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
 	dev_dbg(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
+
+	ubwc_dec_hw_version = readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION);
 	dev_dbg(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
-		readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
+		ubwc_dec_hw_version);
 
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
-		break;
-	case DPU_HW_VER_620:
-		/* UBWC_2_0 */
-		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
+	switch (ubwc_dec_hw_version) {
+	case UBWC_2_0:
+		msm_mdss_setup_ubwc_dec_20(msm_mdss);
 		break;
-	case DPU_HW_VER_630:
-		/* UBWC_2_0 */
-		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x11f);
+	case UBWC_3_0:
+		msm_mdss_setup_ubwc_dec_30(msm_mdss);
 		break;
-	case DPU_HW_VER_700:
-		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
+	case UBWC_4_0:
+		msm_mdss_setup_ubwc_dec_40(msm_mdss);
 		break;
-	case DPU_HW_VER_720:
-		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
-		break;
-	case DPU_HW_VER_800:
-		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 2, 1);
-		break;
-	case DPU_HW_VER_810:
-		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
-		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
+	default:
+		dev_err(msm_mdss->dev, "Unuspported UBWC decoder version %x\n",
+			ubwc_dec_hw_version);
 		break;
 	}
 
@@ -487,6 +474,8 @@ static int mdss_probe(struct platform_device *pdev)
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);
 
+	mdss->mdss_data = of_device_get_match_data(&pdev->dev);
+
 	platform_set_drvdata(pdev, mdss);
 
 	/*
@@ -516,20 +505,61 @@ static int mdss_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct msm_mdss_data sc7180_data = {
+	.ubwc_version = UBWC_2_0,
+	.ubwc_static = 0x1e,
+};
+
+static const struct msm_mdss_data sc7280_data = {
+	.ubwc_version = UBWC_3_0,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	.highest_bank_bit = 1,
+	.macrotile_mode = 1,
+};
+
+static const struct msm_mdss_data sc8280xp_data = {
+	.ubwc_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	.highest_bank_bit = 2,
+	.macrotile_mode = 1,
+};
+
+static const struct msm_mdss_data sm8150_data = {
+	.ubwc_version = UBWC_3_0,
+	.highest_bank_bit = 2,
+};
+
+static const struct msm_mdss_data sm6115_data = {
+	.ubwc_version = UBWC_2_0,
+	.ubwc_swizzle = 7,
+	.ubwc_static = 0x11f,
+};
+
+static const struct msm_mdss_data sm8250_data = {
+	.ubwc_version = UBWC_4_0,
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
+	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
+	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
+	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
+	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
+	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
+	{ .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.35.1

