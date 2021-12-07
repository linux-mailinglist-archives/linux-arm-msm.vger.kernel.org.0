Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4811D46C774
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Dec 2021 23:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233241AbhLGWcp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Dec 2021 17:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236911AbhLGWcp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Dec 2021 17:32:45 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7307CC061746
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Dec 2021 14:29:14 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id e11so736214ljo.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Dec 2021 14:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KQyhi8Tuxu4/knDgfSprik7qylpNwng9tPAXIuAarNU=;
        b=k/AvE5IQ4Q/PFTfvJMJ0uSLl5kcm6XNcaI9lVQ45leWD0miLV5lZHTzOeEpb+pLhNQ
         +D0v7qQ8+l8B7LPLkr99/0D7TAgq6FVa6URdy0Oeb3qVg5g5KDlckKPR3JAbRQxKpeCg
         Kkrb2tytTbO7EmZiQHMGCiReqcoQYWGDKPMtg89Q45EF8gE0j1P11v/LKWuP2tv1Kgr6
         PwjVlQtyds1IMXskORj8WGpCRNMb/fivMQ7a84WjJMo7pmFTW1SjALjeL2sIc8RAt+U9
         DSq2+XQ5xC/PfBIbnZRKM9AzkaVdNnq2UhdDKgilj+0PjYh73M0SGZXO1w43bnvynu27
         K1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KQyhi8Tuxu4/knDgfSprik7qylpNwng9tPAXIuAarNU=;
        b=u5ouUABSHy2mxp0Tr0J4oqsvlRjVyz+GFDf0y4NCiYTaP11u+rFgIct9mLLXJFTnfd
         7yPER+Vjouv1+4VUKgDBwh+S8Ko2LqgwmEvFoaA++LcbuQmCf1+NF/ywoseLOOFKmEBe
         FQOwaQ/khApbQBPVjBCtcWuNKOVvE6ZXm/V6QEE8hGCxU7Ny8H8ufRRQv2ezU4Wr6InN
         nq9/At4bnfIc1NqvZ91bvjvdJrs7bXvm/FsvPhEr9QCqaQcnQy+4yLym3RbU3QalNus+
         itGZb77eC07O9PM/O4Yt68y/SYbtgPdcieNRD+ZNpVquvxjmPVPlE1RIhl9QiOp00d/A
         VUuw==
X-Gm-Message-State: AOAM5331PhQowWa0Tt9iNt15yik2ogFF/wa/UCfDnDNgvCKud0+jWAl1
        JFj580Jp7mDyySBSoIPJzmVmZA==
X-Google-Smtp-Source: ABdhPJwaJD5QSZR55EHDPoWozhEUL1ggzjH3xoDUZkWnIZmB4+spSLntf0X6cX/dbQC/au0flZ2kVQ==
X-Received: by 2002:a2e:a54d:: with SMTP id e13mr43939891ljn.319.1638916152710;
        Tue, 07 Dec 2021 14:29:12 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p22sm79423lfe.257.2021.12.07.14.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 14:29:12 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dsi: move DSI host powerup to modeset time
Date:   Wed,  8 Dec 2021 01:29:00 +0300
Message-Id: <20211207222901.988484-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
References: <20211207222901.988484-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DSI subsystem does not fully fall into the pre-enable/enable system
of callbacks, since typically DSI device bridge drivers expect to be
able to communicate with DSI devices at the pre-enable() callback. The
reason is that for some DSI hosts enabling the video stream would
prevent other drivers from sending DSI commands. For example see the
panel-bridge driver, which does drm_panel_prepare() from the
pre_enable() callback (which would be called before our pre_enable()
callback, resulting in panel preparation failures as the link is not yet
ready).

Therewere several attempts to solve this issue, but currently the best
approach is to power up the DSI link from the mode_set() callback,
allowing next bridge/panel to use DSI transfers in the pre_enable()
time. Follow this approach.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 43 +++++++++++++++++++--------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 681ca74fe410..497719efb9e9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -336,13 +336,12 @@ dsi_mgr_connector_best_encoder(struct drm_connector *connector)
 	return msm_dsi_get_encoder(msm_dsi);
 }
 
-static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
+static void dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 {
 	int id = dsi_mgr_bridge_get_id(bridge);
 	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
 	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
 	struct mipi_dsi_host *host = msm_dsi->host;
-	struct drm_panel *panel = msm_dsi->panel;
 	struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
 	bool is_bonded_dsi = IS_BONDED_DSI();
 	int ret;
@@ -383,6 +382,34 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (is_bonded_dsi && msm_dsi1)
 		msm_dsi_host_enable_irq(msm_dsi1->host);
 
+	return;
+
+host1_on_fail:
+	msm_dsi_host_power_off(host);
+host_on_fail:
+	dsi_mgr_phy_disable(id);
+phy_en_fail:
+	return;
+}
+
+static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
+{
+	int id = dsi_mgr_bridge_get_id(bridge);
+	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
+	struct msm_dsi *msm_dsi1 = dsi_mgr_get_dsi(DSI_1);
+	struct mipi_dsi_host *host = msm_dsi->host;
+	struct drm_panel *panel = msm_dsi->panel;
+	bool is_bonded_dsi = IS_BONDED_DSI();
+	int ret;
+
+	DBG("id=%d", id);
+	if (!msm_dsi_device_connected(msm_dsi))
+		return;
+
+	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
+	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
+		return;
+
 	/* Always call panel functions once, because even for dual panels,
 	 * there is only one drm_panel instance.
 	 */
@@ -417,17 +444,7 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (panel)
 		drm_panel_unprepare(panel);
 panel_prep_fail:
-	msm_dsi_host_disable_irq(host);
-	if (is_bonded_dsi && msm_dsi1)
-		msm_dsi_host_disable_irq(msm_dsi1->host);
 
-	if (is_bonded_dsi && msm_dsi1)
-		msm_dsi_host_power_off(msm_dsi1->host);
-host1_on_fail:
-	msm_dsi_host_power_off(host);
-host_on_fail:
-	dsi_mgr_phy_disable(id);
-phy_en_fail:
 	return;
 }
 
@@ -573,6 +590,8 @@ static void dsi_mgr_bridge_mode_set(struct drm_bridge *bridge,
 	msm_dsi_host_set_display_mode(host, adjusted_mode);
 	if (is_bonded_dsi && other_dsi)
 		msm_dsi_host_set_display_mode(other_dsi->host, adjusted_mode);
+
+	dsi_mgr_bridge_power_on(bridge);
 }
 
 static const struct drm_connector_funcs dsi_mgr_connector_funcs = {
-- 
2.33.0

