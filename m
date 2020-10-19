Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B87293007
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728838AbgJSUrC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:47:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728514AbgJSUpp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:45:45 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9269CC0613CE;
        Mon, 19 Oct 2020 13:45:45 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id x13so682810pgp.7;
        Mon, 19 Oct 2020 13:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YsmBQA+C1bDyQWIRHo7QvKc1r4T12MZo6bgQ7Za9044=;
        b=sv6KED9V3jSoDw9wqZbup/+wgDtauftLvDixRUmyQvz5CDRvRo7PqbqXViq8xhqezW
         JVwWQRJBZT873Pa73NmcwNfz7+5wS7fxg+wOoqX6m5JE0jqzJnTK9uPvrAgwQYSfKMmG
         nbj0hZTDLZWA5YWleFB+ERunnFzjxId9DNeNy52Kc7K6NrkaFvKN6xYU9pbwNwQ4RlkJ
         RnQ3XRyJtyXI/vV8uZGIoKTIT9oTOlEeqR/0MDEBqSLauG2RdbBtQPy25j+CxBpa2vUd
         a+RvjruBRflX3JQTfyCU4fMOfDl7SHEqPgpPYZeN+x6XaG1onzqP1fyrLlt6S3Ev6llM
         6QYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YsmBQA+C1bDyQWIRHo7QvKc1r4T12MZo6bgQ7Za9044=;
        b=M5zBEalfWgd0/CBmwEWG/2slFZE1If+5qC23cNOp0/09GLqIm4w1htplRnl6hdRAIH
         IuhhIAua0xLFbk0FEFXWwgWdoObxd4Wf64VkQ96JNRj+UFDqVjZ82XncFIfOsq69fPnl
         Lr8kujfV6WGeFLEJXsDqDG5B/ZZ69xB4xgYEp2M5Cl9GVCmKLYq+GZVRAAVU4h4h7Zm+
         hREX/+QXiHJJQoWpdFzl3DP+HNntNDJfSqbYQ0u6SRbYcYsGUkFWbre4oqqYwRyKyzYk
         12XQ0MSMtSh+peljvFFChRAnPkz0GWHvfRKjVc77lO1DaJ6p34zwCYAS5iQpI4xo4qKP
         zxug==
X-Gm-Message-State: AOAM531V17sddbfd9IN7MmjHHrrHd1riNnShK2fGoccT7W+SmUv6eQnA
        rOhmX8Dk8Qc0S8dWNJXyJtU=
X-Google-Smtp-Source: ABdhPJwgXc9rO0P4ZP6AoZJPC3QQJ23nqx0R76qLqitHrUQ8/95otdi+x9H6JaCA08EmPMSo6JrcLQ==
X-Received: by 2002:a63:d117:: with SMTP id k23mr1341157pgg.176.1603140345047;
        Mon, 19 Oct 2020 13:45:45 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id u69sm678305pfc.27.2020.10.19.13.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:45:43 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 07/23] drm/msm/submit: Move copy_from_user ahead of locking bos
Date:   Mon, 19 Oct 2020 13:46:08 -0700
Message-Id: <20201019204636.139997-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

We cannot switch to using obj->resv for locking without first moving all
the copy_from_user() ahead of submit_lock_objects().  Otherwise in the
mm fault path we aquire mm->mmap_sem before obj lock, but in the submit
path the order is reversed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        |   3 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 121 ++++++++++++++++-----------
 2 files changed, 76 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c5232b8da794..0b7dda312992 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -240,7 +240,10 @@ struct msm_gem_submit {
 		uint32_t type;
 		uint32_t size;  /* in dwords */
 		uint64_t iova;
+		uint32_t offset;/* in dwords */
 		uint32_t idx;   /* cmdstream buffer idx in bos[] */
+		uint32_t nr_relocs;
+		struct drm_msm_gem_submit_reloc *relocs;
 	} *cmd;  /* array of size nr_cmds */
 	struct {
 		uint32_t flags;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index aa5c60a7132d..002130d826aa 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -62,11 +62,16 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 
 void msm_gem_submit_free(struct msm_gem_submit *submit)
 {
+	unsigned i;
+
 	dma_fence_put(submit->fence);
 	list_del(&submit->node);
 	put_pid(submit->pid);
 	msm_submitqueue_put(submit->queue);
 
+	for (i = 0; i < submit->nr_cmds; i++)
+		kfree(submit->cmd[i].relocs);
+
 	kfree(submit);
 }
 
@@ -150,6 +155,60 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 	return ret;
 }
 
