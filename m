Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B67474ECFAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Mar 2022 00:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351627AbiC3WcA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Mar 2022 18:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351628AbiC3Wb7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Mar 2022 18:31:59 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 235715BD30
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 15:30:13 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id d5so38278739lfj.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Mar 2022 15:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xqfEw4UqTCnx51jjs0rgqmjBtEaHi5KxWmkQyvq+0UI=;
        b=Fp8vb9sL3gbHXRVVg0GfGLJTnC7lAtdsgh9yjYXvnLHd+tuE91nd379l3kyO0ZWHp5
         ArGtPZ+7vAg2p9biYCYKIQWh1yl8hBhMqE9QDagljgveD5jR+xb27HFuUkWpKryCWdgM
         OXfSW/QYnfK2uU4bSPWDGh9ZBCsce+3qZGY/XngQFrj78Kq6nr85JGqSEYiZ6rGaBaNc
         memhjQIYTOBTqgYK9q0tSaaRYWSaWP9m4feks8HQb8WrMu5C6dx9OLnNX3/LxY+3YBva
         tpjQp6Ix3cDO4hY0A/4huk2ExHm7TgMtMfXL7dO7yIdtsOfBAHvbXNNLYzkymjjeobRl
         I0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xqfEw4UqTCnx51jjs0rgqmjBtEaHi5KxWmkQyvq+0UI=;
        b=RUvSNtZDjCjK2B0+kutNsMM37uKO+XR5wfIUuzGdhowbYkhe4XGhD6F5EBwKeLCrZx
         H/AaXc39bpog+kKUYG6YrUGYvJPkawNMoDPkAZ8VMBtoV65UErISPwZApP3v00mRzOA3
         XvYe53w9s5D37n0z4afo9lI9UM8p3aDnLTK1fGW22tP73CLa7sFQbIwkfjwvR76mO9yK
         xxEBvX9fiiamdTpUN2eXowHfpEdXsI3d+I5fG8nXp3dzfg46tJkFQ0rXMs2qxluw+E9p
         DJaU3mW1uYdvx4BEjH1dgw/DYoNQndvgygv8E8ds5igNczE5f+ulQ7lE01OSWyFPe7gi
         rXaA==
X-Gm-Message-State: AOAM531uWRcKqaR9HEN0wg9pzEsrH2l+nhY5qXkT1tm8tnF84TmDEMQR
        Ir27JEryltj7gQ1VA/BcTUenjw==
X-Google-Smtp-Source: ABdhPJxCu2GlcJuX2nxX8bCqtGn2nIFNzbSm/5H2yFUYt8PEWzpIkA0t76lNSNR7FWc/DDx0UeG7Pg==
X-Received: by 2002:a05:6512:3c9a:b0:44a:27db:632b with SMTP id h26-20020a0565123c9a00b0044a27db632bmr8325427lfv.625.1648679411397;
        Wed, 30 Mar 2022 15:30:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a4-20020a2eb164000000b0024988e1cfb6sm2521295ljm.94.2022.03.30.15.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 15:30:10 -0700 (PDT)
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
Subject: [PATCH v2 2/4] drm/msm/dp: simplify dp_connector_get_modes()
Date:   Thu, 31 Mar 2022 01:30:06 +0300
Message-Id: <20220330223008.649274-3-dmitry.baryshkov@linaro.org>
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

Since dp_panel_get_modes() handling for dp_mode was removed,
dp_display_get_modes also doesn't change the passed dp_mode, drop the
unused dp_mode variable being allocated unused and then freed.

Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 ++-------
 drivers/gpu/drm/msm/dp/dp_display.h |  3 +--
 drivers/gpu/drm/msm/dp/dp_drm.c     | 29 +----------------------------
 3 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 3dd790083cf7..93cdc4ebcf43 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -999,11 +999,9 @@ int dp_display_validate_mode(struct msm_dp *dp, u32 mode_pclk_khz)
 	return MODE_OK;
 }
 
-int dp_display_get_modes(struct msm_dp *dp,
-				struct dp_display_mode *dp_mode)
+int dp_display_get_modes(struct msm_dp *dp)
 {
 	struct dp_display_private *dp_display;
-	int ret = 0;
 
 	if (!dp) {
 		DRM_ERROR("invalid params\n");
@@ -1012,11 +1010,8 @@ int dp_display_get_modes(struct msm_dp *dp,
 
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

