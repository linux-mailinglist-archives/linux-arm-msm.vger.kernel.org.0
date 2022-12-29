Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DC3E6590F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 20:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234009AbiL2TTV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 14:19:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233970AbiL2TTT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 14:19:19 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 771828FD4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:18 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 1so28744517lfz.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 11:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b2XgrhNnjMtMnZg+chXpHXUewoPXnncH9a6l9JUQxT4=;
        b=WxgQhyUbRXosLxUQBoea0k/Uj0esZXkuBGuSncBfc6tymtB14cSfB1o/xocRE4d0vy
         PcStPVA9LEEvn5FaMfePhU4ygdknG3wt924f05JtrMQfplpXl+ERnGOveS+P4qW9l5xy
         tP3vfCpqMDmjKuSrTa7G55ZoyMwHFLPycuiseAGnBfG0z0EbmVujgh8BxfF6RrOOWhK0
         ZRFp0PbuBbezObj2hkFqdtIJCgCXTlkF0rKlDkThYoj0hzRT0XOTqi2iwbOopgyPeUej
         GlI5RJIQAclUuZ7cf6zWrwhijm+54iI3FVqrEDhlWjyqGOpvjCtdfhn4FHX9ltlMHLFK
         9gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2XgrhNnjMtMnZg+chXpHXUewoPXnncH9a6l9JUQxT4=;
        b=PV8VSdLenbkGPyzKX5WzLrI4QLETxVtUVd7wb8oqz3WV7r3W/5ltP2Ld3KrfI1yi6+
         8Ow3zhPgvfNdoDo7lmvmbDCfauM/kls38HRlm8UuYd2lvGDtAawPtIsP+eX3r+8K+vF2
         Z/9yaKIpHjEKea9kPS9KdG/CZ565YD1KCM9OyP6m7YlwwbAuO5nGifIucgzyPfcsKAtJ
         qMgaJWUvN7HdpreK7KjVEKo9HqPsI/ryJCMt8yFsjzWBs5HHiwuCoy+Wa2nvymovsQ45
         mA3LIV1JJYuhrRqL/osz7Jro9l/28GUQI46Te6zZaPtg2NDHN/ydSedP151rc270k0cU
         gKcw==
X-Gm-Message-State: AFqh2kpwZrsqquybTDKfOEccQbhrp9AlWSIwuE4sPbhoOlabSUw1FZTN
        kgswZCPrcDwgJfyGv7QnpxFebA==
X-Google-Smtp-Source: AMrXdXubzJtiMIABJMG6kmlzaDS1b6GjAupEN4ByPdhfl08o9GKqHlgf1KibZl8ApiQiqmkZZ3pfLA==
X-Received: by 2002:a05:6512:2247:b0:4b5:7338:e2c7 with SMTP id i7-20020a056512224700b004b57338e2c7mr9220507lfu.53.1672341558078;
        Thu, 29 Dec 2022 11:19:18 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 11:19:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 20/27] drm/msm/dpu: populate SmartDMA features in hw catalog
Date:   Thu, 29 Dec 2022 21:18:49 +0200
Message-Id: <20221229191856.3508092-21-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
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

Downstream driver uses dpu->caps->smart_dma_rev to update
sspp->cap->features with the bit corresponding to the supported SmartDMA
version. Upstream driver does not do this, resulting in SSPP subdriver
not enbaling setup_multirect callback. Add corresponding SmartDMA SSPP
feature bits to dpu hw catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 2196e205efa5..61e95fb21403 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -21,13 +21,16 @@
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
 
 #define VIG_SDM845_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SC7180_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SM8250_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
@@ -42,6 +45,7 @@
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
+	BIT(DPU_SSPP_SMART_DMA_V2) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define DMA_CURSOR_SDM845_MASK \
-- 
2.39.0

