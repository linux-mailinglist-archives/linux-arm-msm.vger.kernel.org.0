Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E135274B765
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 21:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233109AbjGGTmg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 15:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbjGGTlS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 15:41:18 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFEF72D57
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 12:39:47 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so3705621e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688758786; x=1691350786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQpKCEoX0wDzwvYtZYOLMhBvx89hv9TtO2VMOF5Zspg=;
        b=d8kd4LwCK8JmRRCtZ7vWwUrKfbcjO/NRfw++krZjQ+tGGGt0z1ZUrUP3B/S3fwi1T8
         IkCVOVTYUW8T7L5vGkXUUPXlF9GKFZqNXq0gzZn0b2MfrxZhjObf9yyNXsV6w1rXPTb2
         iW8C3LFac4rZoh4Y2kFBBIGc2BQqEeIYnxfVcrHf3AuH4oZ2gdc9GvWnKmqGbQdMV0It
         CCfn/KFK12jPZrfxxAMu1zqhhWHWqkRq4QIXs/AzMq2/5bEYH3+JnYzUH16ImM+3JUSc
         8pxLbaAYAzrQKcbPjdThYknBuIhRiqLZ+aIKuIG5+NMKIz2RVJwtHqxAZMF7GcB1mmJw
         zMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688758786; x=1691350786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQpKCEoX0wDzwvYtZYOLMhBvx89hv9TtO2VMOF5Zspg=;
        b=I0HIeITNypeU8gHGCn7N+zo9Kef4jVbOOo0VQEvOHHdVPyaGXrs0IDb9qiAVSH5IwO
         oTJykfgEasKUcDgtuHofc6RaFuV3HlQp0dpiQFt0lu55k+x4FLqAyiFm/e7WWli7j8sS
         dGJ6lYaOeXpz5puueZJylBacVQEceoqepM/eI7HE6ECxXSjevpAy8Ng9p7wNkU3bdUJE
         ZxCgMZQSaDM0hIY4/f0M/GN2E1DFZXznVB3GyOqeU5VeienTDkjDewHHnnAiX2A39l8s
         2jOf4uwQoOcbThpeCx3Mpb70V6g+VZOjSuVOISKP+d/H3CDcI/wmcOpTID2maddXErug
         x4kg==
X-Gm-Message-State: ABy/qLYdYEdoCELW3bthsSogRK9qLj3koKufTQz3irfHduwf5y1zYUBR
        4cysfKdtYk2PEn+1FQcXEom0tQ==
X-Google-Smtp-Source: APBJJlHfbUdQtSsSktig1onHXDKAXml/Kgjl06pRamnL6+L3U9sxnMRrUS4tVsN3iFrTAN9JCGYVxA==
X-Received: by 2002:ac2:57cd:0:b0:4fb:7772:7bae with SMTP id k13-20020ac257cd000000b004fb77727baemr4383238lfo.6.1688758786063;
        Fri, 07 Jul 2023 12:39:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 12:39:45 -0700 (PDT)
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
Subject: [PATCH v3 04/11] drm/msm/dpu: drop separate dpu_core_perf_tune overrides
Date:   Fri,  7 Jul 2023 22:39:35 +0300
Message-Id: <20230707193942.3806526-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
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

The values in struct dpu_core_perf_tune are fixed per the core perf
mode. Drop the 'tune' values and substitute them with known values when
performing perf management.

Note: min_bus_vote was not used at all, so it is just silently dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 ++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  4 ---
 2 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 05d340aa18c5..348550ac7e51 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -235,7 +235,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 {
 	struct dpu_core_perf_params perf = { 0 };
 	int i, ret = 0;
-	u64 avg_bw;
+	u32 avg_bw;
 
 	if (!kms->num_paths)
 		return 0;
@@ -291,10 +291,16 @@ void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc)
 
 static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 {
-	u64 clk_rate = kms->perf.perf_tune.min_core_clk;
+	u64 clk_rate;
 	struct drm_crtc *crtc;
 	struct dpu_crtc_state *dpu_cstate;
 
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
+		return kms->perf.fix_core_clk_rate;
+
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM)
+		return kms->perf.max_core_clk_rate;
+
 	drm_for_each_crtc(crtc, kms->dev) {
 		if (crtc->enabled) {
 			dpu_cstate = to_dpu_crtc_state(crtc->state);
@@ -305,11 +311,6 @@ static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
 		}
 	}
 
-	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED)
-		clk_rate = kms->perf.fix_core_clk_rate;
-
-	DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
-
 	return clk_rate;
 }
 
@@ -397,6 +398,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 	if (update_clk) {
 		clk_rate = _dpu_core_perf_get_core_clk_rate(kms);
 
+		DRM_DEBUG_ATOMIC("clk:%llu\n", clk_rate);
+
 		trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
 
 		clk_rate = min(clk_rate, kms->perf.max_core_clk_rate);
@@ -418,7 +421,6 @@ static ssize_t _dpu_core_perf_mode_write(struct file *file,
 		    const char __user *user_buf, size_t count, loff_t *ppos)
 {
 	struct dpu_core_perf *perf = file->private_data;
-	const struct dpu_perf_cfg *cfg = perf->catalog->perf;
 	u32 perf_mode = 0;
 	int ret;
 
@@ -433,14 +435,9 @@ static ssize_t _dpu_core_perf_mode_write(struct file *file,
 		DRM_INFO("fix performance mode\n");
 	} else if (perf_mode == DPU_PERF_MODE_MINIMUM) {
 		/* run the driver with max clk and BW vote */
-		perf->perf_tune.min_core_clk = perf->max_core_clk_rate;
-		perf->perf_tune.min_bus_vote =
-				(u64) cfg->max_bw_high * 1000;
 		DRM_INFO("minimum performance mode\n");
 	} else if (perf_mode == DPU_PERF_MODE_NORMAL) {
 		/* reset the perf tune params to 0 */
-		perf->perf_tune.min_core_clk = 0;
-		perf->perf_tune.min_bus_vote = 0;
 		DRM_INFO("normal performance mode\n");
 	}
 	perf->perf_tune.mode = perf_mode;
@@ -456,10 +453,8 @@ static ssize_t _dpu_core_perf_mode_read(struct file *file,
 	char buf[128];
 
 	len = scnprintf(buf, sizeof(buf),
-			"mode %d min_mdp_clk %llu min_bus_vote %llu\n",
-			perf->perf_tune.mode,
-			perf->perf_tune.min_core_clk,
-			perf->perf_tune.min_bus_vote);
+			"mode %d\n",
+			perf->perf_tune.mode);
 
 	return simple_read_from_buffer(buff, count, ppos, buf, len);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 29bb8ee2bc26..c965dfbc3007 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -29,13 +29,9 @@ struct dpu_core_perf_params {
 /**
  * struct dpu_core_perf_tune - definition of performance tuning control
  * @mode: performance mode
- * @min_core_clk: minimum core clock
- * @min_bus_vote: minimum bus vote
  */
 struct dpu_core_perf_tune {
 	u32 mode;
-	u64 min_core_clk;
-	u64 min_bus_vote;
 };
 
 /**
-- 
2.39.2

