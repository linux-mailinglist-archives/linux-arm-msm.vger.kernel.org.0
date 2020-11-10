Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 929602ADE8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Nov 2020 19:42:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730164AbgKJSmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Nov 2020 13:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbgKJSmT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Nov 2020 13:42:19 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D078C0613D1;
        Tue, 10 Nov 2020 10:42:19 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id m13so2837424pgl.7;
        Tue, 10 Nov 2020 10:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GYJulMYVVz3km1hFr9j5auoGSm9etW+t+ZZhfvbAr78=;
        b=NBgSVBr7E6iqdcZ5ZI31StoYKlB3mK/JVERnjq5aL/8oPKM3j8L0WDogOlo6y3duB2
         cVMUlPi2/n/xq5sEZDlOn2ASEcWMLsA2bBJGGSTvRtQtKEdRpDGIRMHfJWEb7zz5pwA7
         Lj6BVaTbZeANF2kArNMILM4yaOPP6vOVaKsoxoY7leiECEmVqyyHzgfLUHR5B/xOXHcR
         M+4aDTWKpINU3XAE0O/ok+fx7yHAlXNngsg2vZIer56kG8r0csesG6Y+TJ9kgq0LXdgD
         c0B1WDMWuup5ZUYYH4ZK+6npvNA0F/KeH+5hQQ81Aru6jBBNKNJhIfQskp4Iq8Dml1Bb
         CczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GYJulMYVVz3km1hFr9j5auoGSm9etW+t+ZZhfvbAr78=;
        b=BDRIo92wH2z2S0a7ZJNCdcXbFhvYVvz8BHTDzDNYYWOPqbtvlU3ERDfpIyCVCzEl3n
         duHP4tl28Jmsq+mPGGfsxE1GDeyHe3OB6bPLDLssSagVCy+fb/2WJ7b8GU1ApgIYBPYx
         lzKaODWnWDFieGEViMJ/CsxQeUWqpb7Y0fr5nyDzTxC8iv3YvrG6ygeRFiYfhKq22aPU
         pW015WXWnhH7tgx07IwU5OS6O7ZfjAucZ2ErlXIS6qnmkR8kp9Vu7NNU7raQ/3RHwfhk
         gG67vSEuDGFcn5xZ5Nre0Jeszq/Oa8h06DMaZeOyTsjHoI1603MCSM4JqUL8bv6uf7uf
         uvZQ==
X-Gm-Message-State: AOAM531hR2N0V+r10STvx9La230eT01o/mUmugQs4dHai/yNcysmd3ol
        wH3Gv8s+wvXzY8ofTLxA+fE=
X-Google-Smtp-Source: ABdhPJzkbAsbqdioecTbOedIn1DwNSC5H1j1b+kriaAsHiKjO3ha2VT8efFZwnlwZcjr19zv/Z0zaQ==
X-Received: by 2002:a17:90b:19d6:: with SMTP id nm22mr480088pjb.159.1605033738605;
        Tue, 10 Nov 2020 10:42:18 -0800 (PST)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id y19sm14357276pfn.147.2020.11.10.10.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 10:42:17 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/2] drm/msm/a6xx: Clear shadow on suspend
Date:   Tue, 10 Nov 2020 10:43:59 -0800
Message-Id: <20201110184401.282982-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Clear the shadow rptr on suspend.  Otherwise, when we resume, we can
have a stale value until CP_WHERE_AM_I executes.  If we suspend near
the ringbuffer wraparound point, this can lead to a chicken/egg
situation where we are waiting for ringbuffer space to write the
CP_WHERE_AM_I (or CP_INIT) packet, because we mistakenly believe that
the ringbuffer is full (due to stale rptr value in the shadow).

Fixes errors like:

  [drm:adreno_wait_ring [msm]] *ERROR* timeout waiting for space in ringbuffer 0

in the resume path.

Fixes: d3a569fccfa0 ("drm/msm: a6xx: Use WHERE_AM_I for eligible targets")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2f236aadfa9c..fcb0aabbc985 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1043,12 +1043,21 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	int i, ret;
 
 	trace_msm_gpu_suspend(0);
 
 	devfreq_suspend_device(gpu->devfreq.devfreq);
 
-	return a6xx_gmu_stop(a6xx_gpu);
+	ret = a6xx_gmu_stop(a6xx_gpu);
+	if (ret)
+		return ret;
+
+	if (adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami)
+		for (i = 0; i < gpu->nr_rings; i++)
+			a6xx_gpu->shadow[i] = 0;
+
+	return 0;
 }
 
 static int a6xx_get_timestamp(struct msm_gpu *gpu, uint64_t *value)
-- 
2.28.0

