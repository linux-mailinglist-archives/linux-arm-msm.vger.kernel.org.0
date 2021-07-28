Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3FF13D84F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 03:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233830AbhG1BC2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 21:02:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233008AbhG1BC1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 21:02:27 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E174BC061757;
        Tue, 27 Jul 2021 18:02:25 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id i1so641939plr.9;
        Tue, 27 Jul 2021 18:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e/9kD03R/I14WeS9EvRH7N0IZXDfhlSexdVdh0n2rZY=;
        b=p0V70I6cTWgkT7Dl1AXaU+BzNC+4QEIXUUq6ids08o+Q1V7Y6QUexL5xfBs3KaxKDt
         2iNZ+/2oBjCqS7xRQ7FCTC9xSlfPDuYorRCyQIDV3ZX3HQHySX8d23bdxLYa2wRDlAx4
         0GDZoXihH0wrRmTUnffDvGBV8tHGyoTv9xgl6gx74fHMeelh1qkrm5kFxqo+rigmjoWB
         FQ3+lNfTXDnDPqO2A4pOINs0U8YwALc75iZ/Kki5a1J6EVIOytffPxwfwBcTj5A5m6nf
         GkM5Hz2YDYBNOG04+2oVuyuFS0qVYol4JKOpaHUTAG7O8LnHp2Kf+64zgVgNAwy3FHFq
         OxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e/9kD03R/I14WeS9EvRH7N0IZXDfhlSexdVdh0n2rZY=;
        b=ivRRz5jwlVi2r5LbohGdb5H83iUO5AtqWNIuOKYp7HJuEjnQPNjrMJxfiTZtpAkdcR
         Asjx7lPWh4EQ4b1kW0kiBvV2TxnF4uEguLgxgGzjzG5UOv30+lOJniHX68EeG9rlueC1
         lZRUR2DOklaBTLrPMveOLPbt9TJ60lXDJ83ojbDsj6mO67skkqNpx2s4kJZz5yt6bx4K
         BUGR3EuJ1BCs6R2Fsq6PqBb0HT+PIwydS9m/6GDtHoZAhU86nLUaTCpXNtJvrVwKnANZ
         aa6zfmtKbbF0KtHrirgl4cAhwGdjtzNWZvShYbr857Ec1H6nFbJzc3Tdr6T94RERkNLS
         qU2Q==
X-Gm-Message-State: AOAM533FJNQzaM42q7LA5qiI93zF/+sEN79zMBjSygBwX93GzLb+gfF8
        37vRMFs+98ixEuuV/z75d/E=
X-Google-Smtp-Source: ABdhPJz/mf5j/TzaPrJB4KzOY76/zZgosiIyZhXKtL1a1lquAXrEA2WQEnjMLMBruv4LGcEO5lU3iQ==
X-Received: by 2002:a62:1489:0:b029:336:162f:3417 with SMTP id 131-20020a6214890000b0290336162f3417mr363638pfu.14.1627434145455;
        Tue, 27 Jul 2021 18:02:25 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id nm19sm4059637pjb.27.2021.07.27.18.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 18:02:24 -0700 (PDT)
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
Subject: [PATCH v4 01/13] drm/msm: Docs and misc cleanup
Date:   Tue, 27 Jul 2021 18:06:06 -0700
Message-Id: <20210728010632.2633470-2-robdclark@gmail.com>
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

Fix a couple incorrect or misspelt comments, and add submitqueue doc
comment.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.h         |  3 +--
 drivers/gpu/drm/msm/msm_gem_submit.c  |  1 +
 drivers/gpu/drm/msm/msm_gpu.h         | 15 +++++++++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c  |  2 +-
 drivers/gpu/drm/msm/msm_submitqueue.c |  9 +++++----
 5 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 405f8411e395..d69fcb37ce17 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -313,8 +313,7 @@ void msm_gem_vunmap(struct drm_gem_object *obj);
 
 /* Created per submit-ioctl, to track bo's and cmdstream bufs, etc,
  * associated with the cmdstream submission for synchronization (and
- * make it easier to unwind when things go wrong, etc).  This only
- * lasts for the duration of the submit-ioctl.
+ * make it easier to unwind when things go wrong, etc).
  */
 struct msm_gem_submit {
 	struct kref ref;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 44f84bfd0c0e..6d46f9275a40 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -655,6 +655,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	bool has_ww_ticket = false;
 	unsigned i;
 	int ret, submitid;
+
 	if (!gpu)
 		return -ENXIO;
 
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 710c3fedfbf3..96efcb31e502 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -250,6 +250,21 @@ struct msm_gpu_perfcntr {
 	const char *name;
 };
 
+/**
+ * A submitqueue is associated with a gl context or vk queue (or equiv)
+ * in userspace.
+ *
+ * @id:        userspace id for the submitqueue, unique within the drm_file
+ * @flags:     userspace flags for the submitqueue, specified at creation
+ *             (currently unusued)
+ * @prio:      the submitqueue priority
+ * @faults:    the number of GPU hangs associated with this submitqueue
+ * @ctx:       the per-drm_file context associated with the submitqueue (ie.
+ *             which set of pgtables do submits jobs associated with the
+ *             submitqueue use)
+ * @node:      node in the context's list of submitqueues
+ * @ref:       reference count
+ */
 struct msm_gpu_submitqueue {
 	int id;
 	u32 flags;
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 7e92d9532454..054461662af5 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -32,7 +32,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 
 	if (IS_ERR(ring->start)) {
 		ret = PTR_ERR(ring->start);
-		ring->start = 0;
+		ring->start = NULL;
 		goto fail;
 	}
 
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index c3d206105d28..e5eef11ed014 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -98,17 +98,18 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	return 0;
 }
 
+/*
+ * Create the default submit-queue (id==0), used for backwards compatibility
+ * for userspace that pre-dates the introduction of submitqueues.
+ */
 int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 {
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio;
 
-	if (!ctx)
-		return 0;
-
 	/*
 	 * Select priority 2 as the "default priority" unless nr_rings is less
-	 * than 2 and then pick the lowest pirority
+	 * than 2 and then pick the lowest priority
 	 */
 	default_prio = priv->gpu ?
 		clamp_t(uint32_t, 2, 0, priv->gpu->nr_rings - 1) : 0;
-- 
2.31.1

