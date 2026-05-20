Return-Path: <linux-arm-msm+bounces-108692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH7CKFuLDWpKywUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:22:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD2058BA8A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3FD9C3059102
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F633A4F32;
	Wed, 20 May 2026 10:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJOIRG8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B11D3D75A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272256; cv=none; b=UY1QMOnugEgqjMK8NXFneUQbSqyyNFz0GuPBKA6/7XSVcEeMtC6ssLvZSodAALMND7mtL45U8wsfdeykyw8dM4z2puZvzt4OCA04Jsuen16rexLUB9RKttUBs4+oboD3O6fPab20KEcjBUBiK2+NnCeH0gLwBqKGVox0nrQY7U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272256; c=relaxed/simple;
	bh=eOlOBfiJj7Bv4YUhSkUqIibhF6y3L5ddhXYlMCE6R8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BWHEGaqGFE1p5fCEUlD/ERfMvWVn84vG0Yt1pBwtNjHDr/M5YwIWIalPNw0UQAGrvJNwL9VGflnRalhwZqwkvzmz9TDUICFuX/W4SK1F9fHbgekx/U/Y109qPHA2A59/6TLQbf6TL7NR4wOKZ7IAVSHFq+Z5NDR7MX1radfXzSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJOIRG8W; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779272252; x=1810808252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eOlOBfiJj7Bv4YUhSkUqIibhF6y3L5ddhXYlMCE6R8o=;
  b=bJOIRG8WzNO3cRYvlbNdteikVPajoVrLDBPkeSuj1YrpVmxNrLv6z+QM
   4bFS62mcfpUrL2I3357u77ad3vCU8QNeBp0Ydo/a2luv4/LJuAK/8/KgD
   gHUuRkSFaz9lvWkGn2owzo9JbkCLKTOSoUt+oRanCSRbnjNdED+etQj6j
   ydK2gYjUL2anzFboaIaC2I3awXhTLScPQ1QeKaEdYkwWhyrFUdmd+dHjw
   tHbnQ+dRqQG6kYXNI6Alo63d5MSR1kswWgfZ0JvmbVA7G01AXdTXAuNPU
   JQdLOxUWggK5zcchkX+Hb2ubDp3V97LfiNqrTmhpK9S5nK7BoJ0E8OlIY
   Q==;
X-CSE-ConnectionGUID: 71B0qh3oSz2+gkC+Ygh+oQ==
X-CSE-MsgGUID: 53LPiy+wRZWzG4Zw+qRAoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102843316"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="102843316"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:17:31 -0700
X-CSE-ConnectionGUID: c+w11R1bT82yxF92bdIqGQ==
X-CSE-MsgGUID: suprNGISQamG4TXx5V+Cyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="244114163"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.245.175])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:17:27 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 4/4] drm/exec, drm/xe, drm/amdgpu: Add an accessor for struct drm_exec::ticket
Date: Wed, 20 May 2026 12:16:16 +0200
Message-ID: <20260520101616.41284-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520101616.41284-1-thomas.hellstrom@linux.intel.com>
References: <20260520101616.41284-1-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108692-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,amd.com,gmail.com,ffwll.ch,kernel.org,suse.de,intel.com,google.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.hellstrom@linux.intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 3AD2058BA8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Drivers were accessing this drm_exec member directly.
While that may seem harmless, it will require action if
the drm_exec utility is made a subclass of a dma-resv transaction
utility as outlined in the cover-letter.

Provide an accessor, drm_exec_ticket() to avoid that.

v2:
- Fix amdgpu compile error (Intel CI)
- Update the commit message.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c           |  6 +++---
 drivers/gpu/drm/xe/xe_validation.c               |  4 ++--
 include/drm/drm_exec.h                           | 11 +++++++++++
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 72a5a29e63f6..d54794e5b18b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2999,7 +2999,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence __rcu *
 	/* Validate PDs, PTs and evicted DMABuf imports last. Otherwise BO
 	 * validations above would invalidate DMABuf imports again.
 	 */
