Return-Path: <linux-arm-msm+bounces-62140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C4AAE5AC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F29F71B64B52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 04:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 486952222D2;
	Tue, 24 Jun 2025 04:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmn7aQRx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CA835975;
	Tue, 24 Jun 2025 04:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750738283; cv=none; b=sLhszKz0XrBq7AXVEeioOae4VmF2q7xzBFvkEbAiUKo1qNp1MbGNk7qTlwByRJLowBRfHhbTwZsh26GQ0d8LIVdvtG+SSXPqAtur51Lq918SD7uOq3O5/FNi8IocB3kLGH/ELr5a+JDv9spxxacXfyXy2bxwyPU04IID2g5jcB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750738283; c=relaxed/simple;
	bh=f3NnBVxj0CUuw6eBSZydNBtjUGGr/VOYOCIFyq4GcuE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nn7ZjxeTd+lbywy4n4OLEzLAug3lcf3I3VzYfJNbnA6tig469T84o3Jap5y9137yQguKXCzcoCr2vffBcwqwPHZv75plIcsWSthOrYdbrfA9DKhLtBp6DBqRyggSdThXnPygq8CEUjTmdliK79ewG5SqhDXzM8xlkqXz4DVZYys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmn7aQRx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49463C4CEF4;
	Tue, 24 Jun 2025 04:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750738282;
	bh=f3NnBVxj0CUuw6eBSZydNBtjUGGr/VOYOCIFyq4GcuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lmn7aQRx7dfZFfHCUjXOfM3GINX9q6BQq44KXVrG9apNPNoJrs8gUYnuM2JAmu9PE
	 D1Vo9pWRQ31C4RGAI1YBxQtzJj5L/w31t40w9T/4YoaUW6Nmv60QixxS2/+rhDFsqP
	 2elnOGCJp9dM+Kvnw21hcl1vK2Nhg0rJub99wVlRcSomz5VvhO2bVe6a/NlYsQPafn
	 O/4dMftyUWJ6aVmubr0eZWMGStleyI/3VL6TOj21rKU778VzKKsemkrL9XzyqxkpSu
	 +t9YXtNkyTueYyAxb0WnX+XvQDvg21268zmmYT8CmIJguaV7BEGwB4cQLLvya109iV
	 RPtf+5lYuRbEw==
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
Subject: [PATCH AUTOSEL 6.15 03/20] drm/msm: Fix another leak in the submit error path
Date: Tue, 24 Jun 2025 00:11:02 -0400
Message-Id: <20250624041120.83191-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624041120.83191-1-sashal@kernel.org>
References: <20250624041120.83191-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15.3
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
index b2aeaecaa39b3..d4f71bb54e84c 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -658,6 +658,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_ringbuffer *ring;
 	struct msm_submit_post_dep *post_deps = NULL;
 	struct drm_syncobj **syncobjs_to_reset = NULL;
+	struct sync_file *sync_file = NULL;
 	int out_fence_fd = -1;
 	unsigned i;
 	int ret;
@@ -867,7 +868,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	}
 
 	if (ret == 0 && args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
-		struct sync_file *sync_file = sync_file_create(submit->user_fence);
+		sync_file = sync_file_create(submit->user_fence);
 		if (!sync_file) {
 			ret = -ENOMEM;
 		} else {
@@ -901,8 +902,11 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
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


