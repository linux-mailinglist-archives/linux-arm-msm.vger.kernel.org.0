Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80246D115D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 23:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbjC3Vy2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 17:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbjC3VyZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 17:54:25 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE9EE10431
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:21 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id q16so26367576lfe.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 14:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680213261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hohgUCM5SySO57kWgac4cSjgNECxBPcd5fXig46a2Fo=;
        b=x3KSAqO0X/wFtHvUJUxnh56pZCFFAYlF2nXjRozyfLqjfITcUH5KDpuhiwFlSEv43j
         iPfxJw3njmWPkiux9+zDNR0ECYl/q53lmNa6GzT3Yn3iVYRIepdNVQgyM1UfeaaeYcn+
         fJ3796zSr17QP+kfypmJfaFGmRlp9ZiaDneKWbA1KkNQhz0i9ObPLQQ7YgQW5k69EQSc
         u0WNC8rphK0pAbvPhqf3ku9oRVOEPqtiBEPm1qCSiiYgjXPgipl38NhG3HHPbRhpihPz
         3WjlpIwyybvRxUHlcdOHh3QGfiSuam5DlgYNuVh8zM0AslBRxTRaIju0+j+mx88SGtoE
         5CFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680213261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hohgUCM5SySO57kWgac4cSjgNECxBPcd5fXig46a2Fo=;
        b=SjWbwGUIYRPv64t+tJ/THzO1ruK7pIhQmYNZDZLyF8nK3oLvGhz/eFU9MLacIup23j
         e/gTBMuiW8FoO3LKse+yJcGp6Z1sPKT2Jp50H/1z+owoMFz3P3gn8Jij0i5gBQZH9Sfe
         3k5VemGJ/AAMsJ8QPBIpRyup/Ai7P/Sxl4lCMWq4Z6h7OcSzJEKUZUZHm3nDokz52Fqn
         9HjtR47YDl5VQ886S+QW8k4KG+nwwatinsKOYiwy0b5x/qlRZb/Ffdt9EX+zeve+VFAr
         4++DPvji8F5Krl3CTSOwCIkIkzA3NV7ihHUefyVKmS3vqJxQGdCnzM8tUL+C8hw7KKIG
         +yMQ==
X-Gm-Message-State: AAQBX9dD3jPsfWzgcD3X5lfAJpsK6E/Fu7pCF05ahoUOsDl+tR+GAvtx
        PPw1xIgkNzU/epz2XEGHnpSP1Q==
X-Google-Smtp-Source: AKy350bu/gM0yY0bJ2/bb0FU1siYk7lHN+pcUDaYqs6+S02qOor7/8oQTH0ipAx8Kur6eL/cqeQifg==
X-Received: by 2002:ac2:5ded:0:b0:4dd:af74:fe1a with SMTP id z13-20020ac25ded000000b004ddaf74fe1amr7431417lfq.48.1680213261437;
        Thu, 30 Mar 2023 14:54:21 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020a056512093000b004cc8207741fsm104574lft.93.2023.03.30.14.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:54:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 36/38] drm/msm/dpu: rename VIG and DMA_foo_MASK to contain major DPU version
