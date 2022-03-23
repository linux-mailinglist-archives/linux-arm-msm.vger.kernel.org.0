Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 846094E5067
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 11:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243573AbiCWKhU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 06:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243575AbiCWKhU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 06:37:20 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D9365BE55
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:35:50 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 5so1970387lfp.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UfY59Lvfs679CdBS3dlJYWd3KFvJJK8gBeG28SiQQ1c=;
        b=B+i6jwP4IuNEhyhy0932UFncRI/DxA+H6eGRSI9UWUigYSUK4ogCNah1BBM5mCQTpn
         KX7Xz9lze/X+ZpTPARG/kfIxNHBIkXqhyyK3g9Qm1wl9n+JtlT1HlAHCK9OHrdWFvrhc
         fR4BlEHdclro2Zs8nwhq2HKwF9yoMSPkSX4/M2ickh9HH5b2WU/DWQ0nw0TfYroqNHqv
         Z7HoPqaejj0Fp1j7x0ZP0MX+DWyIYDAYiSgr93zDqhUJwJQ1JR8cLC2A2BlgLLwCcjtK
         jjhiSSBK1MD5Y2pU9fN5YvvzeNVvgep1Hh+rviLbuWXedYczUrkDSikgJSYN7fV1RG6U
         yiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UfY59Lvfs679CdBS3dlJYWd3KFvJJK8gBeG28SiQQ1c=;
        b=KSg3wtQdCH2uEl20FMNcIt6Vtdu18kMzo0aqV9tU6LrNSusQtSeHFpqlRoIC1TbCjF
         tOKk196YjUODBXfDyK6dmLEODJnOvhZ77w9An7H5nVIJuctQvSTSoYzCEJ8Ebwua8Frr
         uhh9RdPrZa7l3747OkKtuDDnX+qj4MZZkd8t1clKg3I8bOUr9NLinTcX0fFTXRrZUpF1
         DSUGCeuR1HKmblSL/0AL4fLTGjrZK9BMpqKB5wedrP7huKuqDU9jWafztN9QoBe+rhbj
         Xu+FjGvb21UeE5m/O9FgqjlNd5mxPA/ZhqqGoLCZgGQOrQlF+Mjc5pUv9lxiAwEaHKCG
         dCDA==
X-Gm-Message-State: AOAM5333KDVO3DR9haeEU2QfFMx0Yg5YrukP7lVCfc91bKkbbzFgkdwd
        5GolSk4soLiHoKfJYLQc/ytKXg==
X-Google-Smtp-Source: ABdhPJyiB0urhzvnluPQgy+cD/Gwe0Ohxa4H8ajiW/+VG/QYMsEpkdTLEqlqv5ko+LMgJsXO/suUig==
X-Received: by 2002:ac2:4c04:0:b0:443:ac94:3de5 with SMTP id t4-20020ac24c04000000b00443ac943de5mr21630080lfq.329.1648031748841;
        Wed, 23 Mar 2022 03:35:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x14-20020a056512078e00b004481e3198cesm2491058lfr.142.2022.03.23.03.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 03:35:48 -0700 (PDT)
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
Subject: [PATCH 2/3] drm/msm/dp: simplify dp_connector_get_modes()
Date:   Wed, 23 Mar 2022 13:35:45 +0300
Message-Id: <20220323103546.1772673-3-dmitry.baryshkov@linaro.org>
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

Since dp_panel_get_modes() handling for dp_mode was removed,
dp_display_get_modes also doesn't change the passed dp_mode, drop the
unused dp_mode variable being allocated unused and then freed.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  8 ++------
 drivers/gpu/drm/msm/dp/dp_display.h |  3 +--
 drivers/gpu/drm/msm/dp/dp_drm.c     | 29 +----------------------------
 3 files changed, 4 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3dd790083cf7..be1e9c558fda 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -999,8 +999,7 @@ int dp_display_validate_mode(struct msm_dp *dp, u32 mode_pclk_khz)
 	return MODE_OK;
 }
 
-int dp_display_get_modes(struct msm_dp *dp,
-				struct dp_display_mode *dp_mode)
+int dp_display_get_modes(struct msm_dp *dp)
 {
 	struct dp_display_private *dp_display;
 	int ret = 0;
@@ -1012,11 +1011,8 @@ int dp_display_get_modes(struct msm_dp *dp,
 
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
-	ret = dp_panel_get_modes(dp_display->panel,
+	return dp_panel_get_modes(dp_display->panel,
 		dp->connector);
-	if (dp_mode->drm_mode.clock)
-		dp->max_pclk_khz = dp_mode->drm_mode.clock;
-	return ret;
 }
 
 bool dp_display_check_video_test(struct msm_dp *dp)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 7af2b186d2d9..6efb5c853c89 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -33,8 +33,7 @@ struct msm_dp {
 int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 		hdmi_codec_plugged_cb fn, struct device *codec_dev);
 int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
-int dp_display_get_modes(struct msm_dp *dp_display,
-		struct dp_display_mode *dp_mode);
+int dp_display_get_modes(struct msm_dp *dp_display);
 int dp_display_request_irq(struct msm_dp *dp_display);
 bool dp_display_check_video_test(struct msm_dp *dp_display);
 int dp_display_get_test_bpp(struct msm_dp *dp_display);
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 80f59cf99089..af5f1b001192 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -55,49 +55,22 @@ static int dp_connector_get_modes(struct drm_connector *connector)
 {
 	int rc = 0;
 	struct msm_dp *dp;
-	struct dp_display_mode *dp_mode = NULL;
-	struct drm_display_mode *m, drm_mode;
 
 	if (!connector)
 		return 0;
 
 	dp = to_dp_connector(connector)->dp_display;
 
-	dp_mode = kzalloc(sizeof(*dp_mode),  GFP_KERNEL);
-	if (!dp_mode)
-		return 0;
-
 	/* pluggable case assumes EDID is read when HPD */
 	if (dp->is_connected) {
-		/*
-		 *The get_modes() function might return one mode that is stored
-		 * in dp_mode when compliance test is in progress. If not, the
-		 * return value is equal to the total number of modes supported
-		 * by the sink
-		 */
-		rc = dp_display_get_modes(dp, dp_mode);
+		rc = dp_display_get_modes(dp);
 		if (rc <= 0) {
 			DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
-			kfree(dp_mode);
 			return rc;
 		}
-		if (dp_mode->drm_mode.clock) { /* valid DP mode */
-			memset(&drm_mode, 0x0, sizeof(drm_mode));
-			drm_mode_copy(&drm_mode, &dp_mode->drm_mode);
-			m = drm_mode_duplicate(connector->dev, &drm_mode);
-			if (!m) {
-				DRM_ERROR("failed to add mode %ux%u\n",
-				       drm_mode.hdisplay,
-				       drm_mode.vdisplay);
-				kfree(dp_mode);
-				return 0;
-			}
-			drm_mode_probed_add(connector, m);
-		}
 	} else {
 		DRM_DEBUG_DP("No sink connected\n");
 	}
-	kfree(dp_mode);
 	return rc;
 }
 
-- 
2.35.1

