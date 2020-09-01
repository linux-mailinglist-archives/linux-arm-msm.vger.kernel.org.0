Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8A625A110
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 23:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729747AbgIAV7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 17:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729673AbgIAV7p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 17:59:45 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A363C061246
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 14:59:45 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y6so1234133plk.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 14:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mEANC8bA1AYbgYd33w7o7zlvFLzbGxcnZ/R/0LR11Po=;
        b=mcHPPLl1tJgo1pjkRyl5UZfnK2CPwjRFWOAUfeR9WjY1yrGmK0kVnT9k6vfs0pdww/
         pNZgTRL7n9fneMrcNwjJKBE0UagE9fHe1AM5x5GNnLbB57EGtq2c+GTKOgD9XsVVq1A4
         tvgaUUw3YvhVlVY5UbTWPI2nngZb0OAeGZbfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mEANC8bA1AYbgYd33w7o7zlvFLzbGxcnZ/R/0LR11Po=;
        b=SzCNpcGNBP1PjRa9ICfgoslITbh8ZpUZPX2BjgsTPaO7cLiQ0v3BYAYke7s7YqwSaB
         yLKiIQ/iGi9O4CsO5u9qIbXZeDiS+Fg2x4t70r9K2D4Mvak45aFdE/s4/Z2vQq35o9Na
         c2Gkj0aJmTSvI67TYsYQd7jY90ZE9jfAnJo78vrM8mtjuQ9reUV6yPwlbrpBcP7kTa5H
         dC+zjckol/waLbt1Evm0W4x9JwuD4je74GHY2Iwc48VIDOfARyPmm4Pi0hUXiRs3Yi5Z
         zG3JnicpfhRhn65M4b/yuIU2e9wh/CxBxUKzABrR/w3DCUhuqw4z2b04SKTR5zHmArUA
         B8ew==
X-Gm-Message-State: AOAM5307L7jbgGs2NSm2gfo82Bov71iJCWTi85qdoK7Zaw6QKbZHd+je
        8RCBpM3Wv0BpVVa1KczSpuZQAA==
X-Google-Smtp-Source: ABdhPJz63bfH2BlH4Q6m23NnWgfqc24pUWHiyD6JlgU45wIroDyRBKQhRqJnp0qoa5/DZyjv1ZVlTA==
X-Received: by 2002:a17:902:b714:: with SMTP id d20mr3178600pls.103.1598997584863;
        Tue, 01 Sep 2020 14:59:44 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id q5sm3044037pfu.16.2020.09.01.14.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:59:44 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>
Subject: [PATCH 1/2] drm/msm: Avoid div-by-zero in dpu_crtc_atomic_check()
Date:   Tue,  1 Sep 2020 14:59:41 -0700
Message-Id: <20200901215942.2559119-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
In-Reply-To: <20200901215942.2559119-1-swboyd@chromium.org>
References: <20200901215942.2559119-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The cstate->num_mixers member is only set to a non-zero value once
dpu_encoder_virt_mode_set() is called, but the atomic check function can
be called by userspace before that. Let's avoid the div-by-zero here and
inside _dpu_crtc_setup_lm_bounds() by skipping this part of the atomic
check if dpu_encoder_virt_mode_set() hasn't been called yet. This fixes
an UBSAN warning:

 UBSAN: Undefined behaviour in drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:860:31
 division by zero
 CPU: 7 PID: 409 Comm: frecon Tainted: G S                5.4.31 #128
 Hardware name: Google Trogdor (rev0) (DT)
 Call trace:
  dump_backtrace+0x0/0x14c
  show_stack+0x20/0x2c
  dump_stack+0xa0/0xd8
  __ubsan_handle_divrem_overflow+0xec/0x110
  dpu_crtc_atomic_check+0x97c/0x9d4
  drm_atomic_helper_check_planes+0x160/0x1c8
  drm_atomic_helper_check+0x54/0xbc
  drm_atomic_check_only+0x6a8/0x880
  drm_atomic_commit+0x20/0x5c
  drm_atomic_helper_set_config+0x98/0xa0
  drm_mode_setcrtc+0x308/0x5dc
  drm_ioctl_kernel+0x9c/0x114
  drm_ioctl+0x2ac/0x4b0
  drm_compat_ioctl+0xe8/0x13c
  __arm64_compat_sys_ioctl+0x184/0x324
  el0_svc_common+0xa4/0x154
  el0_svc_compat_handler+0x

Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: Sean Paul <seanpaul@chromium.org>
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index f272a8d0f95b..74294b5ed93f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -881,7 +881,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	struct drm_plane *plane;
 	struct drm_display_mode *mode;
 
-	int cnt = 0, rc = 0, mixer_width, i, z_pos;
+	int cnt = 0, rc = 0, mixer_width = 0, i, z_pos;
 
 	struct dpu_multirect_plane_states multirect_plane[DPU_STAGE_MAX * 2];
 	int multirect_count = 0;
@@ -914,9 +914,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 
 	memset(pipe_staged, 0, sizeof(pipe_staged));
 
-	mixer_width = mode->hdisplay / cstate->num_mixers;
+	if (cstate->num_mixers) {
+		mixer_width = mode->hdisplay / cstate->num_mixers;
 
-	_dpu_crtc_setup_lm_bounds(crtc, state);
+		_dpu_crtc_setup_lm_bounds(crtc, state);
+	}
 
 	crtc_rect.x2 = mode->hdisplay;
 	crtc_rect.y2 = mode->vdisplay;
-- 
Sent by a computer, using git, on the internet

