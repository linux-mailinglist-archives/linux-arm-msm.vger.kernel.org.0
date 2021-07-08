Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040763BFA28
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 14:28:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbhGHMbe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 08:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbhGHMbd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 08:31:33 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4880C061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 05:28:51 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f13so14850249lfh.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 05:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xmIwt1LqFtceFX0+1IHR8SZWAq0rLMjLino86+vTL9k=;
        b=YI7n/PtYqgthT4U18+oZ22kSh0qPLqlnRdZzVTdZ0Q/crYnf1mZXBQk9drhK7ycbr/
         4azjSLDLAJ+NZ23s5vtIDDqukktgBuKtec4H39w/yjXula5zJkEGddMTsr+QcNNRKE/i
         bpvPxSrUoXqKeD/fr+Z31ylQTNb+2x1f1hRyqoNIwm+1xBIm6o2szts7+iWfCs57Ap0f
         UvbyAXbbRD/tGMcUEP67k0jD58MyqBbFpuLp/68/dEKZO+XHfcRIx/oehaCU6foSlkhv
         dxBrJ6uQr1Dv3hkKy8Ics2arleg9ClfaLF0H2UVLo6CPi6V/875I0ziHDmetLVSIZG1r
         ZZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xmIwt1LqFtceFX0+1IHR8SZWAq0rLMjLino86+vTL9k=;
        b=NPbAsE6aX2u22EoNIAbLrwv4l7HDV/DNLejat18uTHltG8pD7jTwQUf7YhheiC4J8Z
         VTSoLCgvaiSRb5am9bwBjl01uFpbpLsWyADayNtvUjV02phMC0Dg0KSXBn18W8ge1yov
         GxfZx1mBKcZGbK4vDfWRwscmhZFCjjlnpP84gBIi+7vm0zqxyaxXJUadObZK62AbqSLb
         SDhD+mkQewej+FTqB/HJwuePp1kCaDgO+qTVe0VEXaUZM7DJjGAIV0ZhGgrpBt0kEPB5
         oREBN7/xmvAp0ezmO14tQ1RubUVJ2y/fOLf7tGO/ToWOLE95l16a7O4WKfMjm9anyTm3
         G76Q==
X-Gm-Message-State: AOAM533R3+inJ/E6UnZc6hGRQvYAJSryuocA881y/9Ambct4DBeuR4Bo
        bszJAsgefwJui3VQRrmkk/oYxg==
X-Google-Smtp-Source: ABdhPJxJJ0IqrER/j7k7zlpSO3SejsFNMar2CyrSSNdS3n5rJd4z9Vcl7xqE9ewjOYtrNqKHWwBiYw==
X-Received: by 2002:a2e:752:: with SMTP id i18mr24342680ljd.497.1625747330160;
        Thu, 08 Jul 2021 05:28:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 05:28:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 6/7] drm/msm/dsi: stop calling set_encoder_mode callback
Date:   Thu,  8 Jul 2021 15:28:32 +0300
Message-Id: <20210708122833.363451-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

None of the display drivers now implement set_encoder_mode callback.
Stop calling it from the modeset init code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
index a81105633d3c..e7f4e1d8978a 100644
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

