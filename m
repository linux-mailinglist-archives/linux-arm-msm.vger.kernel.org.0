Return-Path: <linux-arm-msm+bounces-90660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QAsmFnxqeGk1pwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:34:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7814890C17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 08:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 83D8B3004077
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 07:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFD89278E63;
	Tue, 27 Jan 2026 07:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CY5OXmSd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8E52032D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 07:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769499254; cv=none; b=ke88yMCHRujJpx4u/RQYYJNqbSVd+9mr4+0gY0kFKPRAp88fldz3uFuE4A4Sp3e6wzZlWLpKE8FHtV7YCsFf6MhmVEETHOmKSjDqLgEFxWR4gC6ejD9SyjS4EZkAken4Q07YiQAXFs+o9gYMtPo5wMb/Rl4QMnMjSykhluN7NTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769499254; c=relaxed/simple;
	bh=9NLZRgwcvV7vzeoUJvZKI0Z59eH2ErVcfn9JkfFxGdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c1jRuiSn9qL5vFaEYFC8BkUuP98/Hh+HqdMDLoYTYvDpepgBvEo6iDRWRB9IEFdNwU2bjt3f90Z0VsER9+dy6AAwEBFmZ/HuSLj0Uh46HXeLLRIqjdBR0PND2z97QtbqV+We4Vs2E3QU+YQ9KbEXSNVGQVAeRxWvBTAMSQiRvqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CY5OXmSd; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8230c839409so4237755b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jan 2026 23:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769499253; x=1770104053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MO/xBk1Z9Sg2T5LDtUgXSRnpiqznRJUad1HNlKnWIEg=;
        b=CY5OXmSdEiEPf5/upIrSH9qbp2SqkcRlTA9gMLnirnyW/cgSTTqRkx6uuY9SUOiZ38
         YMiKU8kBUc5bh+C+CYG/JkKRm+Yds8Ns+zYRpLexGljOr+caKaa1gzh5mYAoCr8nYU5G
         jzwNtdCsq1TYCow1zTItWoS5KnC+gRJ04EIg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769499253; x=1770104053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MO/xBk1Z9Sg2T5LDtUgXSRnpiqznRJUad1HNlKnWIEg=;
        b=EuXeJX0pg97g3EXHaHFoPsan4EId5TsO7Os9dEKlyVe+qtMVnRWFcAJDwX+UuJwsjF
         A5MwTDPj3oLDgi0xWIVGM/slmE2eAVOjKL7gqfKT6fcOx16vfhLrPr9eScGgBnvefn47
         8sDhfxjm0GTpaGom7za5KqGdxyMGbTRFMQGnJLFHKTjPcKJJRZ7LC+7PchpoEcSlQy3C
         LDepnjZZRmnTJntv3e9DWZafFYBGcF0RaAizr/N72toBtOS5E9DL7IDldt1hjo9PY76c
         SjxF9Q71171cChzab7gQlgjAjXcG8RH1P683tNWut3aXwrbPiz0ngFLrQY0fVLyflkbC
         Jbaw==
X-Forwarded-Encrypted: i=1; AJvYcCVWFEFNamJc4xiHkVdaYgJgGjh0VtTfzysN50voSlXCNhroctQWm+SmWPFnAzZHf6hhph2LEWGsgwyk+NaR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2k4g2K8Q7xkcRMsO50LQZSASKLmBFQ8VpMPBV2YpZ+FDBFGZG
	WEXQ6/wnnNQVB7XpZUEb12qxdK2NEr9M5pURTIyl3B4hh6aVBzXOqdI6pHbgZnShrw==
X-Gm-Gg: AZuq6aLTKy2R2VPRnrR3IjuNdSYeou/xH7aAtqAKYbnAWLSNvIHmCQnbhP6kqAtycR4
	5VjnODYvajzgCeFWR/Tl3tUZYdw5DQFYCx5YAvgcTfXt67xEFYyQQSddrQoC1KCe2onwwoZLplx
	afndi4zfFrmssMfTnz7NP+X6M2ort02zbOsvUPDaRHYyOa/cLIxWdtzrhO0pazRYuTzW6lmOtc1
	t0cfEYUJGewunXt0GOqDw2LJtft3Msax0VQytWkO+9CdFqZRPrePzkltMblMEqoSMj2qTigWA3n
	VD9cbdl1nmknM4c5oVqKrDV3C3C+NMqbs8i7+7yIZkyEjdbiln/5oucY37DHDQ0rWdbBT221kUm
	cXY7gJfCQ/yfVvd95smZBZbwDtPmZxDWFaiCnKt6ybreEiA5L9X4fuWWxPfM6OHes4sXuAPUtff
	jAz002jxfX85ceD4s6ILES5jg8GgjqXc3mWhhiQWtTNNTQPg22U2qbJ+qiwLUt6G/EZnn8UhZUs
	A==
X-Received: by 2002:a05:6a00:1c99:b0:81f:521c:b640 with SMTP id d2e1a72fcca58-823692e6deamr973608b3a.55.1769499251997;
        Mon, 26 Jan 2026 23:34:11 -0800 (PST)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:d089:781c:105e:9178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231876e718sm11232295b3a.62.2026.01.26.23.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 23:34:11 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>