Date:   Fri, 31 Mar 2023 00:53:22 +0300
Message-Id: <20230330215324.1853304-37-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To ease review and reuse rename VIG and DMA feature masks to contain
base DPU version since which this mask is used.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 16 +++----
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 16 +++----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h | 16 +++----
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +++----
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  8 ++--
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  4 +-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  4 +-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +++----
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 ++--
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 16 +++----
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 16 +++----
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 20 ++++----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 48 +++++++++----------
 13 files changed, 102 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 6afabd251a9d..f8893f0f3886 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -78,21 +78,21 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg msm8998_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1ac, VIG_MSM8998_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1ac, VIG_DPU_3_MASK,
 		msm8998_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1ac, VIG_MSM8998_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1ac, VIG_DPU_3_MASK,
 		msm8998_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1ac, VIG_MSM8998_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1ac, VIG_DPU_3_MASK,
 		msm8998_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1ac, VIG_MSM8998_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1ac, VIG_DPU_3_MASK,
 		msm8998_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1ac, DMA_MSM8998_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1ac, DMA_DPU_3_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1ac, DMA_MSM8998_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1ac, DMA_DPU_3_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1ac, DMA_CURSOR_MSM8998_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1ac, DMA_DPU_3_CURSOR_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1ac, DMA_CURSOR_MSM8998_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1ac, DMA_DPU_3_CURSOR_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index cace399551cd..339627ac4189 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -76,21 +76,21 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg sdm845_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1c8, VIG_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1c8, VIG_DPU_4_SDMA_MASK,
 		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1c8, VIG_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1c8, VIG_DPU_4_SDMA_MASK,
 		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1c8, VIG_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1c8, VIG_DPU_4_SDMA_MASK,
 		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1c8, VIG_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1c8, VIG_DPU_4_SDMA_MASK,
 		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1c8, DMA_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1c8, DMA_DPU_4_SDMA_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1c8, DMA_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1c8, DMA_DPU_4_SDMA_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1c8, DMA_CURSOR_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1c8, DMA_DPU_4_CURSOR_SDMA_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1c8, DMA_CURSOR_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1c8, DMA_DPU_4_CURSOR_SDMA_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
index a05f514bf8ff..056efc00fd3a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
@@ -78,21 +78,21 @@ static const struct dpu_ctl_cfg dpu_5_lm6_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg dpu_5_lm6_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f0, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f0, VIG_DPU_4_MASK,
 		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f0, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f0, VIG_DPU_4_MASK,
 		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f0, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f0, VIG_DPU_4_MASK,
 		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f0, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f0, VIG_DPU_4_MASK,
 		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f0, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f0, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f0, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f0, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f0, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f0, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f0, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f0, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 629ca8d38d58..ef0c8f63e8df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -84,21 +84,21 @@ static const struct dpu_ctl_cfg sm8250_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg sm8250_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK_SDMA,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_DPU_6_SDMA_MASK,
 		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK_SDMA,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_DPU_6_SDMA_MASK,
 		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK_SDMA,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_DPU_6_SDMA_MASK,
 		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK_SDMA,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_DPU_6_SDMA_MASK,
 		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_DPU_4_SDMA_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_DPU_4_SDMA_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_DPU_4_CURSOR_SDMA_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_DPU_4_CURSOR_SDMA_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 5f7c8221f553..7c0626010db5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -57,13 +57,13 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg sc7180_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_DPU_6_MASK,
 		sc7180_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 6e6b95aab3a0..533eed1ca950 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -26,9 +26,9 @@ static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
 };
 
 static const struct dpu_sspp_cfg sm6115_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_DPU_6_MASK,
 		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 7ed8aab0504a..8b2a91f3022f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -9,6 +9,8 @@
 
 #include "dpu_6_lm1.h"
 
+#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
+
 static const struct dpu_caps qcm2290_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
