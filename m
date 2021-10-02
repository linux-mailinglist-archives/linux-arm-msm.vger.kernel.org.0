Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E3D41F8F6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Oct 2021 03:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231175AbhJBBKS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 21:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhJBBKS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 21:10:18 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAEA0C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 18:08:32 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id e15so45135561lfr.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 18:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S30XTICHpcD0uvi/avqu8bnv3xWt4/R9/QdUwoHSigA=;
        b=MCvVlOIAnO01PhNfLaI9ZD6qiBKU095jQuZtiS1P39lv1Lhh2XRTBlBj3EabQQxODH
         IG4J5c5a78J/GypHq5hTSp7sFwCFvUMJCIjMxCPhK65dFBn/hDH6oGOaAUXrUWNDGU4K
         y2O303bYmAglKx5cdwm1zdqsAjLwn8IxQPLMCt3bBKdSy0w8w3vcEyQQt53Jk0QgPSVh
         aI9gqvQyv8SYNDRwHxgWlzGN6pnxMErz18OzAwZv3Y3+pC9V4vtN5QIkEtJoAcK8Kq6S
         iDHu6dy5JRqLHCcDeoX+rNzY+bGcQ7hURdOK9kdRDSJSWxPEtBnHl4ICEbIMFPHUeQtX
         N9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S30XTICHpcD0uvi/avqu8bnv3xWt4/R9/QdUwoHSigA=;
        b=TCnhfOPJfL7wUOhoPnz2a8yLeyOKm6e+2XmPTF9IQrDHzY2IggaQzpYvZXHDkGhftG
         u0upGqnaRMnUSlzoWH55Rvzh6sECbXQOvYhdwWhdT1EoarB89BZ9HED8BKAj3RjkmmX9
         vAs7u3vlqZFlMKJBwLZXmM8edh/Wg63Uh56eHn/2wmyf6nz66J3QkPbiJaqkBA7Wmhd7
         Wo3Hs1hzMdyRrwdB88jpfB/Zqm7TKlCQaOIyj3imAO1crQMY8ovAe91R/as6k42YnXdP
         LzbaRy/jBlgfEYFk412Zdv7/unjOWuAlvSt8sc+MTICqgsUfuAkzPiaKzUppaVolClNo
         aq+Q==
X-Gm-Message-State: AOAM5316Pqu5wi+YOsqxBMTxoMDQqcUuL/z/P5oBacxV9T7WXLMpkbHo
        AuwAVyYBtBLSYVhmitCwDhwEww==
X-Google-Smtp-Source: ABdhPJx6kcm35k671IBr2x97kCTiPppQ012pDS87srvpn6bY0+5UELCA/LwskvKEDJf73Gc0yIot9Q==
X-Received: by 2002:a05:6512:1042:: with SMTP id c2mr1214514lfb.26.1633136911310;
        Fri, 01 Oct 2021 18:08:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p19sm977993lfr.210.2021.10.01.18.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 18:08:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3] drm/msm/dsi: do not enable irq handler before powering up the host
Date:   Sat,  2 Oct 2021 04:08:30 +0300
Message-Id: <20211002010830.647416-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DSI host might be left in some state by the bootloader. If this
state generates an IRQ, it might hang the system by holding the
interrupt line before the driver sets up the DSI host to the known
state.

Move the request_irq into msm_dsi_host_init and pass IRQF_NO_AUTOEN to
it. Call enable/disable_irq after msm_dsi_host_power_on/_off()
functions, so that we can be sure that the interrupt is delivered when
the host is in the known state.

It is not possible to defer the interrupt enablement to a later point,
because drm_panel_prepare might need to communicate with the panel over
the DSI link and that requires working interrupt.

Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  2 ++
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 48 +++++++++++++++++----------
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 16 +++++++++
 3 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index b50db91cb8a7..569c8ff062ba 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -107,6 +107,8 @@ void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host,
 					u32 dma_base, u32 len);
 int msm_dsi_host_enable(struct mipi_dsi_host *host);
 int msm_dsi_host_disable(struct mipi_dsi_host *host);
