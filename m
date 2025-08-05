Return-Path: <linux-arm-msm+bounces-67813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC13B1BCDC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 00:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7900916AABC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 22:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8C729B22F;
	Tue,  5 Aug 2025 22:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d+NfAI0C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D0229B205;
	Tue,  5 Aug 2025 22:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754434563; cv=none; b=az5yUhq+a5+HMy4L7UR3aWw0gltmOT3PtJy2d3h0QVPhxPxvQkxQKXW4yWkT4pQ8BrwvmQa8qoJQhjSNUB+llgJPX9bDfYG10sPSsTKQqYX3CCm5ln1G8KKf8lGryVwo28izEknvTACka9aPGCtBBfsPQm02IwMzprhxuTAVWMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754434563; c=relaxed/simple;
	bh=+al342bVs+POurrkFCVBYQ90F4lkUhb3/Od3XV/5kIk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NdkH0bSzG8uoQdcWx2yKJIXYy8CtHiUl+uBz5OBZKh0x6ua5t7oKqfMGaCZ/Dx/ZSqhK88Is2GmQJOeGU6R3/rjWTwMeny7fUcY/du6hxLgkrW0YhtNlUK/y8/kmP39gRxDl8vLa8MLlPC5nCoRNbT1ySnzTDKRdBKkmIl5FIoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d+NfAI0C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFED4C4CEF0;
	Tue,  5 Aug 2025 22:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754434562;
	bh=+al342bVs+POurrkFCVBYQ90F4lkUhb3/Od3XV/5kIk=;
	h=From:To:Cc:Subject:Date:From;
	b=d+NfAI0C7M3SIMcRYMsBp571UxwDaQUyX6t4JIy6Q6Mmc7Ar1CWpPVraFpkOuKcdH
	 l2Lpw6slA1d9W/GYWNiRgqEr09524WJjUoNhm/7bBeAA9tXvO90R6RcwTVdwwttE+H
	 OVJzV0wk2thXCwMK7eVO8JPcgRqtr7BxjBs2+MtHatnZktnmGiVJUwCVJT/ol+1vt8
	 j+obV2Iupe9FF/QHFre/vV7K46J4mXd3bdtAVphXPlaUUNQEdpZPYACRAukm0kodCs
	 n+KGf8mr4bhifvFc1lepkylJrTMhjhtj+C2sogfznQohzOZpfdftWLO/hTOqY9ck3T
	 wq42afdDnnl3A==
From: Sasha Levin <sashal@kernel.org>
To: robin.clark@oss.qualcomm.com,
	lumag@kernel.org
Cc: abhinav.kumar@linux.dev,
	jessica.zhang@oss.qualcomm.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	antomani103@gmail.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH] drm/msm: Fix objtool warning in submit_lock_objects()
Date: Tue,  5 Aug 2025 18:55:57 -0400
Message-Id: <20250805225557.593192-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Restructure submit_lock_objects() to use a single loop with break
statements to fix objtool warning:

  drivers/gpu/drm/msm/msm.o: warning: objtool: submit_lock_objects+0x451:
  sibling call from callable instruction with modified stack frame

The drm_exec_until_all_locked() macro uses computed gotos internally
for its retry loop. Having return statements inside this macro, or
immediately after it in certain code paths, confuses objtool's static
analysis of stack frames, causing it to incorrectly flag tail call
optimizations.

Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 43 ++++++++++++----------------
 1 file changed, 19 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5f8e939a5906..253347b6e328 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -276,46 +276,41 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 {
 	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
 	struct drm_exec *exec = &submit->exec;
-	int ret;
+	int ret = 0;
 
-	if (msm_context_is_vmbind(submit->queue->ctx)) {
+	if (msm_context_is_vmbind(submit->queue->ctx))
 		flags |= DRM_EXEC_IGNORE_DUPLICATES;
 
-		drm_exec_init(&submit->exec, flags, submit->nr_bos);
+	drm_exec_init(&submit->exec, flags, submit->nr_bos);
 
-		drm_exec_until_all_locked (&submit->exec) {
+	drm_exec_until_all_locked (&submit->exec) {
+		if (msm_context_is_vmbind(submit->queue->ctx)) {
 			ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
 			drm_exec_retry_on_contention(exec);
 			if (ret)
-				return ret;
+				break;
 
 			ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
 			drm_exec_retry_on_contention(exec);
 			if (ret)
-				return ret;
-		}
-
-		return 0;
-	}
-
-	drm_exec_init(&submit->exec, flags, submit->nr_bos);
-
-	drm_exec_until_all_locked (&submit->exec) {
-		ret = drm_exec_lock_obj(&submit->exec,
-					drm_gpuvm_resv_obj(submit->vm));
-		drm_exec_retry_on_contention(&submit->exec);
-		if (ret)
-			return ret;
-		for (unsigned i = 0; i < submit->nr_bos; i++) {
-			struct drm_gem_object *obj = submit->bos[i].obj;
-			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
+				break;
+		} else {
+			ret = drm_exec_lock_obj(&submit->exec,
+						drm_gpuvm_resv_obj(submit->vm));
 			drm_exec_retry_on_contention(&submit->exec);
 			if (ret)
-				return ret;
+				break;
+			for (unsigned i = 0; i < submit->nr_bos; i++) {
+				struct drm_gem_object *obj = submit->bos[i].obj;
+				ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
+				drm_exec_retry_on_contention(&submit->exec);
+				if (ret)
+					break;
+			}
 		}
 	}
 
-	return 0;
+	return ret;
 }
 
 static int submit_fence_sync(struct msm_gem_submit *submit)
-- 
2.39.5


