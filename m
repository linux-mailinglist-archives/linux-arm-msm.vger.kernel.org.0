Return-Path: <linux-arm-msm+bounces-68019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 225C8B1D8A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 15:11:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07859188A8DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 13:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6633259C85;
	Thu,  7 Aug 2025 13:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cfcqk+2n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF8D23BF83;
	Thu,  7 Aug 2025 13:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754572264; cv=none; b=Nh7By/KY+sPPL0zwflAEF6hUUprtFCxBlOA/8Izbz209GR4VfVeN5LHw86X28wuqxhaRp6YBgHwO2ij0CJyohUmBTMLdptBUaVDNrZlT5DTVj1Z57DHQBv7aW91xQa7xZ2EOgtVLeD0BkZAI7fZxQTGcf33n6FOCKq1W0WPK80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754572264; c=relaxed/simple;
	bh=Aaqn6wdS/DoynQGLnl7lgxbV5pDHSEtutNYoP0S1tNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CLOLEM1K/ODL21xdLYvtn6ebF5/T3nRjpXI9w8FdZtW0bfQDZavMOrRQtlRQt81vNebY713YBJyPnoeWCQSVTHD5KX7Ovxiq0K85a3eeXzJc/RMf1aKSMwDl7/LkFyP2+ISFGnjhJIXhgTa2OqA2cd5MObdfZ33JhbRfhLX40/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cfcqk+2n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEA39C4CEEB;
	Thu,  7 Aug 2025 13:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754572264;
	bh=Aaqn6wdS/DoynQGLnl7lgxbV5pDHSEtutNYoP0S1tNs=;
	h=From:To:Cc:Subject:Date:From;
	b=Cfcqk+2nCl7jdrLXeY51/6Xu1vl5bzkWjWJpErz/+Yh5N7vyHjok+3enlHAGeb4/g
	 Ti3AYdvXs4bfp92WanoF2MiLWNmTq40xg/WhL3JQ6TgJBX/9FPCpAKAJmoWHmjVYdP
	 MKtu1YK7qvSy6zy7z+xymGj5zVe19p5o34+/mUl8GbxHVjqlVl0WA01eB6nIMNb/bJ
	 k2ih5Ywsjf4s4kUXsdGfqZ1Xkoa2rdXgEIn9SExWdqeoB47RzlC20t12I8TceyyhI/
	 T3xT36DCahW9SjMMCLyUHmV3J3tE1Uqw2MeRrs6uZf68QqOT8vw/Mfu93wk7jIL3cD
	 dOGWsv+QzFtCQ==
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
Subject: [PATCH v2] drm/msm: Fix objtool warning in submit_lock_objects()
Date: Thu,  7 Aug 2025 09:10:58 -0400
Message-Id: <20250807131058.1013858-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Split the vmbind case into a separate helper function
submit_lock_objects_vmbind() to fix objtool warning:

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

Changes since v1:
 - Extract helper submit_lock_objects_vmbind() instead of refactoring
   single loop

 drivers/gpu/drm/msm/msm_gem_submit.c | 49 +++++++++++++++-------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5f8e939a5906..1ce90e351b7a 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -271,32 +271,37 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 	return ret;
 }
 
-/* This is where we make sure all the bo's are reserved and pin'd: */
-static int submit_lock_objects(struct msm_gem_submit *submit)
+static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
 {
-	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
+	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE_DUPLICATES;
 	struct drm_exec *exec = &submit->exec;
-	int ret;
+	int ret = 0;
 
-	if (msm_context_is_vmbind(submit->queue->ctx)) {
-		flags |= DRM_EXEC_IGNORE_DUPLICATES;
+	drm_exec_init(&submit->exec, flags, submit->nr_bos);
 
-		drm_exec_init(&submit->exec, flags, submit->nr_bos);
+	drm_exec_until_all_locked (&submit->exec) {
+		ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
+		drm_exec_retry_on_contention(exec);
+		if (ret)
+			break;
 
-		drm_exec_until_all_locked (&submit->exec) {
-			ret = drm_gpuvm_prepare_vm(submit->vm, exec, 1);
-			drm_exec_retry_on_contention(exec);
-			if (ret)
-				return ret;
+		ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
+		drm_exec_retry_on_contention(exec);
+		if (ret)
+			break;
+	}
 
-			ret = drm_gpuvm_prepare_objects(submit->vm, exec, 1);
-			drm_exec_retry_on_contention(exec);
-			if (ret)
-				return ret;
-		}
+	return ret;
+}
 
-		return 0;
-	}
+/* This is where we make sure all the bo's are reserved and pin'd: */
+static int submit_lock_objects(struct msm_gem_submit *submit)
+{
+	unsigned flags = DRM_EXEC_INTERRUPTIBLE_WAIT;
+	int ret = 0;
+
+	if (msm_context_is_vmbind(submit->queue->ctx))
+		return submit_lock_objects_vmbind(submit);
 
 	drm_exec_init(&submit->exec, flags, submit->nr_bos);
 
@@ -305,17 +310,17 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 					drm_gpuvm_resv_obj(submit->vm));
 		drm_exec_retry_on_contention(&submit->exec);
 		if (ret)
-			return ret;
+			break;
 		for (unsigned i = 0; i < submit->nr_bos; i++) {
 			struct drm_gem_object *obj = submit->bos[i].obj;
 			ret = drm_exec_prepare_obj(&submit->exec, obj, 1);
 			drm_exec_retry_on_contention(&submit->exec);
 			if (ret)
-				return ret;
+				break;
 		}
 	}
 
-	return 0;
+	return ret;
 }
 
 static int submit_fence_sync(struct msm_gem_submit *submit)
-- 
2.39.5


