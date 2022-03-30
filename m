Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC014ECFAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 00:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351628AbiC3WcB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 18:32:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233684AbiC3WcA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 18:32:00 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FB75BD27
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 15:30:14 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t25so38276071lfg.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 15:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G2hk/9qDM82KvHuI4eFXE9v1so9dGAMWYy4S2wfnB8k=;
        b=kQIlmYwddD3WvCElql9vEZxabKNyckDBrjeAN9R5X5t37qlbMwCPf1tE1W8qm8JOOn
         CEU3b7dVPB2lVgEz3h3yAXeEUjNEI8HqsbSjXNEVr8qIOvxFmbTZIHa+Hc9dZi5Xq30k
         FYLP/PPH92c6K+uCApPWZuIpVvQr+o0FR/S7JmJm/6AKA6C83HdqejxJpW0NWl1PFx47
         Q3OVNU5RzsL0Rn8TXu+efgGGGSM25OWcdrOYeix/Jf0fs1zfncGb3YKGJesMTDBU1QEG
         oThsUmGv41Pobi+Zr5R7gtcf5tdGdMhyTHzsOzm+cuuJhspW0g8RoCmDBrvX0IyKlBP9
         jckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G2hk/9qDM82KvHuI4eFXE9v1so9dGAMWYy4S2wfnB8k=;
        b=hm2k42plK/k9xZu5k2yUMIR18sGpGxdQ6rQWY2h58R27znIynOmmz2rqQIx0ydML7/
         K3zz6rGKCrmQFlzVkaDCsNbxjmqueI/YxaoZUge3OvDJuLJ35OdDLhFZYGXS73+sjwal
         ++HsecjjtZk/Sb4TqSycAqOBInq51NpjD/pCVSdJVTAlsTEOgVh2NxIabWG+f3zOA66r
         +klGPUOjBWvmLz+hAg7BCzSv/BBcWg9kAEWLPC+Gzvf+R1QSInozOvs/ti2WUZp3oFVV
         Bcb6wP6Sxnx3zCoMK7xKvMMkkaUd6rbyaujGCEqv3pdFepZIDXo8YXKr5b+OqSHKH3zL
         vQMA==
X-Gm-Message-State: AOAM531Hz7BfToF32UQ/47HT6T8aWTG5CZpycMrSPU7LH/n2d3jDXyDK
        JJxUkms+uRbFlr1FJ5Vw4p1t8tqajUOAFw==
X-Google-Smtp-Source: ABdhPJwUK0xnWY1kVVPKAkgbzvh7LLrv7chF8tKzWPeso0tHOSwbWmh4aPqlTjx0QAfojLjHP7VkfA==
X-Received: by 2002:a19:4f1a:0:b0:44a:22fa:704 with SMTP id d26-20020a194f1a000000b0044a22fa0704mr8712252lfb.59.1648679412352;
        Wed, 30 Mar 2022 15:30:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a4-20020a2eb164000000b0024988e1cfb6sm2521295ljm.94.2022.03.30.15.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 15:30:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Subject: [PATCH v2 3/4] drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display
Date:   Thu, 31 Mar 2022 01:30:07 +0300
Message-Id: <20220330223008.649274-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
References: <20220330223008.649274-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since the last commit, the max_pclk_khz became constant, it's set to
DP_MAX_PIXEL_CLK_KHZ and never changed afterwards. Remove it completely
and use DP_MAX_PIXEL_CLK_KHZ directly.

Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_debug.c   | 2 --
 drivers/gpu/drm/msm/dp/dp_display.c | 1 -
 drivers/gpu/drm/msm/dp/dp_display.h | 2 --
 drivers/gpu/drm/msm/dp/dp_drm.c     | 4 +---
 drivers/gpu/drm/msm/dp/dp_panel.h   | 1 -
 5 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 2f9c943f12d5..5e35033ba3e4 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -44,8 +44,6 @@ static int dp_debug_show(struct seq_file *seq, void *p)
 	drm_mode = &debug->panel->dp_mode.drm_mode;
 
 	seq_printf(seq, "\tname = %s\n", DEBUG_NAME);
-	seq_printf(seq, "\tdp_panel\n\t\tmax_pclk_khz = %d\n",
-			debug->panel->max_pclk_khz);
 	seq_printf(seq, "\tdrm_dp_link\n\t\trate = %u\n",
 			debug->panel->link_info.rate);
 	seq_printf(seq, "\t\tnum_lanes = %u\n",
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 93cdc4ebcf43..72deef8f1ecb 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -370,7 +370,6 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 	dp->audio_supported = drm_detect_monitor_audio(edid);
 	dp_panel_handle_sink_request(dp->panel);
 
-	dp->dp_display.max_pclk_khz = DP_MAX_PIXEL_CLK_KHZ;
 	dp->dp_display.max_dp_lanes = dp->parser->max_dp_lanes;
 
 	/*
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 6efb5c853c89..f3a9d7449a1c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -24,8 +24,6 @@ struct msm_dp {
 
 	hdmi_codec_plugged_cb plugged_cb;
 
-	u32 max_pclk_khz;
-
 	u32 max_dp_lanes;
 	struct dp_audio *dp_audio;
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index af5f1b001192..a94c9b34f397 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -88,9 +88,7 @@ static enum drm_mode_status dp_connector_mode_valid(
 
 	dp_disp = to_dp_connector(connector)->dp_display;
 
-	if ((dp_disp->max_pclk_khz <= 0) ||
-			(dp_disp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
-			(mode->clock > dp_disp->max_pclk_khz))
+	if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
 		return MODE_BAD;
 
 	return dp_display_validate_mode(dp_disp, mode->clock);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9fa6e524832c..d861197ac1c8 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -49,7 +49,6 @@ struct dp_panel {
 	bool video_test;
 
 	u32 vic;
-	u32 max_pclk_khz;
 	u32 max_dp_lanes;
 
 	u32 max_bw_code;
-- 
2.35.1

