Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5836328ABD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbgJLCJL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:09:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbgJLCJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:00 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65B6CC0613D2;
        Sun, 11 Oct 2020 19:09:00 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o3so2814001pgr.11;
        Sun, 11 Oct 2020 19:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+0Usxb0puoG06FcnRH1q78kIYCgqSaNY6zI0DBCZlYA=;
        b=UlsauAHQIt5BqQ1Lsq8LIVoQ1zxVO6RSFFbZPeS7jiiyB5nBIUzHPNPAjgSQaw5gLQ
         6pbiQAgjhKlywEdwq3hJS27LmzZvJGRJE79RIG+0OlymHfepsXgVMX8ywJGROb1H9qtM
         F/Zs09fMnlS7UJwmrdGBHPU6b2qDt0CHCn4HOhLyTHk8Z/C15xhkFu2dWw3vqGq6Zewl
         Iw+1IXbdPC5XhX+6lKxY6/a+VmS0D7f2fkJgGbxTVCskMY+exjGR1VIElpYBXmUPQGdw
         +2bkA5mSbIbZN9Ubha8Bbx6z8TCWDm6w2++0JGYswK7Q9/PPl8cyHWUpf4xf7kJKQfnh
         i67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+0Usxb0puoG06FcnRH1q78kIYCgqSaNY6zI0DBCZlYA=;
        b=r7BQ4udyHxdHagNdU6irMPkzuTv7yIRHfU4nwHjwMNUefzu6xBN3Wn84KMkvYRY/3A
         jQwGEmGyS364oSXBWmQH9qTBOrvErnfvhAPzHioc6uP3V6snTZx33w5HavASn33odjzt
         jkup5CmsQ0lmA3onR3j62de0xMWHp/RKeszMgDjtT+yHQcoJpRfy3njjmK5W54obHUoe
         DZWnMd8rIEppAp4qzs+uwI9vk5478hfPelv7W/iT4WsBb3oDXg65ZiW4kcDIEqpbRkam
         cQhYbaakRi5ddXi3qwIKP2etsPNurlnvm2uWjXfgLn9sbmmmhBTeWMH6i2ArrJuquGAq
         CODA==
X-Gm-Message-State: AOAM530A5+EDO5HY6Ta1h5ma5l0KpajqRLjFGLHbBJWn6d77jPVkExxl
        zuRYgnW4epjjHkKx6JZX+50=
X-Google-Smtp-Source: ABdhPJw5vwHQ1vQzPXfCm4wrWjisKLswLu62DqfKRUaxCjJlYoGme5NhhF5MKFR7rzvTIPTKcT70vw==
X-Received: by 2002:a17:90b:1114:: with SMTP id gi20mr16851866pjb.12.1602468539940;
        Sun, 11 Oct 2020 19:08:59 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j25sm17648055pfn.212.2020.10.11.19.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:08:59 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 06/22] drm/msm/submit: Move copy_from_user ahead of locking bos
Date:   Sun, 11 Oct 2020 19:09:33 -0700
Message-Id: <20201012020958.229288-7-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
index 947eeaca661d..744889436a98 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -238,7 +238,10 @@ struct msm_gem_submit {
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

