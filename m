Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30073D7BB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 19:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbhG0RIB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 13:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbhG0RIA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 13:08:00 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CBDDC061757;
        Tue, 27 Jul 2021 10:08:00 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id b6so133815pji.4;
        Tue, 27 Jul 2021 10:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
        b=jcAcwqstEOR4qb2BBinVCKD2vK40zabAZDobs9CGw7oA0B5/Uo39Z8U/TunA0JlJn9
         PgtSMUxc3TFLH+bNRf3LoMD/b0Ov9elpRdAEVvE+bo1kIf3MiQmjXoVrgQD3oDYA8snQ
         V9kcUqbchW1v5HSVS3WAzg8gbrak2eH2NjUrA+VThTFFA7VZyixQSKweVYFbWWHw0zmw
         3UcYs687WnarE+QTYAJmLNwe49yEHjKJ0W4VyauHl3XxKYGFyWAK1IHKM5GPo4n04quA
         ey1/UDfC8nxgG4iZpDmuK7iqD5hqwVZhhpvwma6zBE5s3RRRf+45j6bc46JCcxICt+Gd
         r0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
        b=YtwUXeMCifbpw75p5fKPxJ0gP2ydqgq10leihk0DHtcAdrcxl9cReMckh5f/6hUGux
         ev4Iee4SZ7J7XRPB6QYPg0u3GxaP8qxo9DGs6nZRUt9M4/FF5SjeWjmRpTF7GDDlARYS
         fDuTPWnSBfBU9YYc1oTZXxtT7IO0a+Hwa866nze+TaxlBLOGLWOzw3js59WpngyHeVsI
         k4dlzRkrDbqnKpYpF/gVl2Gshi3u+IJhNDDUsxyuLrqmAMDs6eKmsCT5kQgggtzuXFQ8
         oGUZSDDaVwugV8XBG/uPLrhngkklbYrrHyo6183Z6Df9KSvMCQSK3wuqsHySTxX3GnO5
         zWFA==
X-Gm-Message-State: AOAM533zkh2LINye57IaenNETCfVhsBEDs+oXskuhoNQK5FKFAW71zTU
        RE9tmZsl4VMUEd4pVUDfqmg=
X-Google-Smtp-Source: ABdhPJxkOfEy8AbqJGKBlgeO6CURUUgvuSIA2rG71cqgzXXY47ElwdZIc4XFSetnPwkigt1ALvNlTA==
X-Received: by 2002:a17:90b:3754:: with SMTP id ne20mr5224240pjb.74.1627405679659;
        Tue, 27 Jul 2021 10:07:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id 33sm4978462pgs.59.2021.07.27.10.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 10:07:58 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 08/13] drm/msm: Return ERR_PTR() from submit_create()
Date:   Tue, 27 Jul 2021 10:11:24 -0700
Message-Id: <20210727171143.2549475-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
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

