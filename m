Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2CB0692D0C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Feb 2023 03:11:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjBKCLm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 21:11:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjBKCLl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 21:11:41 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D75DA78D4F
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:38 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id gr7so20208504ejb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 18:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lh/Qeg3BB0N/wLxAWsWOqh+2vLr7f+pTBeHs03a81EA=;
        b=al5bRzbm6nplgrBX73lZycqI+hZLWXHlEpfqRRdjU9uGp+oE4O0agT1tVJSc89kHv0
         hLjGiMA+HWR4/veWVU1orLA7iqHpHT2zr6BRPZYTAHfYE3Z6x0/wbMKvqljg8sltD+Yy
         rj/xMMqMY7Gi2ROoN/1kOsOv81hSoDXB4RNaY2ASXO8eEd6HQ/o+TKaEkheryfmOqdD/
         XArhHzWVs2BdlN3Oi4QqDgvfpPPP3ogPjw3SR6AiQ57SPMLT3H46ZiYZmFSVOBTCGlnS
         QUfXLWoBlya+v6DX7ZcvNfKnWA8LKhosNHUInDTapvLIdoIaeUgWSlUXanS915wHWcpy
         XLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lh/Qeg3BB0N/wLxAWsWOqh+2vLr7f+pTBeHs03a81EA=;
        b=L7421SgSASHX4rivIbBcddeNenQsXKH1jDuNp1eLx4YPmNiG5B9yLBnw1rY0TjsWzF
         UfN7fPqg49Tuy4xr+4lbg2TzNUCJMyeIyu5vEn1Dxv0hlzbjRzW0NoyTI/VwdB4F15oN
         td3OqcbubVM3IgYx4qhzW73OzE8oQzX+aZtbKiWUdII4J4lhva5TDBdiuP6kRn38t7R/
         XpsMT3jRbAdc7UWq8GdmKnuTCzL1gVbwyNOxb7z2E1VTPj/0A6VCJzpcj4yI1EhjkDyP
         7FnUqFzm/gXjYOVVffXb1dGw4v7vyavOUSkjxxtUl8MgZRPNJZLormdXSoX/rUIwmgU8
         klIg==
X-Gm-Message-State: AO0yUKVz1UbHyQP7S9CfjXmUIJWckQASQ4e1lNvPqEw3LUHCVW4xJyt2
        SiurDkPU+erszIhN5cBA0VvLDw==
X-Google-Smtp-Source: AK7set9Ohs3RPnMC/KwsAjjMcOf9nw9MNI8TjxTJQG4gjflpE6OqV20J5avLi5Ffi6uKyFIpciwyXQ==
X-Received: by 2002:a17:907:b681:b0:8af:4327:cf38 with SMTP id vm1-20020a170907b68100b008af4327cf38mr6730578ejc.26.1676081497381;
        Fri, 10 Feb 2023 18:11:37 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 18:11:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 40/43] drm/msm/dpu: rename VIG and DMA_foo_MASK to contain major DPU version
Date:   Sat, 11 Feb 2023 04:10:50 +0200
Message-Id: <20230211021053.1078648-41-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
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

To ease review and reuse rename VIG and DMA feature masks to contain
base DPU version since which this mask is used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 16 +++++------
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 16 +++++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h | 16 +++++------
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 16 +++++------
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  8 +++---
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  5 +++-
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  4 ++-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 16 +++++------
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  8 +++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h | 16 +++++------
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 20 +++++++-------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 27 ++++++++-----------
 12 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 8ae582542be6..842acd32b5ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -79,21 +79,21 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg msm8998_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_MSM8998_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_DPU_3_MASK,
 		msm8998_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_MSM8998_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_DPU_3_MASK,
 		msm8998_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_MSM8998_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_DPU_3_MASK,
 		msm8998_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_MSM8998_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_DPU_3_MASK,
 		msm8998_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_MSM8998_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_DPU_3_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_MSM8998_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_DPU_3_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_MSM8998_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_DPU_3_CURSOR_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_MSM8998_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_DPU_3_CURSOR_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 234154d965b7..5a572b00b1f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -77,21 +77,21 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg sdm845_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_DPU_4_MASK,
 		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_DPU_4_MASK,
 		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_DPU_4_MASK,
 		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_DPU_4_MASK,
 		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
