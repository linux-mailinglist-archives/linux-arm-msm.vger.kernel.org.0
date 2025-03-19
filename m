Return-Path: <linux-arm-msm+bounces-52002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6240A69293
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 16:12:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9698616BCDA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414FB21D3F0;
	Wed, 19 Mar 2025 14:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nh4PaaNm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2A81E7C23;
	Wed, 19 Mar 2025 14:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742396164; cv=none; b=i3hwNYRT1dHJfE+JiG4MBuURpUKnT0pUsOhk3ly7hDYLKLHrLobZWjTPt03For17sYJczr6792axuXGwfZpXRw/o1sm0zgvazY6HTNiqY75T9uoZYozNgJiH1FCkL1yYLoZxMsNAQAYdvoXZ586FXlIrVw/DvqcWZDvx6/Rjfas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742396164; c=relaxed/simple;
	bh=vQqwf3PALJORJbol4A/d3nzhw883SIIeAlCpCMUqb7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YaV4QMEMxHEzPjSUsYIXNWTWxwbOFfAY82Sbz3fGK5uVPQCGAMmTZ9frYSqklaFqaonszFZZLGhSUubbLXVX0Mw1ZQXq1KVDsyHDU+bzxNbImFSuqIOWv9TT60ekCnM04UC9sqq0Hc48yiJs6vxwILMfdxLer0M5jY3IfxrKBPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nh4PaaNm; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-301c4850194so978897a91.2;
        Wed, 19 Mar 2025 07:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742396162; x=1743000962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaBXykVFASxAwzp1K2UYEY9RdYGqxushMJyfSpoqDmM=;
        b=nh4PaaNmZh8HyZ6VPTwXBK1VKLs4L+A8g8quQmbco0KTiU1hW3qCkSi4gkgJWykrKl
         OZer96vmr2y6LIKjAkaBfdH+/wxXtx8Vs0mWTW/OYdTz4dZnaH33NRB+e43gMkOR1IXc
         tpmDA3oQNA/HPlMjmw4gpR2DJZF7EpcNEepbzmzU9VurejkAP1M3pYjEuNqE1572X9TA
         DEBM5tdjD5VJtUSL8u3OA4u+sEL/KcRVbOr/iffnyuqsWn50/Jm1Oh0yraZ2m7jhxjRA
         hpht87kNqcobdnvTucqSGE8kRCRHfRrLoRJPs/iJs5SY8Qs0ttk1/J6cTmWBpKUq2+8C
         6rAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742396162; x=1743000962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaBXykVFASxAwzp1K2UYEY9RdYGqxushMJyfSpoqDmM=;
        b=YrSTmpMU3xqQUK1OPcvw+vTbMfEVKVLEw5QnFtbeNdo+TBqheSf1cctMUkfBzvq8H+
         SoayMaunY7G6Q5DkWyc7amJTMc41icohH7vro0njka0quHPH49US0A3pHqrwWww6SCpw
         PwqucesnUdJ0HdBYz+V7GX6/yMfKGyI2gXBqmqDXVs8t5x4JgqC4Zi6n7+sOGa3+iX24
         /oKbhNere+cmBWhkVT8/N6sGkoUiXqCaF0rMbnnFkvBDo+a3Kxzht/EmdsO/mS2ZQMBv
         uTX4NFJYkx2ID2nfRlgZ1clHtmnmnxjnSTUgjabHPDD1sRsKsTeZrVt4nEa9u/6RxADX
         gcAQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+TbZRVvbv+yEFaQLh9/UTbXHiOjKFa9mjrnqkKvxnSHlmsvBlxtFIHPxqkKe0nVDLA7bB3QKlnEbFy+So@vger.kernel.org, AJvYcCXMRuyhB6wkYoSKJuUsyaHGag+nhdR7+D5v1o05yW+gHyi/nnjzknLt7O//xZpwl4CuzO6BSk0cyjrNHmOU@vger.kernel.org
