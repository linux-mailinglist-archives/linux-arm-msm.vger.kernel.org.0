Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6793F444AE2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Nov 2021 23:31:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhKCWeF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Nov 2021 18:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbhKCWeE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Nov 2021 18:34:04 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC6DC061714
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Nov 2021 15:31:27 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id n8so3976713plf.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Nov 2021 15:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wYuh1JY2j6LUOSTdqyWesZ0R/Q+mBuPiwKHvgPQt+68=;
        b=G/B3rxka7UN4c6zf8gYuxii9Qwd9no3+m+kLb94LFVc3JKwJlMEPU2wxhRRbATpHfN
         wHkjJ26kzj4Jkg7MbNuppZUX1ABhA5WkGKEptJKiiloJgl6oMSfvL2JFOJaxuoE3txIn
         pXuo6auKkl8DQCdZSVSgVrLMYdfjL6z9+o7LI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wYuh1JY2j6LUOSTdqyWesZ0R/Q+mBuPiwKHvgPQt+68=;
        b=pK6xt+QDxZ21nrrpm/htgsPxmJMRQTxmd0kn1QRzlda/+PHo3lmp/eRkPmbEOCnGH5
         2ulxAxloAWTSwXPp219xShpLhbMvTj79ZeDtdiA7BISyycdIWWUro+AdywMQFy2dHAzH
         STn0BkC9Jr3uqW49S+mxinXtvc6zblhP88DJxvg2/+HxJ94b1GCAdG6tGKnKIOOH2itM
         f5vyXscOmt+FVdih1SMR2RXhqVmNptLNYgsMhGh3l0u4FLl7DOqtXh39cHUpihKpPA2I
         0wF0V0cmIHnaor8/73qa8HUifr8K+7cCareHfFuyXrTKbaZAB2U3MdtsMvMIbnWYRjG+
         UM2A==
X-Gm-Message-State: AOAM5301pEewCdJWYMgdVWWPif27Jgfnx3fp1u2CKgUJ/HZKY6MS1BoI
        g//xLIBj9lIzXtG1DbgL4/l90A==
X-Google-Smtp-Source: ABdhPJwj3QFK3X8rRdGJf8MTmYNgv50bk2p3Le7VnOeB8x8pGV3kxUC0IhqOQLkuVMyU13+3e2zYSw==
X-Received: by 2002:a17:90a:cb98:: with SMTP id a24mr17742425pju.153.1635978687072;
        Wed, 03 Nov 2021 15:31:27 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:8d42:7991:8f12:2672])
        by smtp.gmail.com with ESMTPSA id f16sm3657259pfe.172.2021.11.03.15.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 15:31:26 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Lee Jones <lee.jones@linaro.org>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a6xx: Allocate enough space for GMU registers
Date:   Wed,  3 Nov 2021 15:31:08 -0700
Message-Id: <20211103153049.1.Idfa574ccb529d17b69db3a1852e49b580132035c@changeid>
X-Mailer: git-send-email 2.33.1.1089.g2158813163f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 142639a52a01 ("drm/msm/a6xx: fix crashstate capture for
A650") we changed a6xx_get_gmu_registers() to read 3 sets of
registers. Unfortunately, we didn't change the memory allocation for
the array. That leads to a KASAN warning (this was on the chromeos-5.4
kernel, which has the problematic commit backported to it):

  BUG: KASAN: slab-out-of-bounds in _a6xx_get_gmu_registers+0x144/0x430
  Write of size 8 at addr ffffff80c89432b0 by task A618-worker/209
  CPU: 5 PID: 209 Comm: A618-worker Tainted: G        W         5.4.156-lockdep #22
  Hardware name: Google Lazor Limozeen without Touchscreen (rev5 - rev8) (DT)
  Call trace:
   dump_backtrace+0x0/0x248
   show_stack+0x20/0x2c
   dump_stack+0x128/0x1ec
   print_address_description+0x88/0x4a0
   __kasan_report+0xfc/0x120
   kasan_report+0x10/0x18
   __asan_report_store8_noabort+0x1c/0x24
   _a6xx_get_gmu_registers+0x144/0x430
   a6xx_gpu_state_get+0x330/0x25d4
   msm_gpu_crashstate_capture+0xa0/0x84c
   recover_worker+0x328/0x838
   kthread_worker_fn+0x32c/0x574
   kthread+0x2dc/0x39c
   ret_from_fork+0x10/0x18

  Allocated by task 209:
   __kasan_kmalloc+0xfc/0x1c4
   kasan_kmalloc+0xc/0x14
   kmem_cache_alloc_trace+0x1f0/0x2a0
   a6xx_gpu_state_get+0x164/0x25d4
   msm_gpu_crashstate_capture+0xa0/0x84c
   recover_worker+0x328/0x838
   kthread_worker_fn+0x32c/0x574
   kthread+0x2dc/0x39c
   ret_from_fork+0x10/0x18

Fixes: 142639a52a01 ("drm/msm/a6xx: fix crashstate capture for A650")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't actually know how to trigger a GPU crash. I just happened to
trigger one by getting "lucky" and hitting a timeout after being in
kdb. Thus this is just compile tested. However, it looks pretty sane
to me. ;-)

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 7501849ed15d..6e90209cd543 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -777,12 +777,12 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 
 	a6xx_state->gmu_registers = state_kcalloc(a6xx_state,
-		2, sizeof(*a6xx_state->gmu_registers));
+		3, sizeof(*a6xx_state->gmu_registers));
 
 	if (!a6xx_state->gmu_registers)
 		return;
 
-	a6xx_state->nr_gmu_registers = 2;
+	a6xx_state->nr_gmu_registers = 3;
 
 	/* Get the CX GMU registers from AHB */
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[0],
-- 
2.33.1.1089.g2158813163f-goog

