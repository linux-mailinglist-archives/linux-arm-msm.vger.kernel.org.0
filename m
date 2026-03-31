Return-Path: <linux-arm-msm+bounces-101002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BJbMCaTy2nMJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:25:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6CB36707D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4A478308FCFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236CB3EC2C7;
	Tue, 31 Mar 2026 09:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWisaI//"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA7C3EC2F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948857; cv=none; b=Nwo3vy5CtnLHSZY/pQfhq6MfEd8ub/ePte+Gz6crKy2OWoOLXe/5dz8ezF8ViQEto4E2mMrnafHgtNSVnhWUtLTvhxmyEp4YOwrW7zyk27Vp/AglztVYstQkfa9z4t4VpASTjisc/mbEIl/JAVkmB7Kmo41wGtyWIIssGaOFjUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948857; c=relaxed/simple;
	bh=yqvXYCVd2a3mvBwa2g/AXyyIpIk8WGS8bYdh33g8R04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LVeP2RRkJvBS3ZPNY4rdTUEVN3bM9iO0S08uqisE8vEWm9jXPSfv90qCOMesxdNqjgURm6f5alXA/MqFijpEUhhx7pFI8qnph0K7o4AKYzDc9+ctc8HOaR7Uz0iAEbSXJBgYmoSp11ZkuLjDBZxMo0b234ccBkhj2FWFinCugm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWisaI//; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774948855; x=1806484855;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yqvXYCVd2a3mvBwa2g/AXyyIpIk8WGS8bYdh33g8R04=;
  b=JWisaI//UcKM1wAsYTZbKYsT3NOzJlVeUMGBwZub0AnhYYv3nBbtHXfo
   tGsgmOeF+KhJ95jLY4pgpIgCJ8OiMqqOX7cViXHLt+c8f5aRbGx2xbjSM
   v1Lj7oIZi/zlCVMvr0TTWKvWyh2drs20TzrZpbIlXTicgunDBkf1FCrm4
   sfEoerH2fdfnM4OUQ0bgUFjto6EFtIYjO4IjTSglFuHbeyn8zT3HQSpc2
   Nj1BZDRlrxcKZKHxgE0UON4nyGKLMizRPad57hy9SNiPp1RHTMPQ09qdH
   70RtL5MKIzNKOW1jhxlYCFC6K0DGe5IrAoIQ9sVaILIw0U3rWOHdgd7lD
   g==;
X-CSE-ConnectionGUID: 7R8nfrSfS2Ojx3iqqsdCeA==
X-CSE-MsgGUID: j4zsDJYFT/qhsIrOAX3WkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="74988504"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="74988504"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:20:55 -0700
X-CSE-ConnectionGUID: hjUjZQbaSSKER/7hSfVhww==
X-CSE-MsgGUID: 9ZL/09voT5CAA7U6GfgU8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226288510"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora) ([10.245.244.28])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:20:50 -0700
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
Subject: [PATCH 1/5] drm/exec: Remove the index parameter from drm_exec_for_each_locked_obj[_reverse]
Date: Tue, 31 Mar 2026 11:20:19 +0200
Message-ID: <20260331092023.81616-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com>
References: <20260331092023.81616-1-thomas.hellstrom@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101002-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 2B6CB36707D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Nobody makes any use of it. Possible internal future users can
instead use the _index variable. External users shouldn't use
it since the array it's pointing into is internal drm_exec state.

Assisted-by: GitHub Copilot:claude-sonnet-4.6
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c             |  9 +++------
 drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c |  3 +--
 drivers/gpu/drm/drm_exec.c                         |  6 ++----
 drivers/gpu/drm/drm_gpuvm.c                        |  3 +--
 drivers/gpu/drm/xe/xe_vm.c                         |  3 +--
 include/drm/drm_exec.h                             | 14 ++++++--------
 6 files changed, 14 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index c048217615c1..c4ee19603460 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -850,7 +850,6 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 	struct amdgpu_vm *vm = &fpriv->vm;
 	struct amdgpu_bo_list_entry *e;
 	struct drm_gem_object *obj;
-	unsigned long index;
 	unsigned int i;
 	int r;
 
@@ -962,7 +961,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
 		goto out_free_user_pages;
 	}
 
