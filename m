Return-Path: <linux-arm-msm+bounces-1254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C57F97F2250
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 01:40:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EBCBB21771
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 00:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5E317D4;
	Tue, 21 Nov 2023 00:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rt4yfhbV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A30E5D9;
	Mon, 20 Nov 2023 16:40:05 -0800 (PST)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3b2ec9a79bdso3601609b6e.3;
        Mon, 20 Nov 2023 16:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700527205; x=1701132005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jJiNmIhW71Zn4Fc0nq68KcS1kEb54hrII7uSxSemAM=;
        b=Rt4yfhbVMN1O9U2g7OhGuyiqVI/VDTNM1Y9yqEltZ8mgdwXi4Oq7UVVGe7CL92ejI5
         LYuHPs5kdVi2f5qPc+QHUwfEFH6jSezQNQxTM9tA4tugpzl8nvbepax3MxPwV+Kvb5/m
         04d0T6J9R+rCvQO5h2d+6e/v+dBuhPJC+oOCAN6ITieYV+MKuAKk0VoELwAO9SUfk4Ji
         CNcWbhdDgmHmxtMciOlmhy9aVyapQgJi6EkBtcNtz5/wMKQLIWA/tUaXjNc3kCowjtaH
         nfQPa8LKgbLO+o4TYjLXuVNJYM7swVR95qguBP0rLt6Ar3D34SSDFbecrg3bXTemRS1p
         wlJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700527205; x=1701132005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7jJiNmIhW71Zn4Fc0nq68KcS1kEb54hrII7uSxSemAM=;
        b=Us0K8juDPZNbyZuOZ/pcockakvdsXaP7tHfKzdnql5of3uE1JhbbD+TuGya2bU3kDu
         LEtvgkTq4NvkxSCJvMzEy/+kDTTI8vLbG+xIVLyWsqrvgR9/P4RVOAfMKwzNgNL/NbPt
         Kaa0eTv41lj/nfXB6ozoC4uJ1DtviI7eaukK+yvERKB9KqpHu3wWLTlK5BSRt4t1beEb
         PVhYJhIN7G1zbvka6AmteC1v1khBtzA8ml5iINgKITXuLK7fV9NM60q/RjGI7lq5+7Ze
         6JaoaswIqhd5yHfeINPtyNh2eXN9K0gfkLEqVeVFvwBoA9GyT715or73NQN9O8+ZkTzQ
         WzVA==
X-Gm-Message-State: AOJu0YwA+tuJZ4E2UcwpGPYhsZa62mP+KM4kNFZqrrnQ6loZtQZgwUrd
	y1AhBa994iXORE0VrEmgDQg=
X-Google-Smtp-Source: AGHT+IHcGK1NJmg8WEvF1E/QUfwop36BTwpUAa5h3H7ELtuDNLXxZzI9udncaGpBHWzB0HNrN1hbMg==
X-Received: by 2002:a05:6808:114b:b0:3ae:170f:a39b with SMTP id u11-20020a056808114b00b003ae170fa39bmr12467395oiu.17.1700527204827;
        Mon, 20 Nov 2023 16:40:04 -0800 (PST)
Received: from localhost ([47.215.232.245])
        by smtp.gmail.com with ESMTPSA id r1-20020a6560c1000000b005ab281d0777sm5665374pgv.20.2023.11.20.16.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 16:40:04 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/7] drm/msm/gem: Remove "valid" tracking
Date: Mon, 20 Nov 2023 16:38:45 -0800
Message-ID: <20231121003935.5868-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121003935.5868-1-robdclark@gmail.com>
References: <20231121003935.5868-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

