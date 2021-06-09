Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763A93A1EC0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 23:17:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhFIVT1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 17:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhFIVT0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 17:19:26 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75397C0617A6
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Jun 2021 14:17:31 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 131so1717023ljj.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Jun 2021 14:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/V8KGR606fRo3VbCDDBvoYkWIJ1I7tpl4I/Xf0Z+Ze8=;
        b=iusOuU9APX/gERLJ2zgM206VROoXn6L21ms88HAtY8lF5tirDi7rBY6jwQJ9eh2oVT
         is+nZRpXoIVG3Eumhk1ttvSGHjHMl6PQgw4Ql26UFJM4QarHxwZhOqpyltj/d1dgHtD5
         SmoPdt5Sb9eGdA8jYueg6x1eJ6FZuPILCLKgSvESoALob5GDv5QrpXuzI8vqlhYtt2Qz
         xTNvhaKqa3YsdDEzCMHt+0sA/VmpSLyzH6iGgRc7nJImfzYP13pomyfoRn+UsVamnzu5
         bJj9JHFV2E3kmUf1qg0bVdPoMAV9rISJfUJhFSYBLgvu7qm3Q3FzOpL9Opi4775l44hE
         NUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/V8KGR606fRo3VbCDDBvoYkWIJ1I7tpl4I/Xf0Z+Ze8=;
        b=XXEsMSdJ2MHC7QQyzxBmtakcmTybbWFfHlG71Y1OH0/48H7jU1emoUp+kO7j+LblLF
         PHVJL3TKJJm/FVAMRmtDXbcka99DGdLCXffRrmoQzLuYRQlLFLdko915QiN/hWZj/jhn
         fKXpBqREBSNpLLPCJhfk+tqSqzXmauA7etcxdL2BGXzVELQlTIhJIyCt79deqerD2f8U
         crd5fyIjI+RLTRWvzeH5I+a+Vx2auN0shHa2wEp7q8rw+29tVHopNzAH6GdZtqs32PzX
         zKpNxcmuCPZWQ569YBbQFRAm2e6HuwMPfovQA+FUQJq9XcsrOFpejMsWqrbt6BZFZe+I
         wGkw==
X-Gm-Message-State: AOAM530EJx8zGIvPsl3+U0kIKBoN8HqQso2MIpJwSrslpRfAztXtF4qK
        WVBzSqeiPcMnf1wCUrnLu74EWQ==
X-Google-Smtp-Source: ABdhPJyMwehaGgcTrzQ8UFpel/tQwHtklY30ohmzqBsWig9ryCJzZk5yRiqNkQbpgKbBZ1EPdBtuRQ==
X-Received: by 2002:a2e:8817:: with SMTP id x23mr1298976ljh.17.1623273449753;
        Wed, 09 Jun 2021 14:17:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z20sm95329ljk.50.2021.06.09.14.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 14:17:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 5/6] drm/msm/dsi: stop calling set_encoder_mode callback
Date:   Thu, 10 Jun 2021 00:17:22 +0300
Message-Id: <20210609211723.2565105-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
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
index 874c1527d300..881f14bc022d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -250,8 +250,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		goto fail;
 	}
 
-	msm_dsi_manager_setup_encoder(msm_dsi->id);
-
 	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
 	priv->connectors[priv->num_connectors++] = msm_dsi->connector;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 9b8e9b07eced..c0bdbe63050a 100644
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
index 7d4f6fae1ab0..1996b40d2ae9 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -217,18 +217,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
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

