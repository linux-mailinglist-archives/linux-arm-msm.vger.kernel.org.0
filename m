Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADD8676F428
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Aug 2023 22:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbjHCUpo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Aug 2023 16:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjHCUpl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Aug 2023 16:45:41 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A1763A8D
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Aug 2023 13:45:26 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5230f92b303so294608a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Aug 2023 13:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1691095525; x=1691700325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gwq7e2BGej0SZexbE3Z4ILHnIul8QCUxW07mh0nlF7c=;
        b=eahdQWYLm4aBp348PvPDhiBvfvHh+cEjA3PsdWPPYccX1zF+H5xeO5+DrX4+0lznRb
         AOTHItySH2aXJjF4DMFV4h8WY48Dt6CCAdVnBPlcG8L6zAf3VB+iD1KSAgUzAF65LDnp
         kDQFF4Ob0CqcyRNDKDOZdU/r+AcC1cDX5TSqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691095525; x=1691700325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gwq7e2BGej0SZexbE3Z4ILHnIul8QCUxW07mh0nlF7c=;
        b=KLV3qyDusDeYbtuydQ27X4T8EqEJJJ0HFQTYJn05dgrC8F+Rm1X2UqYdxH/HJNO488
         Y1d2ohUqIgNCtt1dkEnF4VhWgq7BJK05ioKPpp6GtWsaWvVbTKR7mAJ0IXJMO4r7pEEA
         0ipAVaeTxHUNA/CSZWfhhrE9rSEuIFeM8PzZ7t/TcZwTYq3CminxlnqWUDNusx5zfoMl
         PmwQeA1mSqDmdv6y72aCIaNhQQWB55Ztw9PJhcnwMOqlC/azOqVi0mdpd6DWWgkcoG6u
         I62ge0Uoo5Q0WebEGmjq5JVhiyYgNyPpelJPtCswZSnMcLBmFkqUAzEyH8osGz5UA2DL
         ODFA==
X-Gm-Message-State: ABy/qLYcQIHlLeoyxjsvSeKyWRLTE+ZHFNjbZi2sExWw4ZRS98VNb2mo
        yMb1lljlwuFWkFhW9JmV1FZwCP/7/St3UkZRj9Q=
X-Google-Smtp-Source: APBJJlGuOXp4NnZ5oEOgxM5tRZf66bsssj1/M2U1Kl1rjRYL01gqSm34lliDKYtsCMB+1N7/knSg+w==
X-Received: by 2002:a05:6402:430b:b0:521:66b4:13b4 with SMTP id m11-20020a056402430b00b0052166b413b4mr16395930edc.0.1691095524840;
        Thu, 03 Aug 2023 13:45:24 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id m13-20020aa7c2cd000000b0051df54c6a27sm262950edp.56.2023.08.03.13.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 13:45:24 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dorum@noisolation.com, Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH] drm/msm/mdp5: Don't leak some plane state
Date:   Thu,  3 Aug 2023 22:45:21 +0200
Message-Id: <20230803204521.928582-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Apparently no one noticed that mdp5 plane states leak like a sieve
ever since we introduced plane_state->commit refcount a few years ago
in 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too
early by tracking commits, v3.")

Fix it by using the right helpers.

Fixes: 21a01abbe32a ("drm/atomic: Fix freeing connector/plane state too early by tracking commits, v3.")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Reported-and-tested-by: dorum@noisolation.com
Cc: dorum@noisolation.com
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index bd2c4ac45601..0d5ff03cb091 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -130,8 +130,7 @@ static void mdp5_plane_destroy_state(struct drm_plane *plane,
 {
 	struct mdp5_plane_state *pstate = to_mdp5_plane_state(state);
 
-	if (state->fb)
-		drm_framebuffer_put(state->fb);
+	__drm_atomic_helper_plane_destroy_state(state);
 
 	kfree(pstate);
 }
-- 
2.40.1