X-Gm-Message-State: AOJu0YwJM3AtFL7+qhFMpwPtS14Yf9Ydrm6lZRFMKJTbrHiBM/Ua2zqt
	E3zTE8ZMLt6IszTbM8kOY+2o94fo1Q4cp5X9YuQej7qKfxbsmBwO2VnYrw==
X-Gm-Gg: ASbGnct5/Bae6tWAREtmnFbfylGBvVm7eU0vq1uDZemmNO6fsnwFwLSfXRcv3s3yxYS
	T2ZXzETZZh8dTKBwy7ZdBOdqKXU9rKHRm8e6p4Z18Q87K9iOGdsP9l2TDAnoSo/KMPC3KZBBKQL
	mjLrTHUMN7C2/UyqXD9+ST1JQ+YhYfvkUm3cq2RK9GtuMlrc4fwzBT3MKMALkB+WI0FtChjMBAz
	EfOYBuJEftXl5RHATPH7dCOZXGSmejxhQDoj7lCYG+IdUvRpu7SnC+//sZWauXgd1b6Gqc0JlfF
	TcOLpmJdzAvIbKfFqDcdZKNda9khi96/2WOoSVHAQZx1RYWdB4boNo3sAV23s/9z/nffUKBPoyR
	QtfR9u+SFK53K1/hPO/Bh33GjJGTVog==
X-Google-Smtp-Source: AGHT+IFMlaSejbhUztYFhKWDKCCn4rM1IcgZmZyorwckAVgEaKWxG3BpCnnYdHXGWTzjGeXSG9hkLQ==
X-Received: by 2002:a17:90a:e710:b0:2fe:a336:fe63 with SMTP id 98e67ed59e1d1-301be201f40mr5243686a91.24.1742396161750;
        Wed, 19 Mar 2025 07:56:01 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301b9e19ceesm1903278a91.0.2025.03.19.07.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 07:56:01 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 29/34] drm/msm: Wire up drm_gpuvm debugfs
Date: Wed, 19 Mar 2025 07:52:41 -0700
Message-ID: <20250319145425.51935-30-robdclark@gmail.com>
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

Core drm already provides a helper to dump vm state.  We just need to
wire up tracking of VMs and giving userspace VMs a suitable name.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  2 +-
 drivers/gpu/drm/msm/msm_debugfs.c     | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.c         |  3 +++
 drivers/gpu/drm/msm/msm_drv.h         |  4 ++++
 drivers/gpu/drm/msm/msm_gem.h         |  8 ++++++++
 drivers/gpu/drm/msm/msm_gem_vma.c     | 23 +++++++++++++++++++++++
 6 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9f66ad5bf0dc..3189a6f75d74 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2272,7 +2272,7 @@ a6xx_create_private_vm(struct msm_gpu *gpu, bool kernel_managed)
 	if (IS_ERR(mmu))
 		return ERR_CAST(mmu);
 
-	return msm_gem_vm_create(gpu->dev, mmu, "gpu", 0x100000000ULL,
+	return msm_gem_vm_create(gpu->dev, mmu, NULL, 0x100000000ULL,
 				 adreno_private_vm_size(gpu), kernel_managed);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 7ab607252d18..bde25981254f 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -10,6 +10,7 @@
 #include <linux/fault-inject.h>
 
 #include <drm/drm_debugfs.h>
+#include <drm/drm_drv.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
@@ -238,6 +239,24 @@ static int msm_mm_show(struct seq_file *m, void *arg)
 	return 0;
 }
 
