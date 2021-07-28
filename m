Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E424E3D8516
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 03:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234450AbhG1BC4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 21:02:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234451AbhG1BCy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 21:02:54 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED42C061765;
        Tue, 27 Jul 2021 18:02:53 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id q17-20020a17090a2e11b02901757deaf2c8so1971101pjd.0;
        Tue, 27 Jul 2021 18:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
        b=mKsL6bQdL5LxaaCFnf0O4WfONIQ8TCt4jpcZUmVWJ/LrvH+HSsEuvpQWzOTXQQBAgP
         YJgnR9KJ/Zw0toXptUtcS0T+FQEIzkSr6dQkIeoG7qloDVKNer1AjElHpghoOFol96HM
         tzVi5MOCkQ0047mzoiN9FmwgLOPTsX1/dVmtf0fJl6hCUT1Ikzvz7HApAkNh6KvGOy1t
         22L633eR/RKJbSlJroMlFxN1ytNvPdzNKD/jS1vjk26MQKRQGdOPvFZBlq4UcBY28jCq
         1HwAlhh39lkiY7wtLrwER5lbHZqJJMrDrAFx0ji4PNbAv5KwEWt5djAR1TBthI3KNJxA
         mu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
        b=tZNS/hdKpGxxoVbwA4KNCuOuoLWrpJW6pyxjzQgdAPD3N6t0VkISjJ+KOjEzwKKgNR
         WDxfyaTqXXPkvID/oOX82KuOiKd+x+KY4kYADAME6bGo5rwquGmc1USHgPoQ41MUUQdr
         lYH52OfGi88hfaFhtdCYj+VV7IDaYWquV0u7xwbPwMKRcwefGQUmjLk0G0V84oD/8/T0
         mK0BkaEclkyzgxg4almuNl0QQtq2O1c7OBCe/v6Ayb4zxNb7/79FsYog4qIFsAnXbg0R
         D0dEnd6LrkoqSsVyRos+i4nhCelS6ynZLevSWE8Wmtgo+Ti4l3spjjm83fKb1UGSfqgl
         1PaA==
X-Gm-Message-State: AOAM532mCl8bLnBIEAwznWsme6Im05u3d7sjgWEbHyjWUTyAOw46qaeL
        Xq+8PxWA+gb2Z53r1aUkfaE=
X-Google-Smtp-Source: ABdhPJwyyI6l0r5SszrnRnJ+PmeqwvWRyFs2gHZiaNFXqCHoj3lXlSdMxUwHFEqWpRPgVqJO/wn5YQ==
X-Received: by 2002:a62:8407:0:b029:39a:59dc:a237 with SMTP id k7-20020a6284070000b029039a59dca237mr11938158pfd.30.1627434172947;
        Tue, 27 Jul 2021 18:02:52 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id y2sm4987021pfe.146.2021.07.27.18.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 18:02:51 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 08/13] drm/msm: Return ERR_PTR() from submit_create()
Date:   Tue, 27 Jul 2021 18:06:13 -0700
Message-Id: <20210728010632.2633470-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In the next patch, we start having more than a single potential failure
reason.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index f6f595aae2c5..f570155bc086 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -32,30 +32,27 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 		uint32_t nr_cmds)
 {
 	struct msm_gem_submit *submit;
-	uint64_t sz = struct_size(submit, bos, nr_bos) +
-				  ((u64)nr_cmds * sizeof(submit->cmd[0]));
+	uint64_t sz;
+
+	sz = struct_size(submit, bos, nr_bos) +
+			((u64)nr_cmds * sizeof(submit->cmd[0]));
 
 	if (sz > SIZE_MAX)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
-	submit = kmalloc(sz, GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
+	submit = kzalloc(sz, GFP_KERNEL | __GFP_NOWARN | __GFP_NORETRY);
 	if (!submit)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	kref_init(&submit->ref);
 	submit->dev = dev;
 	submit->aspace = queue->ctx->aspace;
 	submit->gpu = gpu;
-	submit->fence = NULL;
 	submit->cmd = (void *)&submit->bos[nr_bos];
 	submit->queue = queue;
 	submit->ring = gpu->rb[queue->prio];
 	submit->fault_dumped = false;
 
-	/* initially, until copy_from_user() and bo lookup succeeds: */
-	submit->nr_bos = 0;
-	submit->nr_cmds = 0;
-
 	INIT_LIST_HEAD(&submit->node);
 	INIT_LIST_HEAD(&submit->bo_list);
 
@@ -799,8 +796,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	submit = submit_create(dev, gpu, queue, args->nr_bos,
 		args->nr_cmds);
-	if (!submit) {
-		ret = -ENOMEM;
+	if (IS_ERR(submit)) {
+		ret = PTR_ERR(submit);
 		goto out_unlock;
 	}
 
-- 
2.31.1

