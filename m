Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB5E07B1B38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbjI1LgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232012AbjI1Lf5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:35:57 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 490CD1B7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:43 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50337b43ee6so21227579e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695900941; x=1696505741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/fwhI2JTC3I7SxCkx+J8L5zOr7zua8cn0F2DT/hEPac=;
        b=Q9axa6hjAbQ3QYvD/KrE1EzL4FLIOC4Ou4GOiyPa6FUiC2Uk0x5JBbahxdp/Nsnujg
         i98nRdt8fUJVIcFBznrbaMDx2cGbASfyGnPA3JccNcR36GgIZNFXdrQjJLrEl0+LvQiK
         /N7lT8gwsNy4FJGBQDd4x643pJKN64cCzMTAb2Eo1yUwkCeIvV1MTtCftaKUBwqdEziL
         98mPnXFI25mesfq/rgT88640wh1LCCz8hD6rpgPgomi32JKswRdISZcQWmVa+g3vnNme
         2cFqkrHV3peiZqLdfxeCF4rKx/rAmjddwnMWAhpg0+oVtFuEato9Vq1Z8GRx4GxzSpm4
         w+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695900941; x=1696505741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fwhI2JTC3I7SxCkx+J8L5zOr7zua8cn0F2DT/hEPac=;
        b=nUWr891dlCZgoj1DhFTx9QWxyGDEhQHA57UFe9+DpLbG9/b2PADgG7MzKNWTXRqYqQ
         aGNOTktA/HVC+dyGzAZD/LPm5VB5Hlp+rabCWe+RfV0ua+fOdo59qHSPRE4EalyzuSs0
         gCt8SuVJbxPpqEfCvO6rwWT9mHxHkR0p4woFrOMtxZ4MC1G/wgn4YKr2+l5G5PMFaUq8
         cMN6MPkAPBrfRgPGoiw9WSVjUmp3ObNgN4mwjFNx/td3doPlmpbcnTvlZQS07xdm40xZ
         bmZ4nh6QKdPP49iyAj4yHjUc4gFJhDEvh2YSvtK/ET5RE836i+MNgE7kRTRdrUHJvhEo
         WZcA==
X-Gm-Message-State: AOJu0Yy5HFpMenPdrTnkaUIj+gQAuIe5B1WfZLXeWey8KQlxD5TreIXo
        SP03jPRC6pbo06rWWIl/CHeDBw==
X-Google-Smtp-Source: AGHT+IFD5PCTDzr19qu4nO+aDLfN021hSk1y0D8apXFNENgpI7aBsQGQy+zMBewKR9V/bGn+xcJmUw==
X-Received: by 2002:a05:6512:3b90:b0:503:258f:fd1b with SMTP id g16-20020a0565123b9000b00503258ffd1bmr1286554lfv.18.1695900941446;
        Thu, 28 Sep 2023 04:35:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:35:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 6/6] drm/msm/mdss: Handle the reg bus ICC path
Date:   Thu, 28 Sep 2023 14:35:35 +0300
Message-Id: <20230928113535.1217613-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
another path that needs to be handled to ensure MDSS functions properly,
namely the "reg bus", a.k.a the CPU-MDSS interconnect.

Gating that path may have a variety of effects, from none to otherwise
inexplicable DSI timeouts.

Provide a way for MDSS driver to vote on this bus.

A note regarding vote values. Newer platforms have corresponding
bandwidth values in the vendor DT files. For the older platforms there
was a static vote in the mdss_mdp and rotator drivers. I choose to be
conservative here and choose this value as a default.

Co-developed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 49 +++++++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_mdss.h |  1 +
 2 files changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 1a921e9107b1..0eb765147600 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -28,6 +28,8 @@
 
 #define MIN_IB_BW	400000000UL /* Min ib vote 400MB */
 
+#define DEFAULT_REG_BW	153600 /* Used in mdss fbdev driver */
+
 struct msm_mdss {
 	struct device *dev;
 
@@ -42,6 +44,7 @@ struct msm_mdss {
 	const struct msm_mdss_data *mdss_data;
 	struct icc_path *mdp_path[2];
 	u32 num_mdp_paths;
+	struct icc_path *reg_bus_path;
 };
 
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
@@ -49,6 +52,7 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 {
 	struct icc_path *path0;
 	struct icc_path *path1;
+	struct icc_path *reg_bus_path;
 
 	path0 = devm_of_icc_get(dev, "mdp0-mem");
 	if (IS_ERR_OR_NULL(path0))
@@ -63,6 +67,10 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 		msm_mdss->num_mdp_paths++;
 	}
 
+	reg_bus_path = of_icc_get(dev, "cpu-cfg");
+	if (!IS_ERR_OR_NULL(reg_bus_path))
+		msm_mdss->reg_bus_path = reg_bus_path;
+
 	return 0;
 }
 
