Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D898A6BD65F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 17:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjCPQzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 12:55:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjCPQzu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 12:55:50 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACACCC18
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:55:49 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id y14so2386282ljq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678985747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIZhnj34tFDqJ571tBldatObNZ/9X2iSU1FEGNAtdzI=;
        b=yDDSjQTRH8Oj6EDq1F9B+rAYHSKcYghW+g8mk67lIqENT3Doz8ZR1bZ3BXa+IYwk1L
         YFO47bl/AH4n+xew3TJBumnWHRx81g9tHlY/TNRugZj0tTxbpwnMckIYiOPvsoQUgjE3
         RLw55dhTtmNddRt5FZVgIw/ih7QaRSwa5SvlNhKNlEZP99NQ+NJDgsiicbd1IrfvO3YG
         13ZT6fOMxFotjDKo2DUwL5nyYePtXBVQ14fm08DePeemJZ2+1rJYjU8ONCw/DFtXfapf
         A693OLYbJLA2nbUh8a8BBGqnH+SUhlCucd4+prWt79Gef3+y66N7vncNkkmbRk7xuggn
         f3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678985747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIZhnj34tFDqJ571tBldatObNZ/9X2iSU1FEGNAtdzI=;
        b=zWKGD7w1caXHV+NyOEBnSeCoePiEoZzdpQrTvA1/j1AZFwLoGMbl8JPXO5ftWJkeb7
         5vyvTpE31r+RuMnrioJ6sMIAQ80flQfavWYzv4QqbY0JVuUl5Yw1RleIafzny/2kCtEh
         1h5Xzk/+zZ5GI7mnJj+jBlJiwlfiWEvZ1MxzIeAujJPnN0ZW6+39O7j7qTRcLct+XC40
         heL/nWUC7NHg1QRQodr9bzUU3/+anEU62PoQFgKZAbQvdZ1UjdCrv5UsU1TlIt25s4Sv
         mM3G3NKFjE/IH8i4PYifHhK8dAZ64O5D5UuGIBVdHRmiXP5Cs4ZClFnoRs4yNJBU9lj0
         XHOA==
X-Gm-Message-State: AO0yUKU6PZEmJch1iVfLAkahF8gcfaWvZCdSuLI9V4XSrQj5pkPm0PTK
        Yodvw3RCEcoKQV8H4HxCmgbyqQ==
X-Google-Smtp-Source: AK7set+m67SUWdQiJtIJhf8xpW+qBDcdmokW3z6fhRtVYnJbAkA53nM+VHdwCKjvLbWgqswx6O9CnA==
X-Received: by 2002:a2e:be06:0:b0:298:97d7:8fd4 with SMTP id z6-20020a2ebe06000000b0029897d78fd4mr3150290ljq.42.1678985747412;
        Thu, 16 Mar 2023 09:55:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t18-20020a2e9c52000000b002934b5d6a61sm2661ljj.121.2023.03.16.09.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:55:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v1 04/12] drm/msm/dpu: get rid of struct dpu_rm_requirements
Date:   Thu, 16 Mar 2023 19:55:34 +0300
Message-Id: <20230316165542.4109764-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
References: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The struct dpu_rm_requirements was used to wrap display topology and
hw resources, which meant INTF indices. As of commit ef58e0ad3436
("drm/msm/dpu: get INTF blocks directly rather than through RM") the hw
resources struct was removed, leaving struct dpu_rm_requirements
containing a single field (topology). Remove the useless wrapper.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 69 +++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 +-
 3 files changed, 23 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4ee708264f3b..a2cb23dea0b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -638,7 +638,7 @@ static int dpu_encoder_virt_atomic_check(
 
 		if (!crtc_state->active_changed || crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					drm_enc, crtc_state, topology);
+					drm_enc, crtc_state, &topology);
 	}
 
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f4dda88a73f7..952e139c0234 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -24,15 +24,6 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
 	return res_map[idx] && res_map[idx] != enc_id;
 }
 
-/**
- * struct dpu_rm_requirements - Reservation requirements parameter bundle
- * @topology:  selected topology for the display
- * @hw_res:	   Hardware resources required as reported by the encoders
- */
-struct dpu_rm_requirements {
-	struct msm_display_topology topology;
-};
-
 int dpu_rm_destroy(struct dpu_rm *rm)
 {
 	int i;
@@ -329,14 +320,13 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
  *      mixer in rm->pingpong_blks[].
  * @dspp_idx: output parameter, index of dspp block attached to the layer
  *      mixer in rm->dspp_blks[].
- * @reqs: input parameter, rm requirements for HW blocks needed in the
- *      datapath.
+ * @topology:  selected topology for the display
  * Return: true if lm matches all requirements, false otherwise
  */
 static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		uint32_t enc_id, int lm_idx, int *pp_idx, int *dspp_idx,
-		struct dpu_rm_requirements *reqs)
+		struct msm_display_topology *topology)
 {
 	const struct dpu_lm_cfg *lm_cfg;
 	int idx;
@@ -361,7 +351,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 	}
 	*pp_idx = idx;
 
