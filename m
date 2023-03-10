Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8E696B3333
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 01:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjCJA5x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 19:57:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229959AbjCJA5g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 19:57:36 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E73D104F6D
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 16:57:34 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id i9so4610348lfc.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 16:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678409853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtctQiWrw8CF1uE+qEucLKjdvnucdXX1kHffuJTXWDs=;
        b=ivbbPNo+0F41iY5fOEQhvhupl9Zhw9V/A7fEtKvS1Gn/ZZPKzYhfsYZPDZBv3j9n27
         wn/DUinRiAGnh393jsm3Y0K5XQYVLo3ol8f7rwm64mUsjhdSACn41ovi9QY3RzOUxdqO
         G7YTtJBX1MARIkAK06yLQuB89Soa5M7KceP2X+gpAT8v4YXByomtv4f8Kcz3WFhC0hvl
         7ZzXXnDWWZH1G+P36z9luFXlHIjydgvzNuVwwzPF3/X+C3Mmqswxh2IecT5qjPGkn9K2
         UygLsjuMofP5kNSiPbM9k9coV335DnWphbabSbULu/eOC0tvi+CndmyPJFeJGmCALlVy
         Y6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678409853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtctQiWrw8CF1uE+qEucLKjdvnucdXX1kHffuJTXWDs=;
        b=ozwnN0pWRQcqYb0pw+5/wbov6sGrBG+Mfikb9GlUha10gTTzi6HEPC6KXu+Xnu9PQH
         2jiZP7r3gmWlQdW0Nh9JHI5yvwIIgoOt9Taz2ydDwayf8H63ZCv3gIhxJLxziOzApbs+
         xeDHKKfm8AT9rimvURK9aj02F+Uu7GofZ8OislO6j+ZScPFRkk5ZyWrL8o5qeO57N6Fr
         dXKE+EnntnJ5Mn2X1f8O6MEQl2PnYZ7I+CLwuMdQBR+XzA+hzSAk5GGsamR3HrqmSz4w
         sBrrMTqHphIaUsLo6RJVPeEVvQnFaI0oymxo/dbhYevpFEjMe7ctSwJ0IxgSuDdwKKx4
         ZoaA==
X-Gm-Message-State: AO0yUKUQl8/Ph/tOY3f784rG+ssETwiAZWjkSmA6kif0XLIqt8pwxE3N
        aUtr3wu6qfqc49Gyf10sWlPjxg==
X-Google-Smtp-Source: AK7set9ms7ls8e1csmugiFJ2afVXO0bUtPWycKEbfjyxli7nqXJ5JEGGfReHnEwDVuityeIrrmzMRw==
X-Received: by 2002:ac2:46c9:0:b0:4cc:9736:3551 with SMTP id p9-20020ac246c9000000b004cc97363551mr7590619lfo.31.1678409853615;
        Thu, 09 Mar 2023 16:57:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m13-20020ac2428d000000b004d8540b947asm75280lfh.56.2023.03.09.16.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 16:57:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 31/32] drm/msm/dpu: log the multirect_index in _dpu_crtc_blend_setup_pipe
Date:   Fri, 10 Mar 2023 02:57:03 +0200
Message-Id: <20230310005704.1332368-32-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
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
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b748c4f17c90..96ffea069120 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -425,12 +425,13 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
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
2.39.2

