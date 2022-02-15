Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2A264B6E87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 15:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbiBOORB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 09:17:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238496AbiBOORA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 09:17:00 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D92127FCB
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:50 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id e17so26912287ljk.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SfdH2ncwmJDrVRdbfNY5r2Qh/hOw/XHnUYkKFPYNhyM=;
        b=psXOCZob0jpOWF7asuePKZv4UaAI+c7tjgwZ2VMSWYNIHWrplAjMRglhd1F/GuHwdO
         fvzJteV13aqlfjbm+xe2i4eVNLwUd8aFaQIhG2GYA9eTz9BkfbbO22Fx5dbkvggU1aLi
         4xuBsSnwM8IUTtgnf/F75xhfr7hMYJwdfmhSKdhDAmlQe4UYEzWBv59SwtqdenbMHwRB
         DW9Y+80j2IMssDKy9S8KKt5h4DI7Fs0fYGiaP2ws4ZrkjTs6RiJxvxArBXRzITNEZtMc
         SB2ClYIQm0Q4h/LBPhdBr6mKIXGhe/9qEYYZayPYQWhya/hRYlecFQ7rEq5EGSXh2h8a
         rUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SfdH2ncwmJDrVRdbfNY5r2Qh/hOw/XHnUYkKFPYNhyM=;
        b=ngXVpgWvR5/lKSOkdYTv4976l2TcaHGWvvyloSLHFWTaI3v80AdX5r26wpFE/2QE/O
         uaqTuo9ZJGKcyEud9yTWBMwPB5a9UOudmvEfu4Q/YqBelEXsSal52n3f3+q28d1zQPw6
         rXSDXuvw+wN9CKyiNlDuuI/almUTTYbA7LmqElxgHLkEMH/OhcXrRoq/zjE54/KADyrz
         eta4l9EXoBikKNrnlLdRpBTq0LeRIrEnHgJftU2Lj1sWmidt9yTO34AZEZD2cXk61QgM
         3wt8oQbsR00glioMJGuGsn0+PVyvHKLRkAOt1ylXt2ulJcGeKZP5nIpnQxpzefhM/XlK
         YeSg==
X-Gm-Message-State: AOAM531zSIbkowa1N8/44Ij7Eq5Dax2aI8Cn3ROWSQYlVNPfl2boVZlx
        4TO7d+A/7a+DojelyaAdbQRBeg==
X-Google-Smtp-Source: ABdhPJy9WjiZJ0f8TLzmTQvnTK3IO2HiB0hdXIcE9BeCBWQlv9dOPnFkWrj64VHMPo/iLYAssw8nFA==
X-Received: by 2002:a2e:88d4:: with SMTP id a20mr2735763ljk.187.1644934607054;
        Tue, 15 Feb 2022 06:16:47 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 06:16:46 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/8] drm/msm/dpu: remove msm_dp cached in dpu_encoder_virt
Date:   Tue, 15 Feb 2022 17:16:38 +0300
Message-Id: <20220215141643.3444941-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
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

Stop caching msm_dp instance in dpu_encoder_virt since it's not used
now.

Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c59976deb1cb..401e37f50d54 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -168,7 +168,6 @@ enum dpu_enc_rc_states {
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
- * @dp:				msm_dp pointer, for DP encoders
  */
 struct dpu_encoder_virt {
 	struct drm_encoder base;
@@ -207,8 +206,6 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
-
-	struct msm_dp *dp;
 };
 
 #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
@@ -2123,8 +2120,6 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
-		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
-- 
2.34.1

