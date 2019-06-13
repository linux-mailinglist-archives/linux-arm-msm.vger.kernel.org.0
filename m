Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ABB743AD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731795AbfFMPXx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:23:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:50728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731762AbfFMMX0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 08:23:26 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1C0321721;
        Thu, 13 Jun 2019 12:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560428605;
        bh=d0PJ95f4N7PTABZyDsptak3DeR7K75DhGSWEg6Sjgfk=;
        h=Date:From:To:Cc:Subject:From;
        b=z2l/VLRDPt4BgR0OK4Ltv1gekyYDPkRUrw57Czj+rXnJjuD74htIKIGNyuW2M++Yw
         fh9OX4/19aGkkmLE6/9ZoPB6gvzLBLLS+u1Es3DC3zbAu2POgoXnMy3bH/czgf/c3E
         zs4Lx5pICXznGVCA6RHxOQGMSuN2T+pW+JXCirfg=
Date:   Thu, 13 Jun 2019 14:23:23 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Fritz Koenig <frkoenig@google.com>,
        Chandan Uddaraju <chandanu@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] msm: dpu1: no need to check return value of debugfs_create
 functions
Message-ID: <20190613122323.GB30577@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Bruce Wang <bzwang@chromium.org>
Cc: Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: Fritz Koenig <frkoenig@google.com>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 12 +++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  6 +-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      |  4 ----
 7 files changed, 4 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 9f20f397f77d..33cd4ee38f67 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -506,8 +506,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 	struct dentry *entry;
 
 	entry = debugfs_create_dir("core_perf", parent);
-	if (IS_ERR_OR_NULL(entry))
-		return -EINVAL;
 
 	debugfs_create_u64("max_core_clk_rate", 0600, entry,
 			&perf->max_core_clk_rate);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index dfdfa766da8f..e92c2c2bb23f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1266,10 +1266,7 @@ static int _dpu_crtc_init_debugfs(struct drm_crtc *crtc)
 
 	dpu_crtc->debugfs_root = debugfs_create_dir(dpu_crtc->name,
 			crtc->dev->primary->debugfs_root);
-	if (!dpu_crtc->debugfs_root)
-		return -ENOMEM;
 
-	/* don't error check these */
 	debugfs_create_file("status", 0400,
 			dpu_crtc->debugfs_root,
 			dpu_crtc, &debugfs_status_fops);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 82bf16d61a45..ea99643a3d6f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1985,8 +1985,6 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 	/* create overall sub-directory for the encoder */
 	dpu_enc->debugfs_root = debugfs_create_dir(name,
 			drm_enc->dev->primary->debugfs_root);
-	if (!dpu_enc->debugfs_root)
-		return -ENOMEM;
 
 	/* don't error check these */
 	debugfs_create_file("status", 0600,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 885bf88afa3e..bcd24509403a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -142,8 +142,6 @@ static void dpu_debugfs_danger_init(struct dpu_kms *dpu_kms,
 		struct dentry *parent)
 {
 	struct dentry *entry = debugfs_create_dir("danger", parent);
-	if (IS_ERR_OR_NULL(entry))
-		return;
 
 	debugfs_create_file("danger_status", 0600, entry,
 			dpu_kms, &dpu_debugfs_danger_stats_fops);
@@ -218,17 +216,16 @@ void dpu_debugfs_setup_regset32(struct dpu_debugfs_regset32 *regset,
 	}
 }
 
-void *dpu_debugfs_create_regset32(const char *name, umode_t mode,
+void dpu_debugfs_create_regset32(const char *name, umode_t mode,
 		void *parent, struct dpu_debugfs_regset32 *regset)
 {
 	if (!name || !regset || !regset->dpu_kms || !regset->blk_len)
-		return NULL;
+		return;
 
 	/* make sure offset is a multiple of 4 */
 	regset->offset = round_down(regset->offset, 4);
 
-	return debugfs_create_file(name, mode, parent,
-			regset, &dpu_fops_regset32);
+	debugfs_create_file(name, mode, parent, regset, &dpu_fops_regset32);
 }
 
 static int _dpu_debugfs_init(struct dpu_kms *dpu_kms)
@@ -240,10 +237,7 @@ static int _dpu_debugfs_init(struct dpu_kms *dpu_kms)
 		return -EINVAL;
 
 	entry = debugfs_create_dir("debug", dpu_kms->dev->primary->debugfs_root);
-	if (IS_ERR_OR_NULL(entry))
-		return -ENODEV;
 
-	/* allow root to be NULL */
 	debugfs_create_x32(DPU_DEBUGFS_HWMASKNAME, 0600, entry, p);
 
 	dpu_debugfs_danger_init(dpu_kms, entry);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 31e9ef96ca5d..e9f998344838 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -197,12 +197,8 @@ void dpu_debugfs_setup_regset32(struct dpu_debugfs_regset32 *regset,
  * @mode:   File mode within debugfs
  * @parent: Parent directory entry within debugfs, can be NULL
  * @regset: Pointer to persistent register block definition
- *
- * Return: dentry pointer for newly created file, use either debugfs_remove()
- *         or debugfs_remove_recursive() (on a parent directory) to remove the
- *         file
  */
-void *dpu_debugfs_create_regset32(const char *name, umode_t mode,
+void dpu_debugfs_create_regset32(const char *name, umode_t mode,
 		void *parent, struct dpu_debugfs_regset32 *regset);
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ce1a555e1f31..36c2b38805c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1329,9 +1329,6 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 		debugfs_create_dir(pdpu->pipe_name,
 				plane->dev->primary->debugfs_root);
 
-	if (!pdpu->debugfs_root)
-		return -ENOMEM;
-
 	/* don't error check these */
 	debugfs_create_x32("features", 0600,
 			pdpu->debugfs_root, &pdpu->features);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index ef753ea9c499..a0d5ff8624fd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -318,8 +318,6 @@ void dpu_debugfs_vbif_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
 	int i, j;
 
 	entry = debugfs_create_dir("vbif", debugfs_root);
-	if (IS_ERR_OR_NULL(entry))
-		return;
 
 	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
 		struct dpu_vbif_cfg *vbif = &dpu_kms->catalog->vbif[i];
@@ -327,8 +325,6 @@ void dpu_debugfs_vbif_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
 		snprintf(vbif_name, sizeof(vbif_name), "%d", vbif->id);
 
 		debugfs_vbif = debugfs_create_dir(vbif_name, entry);
-		if (IS_ERR_OR_NULL(debugfs_vbif))
-			continue;
 
 		debugfs_create_u32("features", 0600, debugfs_vbif,
 			(u32 *)&vbif->features);
-- 
2.22.0