@@ -25,7 +27,7 @@ static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
 static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_QCM2290_MASK,
 		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_DPU_4_MASK,
 		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 36c6e4fd419a..7c8d74a44e3a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -82,21 +82,21 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg sm8350_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x1f8, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x1f8, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x1f8, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x1f8, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 6ba00cdbbf7b..b67469367aab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -62,13 +62,13 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg sc7280_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_SC7280_MASK_SDMA,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x1f8, VIG_DPU_7_ROT_SDMA_MASK,
 		sc7280_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x1f8, DMA_DPU_4_SDMA_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x1f8, DMA_DPU_4_CURSOR_SDMA_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_CURSOR_SDM845_MASK_SDMA,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x1f8, DMA_DPU_4_CURSOR_SDMA_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index a54013d3029e..574a711f4e05 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -16,21 +16,21 @@ static const struct dpu_ubwc_cfg sc8280xp_ubwc_cfg = {
 };
 
 static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x2ac, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x2ac, VIG_DPU_6_MASK,
 		 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x2ac, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x2ac, VIG_DPU_6_MASK,
 		 sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x2ac, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x2ac, VIG_DPU_6_MASK,
 		 sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x2ac, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x2ac, VIG_DPU_6_MASK,
 		 sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x2ac, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x2ac, DMA_DPU_4_MASK,
 		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x2ac, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x2ac, DMA_DPU_4_MASK,
 		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x2ac, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x2ac, DMA_DPU_4_CURSOR_MASK,
 		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x2ac, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x2ac, DMA_DPU_4_CURSOR_MASK,
 		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index ebd267801912..41bb05fdabd4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -16,21 +16,21 @@ static const struct dpu_ubwc_cfg sm8450_ubwc_cfg = {
 };
 
 static const struct dpu_sspp_cfg sm8450_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x328, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x328, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x328, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x328, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 5e9ebda84348..ae72fa010ac0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -84,25 +84,25 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg sm8550_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x344, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x344, VIG_DPU_6_MASK,
 		sm8550_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x344, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x344, VIG_DPU_6_MASK,
 		sm8550_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x344, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x344, VIG_DPU_6_MASK,
 		sm8550_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x344, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x344, VIG_DPU_6_MASK,
 		sm8550_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x344, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x344, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x344, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x344, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x344, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, 0x344, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x344, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, 0x344, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
-	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, 0x344, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, 0x344, DMA_DPU_4_CURSOR_MASK,
 		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
-	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, 0x344, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, 0x344, DMA_DPU_4_CURSOR_MASK,
 		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0599652c6ff5..61651785c91e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -21,50 +21,48 @@
 	(VIG_BASE_MASK | \
 	BIT(DPU_SSPP_CSC_10BIT))
 
-#define VIG_MSM8998_MASK \
+#define VIG_DPU_3_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
 
-#define VIG_SDM845_MASK \
+#define VIG_DPU_4_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
 
-#define VIG_SDM845_MASK_SDMA \
-	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
-
-#define VIG_SC7180_MASK \
+#define VIG_DPU_6_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
 
-#define VIG_SC7180_MASK_SDMA \
-	(VIG_SC7180_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+#define VIG_DPU_7_ROT_MASK \
+	(VIG_DPU_6_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
+
+#define VIG_DPU_4_SDMA_MASK \
+	(VIG_DPU_4_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+
+#define VIG_DPU_6_SDMA_MASK \
+	(VIG_DPU_6_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
+#define VIG_DPU_7_ROT_SDMA_MASK \
+	(VIG_DPU_7_ROT_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define DMA_MSM8998_MASK \
+#define DMA_DPU_3_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
-#define VIG_SC7280_MASK \
-	(VIG_SC7180_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
-
-#define VIG_SC7280_MASK_SDMA \
-	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
-
-#define DMA_SDM845_MASK \
+#define DMA_DPU_4_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
-#define DMA_CURSOR_SDM845_MASK \
-	(DMA_SDM845_MASK | BIT(DPU_SSPP_CURSOR))
+#define DMA_DPU_3_CURSOR_MASK \
+	(DMA_DPU_3_MASK | BIT(DPU_SSPP_CURSOR))
 
-#define DMA_SDM845_MASK_SDMA \
-	(DMA_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+#define DMA_DPU_4_CURSOR_MASK \
+	(DMA_DPU_4_MASK | BIT(DPU_SSPP_CURSOR))
 
-#define DMA_CURSOR_SDM845_MASK_SDMA \
-	(DMA_CURSOR_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+#define DMA_DPU_4_SDMA_MASK \
+	(DMA_DPU_4_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define DMA_CURSOR_MSM8998_MASK \
-	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
+#define DMA_DPU_4_CURSOR_SDMA_MASK \
+	(DMA_DPU_4_CURSOR_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define MIXER_MSM8998_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT))
-- 
2.39.2