-	ret = process_validate_vms(process_info, &exec.ticket);
+	ret = process_validate_vms(process_info, drm_exec_ticket(&exec));
 	if (ret) {
 		pr_debug("Validating VMs failed, ret: %d\n", ret);
 		goto validate_map_fail;
@@ -3040,7 +3040,7 @@ int amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct dma_fence __rcu *
 			goto validate_map_fail;
 		}
 
-		ret = amdgpu_vm_handle_moved(adev, peer_vm, &exec.ticket);
+		ret = amdgpu_vm_handle_moved(adev, peer_vm, drm_exec_ticket(&exec));
 		if (ret) {
 			dev_dbg(adev->dev,
 				"Memory eviction: handle moved failed, pid %8d. Try again.\n",
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 97a851ae7bd8..6ada57abce9d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -1157,7 +1157,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 			return r;
 	}
 
-	r = amdgpu_vm_handle_moved(adev, vm, &p->exec.ticket);
+	r = amdgpu_vm_handle_moved(adev, vm, drm_exec_ticket(&p->exec));
 	if (r)
 		return r;
 
@@ -1359,7 +1359,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	cs->out.handle = seq;
 	leader->uf_sequence = seq;
 
-	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->exec.ticket);
+	amdgpu_vm_bo_trace_cs(&fpriv->vm, drm_exec_ticket(&p->exec));
 	for (i = 0; i < p->gang_size; ++i) {
 		amdgpu_job_free_resources(p->jobs[i]);
 		trace_amdgpu_cs_ioctl(p->jobs[i]);
@@ -1794,7 +1794,7 @@ int amdgpu_cs_find_mapping(struct amdgpu_cs_parser *parser,
 	*map = mapping;
 
 	/* Double check that the BO is reserved by this CS */
-	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != &parser->exec.ticket)
+	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) != drm_exec_ticket(&parser->exec))
 		return -EINVAL;
 
 	/* Make sure VRAM is allocated contigiously */
diff --git a/drivers/gpu/drm/xe/xe_validation.c b/drivers/gpu/drm/xe/xe_validation.c
index a611438eaafe..8dff4d0ec895 100644
--- a/drivers/gpu/drm/xe/xe_validation.c
+++ b/drivers/gpu/drm/xe/xe_validation.c
@@ -156,7 +156,7 @@ int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_d
 
 #ifdef CONFIG_DEBUG_WW_MUTEX_SLOWPATH
 /*
- * This abuses both drm_exec and ww_mutex internals and should be
+ * This abuses ww_mutex internals and should be
  * replaced by checking for -EDEADLK when we can make TTM
  * stop converting -EDEADLK to -ENOMEM.
  * An alternative is to not have exhaustive eviction with
@@ -164,7 +164,7 @@ int xe_validation_ctx_init(struct xe_validation_ctx *ctx, struct xe_validation_d
  */
 static bool xe_validation_contention_injected(struct drm_exec *exec)
 {
-	return !!exec->ticket.contending_lock;
+	return !!drm_exec_ticket(exec)->contending_lock;
 }
 
 #else
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index 99c7e1bb3c5b..8725ba92ff91 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -161,6 +161,17 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
 		goto *__drm_exec_retry_ptr;			\
 	} while (0)
 
+/**
+ * drm_exec_ticket - return the ww_acquire_ctx for this exec context
+ * @exec: drm_exec object
+ *
+ * Return: Pointer to the ww_acquire_ctx embedded in @exec.
+ */
+static inline struct ww_acquire_ctx *drm_exec_ticket(struct drm_exec *exec)
+{
+	return &exec->ticket;
+}
+
 void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr);
 void drm_exec_fini(struct drm_exec *exec);
 bool drm_exec_cleanup(struct drm_exec *exec);
-- 
2.54.0


