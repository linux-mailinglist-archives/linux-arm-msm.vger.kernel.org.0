Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C81DF7BB8BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 15:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbjJFNPD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 09:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232345AbjJFNPC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 09:15:02 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 284CBA6
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 06:15:00 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso25476691fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 06:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696598098; x=1697202898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqxEMpUKQ/G8V5waQaP2laENlyhCdS/+wJeXJU7A8oM=;
        b=tqf0C7MpWLUcQSMDYfi5fJo11NEOAKFZ+r529+dhbWtpuKNtwdHR4FwSLdKVGm0moA
         isBeQd5YE2sqJIv+62IyCJPVZON+IN+itgZdbxfDBrnPDYezQNb/cepdr+lxpb8IWRI4
         ueWvf+FzyqYMYZlq/dL+htFMsvWgQ2kac/8xM+EfjGDpciQOrtOs74tPZWOT8af38Wtm
         VuDBuRRQaL5ahiR3+dtOTjVuZDuHKVizfGYVIcd1fyzTA1htLxQcuFFpQio7vLqrVnrR
         bz/iIbtvYN5Ttk1efvKoy2RkV9VoJ4L5GueQtZm1ZQ+g2IHxPpkJ5Sz+weT4iybhJnYg
         C9zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696598098; x=1697202898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqxEMpUKQ/G8V5waQaP2laENlyhCdS/+wJeXJU7A8oM=;
        b=APPtSA9bd3dEI0xmaP9FEv5eRFBneQoZGrvYAQ10Lkj2F+g4GwOfYMeM+YOj2atoOK
         1F5I5dCLz6tlXTE0kaWZcKmbFYWgILlGknVq7aXLJQHLytL7QMe9PDpd2Ls+6fuE1w2X
         797VSO8q6Tkifu57YGNBLh7fhbaZngOdrg3p7MtprsYGbaZvI8ubZh14sT+Ig8Gh4s/j
         hmh/kz6UG602PJNhBdxLxNyM01b0tdXo1Ovo0dD7+OyXXPOWppZL0E06SAlgA4iAsi1v
         9zp6BYkSNIPgCEebV7H5qAp+udRtITnJcplLiLUb0i2AGQ4iHlTyHHRVR5WTyFu9cO5O
         TLyA==
X-Gm-Message-State: AOJu0Ywh8LaTtXeR6Q/gVf5xKA4L9nQ3ps3IAl2ZJgLiOex2RQV+0xSb
        jphWK0uxBgdFRZTze+6yYW6jug==
X-Google-Smtp-Source: AGHT+IHE2FyzNcrKHkVaynk0WbV6tf0To7tYw1CaUf9mbDynfP5XagW+DdMNn9k6qlOmzZlebP2R+g==
X-Received: by 2002:a05:6512:3450:b0:501:c3ee:62ec with SMTP id j16-20020a056512345000b00501c3ee62ecmr5851622lfr.12.1696598098430;
        Fri, 06 Oct 2023 06:14:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id g9-20020a19ee09000000b004fbb011c9bcsm301285lfb.161.2023.10.06.06.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 06:14:58 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 08/10] drm/msm/dpu: rewrite scaler and CSC presense checks
Date:   Fri,  6 Oct 2023 16:14:48 +0300
Message-Id: <20231006131450.2436688-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
References: <20231006131450.2436688-1-dmitry.baryshkov@linaro.org>
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

In order to check whether the SSPP block has scaler and CSC subblocks
the funcion dpu_plane_atomic_check_pipe() uses macros which enumerate
all possible scaler and CSC features. Replace those checks with the
scaler and CSC subblock length checks in order to be able to drop those
two macros.

Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 15 ---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 ++--
 2 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index ca02f86c94ed..d1480ff2574a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -21,21 +21,6 @@ struct dpu_hw_sspp;
 #define DPU_SSPP_ROT_90			BIT(3)
 #define DPU_SSPP_SOLID_FILL		BIT(4)
 
-/**
- * Define all scaler feature bits in catalog
- */
-#define DPU_SSPP_SCALER (BIT(DPU_SSPP_SCALER_RGB) | \
-			 BIT(DPU_SSPP_SCALER_QSEED2) | \
-			 BIT(DPU_SSPP_SCALER_QSEED3) | \
-			 BIT(DPU_SSPP_SCALER_QSEED3LITE) | \
-			 BIT(DPU_SSPP_SCALER_QSEED4))
-
-/*
- * Define all CSC feature bits in catalog
- */
-#define DPU_SSPP_CSC_ANY (BIT(DPU_SSPP_CSC) | \
-			  BIT(DPU_SSPP_CSC_10BIT))
-
 /**
  * Component indices
  */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..43135894263c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -740,8 +740,8 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
-	    (!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
-	     !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
+	    (!pipe->sspp->cap->sblk->scaler_blk.len ||
+	     !pipe->sspp->cap->sblk->csc_blk.len)) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
 		return -EINVAL;
-- 
2.39.2

