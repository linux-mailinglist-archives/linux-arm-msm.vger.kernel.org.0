Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3797474CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbjGDPEH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231585AbjGDPEF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:04:05 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6877710D5
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:04:04 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b6afc1ceffso93713801fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 08:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688483042; x=1691075042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jgbI3/ffvPjsCqNx8ewaFdwoK+9AdPqtzj3Q+tVUb5U=;
        b=OQ8pCacqKiTD1fLThyZjjM3X0PkTUn1r8tJW/c1EySI8bjE4uMg5q6aQ9aOw6VoLQ2
         OC07GXpLibFZ9U+gfUAzV4l2LTMdFmgsoE78T1EQ0EsXvfg8QVzjjOKgjn7k/IpU75S3
         6kzQrgt5owX9ecjXH+8sKvazE70uGeT0/KB8fpKDZ6nZE+/7Iq6r8EErLro6LblaPqxU
         52kwES/nLo41T4r2z/HFUfs7NFmFfYlvyyTn5M7A4aqB+ux4dXqkYULrZpbrNB5Pz66v
         c7iUijRTtw/HfB6ELCe2uovaU2HcN7cc/YuWGoaPB4Spbnq3ansbVvfWXnQbrN11fNE5
         FDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688483042; x=1691075042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jgbI3/ffvPjsCqNx8ewaFdwoK+9AdPqtzj3Q+tVUb5U=;
        b=KNL47SGj8SUgrGO8aFK3/UKvLZmex38Xx1UXG2OdZ4PuZzlSUTGiS3tqF3VMWmu86H
         hMUO07xlsj3/wjBZMn1AzNU1kNzZD5jcYzZXVxqdgJSaoifqSOQksfL1u4lOqvdO6aC7
         ZFj422c8jFBM39x2flM3a8+I0rGqYaxXPCL5GiVZ2CMQOMJ6Scr+os4PxU1y1cx9V5dh
         xP2nBVV3qA3j06xgqJxH220yQCFu8VtrIRGnrf4B1PwiW4kDbe8PEOX5aJzYr/AbU4/1
         agBDn4vTZTNFPGCbLdnRh26mqsBRRpFgNx970gvMsZVlB0lD92LURpxM2TKX5wKwke4z
         w9Xw==
X-Gm-Message-State: ABy/qLb6al8zDJFRa5ia+VQhBnqL2DSUJvKQou3DE4Vz8snRZ8bAQIeh
        N8eKnJh4hyp36cdZKoQ08AfOJw==
X-Google-Smtp-Source: APBJJlFMnoc1b9eLxuuCunUAGD8TDuqDPjHziarv4Vjz179l1NtFxdd0i59BUvUJgbsarprcnVzPlQ==
X-Received: by 2002:a2e:94c3:0:b0:2b6:df8a:d44b with SMTP id r3-20020a2e94c3000000b002b6df8ad44bmr5659368ljh.36.1688483042723;
        Tue, 04 Jul 2023 08:04:02 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:04:02 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 09/14] drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
Date:   Tue,  4 Jul 2023 18:03:49 +0300
Message-Id: <20230704150354.159882-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The stop_req is true only in the dpu_crtc_disable() case, when
crtc->enable has already been set to false. This renders the stop_req
argument useless. Remove it completely.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 +++---
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index bdd00c3af1c6..f15efaaaf9fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -291,7 +291,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 }
 
 int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
-		int params_changed, bool stop_req)
+			      int params_changed)
 {
 	struct dpu_core_perf_params *new, *old;
 	bool update_bus = false, update_clk = false;
@@ -315,13 +315,13 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	dpu_crtc = to_dpu_crtc(crtc);
 	dpu_cstate = to_dpu_crtc_state(crtc->state);
 
-	DRM_DEBUG_ATOMIC("crtc:%d stop_req:%d core_clk:%llu\n",
-			crtc->base.id, stop_req, kms->perf.core_clk_rate);
+	DRM_DEBUG_ATOMIC("crtc:%d enabled:%d core_clk:%llu\n",
+			crtc->base.id, crtc->enabled, kms->perf.core_clk_rate);
 
 	old = &dpu_crtc->cur_perf;
 	new = &dpu_cstate->new_perf;
 
-	if (crtc->enabled && !stop_req) {
+	if (crtc->enabled) {
 		/*
 		 * cases for bus bandwidth update.
 		 * 1. new bandwidth vote - "ab or ib vote" is higher
@@ -351,7 +351,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	}
 
 	trace_dpu_perf_crtc_update(crtc->base.id, new->bw_ctl,
-		new->core_clk_rate, stop_req, update_bus, update_clk);
+		new->core_clk_rate, !crtc->enabled, update_bus, update_clk);
 
 	if (update_bus) {
 		ret = _dpu_core_perf_crtc_update_bus(kms, crtc);
@@ -371,7 +371,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 
 		DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
 
-		trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
+		trace_dpu_core_perf_update_clk(kms->dev, !crtc->enabled, clk_rate);
 
 		clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
 		ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 4f362bb6a520..0b8c527f489e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -63,11 +63,10 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
  * dpu_core_perf_crtc_update - update performance of the given crtc
  * @crtc: Pointer to crtc
  * @params_changed: true if crtc parameters are modified
- * @stop_req: true if this is a stop request
  * return: zero if success, or error code otherwise
  */
 int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
-		int params_changed, bool stop_req);
+			      int params_changed);
 
 /**
  * dpu_core_perf_crtc_release_bw - release bandwidth of the given crtc
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index ff5d306b95ed..214229d11e3e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -718,7 +718,7 @@ static void dpu_crtc_frame_event_cb(void *data, u32 event)
 void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 {
 	trace_dpu_crtc_complete_commit(DRMID(crtc));
-	dpu_core_perf_crtc_update(crtc, 0, false);
+	dpu_core_perf_crtc_update(crtc, 0);
 	_dpu_crtc_complete_flip(crtc);
 }
 
@@ -884,7 +884,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 		return;
 
 	/* update performance setting before crtc kickoff */
-	dpu_core_perf_crtc_update(crtc, 1, false);
+	dpu_core_perf_crtc_update(crtc, 1);
 
 	/*
 	 * Final plane updates: Give each plane a chance to complete all
@@ -1100,7 +1100,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 		atomic_set(&dpu_crtc->frame_pending, 0);
 	}
 
-	dpu_core_perf_crtc_update(crtc, 0, true);
+	dpu_core_perf_crtc_update(crtc, 0);
 
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
 		dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
-- 
2.39.2

