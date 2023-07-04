Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4879A7474C1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 17:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231455AbjGDPED (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 11:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjGDPEB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 11:04:01 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63C1E10D7
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 08:04:00 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b6a6f224a1so93405981fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 08:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688483038; x=1691075038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQpKCEoX0wDzwvYtZYOLMhBvx89hv9TtO2VMOF5Zspg=;
        b=Fh58xcazFXTUzyc8r0oX4IBOKM//UEAi7Y6plvcvhYv9M/mwHD5Vul93ZR7uGB5Mra
         ugI3Qn4u+kmNHpZX2zDhvEnXugDh80c1H1NRkGjFJWqquTdxqLpdIiecSTpAaJPblfeM
         ZDKZBVATFsfnzhndGfFrAwrVbshtvGgKhbHRK9kvVUD3KTsXEJgCzX1C7zwG7U4NdUrj
         zS2H1ocVe9ENd70bvgtJ5ZQ8QYM537xi+5R6pG4N9NPnVLZEvaXOPghbWcLRD0k2H82Z
         xy5I8R6AziE+VQXXp+HoehGxRz9SalCx5nS9xVkdeYF4M5Ek1dozE/ArjgpTObVVhZFL
         dLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688483038; x=1691075038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQpKCEoX0wDzwvYtZYOLMhBvx89hv9TtO2VMOF5Zspg=;
        b=HrMB4MmsdsRYiGBq8lnN0XkLYyddc5l2D+lhV8INz5pZErzmqaRlN/N3iaE/Uai6NK
         Evuog1GQz4bFM6Yy9mzldvEnEerKBjmcNPW51ZckGNR/+Z8soFMZReCos+pVVNi5PRph
         B8GwtpLrokknHTswLk/TQImYYmyRjwJrZpqGeySKi0E8i0Vwm/qI8cREEqoWJFVCIVet
         E3jW5nolDwxH8TgimiEHW4qtWLCAzFBNP7sN8qx0QDYsSZCm6U5BHhYp0E9Ndm+bJNKR
         CKq43QjfP9RdnVe1JTB+jBxNie1oo7ugNqB0Ku2b9uz4gfvUYDNCFbGtvUsUTiEDH+ZW
         I6+A==
X-Gm-Message-State: ABy/qLbgjTOLl5BB5m9p/nLrXM3fcKG/sAnPLNESVLD/b9fE7Pl9vQF0
        PwIm/2bAwy3TO9cKKaeeWCb6fSJ4/KxGIF557WE=
X-Google-Smtp-Source: APBJJlGMau+M1IPRe0LLa+OiSRSSXpJ7LRZBRGrij57L1EhIqkGSrinmzBwHq/qSTRH1JvfByTCRUg==
X-Received: by 2002:a2e:8ec3:0:b0:2b6:d631:a1a0 with SMTP id e3-20020a2e8ec3000000b002b6d631a1a0mr8366988ljl.12.1688483038765;
        Tue, 04 Jul 2023 08:03:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:03:58 -0700 (PDT)
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
Subject: [PATCH v2 04/14] drm/msm/dpu: drop separate dpu_core_perf_tune overrides
Date:   Tue,  4 Jul 2023 18:03:44 +0300
Message-Id: <20230704150354.159882-5-dmitry.baryshkov@linaro.org>
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

