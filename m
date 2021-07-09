Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 905D43C2BCC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 01:50:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231324AbhGIXxR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 19:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhGIXxR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 19:53:17 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B4B5C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 16:50:32 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id q18so26546166lfc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 16:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=49a8wW7cPE/UYu/CgVMiIaLLCRNVbynlrKg04A+ZvZk=;
        b=dZNwrSFcgexHfE1MFXEJp08UR0ysnSEomH8R8ENvmtD7Q9xTSSe7AtMRiXNSjnjlxh
         TqZnGMMRF80DqX9TWTh1LD0zHhFPgi9FI+zb9Ck1H2OLTqyOPCsLSaHAZWBaLJKYP97C
         4xS7wktgCqO5ioEPJCRZs2Hmez7HxKmxZXqiYGNhMELzFArooD/FXYb770Q2k3+of8eZ
         xcyHOaHxTtOyYILTeoxqS22mEspjcKN5HUkZfwrnJqapm8YUmCMw7JtqAOkPy5XV/6xh
         56arP3EoQkp7GG4wh+vcRJvEYpByxKfO1Epb1w1/hCo92p2hTDdOK1dswkhreeFokBLW
         342Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=49a8wW7cPE/UYu/CgVMiIaLLCRNVbynlrKg04A+ZvZk=;
        b=XmF0DgzdqF0+Gt648XgLzZKs/u/gLGvanrCtuDmT+3rUG0mWhesMPmtBNt5ig3yw90
         TqTB9QThGU7gatERX1h6vpfLscOflYToQgIr7/x49Lga+NZEQjvF3g/jzBPddIcPESya
         xCjkKVrE1Hr0xFD7MV8599hx8FGnLvlg4qVdZz30/AQku6er7LaB5XsFyb6V/bLl0/hu
         yxFbtvQPItsYragwsSZCKogDKPOvPHwTcHicf2hg52Ev7firAMJqT1qqIEVK82h5Fisp
         59xlDcgDTba7rYub7KyZv1O0KIsbNzoh4V2MfwkzhoCk9kIIf/9qFxCj6/adElRn2dAk
         +qCg==
X-Gm-Message-State: AOAM5319M+qK9tgqwxwyT3lnek6e+ULiGeMT0cJRbxrtmJ1ok9Zmwboc
        4UaOKTjN4A+UatBzk/KVf2Z9iA==
X-Google-Smtp-Source: ABdhPJwj6yZc8GvIU3BEGznwEcnXH+nwJNDKH/3jh+yeQ5njPxIZpWyLa064jVanU2wvkNtn6V9z+A==
X-Received: by 2002:ac2:4345:: with SMTP id o5mr30107129lfl.599.1625874630890;
        Fri, 09 Jul 2021 16:50:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10sm718964ljp.20.2021.07.09.16.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 16:50:30 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm/msm/dsi: stop calling set_encoder_mode callback
Date:   Sat, 10 Jul 2021 02:50:23 +0300
Message-Id: <20210709235024.1077888-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
References: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
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

