Return-Path: <linux-arm-msm+bounces-101004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILPwLDmTy2nMJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:26:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D99536709C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:26:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 531E73026149
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CD93ED120;
	Tue, 31 Mar 2026 09:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EJrbSYO6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9EA3ED104
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948868; cv=none; b=gFjoT6WmC2OJYluUC9ce8p7kw5Dq47po1IIOBox9bdLTlBc5UMmLgacwJGbkeoVVcdJSQlbKJ91umOWVck7otPnzi+aKD4iJsNXaO6ZRMdsapz/5cuwIxAbQA+VpEB+fPl5bLJ0crBCAUNiL+jIN0lOOILGFR+xvR2vbCJIsXZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948868; c=relaxed/simple;
	bh=2rKU7pNuJHeLNYA2RtmGZ0yZNNZYnG3H+Xgt++Wqb44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aESGp4OCgZ/sFCmz/gej04PmF7V72bkYtkKqVftsj4GDo7uIC6clJEGl1iIwTcp7V9gainNE4fC8F7E2csNqb55XUoOQB1aQOnePZ5zuWeYCIcwaJBsHX0YEG4k6Y3iW22Y0JKPP0LSi4YrhVl/SRRvwmBrIKs/H6qncfQMVWrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EJrbSYO6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774948866; x=1806484866;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2rKU7pNuJHeLNYA2RtmGZ0yZNNZYnG3H+Xgt++Wqb44=;
  b=EJrbSYO6vb6/N7zbMAORI8UT6zq3aqS4IU1fDQjl02bh1HEdG8w5FwQG
   cYH8q1o4B+d/PqxORTxqBlYzJsisS+NDRqfwlKlCHo7jF/gs3wgEPg2dB
   bMOxS9wudRsyzd4ZtNTcU3m9QmUZdXcwFEYT+3rTHfyslmZGHLPy70Xqh
   +ogRnROQPQYG0cuLoD/Nr0u/QATg0384c1Cg6lmCLDW5w11CeV4UiwgWq
   Xc6eZ0s0jZvFNLB4qGSaV/onZeEDXGp7WAkFOdvWJwdO4IlLZ4EwM6dad
   JT0v8XE35uBk7SUT4YavJfENRu/k+F9XqwSynxmPNqE+3EAVcT+QcxK/F
   Q==;
X-CSE-ConnectionGUID: LO54ppKQSpSOAE6VIE0frg==
X-CSE-MsgGUID: OlNyU5b6R4iZzqJE5i2NrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="74988551"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="74988551"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:21:06 -0700
X-CSE-ConnectionGUID: 4ye3jDkNRXuzUW7kqENdkA==
X-CSE-MsgGUID: T0FqTeu8Qj+1bT4lWUxjmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226288652"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora) ([10.245.244.28])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:21:01 -0700
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
Subject: [PATCH 3/5] drm/exec: Make the drm_exec_until_all_locked() macro more readable
Date: Tue, 31 Mar 2026 11:20:21 +0200
Message-ID: <20260331092023.81616-4-thomas.hellstrom@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101004-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 4D99536709C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use __UNIQUE_ID as done elsewhere in the kernel rather than a
hand-rolled __PASTE to craft a unique id.

Also use __maybe_unused rather than (void) to signify that a
variable, althrough written to, may not actually be used.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/drm/drm_exec.h | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index 25db52dd2af0..fc95a979e253 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -89,6 +89,19 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
 	for (unsigned long _index = (exec)->num_objects - 1;				\
 	     ((obj) = drm_exec_obj(exec, _index)); --_index)
 
+/*
+ * Helper to drm_exec_until_all_locked(). Don't use directly.
+ *
+ * Since labels can't be defined local to the loop's body we use a jump pointer
+ * to make sure that the retry is only used from within the loop's body.
+ */
+#define __drm_exec_until_all_locked(exec, _label)			\
+_label:									\
+	for (void * __maybe_unused __drm_exec_retry_ptr; ({		\
+		__drm_exec_retry_ptr = &&_label;			\
+		drm_exec_cleanup(exec);					\
+	});)
+
 /**
  * drm_exec_until_all_locked - loop until all GEM objects are locked
  * @exec: drm_exec object
@@ -96,17 +109,9 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
  * Core functionality of the drm_exec object. Loops until all GEM objects are
  * locked and no more contention exists. At the beginning of the loop it is
  * guaranteed that no GEM object is locked.
- *
- * Since labels can't be defined local to the loops body we use a jump pointer
- * to make sure that the retry is only used from within the loops body.
  */
 #define drm_exec_until_all_locked(exec)					\
-__PASTE(__drm_exec_, __LINE__):						\
-	for (void *__drm_exec_retry_ptr; ({				\
-		__drm_exec_retry_ptr = &&__PASTE(__drm_exec_, __LINE__);\
-		(void)__drm_exec_retry_ptr;				\
-		drm_exec_cleanup(exec);					\
-	});)
+	__drm_exec_until_all_locked(exec, __UNIQUE_ID(drm_exec))
 
 /**
  * drm_exec_retry_on_contention - restart the loop to grap all locks
-- 
2.53.0


