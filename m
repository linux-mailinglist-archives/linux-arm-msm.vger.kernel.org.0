Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210E93D5C65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 16:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234983AbhGZOQ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 10:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234980AbhGZOQ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 10:16:26 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63B46C061757;
        Mon, 26 Jul 2021 07:56:53 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id j1so13219201pjv.3;
        Mon, 26 Jul 2021 07:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
        b=lqdV3j4IFQGnbUavFx58TsHSIt48E/ApFg5EqGmwvvyMKu6Kiayo8Ps/oxMrt6kn4Y
         DBL9OXqne6ShkSYqlojkcQkO5T0FpXbNU4kGgLn13teS+3Jq/3qPm7hgsTcjYRoEgI4Z
         TbWgQWknkMl59I29YqvrXgXJ73ksQw9eHlPvWBHIQeq2OwxZQNCVbe4aKg2L3hBrPQl5
         Gc26qQlfNxXqpd+RO28QG4TAlcuA+VZTyozaeP8SazC+HKyTmuogmEC+hCxD/eNZic6F
         /nigCgheZ6RwlE2lsZWFsksZt7LwoF3Xs/k0ljlZUV55+R8CH2yBXh/k58m+gIauRxjP
         UjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WebXvvghyonjSIL0qr454I3bLkC6V8oqvqJqa3PqZ2c=;
        b=GBo2RZj2oDmD7aHrG1NlPexL8kJlMJHrljUXpqPyDv/jDQkh70YgRnuPehINMNEH/8
         E9u4COH5H4yvOmEEbUYQLs2Bn8qB3y90j+Qi0ZgaHLNHg5GDNl2kQM1zo99e+6qwVCPs
         9gb0eDxHPsnfq2GVYxsAYquhNXTEdOUbx4pIYbBYFOec8oFTBg/xhBYIPPTLMGH7uiUH
         J5qPbeycieEEUHH8xGEy9/WKNAG22PIKcF3h0TrW4NoZTjthUE73/MIeMQ3gSTUoAokY
         hSbPqg9wH7aioCt5pqunggV1F6Of1iLBIe7+tLAqkyCy3QkuNqTj7O6aijZveKrixFr4
         IwZQ==
X-Gm-Message-State: AOAM532eQMfqnuey5PSb6uIVlvxWZgHXHnX+7A0O2MpEGT9ideIZMgrJ
        DU7GRsYySqKM670LA88Buyg=
X-Google-Smtp-Source: ABdhPJwVILnIrV5O/QW4r5wMv22mZjKNRa3lV5G5BGGo+wpC9Fk5fP6jOqN5+9LzmUsu+YiYHmHG6A==
X-Received: by 2002:a17:90a:42:: with SMTP id 2mr17204273pjb.81.1627311412929;
        Mon, 26 Jul 2021 07:56:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id x7sm279536pfc.96.2021.07.26.07.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 07:56:52 -0700 (PDT)
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
Subject: [PATCH v2 08/12] drm/msm: Return ERR_PTR() from submit_create()
Date:   Mon, 26 Jul 2021 08:00:22 -0700
Message-Id: <20210726150038.2187631-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150038.2187631-1-robdclark@gmail.com>
References: <20210726150038.2187631-1-robdclark@gmail.com>
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

