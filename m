Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49EF54ABB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 22:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730196AbfFRUZJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 16:25:09 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:36802 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfFRUZJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 16:25:09 -0400
Received: by mail-qt1-f196.google.com with SMTP id p15so17110941qtl.3;
        Tue, 18 Jun 2019 13:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MN1rzEtIL+Vh9mjFO+Yd5l/eLtCUYrYg+HZ07MLHDjU=;
        b=c+IQKwFsS/nOgmRq9p6B8VpXXtMg+4P18crWKkQvl62VW1Z2e/HznvvxJOYN9GU4C2
         F2nff19JhV8uEXVCzyZpIPZ64cQ0TjNJYaoFnrqYij+aBZv4oIlyvD8hNmCqKf0SnmEC
         ZiyfBsuq3wG5KyLpjx56K1tL6VKVfBvBS/0eE/jzpbKVSEwQQSvADcyBjXN0HFK+0UUN
         //1Hxte9QiEYDGvDwSJwFGZqXqaUVBkASTdIC0Q2L7JQ3e5IWC59vmctCvHGH0JegUY5
         tifvqM6pi+fLsIk5arlVA/jGSOhoeCORxATTni3tR5mGRV6k27r3qaEjwjUAzT9bvAmb
         +lrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MN1rzEtIL+Vh9mjFO+Yd5l/eLtCUYrYg+HZ07MLHDjU=;
        b=T3AFAC+vobZSMF/HYsl3DVEO54/wDaPhQT01OgtTUbZuDdkxz8UY/W16/AUK1qfJmI
         P+CAaWXy9tWJ6dS9lZAMRYg3a6cpLDZN/qlzrAs5xc9A1NfxBIkCNTrEZOO/cinknPbS
         mviwTNqhuqK9mmL+fvFEcGEL07VHtgG1Ry9S1vzvt39AoJqT0EW1xS1Qc8WBE9IpYJcy
         qA8Xi+4r4pIgoY1yeIUdOiAJF15alt7sYVzqAkx/XY3k/G8OsRPVoJvee9wEHjLAWxt+
         NqRvjut0Q4jsFDWfCqesOhcDLMF7Kz6gTRt4xxXIAN1qm+oT2eRjg0K/J0Rwnz7Bs4G6
         NiaQ==
X-Gm-Message-State: APjAAAWSIrGKqwoC/VV2pgkRBZ7meGP09OloopFWrp+vR+eZKKGTVt12
        rqaffavaZmF5rvGIQ9V23YE=
X-Google-Smtp-Source: APXvYqwLSzMdfgXL692jrl2/pUxnOxl/2p3+JeCEccFj+7Fsh1psNq3YVQ7tehYPSXpcAiL/TVIhJw==
X-Received: by 2002:a0c:b148:: with SMTP id r8mr28741990qvc.240.1560889508131;
        Tue, 18 Jun 2019 13:25:08 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id i1sm302977qtb.7.2019.06.18.13.25.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 13:25:07 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] drm/msm/dpu: clean up references of DPU custom bus scaling
Date:   Tue, 18 Jun 2019 13:24:09 -0700
Message-Id: <20190618202425.15259-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618202425.15259-1-robdclark@gmail.com>
References: <20190618202425.15259-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jayant Shekhar <jshekhar@codeaurora.org>

Since the upstream interconnect bus framework has landed
upstream, the existing references of custom bus scaling
needs to be cleaned up.

Changes in v2:
	- Fixed build error due to partial clean up

Changes in v3:
	- Condense multiple lines into a single line (Sean Paul)

Changes in v4-v7:
	- None

