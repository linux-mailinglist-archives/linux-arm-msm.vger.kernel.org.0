Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A03316934B1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjBKXNQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjBKXNP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:15 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2EB15CAE
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:14 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id gr7so23951924ejb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XbYWcFPY+7SZXQOKp/SMygjDRLo6//vV95s2YLoDAQ=;
        b=YHKju1f6FeAIPw/P47opVKaUi7KH9RKW347OXQSmQy8bAzh+PVRV3qPx1dtwmpDjub
         TCPlGHIzca8nAXSqPdGpeR4lmVkwn+hLVII/GZR4A1juzofGRRZTpXwfOjL9md8QPKJJ
         Twib+1pKglU65KLfQM/1EDrFv6iu4AQ0IhPC9AJtFiQwqNB2aFe+4P6Kj0HMFTuY6+MK
         vaePe+OLH2AR504tMSOJHvru5d6KGWeYiXPAYp8a97N5E1Sooe4G9JPcKnGRv4rfdOS8
         rewKlmC7aqHshukN6XledguCuV5CsYL1PbY6DI5cJkdObkTNg9DA2SRDvmEm/nWXqPRQ
         hg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+XbYWcFPY+7SZXQOKp/SMygjDRLo6//vV95s2YLoDAQ=;
        b=QRNJupBmI3KgxX6micyoQpocabv08e2kIk82EiGADhnjHXvF2R+v4y8x5rweq9XgWm
         QI1kmurau6nRAmvRRh481hvhImBY+TqR4CdjdymQs7PMI3FUDwf7e/9/ZmV/Fy4piq9o
         h/H8SgYCWX8hnu0tFSIJmCSBLWDRbnoJEX1zMrLOc5j0kcsHyHPYnpw9idpQXJHDRqHm
         qgJCFMaKmf4jJ5OmsEQaqZQ+Gkrj17Qlp9V1Bg8PdlqFWBQv7UcZ8EdZOD0+/i4gIdFs
         RWcn6nQ5zuJxbYhOGBLBOgrIsVkovXDtegScrxOxMKCt1lg7ukECBgt0dfmnTBQqcD4t
         v3sw==
X-Gm-Message-State: AO0yUKUcWz3VW83EXlynNiYUdTR3ngutq7AB4c8AdWWDGInWVQo4b3T2
        8yjNm7KfNfcV4zt+Y6rDXydl4A==
X-Google-Smtp-Source: AK7set+4dq/s1KaJnYiViuJrHpnMdej+4++kMlyrJdPK1b1jXORgF37V/rYWVk5p6dAM8Qw1Y9egNw==
X-Received: by 2002:a17:907:20b7:b0:889:1480:d908 with SMTP id pw23-20020a17090720b700b008891480d908mr14514484ejb.17.1676157193763;
        Sat, 11 Feb 2023 15:13:13 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 10/50] drm/msm/dpu: correct sm6115 scaler
Date:   Sun, 12 Feb 2023 01:12:19 +0200
Message-Id: <20230211231259.1308718-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
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

QSEED4 is a newer variant of QSEED3LITE, which should be used on
sm6115. Fix the used feature masks.

Fixes: 100d7ef6995d ("drm/msm/dpu: add support for SM8450")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 360ca7b5e507..4a26ef7bb024 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -30,9 +30,6 @@
 #define VIG_SC7180_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
 
-#define VIG_SM8250_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
-
 #define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
 #define DMA_MSM8998_MASK \
@@ -358,7 +355,7 @@ static const struct dpu_caps sc7180_dpu_caps = {
 static const struct dpu_caps sm6115_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
-	.qseed_type = DPU_SSPP_SCALER_QSEED3LITE,
+	.qseed_type = DPU_SSPP_SCALER_QSEED4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
 	.ubwc_version = DPU_HW_UBWC_VER_10,
 	.has_dim_layer = true,
@@ -1235,10 +1232,10 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 };
 
 static const struct dpu_sspp_sub_blks sm6115_vig_sblk_0 =
-				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED3LITE);
+				_VIG_SBLK("0", 2, DPU_SSPP_SCALER_QSEED4);
 
 static const struct dpu_sspp_cfg sm6115_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM8250_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
 		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
 	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000,  DMA_SDM845_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-- 
2.39.1