-	drm_exec_for_each_locked_object(&p->exec, index, obj) {
+	drm_exec_for_each_locked_object(&p->exec, obj) {
 		r = amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
 		if (unlikely(r))
 			goto out_free_user_pages;
@@ -1201,7 +1200,6 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 	struct drm_gpu_scheduler *sched;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
-	unsigned long index;
 	unsigned int i;
 	int r;
 
@@ -1212,7 +1210,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
 		return r;
 	}
 
-	drm_exec_for_each_locked_object(&p->exec, index, obj) {
+	drm_exec_for_each_locked_object(&p->exec, obj) {
 		struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
 
 		struct dma_resv *resv = bo->tbo.base.resv;
@@ -1280,7 +1278,6 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	struct amdgpu_job *leader = p->gang_leader;
 	struct amdgpu_bo_list_entry *e;
 	struct drm_gem_object *gobj;
-	unsigned long index;
 	unsigned int i;
 	uint64_t seq;
 	int r;
@@ -1330,7 +1327,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
 	}
 
 	p->fence = dma_fence_get(&leader->base.s_fence->finished);
-	drm_exec_for_each_locked_object(&p->exec, index, gobj) {
+	drm_exec_for_each_locked_object(&p->exec, gobj) {
 
 		ttm_bo_move_to_lru_tail_unlocked(&gem_to_amdgpu_bo(gobj)->tbo);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
index 4c5e38dea4c2..f6b7522c3c82 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_eviction_fence.c
@@ -121,7 +121,6 @@ int amdgpu_evf_mgr_rearm(struct amdgpu_eviction_fence_mgr *evf_mgr,
 {
 	struct amdgpu_eviction_fence *ev_fence;
 	struct drm_gem_object *obj;
-	unsigned long index;
 
 	/* Create and initialize a new eviction fence */
 	ev_fence = kzalloc_obj(*ev_fence);
@@ -140,7 +139,7 @@ int amdgpu_evf_mgr_rearm(struct amdgpu_eviction_fence_mgr *evf_mgr,
 	evf_mgr->ev_fence = &ev_fence->base;
 
 	/* And add it to all existing BOs */
-	drm_exec_for_each_locked_object(exec, index, obj) {
+	drm_exec_for_each_locked_object(exec, obj) {
 		struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
 
 		amdgpu_evf_mgr_attach_fence(evf_mgr, bo);
diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 8d0601400182..746210f3f6c2 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -24,7 +24,6 @@
  *
  *	struct drm_gem_object *obj;
  *	struct drm_exec exec;
- *	unsigned long index;
  *	int ret;
  *
  *	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
@@ -40,7 +39,7 @@
  *			goto error;
  *	}
  *
- *	drm_exec_for_each_locked_object(&exec, index, obj) {
+ *	drm_exec_for_each_locked_object(&exec, obj) {
  *		dma_resv_add_fence(obj->resv, fence, DMA_RESV_USAGE_READ);
  *		...
  *	}
@@ -56,9 +55,8 @@
 static void drm_exec_unlock_all(struct drm_exec *exec)
 {
 	struct drm_gem_object *obj;
-	unsigned long index;
 
-	drm_exec_for_each_locked_object_reverse(exec, index, obj) {
+	drm_exec_for_each_locked_object_reverse(exec, obj) {
 		dma_resv_unlock(obj->resv);
 		drm_gem_object_put(obj);
 	}
diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 44acfe4120d2..2e44671e05b1 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1550,9 +1550,8 @@ drm_gpuvm_resv_add_fence(struct drm_gpuvm *gpuvm,
 			 enum dma_resv_usage extobj_usage)
 {
 	struct drm_gem_object *obj;
-	unsigned long index;
 
-	drm_exec_for_each_locked_object(exec, index, obj) {
+	drm_exec_for_each_locked_object(exec, obj) {
 		dma_resv_assert_held(obj->resv);
 		dma_resv_add_fence(obj->resv, fence,
 				   drm_gpuvm_is_extobj(gpuvm, obj) ?
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 56e2db50bb36..30efd6721da1 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -373,7 +373,6 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
 			  unsigned int num_fences)
 {
 	struct drm_gem_object *obj;
-	unsigned long index;
 	int ret;
 
 	do {
@@ -386,7 +385,7 @@ int xe_vm_validate_rebind(struct xe_vm *vm, struct drm_exec *exec,
 			return ret;
 	} while (!list_empty(&vm->gpuvm.evict.list));
 
-	drm_exec_for_each_locked_object(exec, index, obj) {
+	drm_exec_for_each_locked_object(exec, obj) {
 		ret = dma_resv_reserve_fences(obj->resv, num_fences);
 		if (ret)
 			return ret;
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index aa786b828a0a..25db52dd2af0 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -68,28 +68,26 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
 /**
  * drm_exec_for_each_locked_object - iterate over all the locked objects
  * @exec: drm_exec object
- * @index: unsigned long index for the iteration
  * @obj: the current GEM object
  *
  * Iterate over all the locked GEM objects inside the drm_exec object.
  */
-#define drm_exec_for_each_locked_object(exec, index, obj)		\
-	for ((index) = 0; ((obj) = drm_exec_obj(exec, index)); ++(index))
+#define drm_exec_for_each_locked_object(exec, obj)		\
+	for (unsigned long _index = 0; ((obj) = drm_exec_obj(exec, _index)); ++_index)
 
 /**
  * drm_exec_for_each_locked_object_reverse - iterate over all the locked
  * objects in reverse locking order
  * @exec: drm_exec object
- * @index: unsigned long index for the iteration
  * @obj: the current GEM object
  *
  * Iterate over all the locked GEM objects inside the drm_exec object in
- * reverse locking order. Note that @index may go below zero and wrap,
+ * reverse locking order. Note that the internal index may wrap around,
  * but that will be caught by drm_exec_obj(), returning a NULL object.
  */
-#define drm_exec_for_each_locked_object_reverse(exec, index, obj)	\
-	for ((index) = (exec)->num_objects - 1;				\
-	     ((obj) = drm_exec_obj(exec, index)); --(index))
+#define drm_exec_for_each_locked_object_reverse(exec, obj)	\
+	for (unsigned long _index = (exec)->num_objects - 1;				\
+	     ((obj) = drm_exec_obj(exec, _index)); --_index)
 
 /**
  * drm_exec_until_all_locked - loop until all GEM objects are locked
-- 
2.53.0