Signed-off-by: Sravanthi Kollukuduru <skolluku@codeaurora.org>
Signed-off-by: Jayant Shekhar <jshekhar@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 174 +++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  22 +--
 4 files changed, 80 insertions(+), 131 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 9f20f397f77d..e231c37a9dbb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -77,7 +77,6 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 		struct dpu_core_perf_params *perf)
 {
 	struct dpu_crtc_state *dpu_cstate;
-	int i;
 
 	if (!kms || !kms->catalog || !crtc || !state || !perf) {
 		DPU_ERROR("invalid parameters\n");
@@ -88,35 +87,24 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
 	memset(perf, 0, sizeof(struct dpu_core_perf_params));
 
 	if (!dpu_cstate->bw_control) {
-		for (i = 0; i < DPU_CORE_PERF_DATA_BUS_ID_MAX; i++) {
-			perf->bw_ctl[i] = kms->catalog->perf.max_bw_high *
+		perf->bw_ctl = kms->catalog->perf.max_bw_high *
 					1000ULL;
-			perf->max_per_pipe_ib[i] = perf->bw_ctl[i];
-		}
+		perf->max_per_pipe_ib = perf->bw_ctl;
 		perf->core_clk_rate = kms->perf.max_core_clk_rate;
 	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-		for (i = 0; i < DPU_CORE_PERF_DATA_BUS_ID_MAX; i++) {
-			perf->bw_ctl[i] = 0;
-			perf->max_per_pipe_ib[i] = 0;
-		}
+		perf->bw_ctl = 0;
+		perf->max_per_pipe_ib = 0;
 		perf->core_clk_rate = 0;
 	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		for (i = 0; i < DPU_CORE_PERF_DATA_BUS_ID_MAX; i++) {
-			perf->bw_ctl[i] = kms->perf.fix_core_ab_vote;
-			perf->max_per_pipe_ib[i] = kms->perf.fix_core_ib_vote;
-		}
+		perf->bw_ctl = kms->perf.fix_core_ab_vote;
+		perf->max_per_pipe_ib = kms->perf.fix_core_ib_vote;
 		perf->core_clk_rate = kms->perf.fix_core_clk_rate;
 	}
 
 	DPU_DEBUG(
-		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu llcc_ib=%llu llcc_ab=%llu mem_ib=%llu mem_ab=%llu\n",
+		"crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
 			crtc->base.id, perf->core_clk_rate,
-			perf->max_per_pipe_ib[DPU_CORE_PERF_DATA_BUS_ID_MNOC],
-			perf->bw_ctl[DPU_CORE_PERF_DATA_BUS_ID_MNOC],
-			perf->max_per_pipe_ib[DPU_CORE_PERF_DATA_BUS_ID_LLCC],
-			perf->bw_ctl[DPU_CORE_PERF_DATA_BUS_ID_LLCC],
-			perf->max_per_pipe_ib[DPU_CORE_PERF_DATA_BUS_ID_EBI],
-			perf->bw_ctl[DPU_CORE_PERF_DATA_BUS_ID_EBI]);
+			perf->max_per_pipe_ib, perf->bw_ctl);
 }
 
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
@@ -129,7 +117,6 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	struct dpu_crtc_state *dpu_cstate;
 	struct drm_crtc *tmp_crtc;
 	struct dpu_kms *kms;
