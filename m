Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57D0C26937
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2019 19:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729431AbfEVRhU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 May 2019 13:37:20 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:32912 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727499AbfEVRhU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 May 2019 13:37:20 -0400
Received: by mail-qt1-f194.google.com with SMTP id m32so3409340qtf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 May 2019 10:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xXxK1SdvMa5QM5LCKyWVp4e9t2vqNYcogqHpLSLLhIg=;
        b=fYwz5Xn2gUyJ8TSsHmm2mYXLmdUcoer3oKLz0EdRFeyNzHUkmTz/MDnIp1x4eu9we9
         D5sdfruQ69jaDbrbw0XZB/8H09QuDjotmkN1/zedx0Avo2WO+FX2rtBLBOEVQpF4hPHP
         UJjTRAPkuqGinXdu2hyOkQYpsHEOlsG6gh2ROj0DNNq2TvYpWmq73UJ9TOlYiFLo6wmj
         uDkIgLd8CvA9WhUWUC2pECn4CQQyn+1mCLPjbfCXPfaxvOoOWvhoXGIW9Cm2Sh1c7H3A
         dPWDMIVTgibXIqVhta/pM6A7E2v5bxMviAbomMdjkndOke/g8SgNNQpuO5eDoPQ7GQeN
         +tdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xXxK1SdvMa5QM5LCKyWVp4e9t2vqNYcogqHpLSLLhIg=;
        b=HRBwYV3MyKSKRIUXVY5UOKcA8ibnE7P90Ck05BkYpwD6tfC1f8vDSXgz0b4yR56wv+
         Of4+/T8xn62ySZcdcM+VIGPDUOrw8VRnXWiE/bgEWTCZaWjpvsQOuCcFmVuk/YESCAaQ
         NjdkHUX0UQihvKplVcAIl/0FQC7rnPVZtABtu3YdzFCYuAVGI/t0EVfUlKhU1bqMaXsS
         7pShcx9c4GjFHUuvhsidE9cioGYAIrt5c+poNhiWy2bMWILTyt5aprBHtxx/CLc56UG1
         m3KDiZfBoudbFfzLpevPyi8/mdEwvV0QnswasbuDDbwHb+9of/S+umTfKPbUFHm8kaYB
         wkfw==
X-Gm-Message-State: APjAAAX+D8vZRFJ/VK6eOYm3YlPqHNSGlL1w6z5yO2Ez92AmCPMY6C3N
        nM2GmPMJ8QEUumkH8/jmFH4dqQ==
X-Google-Smtp-Source: APXvYqy/u71X2vK71//eIydQ9D0SXgzfKKRGUI6ixkuJuEU3Fh6rhvDxQqu3U20I+iJYQX7kbjFjgA==
X-Received: by 2002:a0c:9639:: with SMTP id 54mr56022780qvx.105.1558546639896;
        Wed, 22 May 2019 10:37:19 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id w143sm10692969qka.22.2019.05.22.10.37.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 10:37:19 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/5] drm/msm/a6xx: Rename a6xx_gmu_probe to a6xx_gmu_init
Date:   Wed, 22 May 2019 13:36:44 -0400
Message-Id: <20190522173656.162006-5-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190522173656.162006-1-sean@poorly.run>
References: <20190522173656.162006-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This rename makes it more clear that everything initialized in the _init
function must be cleaned up in a6xx_gmu_remove. This will hopefully
dissuade people from using device managed resources (for reasons laid
out in the previous patch).

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 701b813fa38a..26f44a187eda 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1256,7 +1256,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
 	gmu->initialized = false;
 }
 
-int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
+int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 {
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	struct platform_device *pdev = of_find_device_by_node(node);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e74dce474250..1f9f4b0a9656 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -854,7 +854,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	/* FIXME: How do we gracefully handle this? */
 	BUG_ON(!node);
 
-	ret = a6xx_gmu_probe(a6xx_gpu, node);
+	ret = a6xx_gmu_init(a6xx_gpu, node);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index b46279eb18c5..64399554f2dd 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -53,7 +53,7 @@ bool a6xx_gmu_isidle(struct a6xx_gmu *gmu);
 int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 
-int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
+int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
 
 void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq);
-- 
Sean Paul, Software Engineer, Google / Chromium OS

