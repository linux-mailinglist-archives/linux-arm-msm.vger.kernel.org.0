Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6C43438433
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Oct 2021 17:55:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbhJWP5x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Oct 2021 11:57:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhJWP5v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Oct 2021 11:57:51 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9ABDC061714;
        Sat, 23 Oct 2021 08:55:32 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id n36-20020a17090a5aa700b0019fa884ab85so7964574pji.5;
        Sat, 23 Oct 2021 08:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/pSiwo+cqnHDXHq5IyuMaCuGSJ1F7Qgv+xIG/gujbcY=;
        b=Lo5pB7LK4ASUpV9T0nhmFJmhsvRgF4B3M+PdM2rUpggIiWX1T4rEhaDMyeXl+hE2BX
         kftGkYKm2tnacs4oo871EiyVJvi8kLYBymnEZH1nFnOqSfS3SFgMXXITCtdpAdmFmOXW
         G9NrOOwOS/IQfVvcr+8LzU/mGBBv+8e+Kg177FnK5pNsRvLQakBhS1CgoGKudLoaAMHa
         sDpB2k6pHJOgWYfvu3EAwbCC5hEttKMFJsV/uBRpiQ17AkeQgxftgpLlasvzV+/CCf9z
         T1de4yKQYlFEV7NozJgOYibWPlzXW7xCOQlaNv46lfzsT+xc7f+ntDfCeyKlIPPJ0aEQ
         169g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/pSiwo+cqnHDXHq5IyuMaCuGSJ1F7Qgv+xIG/gujbcY=;
        b=EQLeCIWvSx7Q7FRd8WQvGIj0VGFWxr42KzAHryCcUMbsd8DK0NYhBOi93Hy1zrO37y
         9DY1iNb+uTpW09MKi4V5LhDEynMfsIZK+WOv/rJrl0WgtuW0DtPQl8PD252p+HKW6I/w
         iIqrYVYO8PlWGxMqoFopzKMXtshvvoheMht8X96i0DeAPIVkokmvlVv8CnqMH/m8I+RS
         7I9oY0zn192noCpB8N5tfSetiCpg171rxM2V8Of/P3QvEjcRGpl5MuiKrb81dcQJybSz
         qQlsg4pzX/+rWPMNB4iPV5QvWCppnTYSKLXbGCiS3qXIanmbdXG/CbQE67MEKSimVxb9
         P3aw==
X-Gm-Message-State: AOAM533opDix4OTCAxDEhgEhTrOBmNLhPr+uUS5WZHt8DgEd3+R6EVdU
        8G5bMaJTuWwYLPud9MCIZVg=
X-Google-Smtp-Source: ABdhPJxNTy5Vqw0d9jUVsUmEoGQNGNcpSYCHxtyx5N1R+Ctvdyrad7wp36YiAb+YNHiWwM6mI3qZ6A==
X-Received: by 2002:a17:90b:1bc3:: with SMTP id oa3mr7847706pjb.75.1635004531693;
        Sat, 23 Oct 2021 08:55:31 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j1sm2212635pfj.155.2021.10.23.08.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 08:55:30 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Jessica Zhang <jesszhan@codeaurora.org>,
        Mark Yacoub <markyacoub@google.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/msm/dpu: Remove dynamic allocation from atomic context
Date:   Sat, 23 Oct 2021 09:00:13 -0700
Message-Id: <20211023160016.3322052-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023160016.3322052-1-robdclark@gmail.com>
References: <20211023160016.3322052-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

We know the upper bound on # of mixers (ie. two), so lets just allocate
this on the stack.

Fixes:

   BUG: sleeping function called from invalid context at include/linux/sched/mm.h:201
   in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: swapper/0
   INFO: lockdep is turned off.
   irq event stamp: 43642
   hardirqs last  enabled at (43641): [<ffffffe24dd276bc>] cpuidle_enter_state+0x158/0x25c
   hardirqs last disabled at (43642): [<ffffffe24dfff450>] enter_el1_irq_or_nmi+0x10/0x1c
   softirqs last  enabled at (43620): [<ffffffe24d4103fc>] __do_softirq+0x1e4/0x464
   softirqs last disabled at (43615): [<ffffffe24d48bd90>] __irq_exit_rcu+0x104/0x150
   CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.15.0-rc3-debug+ #105
   Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
   Call trace:
    dump_backtrace+0x0/0x18c
    show_stack+0x24/0x30
    dump_stack_lvl+0xa0/0xd4
    dump_stack+0x18/0x34
    ___might_sleep+0x1e0/0x1f0
    __might_sleep+0x78/0x8c
    slab_pre_alloc_hook.constprop.0+0x48/0x6c
    __kmalloc+0xc8/0x21c
    dpu_crtc_vblank_callback+0x158/0x1f8
    dpu_encoder_vblank_callback+0x70/0xc4
    dpu_encoder_phys_vid_vblank_irq+0x50/0x12c
    dpu_core_irq+0x1bc/0x1d0
    dpu_irq+0x1c/0x28
    msm_irq+0x34/0x40
    __handle_irq_event_percpu+0x15c/0x308
    handle_irq_event_percpu+0x3c/0x90
    handle_irq_event+0x54/0x98
    handle_level_irq+0xa0/0xd0
    handle_irq_desc+0x2c/0x44
    generic_handle_domain_irq+0x28/0x34
    dpu_mdss_irq+0x90/0xe8
    handle_irq_desc+0x2c/0x44
    handle_domain_irq+0x54/0x80
    gic_handle_irq+0xd4/0x148
    call_on_irq_stack+0x2c/0x54
    do_interrupt_handler+0x4c/0x64
    el1_interrupt+0x30/0xd0
    el1h_64_irq_handler+0x18/0x24
    el1h_64_irq+0x78/0x7c
    arch_local_irq_enable+0xc/0x14
    cpuidle_enter+0x44/0x5c
    do_idle+0x248/0x268
    cpu_startup_entry+0x30/0x48
    rest_init+0x188/0x19c
    arch_call_rest_init+0x1c/0x28
    start_kernel+0x704/0x744
    __primary_switched+0xc0/0xc8

Fixes: 78d9b458cc21 ("drm/msm/dpu: Add CRC support for DPU")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0ae397044310..2523e829f485 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -182,21 +182,19 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 {
 	struct dpu_crtc_state *crtc_state;
 	struct dpu_crtc_mixer *m;
-	u32 *crcs;
+	u32 crcs[CRTC_DUAL_MIXERS];
 
 	int i = 0;
 	int rc = 0;
 
 	crtc_state = to_dpu_crtc_state(crtc->state);
-	crcs = kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNEL);
 
-	if (!crcs)
-		return -ENOMEM;
+	BUILD_BUG_ON(ARRAY_SIZE(crcs) != ARRAY_SIZE(crtc_state->mixers));
 
 	/* Skip first 2 frames in case of "uncooked" CRCs */
 	if (crtc_state->crc_frame_skip_count < 2) {
 		crtc_state->crc_frame_skip_count++;
-		goto cleanup;
+		return 0;
 	}
 
 	for (i = 0; i < crtc_state->num_mixers; ++i) {
@@ -210,16 +208,12 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 
 		if (rc) {
 			DRM_DEBUG_DRIVER("MISR read failed\n");
-			goto cleanup;
+			return rc;
 		}
 	}
 
-	rc = drm_crtc_add_crc_entry(crtc, true,
+	return drm_crtc_add_crc_entry(crtc, true,
 			drm_crtc_accurate_vblank_count(crtc), crcs);
-
-cleanup:
-	kfree(crcs);
-	return rc;
 }
 
 static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
-- 
2.31.1