-	int i;
 
 	if (!crtc || !state) {
 		DPU_ERROR("invalid crtc\n");
@@ -151,31 +138,25 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	/* obtain new values */
 	_dpu_core_perf_calc_crtc(kms, crtc, state, &dpu_cstate->new_perf);
 
-	for (i = DPU_CORE_PERF_DATA_BUS_ID_MNOC;
-			i < DPU_CORE_PERF_DATA_BUS_ID_MAX; i++) {
-		bw_sum_of_intfs = dpu_cstate->new_perf.bw_ctl[i];
-		curr_client_type = dpu_crtc_get_client_type(crtc);
+	bw_sum_of_intfs = dpu_cstate->new_perf.bw_ctl;
+	curr_client_type = dpu_crtc_get_client_type(crtc);
 
-		drm_for_each_crtc(tmp_crtc, crtc->dev) {
-			if (tmp_crtc->enabled &&
-			    (dpu_crtc_get_client_type(tmp_crtc) ==
-					    curr_client_type) &&
-			    (tmp_crtc != crtc)) {
-				struct dpu_crtc_state *tmp_cstate =
-					to_dpu_crtc_state(tmp_crtc->state);
-
-				DPU_DEBUG("crtc:%d bw:%llu ctrl:%d\n",
-					tmp_crtc->base.id,
-					tmp_cstate->new_perf.bw_ctl[i],
-					tmp_cstate->bw_control);
-				/*
-				 * For bw check only use the bw if the
-				 * atomic property has been already set
-				 */
-				if (tmp_cstate->bw_control)
-					bw_sum_of_intfs +=
-						tmp_cstate->new_perf.bw_ctl[i];
-			}
+	drm_for_each_crtc(tmp_crtc, crtc->dev) {
+		if (tmp_crtc->enabled &&
+		    (dpu_crtc_get_client_type(tmp_crtc) ==
+				curr_client_type) && (tmp_crtc != crtc)) {
+			struct dpu_crtc_state *tmp_cstate =
+				to_dpu_crtc_state(tmp_crtc->state);
+
+			DPU_DEBUG("crtc:%d bw:%llu ctrl:%d\n",
+				tmp_crtc->base.id, tmp_cstate->new_perf.bw_ctl,
+				tmp_cstate->bw_control);
+			/*
+			 * For bw check only use the bw if the
+			 * atomic property has been already set
+			 */
+			if (tmp_cstate->bw_control)
+				bw_sum_of_intfs += tmp_cstate->new_perf.bw_ctl;
 		}
 
 		/* convert bandwidth to kb */
@@ -206,9 +187,9 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 }
 
 static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
-		struct drm_crtc *crtc, u32 bus_id)
+		struct drm_crtc *crtc)
 {
-	struct dpu_core_perf_params perf = { { 0 } };
+	struct dpu_core_perf_params perf = { 0 };
 	enum dpu_crtc_client_type curr_client_type
 					= dpu_crtc_get_client_type(crtc);
 	struct drm_crtc *tmp_crtc;
@@ -221,13 +202,11 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 				dpu_crtc_get_client_type(tmp_crtc)) {
 			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
 
-			perf.max_per_pipe_ib[bus_id] =
-				max(perf.max_per_pipe_ib[bus_id],
-				dpu_cstate->new_perf.max_per_pipe_ib[bus_id]);
+			perf.max_per_pipe_ib = max(perf.max_per_pipe_ib,
+					dpu_cstate->new_perf.max_per_pipe_ib);
 
-			DPU_DEBUG("crtc=%d bus_id=%d bw=%llu\n",
-				tmp_crtc->base.id, bus_id,
-				dpu_cstate->new_perf.bw_ctl[bus_id]);
+			DPU_DEBUG("crtc=%d bw=%llu\n", tmp_crtc->base.id,
+					dpu_cstate->new_perf.bw_ctl);
 		}
 	}
 	return ret;
@@ -247,7 +226,6 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 	struct dpu_crtc *dpu_crtc;
 	struct dpu_crtc_state *dpu_cstate;
 	struct dpu_kms *kms;
-	int i;
 
 	if (!crtc) {
 		DPU_ERROR("invalid crtc\n");
@@ -283,10 +261,8 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 	if (kms->perf.enable_bw_release) {
 		trace_dpu_cmd_release_bw(crtc->base.id);
 		DPU_DEBUG("Release BW crtc=%d\n", crtc->base.id);
-		for (i = 0; i < DPU_CORE_PERF_DATA_BUS_ID_MAX; i++) {
-			dpu_crtc->cur_perf.bw_ctl[i] = 0;
-			_dpu_core_perf_crtc_update_bus(kms, crtc, i);
-		}
+		dpu_crtc->cur_perf.bw_ctl = 0;
+		_dpu_core_perf_crtc_update_bus(kms, crtc);
 	}
 }
 
