Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D96A13CC362
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 14:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233613AbhGQMnY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jul 2021 08:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233740AbhGQMnY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jul 2021 08:43:24 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89213C06175F
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:40:27 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 22so20590050lfy.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nRZhkjy0dQDJbOhaefbmkPeax0IavLpLmH4VRR7TqLc=;
        b=mBR3bAd/NkqW7Qy4EPUiP97XuEsZAc85GRa5H15YD9v//Nt7vtN+eHJg091MlQhxmp
         57JyiFGydtgjXMgVMJdMjmN6Ws0ELNPrb0XC/orAZPUcJT3uye7UUsAgw3hZJIzyxQsU
         jJp1fd+DiGXnMNZdZv9vy+1De9dU+EaJqliPce1VurIX7T3TROfFarPvqWcWLpcGQb9T
         zfiY0mnaUys8kDk3v/gN0EGyY7kchC1nK9Ll5JcJOYh1zrTmteu9ilz6b2nvMn5tZNb+
         TopcMUH0AEVdnV22dgLOXJXiXWjwzkIwhtY0zSMiWub31ECh4XQ3mwDgWvO4UQ0RSLMD
         oIwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nRZhkjy0dQDJbOhaefbmkPeax0IavLpLmH4VRR7TqLc=;
        b=K/7g48dd4Q5nNuLrpS0rAdYhyZPMPXKTJDQgdzq2iU8d1lcQrbYOcExht1NpVzkWNf
         5TMjlxuUWKB39ppQXG8sJMKLJ053Wa0QATO9OnyoCtNMVJnqEgFSJo2Jqe2/6TuTyvbE
         eBRQpzMSJhX3tsXq37L13liiuhjpUGDWzoKrfUsHBoV2nDekYM5nOu6hS4lRIXwHPRpF
         tb1HLcD+jAawNS8+ah4RR65x8GHmCof1VHJSU+90HSambhmNcOerwEmIIU36T0CotW07
         8Sbya6/6Lb8Piv3qX+0TJg+dIZmHiKCR1MU0Jr657AA9wBS2jzatg1sHcGuphVHawgiu
         FxbQ==
X-Gm-Message-State: AOAM530XfmQzwAg6KF3Ni3vd/D5uD8yu+PJN1LYqo1Q2rMQXViib10oj
        2DLN2hXP+QMYjcpieP3nfSgzVA==
X-Google-Smtp-Source: ABdhPJwdbrE2xwmmj679bhhBuODHnkOnZDHhJqforuW97mXfPnp+I3wMKUpK8wnX2AxfA/DVKWlVgg==
X-Received: by 2002:ac2:4f89:: with SMTP id z9mr11868477lfs.46.1626525625957;
        Sat, 17 Jul 2021 05:40:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f25sm794264ljo.126.2021.07.17.05.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 05:40:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 6/7] drm/msm/dsi: stop calling set_encoder_mode callback
Date:   Sat, 17 Jul 2021 15:40:15 +0300
Message-Id: <20210717124016.316020-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

None of the display drivers now implement set_encoder_mode callback.
Stop calling it from the modeset init code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         |  2 --
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 12 ------------
 3 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 5201d7eb0490..77c8dba297d8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -251,8 +251,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		goto fail;
 	}
 
-	msm_dsi_manager_setup_encoder(msm_dsi->id);
-
 	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
 	priv->connectors[priv->num_connectors++] = msm_dsi->connector;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 856a532850c0..e0c3c4409377 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -80,7 +80,6 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id);
 struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
-void msm_dsi_manager_setup_encoder(int id);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
 bool msm_dsi_manager_validate_current_config(u8 id);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 27d3b9ebf831..693078e68fd4 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -216,18 +216,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
 	return dsi_bridge->id;
 }
 
-void msm_dsi_manager_setup_encoder(int id)
-{
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct msm_drm_private *priv = msm_dsi->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	struct drm_encoder *encoder = msm_dsi_get_encoder(msm_dsi);
-
-	if (encoder && kms->funcs->set_encoder_mode)
-		kms->funcs->set_encoder_mode(kms, encoder,
-					     msm_dsi_is_cmd_mode(msm_dsi));
-}
-
 static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
 {
 	struct msm_drm_private *priv = conn->dev->dev_private;
-- 
2.30.2