Subject: [RFC PATCH] drm: gpu: msm: forbid mem reclaim from reset
Date: Tue, 27 Jan 2026 16:33:34 +0900
Message-ID: <20260127073341.2862078-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.53.0.rc1.217.geba53bf80e-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[senozhatsky@chromium.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90660-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7814890C17
X-Rspamd-Action: no action

We sometimes get into a situtation where GPU hangcheck fails to
recover GPU:

[..]
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840161
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840162
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): hangcheck detected gpu lockup rb 0!
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): completed fence: 7840162
msm_dpu ae01000.display-controller: [drm:hangcheck_handler] *ERROR* (IPv4: 1): submitted fence: 7840163
[..]

The problem is that msm_job worker is blocked on gpu->lock

INFO: task ring0:155 blocked for more than 122 seconds.
Not tainted 6.6.99-08727-gaac38b365d2c #1
task:ring0 state:D stack:0 pid:155 ppid:2 flags:0x00000008
Call trace:
__switch_to+0x108/0x208
schedule+0x544/0x11f0
schedule_preempt_disabled+0x30/0x50
__mutex_lock_common+0x410/0x850
__mutex_lock_slowpath+0x28/0x40
mutex_lock+0x5c/0x90
msm_job_run+0x9c/0x140
drm_sched_main+0x514/0x938
kthread+0x114/0x138
ret_from_fork+0x10/0x20

which is owned by recover worker, which is waiting for DMA fences
from a memory reclaim path, under the very same gpu->lock

INFO: task ring0:155 is blocked on a mutex likely owned by task gpu-worker:154.
task:gpu-worker state:D stack:0 pid:154 ppid:2 flags:0x00000008
Call trace:
__switch_to+0x108/0x208
schedule+0x544/0x11f0
schedule_timeout+0x1f8/0x770
dma_fence_default_wait+0x108/0x218
dma_fence_wait_timeout+0x6c/0x1c0
dma_resv_wait_timeout+0xe4/0x118
active_purge+0x34/0x98
drm_gem_lru_scan+0x1d0/0x388
msm_gem_shrinker_scan+0x1cc/0x2e8
shrink_slab+0x228/0x478
shrink_node+0x380/0x730
try_to_free_pages+0x204/0x510
__alloc_pages_direct_reclaim+0x90/0x158
__alloc_pages_slowpath+0x1d4/0x4a0
__alloc_pages+0x9f0/0xc88
vm_area_alloc_pages+0x17c/0x260
__vmalloc_node_range+0x1c0/0x420
kvmalloc_node+0xe8/0x108
msm_gpu_crashstate_capture+0x1e4/0x280
recover_worker+0x1c0/0x638
kthread_worker_fn+0x150/0x2d8
kthread+0x114/0x138

So no one can make any further progress.

Forbid recover/fault worker to enter memory reclaim (under
gpu->lock) to address this deadlock scenario.

Cc: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 995549d0bbbc..ddcd9e1c217a 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -17,6 +17,7 @@
 #include <linux/string_helpers.h>
 #include <linux/devcoredump.h>
 #include <linux/sched/task.h>
+#include <linux/sched/mm.h>
 
 /*
  * Power Management:
@@ -469,6 +470,7 @@ static void recover_worker(struct kthread_work *work)
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
+	unsigned int noreclaim_flag;
 	struct task_struct *task;
 	int i;
 
@@ -506,6 +508,8 @@ static void recover_worker(struct kthread_work *work)
 			msm_gem_vm_unusable(submit->vm);
 	}
 
+	noreclaim_flag = memalloc_noreclaim_save();
+
 	get_comm_cmdline(submit, &comm, &cmd);
 
 	if (comm && cmd) {
@@ -524,6 +528,8 @@ static void recover_worker(struct kthread_work *work)
 	pm_runtime_get_sync(&gpu->pdev->dev);
 	msm_gpu_crashstate_capture(gpu, submit, NULL, comm, cmd);
 
+	memalloc_noreclaim_restore(noreclaim_flag);
+
 	kfree(cmd);
 	kfree(comm);
 
@@ -588,6 +594,7 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
+	unsigned int noreclaim_flag;
 
 	mutex_lock(&gpu->lock);
 
@@ -595,6 +602,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 	if (submit && submit->fault_dumped)
 		goto resume_smmu;
 
+	noreclaim_flag = memalloc_noreclaim_save();
+
 	if (submit) {
 		get_comm_cmdline(submit, &comm, &cmd);
 
@@ -610,6 +619,8 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 	msm_gpu_crashstate_capture(gpu, submit, fault_info, comm, cmd);
 	pm_runtime_put_sync(&gpu->pdev->dev);
 
+	memalloc_noreclaim_restore(noreclaim_flag);
+
 	kfree(cmd);
 	kfree(comm);
 
-- 
2.53.0.rc1.217.geba53bf80e-goog


