Return-Path: <linux-arm-msm+bounces-51985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FD0A69262
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43DFE8A6EB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFDD212B09;
	Wed, 19 Mar 2025 14:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LMNz5DF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC531DE4E7;
	Wed, 19 Mar 2025 14:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396133; cv=none; b=rzwe3+8anNUB2N4C8jg+jQZTf1WZqJa9bIqPX8eU3dyNJMTqQWcrkCJJuAarY7TWL2QRWAR66aP5EkLDjMd7X6Q3IkjbosfuS+VR9ECCIZLT+48+ooAEP+thmaTRikKo01RhoLBbd9E+HgMi+qZsTjVPhQqFFW51K0Yot/hkxpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396133; c=relaxed/simple;
	bh=o79r6tCeY0P38PsiNUSlSfEWia91GTvNdpsKrUAZ+JE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5b27WU4SWkkub159XKJxYlPEUqQcbJ2v0I0KjDfftuaKdbRP343D2U/u2x2al0YC1EkTIkS1zX25ooxacKzPoLpbJ6hyJ5jc11WoCaShl45OovUbBWwLSXO0T7nr7qDIhM6ZsK8hpEvB40dXOWQKSYHqWcYtm8U53b6a/eqDUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LMNz5DF3; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff615a114bso1332391a91.0;
        Wed, 19 Mar 2025 07:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396131; x=1743000931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNXaYltKdqI4pcwHv3VKQ0s77cLhZEAL3udH6bNlA1k=;
        b=LMNz5DF3y8CgnYlEXfzpnDWbfTZ7c3VdLZB4CFo1wIbDPIU82OVwvZMMEm2NT8gb44
         YWxLPnDeNrJB2IKTJdpOHryZt8v3VnemNGCRjdc+xZslhe9y9TQ7xDQHN8WE0irhrJSQ
         puhjcQNT3eSqUzUZoSQImm+a6YxuqObqaSOhFHWuqs1YZT0IS1lfvpHuS4/o50b9IDi2
         Fpnh9gOumLGheB6UJYas6lzCfeYFS6kVukQ+0/Y0NaZvXSPJSV6GbG62H+TlegbaJ3vD
         g3uiT2Dd8oNVA+2E81IP3ogCvdUJ6hSPr+IegoE4cWnLCzPPkYWky+1DTgISXRm80xg2
         Fk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396131; x=1743000931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNXaYltKdqI4pcwHv3VKQ0s77cLhZEAL3udH6bNlA1k=;
        b=dhrSgPt75gdX9xQx7Z7g/NHMWqq2HVnKWimG9OqYJhYd68aurz1VzXGgZkm9qIj8pX
         pG7QKNxCfIUINxY7T/4sfNPHsGrW0pMjRMtXiMrcvqY1OqD6akow9Q93Zh+vbVxdoJzt
         pPkLFNR78k0M8Nj/M9hmNvDXTZqdTNRAVkpZZWM3hLrjiDCyYLxv4LCQc9h/fO3CpdzG
         8KyFKmM1mDXEHd2t9Nc5HMA2bIdAJbf3o4+WAS/gUPvmWwolV5eua8uyrA0bjka6aKcW
         ZONGMIl6dd6XtALqkIpIb//Cp1qU7DCZO4Depn1nzPl/zkxT6MWgz+NyEhVk/nu8dlVi
         kIng==
X-Forwarded-Encrypted: i=1; AJvYcCU0jPUjd/CMEFWy58OydoNqf4Z3ZbKvQPIrUPnvKg+SHp2QweyhbnknK9JHetKAp2/hjXqjwKjyVeo8r3q7@vger.kernel.org, AJvYcCWiSe8/kvlaqdTB9tdeXp+bW2gEHUyEgrPnca2m1xeX/bTKZSAf+R5zTgJivpoQGP45dv0NkLvt/L+w4MKa@vger.kernel.org
X-Gm-Message-State: AOJu0YwJk0/A8FoXn+kh0jfItoljb33goW6r8BKqGB0WfIDf79Q7EIj9
	MoHu5yv175b8I42VAzHnwb69lh7rXS/j0crQAkl4KW4MXax5PBK2
