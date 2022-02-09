Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7E44AF83A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238191AbiBIRZ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238217AbiBIRZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:45 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AF90C0613C9
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:48 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id k13so5524016lfg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hcKdYcy2gg8ZNxU2vs4D1XtYhBHKzBGRudwCCATIQNs=;
        b=b8IR7h5dbRXHphEJjKal5av2yFLfFOoWDbpU/y21y7SUYjXIY3R6u4gHM5E7CnQUsT
         yPoUE1h7KasAhtKVMzYmbWzgaGwAPzYeGt6ARJQxgV1/X2O/JbXpWEVRg4WXGApzgJFQ
         Q7zBeky8DJNnb/P3wwz9eiyPPYMSosqlV0RJ/I2fo5eeg5UQcWm23Q5lhM26hqwtmZZ4
         9mA0rgMoPxvfp2kRlb0aUsTFdsPVzTkjliKap2hcDnh03/sILrrMUcIDHtHxwb8q1JGJ
         n2ZNZ3CFDziviIfDkH4meJ88URKtFxl4ajc7ijVsOjIPDQI8GOYjd24RRkUs5FUHB+m9
         lyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hcKdYcy2gg8ZNxU2vs4D1XtYhBHKzBGRudwCCATIQNs=;
        b=QOE3+YO98elPJPbCYHcJIgjkiQYnRCz+TqRvIllOLyvb8RCBk60l25FZV+qII5XQ3D
         tNAChDvKus9ulYaoPQYyHoRvH1yXaflShpRvvAkXqaQ4XE1mjUb+CVkJ9Ux/POISdnzr
         ZZHVz8JWHgMinP6onvB/UH8Ag6+3+PabQ27gDjj2zvPHhIynWTJNJm43U7kJ3W7nu949
         Erv1p1fey8WA0K8WV9CMhtkpEc0sDLp9MuFubJ4ox4q8zp09b0ffgER3SW9lE9AETK9Y
         k8z66hw5km8K6eHsto+lBmrSKuAuOimmv7ZYKDrhFEXfezjIDbmPbsaNgfz/dBM6RtXL
         TWxg==
X-Gm-Message-State: AOAM5308y/J5NMYjiMqBlRTXE0HkBgUXvO/tRV+MSf8hTqlVyyrguCmI
        SbRZ4pmmeheiwIBd8tn0Y19NTA==
X-Google-Smtp-Source: ABdhPJz8kmyJanrqloX6/6HDqOUPHkqMRTOKp+o5kAZWrtD4BGIGG3nUvTZ+YjEh7LY3vLoUIZ85ow==
X-Received: by 2002:a05:6512:398a:: with SMTP id j10mr2241899lfu.189.1644427546995;
        Wed, 09 Feb 2022 09:25:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:46 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 24/25] drm/msm/dpu: populate SmartDMA features in hw catalog
Date:   Wed,  9 Feb 2022 20:25:19 +0300
Message-Id: <20220209172520.3719906-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
index aa75991903a6..3564eea29563 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -17,17 +17,21 @@
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_EXCL_RECT))
 
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
 
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
+	BIT(DPU_SSPP_SMART_DMA_V2) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define DMA_CURSOR_SDM845_MASK \
-- 
2.34.1

