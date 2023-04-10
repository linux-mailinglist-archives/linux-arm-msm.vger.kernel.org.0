Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8126DCC94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Apr 2023 23:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbjDJVGZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Apr 2023 17:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbjDJVGY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Apr 2023 17:06:24 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCECC1737;
        Mon, 10 Apr 2023 14:06:23 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id ik20so5646073plb.3;
        Mon, 10 Apr 2023 14:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681160783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WoMJpN6B4g/LBSey9MdJhme7GrVtOKGM7Nwy9VTZNzg=;
        b=BlcXAsRgjAj5Zu7jvrN45QfBFtRGjkaydvijkD/qrVhkC1Yt9q6sd8dm98PttiR8sm
         QflvYmOB7VE+sOqDGY0XMVxVuRgmNkAjdXdOFtTjpSniEvUyBp7pRYpcTHdUeHclmGK8
         bNXPEUvkNQxR8M/uwkG1tf+nxg/pmPIZ+/yP04zMGApmPhHTIZOFOzLNuhyF/NL6GTnM
         ZWtZ8rUTbBiQo1fngvQ6WDKxEeYtxUVsUbH5Dc7hl9Hgpa2GwaSojtfxzXFIyXh5QFb5
         cTP14VXyq3G/UfBUWdraL0wT9B9mH+90WD5JdKNL6FTJ529Nx+eGWES2juRXXSN5Sunh
         wAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681160783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WoMJpN6B4g/LBSey9MdJhme7GrVtOKGM7Nwy9VTZNzg=;
        b=RZsbLRT6izhQSJO+lzQbDFvDHay0Sv/OfRVnidWsESCcdMoKpVkjJ9V8vjQ63Tj8wh
         syanK4/l3+jvpLlBTUMzs4OZTAprCbljETnQ8sYhaxXFMnhPNkIm2FzWeGB4NEqBEqfR
         7+hCQNiEFlphNlQAbBM/CdNiCyVGNQWFAA2K4dTbPl+fRakXk13CW0PyaBI9tU4prpqI
         1jvMDXqPHhfeCveihp4X1zeuUMQuZo2pqF8FhCT6nYEEckP+CGdXcd2hkHls22KJck7A
         /JAgakBa4mT3hf6ckR1Bd6j6GjIuhYiGYnjLsCcC44VmfYggaGl+995mrJzMW77d0zXV
         d8kg==
X-Gm-Message-State: AAQBX9etmuKoos6JzKDia8ugcDkqh1wiyPZA6JjnOTWZND+h938gt0Sk
        H2ajkjI80Uh6jURyVuW+Fh8=
X-Google-Smtp-Source: AKy350auT6h4uHmPGN7puvU25ZQAvvzrs8Ijoo87GihNfVZmS8pmOvwOPMZawn9IN4ZfWVzrBZBXuQ==
X-Received: by 2002:a05:6a20:21ca:b0:cc:c5db:ea4a with SMTP id p10-20020a056a2021ca00b000ccc5dbea4amr8359014pzb.33.1681160783384;
        Mon, 10 Apr 2023 14:06:23 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
        by smtp.gmail.com with ESMTPSA id x13-20020a63f70d000000b005023496e339sm7242152pgh.63.2023.04.10.14.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 14:06:23 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Christopher Healy <healych@amazon.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] drm/msm: Add memory stats to fdinfo
Date:   Mon, 10 Apr 2023 14:06:07 -0700
Message-Id: <20230410210608.1873968-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230410210608.1873968-1-robdclark@gmail.com>
References: <20230410210608.1873968-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Use the new helper to export stats about memory usage.

v2: Drop unintended hunk

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 25 ++++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu.c |  2 --
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 9b6f17b1261f..9acc3ebfbc08 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1043,17 +1043,40 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
 };
 
+enum drm_gem_object_status gem_status(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	enum drm_gem_object_status status = 0;
+
+	if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true)))
+		status |= DRM_GEM_OBJECT_ACTIVE;
+
+	if (msm_obj->pages)
+		status |= DRM_GEM_OBJECT_RESIDENT;
+
+	if (msm_obj->madv == MSM_MADV_DONTNEED)
+		status |= DRM_GEM_OBJECT_PURGEABLE;
+
+	return status;
+}
+
 static void msm_fop_show_fdinfo(struct seq_file *m, struct file *f)
 {
 	struct drm_file *file = f->private_data;
 	struct drm_device *dev = file->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_file_private *ctx = file->driver_priv;
 	struct drm_printer p = drm_seq_file_printer(m);
 
 	if (!priv->gpu)
 		return;
 
-	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, &p);
+	drm_printf(&p, "drm-driver:\t%s\n", dev->driver->name);
+	drm_printf(&p, "drm-client-id:\t%u\n", ctx->seqno);
+
+	msm_gpu_show_fdinfo(priv->gpu, ctx, &p);
+
+	drm_print_memory_stats(file, &p, gem_status);
 }
 
 static const struct file_operations fops = {
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 26ebda40be4f..c403912d13ab 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -151,8 +151,6 @@ int msm_gpu_pm_suspend(struct msm_gpu *gpu)
 void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
 			 struct drm_printer *p)
 {
-	drm_printf(p, "drm-driver:\t%s\n", gpu->dev->driver->name);
-	drm_printf(p, "drm-client-id:\t%u\n", ctx->seqno);
 	drm_printf(p, "drm-engine-gpu:\t%llu ns\n", ctx->elapsed_ns);
 	drm_printf(p, "drm-cycles-gpu:\t%llu\n", ctx->cycles);
 	drm_printf(p, "drm-maxfreq-gpu:\t%u Hz\n", gpu->fast_rate);
-- 
2.39.2

