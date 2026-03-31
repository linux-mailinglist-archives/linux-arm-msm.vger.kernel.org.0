Return-Path: <linux-arm-msm+bounces-101005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEPmFVOSy2nMJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:22:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DF116366F86
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0E16303121E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:21:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF323ED11B;
	Tue, 31 Mar 2026 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pq25LcCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55663ED5DB
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948874; cv=none; b=Il7xsW1NqkzlTBk5YBBzkAYhz6udJxlru9G6/hVSTVNfzNFTCM10qqrVQ5kaK/8aLVQhxUmg4E0357QZzfKIK1KGlyFn5XswNlweRrsXDIrHoOMUfTn6aGbcPALVVaYFQWDg2rQOUOUJvSi0DG/Q/o6bAZKjwxFhts+eBGlC8N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948874; c=relaxed/simple;
	bh=DgyLq6zooOm9qWMAzGTPUEMvJ8LaOuxTIta6t6Kp+/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qViY55L3TBqvZjxIeB7E6zebFpx43udSissOvIPxRBpy6SwAlXbeN3n/EaetS1xv3MXJn5qrhWu9RImZI7sI3vPZpMZMVAzOibO2q4ZzS0B7sREjGpi5T7YzXSv0sFBC3ZL3264AQ6gwDskn+j0DZIH3OGskwWDYe6Kpt7y3uTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pq25LcCe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774948871; x=1806484871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DgyLq6zooOm9qWMAzGTPUEMvJ8LaOuxTIta6t6Kp+/k=;
  b=Pq25LcCex6RIG6lpsK0c9q1xaue0Wehn+f+RAtXwiFCxUjn7n9emIo8b
   8ECgSfIixb4GjWakLGhg/V8Y7EQsUd1KGvCTe/9E8x8f+M3meB5cGzCGg
   3qamX7Jl5svz19SlWnyN4OFi/gbIcMt3PwLiAb5yTZad4jALAlTw/HKsD
   UFCdorAH5a1vG3CXWC3TRFjjcc52SFqD7m4pqkcrHSWJcjK9j0ynqVhvN
   nTVoDGj7ge2bAGvnC5BPS9RoPd6FRBL/jadIfjjNn4FkF3IovKDCSSjWu
   0BpONFraiUOijZ5J3L5gvJECX7b1g2EbPkwE5Z8XMqqRwKsp9Hl5OnodK
   w==;
X-CSE-ConnectionGUID: 9O+MspkVRy2Lp33pNIUYFQ==
X-CSE-MsgGUID: Zmb1jl+FTp6ShYFT2LcoZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="74988575"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="74988575"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:21:11 -0700
X-CSE-ConnectionGUID: bPben4aYRJiZ3+GIj+CnLw==
X-CSE-MsgGUID: RncjKU8sSmCg4jSOkIdh0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226288677"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora) ([10.245.244.28])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:21:07 -0700
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
Subject: [PATCH 4/5] drm/exec, drm/xe: Avoid abusing the drm_exec retry pointer
Date: Tue, 31 Mar 2026 11:20:22 +0200
Message-ID: <20260331092023.81616-5-thomas.hellstrom@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101005-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,linux.intel.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DF116366F86
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The xe driver was using the drm_exec retry pointer directly to
restart the locking loop after out-of-memory errors. This is
relying on documented behaviour.

Instead add a drm_exec_retry() macro that can be used in this
situation, and that also asserts that the struct drm_exec is
in a state that is compatible with retrying:
Either newly initialized or in a contended state with all locks
dropped.

Use that macro in xe.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/xe/xe_validation.h |  2 +-
 include/drm/drm_exec.h             | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_validation.h b/drivers/gpu/drm/xe/xe_validation.h
index a30e732c4d51..4cd955ce6cd2 100644
--- a/drivers/gpu/drm/xe/xe_validation.h
+++ b/drivers/gpu/drm/xe/xe_validation.h
@@ -146,7 +146,7 @@ bool xe_validation_should_retry(struct xe_validation_ctx *ctx, int *ret);
 #define xe_validation_retry_on_oom(_ctx, _ret)				\
 	do {								\
 		if (xe_validation_should_retry(_ctx, _ret))		\
-			goto *__drm_exec_retry_ptr;			\
+			drm_exec_retry((_ctx)->exec);			\
 	} while (0)
 
 /**
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index fc95a979e253..5ed5be1f8244 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -138,6 +138,19 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
 	return !!exec->contended;
 }
 
+/**
+ * drm_exec_retry() - Unconditionally restart the loop to grab all locks.
+ * @exec: drm_exec object
+ *
+ * Unconditionally retry the loop to lock all objects. For consistency,
+ * the exec object needs to be newly initialized or contended.
+ */
+#define drm_exec_retry(_exec)				\
+	do {						\
+		WARN_ON(!drm_exec_is_contended(_exec)); \
+		goto *__drm_exec_retry_ptr;		\
+	} while (0)
+
 void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr);
 void drm_exec_fini(struct drm_exec *exec);
 bool drm_exec_cleanup(struct drm_exec *exec);
-- 
2.53.0