@@ -229,6 +237,13 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
 		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
 
+	if (msm_mdss->mdss_data && msm_mdss->mdss_data->reg_bus_bw)
+		icc_set_bw(msm_mdss->reg_bus_path, 0,
+			   msm_mdss->mdss_data->reg_bus_bw);
+	else
+		icc_set_bw(msm_mdss->reg_bus_path, 0,
+			   DEFAULT_REG_BW);
+
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
 		dev_err(msm_mdss->dev, "clock enable failed, ret:%d\n", ret);
@@ -286,6 +301,9 @@ static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
 		icc_set_bw(msm_mdss->mdp_path[i], 0, 0);
 
+	if (msm_mdss->reg_bus_path)
+		icc_set_bw(msm_mdss->reg_bus_path, 0, 0);
+
 	return 0;
 }
 
@@ -372,6 +390,8 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	if (!msm_mdss)
 		return ERR_PTR(-ENOMEM);
 
+	msm_mdss->mdss_data = of_device_get_match_data(&pdev->dev);
+
 	msm_mdss->mmio = devm_platform_ioremap_resource_byname(pdev, is_mdp5 ? "mdss_phys" : "mdss");
 	if (IS_ERR(msm_mdss->mmio))
 		return ERR_CAST(msm_mdss->mmio);
@@ -462,8 +482,6 @@ static int mdss_probe(struct platform_device *pdev)
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);
 
-	mdss->mdss_data = of_device_get_match_data(&pdev->dev);
-
 	platform_set_drvdata(pdev, mdss);
 
 	/*
@@ -497,11 +515,13 @@ static const struct msm_mdss_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_1_0,
 	.highest_bank_bit = 1,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data qcm2290_data = {
 	/* no UBWC */
 	.highest_bank_bit = 0x2,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sc7180_data = {
@@ -509,6 +529,7 @@ static const struct msm_mdss_data sc7180_data = {
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_static = 0x1e,
 	.highest_bank_bit = 0x3,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sc7280_data = {
@@ -518,6 +539,7 @@ static const struct msm_mdss_data sc7280_data = {
 	.ubwc_static = 1,
 	.highest_bank_bit = 1,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
 };
 
 static const struct msm_mdss_data sc8180x_data = {
@@ -525,6 +547,7 @@ static const struct msm_mdss_data sc8180x_data = {
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sc8280xp_data = {
@@ -534,12 +557,14 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_static = 1,
 	.highest_bank_bit = 2,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.highest_bank_bit = 2,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sm6350_data = {
@@ -548,12 +573,14 @@ static const struct msm_mdss_data sm6350_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_static = 0x1e,
 	.highest_bank_bit = 1,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 2,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sm6115_data = {
@@ -562,6 +589,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_swizzle = 7,
 	.ubwc_static = 0x11f,
 	.highest_bank_bit = 0x1,
+	.reg_bus_bw = 76800,
 };
 
 static const struct msm_mdss_data sm6125_data = {
@@ -579,6 +607,18 @@ static const struct msm_mdss_data sm8250_data = {
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 76800,
+};
+
+static const struct msm_mdss_data sm8350_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_0,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+	.reg_bus_bw = 74000,
 };
 
 static const struct msm_mdss_data sm8550_data = {
@@ -589,6 +629,7 @@ static const struct msm_mdss_data sm8550_data = {
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
 	.macrotile_mode = 1,
+	.reg_bus_bw = 57000,
 };
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
@@ -605,8 +646,8 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
-	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
-	{ .compatible = "qcom,sm8450-mdss", .data = &sm8250_data },
+	{ .compatible = "qcom,sm8350-mdss", .data = &sm8350_data },
+	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{}
 };
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 02bbab42adbc..3afef4b1786d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -14,6 +14,7 @@ struct msm_mdss_data {
 	u32 ubwc_static;
 	u32 highest_bank_bit;
 	u32 macrotile_mode;
+	u32 reg_bus_bw;
 };
 
 #define UBWC_1_0 0x10000000
-- 
2.39.2