+void msm_dsi_host_enable_irq(struct mipi_dsi_host *host);
+void msm_dsi_host_disable_irq(struct mipi_dsi_host *host);
 int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 			struct msm_dsi_phy_shared_timings *phy_shared_timings,
 			bool is_bonded_dsi, struct msm_dsi_phy *phy);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index e269df285136..ce26eb78cb6c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1898,6 +1898,23 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 		return ret;
 	}
 
+	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+	if (msm_host->irq < 0) {
+		ret = msm_host->irq;
+		dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
+		return ret;
+	}
+
+	/* do not autoenable, will be enabled later */
+	ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
+			IRQF_TRIGGER_HIGH | IRQF_ONESHOT | IRQF_NO_AUTOEN,
+			"dsi_isr", msm_host);
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
+				msm_host->irq, ret);
+		return ret;
+	}
+
 	init_completion(&msm_host->dma_comp);
 	init_completion(&msm_host->video_comp);
 	mutex_init(&msm_host->dev_mutex);
@@ -1941,25 +1958,8 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
-	struct platform_device *pdev = msm_host->pdev;
 	int ret;
 
-	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (msm_host->irq < 0) {
-		ret = msm_host->irq;
-		DRM_DEV_ERROR(dev->dev, "failed to get irq: %d\n", ret);
-		return ret;
-	}
-
-	ret = devm_request_irq(&pdev->dev, msm_host->irq,
-			dsi_host_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-			"dsi_isr", msm_host);
-	if (ret < 0) {
-		DRM_DEV_ERROR(&pdev->dev, "failed to request IRQ%u: %d\n",
-				msm_host->irq, ret);
-		return ret;
-	}
-
 	msm_host->dev = dev;
 	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
 	if (ret) {
@@ -2315,6 +2315,20 @@ void msm_dsi_host_get_phy_clk_req(struct mipi_dsi_host *host,
 	clk_req->escclk_rate = msm_host->esc_clk_rate;
 }
 
+void msm_dsi_host_enable_irq(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+
+	enable_irq(msm_host->irq);
+}
+
+void msm_dsi_host_disable_irq(struct mipi_dsi_host *host)
+{
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
+
+	disable_irq(msm_host->irq);
+}
+
 int msm_dsi_host_enable(struct mipi_dsi_host *host)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index c41d39f5b7cf..fb4ccffdcfe1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -377,6 +377,14 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 		}
 	}
 
+	/*
+	 * Enable before preparing the panel, disable after unpreparing, so
+	 * that the panel can communicate over the DSI link.
+	 */
+	msm_dsi_host_enable_irq(host);
+	if (is_bonded_dsi && msm_dsi1)
+		msm_dsi_host_enable_irq(msm_dsi1->host);
+
 	/* Always call panel functions once, because even for dual panels,
 	 * there is only one drm_panel instance.
 	 */
@@ -411,6 +419,10 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	if (panel)
 		drm_panel_unprepare(panel);
 panel_prep_fail:
+	msm_dsi_host_disable_irq(host);
+	if (is_bonded_dsi && msm_dsi1)
+		msm_dsi_host_disable_irq(msm_dsi1->host);
+
 	if (is_bonded_dsi && msm_dsi1)
 		msm_dsi_host_power_off(msm_dsi1->host);
 host1_on_fail:
@@ -523,6 +535,10 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 								id, ret);
 	}
 
+	msm_dsi_host_disable_irq(host);
+	if (is_bonded_dsi && msm_dsi1)
+		msm_dsi_host_disable_irq(msm_dsi1->host);
+
 	/* Save PHY status if it is a clock source */
 	msm_dsi_phy_pll_save_state(msm_dsi->phy);
 
-- 
2.33.0

