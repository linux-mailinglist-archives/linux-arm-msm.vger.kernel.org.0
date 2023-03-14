Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 225FA6B99E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 16:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjCNPiP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 11:38:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230451AbjCNPhx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 11:37:53 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 718C6B32AC
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:59 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id g18so16472751ljl.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 08:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678808168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYmqhVUp4BKDlEVSRtGpM8bjg8A0Sbg6UZGPpwrptW0=;
        b=etSSu2orcHYcj00YrL1N1JUxBF+cUdBAhFMPMt1pKkhVy5EFWJVLYuxQeQ7EIIE2A1
         Q0kxgLHduENRm0SAo5mL0YK/yPzzfaL4czehJpZUdPi9oHI8d2EkrMRWJkj0Dvq9BDfu
         IJGDZ6wB2Y6stUCL0hlVy5KP+nrlnIx6QT3rnTtpCfZwWfXOlqydKgJP7otgiZwaNOwI
         vwXGCScDoh9PFWwRAQP20K/HlJ05KoshchjdoqKTbjnk8bZqzygFsaBSntfMruuk2L5k
         2Hu/GehfqTSlWn8AcyBndSnDL4W0kyGVUWU/2x1yCmHecIx4asXjBp3gWQvN4Nipj4gb
         yUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678808168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYmqhVUp4BKDlEVSRtGpM8bjg8A0Sbg6UZGPpwrptW0=;
        b=vfL7Gh3pp32dR50YA1vyJNlIYYqh07cPgZZTLT0TOZ3gKDLeUweYrWen3rX7OvEsw/
         wukpeEzeuMYCwrhmz2cXqQxXFBQ6aTrCrlF4VhpHx57coUnt6wnsengyqh33ykGo8KxD
         zUuqK7k2F4pXOkmSYVqandU7EC0OYRiyWPWqaXEWLvYUpurZO1KUYkPL+C6OzaLGO30G
         NCq84u2SCjMxo2dapX657TB7qjc7tbXGqj5dUQdP410dWTlqPrmJkPy1KgxmMybN2SVV
         yqSCI8E9rhw00f/ZRHUo7PtR1uKxs4hNrpGYJwOdtOUj9tnyjfI7mefEutsRmdEWM14L
         tjpw==
X-Gm-Message-State: AO0yUKWSnEG0haWiZroRJTl3tHeiWX2iRnBqQqcKaf6cuPus88zBXhtb
        5yvreJyIFC6NCd+l6A12OK7dmg==
X-Google-Smtp-Source: AK7set9hINwwmK44/ShtL9sE5Oy8+rdHptMNXVBob1NItm8gVzDrNmHOD9bZjvEBlG60rnvbjfUuWg==
X-Received: by 2002:a2e:a443:0:b0:295:9517:b98f with SMTP id v3-20020a2ea443000000b002959517b98fmr3993358ljn.15.1678808168458;
        Tue, 14 Mar 2023 08:36:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 08:36:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 31/32] drm/msm/dpu: log the multirect_index in _dpu_crtc_blend_setup_pipe
Date:   Tue, 14 Mar 2023 18:35:44 +0300
Message-Id: <20230314153545.3442879-32-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Lets print the multirect_index as well in _dpu_crtc_blend_setup_pipe()
as it will give the complete information of the sw_pipe as well.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 90b406e409d3..508e5b950e52 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -426,12 +426,13 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				   format->base.pixel_format,
 				   modifier);
 
-	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
+	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
 			 crtc->base.id,
 			 stage,
 			 plane->base.id,
 			 sspp_idx - SSPP_NONE,
-			 state->fb ? state->fb->base.id : -1);
+			 state->fb ? state->fb->base.id : -1,
+			 pipe->multirect_index);
 
 	stage_cfg->stage[stage][stage_idx] = sspp_idx;
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
-- 
2.30.2

