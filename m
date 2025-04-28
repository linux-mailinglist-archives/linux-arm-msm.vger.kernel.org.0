Return-Path: <linux-arm-msm+bounces-55955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BEDA9FB3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 22:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14AFE3BCC3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 20:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83642207A20;
	Mon, 28 Apr 2025 20:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTny9H9E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44F620012C;
	Mon, 28 Apr 2025 20:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873823; cv=none; b=nx1wbgYMOgVRgBr/AH9m88gBrqG7V+3OFCInTwvjzTplurJpenfTM3rZ+GhLft0goq5HoGxy4Tek0SfPvNbPNLZLnEljQVzbOyUtMKF6kP6k9cxoaA2MYNPKmruUHOY9VjZkNGtrjNHAL/GkbwSdPySm54aJsn5cYaaKR5HXFVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873823; c=relaxed/simple;
	bh=2WpPjdOnE7lRX5ZCDjp17CsoLPIlDS7/qvt4/yxrQdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xc09InUQwEUp09gjUgZB3M6rvq1JhcC4keNlsNtwkGtwy50sMN01tIbuWcHHZbSVgY4W63xyX83pFcda/qHk5NOVCNqHgHg3kcNHToSsmWyUVoeydYsJEXTfNjPBioXdwEeEQKeiq7fRSoZzDViFMtuS/PYqyzyN/kjWqsh+wG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTny9H9E; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af5139ad9a2so3557518a12.1;
        Mon, 28 Apr 2025 13:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873821; x=1746478621; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZJAaoLVx59vP6ayQOWcOdWbgIttwlPWjJpDsI8g2BE=;
        b=MTny9H9EyYR80+hhnfDcxOdC1TNdgZ21IF6yOhlc99SY76w22Ldvg2UAcehco/y903
         jwY1L9jabwvh1eTku7Hi9ZvSBRj91w2392mGHuZxqW3k0jXFCwlA0EtMDbuYLSyAyWNd
         EuxTvzYVciNMI4T4yoZJ7CBhYeaGGIbFtORsjyAvqflfFt1bxRPz8ORpQp6mDYh7j9io
         SDbgLEWOvfH10h0+bDua1KTwjSIhR1Ber5a/TSg+SvxpG5MMobYumDy/sxU13bG7bubO
         hYzBljZtae/Yxrz6RhqT5XRhoAgRKbgJA82a+U1FQKdsQD2l0B1+lljdnOfKvaINFgVP
         jalg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873821; x=1746478621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZJAaoLVx59vP6ayQOWcOdWbgIttwlPWjJpDsI8g2BE=;
        b=rUN/yIkR/bf3a42IOOcYyphO9hfVrL4YdD69Osus8kndnMXIWCJ6h1VQlJTAgVdDGT
         h4d++jiMPlEsrPklRPjZ8S1KzDTVxBR0d+9n7BikNWph6IvjYVpXtNhd6NrWa3ZlaxNu
         orFbg/HhMxgBkZSHnutYzaacZBEiX/PuEN1+s0oozDG2qd+no0E79gzdwefSaCkbnDhS
         Uf/IpGxLHMPBZ8sQypKKvMWAPPGADpw6nZbjCIAAV+kcO5JRDOKbyZMpxR0m9pImssj5
         oZAZJYih1CkpFy3xH6rRdls2vsBacrYibOzruXYZv0qrG/4y1FV76OHfHC240rFczd9q
         motA==
X-Forwarded-Encrypted: i=1; AJvYcCUBi8jvqc8amZJV67AbkNKR5kzxvW6a9V9VqWGvD2lO63q9Jy7XMuQiDgufPsJy3KroQ80rawVRoXJJo/t1@vger.kernel.org, AJvYcCWi9DYrAOqhaWQ9bC9KzcarHgX3aKsHm0LNLLBFSmhwkSGwKF09+e6Vi4UEYqQcLj1t+n72AHWNWbnu+yjw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Teiy5guevBStrtIbGARdirzgJI49R8cQoZtxr92OzDMIiKWv
	vaBpbJFMsdfagGfxefDHxks0ZzuIxbQdMBDARzyQgAWnsvW9rK/q
X-Gm-Gg: ASbGncs9HQSUvCsfU4AsnylOpCllrMpEn1odTqvrxyoC35QccjpiMllmN7UR+WxTTcy
	xpF3ja4mgn0pbgQsTI4+abVBEnJiUuN30qUS6cD81e5sqdr7bPpqj+Tgj2fhkj3eZceyw1+91xm
	vgXLpUTpfSSsIs0Xe98hSn3CPahZYDa45QqRrzeveOmyKkWiSjNk4e68Q7G7t9/gTab/8a8TjlZ
	2W0mptXOi8qB/WeuH55G37lLqgMqsur3YNF18HK06wfQvEzSMU8VZhsnqDoL2NCUCoSz46P4JiF
	1erGQo5qObyrp2k1cG1tDLlmZ+TWzTwUOJ1eTG2DoLQ1gi6kodF/viOeP3BJPZn2/LoVk5imp8z
	XGl32yfCUSoCFLDg=
