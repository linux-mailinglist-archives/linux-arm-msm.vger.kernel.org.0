Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09D5779F9C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 07:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbjINFHR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 01:07:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232391AbjINFHP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 01:07:15 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8F621BCA
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:11 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bd0d135ca3so8077911fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694668030; x=1695272830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDVBklRS/zpCaNNSChXZ8oT1YIvTUFQciSEHjoiQ7eM=;
        b=kAEhKU6eu1IU6hLcbJioDKp/HHE83IQtLcUqcqwGl8NQnWlVhKoPFXUz19ECfEYSq+
         CCW8DiImYc2OMzZy9wj3gQNkn9t+OyyeKoaLgHfHUQfQNurne+1Q6RMRi07OKCH8FCXc
         Pb4XrDJrTwCKgJr9DVvi7jMyNuw3DJg4H7bfAMVJrfvim+rOLvYNKbFSR7GgbvhtLcGs
         O3pusBWW7Ii7wgZXrjQ8fIPeOMsgD62MqhwNnhMxxQ054x2V8BMA05kWjdLLKbIpwSx1
         Uqcx4H04JO7jRfmyBXOsJfan/tAT78+/czhSfjiQoELWT7DYScwX8yry5VGDqrv2lh4a
         eW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694668030; x=1695272830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDVBklRS/zpCaNNSChXZ8oT1YIvTUFQciSEHjoiQ7eM=;
        b=cCTZ2OZBhr1ujxk1Pft/KWxpPe+q8rCAtliHH9xJ+iriyGVX6T0Q1ewsv8JfPCJhCx
         Uoqt8g7x70m40Ch0Z8B4HnQ0MkAKbj619t1oiPKL2N69cZ1MTuqfBaFKT87vFMJN8q4I
         qB0p0pjV85eokAFVorQCr29J9kZRqJO5qZ3oPnnZLAmwnnWkeJ/FCNIbHRMG3uqBrkHj
         qLijcQxDJEJS26xZf74JOMXs3+n4tYtHJZAHwjZW+GgCo7txlbDwHr9/NxfVlwdrad0q
         y2ver2G9Rg3llToZkJhQL9YOMd4iV05frRQkzQraptv5fGq+OiPWDZuBv3baqExUH99k
         UJEw==
X-Gm-Message-State: AOJu0YwbFBr3Wm7RO+bIOn2Ra8izs5VWNu3pPC+rD679/CjEZLqipbK2
        t86P7HiUKB7dRCvG6hfPbi40MQ==
X-Google-Smtp-Source: AGHT+IHPChJTKjldNEoz195k+W1j/GESq9pdPTvGHhkhrGfQyU4w3OWF9yh/r4UEcZrnrjDEfCYaoQ==
X-Received: by 2002:a2e:9bc3:0:b0:2b9:3684:165 with SMTP id w3-20020a2e9bc3000000b002b936840165mr3830429ljj.8.1694668030013;
        Wed, 13 Sep 2023 22:07:10 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 22:07:09 -0700 (PDT)
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
Subject: [PATCH v3 03/12] drm/msm/dpu: take plane rotation into account for wide planes
Date:   Thu, 14 Sep 2023 08:06:57 +0300
Message-Id: <20230914050706.1058620-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Take into account the plane rotation and flipping when calculating src
positions for the wide plane parts.

This is not an issue yet, because rotation is only supported for the
UBWC planes and wide UBWC planes are rejected anyway because in parallel
multirect case only the half of the usual width is supported for tiled
formats. However it's better to fix this now rather than stumbling upon
it later.

Fixes: 80e8ae3b38ab ("drm/msm/dpu: add support for wide planes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 ++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..67f9c2a62a17 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -827,16 +827,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	pipe_cfg->src_rect = new_plane_state->src;
-
-	/* state->src is 16.16, src_rect is not */
-	pipe_cfg->src_rect.x1 >>= 16;
-	pipe_cfg->src_rect.x2 >>= 16;
-	pipe_cfg->src_rect.y1 >>= 16;
-	pipe_cfg->src_rect.y2 >>= 16;
-
-	pipe_cfg->dst_rect = new_plane_state->dst;
-
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
@@ -852,6 +842,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+
+	pipe_cfg->dst_rect = new_plane_state->dst;
+
+	drm_rect_rotate(&pipe_cfg->src_rect,
+			new_plane_state->fb->width, new_plane_state->fb->height,
+			new_plane_state->rotation);
+
 	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
 		/*
 		 * In parallel multirect case only the half of the usual width
@@ -899,6 +898,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
 	}
 
+	drm_rect_rotate_inv(&pipe_cfg->src_rect,
+			    new_plane_state->fb->width, new_plane_state->fb->height,
+			    new_plane_state->rotation);
+	if (r_pipe->sspp)
+		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+				    new_plane_state->fb->width, new_plane_state->fb->height,
+				    new_plane_state->rotation);
+
 	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
 	if (ret)
 		return ret;
-- 
2.39.2

