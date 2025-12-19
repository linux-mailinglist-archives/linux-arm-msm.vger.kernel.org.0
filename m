Return-Path: <linux-arm-msm+bounces-85973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6278CD1806
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C50573070783
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7454834DB4D;
	Fri, 19 Dec 2025 18:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LYZdEKuH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB0F34D910
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 18:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170008; cv=none; b=ZfrOFTHkYsn+7hXX/rPr7N9Nyl6bnDb73k4vaXSrxtqCZlkRjxT+muaRH5xYjNvGSfiCTm13uixExnXE0XX2k75exYGQhB+uK2n+QSdZufnRclBiZpi3RcJ0sa79u/STGet9QynHEQvu/k85I6V+WiLM+Y/lE1MfuYjlRceFBCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170008; c=relaxed/simple;
	bh=jyqzu3m9JsqzB9VQ3cwygy6vUPPiI8sexzM8gblhMmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dhmw/NrWDzEoLEM1D1XZeGCUvBQn1ZcnN6nRXV6dpClRilxSNMo5Thr0ncTOY0BDMLPA+V1Uyh6wxCRU5hXYmGUs5Tz8hBWjrufumLJutRrtkQRlzH6LKDjNYeZhHWJoqtf2IC7B31tpB/XTQbADYMzxe0Lu9pnkSxWHQMEOdK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LYZdEKuH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=iKK/Xofdd7Z8vAQtV8vVEIm8tmIup9pUtLviIA6bM3Y=; b=LYZdEKuHxtWVxSOIb5Bqtw6aHP
	sr70hP1eAiXuio+GcnKVLYEPqMv9dmZ8UNZjCrpRl3ybYs5/gyenCKyEfFkFB0v02PtT0czIyqib1
	3z6Q8IiehJeL5QUlCQYvk0tn+p4udnBZAnjHthTwMyUdTJGlyeXbWrHAappVZNt+8mycjH4t/89VW
	VJeALribRsdpb6/yWWa8yWBMcdnOIoaQnj3WDm/d1lWnYTu0L5f3v0geTc+tuwSozVXQqy144Ae2k
	Z5jPnpXQAX7/cGyaBb1iKJqgbdrJbbWfJ3AhtwMdzYhJXuYmp4/j79raX0tu+ca61VBOCHDtZiWlU
	NpMcns/Q==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfUz-0000000AqkV-3asl;
	Fri, 19 Dec 2025 18:46:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 17/19] drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:36 -0800
Message-ID: <20251219184638.1813181-18-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219184638.1813181-1-rdunlap@infradead.org>
References: <20251219184638.1813181-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct or add kernel-doc comments to eliminate all warnings:

Warning: ../drivers/gpu/drm/msm/msm_gem_vma.c:96 expecting prototype for
 struct msm_vma_op. Prototype was for struct msm_vm_op instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/msm/msm_gem_vma.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- linux-next-20251217.orig/drivers/gpu/drm/msm/msm_gem_vma.c
+++ linux-next-20251217/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -65,7 +65,7 @@ struct msm_vm_unmap_op {
 };
 
 /**
- * struct msm_vma_op - A MAP or UNMAP operation
+ * struct msm_vm_op - A MAP or UNMAP operation
  */
 struct msm_vm_op {
 	/** @op: The operation type */
@@ -798,6 +798,9 @@ static const struct drm_sched_backend_op
  * synchronous operations are supported.  In a user managed VM, userspace
  * handles virtual address allocation, and both async and sync operations
  * are supported.
+ *
+ * Returns: pointer to the created &struct drm_gpuvm on success
+ * or an ERR_PTR(-errno) on failure.
  */
 struct drm_gpuvm *
 msm_gem_vm_create(struct drm_device *drm, struct msm_mmu *mmu, const char *name,

