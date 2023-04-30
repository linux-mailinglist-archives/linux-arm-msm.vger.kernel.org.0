Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA836F2AC3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Apr 2023 22:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjD3U5U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 16:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbjD3U5S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 16:57:18 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D50AF129
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:57:15 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2a7af0cb2e6so18109621fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682888234; x=1685480234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAkR23zkkyf9Wkl6Khyv3JylzpjSXO4fS055r2qRS9Q=;
        b=mIxHzte1vX3IypxGpIbigX6LuADOteUZqYNQSJs0qCH96Tv0Cz6EvyRepuinnBqPqI
         9SHrHBXCmE+ElDzV72a6G902mvzSbwooHRipEKxthm3yay4NNsyYVJN0GKfPHKXnLW+G
         VaH987enQo1v0f9vFab1Il808JCCSk11VZ1PBkPjk20RLpV1n0X9YXoYqElomMNUUtEM
         nwvvXhz0iEebx1CVZNsw1nH3OCM/+mENrbaT5nH3kC1fFw9AVzikjb8/orxv2XX1lB2X
         1Di0En3EAAbQwQCeywSfq1tfD5rtumoyzWgtAebzfunFmRYlA3bNC2bpQlqIpzEdZMW6
         empQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682888234; x=1685480234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iAkR23zkkyf9Wkl6Khyv3JylzpjSXO4fS055r2qRS9Q=;
        b=aCIUvjPJVPwZTjQ3c4wCkQw5XuUdub13llnhli1A5MbYEuZ50u/eqESkOKU6cHt7Cj
         ZwUVl+9aIhv6vu5HPIGok6F1EesgwFn9RdYe0ZFWuIH5RVhfoK8LTsZRg4qVHimrSjvq
         nA014UKVwWCjWrc2oE+ZXBg+01LFGLMX75GPIMv6OwuYa14yq7Jo8KnF5WOsFpUPxjra
         kFFtG+wx1YtzUlvCxUH5xWgyeVvbhzrdWPmsDADiXxdUBAirf3lf6EATryHjHVLk6Bvh
         qfyoPs38llFL18QZozkRM3tlGjC7zzwnXaAO04QCHZAX5Ck9omptnIo0Y5KDcWbiWZ3W
         J5Lg==
X-Gm-Message-State: AC+VfDy8V2B70A8aaU2DXuYpJvLUlA9QyLi1ioyIuhVPTrni8GlqtTlp
        CdWyW0m2BmtXfEu4UM0QZglosA==
X-Google-Smtp-Source: ACHHUZ6vAyR+ERcPrTCegKpt1HG5wG2/iVK6IvYwk5jxNlhDYBKOnYEoffn1m4OjIkRsFAfnrBPP4Q==
X-Received: by 2002:a2e:80c8:0:b0:2a8:ac5c:d8f1 with SMTP id r8-20020a2e80c8000000b002a8ac5cd8f1mr2829002ljg.1.1682888234207;
        Sun, 30 Apr 2023 13:57:14 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 13:57:13 -0700 (PDT)
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
Subject: [PATCH 3/9] drm/msm/dpu: fix the condition for (not) applying QoS to CURSOR SSPP
Date:   Sun, 30 Apr 2023 23:57:04 +0300
Message-Id: <20230430205710.3188230-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
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

The function dpu_plane_sspp_update_pipe() contains code to skip enabling
the QoS and OT limitis for CURSOR pipes. However all DPU since sdm845
repurpose DMA SSPP for the cursor planes because they lack the real
CURSOR SSPP. Fix the condition to actually check that the plane is
CURSOR or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 43d9fbc0c687..36f6eb71fef8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1124,7 +1124,8 @@ static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
 	_dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
 	_dpu_plane_set_danger_lut(plane, pipe, fmt);
 
-	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
+	if (pipe->sspp->idx == SSPP_CURSOR0 ||
+	    pipe->sspp->idx == SSPP_CURSOR1) {
 		_dpu_plane_set_qos_ctrl(plane, pipe, true, DPU_PLANE_QOS_PANIC_CTRL);
 		_dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
 	}
-- 
2.39.2

