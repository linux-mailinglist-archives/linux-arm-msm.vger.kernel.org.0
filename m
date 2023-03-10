Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D693F6B332F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229937AbjCJA5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbjCJA5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:57:35 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63807116C0C
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 16:57:33 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id n2so4582536lfb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 16:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678409852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xw+mPnAX0yt7HyQJYsW3YBwt/4xyAG2li6AH9C7UrNA=;
        b=htKAxKLqaNr0xWK2vL+Eav4fUvwOPgPMHpM+jAt97Lyd5tgfiWGDIjXLw83BQK/O2h
         PORdCb1Xi5oeUQTi3W1zDqNA0LVDjXofES0tBNq4AWlXBnIWzgVnklCUPQolrAiTH56e
         FdCbzMgx9twbzn2YfyI98NsE3bJaGkp6y56f8EaBCSO2d7alz8tqtT3DwvaNwkYVKAne
         urk3neHQkycl1t5hgm1e3x++bPdygYuTkLspcbFJK04WkOFCdgkDdPypRZ1PotsVlrft
         MDbvpGcQvL+HWtAEWQvPzFAgOfepwAtgvc4LZ1ZISRbYqqxnj2kOvCmMeblJDSblYG16
         eekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678409852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xw+mPnAX0yt7HyQJYsW3YBwt/4xyAG2li6AH9C7UrNA=;
        b=IFKwD9mAkdNga4atxH5CE50OuP1jLGwGXMRzQ83yGi684LG2TujJT6iLg53hjwb/Wt
         ErqvwYkPPK1eLIwh31pEzvvXol+Ed+h2bVkdouO/AM1z99pfGaZPd+ugS7C30ONzdRWx
         6D30JT7i9ZiPs+5QaQ+XjnSSLDTaHUo8PZEf3RdYX9daS87lCmFYiuD5xI1Q7EfZgBAy
         vJYrS5cyo+zRfs0ZisO1BHkGGwUA9Gtjcg4VVIKScsFZoaWZCPe34YDPeWI8sb2KQLXd
         f1kcjED2Va9F50vMRVzo6OZPgbH5o+hEClQsHi3bS6Od3N0AnDaY8etiZ/oXTuMXniCb
         HPsA==
X-Gm-Message-State: AO0yUKU9VGWVdjVvksiXWF1LdpUDjpToplxwSEeza3HUAJwLQ5M0ScLP
        ZDeEjGg1rrdTI+lLsK5+4amXlE3nkNhJOzVaP7c=
X-Google-Smtp-Source: AK7set9SVqUQMqjnILU5l+eRIPrrydQmUsmsft8Q11QH9iflbclI9iEHkKGGRbIzRswZu0pMDkhrDA==
X-Received: by 2002:ac2:54a6:0:b0:4dc:841e:55f with SMTP id w6-20020ac254a6000000b004dc841e055fmr6597240lfk.43.1678409852737;
        Thu, 09 Mar 2023 16:57:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 16:57:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 30/32] drm/msm/dpu: drop smart_dma_rev from dpu_caps
Date:   Fri, 10 Mar 2023 02:57:02 +0200
Message-Id: <20230310005704.1332368-31-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
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

The code doesn't use dpu_caps::smart_dma_rev field. It checks if the
corresponding feature is enabled in the SSPP features. Drop the
smart_dma_rev field completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 13 -------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  2 --
 2 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index fc818b0273e7..977bb096969b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -305,7 +305,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V1,
 	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -320,7 +319,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
 static const struct dpu_caps qcm2290_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -332,7 +330,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -348,7 +345,6 @@ static const struct dpu_caps sc7180_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -360,7 +356,6 @@ static const struct dpu_caps sm6115_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
@@ -372,7 +367,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -388,7 +382,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -404,7 +397,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 	.max_mixer_width = 2560,
 	.max_mixer_blendstages = 11,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -418,7 +410,6 @@ static const struct dpu_caps sm8250_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -432,7 +423,6 @@ static const struct dpu_caps sm8350_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -446,7 +436,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -460,7 +449,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_40,
 	.has_src_split = true,
 	.has_dim_layer = true,
@@ -474,7 +462,6 @@ static const struct dpu_caps sc7280_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.qseed_type = DPU_SSPP_SCALER_QSEED4,
-	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
 	.ubwc_version = DPU_HW_UBWC_VER_30,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ddab9caebb18..6a534b3aa671 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -393,7 +393,6 @@ struct dpu_rotation_cfg {
  * @max_mixer_blendstages max layer mixer blend stages or
  *                       supported z order
  * @qseed_type         qseed2 or qseed3 support.
- * @smart_dma_rev      Supported version of SmartDMA feature.
  * @ubwc_version       UBWC feature version (0x0 for not supported)
  * @has_src_split      source split feature status
  * @has_dim_layer      dim layer feature status
@@ -408,7 +407,6 @@ struct dpu_caps {
 	u32 max_mixer_width;
 	u32 max_mixer_blendstages;
 	u32 qseed_type;
-	u32 smart_dma_rev;
 	u32 ubwc_version;
 	bool has_src_split;
 	bool has_dim_layer;
-- 
2.39.2

