Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896293773E3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 May 2021 21:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhEHTyG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 May 2021 15:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhEHTyF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 May 2021 15:54:05 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 106A1C061574;
        Sat,  8 May 2021 12:53:03 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so7874929pjv.1;
        Sat, 08 May 2021 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P7qWaXSLZT/HSg5BGmuOtFL+9OavfUK43XNh+avyzkE=;
        b=Cfz6kXOQ7lqNfnzW70b8KqN+tUSJD0CXYqIS6qaQ1jYmxz8btG4RZHeN1w5BrbyI8O
         dGL2brbo+0eiVkFGuUoqNfqpIiBgcu+ZFkwMM3q9G8kA+j6gUtVEWo8peuSFxZ4QYVzR
         oS/hswtOr5v0V1Se+RGAGRHT6MJgDNK7avqyXT3wBlu5djN7qFJmqh93sBjuyzIWb9Q9
         Ji0Jcoa6GaOtW1fvE5rkTPFN4Mr/rlBjGJkQgs/9tdO3krNNTTsvhinGf3Dp4QN7Cs4P
         xIeDlmvQD5dPJVR2o55d/LYGT3muYdKY5/RrT659fVp9tAf1wjBg/auTDLZKXCcfxgwT
         KUcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P7qWaXSLZT/HSg5BGmuOtFL+9OavfUK43XNh+avyzkE=;
        b=eucR1DFITse3NQqsBDoXEDSd3qWNHc/u9gU6mUsqJo1Fy0fDFn982kFAQ+AJB291/A
         URqil0t5Zzm34/Nwt+/zedL6SXl9H3E8fQnof6S5acKnQFCCu5TiO88vejtCFJneFO69
         5EoIFdzCfkOndtywgfUNtFkOVmcu0XPn8KkvPvbI/W3czhKom2M2+QNru0jbkpxetq64
         c/Yhyr2PYdpYoArn5C4t3ZQWPnXkJCCy5x6VcXeq9/vK8UzMMLilao8Bm+Ub9FPUQHcq
         JrcAEtYwB0savXKXGkwaVgo0WdvzECqMl02czI31d9BzNhv7wOnXdU5o0gYNyL+U6ajq
         KFQA==
X-Gm-Message-State: AOAM5330lBKLAYCdG4ESrqk2ymANs9IEQFLH00sNHt5yEgXOkS3Y/9bS
        cXSiz/nR+mZJO7GsXJV+kH2VHZfkcuU1ow==
X-Google-Smtp-Source: ABdhPJwLl3aQzZ4odu6hB+uFJI7LKqDT9XIEAljRfcQb0PSIx+QTdBUvLKu9+xxTse/3dzOqGWlCGg==
X-Received: by 2002:a17:90a:c297:: with SMTP id f23mr17680567pjt.197.1620503582651;
        Sat, 08 May 2021 12:53:02 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j26sm7484972pfn.47.2021.05.08.12.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 12:53:01 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Hongbo Yao <yaohongbo@huawei.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm/dpu: Wire up needs_dirtyfb
Date:   Sat,  8 May 2021 12:56:39 -0700
Message-Id: <20210508195641.397198-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210508195641.397198-1-robdclark@gmail.com>
References: <20210508195641.397198-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 5a74f93e29da..868ee6136438 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -143,6 +143,19 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 	return true;
 }
 
+static bool dpu_crtc_needs_dirtyfb(struct drm_crtc *crtc)
+{
+	struct drm_encoder *encoder;
+
+	drm_for_each_encoder_mask (encoder, crtc->dev, crtc->state->encoder_mask) {
+		if (dpu_encoder_get_intf_mode(encoder) == INTF_MODE_CMD) {
+			return true;
+		}
+	}
+
+	return false;
+}
+
 static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		struct dpu_plane_state *pstate, struct dpu_format *format)
 {
@@ -1343,6 +1356,7 @@ static const struct drm_crtc_helper_funcs dpu_crtc_helper_funcs = {
 	.atomic_begin = dpu_crtc_atomic_begin,
 	.atomic_flush = dpu_crtc_atomic_flush,
 	.get_scanout_position = dpu_crtc_get_scanout_position,
+	.needs_dirtyfb = dpu_crtc_needs_dirtyfb,
 };
 
 /* initialize crtc */
-- 
2.30.2