-	if (!reqs->topology.num_dspp)
+	if (!topology->num_dspp)
 		return true;
 
 	idx = lm_cfg->dspp - DSPP_0;
@@ -383,7 +373,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
 			       uint32_t enc_id,
-			       struct dpu_rm_requirements *reqs)
+			       struct msm_display_topology *topology)
 
 {
 	int lm_idx[MAX_BLOCKS];
@@ -391,14 +381,14 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 	int dspp_idx[MAX_BLOCKS] = {0};
 	int i, j, lm_count = 0;
 
-	if (!reqs->topology.num_lm) {
-		DPU_ERROR("invalid number of lm: %d\n", reqs->topology.num_lm);
+	if (!topology->num_lm) {
+		DPU_ERROR("invalid number of lm: %d\n", topology->num_lm);
 		return -EINVAL;
 	}
 
 	/* Find a primary mixer */
 	for (i = 0; i < ARRAY_SIZE(rm->mixer_blks) &&
-			lm_count < reqs->topology.num_lm; i++) {
+			lm_count < topology->num_lm; i++) {
 		if (!rm->mixer_blks[i])
 			continue;
 
@@ -407,7 +397,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
 				enc_id, i, &pp_idx[lm_count],
-				&dspp_idx[lm_count], reqs)) {
+				&dspp_idx[lm_count], topology)) {
 			continue;
 		}
 
@@ -415,7 +405,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 
 		/* Valid primary mixer found, find matching peers */
 		for (j = i + 1; j < ARRAY_SIZE(rm->mixer_blks) &&
-				lm_count < reqs->topology.num_lm; j++) {
+				lm_count < topology->num_lm; j++) {
 			if (!rm->mixer_blks[j])
 				continue;
 
@@ -428,7 +418,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
 					global_state, enc_id, j,
 					&pp_idx[lm_count], &dspp_idx[lm_count],
-					reqs)) {
+					topology)) {
 				continue;
 			}
 
@@ -437,7 +427,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		}
 	}
 
-	if (lm_count != reqs->topology.num_lm) {
+	if (lm_count != topology->num_lm) {
 		DPU_DEBUG("unable to find appropriate mixers\n");
 		return -ENAVAIL;
 	}
@@ -446,7 +436,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
 		global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
 		global_state->dspp_to_enc_id[dspp_idx[i]] =
-			reqs->topology.num_dspp ? enc_id : 0;
+			topology->num_dspp ? enc_id : 0;
 
 		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
 					 pp_idx[i] + PINGPONG_0);
@@ -539,44 +529,30 @@ static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		struct drm_encoder *enc,
-		struct dpu_rm_requirements *reqs)
+		struct msm_display_topology *topology)
 {
 	int ret;
 
-	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, reqs);
+	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, topology);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate mixers\n");
 		return ret;
 	}
 
 	ret = _dpu_rm_reserve_ctls(rm, global_state, enc->base.id,
-				&reqs->topology);
+				   topology);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate CTL\n");
 		return ret;
 	}
 
-	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, &reqs->topology);
+	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, topology);
 	if (ret)
 		return ret;
 
 	return ret;
 }
 
-static int _dpu_rm_populate_requirements(
-		struct drm_encoder *enc,
-		struct dpu_rm_requirements *reqs,
-		struct msm_display_topology req_topology)
-{
-	reqs->topology = req_topology;
-
-	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
-		      reqs->topology.num_lm, reqs->topology.num_dsc,
-		      reqs->topology.num_intf);
-
-	return 0;
-}
-
 static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
 				  uint32_t enc_id)
 {
@@ -608,9 +584,8 @@ int dpu_rm_reserve(
 		struct dpu_global_state *global_state,
 		struct drm_encoder *enc,
 		struct drm_crtc_state *crtc_state,
-		struct msm_display_topology topology)
+		struct msm_display_topology *topology)
 {
-	struct dpu_rm_requirements reqs;
 	int ret;
 
 	/* Check if this is just a page-flip */
@@ -625,13 +600,11 @@ int dpu_rm_reserve(
 	DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
 		      enc->base.id, crtc_state->crtc->base.id);
 
-	ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
-	if (ret) {
-		DPU_ERROR("failed to populate hw requirements\n");
-		return ret;
-	}
+	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
+		      topology->num_lm, topology->num_dsc,
+		      topology->num_intf);
 
-	ret = _dpu_rm_make_reservation(rm, global_state, enc, &reqs);
+	ret = _dpu_rm_make_reservation(rm, global_state, enc, topology);
 	if (ret)
 		DPU_ERROR("failed to reserve hw resources: %d\n", ret);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index d62c2edb2460..f05697462856 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -71,7 +71,7 @@ int dpu_rm_reserve(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
-		struct msm_display_topology topology);
+		struct msm_display_topology *topology);
 
 /**
  * dpu_rm_reserve - Given the encoder for the display chain, release any
-- 
2.30.2

