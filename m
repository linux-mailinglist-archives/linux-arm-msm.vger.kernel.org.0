Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16A40246C95
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 18:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387786AbgHQQWW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 12:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387696AbgHQQWR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 12:22:17 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CAEC061389;
        Mon, 17 Aug 2020 09:22:17 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id u10so7767822plr.7;
        Mon, 17 Aug 2020 09:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LMklsHHTMxijqDeAVwRgPfCmNnVtewqnmZOiIx8IoQs=;
        b=RbABWtb8XXpDsj3fj6OykBcPLZ5s6mzXo5+8O5lLzibS4H/7sSSbJxgK232d3ZHNl1
         b9OzjD8Evbx+rgydLEzlQePAE9vfUy5L6WAd/HPRFwk/FX68hop3CG7mzh3ZM81mv6Sx
         syKtTcwlb9dGPXkYfbADlIa/5LOrPQHNFDoPCojDFrab605RRle/eZNq65gZHtMmMWrU
         V0k8w/Htzxgdw5ge65ajA54zbKU9mqntHLqH2bMvqPu/STQuBK6D5VB8TdOgcvrSTl2F
         ssnNqEgnzGyi/N+mbujL5peAmlxByvmEpZg6BnM7T5YM+fbbsqtTUqQQ8HBqO++dG3Np
         sTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LMklsHHTMxijqDeAVwRgPfCmNnVtewqnmZOiIx8IoQs=;
        b=RKF7co9JYCShv/xVHQ6LNjbpkgHxdilaA6b5RtU0LGdRbARfmv5c2NIxd+mbskhIaA
         /volxc3MsSAOJufVPXTiND1jaaiwhbkeKL7gdb8KXXopacthtC6RuSTe9Qrf90nT7sm/
         WKsyqLTZFyfj+fQrrHBkytIpOwZJN7X7iv6TBlNYc2QDJVDGuoUjbCb9OZABoO0CxjsF
         SjU2uXSn6Dc9+zGWTRe95Eaappb+ymR2ne2+7Aam8NlQ9KVp5+pCy43Bs5NvAQHAnoOA
         uEZRxeE50sWxYjSU1kNwoWc4VGqJZS+m1VGgWTzoGkQCwP8Q6PJbLLxhocdMe3zjOCwA
         yhpw==
X-Gm-Message-State: AOAM532LqqqiQ6gGX89k91T9f3z+8hXl1wfZcV1z+FPsMMP/ajSPy8EL
        tWfrR6q+2gfsGPHfLxcMjKo=
X-Google-Smtp-Source: ABdhPJxZqVKsxln0UatgdMDzqUQzs7RKNdYGMqEbSpKXAB2AkdX/2A4LN0FQkPSE/xgeFXUS77iQIw==
X-Received: by 2002:a17:902:7616:: with SMTP id k22mr12281766pll.25.1597681336661;
        Mon, 17 Aug 2020 09:22:16 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id w16sm20513732pfq.13.2020.08.17.09.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 09:22:15 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/gpu: make ringbuffer readonly
Date:   Mon, 17 Aug 2020 09:23:09 -0700
Message-Id: <20200817162309.362032-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The GPU has no business writing into the ringbuffer, let's make it
readonly to the GPU.

Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index e397c44cc011..39ecb5a18431 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -27,7 +27,8 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	ring->id = id;
 
 	ring->start = msm_gem_kernel_new(gpu->dev, MSM_GPU_RINGBUFFER_SZ,
-		MSM_BO_WC, gpu->aspace, &ring->bo, &ring->iova);
+		MSM_BO_WC | MSM_BO_GPU_READONLY, gpu->aspace, &ring->bo,
+		&ring->iova);
 
 	if (IS_ERR(ring->start)) {
 		ret = PTR_ERR(ring->start);
-- 
2.26.2

