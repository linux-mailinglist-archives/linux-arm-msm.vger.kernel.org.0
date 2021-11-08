Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66850449B2D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 18:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbhKHR7L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 12:59:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbhKHR7G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 12:59:06 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C3FC061570;
        Mon,  8 Nov 2021 09:56:21 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id v23so6738797pjr.5;
        Mon, 08 Nov 2021 09:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xoKlavGZxr6dec4Eua5L/nU42iXPOyi8Il8xPrpTM04=;
        b=C1JnwVwkyS4l5aZtJE5WdEAc5jjNH5NSibAJqMBoxhQLU7W2NjzhTKxJ2aFI3l+uvo
         PZ9o9piRrMdYmJSuVTsvMIluA07xXA0zrDSpwAXoQn83dWLskJ6qUKUAfs740sraBLRK
         71AkeMYIJs3nzQCYX595PZZwrp0Vio2kRkp60Kd/8hU1NcC4qreyZLxS+fXm1udH0utm
         PIM6pI+DZnxdNw+qiZUO2L10CEoazD9ZQhcl/koaoCxcVeAM6+O2fY8F3fL72yWMzTL5
         jCn1qh/L181V1qreeIKAtUoWQg4M3oXrSIuI9lZwI0pMtDFoS9HlbJ7d4WzimVbCv2QZ
         yWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xoKlavGZxr6dec4Eua5L/nU42iXPOyi8Il8xPrpTM04=;
        b=HDge6OXDcwemRB3u+j2aYN+NQAi+/iMbDCWol6CM0HFTk2yRuex4SaABWvJ03gK/41
         9trnTwhmVuffgsIekxwqa4rrPsjXTOGzKr0tUBcUXTdRGMV1p5acPkOkDjk7WNLQMZLY
         K6mI1BqE1oeIdEJ+5zB6Ti9/rU0wt5gTlmQf9vZrzKEe7OkJql9APdG7ph9FLmoSJPU0
         ENDy/P9ZmJ8qz+Y8wAucBTuEWsWXCEE99N6ULoJdWCGV9DxwVcpBRie8H0HPGitMkxVF
         zCytdkTHVm8PT2WHphYIp2hiwy+dTEw838fSv4ejaCa7w2XvkBx47qPwbqqeiMrOZwiF
         TBSQ==
X-Gm-Message-State: AOAM532Ohbdl+q7y0Q/aAJp5T14zFsGQ9hRqwaRMxmJ3NJZ4Cs20adOn
        jcDy+yq0hAHJNP6PFE5+xlc=
X-Google-Smtp-Source: ABdhPJzjLrMyYoznDRHV57IpXix2EYUTbgIrc9dklIedNrGBxjCwEe/OeIJy9kGFbwNJbU28cJ1aAQ==
X-Received: by 2002:a17:903:246:b0:13f:2ff9:8b93 with SMTP id j6-20020a170903024600b0013f2ff98b93mr1099932plh.54.1636394180901;
        Mon, 08 Nov 2021 09:56:20 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id k18sm4295941pgb.70.2021.11.08.09.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 09:56:20 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Do hw_init() before capturing GPU state
Date:   Mon,  8 Nov 2021 10:01:22 -0800
Message-Id: <20211108180122.487859-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In particular, we need to ensure all the necessary blocks are switched
to 64b mode (a5xx+) otherwise the high bits of the address of the BO to
snapshot state into will be ignored, resulting in:

  *** gpu fault: ttbr0=0000000000000000 iova=0000000000012000 dir=READ type=TRANSLATION source=CP (0,0,0,0)
  platform 506a000.gmu: [drm:a6xx_gmu_set_oob] *ERROR* Timeout waiting for GMU OOB set BOOT_SLUMBER: 0x0

Fixes: 4f776f4511c7 ("drm/msm/gpu: Convert the GPU show function to use the GPU state")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index b4d1a5162d1c..956b1efc3721 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -77,6 +77,7 @@ static int msm_gpu_open(struct inode *inode, struct file *file)
 		goto free_priv;
 
 	pm_runtime_get_sync(&gpu->pdev->dev);
+	msm_gpu_hw_init(gpu);
 	show_priv->state = gpu->funcs->gpu_state_get(gpu);
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
-- 
2.31.1

