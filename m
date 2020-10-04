Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1AE282D08
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 21:21:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgJDTVP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 15:21:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgJDTVM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 15:21:12 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6F18C0613CE;
        Sun,  4 Oct 2020 12:21:12 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 7so4327229pgm.11;
        Sun, 04 Oct 2020 12:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c9ulxuqWUZZz8R2MHYok6DyKN2+X334CNFkrGm6LYVI=;
        b=uLU9fyPvbRl9/8aUxLuqomkqwnTttBQwRSHrQq9XasnJuEs10Huja4LSZtcH1yMb/G
         4SCBsMXPAeSog/DP02UyVz1f2JEeFa+bzRZujV7Gw+aYbYjwLYCbHmJeVsi9BJQ4hc1j
         +UC/PFgLdbUtzQGlW/r3AeVEUhWEBoJQRvYg3MvLJMvk8tmFtE+ZQf/iE6iK66NKrgdP
         D7Nw33DTgyIqHMbDT2eMlkevMgmP576tUBhGwsxnIvnVPR+URrTS2kgU7wCuyUHkXVG1
         UJdRCT/Oty72nEXs+Yd4OkHezq6YCObROTJemsINUra8qVVf8m3YHgoHQrZMkuN8+OyT
         Z3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c9ulxuqWUZZz8R2MHYok6DyKN2+X334CNFkrGm6LYVI=;
        b=UAw5QQgnf3AHi4ShQDBqYLrlsufYW+0dNE7wjhEKylFa8JupzUfbBDKzln5zVtGLPQ
         NuApi3Lbbh7ziLLMphcUf3FMN5O3sqam4i+MZoD8iI4C8KalAIoL66mU8eRl0XrUiWU3
         Sl+aVT0FaCOZwVY+hmHtVzj2q8aLjOoEtOQmU0DldfIn8gx1Mf3fNMiVPeMMtwLqJi1e
         abWw0uQ79yblNlxeKhI43Bn4rGK08U6Kd8WV+fi5eiK77yu1xlxNLlZt94eTq6Ocuhi6
         DTUr9ITQVZU738X9l1Dmxjw4ya9a0qlc0x3ljRQWzMM/rRaZJpHgTQsY6j6g4eN1Q62+
         qFsA==
X-Gm-Message-State: AOAM5325xesk6myurvL73kqgYv9cFGhWj5hCRYofDFLo8n22+W4naLpX
        PEyBDfoHncqOYxDsV1mAYlseF1Gk/N0yR8Mp
X-Google-Smtp-Source: ABdhPJzq16bA7i9inS3FVtzQZxgFb9yXiw3Uah4xYQ4dyDsIVKTAdVJywzFmSahO8lI4RuBXRCZMaA==
X-Received: by 2002:a63:4416:: with SMTP id r22mr11414886pga.248.1601839272238;
        Sun, 04 Oct 2020 12:21:12 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q66sm5106105pfc.109.2020.10.04.12.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 12:21:11 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 03/14] drm/msm: Move update_fences()
Date:   Sun,  4 Oct 2020 12:21:35 -0700
Message-Id: <20201004192152.3298573-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Small cleanup, update_fences() is used in the hangcheck path, but also
in the normal retire path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 31fce3ac0cdc..ca8c95b32c8b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -265,6 +265,20 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
 	return ret;
 }
 
+static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
+		uint32_t fence)
+{
+	struct msm_gem_submit *submit;
+
+	list_for_each_entry(submit, &ring->submits, node) {
+		if (submit->seqno > fence)
+			break;
+
+		msm_update_fence(submit->ring->fctx,
+			submit->fence->seqno);
+	}
+}
+
 #ifdef CONFIG_DEV_COREDUMP
 static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
 		size_t count, void *data, size_t datalen)
@@ -411,20 +425,6 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
  * Hangcheck detection for locked gpu:
  */
 
-static void update_fences(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
-		uint32_t fence)
-{
-	struct msm_gem_submit *submit;
-
-	list_for_each_entry(submit, &ring->submits, node) {
-		if (submit->seqno > fence)
-			break;
-
-		msm_update_fence(submit->ring->fctx,
-			submit->fence->seqno);
-	}
-}
-
 static struct msm_gem_submit *
 find_submit(struct msm_ringbuffer *ring, uint32_t fence)
 {
-- 
2.26.2

