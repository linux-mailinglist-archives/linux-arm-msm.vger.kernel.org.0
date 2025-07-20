Return-Path: <linux-arm-msm+bounces-65827-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CD509B0B85C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 23:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6839172BED
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 21:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 015ED223DE7;
	Sun, 20 Jul 2025 21:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="UE3zeXDw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B431DED70
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 21:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753047931; cv=none; b=uAScrO8KV0FY3GT7hrpMzAq5+cH6IdTrScQa6qb79/YvtSzGkU2IiUlkdkyEP5yle620mh9bS+GIk/AC5bU+CWc0Yw8g3f3PTazhB0fKjVSCuZx4eyiDngZ2qhT4kghyQhaSk9dAFL1P2sDjlLSRAa8Wsoj/WBfcLvPq2+5cu8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753047931; c=relaxed/simple;
	bh=3lV3Tb5N9liQIYc8AuuVcwdU20+1ViAOmmuE/54x0qY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U2R++om5XOTRHMoSpKRL51bWA0FLVJ9IiZ3vRfbnsCOz8bHR6WPY5U5esIAU0fYuQyIlpc2tlhrsP2JaXWiU0924b9AhJk6HMYuEc7QjgdSQm1clTpm8i60d9MahYx/zYkwMH3snH9DzZ5dkXkIFyjPeJrJpQGn4V9OB12XCSVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=UE3zeXDw; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bQJYSnwRkchY3zI6tgHZy5FwvAi9hVv3Wew3x0xU9LE=; b=UE3zeXDwfUbpuBZACGcl6rb2kQ
	tCboNXf/Yo+YEov623V3qJA/Xd1NdvmEEpmj3j7U+dkL31RnJL2K2xVGUlR5Dc8OPKygwr4gGiZt9
	EMi7hTsnNM2nOdJsuN1UafcrmpDz0sK0hmERfPQybPZvKmEcA726/Z0q2KH6URlxKkssDXUBEEPpR
	/EL+lpSVgreV85oNUhiEqdRzuu6lsDO3h88ysVRusT/Iycy+SPjMe/DIPJK5SPAvFwnUtSXU2q0Gn
	4MswkI+5cH16eR/Y3G6L09Zm7X55D/MYQWdQObw3WT20ZU1+Qs5vr7AxJra/mrD6xhCNxnXLw6Kek
	YcG9il/g==;
Received: from [187.36.210.68] (helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256) (Exim)
	id 1udbqI-001SKK-Bt; Sun, 20 Jul 2025 23:45:10 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	kernel-dev@igalia.com,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v2] drm/msm: Update global fault counter when faulty process has already ended
Date: Sun, 20 Jul 2025 18:42:31 -0300
Message-ID: <20250720214458.22193-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The global fault counter is no longer used since commit 12578c075f89
("drm/msm/gpu: Skip retired submits in recover worker"). However, it's
still needed, as we need to handle cases where a GPU fault occurs after
the faulting process has already ended.

Hence, increment the global fault counter when the submitting process
had already ended. This way, the number of faults returned by
MSM_PARAM_FAULTS will stay consistent.

While here, s/unusuable/unusable.

Fixes: 12578c075f89 ("drm/msm/gpu: Skip retired submits in recover worker")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---

v1 -> v2: https://lore.kernel.org/dri-devel/20250714230813.46279-1-mcanal@igalia.com/T/

* Don't delete the global fault, but instead, increment it when the we get
	a fault after the faulting process has ended (Rob Clark)
* Rewrite the commit message based on the changes.

 drivers/gpu/drm/msm/msm_gpu.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index c317b25a8162..416d47185ef0 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -465,6 +465,7 @@ static void recover_worker(struct kthread_work *work)
 	struct msm_gem_submit *submit;
 	struct msm_ringbuffer *cur_ring = gpu->funcs->active_ring(gpu);
 	char *comm = NULL, *cmd = NULL;
+	struct task_struct *task;
 	int i;
 
 	mutex_lock(&gpu->lock);
@@ -482,16 +483,20 @@ static void recover_worker(struct kthread_work *work)
 
 	/* Increment the fault counts */
 	submit->queue->faults++;
-	if (submit->vm) {
+
+	task = get_pid_task(submit->pid, PIDTYPE_PID);
+	if (!task)
+		gpu->global_faults++;
+	else {
 		struct msm_gem_vm *vm = to_msm_vm(submit->vm);
 
 		vm->faults++;
 
 		/*
 		 * If userspace has opted-in to VM_BIND (and therefore userspace
-		 * management of the VM), faults mark the VM as unusuable.  This
+		 * management of the VM), faults mark the VM as unusable. This
 		 * matches vulkan expectations (vulkan is the main target for
-		 * VM_BIND)
+		 * VM_BIND).
 		 */
 		if (!vm->managed)
 			msm_gem_vm_unusable(submit->vm);
-- 
2.50.0