+static int submit_lookup_cmds(struct msm_gem_submit *submit,
+		struct drm_msm_gem_submit *args, struct drm_file *file)
+{
+	unsigned i, sz;
+	int ret = 0;
+
+	for (i = 0; i < args->nr_cmds; i++) {
+		struct drm_msm_gem_submit_cmd submit_cmd;
+		void __user *userptr =
+			u64_to_user_ptr(args->cmds + (i * sizeof(submit_cmd)));
+
+		ret = copy_from_user(&submit_cmd, userptr, sizeof(submit_cmd));
+		if (ret) {
+			ret = -EFAULT;
+			goto out;
+		}
+
+		/* validate input from userspace: */
+		switch (submit_cmd.type) {
+		case MSM_SUBMIT_CMD_BUF:
+		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
+		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
+			break;
+		default:
+			DRM_ERROR("invalid type: %08x\n", submit_cmd.type);
+			return -EINVAL;
+		}
+
+		if (submit_cmd.size % 4) {
+			DRM_ERROR("non-aligned cmdstream buffer size: %u\n",
+					submit_cmd.size);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		submit->cmd[i].type = submit_cmd.type;
+		submit->cmd[i].size = submit_cmd.size / 4;
+		submit->cmd[i].offset = submit_cmd.submit_offset / 4;
+		submit->cmd[i].idx  = submit_cmd.submit_idx;
+		submit->cmd[i].nr_relocs = submit_cmd.nr_relocs;
+
+		sz = sizeof(struct drm_msm_gem_submit_reloc) * submit_cmd.nr_relocs;
+		submit->cmd[i].relocs = kmalloc(sz, GFP_KERNEL);
+		ret = copy_from_user(submit->cmd[i].relocs, userptr, sz);
+		if (ret) {
+			ret = -EFAULT;
+			goto out;
+		}
+	}
+
+out:
+	return ret;
+}
+
 static void submit_unlock_unpin_bo(struct msm_gem_submit *submit,
 		int i, bool backoff)
 {
@@ -301,7 +360,7 @@ static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
 
 /* process the reloc's and patch up the cmdstream as needed: */
 static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *obj,
-		uint32_t offset, uint32_t nr_relocs, uint64_t relocs)
+		uint32_t offset, uint32_t nr_relocs, struct drm_msm_gem_submit_reloc *relocs)
 {
 	uint32_t i, last_offset = 0;
 	uint32_t *ptr;
@@ -327,18 +386,11 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
 	}
 
 	for (i = 0; i < nr_relocs; i++) {
-		struct drm_msm_gem_submit_reloc submit_reloc;
-		void __user *userptr =
-			u64_to_user_ptr(relocs + (i * sizeof(submit_reloc)));
+		struct drm_msm_gem_submit_reloc submit_reloc = relocs[i];
 		uint32_t off;
 		uint64_t iova;
 		bool valid;
 
-		if (copy_from_user(&submit_reloc, userptr, sizeof(submit_reloc))) {
-			ret = -EFAULT;
-			goto out;
-		}
-
 		if (submit_reloc.submit_offset % 4) {
 			DRM_ERROR("non-aligned reloc offset: %u\n",
 					submit_reloc.submit_offset);
@@ -694,6 +746,10 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
+	ret = submit_lookup_cmds(submit, args, file);
+	if (ret)
+		goto out;
+
 	/* copy_*_user while holding a ww ticket upsets lockdep */
 	ww_acquire_init(&submit->ticket, &reservation_ww_class);
 	has_ww_ticket = true;
@@ -710,60 +766,29 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		goto out;
 
 	for (i = 0; i < args->nr_cmds; i++) {
-		struct drm_msm_gem_submit_cmd submit_cmd;
-		void __user *userptr =
-			u64_to_user_ptr(args->cmds + (i * sizeof(submit_cmd)));
 		struct msm_gem_object *msm_obj;
 		uint64_t iova;
 
-		ret = copy_from_user(&submit_cmd, userptr, sizeof(submit_cmd));
-		if (ret) {
-			ret = -EFAULT;
-			goto out;
-		}
-
-		/* validate input from userspace: */
-		switch (submit_cmd.type) {
-		case MSM_SUBMIT_CMD_BUF:
-		case MSM_SUBMIT_CMD_IB_TARGET_BUF:
-		case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
-			break;
-		default:
-			DRM_ERROR("invalid type: %08x\n", submit_cmd.type);
-			ret = -EINVAL;
-			goto out;
-		}
-
-		ret = submit_bo(submit, submit_cmd.submit_idx,
+		ret = submit_bo(submit, submit->cmd[i].idx,
 				&msm_obj, &iova, NULL);
 		if (ret)
 			goto out;
 
-		if (submit_cmd.size % 4) {
-			DRM_ERROR("non-aligned cmdstream buffer size: %u\n",
-					submit_cmd.size);
+		if (!submit->cmd[i].size ||
+			((submit->cmd[i].size + submit->cmd[i].offset) >
+				msm_obj->base.size / 4)) {
+			DRM_ERROR("invalid cmdstream size: %u\n", submit->cmd[i].size * 4);
 			ret = -EINVAL;
 			goto out;
 		}
 
-		if (!submit_cmd.size ||
-			((submit_cmd.size + submit_cmd.submit_offset) >
-				msm_obj->base.size)) {
-			DRM_ERROR("invalid cmdstream size: %u\n", submit_cmd.size);
-			ret = -EINVAL;
-			goto out;
-		}
-
-		submit->cmd[i].type = submit_cmd.type;
-		submit->cmd[i].size = submit_cmd.size / 4;
-		submit->cmd[i].iova = iova + submit_cmd.submit_offset;
-		submit->cmd[i].idx  = submit_cmd.submit_idx;
+		submit->cmd[i].iova = iova + (submit->cmd[i].offset * 4);
 
 		if (submit->valid)
 			continue;
 
-		ret = submit_reloc(submit, msm_obj, submit_cmd.submit_offset,
-				submit_cmd.nr_relocs, submit_cmd.relocs);
+		ret = submit_reloc(submit, msm_obj, submit->cmd[i].offset * 4,
+				submit->cmd[i].nr_relocs, submit->cmd[i].relocs);
 		if (ret)
 			goto out;
 	}
-- 
2.26.2

