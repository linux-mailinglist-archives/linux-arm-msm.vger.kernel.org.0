Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5847C6131
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 01:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbjJKXj0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 19:39:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbjJKXjZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 19:39:25 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 171A3AF
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 16:39:24 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-504a7f9204eso534095e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 16:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697067562; x=1697672362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3PVSUQHKZ6hB5jZ1fmYau7crWDHRuDRekZrM5LlEds=;
        b=jYF1pb1YwgT9b0nM0sbE2BIeGhRKVuD8ACv8llRCOQROstBZArDxPJr8Zcd4JyfbZj
         1MS/OwQR8L9I7TH9AJSPvhJ8n1n45Szxt2jJhZzHwq31A3LkjrmugIZeJhw7oY3X2N97
         Og5n/7fNOI1UDjEo/fDQveL4h2opJZlu8asRwoHXr1H6RhX6m4DWM/cXnc5v2zjxT0Wh
         euc5Q6DWtVwul/bB4fx615eCmYMvcq3jk9RgwTuHoFN6oV4tQDz9Fq4eWs2Vpx1zcVgV
         ce9d+pJcIdiUvRDJLI3GVbNzdp0oVunYkzaLgbhbAwtbzRUeUCMKl5odNAdmGHZR4sh7
         cKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697067562; x=1697672362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3PVSUQHKZ6hB5jZ1fmYau7crWDHRuDRekZrM5LlEds=;
        b=IC7U56gb/BTkKa1iwNt4lXSithjfaS2Dgz0d3gEDQwdruYfLqhX/jlU/yqj+k9UVyL
         sHh4SEw6yMUtyFaLTngAqaXXZM+sfrhP7GjB+opvBUaVerP88+9548bg+ImZZ7HmotNt
         KLU5WN9IR1jYPMeJz91uh5ecW6p0Xn17zz4JWtcVK9Wuryhbv3OtnLTesq+s7h/liqUC
         J339Jtn3JH8j6kNbJarhFKnhNhcxtmS8jpIlLC9ZyT7MGY8YFCQABge7rG8sm2THUwMh
         kzZLIJWcMkkb43WOG1DKqkS46OvmvxgiVH+y5qkzvvQVYs8bFm3zXm9R0Y4qJBCjuJeL
         vrNg==
X-Gm-Message-State: AOJu0YwRg2QiAWiTUw6ZHEVfgVvK05CSnfmRDelaY7AyXlfocvWDpQ60
        MVarcdgzltf8amAhMq81Odw6QA==
X-Google-Smtp-Source: AGHT+IHV2B+ot6nPMqGPH3HG54KxhnKQgY12O7J8603eGHewHHexetWcVbhBXwTD+TIYGLxrkj4XXw==
X-Received: by 2002:a19:ee17:0:b0:500:bb99:69b0 with SMTP id g23-20020a19ee17000000b00500bb9969b0mr16819362lfb.57.1697067562326;
        Wed, 11 Oct 2023 16:39:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m27-20020a056512015b00b0050567cdb8f6sm2466032lfo.239.2023.10.11.16.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 16:39:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/dsi: free TX buffer in unbind
Date:   Thu, 12 Oct 2023 02:39:19 +0300
Message-Id: <20231011233919.410099-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011233919.410099-1-dmitry.baryshkov@linaro.org>
References: <20231011233919.410099-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the drm/msm init code gets an error during output modeset
initialisation, the kernel will report an error regarding DRM memory
manager not being clean during shutdown. This is because
msm_dsi_modeset_init() allocates a piece of GEM memory for the TX
buffer, but destruction of the buffer happens only at
msm_dsi_host_destroy(), which is called during DSI driver's remove()
time, much later than the DRM MM shutdown.

To solve this issue, move the TX buffer destruction to dsi_unbind(), so
that the buffer is destructed at the correct time. Note, we also have to
store a reference to the address space, because priv->kms->aspace is
cleared before components are unbound.

Reported-by: Bjorn Andersson <andersson@kernel.org>
Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c      |  1 +
 drivers/gpu/drm/msm/dsi/dsi.h      |  1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c | 13 +++++++++----
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 47f327e68471..c6bd7bf15605 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -131,6 +131,7 @@ static void dsi_unbind(struct device *dev, struct device *master,
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 
+	msm_dsi_tx_buf_free(msm_dsi->host);
 	priv->dsi[msm_dsi->id] = NULL;
 }
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index a01c326774a6..28379b1af63f 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -124,6 +124,7 @@ int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size);
 void *dsi_tx_buf_get_6g(struct msm_dsi_host *msm_host);
 void *dsi_tx_buf_get_v2(struct msm_dsi_host *msm_host);
 void dsi_tx_buf_put_6g(struct msm_dsi_host *msm_host);
+void msm_dsi_tx_buf_free(struct mipi_dsi_host *mipi_host);
 int dsi_dma_base_get_6g(struct msm_dsi_host *msm_host, uint64_t *iova);
 int dsi_dma_base_get_v2(struct msm_dsi_host *msm_host, uint64_t *iova);
 int dsi_clk_init_v2(struct msm_dsi_host *msm_host);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 19019c764f11..3357b2a80786 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -147,6 +147,7 @@ struct msm_dsi_host {
 
 	/* DSI 6G TX buffer*/
 	struct drm_gem_object *tx_gem_obj;
+	struct msm_gem_address_space *aspace;
 
 	/* DSI v2 TX buffer */
 	void *tx_buf;
@@ -1134,8 +1135,10 @@ int dsi_tx_buf_alloc_6g(struct msm_dsi_host *msm_host, int size)
 	uint64_t iova;
 	u8 *data;
 
+	msm_host->aspace = msm_gem_address_space_get(priv->kms->aspace);
+
 	data = msm_gem_kernel_new(dev, size, MSM_BO_WC,
-					priv->kms->aspace,
+					msm_host->aspace,
 					&msm_host->tx_gem_obj, &iova);
 
 	if (IS_ERR(data)) {
@@ -1164,8 +1167,9 @@ int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size)
 	return 0;
 }
 
-static void dsi_tx_buf_free(struct msm_dsi_host *msm_host)
+void msm_dsi_tx_buf_free(struct mipi_dsi_host *host)
 {
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	struct drm_device *dev = msm_host->dev;
 	struct msm_drm_private *priv;
 
@@ -1180,8 +1184,10 @@ static void dsi_tx_buf_free(struct msm_dsi_host *msm_host)
 
 	priv = dev->dev_private;
 	if (msm_host->tx_gem_obj) {
-		msm_gem_kernel_put(msm_host->tx_gem_obj, priv->kms->aspace);
+		msm_gem_kernel_put(msm_host->tx_gem_obj, msm_host->aspace);
+		msm_gem_address_space_put(msm_host->aspace);
 		msm_host->tx_gem_obj = NULL;
+		msm_host->aspace = NULL;
 	}
 
 	if (msm_host->tx_buf)
@@ -1967,7 +1973,6 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
 	DBG("");
-	dsi_tx_buf_free(msm_host);
 	if (msm_host->workqueue) {
 		destroy_workqueue(msm_host->workqueue);
 		msm_host->workqueue = NULL;
-- 
2.39.2

