Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0EDC4E5069
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 11:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243575AbiCWKhV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 06:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234425AbiCWKhU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 06:37:20 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F03C25E81
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:35:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id l20so1916861lfg.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jKB5fmiWOvzOX14q2kw2udn22WzFeSJad1vyh/bFUeU=;
        b=hUDeR1gYXCpZoo8aJ9xzuPNvlOSYwSMooYjSow4DM1nBMfcwBwTiswCutViipiCKWo
         IN3RPVc1OUza5FLP1mscbYuQAgsMGZ6Po207HTlzHjmWDRdRsTf10EricuEaL5K1mrM6
         ycEwsPavC9greW/zcSZ2jX0vX4aHdqIRHTDDa+0VFyP1wWkvvhHQH4o6F0e0CL420gFG
         bPfvWCBUrn7sQJaolSiEmWRhoH7gpXWR0zBSo17kVM/mUgPaTw3wY3QS+5RQIa/S4h5O
         IfbzCoP4EpFBKqQ1EozjYbJ9+Sk9QrOB2Caz8uD7OaH/RzMcy2bMRFoYWsViYLquQfZZ
         0f8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jKB5fmiWOvzOX14q2kw2udn22WzFeSJad1vyh/bFUeU=;
        b=Ks4T3BDk6gnYykp3ab86B2dumynbJIjDHUfSn9z9EJ3/MzLCLQOJ+MT5s98QTFB9JW
         CnRvd7hNewsJTKjXlVfoqzR1hAIJ9dTcN55Saw3f07jPBjEpfZQqtEvxLhEbALmrJifc
         7OKUEkxx+eKoErz489p0WZ/ei/FnjoaNK8QYHr/PvN/nj4ro8o7DOVs5+a/ISndilaVD
         KZf2pup/C5orck5Ox2JrANLgUsIFpBvaXYAGqzx5E/Prx8nw4fZuukZKXszEoEFjvL7z
         6Cp6129PdGAWJOcZugWNhmVZR81yEtJVKdfCh974d0xFy3pTctgyjQzsrd7oCbR9ngb3
         jdXg==
X-Gm-Message-State: AOAM531MpJWs8XtHSbaSP77eHoj85xoYHq6eknPGs0rWoFXbucWYzXmZ
        X0LIXb/6nvXdpvjSie9eR+JebA==
X-Google-Smtp-Source: ABdhPJxz66eq0PKhDvhJx3A0bfCwuf3GxcLxf1SXuGJA/glHt4BWKczUOwm6tFaN4A0Hqfb0uLZdvA==
X-Received: by 2002:a05:6512:3194:b0:44a:3acd:2078 with SMTP id i20-20020a056512319400b0044a3acd2078mr5718858lfe.483.1648031749566;
        Wed, 23 Mar 2022 03:35:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x14-20020a056512078e00b004481e3198cesm2491058lfr.142.2022.03.23.03.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 03:35:49 -0700 (PDT)
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
Subject: [PATCH 3/3] drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display
Date:   Wed, 23 Mar 2022 13:35:46 +0300
Message-Id: <20220323103546.1772673-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
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
index be1e9c558fda..aeb08416b309 100644
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

