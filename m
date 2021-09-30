Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3F541DBAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 16:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351567AbhI3OCK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 10:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351624AbhI3OCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 10:02:09 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97894C06176C
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:26 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y26so25737668lfa.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 07:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gL53R+XdMCTb/eRhUK3++4AIECbyYkUaMebTCoLD6nQ=;
        b=J6jzfV3mAuA8nc0fewfvt6KLGVXlOEyRqkQwYLopC7172HNq6KB6hmsKLFke1Cp21x
         zGrLYxD/1J9R8HXUfRVPbghVaGlvriFle0634k4b4DvAi5+BvEWCopwlWiZgGqBCW0/n
         2UhRdV1yUWQGvghdhHVJ3gEwXkJehXNc19RxCEeXTnl/T//JYwSvw/iD/mhnPBdjGcsi
         bPlTwIDmHF0CyXY5WbQIIEmCW09zRWWAFazmjWfexvJUpRebdymAPvhebYSi1EhCiFnR
         D6nWS4snul0Fbs25tQMHkUxfl9fffsrPmW/AL1fClcWbp22PYumQz55HGSN2hH1lnKZu
         h8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gL53R+XdMCTb/eRhUK3++4AIECbyYkUaMebTCoLD6nQ=;
        b=gyY40uhtz8BI+ReUsOLdtF00nsNo61hexG5YEjKSYF69SZQxoqzKhRuOX36DjJUQzR
         D6ae/ItmGZUsQ5C+VedBCRbhi08QQg5xVrUysz5mJl95erVInLfgpJ1xl+nVFBIXWKR/
         AQ6+ULOUIfayBl1PUxkK5IVAl/GIS+19+B4VTJYV5U6vngIA+g1Tcst0keHxcGmM1m3c
         GwZHH2slY7oWxA8/w0IQIhZt0EOXmwoWSnDYi1/AAc2kDrLeCNXiARVC4vm6UBMv2eEP
         jtJDFGzlFQk3/BNXssq3saoALBi9RYcAqqaZ1h0I3HfnPa5LMXTs8G+i/doIOe/Jcf++
         0HIQ==
X-Gm-Message-State: AOAM531f7JdfWjkoX9F3nnW1NsM5il4yBspL52EQScfV+rI7ge9jpSmf
        OSGF0txfcvYwdp3C24NKV+vsXDWCNHYFjg==
X-Google-Smtp-Source: ABdhPJyFPfkn+twETssQFXkBw8VaStg+qrDcC4ozmbl5fJDs9pwQPV9i9y2HNG88gQvSUoRa2aQPoA==
X-Received: by 2002:a05:6512:513:: with SMTP id o19mr6201016lfb.31.1633010421577;
        Thu, 30 Sep 2021 07:00:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o7sm380481lfr.216.2021.09.30.07.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 07:00:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 02/11] drm/msm/dpu: remove pipe_qos_cfg from struct dpu_plane
Date:   Thu, 30 Sep 2021 16:59:53 +0300
Message-Id: <20210930140002.308628-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
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
index 5e0d06f26e53..88d726133b8b 100644
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
2.33.0