X-Gm-Gg: ASbGncsdX0YuOcrtMfssp+78eLVGCIBZwVwZcWCn7ZFJtwLJ2CrLAaLFqn/e2nxiVYd
	j/lUf5XMdP/11wjaZMPp0uiHq4yRvIAzWFJCl5EWUdlLJDpnb6XoRE04n9Huy7xEbaActX9HhPr
	pqwLn1zbhP1aee62G1DBW1TPl2+bijyRe546Z2XVNNGwZxJPE3l65LdgNb+cYiUckQBqLS8Zkoz
	24XogXRLt7N4fQIgLl0HnihAjX0quRFURtncsiJYfjQbzmrkHWfvETDuQd4KPbg5S70MIUlmE6l
	/kPwPclFxtHGyfzxVhi+TrAGAne99gy4jsDp8If25lGgJscarl6Yaup4AbRKFCU51kTvzMDEE0D
	ij0HrUywxSS4/wODm67g=
X-Google-Smtp-Source: AGHT+IHYkvTd6Ji85eeGfR6RC4/2eCSeeWGGiU/i0Z4s8dLAfPk1JpKwIwLzLzIY/Vr8CeGvJLiqjQ==
X-Received: by 2002:a17:90b:2f48:b0:2fa:1e56:5d82 with SMTP id 98e67ed59e1d1-301bdb1074cmr5400280a91.17.1742396131316;
        Wed, 19 Mar 2025 07:55:31 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf58b360sm1682942a91.20.2025.03.19.07.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:55:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 13/34] drm/msm: Split submit_pin_objects()
Date: Wed, 19 Mar 2025 07:52:25 -0700
Message-ID: <20250319145425.51935-14-robdclark@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319145425.51935-1-robdclark@gmail.com>
References: <20250319145425.51935-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

For VM_BIND, in the first step, we just want to get the backing pages,
but defer creating the vma until the map/unmap/ops are evaluated.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 998cedb24941..c65f3a6a5256 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -292,12 +292,16 @@ static int submit_fence_sync(struct msm_gem_submit *submit)
 	return ret;
 }
 
-static int submit_pin_objects(struct msm_gem_submit *submit)
+static int submit_pin_vmas(struct msm_gem_submit *submit)
 {
-	struct msm_drm_private *priv = submit->dev->dev_private;
-	int i, ret = 0;
+	int ret = 0;
 
-	for (i = 0; i < submit->nr_bos; i++) {
+	/*
+	 * First loop, before holding the LRU lock, avoids holding the
+	 * LRU lock while calling msm_gem_pin_vma_locked (which could
+	 * trigger get_pages())
+	 */
+	for (int i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
 		struct drm_gpuva *vma;
 
@@ -315,6 +319,13 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 		submit->bos[i].iova = vma->va.addr;
 	}
 
+	return ret;
+}
+
+static void submit_pin_objects(struct msm_gem_submit *submit)
+{
+	struct msm_drm_private *priv = submit->dev->dev_private;
+
 	/*
 	 * A second loop while holding the LRU lock (a) avoids acquiring/dropping
 	 * the LRU lock for each individual bo, while (b) avoiding holding the
@@ -323,14 +334,12 @@ static int submit_pin_objects(struct msm_gem_submit *submit)
 	 * could trigger deadlock with the shrinker).
 	 */
 	mutex_lock(&priv->lru.lock);
-	for (i = 0; i < submit->nr_bos; i++) {
+	for (int i = 0; i < submit->nr_bos; i++) {
 		msm_gem_pin_obj_locked(submit->bos[i].obj);
 	}
 	mutex_unlock(&priv->lru.lock);
 
 	submit->bos_pinned = true;
-
-	return ret;
 }
 
 static void submit_unpin_objects(struct msm_gem_submit *submit)
@@ -760,10 +769,12 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			goto out;
 	}
 
-	ret = submit_pin_objects(submit);
+	ret = submit_pin_vmas(submit);
 	if (ret)
 		goto out;
 
+	submit_pin_objects(submit);
+
 	for (i = 0; i < args->nr_cmds; i++) {
 		struct drm_gem_object *obj;
 		uint64_t iova;
-- 
2.48.1