+static int msm_gpuvas_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_gem_vm *vm;
+
+	mutex_lock(&priv->vm_lock);
+	list_for_each_entry(vm, &priv->vms, node) {
+		mutex_lock(&vm->op_lock);
+		drm_debugfs_gpuva_info(m, &vm->base);
+		mutex_unlock(&vm->op_lock);
+	}
+	mutex_unlock(&priv->vm_lock);
+
+	return 0;
+}
+
 static int msm_fb_show(struct seq_file *m, void *arg)
 {
 	struct drm_info_node *node = m->private;
@@ -266,6 +285,7 @@ static int msm_fb_show(struct seq_file *m, void *arg)
 static struct drm_info_list msm_debugfs_list[] = {
 		{"gem", msm_gem_show},
 		{ "mm", msm_mm_show },
+		DRM_DEBUGFS_GPUVA_INFO(msm_gpuvas_show, NULL),
 };
 
 static struct drm_info_list msm_kms_debugfs_list[] = {
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 5b5a64c8dddb..70c3a3712a3e 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -124,6 +124,9 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 		goto err_put_dev;
 	}
 
+	INIT_LIST_HEAD(&priv->vms);
+	mutex_init(&priv->vm_lock);
+
 	INIT_LIST_HEAD(&priv->objects);
 	mutex_init(&priv->obj_lock);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index b0add236cbb3..83d2a480cfcf 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -112,6 +112,10 @@ struct msm_drm_private {
 	 */
 	atomic64_t total_mem;
 
+	/** @vms: List of all VMs, protected by @vm_lock */
+	struct list_head vms;
+	struct mutex vm_lock;
+
 	/**
 	 * List of all GEM objects (mainly for debugfs, protected by obj_lock
 	 * (acquire before per GEM object lock)
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 7f6315a66751..0409d35ebb32 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -54,6 +54,9 @@ struct msm_gem_vm {
 	/** @base: Inherit from drm_gpuvm. */
 	struct drm_gpuvm base;
 
+	/** @name: Storage for dynamically generated VM name for user VMs */
+	char name[32];
+
 	/**
 	 * @sched: Scheduler used for asynchronous VM_BIND request.
 	 *
@@ -95,6 +98,11 @@ struct msm_gem_vm {
 	 */
 	struct pid *pid;
 
+	/**
+	 * @node: List node in msm_drm_private.vms list
+	 */
+	struct list_head node;
+
 	/** @faults: the number of GPU hangs associated with this address space */
 	int faults;
 
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 09d4746248c2..8d0c4d3afa13 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -14,6 +14,11 @@ static void
 msm_gem_vm_free(struct drm_gpuvm *gpuvm)
 {
 	struct msm_gem_vm *vm = container_of(gpuvm, struct msm_gem_vm, base);
+	struct msm_drm_private *priv = gpuvm->drm->dev_private;
+
+	mutex_lock(&priv->vm_lock);
+	list_del(&vm->node);
+	mutex_unlock(&priv->vm_lock);
 
 	drm_mm_takedown(&vm->mm);
 	if (vm->mmu)
@@ -640,6 +645,7 @@ struct drm_gpuvm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 		  u64 va_start, u64 va_size, bool managed)
 {
+	struct msm_drm_private *priv = drm->dev_private;
 	enum drm_gpuvm_flags flags = managed ? DRM_GPUVM_VA_WEAK_REF : 0;
 	struct msm_gem_vm *vm;
 	struct drm_gem_object *dummy_gem;
@@ -673,6 +679,19 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 			goto err_free_dummy;
 	}
 
+	/* For userspace pgtables, generate a VM name based on comm and PID nr: */
+	if (!name) {
+		char tmpname[TASK_COMM_LEN];
+		struct pid *pid = get_pid(task_tgid(current));
+
+		get_task_comm(tmpname, current);
+		rcu_read_lock();
+		snprintf(vm->name, sizeof(name), "%s[%d]", tmpname, pid_nr(pid));
+		rcu_read_unlock();
+
+		name = vm->name;
+	}
+
 	drm_gpuvm_init(&vm->base, name, flags, drm, dummy_gem,
 		       va_start, va_size, 0, 0, &msm_gpuvm_ops);
 	drm_gem_object_put(dummy_gem);
@@ -686,6 +705,10 @@ msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,
 
 	drm_mm_init(&vm->mm, va_start, va_size);
 
+	mutex_lock(&priv->vm_lock);
+	list_add_tail(&vm->node, &priv->vms);
+	mutex_unlock(&priv->vm_lock);
+
 	return &vm->base;
 
 err_free_dummy:
-- 
2.48.1


