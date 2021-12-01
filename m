Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69F82465928
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Dec 2021 23:26:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353523AbhLAWaJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Dec 2021 17:30:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353609AbhLAWaA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Dec 2021 17:30:00 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3062AC061748
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Dec 2021 14:26:39 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id l7so51074331lja.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Dec 2021 14:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0qHFC39MMQLTtRc5sw1zcOnT/8/n0zap/VYN85e7NQY=;
        b=xQyZ/T3V3d+B4MyJooZjnOvbi3IkbJ/m6Tdy99ST4t37kGSiJQ7wVmPxPLQvfKg9q3
         aXAZZvwuAJ7VKVNgBRmx8U4eIgcT7h7+rYRM5UrzZLcmfun4Po+6yWdA6qGFhb91rQsA
         MnwmrXVmBqlIeYp+uBhTOpmArpG9mOsLO4+LD0IFB2l8JJ4s2TZ1ukvCNRTx3MxfkzYM
         QTvDNI2CAwzxeMU/sCJZHzzR3RBQKUTdzDtqIwAt3ZFDfdjp++DY40LKCpRhq0fduTPh
         DgK37yjhoFA/sm5WasiLNDwWkWNUPOHukhxrkN81g/3LYwxuDtr3+1sulGZfPA1VTRHm
         QCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0qHFC39MMQLTtRc5sw1zcOnT/8/n0zap/VYN85e7NQY=;
        b=hs+i/L4LOBvLuEXXy8sinKYTHSgfQkgnxS5guGrBVuYcneEHQ3kAqCeklQj30q70CD
         GQPMEt/3Wl+MPXWeDCMRorK/aQKUuuecmYTLS6nGJAf7804MP3+XoklIRSXZU9e64wSB
         xKv1c7nlD+wLDxB72K7SkjBeulFhRWU/AmQ8ewz9xwkcKP6UbjCKGpANR3oMnUYEDowc
         gQbBat+qnzXuH2ZV0za/KnH5opOQhd8J9Gg5NZKimlVOWkOT6zz1d+K3kFv1Ailzn4CB
         fMNA2ieaLkGMH97JrZ3lAy5QKbxPWJ5qrbJ3x7ppRNf+iYKLgrD3ZTv43lncBosZhzy5
         HGdw==
X-Gm-Message-State: AOAM5332Zc0perjScIpgLExyzx7OJg8cg+T03+KwsA6n0Jl7Bdde2of4
        Rv0CRJSW7yHMrpZ+wEskK+2mGw==
X-Google-Smtp-Source: ABdhPJxRporPuQZC9x+/lx6gh6sO0xKVQU1VPaO1NPOEFoAiAZmNsAxMzFa9ABdlZ6VliIsYF2zr8A==
X-Received: by 2002:a2e:3304:: with SMTP id d4mr8026724ljc.377.1638397597359;
        Wed, 01 Dec 2021 14:26:37 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u7sm117004lfs.144.2021.12.01.14.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 14:26:37 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 1/8] drm/msm/dpu: move disable_danger out of plane subdir
Date:   Thu,  2 Dec 2021 01:26:26 +0300
Message-Id: <20211201222633.2476780-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The disable_danger debugfs file is not related to a single plane.
Instead it is used by all registered planes. Move it from plane subtree
to the global subtree next to danger_status and safe_status files,
so that the new file supplements them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   | 70 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 74 +----------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ++
 3 files changed, 77 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 6c457c419412..259d438bc6e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -101,6 +101,73 @@ static int dpu_debugfs_safe_stats_show(struct seq_file *s, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(dpu_debugfs_safe_stats);
 
+static ssize_t _dpu_plane_danger_read(struct file *file,
+			char __user *buff, size_t count, loff_t *ppos)
+{
+	struct dpu_kms *kms = file->private_data;
+	int len;
+	char buf[40];
+
+	len = scnprintf(buf, sizeof(buf), "%d\n", !kms->has_danger_ctrl);
+
+	return simple_read_from_buffer(buff, count, ppos, buf, len);
+}
+
+static void _dpu_plane_set_danger_state(struct dpu_kms *kms, bool enable)
+{
+	struct drm_plane *plane;
+
+	drm_for_each_plane(plane, kms->dev) {
+		if (plane->fb && plane->state) {
+			dpu_plane_danger_signal_ctrl(plane, enable);
+			DPU_DEBUG("plane:%d img:%dx%d ",
+				plane->base.id, plane->fb->width,
+				plane->fb->height);
+			DPU_DEBUG("src[%d,%d,%d,%d] dst[%d,%d,%d,%d]\n",
+				plane->state->src_x >> 16,
+				plane->state->src_y >> 16,
+				plane->state->src_w >> 16,
+				plane->state->src_h >> 16,
+				plane->state->crtc_x, plane->state->crtc_y,
+				plane->state->crtc_w, plane->state->crtc_h);
+		} else {
+			DPU_DEBUG("Inactive plane:%d\n", plane->base.id);
+		}
+	}
+}
+
+static ssize_t _dpu_plane_danger_write(struct file *file,
+		    const char __user *user_buf, size_t count, loff_t *ppos)
+{
+	struct dpu_kms *kms = file->private_data;
+	int disable_panic;
+	int ret;
+
+	ret = kstrtouint_from_user(user_buf, count, 0, &disable_panic);
+	if (ret)
+		return ret;
+
+	if (disable_panic) {
+		/* Disable panic signal for all active pipes */
+		DPU_DEBUG("Disabling danger:\n");
+		_dpu_plane_set_danger_state(kms, false);
+		kms->has_danger_ctrl = false;
+	} else {
+		/* Enable panic signal for all active pipes */
+		DPU_DEBUG("Enabling danger:\n");
+		kms->has_danger_ctrl = true;
+		_dpu_plane_set_danger_state(kms, true);
+	}
+
+	return count;
+}
+
+static const struct file_operations dpu_plane_danger_enable = {
+	.open = simple_open,
+	.read = _dpu_plane_danger_read,
+	.write = _dpu_plane_danger_write,
+};
+
 static void dpu_debugfs_danger_init(struct dpu_kms *dpu_kms,
 		struct dentry *parent)
 {
@@ -110,6 +177,9 @@ static void dpu_debugfs_danger_init(struct dpu_kms *dpu_kms,
 			dpu_kms, &dpu_debugfs_danger_stats_fops);
 	debugfs_create_file("safe_status", 0600, entry,
 			dpu_kms, &dpu_debugfs_safe_stats_fops);
+	debugfs_create_file("disable_danger", 0600, entry,
+			dpu_kms, &dpu_plane_danger_enable);
+
 }
 
 static int _dpu_debugfs_show_regset32(struct seq_file *s, void *data)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ca190d92f0d5..6ea4db061c9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1350,7 +1350,7 @@ static void dpu_plane_reset(struct drm_plane *plane)
 }
 
 #ifdef CONFIG_DEBUG_FS
