Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AAF536E01FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Apr 2023 00:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjDLWn0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Apr 2023 18:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjDLWnZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Apr 2023 18:43:25 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0887AA7;
        Wed, 12 Apr 2023 15:43:24 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id lh8so57555plb.1;
        Wed, 12 Apr 2023 15:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681339404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03BOImDDTacTaal3DT5GaR4eYwI41SC6VasRh9AK1Vg=;
        b=I9yPnaR/8MyqGS9rBIjdGiMt62y2Ap8jwYETy5y1Nq6+ytk2e+5UeiV/2yXHsY/WZ/
         7i0K1UiVvJXmXESWuFBorANBJ793EWNv/5b4GthU27FtimIESntsOgyokF4SEyrx100q
         NPMjSwhxJv++VTrsSY8ZH6LFBZYoSekF059fHEKlUfwxzjIzwmjV/Nolk51zmVtsZQV1
         x04AWUYGNhq7WjooDmk51P9Wpm2zbyyjEmF6HhtRFexzls27PcNQR4dhac5XNZ4xBpDJ
         wIobQltTaRx2gVXyXdacy+coT0BatjUR8bwBkeHbFG96jvsJUuozrvf7hn0Y2IRspOdn
         z5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681339404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03BOImDDTacTaal3DT5GaR4eYwI41SC6VasRh9AK1Vg=;
        b=eTStqh9KW7QKHuhPT03RM6W/06Zy3JOMW2+ZAa7AXJZox7sledBewS8O46JgvWoINi
         5vA919tD8ukSHlbWCV1QPaUhuOsjeRuPXF8sqT+f74vWC+6KDRgQaJdW539NoySndWoU
         ccXxXs4pqrjuoWZk4UHkuFdFf7D7+j34IAnEuMVd1q50bkEm2NwBuj1f3BmHKfGYq4zJ
         vZRNBmIHpcXIcloJOSbCtwJUq8bpe4qR6XyN3X2prRqs6FWYCQAFfgHO8Rh6B+678RLM
         hos9Ie/+JXJfn2ENBKRBSdQtdHrjsP35mcDDt0Ab2TRDoCcqFBci2SOVYI2oUnz+vIBp
         sJIg==
X-Gm-Message-State: AAQBX9dWrhXIyRNqDtswY0WIlVb0p4kQpjvI+8QmHJjdFr+swxvvOfQM
        yUiH/zBK0CsWqY5voVv1vQY=
X-Google-Smtp-Source: AKy350aqCH7Q98V1ixY3WWQauqqjy0IibBhWWV4yTUMngsmdiURUfVI/CencZDj0YhoK6wTkIODwXg==
X-Received: by 2002:a05:6a20:1b23:b0:ec:2b01:1069 with SMTP id ch35-20020a056a201b2300b000ec2b011069mr506383pzb.45.1681339404416;
        Wed, 12 Apr 2023 15:43:24 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
        by smtp.gmail.com with ESMTPSA id l35-20020a635723000000b0051815eae23esm101713pgb.27.2023.04.12.15.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 15:43:24 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Christopher Healy <healych@amazon.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 2/6] drm/msm: Switch to fdinfo helper
Date:   Wed, 12 Apr 2023 15:42:54 -0700
Message-Id: <20230412224311.23511-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412224311.23511-1-robdclark@gmail.com>
References: <20230412224311.23511-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 11 +++++------
 drivers/gpu/drm/msm/msm_gpu.c |  2 --
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5a10d28de9dd..3d73b98d6a9c 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1043,23 +1043,21 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
 };
 
-static void msm_fop_show_fdinfo(struct seq_file *m, struct file *f)
+static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
-	struct drm_file *file = f->private_data;
 	struct drm_device *dev = file->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
-	struct drm_printer p = drm_seq_file_printer(m);
 
 	if (!priv->gpu)
 		return;
 
-	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, &p);
+	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
 }
 
 static const struct file_operations fops = {
 	.owner = THIS_MODULE,
 	DRM_GEM_FOPS,
-	.show_fdinfo = msm_fop_show_fdinfo,
+	.show_fdinfo = drm_show_fdinfo,
 };
 
 static const struct drm_driver msm_driver = {
@@ -1070,7 +1068,7 @@ static const struct drm_driver msm_driver = {
 				DRIVER_SYNCOBJ_TIMELINE |
 				DRIVER_SYNCOBJ,
 	.open               = msm_open,
-	.postclose           = msm_postclose,
+	.postclose          = msm_postclose,
 	.lastclose          = drm_fb_helper_lastclose,
 	.dumb_create        = msm_gem_dumb_create,
 	.dumb_map_offset    = msm_gem_dumb_map_offset,
@@ -1081,6 +1079,7 @@ static const struct drm_driver msm_driver = {
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
+	.show_fdinfo        = msm_show_fdinfo,
 	.ioctls             = msm_ioctls,
 	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
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

