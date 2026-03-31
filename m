Return-Path: <linux-arm-msm+bounces-101003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIQsHjKTy2nMJAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:26:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B3B367095
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 11:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AFE130C1CDF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 09:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65CCB3EC2F4;
	Tue, 31 Mar 2026 09:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENVVw76M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0790C3ED124
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774948862; cv=none; b=JH44ZM5PrYEze6eQI+FY3MuhKrO4ulktdttIW/dKB5g2kE57K2G44A9F2tXhvtmwLtDgUi/8McmYUwT9rLzYOUCpWRhB3uLVrQusxfq6b+uaBJI7COMqFqxoXmtjY9IIRa2lWeuZ6Px6nnbuhyRWTmZo/xjC0a/oZasP8l3okUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774948862; c=relaxed/simple;
	bh=wtLD7RzGGtUF5HRqMN10l/cSDtJ8iDS5SncsgRFTjYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u/nSNrXztpq67fLs2lbDeSwMR6f+uLW4pmwwcmMEOmfbRYy3TtyytBqDm8bRMS/0XeaGy6BV7NKX4Fd2gLgj5TmeXSN6KqtomKduP6rt+sv+4UJLEe6gDpfDfuWa/A/9hc1HE6kwS7Qq7qLTsYOLo3uoA2krC52vGhibO+pjVyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENVVw76M; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774948861; x=1806484861;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wtLD7RzGGtUF5HRqMN10l/cSDtJ8iDS5SncsgRFTjYM=;
  b=ENVVw76MCu7Jgf3oJV8/5DUwWXtNryPLjB6A/VlpPSnviT5pWIBL7+iZ
   HtXErcriVbboMnMYxD4L1RcbaL3AIbcAC3u6Hc9CZUMb5OcWa3+o7GQIR
   09my8FxQyaklgPTK7s6PfBkb7fdOhqhZSBEswGnz3hmBUsA4SAhoS5u5k
   AlpVXg9II6tfaOAdxiW9UrsKVlVWL23L5dH/qutXnvbQuB+fxBabW6YEn
   2zb+Wm/y0Vm5QSgvQbCLk8Ms2nE5bEbCjMOUgzZNI2Njboh9Fd35Qcx1j
   M4R7tgaXB52z8M1kdCYDn3v4sameP9qyzkyTr6DNdt512gH8ha3hqYccL
   Q==;
X-CSE-ConnectionGUID: c6rN+4nfRHmYkbciSuu4RQ==
X-CSE-MsgGUID: awlkrVaoSrG1qGnOp++VEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="74988524"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="74988524"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:21:00 -0700
X-CSE-ConnectionGUID: kxIufajmTEyw3r7qxrGStA==
X-CSE-MsgGUID: o3tm2YXcSJGR1mlm/jahqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226288531"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO fedora) ([10.245.244.28])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 02:20:56 -0700
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
Subject: [PATCH 2/5] drm/msm: Remove abuse of drm_exec internals
Date: Tue, 31 Mar 2026 11:20:20 +0200
Message-ID: <20260331092023.81616-3-thomas.hellstrom@linux.intel.com>
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
	TAGGED_FROM(0.00)[bounces-101003-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: D4B3B367095
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The code was reading drm_exec internal state to determine whether
the drm_exec structure had been initialized or not, and therefore
needed cleaning up, relying on undocumented behaviour.

Instead add a bool to struct msm_gem_submit to indicate whether
drm_exec cleaning up is needed.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/msm/msm_gem.h        | 1 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index cb32093fda47..762e546d25ef 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -452,6 +452,7 @@ struct msm_gem_submit {
 	bool bos_pinned : 1;
 	bool fault_dumped:1;/* Limit devcoredump dumping to one per submit */
 	bool in_rb : 1;     /* "sudo" mode, copy cmds into RB */
+	bool has_exec : 1;  /* @exec is initialized. */
 	struct msm_ringbuffer *ring;
 	unsigned int nr_cmds;
 	unsigned int nr_bos;
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 75d9f3574370..26ea8a28be47 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -278,6 +278,7 @@ static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
 	int ret = 0;
 
 	drm_exec_init(&submit->exec, flags, submit->nr_bos);
+	submit->has_exec = true;
 
 	drm_exec_until_all_locked (&submit->exec) {
 		ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
@@ -304,6 +305,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 		return submit_lock_objects_vmbind(submit);
 
 	drm_exec_init(&submit->exec, flags, submit->nr_bos);
+	submit->has_exec = true;
 
 	drm_exec_until_all_locked (&submit->exec) {
 		ret = drm_exec_lock_obj(&submit->exec,
@@ -523,7 +525,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 	if (error)
 		submit_unpin_objects(submit);
 
-	if (submit->exec.objects)
+	if (submit->has_exec)
 		drm_exec_fini(&submit->exec);
 
 	/* if job wasn't enqueued to scheduler, early retirement: */
-- 
2.53.0


