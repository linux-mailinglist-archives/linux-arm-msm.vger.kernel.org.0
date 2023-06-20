Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC2C736077
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 02:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjFTAJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 20:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjFTAI7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 20:08:59 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555301AD
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:55 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f871c93a5fso2097192e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 17:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687219733; x=1689811733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rD45IpamSHmeKBkLhjnckQHeaijA0W6PwrPUT5TTCbg=;
        b=qyOfbz/Mypt/wzh+jFNR5LmmPxAwWUX862FeawYY6sTYOUvAtQi8Ls9kqRQE0O652B
         epmnWTVftTgveNkyRZylP2InwySG4sKdolRFkAkv03TF/ojsBk8cuw3KBONcMi/ccIEV
         67BI9mWMs1f5lZplhcJKsP4CQpdfFiUjF8+rydMavMGebx+Cs841uF96YgYa/mIRyW8t
         UlI4DdcdmgnbOSkt+gWfK024TrpBTSCji82IpMRFDepVcY68q69hCs4chL9jyBHboMto
         m8ApvV2eD2LKsXQbjw1gMm/dVwM0nZhT+SCAB0Lgd4hwLoDkZwflt8igLQHVQAavRSfM
         yUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687219733; x=1689811733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rD45IpamSHmeKBkLhjnckQHeaijA0W6PwrPUT5TTCbg=;
        b=TMLbjlPGu1jLgzzo9Ufb1JW+kUxjCuY53BpU0tRBElspZQWpVG1C6W3Cqbqr3i+Jub
         c0saM3M9Pz9WdRo/lSero3q74q6WfUTM48EzVvHoNtJXjuEhPssGmknyH0pfq0pU5D16
         S7ALCDOArQ6zx+GPuwixfa2vhVfKTbjOIh9VSmGKA2GQ3U5+SRzHk6Y09zzI6/mOWIPh
         XdQc9LZNoxRMc7pk5iDzJjNxHBDWep1XavS2OMrWD17iCQKjZiOnBNMApzqOyaw4a2tO
         eDkA3sGys18b+GCn2t9KmxwiQzyZUBkKS84RZQN2QkQyuKDNXc0d0D6CDsDG4yOQ9QVu
         mrxA==
X-Gm-Message-State: AC+VfDyuILAi8eCR7kL86P1FZVe7fFzEWrqG5jtmhlLl1qPFlfYOESIG
        yif1CVlpgRZQ+W/ICoPpYIPitA==
X-Google-Smtp-Source: ACHHUZ7vNLn4irxhnXegIB6RgBomQ+ch2nDxHDe7iN7TBQZ6KBi9/7Q4dAW/uCj5s6hSSmhsw8plAQ==
X-Received: by 2002:a05:6512:214f:b0:4f8:658f:fd2a with SMTP id s15-20020a056512214f00b004f8658ffd2amr3538700lfr.36.1687219733637;
        Mon, 19 Jun 2023 17:08:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a6-20020a056512020600b004f869e46fd4sm128815lfo.100.2023.06.19.17.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:08:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 5/8] drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
Date:   Tue, 20 Jun 2023 03:08:43 +0300
Message-Id: <20230620000846.946925-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  6 +++---
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index f8d5c87d0915..773e641eab28 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -277,7 +277,7 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 }
 
 int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
-		int params_changed, bool stop_req)
+			      int params_changed)
 {
 	struct dpu_core_perf_params *new, *old;
 	bool update_bus = false, update_clk = false;
@@ -301,13 +301,13 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
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
@@ -337,7 +337,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	}
 
 	trace_dpu_perf_crtc_update(crtc->base.id, new->bw_ctl,
-		new->core_clk_rate, stop_req, update_bus, update_clk);
+		new->core_clk_rate, !crtc->enabled, update_bus, update_clk);
 
 	if (update_bus) {
 		ret = _dpu_core_perf_crtc_update_bus(kms, crtc);
@@ -355,7 +355,7 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	if (update_clk) {
 		clk_rate = _dpu_core_perf_get_core_clk_rate(kms);
 
-		trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
+		trace_dpu_core_perf_update_clk(kms->dev, !crtc->enabled, clk_rate);
 
 		clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
 		ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 2bf7836f79bb..c29ec72984b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -58,11 +58,10 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
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

