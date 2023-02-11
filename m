Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26FE16934A4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Feb 2023 00:13:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjBKXNI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Feb 2023 18:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbjBKXNH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Feb 2023 18:13:07 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3FD91114D
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:05 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id ml19so24111704ejb.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Feb 2023 15:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAVq4HXdnYVmtmpSt3zZC9pZRnLJOVtS9Rx2EYLfhwc=;
        b=cfiMKnWNcJx005zqFBfqecZ5UJN/TH7CMwy4STmI2rUBFEnrLbWwsMt24Y6r1+Y5WY
         lbvvK+Xw5pVIoY/e23UYCrEgx6galAd56sgsoPpFp6dS31j10oM2aSpeqZTTS1nHS5sg
         V4+0emyaOl0bs31133m0T28lOal+gM7ErpHaFPILsJIITMwXYGHkc0/l8g7TUbnTSVE6
         CKjhPt+VJtiDgA1Vbcn8aFqDWuKR2b+A8OMZaCSUvtXfL5ydjtWLVlKDtLzB7X+7+Suc
         gmgazkcj2LfdcUqDKBm8E3fe3ETLZzr7yP1uUrygdckD0iraZB9+luD1WdSIe5IiEhZD
         aCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gAVq4HXdnYVmtmpSt3zZC9pZRnLJOVtS9Rx2EYLfhwc=;
        b=lFyZ2d5hi8/WP7QyPO31mTTQ3WGn3GspybXXR+uyaNg1lGh3Hdt5ihdnu4y+QkmJwr
         MWXhDDgrJqRZwq6/kBTgznxwV/fXESnhHY0n4DL8j/2YHly1ZgFDfcV6Z9Eaq21FfUtZ
         SlusXoKe9FqOPG/oEODn6u3K9Gdr+TvPyTc4y+idypzsrBD4VFmoJvRew+5cp+/3OWfu
         VlP8/cPrawVX/fqm40OVDTebxOmvBeAqaMJYBaiNG+UHTF0AmzUOm23XC2qJkmqjdYfR
         U43ClmLU47hraVNxmgi7L8rSWdM7BRKKnAX3qjacadl5sCJFev/PxeB0IhcQaNvIJl+8
         hyCw==
X-Gm-Message-State: AO0yUKXP/Q07Qrm305wlQeo54iayu80wsXQLN6gpbuQhM5j8Z6TSvmts
        KXeyn3kz5pZB6DVWTbnATz0taQ==
X-Google-Smtp-Source: AK7set/AJ+LYpzb7qTJ/ovJWPCI4uiEwStly19NKcyLf7P1F0T/XcbXmAXFp+SIsdrmdclaimzh3Bg==
X-Received: by 2002:a17:906:9750:b0:8b0:5c38:47d8 with SMTP id o16-20020a170906975000b008b05c3847d8mr3453852ejy.42.1676157184614;
        Sat, 11 Feb 2023 15:13:04 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k20-20020a1709061c1400b00871390a3b74sm4517149ejg.177.2023.02.11.15.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 15:13:04 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 02/50] drm/msm/dpu: disable features unsupported by QCM2290
Date:   Sun, 12 Feb 2023 01:12:11 +0200
Message-Id: <20230211231259.1308718-3-dmitry.baryshkov@linaro.org>
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

QCM2290 doesn't seem to support reg-dma, UBWC and CSC. Drop
corresponding features being incorrectly enabled for qcm2290.

Cc: Loic Poulain <loic.poulain@linaro.org>
Fixes: 5334087ee743 ("drm/msm: add support for QCM2290 MDSS")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 84d974458e0d..eea026cf3ac2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -12,11 +12,15 @@
 #include "dpu_hw_catalog.h"
 #include "dpu_kms.h"
 
-#define VIG_MASK \
+#define VIG_BASE_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
-	BIT(DPU_SSPP_CSC_10BIT) | BIT(DPU_SSPP_CDP) |\
+	BIT(DPU_SSPP_CDP) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
 
+#define VIG_MASK \
+	(VIG_BASE_MASK | \
+	BIT(DPU_SSPP_CSC_10BIT))
+
 #define VIG_MSM8998_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
 
@@ -29,7 +33,7 @@
 #define VIG_SM8250_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
 
-#define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
+#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
 #define DMA_MSM8998_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
@@ -317,7 +321,6 @@ static const struct dpu_caps qcm2290_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2,
-	.ubwc_version = DPU_HW_UBWC_VER_20,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
 	.max_linewidth = 2160,
@@ -2841,8 +2844,6 @@ static const struct dpu_mdss_cfg qcm2290_dpu_cfg = {
 	.intf = qcm2290_intf,
 	.vbif_count = ARRAY_SIZE(sdm845_vbif),
 	.vbif = sdm845_vbif,
-	.reg_dma_count = 1,
-	.dma_cfg = &sdm845_regdma,
 	.perf = &qcm2290_perf_data,
 	.mdss_irqs = IRQ_SC7180_MASK,
 };
-- 
2.39.1