-static void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
+void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
@@ -1363,73 +1363,6 @@ static void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
-static ssize_t _dpu_plane_danger_read(struct file *file,
-			char __user *buff, size_t count, loff_t *ppos)
-{
-	struct dpu_kms *kms = file->private_data;
-	int len;
-	char buf[40];
-
-	len = scnprintf(buf, sizeof(buf), "%d\n", !kms->has_danger_ctrl);
-
-	return simple_read_from_buffer(buff, count, ppos, buf, len);
-}
-
-static void _dpu_plane_set_danger_state(struct dpu_kms *kms, bool enable)
-{
-	struct drm_plane *plane;
-
-	drm_for_each_plane(plane, kms->dev) {
-		if (plane->fb && plane->state) {
-			dpu_plane_danger_signal_ctrl(plane, enable);
-			DPU_DEBUG("plane:%d img:%dx%d ",
-				plane->base.id, plane->fb->width,
-				plane->fb->height);
-			DPU_DEBUG("src[%d,%d,%d,%d] dst[%d,%d,%d,%d]\n",
-				plane->state->src_x >> 16,
-				plane->state->src_y >> 16,
-				plane->state->src_w >> 16,
-				plane->state->src_h >> 16,
-				plane->state->crtc_x, plane->state->crtc_y,
-				plane->state->crtc_w, plane->state->crtc_h);
-		} else {
-			DPU_DEBUG("Inactive plane:%d\n", plane->base.id);
-		}
-	}
-}
-
-static ssize_t _dpu_plane_danger_write(struct file *file,
-		    const char __user *user_buf, size_t count, loff_t *ppos)
-{
-	struct dpu_kms *kms = file->private_data;
-	int disable_panic;
-	int ret;
-
-	ret = kstrtouint_from_user(user_buf, count, 0, &disable_panic);
-	if (ret)
-		return ret;
-
-	if (disable_panic) {
-		/* Disable panic signal for all active pipes */
-		DPU_DEBUG("Disabling danger:\n");
-		_dpu_plane_set_danger_state(kms, false);
-		kms->has_danger_ctrl = false;
-	} else {
-		/* Enable panic signal for all active pipes */
-		DPU_DEBUG("Enabling danger:\n");
-		kms->has_danger_ctrl = true;
-		_dpu_plane_set_danger_state(kms, true);
-	}
-
-	return count;
-}
-
-static const struct file_operations dpu_plane_danger_enable = {
-	.open = simple_open,
-	.read = _dpu_plane_danger_read,
-	.write = _dpu_plane_danger_write,
-};
-
 static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
@@ -1498,11 +1431,6 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
 			pdpu->debugfs_root,
 			(u32 *) &sblk->danger_vblank);
 
-	debugfs_create_file("disable_danger",
-			0600,
-			pdpu->debugfs_root,
-			kms, &dpu_plane_danger_enable);
-
 	return 0;
 }
 #else
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 52792526e904..7667b1f81bd4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -132,4 +132,10 @@ void dpu_plane_clear_multirect(const struct drm_plane_state *drm_state);
 int dpu_plane_color_fill(struct drm_plane *plane,
 		uint32_t color, uint32_t alpha);
 
+#ifdef CONFIG_DEBUG_FS
+void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable);
+#else
+static inline void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable) {}
+#endif
+
 #endif /* _DPU_PLANE_H_ */
-- 
2.33.0