index d0f42d3713f0..f6365604c607 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
@@ -78,21 +78,21 @@ static const struct dpu_ctl_cfg dpu_5_lm6_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg dpu_5_lm6_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_DPU_4_MASK,
 		sdm845_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_DPU_4_MASK,
 		sdm845_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_DPU_4_MASK,
 		sdm845_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SDM845_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_DPU_4_MASK,
 		sdm845_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 0878dc4c8614..3053e5b51198 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -84,21 +84,21 @@ static const struct dpu_ctl_cfg sm8250_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg sm8250_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 90d5c2cb99e1..d2f327be6ca3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -58,13 +58,13 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg sc7180_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_DPU_6_MASK,
 		sc7180_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 7c047ef222f3..eaf41718041e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -9,6 +9,9 @@
 
 #include "dpu_6_lm1.h"
 
+#define VIG_SM6115_MASK \
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+
 static const struct dpu_caps sm6115_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
@@ -29,7 +32,7 @@ static const struct dpu_ubwc_cfg sm6115_ubwc_cfg = {
 static const struct dpu_sspp_cfg sm6115_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SM6115_MASK,
 		sm6115_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index ad2c63b4fa38..248fd2708420 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -9,6 +9,8 @@
 
 #include "dpu_6_lm1.h"
 
+#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
+
 static const struct dpu_caps qcm2290_dpu_caps = {
 	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
@@ -26,7 +28,7 @@ static const struct dpu_ubwc_cfg qcm2290_ubwc_cfg = {
 static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_QCM2290_MASK,
 		 qcm2290_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_DPU_4_MASK,
 		 qcm2290_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index ec28d8731537..05e7db7b6fc0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -82,21 +82,21 @@ static const struct dpu_ctl_cfg sm8350_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg sm8350_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_DPU_6_MASK,
 		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 96f591ef0584..b498988b71d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -63,13 +63,13 @@ static const struct dpu_ctl_cfg sc7280_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg sc7280_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7280_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_DPU_7_ROT_MASK,
 		sc7280_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_DPU_4_CURSOR_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
index dce3d491f931..a2a0f7062f37 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
@@ -77,21 +77,21 @@ static const struct dpu_ctl_cfg dpu_8_lm6_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg dpu_8_lm6_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_DPU_6_MASK,
 		 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_DPU_6_MASK,
 		 sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_DPU_6_MASK,
 		 sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_DPU_6_MASK,
 		 sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_DPU_4_MASK,
 		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_DPU_4_MASK,
 		 sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_DPU_4_CURSOR_MASK,
 		 sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_DPU_4_CURSOR_MASK,
 		 sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 0daeaaf14677..661f4c67eb4c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -84,25 +84,25 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
 };
 
 static const struct dpu_sspp_cfg sm8550_sspp[] = {
-	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, VIG_DPU_6_MASK,
 		sm8550_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
-	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, VIG_DPU_6_MASK,
 		sm8550_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
-	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, VIG_DPU_6_MASK,
 		sm8550_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
-	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_SC7180_MASK,
+	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, VIG_DPU_6_MASK,
 		sm8550_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
-	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
-	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_1, 5, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA1),
-	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_10", SSPP_DMA2, 0x28000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_2, 9, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA2),
-	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_SDM845_MASK,
+	SSPP_BLK("sspp_11", SSPP_DMA3, 0x2a000, DMA_DPU_4_MASK,
 		sdm845_dma_sblk_3, 13, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA3),
-	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, DMA_DPU_4_CURSOR_MASK,
 		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
-	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, DMA_CURSOR_SDM845_MASK,
+	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, DMA_DPU_4_CURSOR_MASK,
 		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 8416639f1e3c..8189bbb88b10 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -21,38 +21,33 @@
 	(VIG_BASE_MASK | \
 	BIT(DPU_SSPP_CSC_10BIT))
 
-#define VIG_MSM8998_MASK \
+#define VIG_DPU_3_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
 
-#define VIG_SDM845_MASK \
+#define VIG_DPU_4_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
 
-#define VIG_SC7180_MASK \
+#define VIG_DPU_6_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
 
-#define VIG_SM6115_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+#define VIG_DPU_7_ROT_MASK \
+	(VIG_DPU_6_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
 
-#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
-
-#define DMA_MSM8998_MASK \
+#define DMA_DPU_3_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
-#define VIG_SC7280_MASK \
-	(VIG_SC7180_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
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
 
-#define DMA_CURSOR_MSM8998_MASK \
-	(DMA_MSM8998_MASK | BIT(DPU_SSPP_CURSOR))
+#define DMA_DPU_4_CURSOR_MASK \
+	(DMA_DPU_4_MASK | BIT(DPU_SSPP_CURSOR))
 
 #define MIXER_MSM8998_MASK \
 	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
-- 
2.39.1

