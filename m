Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812F33CC62E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 22:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbhGQU2l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jul 2021 16:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235770AbhGQU2k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jul 2021 16:28:40 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53751C061764;
        Sat, 17 Jul 2021 13:25:43 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id b12so7366473plh.10;
        Sat, 17 Jul 2021 13:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IVD9aK2ViSAsocanx1A8bXUaVSAERiao0WiLV0MIiP8=;
        b=YzVcPpsV2g8v7Q5x8W0kORS40H4nNH6xD04f4B5SK0yyRu0fTftMm/NspXU5mZFShu
         vpwLhe8gksFSEj/bJXkbeLLqQ/VLPAUhjfzfftkvyjlcSa50PArVTpMQ+wyN08EAjk+k
         4Td6VoSJirUSjoca+rpT0Y51/Iamfma2WlfQLHN/c2TATqI2QtnM6FraHowZ0++YVD0K
         55EBO9a8BJ5YZl6FU9uyIIuHPnJvErW76Urspz9o+E/5XnOUcguHZIbJ3V7p5SJ2bLPA
         f5VQRbfFigZZo7ONjOQuL191iM/93Q3/iL0PolUCxuvq8EgEfIt6yrBbIQTWmuaWVdJs
         97/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IVD9aK2ViSAsocanx1A8bXUaVSAERiao0WiLV0MIiP8=;
        b=Boq4+I+61Ix6Ja6araeCzwRWmDUeN1dLsvaBA3aB26new80ldT7W78w0GKk3MKzg+b
         10LrhZMK8iwhfPxkRiwoN+SY6s35kPmDnglxC7AJDInLmqybe93CAaUY6ztGG6WDsJLo
         7f5RoCIOaxLn2Aqw2AC0K7ZwEXk04kT5MWQbkPo49MKhY9T9MliROjt7CtFtm5+sh9Pm
         JJo9TPcudUiz2Plt5Jow6MPLqdCjlOy9hth3rILuUlmmKIVRE02W8mYZIbGUcwQfcbhm
         rAPis4fWV3aUfCWZVW3ylB2qv1sf3Jj2cBTi48wzNvQLh9VsYw1mtCHXzDHBCyLezM60
         7Bgg==
X-Gm-Message-State: AOAM531zB0+L0jdm0w2xpDw+dWajzTz+GoRgqV+4jPW2anEX8+nuS058
        OoXHHiApujqOwntPw/HjWoX5c9yVJk6Uww==
X-Google-Smtp-Source: ABdhPJwG2/gZlC/7T4wauE3STPezGwanh15E3AerQ3aZXf0j0HH2wbefZvSKII5Me/sXplNimFRNzw==
X-Received: by 2002:a17:90b:698:: with SMTP id m24mr16109804pjz.169.1626553542914;
        Sat, 17 Jul 2021 13:25:42 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id l6sm15783597pgh.34.2021.07.17.13.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 13:25:42 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 08/11] drm/msm: Return ERR_PTR() from submit_create()
Date:   Sat, 17 Jul 2021 13:29:10 -0700
Message-Id: <20210717202924.987514-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
References: <20210717202924.987514-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

In the next patch, we start having more than a single potential failure
reason.

Signed-off-by: Rob Clark <robdclark@chromium.org>
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

