Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A914A3BB4B3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 03:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbhGEB1y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 21:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhGEB1x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 21:27:53 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBFF0C061574
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 18:25:16 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id r26so12024436lfp.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 18:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4KVDEGIRYoNTWX8/d5GJWbic+veghDN3TQYK8Yck/CQ=;
        b=H+Naqk62aAfK4qfTDoPm3w4LopChdohnepqofzKEUV6Ug0a4sVxs/AUmZPRM4NzdRe
         kABRa0wzk5DOTw6546gy7RTcRNKI9TRfccQBdanardWExHU97kcYzYMC387+atgsnm0a
         Erdydg7WjBLwChdku48JB3rhpnreGtDFkR+jrhzY6sRxzd71I1lHTAjytZgwJoSWKsTx
         +Ps/JROH4on0ze+qM9nTkSp/QXW+yK3mdc3DEvVs0Tm9P7h/JwrKppHflYyOGpSie1AT
         OJ2784XHiVjK7Z7iBfV/lAGl8UKHf6yKc9A3N7mOI2BYU1dnFEq5epeKdP6y8crGlf4q
         h7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4KVDEGIRYoNTWX8/d5GJWbic+veghDN3TQYK8Yck/CQ=;
        b=aVkPuvOlmU+SN55Ufe3AbXhJLmkbiqUWBV0GiK8vO7/UmhtRXi7csU6HArRTY7pTXd
         Zu5SO9lTkD1v4I0W6wAgNZtM9UKKGq/4u8XGtTB2PAigDnnr1G5LcHJcAuS6NSpUlknR
         DYFKqKVQBZmwdmrEiJ6FElxbR0vumlxaZ7yxEUKnGT8CSb+Jjy3vejpjtkNKTHnWTBH4
         5OsL1We8xueRVcfzDo0jusG8DIg7EK04SlffyuXPXM1/6IgKQj75oRKUE4HFbFvXwz6v
         O6nBuCsIZEBn3Tl+hrroSR8uZ5xs0VyI2Hw7uCMDaSsP2fGhAT3fWIZEP+dFI54CsgL7
         TU2A==
X-Gm-Message-State: AOAM532PARj7XyDlPOdn3r1uXITBsIRQi/8sJiyVTtIALc/wLFhy9jHT
        J8ZUMpoIQ98Es2XdpJglwM9ijQ==
X-Google-Smtp-Source: ABdhPJxpnl3Sm7qlkS/VVw9ijQ0vGUuGXLKa3dCgFfouhQN9uAQX9wi3FLS+1S5ACih4nC3qMhlZCQ==
X-Received: by 2002:a19:fc04:: with SMTP id a4mr1077736lfi.493.1625448315302;
        Sun, 04 Jul 2021 18:25:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c7sm1004345lfm.50.2021.07.04.18.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 18:25:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 11/22] drm/msm/dpu: don't cache pipe->cap->sblk in dpu_plane
Date:   Mon,  5 Jul 2021 04:21:04 +0300
Message-Id: <20210705012115.4179824-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Do not cache hw_pipe's sblk in dpu_plane. Use
pdpu->pipe_hw->cap->sblk directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 65446e8f5718..8f1fef2367cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -106,8 +106,6 @@ struct dpu_plane {
 	bool is_rt_pipe;
 	struct dpu_mdss_cfg *catalog;
 
-	const struct dpu_sspp_sub_blks *pipe_sblk;
-
 	/* debugfs related stuff */
 	struct dentry *debugfs_root;
 	struct dpu_debugfs_regset32 debugfs_src;
@@ -410,9 +408,9 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
 	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pipe_qos_cfg.creq_vblank = pdpu->pipe_sblk->creq_vblank;
+		pipe_qos_cfg.creq_vblank = pdpu->pipe_hw->cap->sblk->creq_vblank;
 		pipe_qos_cfg.danger_vblank =
-				pdpu->pipe_sblk->danger_vblank;
+				pdpu->pipe_hw->cap->sblk->danger_vblank;
 		pipe_qos_cfg.vblank_en = enable;
 	}
 
@@ -962,10 +960,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	min_scale = FRAC_16_16(1, pdpu->pipe_sblk->maxupscale);
+	min_scale = FRAC_16_16(1, pdpu->pipe_hw->cap->sblk->maxupscale);
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
-						  pdpu->pipe_sblk->maxdwnscale << 16,
+						  pdpu->pipe_hw->cap->sblk->maxdwnscale << 16,
 						  true, true);
 	if (ret) {
 		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
@@ -1573,15 +1571,8 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 		goto clean_sspp;
 	}
 
-	/* cache features mask for later */
-	pdpu->pipe_sblk = pdpu->pipe_hw->cap->sblk;
-	if (!pdpu->pipe_sblk) {
-		DPU_ERROR("[%u]invalid sblk\n", pipe);
-		goto clean_sspp;
-	}
-
-	format_list = pdpu->pipe_sblk->format_list;
-	num_formats = pdpu->pipe_sblk->num_formats;
+	format_list = pdpu->pipe_hw->cap->sblk->format_list;
+	num_formats = pdpu->pipe_hw->cap->sblk->num_formats;
 
 	ret = drm_universal_plane_init(dev, plane, 0xff, &dpu_plane_funcs,
 				format_list, num_formats,
-- 
2.30.2