X-Google-Smtp-Source: AGHT+IGORW7GBpJWpejqZFYn5aZJt1DdAQsviQ7L3ouF8GkxTnc+Ol2cHVn55Y1SJEid50izEUvrvA==
X-Received: by 2002:a17:90a:d00b:b0:2ef:31a9:95c6 with SMTP id 98e67ed59e1d1-30a215530d9mr1986181a91.14.1745873820980;
        Mon, 28 Apr 2025 13:57:00 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7763deasm7744626a91.23.2025.04.28.13.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:57:00 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 08/33] drm/msm: Collapse vma allocation and initialization
Date: Mon, 28 Apr 2025 13:54:15 -0700
Message-ID: <20250428205619.227835-9-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205619.227835-1-robdclark@gmail.com>
References: <20250428205619.227835-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Now that we've dropped vram carveout support, we can collapse vma
allocation and initialization.  This better matches how things work
with drm_gpuvm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c     | 30 +++-----------------------
 drivers/gpu/drm/msm/msm_gem.h     |  4 ++--
 drivers/gpu/drm/msm/msm_gem_vma.c | 36 +++++++++++++------------------
 3 files changed, 20 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 621fb4e17a2e..29247911f048 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -337,23 +337,6 @@ uint64_t msm_gem_mmap_offset(struct drm_gem_object *obj)
 	return offset;
 }
 
-static struct msm_gem_vma *add_vma(struct drm_gem_object *obj,
-		struct msm_gem_vm *vm)
-{
-	struct msm_gem_object *msm_obj = to_msm_bo(obj);
-	struct msm_gem_vma *vma;
-
-	msm_gem_assert_locked(obj);
-
-	vma = msm_gem_vma_new(vm);
-	if (!vma)
-		return ERR_PTR(-ENOMEM);
-
-	list_add_tail(&vma->list, &msm_obj->vmas);
-
-	return vma;
-}
-
 static struct msm_gem_vma *lookup_vma(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm)
 {
@@ -420,6 +403,7 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 		struct msm_gem_vm *vm,
 		u64 range_start, u64 range_end)
 {
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
 
 	msm_gem_assert_locked(obj);
@@ -427,18 +411,10 @@ static struct msm_gem_vma *get_vma_locked(struct drm_gem_object *obj,
 	vma = lookup_vma(obj, vm);
 
 	if (!vma) {
-		int ret;
-
-		vma = add_vma(obj, vm);
+		vma = msm_gem_vma_new(vm, obj, range_start, range_end);
 		if (IS_ERR(vma))
 			return vma;
-
-		ret = msm_gem_vma_init(vma, obj->size,
-			range_start, range_end);
-		if (ret) {
-			del_vma(vma);
-			return ERR_PTR(ret);
-		}
+		list_add_tail(&vma->list, &msm_obj->vmas);
 	} else {
 		GEM_WARN_ON(vma->iova < range_start);
 		GEM_WARN_ON((vma->iova + obj->size) > range_end);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index c16b11182831..9bd78642671c 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -66,8 +66,8 @@ struct msm_gem_vma {
 	bool mapped;
 };
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm);
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
 		u64 range_start, u64 range_end);
 void msm_gem_vma_purge(struct msm_gem_vma *vma);
 int msm_gem_vma_map(struct msm_gem_vma *vma, int prot, struct sg_table *sgt, int size);
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 9419692f0cc8..6d18364f321c 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -106,47 +106,41 @@ void msm_gem_vma_close(struct msm_gem_vma *vma)
 	msm_gem_vm_put(vm);
 }
 
-struct msm_gem_vma *msm_gem_vma_new(struct msm_gem_vm *vm)
+/* Create a new vma and allocate an iova for it */
+struct msm_gem_vma *
+msm_gem_vma_new(struct msm_gem_vm *vm, struct drm_gem_object *obj,
+		u64 range_start, u64 range_end)
 {
 	struct msm_gem_vma *vma;
+	int ret;
 
 	vma = kzalloc(sizeof(*vma), GFP_KERNEL);
 	if (!vma)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	vma->vm = vm;
 
-	return vma;
-}
-
-/* Initialize a new vma and allocate an iova for it */
-int msm_gem_vma_init(struct msm_gem_vma *vma, int size,
-		u64 range_start, u64 range_end)
-{
-	struct msm_gem_vm *vm = vma->vm;
-	int ret;
-
-	if (GEM_WARN_ON(!vm))
-		return -EINVAL;
-
-	if (GEM_WARN_ON(vma->iova))
-		return -EBUSY;
-
 	spin_lock(&vm->lock);
 	ret = drm_mm_insert_node_in_range(&vm->mm, &vma->node,
-					  size, PAGE_SIZE, 0,
+					  obj->size, PAGE_SIZE, 0,
 					  range_start, range_end, 0);
 	spin_unlock(&vm->lock);
 
 	if (ret)
-		return ret;
+		goto err_free_vma;
 
 	vma->iova = vma->node.start;
 	vma->mapped = false;
 
+	INIT_LIST_HEAD(&vma->list);
+
 	kref_get(&vm->kref);
 
-	return 0;
+	return vma;
+
+err_free_vma:
+	kfree(vma);
+	return ERR_PTR(ret);
 }
 
 struct msm_gem_vm *
-- 
2.49.0


