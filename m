Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3931C4E5066
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 11:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243574AbiCWKhT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 06:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234425AbiCWKhT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 06:37:19 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABEB25E81
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:35:49 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id d5so1937654lfj.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wg0hbuJGQD0rW3NS2J2abaYUfMQnRdpnEfedmX8RdXU=;
        b=MoXuN5KqDw2MBB2esSDEpcQZ/aWWk8oFPIZqsgvIgzgSvwMJNwEHAROZ8g303f5tP+
         2uOGceormc3MEOxctAk/4ZKTdoO+UU8hMjnSYIPUflQJRXaoVfuWXLJydI/pBz+GJgg9
         ddKnvS5OpQh4fQqv6XBK55U5OKYwpFKBB95ox5tH7DsmhI9g1unvo4Gz378tE9CGhOrd
         XDNUrsEABz0RiLUq1zguhHD+4ghc/zoQFNkZ9UXlOPUBKEZOJoIwd/MN9dzUHMaikEui
         eNT3pC9Kh0/ec0m8j0GHZQi0ocAMOFGqxlZ+72hYbmQdZaxO66Jnayh7jIHS+7yRNFZB
         QK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wg0hbuJGQD0rW3NS2J2abaYUfMQnRdpnEfedmX8RdXU=;
        b=OGerEAzpbb79TAyO2MeY2JlBmfAyLw7vhHc4nUrctal78ayBdaamieyHuHuZ+3SkwI
         YS65nfdbyKoWtxE1rXDTWhH54zMGmcWYTttX398MqMRtzzmIbjpBiwPogzspuDHhZkZt
         yV5qMBP6UGdzZFlvAKcWcVpa7VuNTox8X2hoNBCV5MqFcHZXOPetMUSYbgbUJWenGz7j
         l9IVuO3JxbUmgrNliqjW/lbXBBA0dTWrDUVPX+q6l/Tj+h2StLoZjSBpTtIrv+zQTl43
         EtVVDGjJc2IYeXgjq1DlYfYlnWPBxDAuJqO1958CuKNP1cNe2PiFEXQdWpg2i73yJ6gX
         ZX/w==
X-Gm-Message-State: AOAM5333hiUuWQ9rVEDZGG+kSMpXLRO+9CinvH9t1qJsMwAq7QruPJUg
        iXitgGXGZOzOzS12ALiXnzyXzQ==
X-Google-Smtp-Source: ABdhPJwSy5Gk8AWGzOVM+6hvqHCJZND7WPlt/9wTn9ALavqDdyQ31p2opp8eeUNskWFhM5R579ieFQ==
X-Received: by 2002:a19:761a:0:b0:44a:49e1:c4d6 with SMTP id c26-20020a19761a000000b0044a49e1c4d6mr2744542lff.71.1648031747963;
        Wed, 23 Mar 2022 03:35:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x14-20020a056512078e00b004481e3198cesm2491058lfr.142.2022.03.23.03.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 03:35:47 -0700 (PDT)
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
Subject: [PATCH 1/3] drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
Date:   Wed, 23 Mar 2022 13:35:44 +0300
Message-Id: <20220323103546.1772673-2-dmitry.baryshkov@linaro.org>
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

Since the commit ab205927592b ("drm/msm/dp: remove mode hard-coding in
case of DP CTS") the function dp_panel_get_modes() doesn't use (or fill)
the dp_mode argument. Drop it completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   | 2 +-
 drivers/gpu/drm/msm/dp/dp_panel.h   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 178b774a5fbd..3dd790083cf7 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1013,7 +1013,7 @@ int dp_display_get_modes(struct msm_dp *dp,
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 
 	ret = dp_panel_get_modes(dp_display->panel,
-		dp->connector, dp_mode);
+		dp->connector);
 	if (dp_mode->drm_mode.clock)
 		dp->max_pclk_khz = dp_mode->drm_mode.clock;
 	return ret;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index f1418722c549..8d7662028f30 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -259,7 +259,7 @@ u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel,
 }
 
 int dp_panel_get_modes(struct dp_panel *dp_panel,
-	struct drm_connector *connector, struct dp_display_mode *mode)
+	struct drm_connector *connector)
 {
 	if (!dp_panel) {
 		DRM_ERROR("invalid input\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index 9023e5bb4b8b..9fa6e524832c 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -64,7 +64,7 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
 u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel, u32 mode_max_bpp,
 			u32 mode_pclk_khz);
 int dp_panel_get_modes(struct dp_panel *dp_panel,
-		struct drm_connector *connector, struct dp_display_mode *mode);
+		struct drm_connector *connector);
 void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
 void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
 
-- 
2.35.1