This was a small optimization for pre-soft-pin userspace.  But mesa
switched to soft-pin nearly 5yrs ago.  So lets drop the optimization
and simplify the code.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.h        |  2 --
 drivers/gpu/drm/msm/msm_gem_submit.c | 44 +++++-----------------------
 2 files changed, 8 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 8ddef5443140..c36c1c1fa222 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -271,7 +271,6 @@ struct msm_gem_submit {
 	struct msm_gpu_submitqueue *queue;
 	struct pid *pid;    /* submitting process */
 	bool fault_dumped;  /* Limit devcoredump dumping to one per submit */
-	bool valid;         /* true if no cmdstream patching needed */
 	bool in_rb;         /* "sudo" mode, copy cmds into RB */
 	struct msm_ringbuffer *ring;
 	unsigned int nr_cmds;
@@ -288,7 +287,6 @@ struct msm_gem_submit {
 	} *cmd;  /* array of size nr_cmds */
 	struct {
 /* make sure these don't conflict w/ MSM_SUBMIT_BO_x */
-#define BO_VALID	0x8000	/* is current addr in cmdstream correct/valid? */
 #define BO_LOCKED	0x4000	/* obj lock is held */
 #define BO_PINNED	0x2000	/* obj (pages) is pinned and on active list */
 		uint32_t flags;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 6d8ec1337e8b..996274ef32a6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -150,8 +150,6 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 
 		submit->bos[i].handle = submit_bo.handle;
 		submit->bos[i].flags = submit_bo.flags;
-		/* in validate_objects() we figure out if this is true: */
-		submit->bos[i].iova  = submit_bo.presumed;
 	}
 
 	spin_lock(&file->table_lock);
@@ -278,9 +276,6 @@ static void submit_unlock_unpin_bo(struct msm_gem_submit *submit, int i)
 {
 	unsigned cleanup_flags = BO_PINNED | BO_LOCKED;
 	submit_cleanup_bo(submit, i, cleanup_flags);
-
-	if (!(submit->bos[i].flags & BO_VALID))
-		submit->bos[i].iova = 0;
 }
 
 /* This is where we make sure all the bo's are reserved and pin'd: */
@@ -390,8 +385,6 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 	struct msm_drm_private *priv = submit->dev->dev_private;
 	int i, ret = 0;
 
-	submit->valid = true;
-
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 		struct msm_gem_vma *vma;
@@ -407,14 +400,7 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		if (ret)
 			break;
 
-		if (vma->iova == submit->bos[i].iova) {
-			submit->bos[i].flags |= BO_VALID;
-		} else {
-			submit->bos[i].iova = vma->iova;
-			/* iova changed, so address in cmdstream is not valid: */
-			submit->bos[i].flags &= ~BO_VALID;
-			submit->valid = false;
-		}
+		submit->bos[i].iova = vma->iova;
 	}
 
 	/*
@@ -451,7 +437,7 @@ static void submit_attach_object_fences(struct msm_gem_submit *submit)
 }
 
 static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
-		struct drm_gem_object **obj, uint64_t *iova, bool *valid)
+		struct drm_gem_object **obj, uint64_t *iova)
 {
 	if (idx >= submit->nr_bos) {
 		SUBMIT_ERROR(submit, "invalid buffer index: %u (out of %u)\n",
@@ -463,8 +449,6 @@ static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
 		*obj = submit->bos[idx].obj;
 	if (iova)
 		*iova = submit->bos[idx].iova;
-	if (valid)
-		*valid = !!(submit->bos[idx].flags & BO_VALID);
 
 	return 0;
 }
@@ -477,9 +461,6 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 	uint32_t *ptr;
 	int ret = 0;
 
-	if (!nr_relocs)
-		return 0;
-
 	if (offset % 4) {
 		SUBMIT_ERROR(submit, "non-aligned cmdstream buffer: %u\n", offset);
 		return -EINVAL;
@@ -500,7 +481,6 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 		struct drm_msm_gem_submit_reloc submit_reloc = relocs[i];
 		uint32_t off;
 		uint64_t iova;
-		bool valid;
 
 		if (submit_reloc.submit_offset % 4) {
 			SUBMIT_ERROR(submit, "non-aligned reloc offset: %u\n",
@@ -519,13 +499,10 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
 			goto out;
 		}
 
-		ret = submit_bo(submit, submit_reloc.reloc_idx, NULL, &iova, &valid);
+		ret = submit_bo(submit, submit_reloc.reloc_idx, NULL, &iova);
 		if (ret)
 			goto out;
 
-		if (valid)
-			continue;
-
 		iova += submit_reloc.reloc_offset;
 
 		if (submit_reloc.shift < 0)
@@ -879,8 +856,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		struct drm_gem_object *obj;
 		uint64_t iova;
 
-		ret = submit_bo(submit, submit->cmd[i].idx,
-				&obj, &iova, NULL);
+		ret = submit_bo(submit, submit->cmd[i].idx, &obj, &iova);
 		if (ret)
 			goto out;
 
@@ -894,17 +870,13 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 		submit->cmd[i].iova = iova + (submit->cmd[i].offset * 4);
 
-		if (submit->valid)
+		if (likely(!submit->cmd[i].nr_relocs))
 			continue;
 
 		if (!gpu->allow_relocs) {
-			if (submit->cmd[i].nr_relocs) {
-				SUBMIT_ERROR(submit, "relocs not allowed\n");
-				ret = -EINVAL;
-				goto out;
-			}
-
-			continue;
+			SUBMIT_ERROR(submit, "relocs not allowed\n");
+			ret = -EINVAL;
+			goto out;
 		}
 
 		ret = submit_reloc(submit, obj, submit->cmd[i].offset * 4,
-- 
2.42.0


