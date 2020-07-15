Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C64112214D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2020 21:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbgGOTHB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 15:07:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726356AbgGOTGz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 15:06:55 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83D6BC061755;
        Wed, 15 Jul 2020 12:06:55 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id cv18so2224250pjb.1;
        Wed, 15 Jul 2020 12:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TdOyt4R9Z57zhmCtsEfttpqmFzjBydXI6S7D/BNVn9o=;
        b=e73JoRrRYxGu62bl5KoSMZHLBcuQMjV+5+TqneAGMDvDQTH7fvHFQjdep471elc40r
         KvBNYigMGwr18RELuTuShGU/xAut09ARiqnzPDWaj2vMtsdLifL2ZCnYKuSkXPIqEV92
         Ms9uzBeRmeocYNunLPBTKFEDN2ce/cgUrH/z4H2luYDl556tpE4fcTL7QhQj2m+wUm+D
         PXWsycKlNvFdNmaoz0pCSiYyl0vvg/4WIQQL1XI2726MpDBgeAIFGKe3ouhJsMX7FPzy
         mwB7N0slfwSDWtt3tLY/bb5UX7n2yZwiAi7gM6FGg6YfMcOCi1cgWf3Az916kmnx/0mN
         Jrfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TdOyt4R9Z57zhmCtsEfttpqmFzjBydXI6S7D/BNVn9o=;
        b=n1ecSWdHUL717mh614IBnWRWCJ6lxpC1Uh5+4Zh2C+1t3QRSPqox0r82ZPFX4gK/pr
         M7IP+a8VfQOelsDzFDhrrS6pJXdZl28GJmfLxt7apAny7VB5QEW+cXPhkkSZTW1aphk5
         MIxo1J8reVI5ydD8iAPQyf95+O3od7ehZwCdJy6SwTuqGWmu3P+hffMrOHDmIthBvjc1
         6wrRfGLZif3Sllcuiex0dKywhezjrT0H+8lDSRBZ7LG9YlgRRvO4htPjHkQB7C6eAU4b
         noDkeSS46eJcFE1H0Y8B1sdnXVlg7mxvCcjb1Vy6j0FX9zyUEVb07LY5uKSG/Ft0G0V9
         IboA==
X-Gm-Message-State: AOAM531ejwBA/19IEhtlkuIovWFiydMguhL862UtN0vJK4+Sktioj26H
        I3i+CAJ8+u/bEtIZUiTQZKk=
X-Google-Smtp-Source: ABdhPJxkJHXkw9qYWYAXzFYPSzZ3C8v4575JyuEP2Ms4l7Azc1ObNhfpBI+OUK/nzsaigQEU2g8Cyg==
X-Received: by 2002:a17:90a:12c7:: with SMTP id b7mr1129885pjg.137.1594840014855;
        Wed, 15 Jul 2020 12:06:54 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id z25sm2757161pfg.140.2020.07.15.12.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 12:06:53 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: fix gpu probe if no interconnect-names
Date:   Wed, 15 Jul 2020 12:07:30 -0700
Message-Id: <20200715190732.3116556-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

If there is no interconnect-names, but there is an interconnects
property, then of_icc_get(dev, "gfx-mem"); would return an error
rather than NULL.

Also, if there is no interconnect-names property, there will never
be a ocmem path.  But of_icc_get(dev, "ocmem") would return -EINVAL
instead of -ENODATA.  Just don't bother trying in this case.

v2: explicity check for interconnect-names property

Fixes: 8e29fb37b301 ("drm/msm: handle for EPROBE_DEFER for of_icc_get")
Fixes: 00bb9243d346 ("drm/msm/gpu: add support for ocmem interconnect path")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 0527e85184e1..e23641a5ec84 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1003,22 +1003,23 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	/* Check for an interconnect path for the bus */
-	gpu->icc_path = of_icc_get(dev, "gfx-mem");
-	if (!gpu->icc_path) {
-		/*
-		 * Keep compatbility with device trees that don't have an
-		 * interconnect-names property.
-		 */
+	/*
+	 * The legacy case, before "interconnect-names", only has a
+	 * single interconnect path which is equivalent to "gfx-mem"
+	 */
+	if (!of_find_property(dev->of_node, "interconnect-names", NULL)) {
 		gpu->icc_path = of_icc_get(dev, NULL);
+	} else {
+		gpu->icc_path = of_icc_get(dev, "gfx-mem");
+		gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
 	}
+
 	if (IS_ERR(gpu->icc_path)) {
 		ret = PTR_ERR(gpu->icc_path);
 		gpu->icc_path = NULL;
 		return ret;
 	}
 
-	gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
 	if (IS_ERR(gpu->ocmem_icc_path)) {
 		ret = PTR_ERR(gpu->ocmem_icc_path);
 		gpu->ocmem_icc_path = NULL;
@@ -1026,6 +1027,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		if (ret != -ENODATA)
 			return ret;
 	}
+
 	return 0;
 }
 
-- 
2.26.2