@@ -329,11 +305,10 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 		int params_changed, bool stop_req)
 {
 	struct dpu_core_perf_params *new, *old;
-	int update_bus = 0, update_clk = 0;
+	bool update_bus = false, update_clk = false;
 	u64 clk_rate = 0;
 	struct dpu_crtc *dpu_crtc;
 	struct dpu_crtc_state *dpu_cstate;
-	int i;
 	struct msm_drm_private *priv;
 	struct dpu_kms *kms;
 	int ret;
@@ -360,62 +335,49 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	new = &dpu_cstate->new_perf;
 
 	if (crtc->enabled && !stop_req) {
-		for (i = 0; i < DPU_CORE_PERF_DATA_BUS_ID_MAX; i++) {
-			/*
-			 * cases for bus bandwidth update.
-			 * 1. new bandwidth vote - "ab or ib vote" is higher
-			 *    than current vote for update request.
-			 * 2. new bandwidth vote - "ab or ib vote" is lower
-			 *    than current vote at end of commit or stop.
-			 */
-			if ((params_changed && ((new->bw_ctl[i] >
-						old->bw_ctl[i]) ||
-				  (new->max_per_pipe_ib[i] >
-						old->max_per_pipe_ib[i]))) ||
-			    (!params_changed && ((new->bw_ctl[i] <
-						old->bw_ctl[i]) ||
-				  (new->max_per_pipe_ib[i] <
-						old->max_per_pipe_ib[i])))) {
-				DPU_DEBUG(
-					"crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
-					crtc->base.id, params_changed,
-					new->bw_ctl[i], old->bw_ctl[i]);
-				old->bw_ctl[i] = new->bw_ctl[i];
-				old->max_per_pipe_ib[i] =
-						new->max_per_pipe_ib[i];
-				update_bus |= BIT(i);
-			}
+		/*
+		 * cases for bus bandwidth update.
+		 * 1. new bandwidth vote - "ab or ib vote" is higher
+		 *    than current vote for update request.
+		 * 2. new bandwidth vote - "ab or ib vote" is lower
+		 *    than current vote at end of commit or stop.
+		 */
+		if ((params_changed && ((new->bw_ctl > old->bw_ctl) ||
+			(new->max_per_pipe_ib > old->max_per_pipe_ib)))	||
+			(!params_changed && ((new->bw_ctl < old->bw_ctl) ||
+			(new->max_per_pipe_ib < old->max_per_pipe_ib)))) {
+			DPU_DEBUG("crtc=%d p=%d new_bw=%llu,old_bw=%llu\n",
+				crtc->base.id, params_changed,
+				new->bw_ctl, old->bw_ctl);
+			old->bw_ctl = new->bw_ctl;
+			old->max_per_pipe_ib = new->max_per_pipe_ib;
+			update_bus = true;
 		}
 
 		if ((params_changed &&
-				(new->core_clk_rate > old->core_clk_rate)) ||
-				(!params_changed &&
-				(new->core_clk_rate < old->core_clk_rate))) {
+			(new->core_clk_rate > old->core_clk_rate)) ||
+			(!params_changed &&
+			(new->core_clk_rate < old->core_clk_rate))) {
 			old->core_clk_rate = new->core_clk_rate;
-			update_clk = 1;
+			update_clk = true;
 		}
 	} else {
 		DPU_DEBUG("crtc=%d disable\n", crtc->base.id);
 		memset(old, 0, sizeof(*old));
 		memset(new, 0, sizeof(*new));
-		update_bus = ~0;
-		update_clk = 1;
+		update_bus = true;
+		update_clk = true;
 	}
-	trace_dpu_perf_crtc_update(crtc->base.id,
-				new->bw_ctl[DPU_CORE_PERF_DATA_BUS_ID_MNOC],
-				new->bw_ctl[DPU_CORE_PERF_DATA_BUS_ID_LLCC],
-				new->bw_ctl[DPU_CORE_PERF_DATA_BUS_ID_EBI],
-				new->core_clk_rate, stop_req,
-				update_bus, update_clk);
-
-	for (i = 0; i < DPU_CORE_PERF_DATA_BUS_ID_MAX; i++) {
-		if (update_bus & BIT(i)) {
-			ret = _dpu_core_perf_crtc_update_bus(kms, crtc, i);
-			if (ret) {
-				DPU_ERROR("crtc-%d: failed to update bw vote for bus-%d\n",
-					  crtc->base.id, i);
-				return ret;
-			}
+
+	trace_dpu_perf_crtc_update(crtc->base.id, new->bw_ctl,
+		new->core_clk_rate, stop_req, update_bus, update_clk);
+
+	if (update_bus) {
+		ret = _dpu_core_perf_crtc_update_bus(kms, crtc);
+		if (ret) {
+			DPU_ERROR("crtc-%d: failed to update bus bw vote\n",
+				  crtc->base.id);
+			return ret;
 		}
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 37f518815eb7..d2097ef3d716 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -42,8 +42,8 @@ enum dpu_core_perf_data_bus_id {
  * @core_clk_rate: core clock rate request
  */
 struct dpu_core_perf_params {
-	u64 max_per_pipe_ib[DPU_CORE_PERF_DATA_BUS_ID_MAX];
-	u64 bw_ctl[DPU_CORE_PERF_DATA_BUS_ID_MAX];
+	u64 max_per_pipe_ib;
+	u64 bw_ctl;
 	u64 core_clk_rate;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index dfdfa766da8f..c4db60a8672d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1235,19 +1235,14 @@ static int dpu_crtc_debugfs_state_show(struct seq_file *s, void *v)
 {
 	struct drm_crtc *crtc = (struct drm_crtc *) s->private;
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
-	int i;
 
 	seq_printf(s, "client type: %d\n", dpu_crtc_get_client_type(crtc));
 	seq_printf(s, "intf_mode: %d\n", dpu_crtc_get_intf_mode(crtc));
 	seq_printf(s, "core_clk_rate: %llu\n",
 			dpu_crtc->cur_perf.core_clk_rate);
-	for (i = DPU_CORE_PERF_DATA_BUS_ID_MNOC;
-			i < DPU_CORE_PERF_DATA_BUS_ID_MAX; i++) {
-		seq_printf(s, "bw_ctl[%d]: %llu\n", i,
-				dpu_crtc->cur_perf.bw_ctl[i]);
-		seq_printf(s, "max_per_pipe_ib[%d]: %llu\n", i,
-				dpu_crtc->cur_perf.max_per_pipe_ib[i]);
-	}
+	seq_printf(s, "bw_ctl: %llu\n", dpu_crtc->cur_perf.bw_ctl);
+	seq_printf(s, "max_per_pipe_ib: %llu\n",
+				dpu_crtc->cur_perf.max_per_pipe_ib);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 8bb46090bd16..1d68e214795e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -146,16 +146,12 @@ TRACE_EVENT(dpu_trace_counter,
 )
 
 TRACE_EVENT(dpu_perf_crtc_update,
-	TP_PROTO(u32 crtc, u64 bw_ctl_mnoc, u64 bw_ctl_llcc,
-			u64 bw_ctl_ebi, u32 core_clk_rate,
-			bool stop_req, u32 update_bus, u32 update_clk),
-	TP_ARGS(crtc, bw_ctl_mnoc, bw_ctl_llcc, bw_ctl_ebi, core_clk_rate,
-		stop_req, update_bus, update_clk),
+	TP_PROTO(u32 crtc, u64 bw_ctl, u32 core_clk_rate,
+			bool stop_req, bool update_bus, bool update_clk),
+	TP_ARGS(crtc, bw_ctl, core_clk_rate, stop_req, update_bus, update_clk),
 	TP_STRUCT__entry(
 			__field(u32, crtc)
-			__field(u64, bw_ctl_mnoc)
-			__field(u64, bw_ctl_llcc)
-			__field(u64, bw_ctl_ebi)
+			__field(u64, bw_ctl)
 			__field(u32, core_clk_rate)
 			__field(bool, stop_req)
 			__field(u32, update_bus)
@@ -163,20 +159,16 @@ TRACE_EVENT(dpu_perf_crtc_update,
 	),
 	TP_fast_assign(
 			__entry->crtc = crtc;
-			__entry->bw_ctl_mnoc = bw_ctl_mnoc;
-			__entry->bw_ctl_llcc = bw_ctl_llcc;
-			__entry->bw_ctl_ebi = bw_ctl_ebi;
+			__entry->bw_ctl = bw_ctl;
 			__entry->core_clk_rate = core_clk_rate;
 			__entry->stop_req = stop_req;
 			__entry->update_bus = update_bus;
 			__entry->update_clk = update_clk;
 	),
 	 TP_printk(
-		"crtc=%d bw_mnoc=%llu bw_llcc=%llu bw_ebi=%llu clk_rate=%u stop_req=%d u_bus=%d u_clk=%d",
+		"crtc=%d bw_ctl=%llu clk_rate=%u stop_req=%d u_bus=%d u_clk=%d",
 			__entry->crtc,
-			__entry->bw_ctl_mnoc,
-			__entry->bw_ctl_llcc,
-			__entry->bw_ctl_ebi,
+			__entry->bw_ctl,
 			__entry->core_clk_rate,
 			__entry->stop_req,
 			__entry->update_bus,
-- 
2.20.1

