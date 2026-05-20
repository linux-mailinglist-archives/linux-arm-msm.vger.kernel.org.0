Return-Path: <linux-arm-msm+bounces-108691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNZQHW2LDWpKywUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:22:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 698A058BAAD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BE893054881
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD103D75AA;
	Wed, 20 May 2026 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEOzUTDE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E7F3D649B
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272250; cv=none; b=KJjMAk+rpp6KOKpVjpKKvYmjG3VMt26TbJMK7xCX9KXZn+giixQ9GwV2FJJvhpeIRVG8v+Gvrj3JUH+s1TmIjOP10F0705IT9XV1WgjOxtEqpdHh7CvnehhGUQX9f0Ko4dAbSUitJxnH/e8Wh+E+hN0+K2tY/64hc5fwhNvXKz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272250; c=relaxed/simple;
	bh=7GOI7TU6+aMlsbqiB2OTjv7RLHlkrx7pg0DKAoEBQbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WC3qoNdUXzFZcMbHZJFq59U47Wr2eAq22OZh9KoRpqu26/c1f+gsxTzs61EPzchR+kF+b/fopZkM8qAIpbMe2Sks0bfMRVNG9UMeAdRAOk3hzOhD/LdwXBB9fgH8E+fMwtoVMYPG2ulFwCvNuflt0Msd+y1exrEJAngWFizXVwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEOzUTDE; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779272247; x=1810808247;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7GOI7TU6+aMlsbqiB2OTjv7RLHlkrx7pg0DKAoEBQbo=;
  b=lEOzUTDEf0RBQJ/AH6/DU9TfGLhAhDH+K/8LF5t/JVxvrm4cED9tPKMy
   l4V+EpOU9JR76595F5c0YBeLREG7uU7Kj5QvpJ54gDPAASKCJ4HxaACr1
   Eizgce5ASk/0lOYuDja29JFRiYV8tXelWSBD2rKl7JFm9zN4b+2Rfy3WW
   IXons5MaV55esY76fPNNt+vu5HoPOzSkTOqI8E3ARGsqyHoHHQjKFdhKD
   br8/BZ+wSGehqu4cgSBV5HEE8JlpzL+un0RVsKautRT5NihDHCwO+4t5J
   Iw5NbUUOIKpb3OkBXKsHvKCTKZG+Wz0l5OzdNiYVjLrhkX7xoV/aJ+PbU
   Q==;
X-CSE-ConnectionGUID: iLjdoOpZQem+3yA6M73+3w==
X-CSE-MsgGUID: nFyccJieSBS9+fPJBjjJIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102843303"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="102843303"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:17:26 -0700
X-CSE-ConnectionGUID: 1wFTdLPSRou64nosWEr3wQ==
X-CSE-MsgGUID: 884+k//wTpqUw+cqruxgHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="244114106"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.245.175])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:17:22 -0700
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
Subject: [PATCH v2 3/4] drm/exec, drm/xe: Avoid abusing the drm_exec retry pointer
Date: Wed, 20 May 2026 12:16:15 +0200
Message-ID: <20260520101616.41284-4-thomas.hellstrom@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108691-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 698A058BAAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The xe driver was using the drm_exec retry pointer directly to
restart the locking loop after out-of-memory errors. This is
relying on undocumented behaviour.

Instead add a drm_exec_retry() macro that can be used in this
situation, and that also warns if the struct drm_exec is
not newly (re-)initialized.

Use that macro in xe.

v2:
- Only allow if the drm_exec context is newly initialized.
  (Christian)

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/drm_exec.c         |  3 ---
 drivers/gpu/drm/xe/xe_validation.h |  2 +-
 include/drm/drm_exec.h             | 19 +++++++++++++++++++
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_exec.c b/drivers/gpu/drm/drm_exec.c
index 746210f3f6c2..7988f5e7d56a 100644
--- a/drivers/gpu/drm/drm_exec.c
+++ b/drivers/gpu/drm/drm_exec.c
@@ -48,9 +48,6 @@
  * See struct dma_exec for more details.
  */
 
-/* Dummy value used to initially enter the retry loop */
-#define DRM_EXEC_DUMMY ((void *)~0)
-
 /* Unlock all objects and drop references */
 static void drm_exec_unlock_all(struct drm_exec *exec)
 {
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
index 18f84faabbb9..99c7e1bb3c5b 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -9,6 +9,12 @@
 #define DRM_EXEC_INTERRUPTIBLE_WAIT	BIT(0)
 #define DRM_EXEC_IGNORE_DUPLICATES	BIT(1)
 
+/*
+ * Dummy value used to initially enter the retry loop.
+ * internal use only.
+ */
+#define DRM_EXEC_DUMMY ((void *)~0)
+
 struct drm_gem_object;
 
 /**
@@ -142,6 +148,19 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
 	return !!exec->contended;
 }
 
+/**
+ * drm_exec_retry() - Unconditionally restart the loop to grab all locks.
+ * @exec: drm_exec object
+ *
+ * Unconditionally retry the loop to lock all objects. For consistency,
+ * the exec object needs to be newly initialized.
+ */
+#define drm_exec_retry(_exec)					\
+	do {							\
+		WARN_ON((_exec)->contended != DRM_EXEC_DUMMY);	\
+		goto *__drm_exec_retry_ptr;			\
+	} while (0)
+
 void drm_exec_init(struct drm_exec *exec, u32 flags, unsigned nr);
 void drm_exec_fini(struct drm_exec *exec);
 bool drm_exec_cleanup(struct drm_exec *exec);
-- 
2.54.0


