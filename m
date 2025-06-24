Return-Path: <linux-arm-msm+bounces-62146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA2FAE5B26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1F517AB8D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 04:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B07435975;
	Tue, 24 Jun 2025 04:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3Y2DW4N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB222D9E7;
	Tue, 24 Jun 2025 04:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750738360; cv=none; b=RVz52k1jxCNEPWOfoHj27uyZyJRPWys5SUWr3uTHXtFZ4EkCRZIVOjKFW8sp/hFnHry6cAW1PWrPWIHTC/C3YIQSQT1NyGMoACzuJ0oOLLPRV6i/kZI7Ni3ZFdPtVcfqVVLQTMWeFyPMEOFNlgPyA7d2GW7UccIIDOgoDaquRWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750738360; c=relaxed/simple;
	bh=yb8HjhNhMyJbvyW9Gk1tTf5OEtwTipOmAdRf3Z2XVXM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q+L4LZcxNiitBS+19QkHxbhEUHln4RpRBa/P1wG3rlkpmSakOrl6w2QoLr9BusLHBDgU7I88tIK+PddLViT4CXQERu3y2/P29nhlllUkz4rabWwDbOlKP2jAS8mh4Yg3PNHYNLQ72vJJmKcUtHAMomLlxM9OU183zuw5m/f8dU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3Y2DW4N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8705C4AF09;
	Tue, 24 Jun 2025 04:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750738360;
	bh=yb8HjhNhMyJbvyW9Gk1tTf5OEtwTipOmAdRf3Z2XVXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q3Y2DW4NWVLN2u/fBSQk+WeNc5RGxt8f9YDaHuMwQSbW/gvmUbaPuOXl3bO2ThPcR
	 l2AuhP0JrZ5KcfV7K7GDLJjuLGWSwIpO/aXZoHTD0HiZDR8eIQx4Y45ItOn5I/EO+Y
	 nNQIx5twl/SX2Nbp2SRXI2SK63sRZg5qNoE9+FfxL04FlYcdR2U/K0Or4WYHwpZTlf
	 SCVgQ2NS1ujUlzQfHfGsEEfspltS1RS6u/dUzrJnUa4xR8G0P63aZXBBk3Lavnx5R+
	 k4oDWeJNGo3ct5wRJ3XcDQpzjVrC4TqJlOXmNG752uCZW6HNKlxYKuGIuvuPt8uJ4I
	 4NQQ33i9sFFuQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Rob Clark <robdclark@chromium.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	lumag@kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.1 02/15] drm/msm: Fix another leak in the submit error path
Date: Tue, 24 Jun 2025 00:12:25 -0400
Message-Id: <20250624041238.84580-2-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624041238.84580-1-sashal@kernel.org>
References: <20250624041238.84580-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.141
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

[ Upstream commit f681c2aa8676a890eacc84044717ab0fd26e058f ]

put_unused_fd() doesn't free the installed file, if we've already done
fd_install().  So we need to also free the sync_file.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Patchwork: https://patchwork.freedesktop.org/patch/653583/
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis, **YES**, this commit should be backported to
stable kernel trees.

## Extensive Explanation:

This commit fixes a **resource leak** in the MSM DRM driver's submit
error path, which is a clear bug that affects users and meets the stable
tree criteria.

### The Bug:

Looking at the code changes in `msm_gem_submit.c`:

1. **Before the fix**: When an error occurs after `fd_install()` has
   been called (line 865 in the context), the error path only calls
   `put_unused_fd(out_fence_fd)` at line 895-896.

2. **The problem**: As noted in the commit message, `put_unused_fd()`
   doesn't free the installed file if `fd_install()` has already been
   executed. The `sync_file` structure created by `sync_file_create()`
   (line 861) contains a file reference that needs to be released with
   `fput()`.

3. **The fix**: The patch adds proper cleanup by:
   - Moving `sync_file` declaration to function scope (line 661)
   - Adding proper cleanup in the error path (lines 895-898) that calls
     both `put_unused_fd()` AND `fput(sync_file->file)` when needed

### Why This Is a Good Backport Candidate:

1. **Clear Bug Fix**: This fixes a resource leak that can accumulate
   over time as applications hit error conditions during fence
   submission.

2. **Small and Contained**: The fix is minimal - just 5 lines of actual
   code changes that properly clean up resources.

3. **No Architectural Changes**: This doesn't introduce new features or
   change any APIs - it simply fixes error handling.

4. **Similar to Previous Backported Fixes**: Looking at similar commit
   #3 ("drm/msm: Fix submit error-path leaks") which was marked for
   backporting, this follows the same pattern of fixing resource leaks
   in error paths.

5. **Low Risk**: The change only affects error paths and adds proper
   cleanup that was missing. It cannot break the normal success path.

6. **Documentation Confirms**: The sync_file.c documentation (line
   62-63) explicitly states that sync_files should be released with
   `fput(sync_file->file)`, confirming this is the correct fix.

### Pattern Analysis:

Comparing with the similar commits provided:
- Similar commits #1, #2, and #4 were NOT backported (they were general
  code improvements or non-critical changes)
- Similar commits #3 and #5 WERE backported (they fixed actual resource
  leaks or initialization failures)

This commit clearly falls into the same category as #3 and #5 - fixing
an actual resource leak that can impact system stability over time.

The leak occurs whenever:
1. A sync_file is successfully created
2. fd_install() succeeds
3. But then a subsequent error occurs before the submit completes

Without this fix, each occurrence leaks a file descriptor and associated
kernel memory, which could eventually exhaust resources in systems with
heavy GPU usage that encounter errors.

 drivers/gpu/drm/msm/msm_gem_submit.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 4ee6aeb23c512..572dd662e8095 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -724,6 +724,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
+	struct sync_file *sync_file = NULL;
 	int out_fence_fd = -1;
 	bool has_ww_ticket = false;
 	unsigned i;
@@ -927,7 +928,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (ret == 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
-		struct sync_file *sync_file = sync_file_create(submit->user_fence);
+		sync_file = sync_file_create(submit->user_fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
 		} else {
@@ -958,8 +959,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 out_unlock:
 	mutex_unlock(&queue->lock);
 out_post_unlock:
-	if (ret && (out_fence_fd >= 0))
+	if (ret && (out_fence_fd >= 0)) {
 		put_unused_fd(out_fence_fd);
+		if (sync_file)
+			fput(sync_file->file);
+	}
 
 	if (!IS_ERR_OR_NULL(submit)) {
 		msm_gem_submit_put(submit);
-- 
2.39.5


