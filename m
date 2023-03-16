Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 019FD6BD557
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 17:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjCPQSG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 12:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjCPQRu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 12:17:50 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A67E251D
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:25 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id h9so2277492ljq.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678983443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYmqhVUp4BKDlEVSRtGpM8bjg8A0Sbg6UZGPpwrptW0=;
        b=jNU/xGV9uFB/izDACusfDEwcNAs//JOmcKkU+1XUa/tJ9JSfBqcNSM54kembMZQt9J
         O0lxUthyLlkmc6ph4a6/k1ixxasfKAWhdFMQcPnxxCmkPowETYZJ7Y8lVOrQ8CzSYU/y
         nLNPS9e1E62uVKFhN3D7YySqdfG3gwSBLezJiTE7FB5Xc6qdJJ1agpg7eRLTvYdrYV91
         e9tydZynNfYdmZIlAINmfrPMQJAtFBzpKRoHjhfV9lVwFAH0lh3QcYLC03NRvJRTUgI1
         5zvJ1BgSbtNo1+ZDG+3X53+8REedDSlGxEZl/kmmxBooD9pUxleAkbaAAp4UoAyWP/iV
         4WaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678983443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYmqhVUp4BKDlEVSRtGpM8bjg8A0Sbg6UZGPpwrptW0=;
        b=Sx/jW2xW1drN9enRK6S4db+x1UYpXMXWf2hTmSGMtwPxVpLsSLz2NPeFMwyPUJ1gIg
         nRaZM5H+Ibj7OYIpAHeVoBts6PWwFZHgOBzg8b2WyEcQXXmu/lj8YW7WgwBMrTDwPDAO
         TbjKKmKQwpkytlyXwFAyXCtp8NydEcmCB4ikZu2bt370rKmxvaqaS3PbKtWyDva8Fe3g
         +4a2+GfzUsk7axqWjfMZaHKbMGLRnxg/WJmta61NzsjWzpNiJdeoqN2OeEo9bqIMKSOs
         YrKInlQXmizYghMsg1jvPkofbRhKZgIvFlWAXRLQAI50uv6kKH3JFTtxgIgsLv8gnYA0
         5Zfg==
X-Gm-Message-State: AO0yUKVvj1OPE0a8XdU/rmMH7RQaOwKBXgEnv314N0pAkcrzjnr18aeO
        rAqcC6Ckg/xDUlQlQo9oneXGfA==
X-Google-Smtp-Source: AK7set+Z9ralPl6qxNa5CnY/JfCfIOiHvv3XY/6IXx5joRaQH3Lp0PfDadsn8VO3PrpLeZSJI6PUwQ==
X-Received: by 2002:a05:651c:b10:b0:298:9c6c:eca7 with SMTP id b16-20020a05651c0b1000b002989c6ceca7mr3059751ljr.8.1678983443015;
        Thu, 16 Mar 2023 09:17:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l2-20020a2e8342000000b00298b33afe1csm549152ljh.87.2023.03.16.09.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:17:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v7 31/32] drm/msm/dpu: log the multirect_index in _dpu_crtc_blend_setup_pipe
Date:   Thu, 16 Mar 2023 19:16:52 +0300
Message-Id: <20230316161653.4106395-32-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
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

