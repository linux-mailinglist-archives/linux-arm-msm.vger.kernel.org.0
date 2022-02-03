Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E22B4A8069
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 09:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349502AbiBCI0g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 03:26:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349580AbiBCI0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 03:26:30 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E85FCC061758
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 00:26:17 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id f10so4325866lfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 00:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8jvPULXIIzR0qzqGPTTUmR7uSAA4jIsRkWAFzhKA5wM=;
        b=tN0CX3/x7KyOve+6YH7O2t+7rzfSwiG1JieGaG3cot3ESYYaTQPzOiBTSJcddDGrGu
         6XXmb0J2mgAZP0KUWm0gmibjzp2sQtYdn56B5nzOVLlD0JawY9XHDp3+Tu1NVo7Qiwc7
         g1Yt/9LvRaXH6LVUABbpiVhwWy8CVDf8hfYw7RQXmFJrzEQOX9ODxgIEIonVvZJeiZwN
         jbDXGHwCeyW31ec1X/fr43svDoj4/UweZP4f9ot3pWxNyMAcEnc19LPxC7l3q8h6k926
         B20Zb1t4UzxgGFItkm5VtE5tDMvcAYTKHtR9KFrh8Q/Wsj8q3LyTLwXZ2hB7/YptARIK
         nDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8jvPULXIIzR0qzqGPTTUmR7uSAA4jIsRkWAFzhKA5wM=;
        b=jZvMkzUAJ1ZiJrW+CVuvrfYYMMaiLFZciT4ltKpYXv6PrOsZcd1PDC31E9n+57wwDI
         AWBtnrjvGfCYU+XKioV79TTzxmeCOeaAY9d+oTmlgRL1/xJmfhaN6VJ5W8LFv1VlbT+V
         uqbTqNov+g2BjzYwBi2814Lx5aKF9kOGCxfQKf0r2ig5nHtroFTARcQCMBGzPrQKzktw
         dalKZopKVBtQKlonCRhGSDw8OLSgjKLI1T3zqIFJhMTawg0Dm0I0mRKl94+XOVaWrm79
         LiAQLvI5VB0ENup2epPa/BQVzSR2Ktc5HVkE8j6dmdsIxDTU1bs0iWy6OyG/+liPod6k
         cm6A==
X-Gm-Message-State: AOAM531+MEma4jsdklpZnAp2x4AlXFTiihyJQQxdJvwQNXmuLfm83bUO
        DVcfGHJC0RMVyG19c9nMImrRRQ==
X-Google-Smtp-Source: ABdhPJwuwmzDXKRStTl6JDYpRGB0zgxUC0uB1/DK/DFZh/CLhIJD8ZlQjWrCzxvWGGVl3nx+hjosVA==
X-Received: by 2002:a05:6512:1292:: with SMTP id u18mr25527911lfs.360.1643876776338;
        Thu, 03 Feb 2022 00:26:16 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n15sm4083440ljh.36.2022.02.03.00.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 00:26:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 4/7] drm/msm/dpu: drop bus_scaling_client field
Date:   Thu,  3 Feb 2022 11:26:08 +0300
Message-Id: <20220203082611.2654810-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We do not use MSM bus client, so drop bus_scaling_client field from
dpu_encoder_virt.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6c1a19ffae38..4530549850f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -127,7 +127,6 @@ enum dpu_enc_rc_states {
  *	Virtual encoder registers itself with the DRM Framework as the encoder.
  * @base:		drm_encoder base class for registration with DRM
  * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
- * @bus_scaling_client:	Client handle to the bus scaling interface
  * @enabled:		True if the encoder is active, protected by enc_lock
  * @num_phys_encs:	Actual number of physical encoders contained.
  * @phys_encs:		Container of physical encoders managed.
@@ -172,7 +171,6 @@ enum dpu_enc_rc_states {
 struct dpu_encoder_virt {
 	struct drm_encoder base;
 	spinlock_t enc_spinlock;
-	uint32_t bus_scaling_client;
 
 	bool enabled;
 
-- 
2.34.1

