Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572F33B31E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 16:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhFXPAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 11:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231194AbhFXPAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 11:00:01 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31066C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:41 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id p7so10824960lfg.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 07:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TUMTyMrUgUh3fG+Mf/N14gZsUnvHUSJ7GKGw9bXuGME=;
        b=H+vdYyPBWiB8TwBlVQ9c9kigQxYYNQ4po2AiS7Re2WrRVB4gcshURhKZkRxutSThok
         a3y5HHeMpmde9l0EM7w7l8Z62CBAHxUXPEml6i7HT/UxdB+z2AnqCUPzbU9ozErm4R8u
         xHmxICBuEkYEg0ciWlUvthkZJGSB8ABnrENkvHhf2VWGBSGlLJt5h49PpTyCpJlAwF/l
         Ksm5RdAVBE1uPVhrRcAP3UM+FOxiCFeRrArm/Snt4cr+tA/YavSRmKq3k5gXAJd0/F6k
         RL6np6Qvn0PnfNTeEC0x5DuJBZaEz3J62Q6Y5J310gLALrGlhzLF2lJsLFrlBQgxaA6X
         0ONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TUMTyMrUgUh3fG+Mf/N14gZsUnvHUSJ7GKGw9bXuGME=;
        b=PTXwYiCDBq7JQyg8uegnUjGJnD4kRNF9cQvdxowNdcdFTn2suEFrZ15ltPDfhZ7nf0
         OORXA0OEX7h0nZq2LVWLu8gnwPxHbpfkKHI70L9Qm3W4E6zhiYN29TmfxQnlPVbsasB5
         wotynNhNThg1uyAcrU2/K6y0c0EouevLiuGh7FijpD2JXNTiWh0A/dBoAUAUy8UUZH6X
         VKDdQGilxSGopapv16+lEC2jN7oCj42RLXAqlMU7DRLPbgw+3jgFpu2nxCs9D/Ie0BCy
         h3Itq8NROWurezYyozXHV4aXz+dWlIDKMHXcTwKX1ZV2YcegJ8+519kSp7uZa3I5c6N5
         SeWw==
X-Gm-Message-State: AOAM532SuPa5OWAi+W92mBk1i5/XvKYKy4u7Ty46XiQ9Ce6RPg5dXdVL
        Zlh6MjjfZhvNo6/4nIZfoo3rnQ==
X-Google-Smtp-Source: ABdhPJwZYfaZq9g67O8kB23wJn7r4gSb3QMfQgJ0mtnGmHaAZp5sFCA48V5qApRV9+z2O9EnnbFQPQ==
X-Received: by 2002:a05:6512:44b:: with SMTP id y11mr4214713lfk.84.1624546659585;
        Thu, 24 Jun 2021 07:57:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 07:57:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 02/17] drm/msm/dpu: remove pipe_qos_cfg from struct dpu_plane
Date:   Thu, 24 Jun 2021 17:57:18 +0300
Message-Id: <20210624145733.2561992-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The pipe_qos_cfg is used only in _dpu_plane_set_qos_ctrl(), so remove it
from the dpu_plane struct and allocate it on stack when necessary.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 30 ++++++++++++-----------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1e2c53a3f47b..20ff1832c958 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -105,7 +105,6 @@ struct dpu_plane {
 
 	struct dpu_hw_pipe *pipe_hw;
 	struct dpu_hw_pipe_cfg pipe_cfg;
-	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
 	uint32_t color_fill;
 	bool is_error;
 	bool is_rt_pipe;
@@ -422,38 +421,41 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 	bool enable, u32 flags)
 {
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_hw_pipe_qos_cfg pipe_qos_cfg;
+
+	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
 	if (flags & DPU_PLANE_QOS_VBLANK_CTRL) {
-		pdpu->pipe_qos_cfg.creq_vblank = pdpu->pipe_sblk->creq_vblank;
-		pdpu->pipe_qos_cfg.danger_vblank =
+		pipe_qos_cfg.creq_vblank = pdpu->pipe_sblk->creq_vblank;
+		pipe_qos_cfg.danger_vblank =
 				pdpu->pipe_sblk->danger_vblank;
-		pdpu->pipe_qos_cfg.vblank_en = enable;
+		pipe_qos_cfg.vblank_en = enable;
 	}
 
 	if (flags & DPU_PLANE_QOS_VBLANK_AMORTIZE) {
 		/* this feature overrules previous VBLANK_CTRL */
-		pdpu->pipe_qos_cfg.vblank_en = false;
-		pdpu->pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
+		pipe_qos_cfg.vblank_en = false;
+		pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
 	}
 
 	if (flags & DPU_PLANE_QOS_PANIC_CTRL)
-		pdpu->pipe_qos_cfg.danger_safe_en = enable;
+		pipe_qos_cfg.danger_safe_en = enable;
 
 	if (!pdpu->is_rt_pipe) {
-		pdpu->pipe_qos_cfg.vblank_en = false;
-		pdpu->pipe_qos_cfg.danger_safe_en = false;
+		pipe_qos_cfg.vblank_en = false;
+		pipe_qos_cfg.danger_safe_en = false;
 	}
 
 	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d vb:%d pri[0x%x, 0x%x] is_rt:%d\n",
 		pdpu->pipe - SSPP_VIG0,
-		pdpu->pipe_qos_cfg.danger_safe_en,
-		pdpu->pipe_qos_cfg.vblank_en,
-		pdpu->pipe_qos_cfg.creq_vblank,
-		pdpu->pipe_qos_cfg.danger_vblank,
+		pipe_qos_cfg.danger_safe_en,
+		pipe_qos_cfg.vblank_en,
+		pipe_qos_cfg.creq_vblank,
+		pipe_qos_cfg.danger_vblank,
 		pdpu->is_rt_pipe);
 
 	pdpu->pipe_hw->ops.setup_qos_ctrl(pdpu->pipe_hw,
-			&pdpu->pipe_qos_cfg);
+			&pipe_qos_cfg);
 }
 
 /**
-- 
2.30.2

