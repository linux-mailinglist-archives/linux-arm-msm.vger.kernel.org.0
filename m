Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E1019A66D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2019 06:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725959AbfHWEBr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Aug 2019 00:01:47 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34335 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725951AbfHWEBr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Aug 2019 00:01:47 -0400
Received: by mail-pl1-f195.google.com with SMTP id d3so4793664plr.1;
        Thu, 22 Aug 2019 21:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EQmZs4bhJ2tusrHJ4UkPwecm4Xg1wfPEyrYFz1dn5S4=;
        b=sPEXTBIsaQKcLgyU4WEMUwBz/RSuyDYl4oSaO59GPlOIdYqfjnRtoK0h/hH0PME7Gk
         sqEMAgczQjBHrQaF929uzwqNNZ2xydaC+7KC/h446tHCUIkj/V8TfOmYcQpMkZGJjnEt
         l5GeD6YVDoJqxZQHpiLamyq4NTsHOcpQQMDTcagA0m+XZLAczsSCCeFtddF8WpeyNb1b
         ZwIT4zRmIIZIeQpE1TOb9EHOFWLg9ZTC39YaRo0n0HbPN2GVV0PVWzabbfLx+QJLaTkL
         1ew/8Jq0rvaQFbpmEAc9xNBhEeY0p9FLH/R5bSD48eqYOXsXfsRPMJ3RdaSgDGI6T37H
         lgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EQmZs4bhJ2tusrHJ4UkPwecm4Xg1wfPEyrYFz1dn5S4=;
        b=d3QF48+wXyCM78MSs03zrQX6a/PmNq/TKKqJPrpfyLoRZzE2lm4dXtrxby17KzzhMS
         bLNkMz0l9707ZAWneY+lz5kTHLMXB/UEd0jess3Chf5YQFwG9gUHQ/EciQ4RxI9KmKXa
         AD05N3hqI5nlHjofKKvVuIj4sJyMwSHScylv2LaUBIDR4XTWz2bzsjkrRXAAmjhDEJsN
         7+MZ5QKqyxnFQG4eSyFIr7i1wC2r/dwwyKF0ros+lRLp9TVzp5eXTy16WbG/1JCZXsFu
         JuNRAUy90Ku944FnhfzzpU5pfHJhpg82jj+yGPPeM8Xo0JQ6SLMVXIiYnucnPQ/I3mae
         S0AA==
X-Gm-Message-State: APjAAAUeQ58rPfYrjb4eYcKsw1xrwEj8gLyaTTOu1uZZUJE8WaVnedQn
        le80Q9eGUbhSWHRlXZLkA7M=
X-Google-Smtp-Source: APXvYqwMOBwXvwUojtN+YVxyNiMy6OhcAozyWm0kv1YbVbQgIW7Bjiei4TaZSxDordWkstYKsd6WSQ==
X-Received: by 2002:a17:902:581:: with SMTP id f1mr2355479plf.246.1566532905917;
        Thu, 22 Aug 2019 21:01:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:e554::6bd7])
        by smtp.gmail.com with ESMTPSA id r1sm678945pgv.70.2019.08.22.21.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2019 21:01:45 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Fritz Koenig <frkoenig@google.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/msm/dpu: remove some impossible error checking
Date:   Thu, 22 Aug 2019 21:00:10 -0700
Message-Id: <20190823040103.22289-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

I'm sure there is plenty more to remove.. this is just some of the ones
I noticed.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 19 -------------------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  3 ---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  5 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      | 10 ----------
 6 files changed, 45 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0e2f74163a16..ed677cf2e1af 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1428,12 +1428,6 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 	int pending_kickoff_cnt;
 	u32 ret = UINT_MAX;
 
-	if (!drm_enc || !phys) {
-		DPU_ERROR("invalid argument(s), drm_enc %d, phys_enc %d\n",
-				drm_enc != 0, phys != 0);
-		return;
-	}
-
 	if (!phys->hw_pp) {
 		DPU_ERROR("invalid pingpong hw\n");
 		return;
@@ -1566,11 +1560,6 @@ static void _dpu_encoder_kickoff_phys(struct dpu_encoder_virt *dpu_enc,
 	uint32_t i, pending_flush;
 	unsigned long lock_flags;
 
-	if (!dpu_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-
 	pending_flush = 0x0;
 
 	/* update pending counts and trigger kickoff ctl flush atomically */
@@ -1798,10 +1787,6 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc, bool async)
 	bool needs_hw_reset = false;
 	unsigned int i;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid args\n");
-		return;
-	}
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
 	trace_dpu_enc_prepare_kickoff(DRMID(drm_enc));
@@ -1837,10 +1822,6 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc, bool async)
 	ktime_t wakeup_time;
 	unsigned int i;
 
-	if (!drm_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
 	DPU_ATRACE_BEGIN("encoder_kickoff");
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 1b3ab909f367..2923b63d95fe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -720,9 +720,6 @@ static int dpu_encoder_phys_cmd_wait_for_vblank(
 static void dpu_encoder_phys_cmd_handle_post_kickoff(
 		struct dpu_encoder_phys *phys_enc)
 {
-	if (!phys_enc)
-		return;
-
 	/**
 	 * re-enable external TE, either for the first time after enabling
 	 * or if disabled for Autorefresh
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 5055a5eec869..737fe963a490 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -612,11 +612,6 @@ static void dpu_encoder_phys_vid_handle_post_kickoff(
 {
 	unsigned long lock_flags;
 
-	if (!phys_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-
 	/*
 	 * Video mode must flush CTL before enabling timing engine
 	 * Video encoders need to turn on their interfaces now
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index b2f7b0e886b5..179e8d52cadb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -102,9 +102,6 @@ static inline void dpu_hw_ctl_update_pending_flush(struct dpu_hw_ctl *ctx,
 
 static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
 {
-	if (!ctx)
-		return 0x0;
-
 	return ctx->pending_flush_mask;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 681955eb286f..b8d264bd15df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -490,11 +490,6 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	int primary_planes_idx = 0, cursor_planes_idx = 0, i, ret;
 	int max_crtc_count;
 
-	if (!dpu_kms || !dpu_kms->dev || !dpu_kms->dev->dev) {
-		DPU_ERROR("invalid dpu_kms\n");
-		return -EINVAL;
-	}
-
 	dev = dpu_kms->dev;
 	priv = dev->dev_private;
 	catalog = dpu_kms->catalog;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 8bc3aea7cd86..f98a882318d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -264,11 +264,6 @@ void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
 	struct dpu_hw_vbif *vbif;
 	u32 i, pnd, src;
 
-	if (!dpu_kms) {
-		DPU_ERROR("invalid argument\n");
-		return;
-	}
-
 	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
 		vbif = dpu_kms->hw_vbif[i];
 		if (vbif && vbif->ops.clear_errors) {
@@ -286,11 +281,6 @@ void dpu_vbif_init_memtypes(struct dpu_kms *dpu_kms)
 	struct dpu_hw_vbif *vbif;
 	int i, j;
 
-	if (!dpu_kms) {
-		DPU_ERROR("invalid argument\n");
-		return;
-	}
-
 	for (i = 0; i < ARRAY_SIZE(dpu_kms->hw_vbif); i++) {
 		vbif = dpu_kms->hw_vbif[i];
 		if (vbif && vbif->cap && vbif->ops.set_mem_type) {
-- 
2.21.0

