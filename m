Return-Path: <linux-arm-msm+bounces-85970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B07C9CD17C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:57:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ABB0A301DD5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 18:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E2F34DB42;
	Fri, 19 Dec 2025 18:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ea7Wr07/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63FE34D906
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766170007; cv=none; b=OLj6G5Gz9za694Lmbofm3nQRZyM32hdRsg/hu/8HnRc4xklYn9uUwXiGF3nY3Q4+7E2jr3Kgps0GPTvQednd5aGILU1usj2vd5KDheupLtRIyCxIhsW4CiUT1MaZOocN6s0Zm5iT1Do0IuC2eOImkPaYt/qHebIUTDmQGlvxzsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766170007; c=relaxed/simple;
	bh=GOg21jL2y98QDiaymRxZhMM8BUY3awNoFl7gB2s0rkI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q6Th1xYWLuQlvzlFRqpvlJWBklapzwQwtBfm/TOoJCo0lao9j2vMCB8cooiR9o3JD6QDlUCyoVk6CmIGMblcR6Vlyd9NoZZyLZJzqTy3K1op1kLisSxpCTOutLxb19UOyMDZ+Ycp4R3lHvIzpT/F0wtz/Mml0MNEAGCfJhLzQfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ea7Wr07/; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=dlPi72EHnCWfWKew9IQlC5HjX31ENmJ0jq0ZUE2Sbho=; b=Ea7Wr07/JtIXE/ar1d79rATZE2
	DUB8p3PxDTI59RsCPCTi+qguZhtIPdPevi25EiwnLgsfkIe1UobyL4IQHiTMpLLEzXdU1HZrK4VmQ
	IqhWFtqQ3s/znljBMxJq3dYE7rs12sdK26J75ld8Yol/3EQeLvJ11aDdyCK0gP2D0ZNLbZyi6Ll4/
	7ZzfgJIepbFu056UDrRmo0YSac2MUOgJyCyxhHT4fgJiFZnfDRnxSZ7P4cdCwzSBsPaYDaMh2cKTc
	FDggCoHaY2lp2va3/9KLnbDuSb+oDZ5m9BUAFSiVAiGJ5gv+AOe9F7FgoqbhDx8iLDe8B5WkN8Ha0
	7LkYNUfw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWfUz-0000000AqkV-2IH5;
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
Subject: [PATCH 16/19] drm/msm: msm_fence.h: fix all kernel-doc warnings
Date: Fri, 19 Dec 2025 10:46:35 -0800
Message-ID: <20251219184638.1813181-17-rdunlap@infradead.org>
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

Warning: drivers/gpu/drm/msm/msm_fence.h:27 Incorrect use of kernel-doc
 format: * last_fence:
Warning: drivers/gpu/drm/msm/msm_fence.h:36 Incorrect use of kernel-doc
 format: * completed_fence:
Warning: drivers/gpu/drm/msm/msm_fence.h:44 Incorrect use of kernel-doc
 format: * fenceptr:
Warning: drivers/gpu/drm/msm/msm_fence.h:65 Incorrect use of kernel-doc
 format: * next_deadline_fence:
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'dev' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'name' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'context' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'index' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'fence' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'there is no
 remaining pending work */ uint32_t last_fence' not described in
 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'updated from the CPU after interrupt * from GPU */ uint32_t completed_fence' not described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'fenceptr' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'spinlock' not
 described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'next_deadline'
 not described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member
 'next_deadline_fence' not described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'deadline_timer'
 not described in 'msm_fence_context'
Warning: drivers/gpu/drm/msm/msm_fence.h:74 struct member 'deadline_work'
 not described in 'msm_fence_context'

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
 drivers/gpu/drm/msm/msm_fence.h |   36 +++++++++++++++---------------
 1 file changed, 19 insertions(+), 17 deletions(-)

--- linux-next-20251217.orig/drivers/gpu/drm/msm/msm_fence.h
+++ linux-next-20251217/drivers/gpu/drm/msm/msm_fence.h
@@ -16,34 +16,29 @@
  * incrementing fence seqno at the end of each submit
  */
 struct msm_fence_context {
+	/** @dev: the drm device */
 	struct drm_device *dev;
-	/** name: human readable name for fence timeline */
+	/** @name: human readable name for fence timeline */
 	char name[32];
-	/** context: see dma_fence_context_alloc() */
+	/** @context: see dma_fence_context_alloc() */
 	unsigned context;
-	/** index: similar to context, but local to msm_fence_context's */
+	/** @index: similar to context, but local to msm_fence_context's */
 	unsigned index;
-
 	/**
-	 * last_fence:
-	 *
+	 * @last_fence:
 	 * Last assigned fence, incremented each time a fence is created
 	 * on this fence context.  If last_fence == completed_fence,
 	 * there is no remaining pending work
 	 */
 	uint32_t last_fence;
-
 	/**
-	 * completed_fence:
-	 *
+	 * @completed_fence:
 	 * The last completed fence, updated from the CPU after interrupt
 	 * from GPU
 	 */
 	uint32_t completed_fence;
-
 	/**
-	 * fenceptr:
-	 *
+	 * @fenceptr:
 	 * The address that the GPU directly writes with completed fence
 	 * seqno.  This can be ahead of completed_fence.  We can peek at
 	 * this to see if a fence has already signaled but the CPU hasn't
@@ -51,6 +46,9 @@ struct msm_fence_context {
 	 */
 	volatile uint32_t *fenceptr;
 
+	/**
+	 * @spinlock: fence context spinlock
+	 */
 	spinlock_t spinlock;
 
 	/*
@@ -59,18 +57,22 @@ struct msm_fence_context {
 	 * don't queue, so maybe that is ok
 	 */
 
-	/** next_deadline: Time of next deadline */
+	/** @next_deadline: Time of next deadline */
 	ktime_t next_deadline;
-
 	/**
-	 * next_deadline_fence:
-	 *
+	 * @next_deadline_fence:
 	 * Fence value for next pending deadline.  The deadline timer is
 	 * canceled when this fence is signaled.
 	 */
 	uint32_t next_deadline_fence;
-
+	/**
+	 * @deadline_timer: tracks nearest deadline of a fence timeline and
+	 * expires just before it.
+	 */
 	struct hrtimer deadline_timer;
+	/**
+	 * @deadline_work: work to do after deadline_timer expires
+	 */
 	struct kthread_work deadline_work;
 };
 

