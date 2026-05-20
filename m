Return-Path: <linux-arm-msm+bounces-108689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FPcMVyKDWpKywUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:18:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9846F58B9AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C62E73046372
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 10:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B303D75B6;
	Wed, 20 May 2026 10:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+OQfKQi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472603D6CDC
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 10:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779272244; cv=none; b=iiNkZ82jzRfWAL2yEsuc+YLZPjj26IPUVhcLbPh8nl61RkaqkM7SJKQoYN9RxA70eJXSH2Ns+RlzqrQO0m2ELcMBCTENO8vbyuzzqp8VanY9DC+GjTVdSRetNooBH2qEsCPlcnRKcVpbDDPKPEl3f78TEG+6JQsTzG/+hRkkuqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779272244; c=relaxed/simple;
	bh=Eyqg+cXE3zQi+HGwpHNc4vqhQE2TgtWXcssaKXnp8L0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uToQp6NeXkTk4yeqktHQZqfbF2mfa7aexE3Xp8KQM+U0NAJZzOuFEDbCSqIwGkZjUjGEs3Hm6bS9V6BerBKZHuTZPof47f+Bv5sc3R/1eNojUAuhqNbzhTTKojWLYl3wwpOfENnZ6NUC4qxTS9rn4r6KBi0n9VF82eGaIqGYZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+OQfKQi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779272242; x=1810808242;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Eyqg+cXE3zQi+HGwpHNc4vqhQE2TgtWXcssaKXnp8L0=;
  b=J+OQfKQigk92ozm/BSHbO8Kbvp0SGSo1Y29Zr0fM7EgYQ0i7KAj7HAE8
   1tpsA/z4yH3UNmVpbv2nO1kHqb/LjrLxspMkQRpDXnjG2ctAtYqaKhN0+
   E/czi/o2vnS7O1wbtRSZUfkiBcrLaSjCiTY59TeaE0m4iEuBEZvac+CdC
   7E8UP1EfliwobCf1w0OZ578zmb+DFKvcVaZ8KdmOAQqgj1ysUUyXmI2x4
   3lUJjyYSBSQpJ4YXBNmK6ev19YEjSwDtIrpJ2BvtjpjyiWqoiwXc846GV
   r4uUjKl3bnRrqXTTFqOQPj/Fn4qSphmU0RjHvq1g02TNnTQdT9aAmF4ft
   Q==;
X-CSE-ConnectionGUID: 9tRQw5ZgTY6MHC0KT8YaGA==
X-CSE-MsgGUID: aQx6RwD1SrOqeVzrWnFJiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="102843290"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="102843290"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:17:21 -0700
X-CSE-ConnectionGUID: ieDKYrn4R0WJGtIaIh7CfA==
X-CSE-MsgGUID: 0Qjo2TgJQcCyXtlrUbycng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="244114093"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fedora) ([10.245.245.175])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 03:17:17 -0700
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
Subject: [PATCH v2 2/4] drm/exec: Make the drm_exec_until_all_locked() macro more readable
Date: Wed, 20 May 2026 12:16:14 +0200
Message-ID: <20260520101616.41284-3-thomas.hellstrom@linux.intel.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108689-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 9846F58B9AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use __UNIQUE_ID as done elsewhere in the kernel rather than a
hand-rolled __PASTE to craft a unique id.

Also use __maybe_unused rather than (void) to signify that a
variable, althrough written to, may not actually be used.

v2:
- Move assignment to declaration (Christian)
- Declare the retry pointer as void *const.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 include/drm/drm_exec.h | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index dee6ebdbe416..18f84faabbb9 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -95,6 +95,17 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
 #define drm_exec_for_each_locked_object_reverse(exec, obj)		\
 	__drm_exec_for_each_locked_object_reverse(exec, obj, __UNIQUE_ID(drm_exec))
 
+/*
+ * Helper to drm_exec_until_all_locked(). Don't use directly.
+ *
+ * Since labels can't be defined local to the loop's body we use a jump pointer
+ * to make sure that the retry is only used from within the loop's body.
+ */
+#define __drm_exec_until_all_locked(exec, _label)			 \
+_label:									 \
+	for (void *const __maybe_unused __drm_exec_retry_ptr = &&_label; \
+	     drm_exec_cleanup(exec);)
+
 /**
  * drm_exec_until_all_locked - loop until all GEM objects are locked
  * @exec: drm_exec object
@@ -102,17 +113,9 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
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
2.54.0


