Return-Path: <linux-arm-msm+bounces-65107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D8BB069DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 01:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AC7A189ED40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 23:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD5225D546;
	Tue, 15 Jul 2025 23:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gc8tB21s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ABA4A3C;
	Tue, 15 Jul 2025 23:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752622063; cv=none; b=upDomQD93/QxtcHLYUsNXqzJmmSVkqlfRFFfiz4nYp2ZLBkt5FMUW1u3uehXrs6M2xmMkH7ccUWo5rCcaV441NxIObS2T2OhwI3hWtMCIHvaj2vWoJZmurM+M9XEBrFXLCrGyQA8Uhv4u+pN7JbQX0/lHZqkRn+EcWj7lG09TxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752622063; c=relaxed/simple;
	bh=gNd6GCMleRz26fso+KqYQ5eY2OU5Fo6/ujKhQhRqh2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GIqFpuedMzDNtbths6nn3zwWrD/XTI5NuMCHOJD+lLFhFFRpBSJIuOc0Bii1o3K/4lnuD7gyWNcR5kt/yAbEZxRXy6sRBay/yAHXyVmOjSd3yQZblSlpPKRfXThj66nK0cXpU148VM4r10MVmKQyA+rm9rUWTWwcUMrHU5BIYpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gc8tB21s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E50C4CEE3;
	Tue, 15 Jul 2025 23:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752622063;
	bh=gNd6GCMleRz26fso+KqYQ5eY2OU5Fo6/ujKhQhRqh2M=;
	h=From:Date:Subject:To:Cc:From;
	b=Gc8tB21sZWryjJ0k+7SgkAFC09gHkR8Xdxh78TC8va9FyM/A0JapOGAFVaShybbYz
	 VVGUpQ4qMqKNfni8pi1yfqL+IevIFVPZXHcz/fgCziWPdEcYTcg7QG9tXX7JA7vXbK
	 Et00P0E7AVHVNgifpoAA7/JqIfsodfsg10BP7tdn//pUCk3IvAzY0deNmJkYji9xjk
	 dYNHHJJhovh1lrw6mLn9PJstGu0kfTyguD7gddK7ruMawQbBz6c0UEZwLWbtfBOs5G
	 YiBqyuWedsbtXnh0fkGnRlVOUOMk860Yyu9VkItSzYY1r9BfxHbs/eogXk1MEG9KK0
	 VXqGQCzOzuMCw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 15 Jul 2025 16:27:35 -0700
Subject: [PATCH] drm/msm/dpu: Initialize crtc_state to NULL in
 dpu_plane_virtual_atomic_check()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-drm-msm-fix-const-uninit-warning-v1-1-d6a366fd9a32@kernel.org>
X-B4-Tracking: v=1; b=H4sIAObjdmgC/x2NywqDQAxFf0WybsAZ0WJ/pXShY0azmFgS+wDx3
 w3uzoHDvTsYKZPBo9pB6cvGq7iEWwVpGWQm5MkdYh3b+h5anLRgsYKZ/5hWsQ0/wsIb/gZ1mDG
 OfZMo9zmkDnzmreTtdfF8HccJ+AlDU3IAAAA=
X-Change-ID: 20250715-drm-msm-fix-const-uninit-warning-2b93cef9f1c6
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2596; i=nathan@kernel.org;
 h=from:subject:message-id; bh=gNd6GCMleRz26fso+KqYQ5eY2OU5Fo6/ujKhQhRqh2M=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBllj99UrDTWSPsXnScxcfG5K3fVTNk/loefZYt5w5GuN
 pXhk19CRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZiI4FtGhtOrj13lSzAwu3r/
 SdPKTtYnq3fd6tk172lK3Yw0+RtfnW0ZGabPdq+7aLvgdeTj6OOcnzoffWRdt3/ng19vJjWcL+p
 3O84KAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

After a recent change in clang to expose uninitialized warnings from
const variables and pointers [1], there is a warning around crtc_state
in dpu_plane_virtual_atomic_check():

  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1145:6: error: variable 'crtc_state' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
   1145 |         if (plane_state->crtc)
        |             ^~~~~~~~~~~~~~~~~
  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1149:58: note: uninitialized use occurs here
   1149 |         ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
        |                                                                 ^~~~~~~~~~
  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1145:2: note: remove the 'if' if its condition is always true
   1145 |         if (plane_state->crtc)
        |         ^~~~~~~~~~~~~~~~~~~~~~
   1146 |                 crtc_state = drm_atomic_get_new_crtc_state(state,
  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1139:35: note: initialize the variable 'crtc_state' to silence this warning
   1139 |         struct drm_crtc_state *crtc_state;
        |                                          ^
        |                                           = NULL

Initialize crtc_state to NULL like other places in the driver do, so
that it is consistently initialized.

Cc: stable@vger.kernel.org
Closes: https://github.com/ClangBuiltLinux/linux/issues/2106
Fixes: 774bcfb73176 ("drm/msm/dpu: add support for virtual planes")
Link: https://github.com/llvm/llvm-project/commit/2464313eef01c5b1edf0eccf57a32cdee01472c7 [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 421138bc3cb7..30ff21c01a36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1136,7 +1136,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *old_plane_state =
 		drm_atomic_get_old_plane_state(state, plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
-	struct drm_crtc_state *crtc_state;
+	struct drm_crtc_state *crtc_state = NULL;
 	int ret;
 
 	if (IS_ERR(plane_state))

---
base-commit: d3deabe4c619875714b9a844b1a3d9752dbae1dd
change-id: 20250715-drm-msm-fix-const-uninit-warning-2b93cef9f1c6

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


