Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FEC32422D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 01:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgHKXgS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 19:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbgHKXgS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 19:36:18 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5400C06174A;
        Tue, 11 Aug 2020 16:36:17 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id ha11so212918pjb.1;
        Tue, 11 Aug 2020 16:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qJacNYTNjzvH1OwtDhhId+31gqWxjTcV/w1QSNegM+s=;
        b=CaYwq5LCxIlp+3gYSayjOxXtKRP6v2EROxO/iEm3y8UwMofSDO5cUtWm+cKJOVBFoM
         2rKFMuaC9rhvn/bSxR6nyOPkWatNI5cpAVIV+Oldh4XzmE0yQzHd1jtiaH9oRfLeOiUn
         GvUGjf+1xeTxs7BAU4shdSlz0LMPkQhtsptdYDhayUc+8qzs15B7BpjPnI2C3NHIEjPf
         67fHHiF5O0JD0tDCP04f7Fs987VRj2UjMrGhDMJEgj6pOmlHuTnh9MnAdLbuw4BLVDbH
         wXPbJ14LJwDPjhrGvLv3LlJNIMegdoDBw9fqvk4AORulucMVy56eDx9TQC0xaWInAUfa
         Y9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qJacNYTNjzvH1OwtDhhId+31gqWxjTcV/w1QSNegM+s=;
        b=bJIJG4AS0XbxCYxFzZr71xDqZHIfaYBd54OKyQlHy9zW77lDTs7eGBZKXgeAsdXzcT
         Ro+uAFgkf/I6iwEtJuXkCy3WleA5YLVIHMg39DxCjlUHEWqHWakj6Vm5b0104FOqitjK
         CkXVKFgVGQdBlcAMzDOajtJ9HEslr8LiR7mwSgEjael8fB/zUz1mK4YFIyxn3IKNkW2Y
         g1HYJ49f3k2vmqUJ7mpj2+FFWFTUBDnhkNMqufeuhzePNzUXQaOkeek390Ba2P0xoXGc
         6RbptsPq/oB16YjsM3E//YSCcrzA8pb6FZBfp7KuVPqbojkJ3jU6iZGGQpvYVCHJpRo0
         +H8w==
X-Gm-Message-State: AOAM530BVgGS4ecROfB3lk7juxic0WZuR681kBf7+/wx3u1m3ZBnusGO
        Ak+p+S2GwLjDCN/q4WZatzU=
X-Google-Smtp-Source: ABdhPJwxWi7J5+1MuA33io5kkO68CeF200KVuyXZNGvfWESG3ekCOHUR+qXq4mmgKbNk3jfCFaQofA==
X-Received: by 2002:a17:902:523:: with SMTP id 32mr2948980plf.176.1597188976937;
        Tue, 11 Aug 2020 16:36:16 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j20sm90019pjy.51.2020.08.11.16.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 16:36:15 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Shawn Guo <shawn.guo@linaro.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: add module param to enable debugbus snapshot
Date:   Tue, 11 Aug 2020 16:36:57 -0700
Message-Id: <20200811233702.580744-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

For production devices, the debugbus sections will typically be fused
off and empty in the gpu device coredump.  But since this may contain
data like cache contents, don't capture it by default.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ++-
 drivers/gpu/drm/msm/adreno/adreno_device.c  | 4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     | 2 ++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 959656ad6987..b12f5b4a1bea 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -938,7 +938,8 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 		msm_gem_kernel_put(dumper.bo, gpu->aspace, true);
 	}
 
-	a6xx_get_debugbus(gpu, a6xx_state);
+	if (snapshot_debugbus)
+		a6xx_get_debugbus(gpu, a6xx_state);
 
 	return  &a6xx_state->base;
 }
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 4e84f3c76f4f..9eeb46bf2a5d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -14,6 +14,10 @@ bool hang_debug = false;
 MODULE_PARM_DESC(hang_debug, "Dump registers when hang is detected (can be slow!)");
 module_param_named(hang_debug, hang_debug, bool, 0600);
 
+bool snapshot_debugbus = false;
+MODULE_PARM_DESC(snapshot_debugbus, "Include debugbus sections in GPU devcoredump (if not fused off)");
+module_param_named(snapshot_debugbus, snapshot_debugbus, bool, 0600);
+
 static const struct adreno_info gpulist[] = {
 	{
 		.rev   = ADRENO_REV(2, 0, 0, 0),
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 99bb468f5f24..e55abae365b5 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -21,6 +21,8 @@
 #define REG_SKIP ~0
 #define REG_ADRENO_SKIP(_offset) [_offset] = REG_SKIP
 
+extern bool snapshot_debugbus;
+
 /**
  * adreno_regs: List of registers that are used in across all
  * 3D devices. Each device type has different offset value for the same
-- 
2.26.2

