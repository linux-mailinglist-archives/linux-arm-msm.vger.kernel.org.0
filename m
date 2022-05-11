Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C164524089
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 01:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349000AbiEKXHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 19:07:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348992AbiEKXHy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 19:07:54 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 706205B8A8
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 16:07:53 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id j10-20020a17090a94ca00b001dd2131159aso6267591pjw.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 16:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+h5BGQI49DQhmjTX/s14iEXNSZvSAwC6EupheV291XM=;
        b=Kf6FrMiEHjfjgfJDZBcMBtfwhvrQBGI8YwXYvszIiRGeAevlX/VNGJ7UBEIpS5gcD6
         wIOo7hmnT9KxBUpZCKlhpH/DypcqSV1BTLiOoGqqu+jv06Lni3KphsYn87K1GMHGpgOg
         Wyff30l9oQ6lcC4u6AiQ/D1Wr+0xajD28SwUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+h5BGQI49DQhmjTX/s14iEXNSZvSAwC6EupheV291XM=;
        b=7g3Dvrgn0MtY6Q/S4DcOKumUVUC2p/9OMEsE6TGoNO8fv9cTzFiXSMjZ8xR8vI8jbN
         w4yfBzmtJEb8N2Q5gzO1NPHYp1Cr84pia+QFKOZ4mps3/vWUDg2swoxIbUrzZxdym0t3
         bp+Hnu64XIdoVklT9E+fE4pRppz6dvswRXhslT7mijWJX+qu7pCbDGAFsFkgW9m8Kkpj
         Pjqm3a6Le1o359G7+9SI8kEJBbLBKex32yMAAX5Fb4qEcpW9Uv0TI0sauCCsVuZJXeu3
         FzvlSpmXnEJyCkS7LPz3EkLYk8WcL7C15p9U9KUPm0e08XbNszBfV+qq9pSgC6y3QHDQ
         XEbQ==
X-Gm-Message-State: AOAM533RT5NIAypaEMMbzKht52cusn9pkrUdVG2GLOk6Ds29AjKkomcZ
        mJP8mXM8pX9sxd3UHLmyxwMFpw==
X-Google-Smtp-Source: ABdhPJxB2qvIIMgI6yy/IZ+UdmjxpvtVH1PdpeNF88kRVGM0lXOSoqgHygFnKX7NE9n58Hd5f8EwSw==
X-Received: by 2002:a17:90a:b10c:b0:1d9:49de:81c5 with SMTP id z12-20020a17090ab10c00b001d949de81c5mr7602112pjq.120.1652310472972;
        Wed, 11 May 2022 16:07:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:504e:720d:de58:4f66])
        by smtp.gmail.com with ESMTPSA id u8-20020a170902714800b0015e8d4eb276sm2398985plm.192.2022.05.11.16.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 16:07:52 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Matt Turner <msturner@google.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "FROMGIT: drm/msm/dsi: move DSI host powerup to modeset time"
Date:   Wed, 11 May 2022 16:07:41 -0700
Message-Id: <20220511160720.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit c7e4a2a72e696aa6aed2c8b651279f491bb096fe.

The patch causes sc7180 Chromebooks that use the parade-ps8640 bridge
chip to fail to turn the display back on after it turns off.

Let's revert to get these devices back to a working state. It seems
like the DSI powerup problem is somewhat common and probably we should
land something more general like Dave Stevenson's series [1] that
would give more flexibility.

[1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com

Fixes: c7e4a2a72e69 ("FROMGIT: drm/msm/dsi: move DSI host powerup to modeset time")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 ++++++++-------------------
 1 file changed, 12 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 50b987658b1f..8d51711a3417 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -315,12 +315,13 @@ dsi_mgr_connector_best_encoder(struct drm_connector *connector)
 	return msm_dsi_get_encoder(msm_dsi);
 }
 
-static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
+static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 {
 	int id = dsi_mgr_bridge_get_id(bridge);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
 	struct mipi_dsi_host *host = msm_dsi->host;
+	struct drm_panel *panel = msm_dsi->panel;
 	struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
 	bool is_bonded_dsi = IS_BONDED_DSI();
 	int ret;
@@ -361,34 +362,6 @@ static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 	if (is_bonded_dsi && msm_dsi1)
 		msm_dsi_host_enable_irq(msm_dsi1->host);
 
-	return;
-
-host1_on_fail:
-	msm_dsi_host_power_off(host);
-host_on_fail:
-	dsi_mgr_phy_disable(id);
-phy_en_fail:
-	return;
-}
-
-static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
-{
-	int id = dsi_mgr_bridge_get_id(bridge);
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
-	struct mipi_dsi_host *host = msm_dsi->host;
-	struct drm_panel *panel = msm_dsi->panel;
-	bool is_bonded_dsi = IS_BONDED_DSI();
-	int ret;
-
-	DBG("id=%d", id);
-	if (!msm_dsi_device_connected(msm_dsi))
-		return;
-
-	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
-	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
-		return;
-
 	/* Always call panel functions once, because even for dual panels,
 	 * there is only one drm_panel instance.
 	 */
@@ -423,7 +396,17 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (panel)
 		drm_panel_unprepare(panel);
 panel_prep_fail:
+	msm_dsi_host_disable_irq(host);
+	if (is_bonded_dsi && msm_dsi1)
+		msm_dsi_host_disable_irq(msm_dsi1->host);
 
+	if (is_bonded_dsi && msm_dsi1)
+		msm_dsi_host_power_off(msm_dsi1->host);
+host1_on_fail:
+	msm_dsi_host_power_off(host);
+host_on_fail:
+	dsi_mgr_phy_disable(id);
+phy_en_fail:
 	return;
 }
 
@@ -569,8 +552,6 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
 	msm_dsi_host_set_display_mode(host, adjusted_mode);
 	if (is_bonded_dsi && other_dsi)
 		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
-
-	dsi_mgr_bridge_power_on(bridge);
 }
 
 static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
-- 
2.36.0.550.gb090851708-goog

