Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8992B7C6239
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Oct 2023 03:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235260AbjJLB3Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 21:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233269AbjJLB3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 21:29:15 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01BB4B7
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 18:29:13 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-50481a0eee7so1936300e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 18:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697074152; x=1697678952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ygVFzbXQkh6CQUh1+4BvkXGvWZ85BOUPB5Iw0lcA8s=;
        b=ECEu7zOj4W5seU82hmOFt6jab/A360SWxf1QArzU0BG+b8as1MFUHuWXRigV5nn9Wj
         DeJGfncxQt0jBn9qqa+G2yJ3Ya+pk33HeOcAxxMm/BEdPzCfOnck6kadgGjLoEBGv4uH
         cU9Ehwzzz1lyvaWVs5zB6VWxU0tPBtcp987jcD/JKR3HHtmRQSnGqieRk7ckpvPXyabz
         Wfmu/8N4MSjYVFqJj2sQjyKZriTBRe0wZpKFM2qiu9jNWURxd+i/SZMi1wnFG/68Lj78
         b/m7OZ5cXMSzj8+paoMAOU7kqNnLneZsTWUglFQ2HpZYuXAAnWUKPvzHARCNlvAMoMZc
         ANWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697074152; x=1697678952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ygVFzbXQkh6CQUh1+4BvkXGvWZ85BOUPB5Iw0lcA8s=;
        b=hXLR+yps273OVO05LFOF+bgWDShKw9trh3e1SuNjCB7Sf/2YopUnX9XUTAisdzZCrQ
         Omp0MYV52RpcpOOfg65+bl6k8qcC4wNV8dTpAYxEIhOfuNNHq8Ur5aPz4Jb60fI59KCz
         i/IarVc/gB6kXDwtF1pUnMErFSFgbVVKAs9DiMF2BOsdJYOuA/KSQxVaNDeJ4unKiGXY
         7VluWdpT46q74c3E38SPGTARgej51hJMCy3/fa60bZe53bbYotflGiPUnw2cFmxJDdmS
         4y5o/0KEqNfTEVsGl62gAV7uJP+vpCIAJwj5oFL576MbCj0ab62wzJmA0tU8PxvbJH/X
         qOdg==
X-Gm-Message-State: AOJu0Yx5XslOF9OoQog8RSVfIT1oYVGZTbqv3BnX6WMz/+ktiavxu6dY
        sx4YVcg0MGV8XIJIi0Vxu/ZU2A==
X-Google-Smtp-Source: AGHT+IFiSxQOChmdo18qJuc+v8e4E6Z70A1BOOiFuFGeKNwZ9sp+95TVIAjUY/HyaslbFxNqfVuBeQ==
X-Received: by 2002:a05:6512:33d2:b0:503:385d:611b with SMTP id d18-20020a05651233d200b00503385d611bmr16030189lfg.30.1697074152267;
        Wed, 11 Oct 2023 18:29:12 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k10-20020ac2456a000000b004fe3a8a9a0bsm2526588lfm.202.2023.10.11.18.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 18:29:11 -0700 (PDT)
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
Subject: [PATCH v2 2/2] drm/msm/dsi: free TX buffer in unbind
Date:   Thu, 12 Oct 2023 04:29:09 +0300
Message-Id: <20231012012909.450501-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231012012909.450501-1-dmitry.baryshkov@linaro.org>
References: <20231012012909.450501-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 drivers/gpu/drm/msm/dsi/dsi_host.c | 15 +++++++++------
 3 files changed, 11 insertions(+), 6 deletions(-)

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
index 19019c764f11..deeecdfd6c4e 100644
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
@@ -1164,10 +1167,10 @@ int dsi_tx_buf_alloc_v2(struct msm_dsi_host *msm_host, int size)
 	return 0;
 }
 
-static void dsi_tx_buf_free(struct msm_dsi_host *msm_host)
+void msm_dsi_tx_buf_free(struct mipi_dsi_host *host)
 {
+	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	struct drm_device *dev = msm_host->dev;
-	struct msm_drm_private *priv;
 
 	/*
 	 * This is possible if we're tearing down before we've had a chance to
@@ -1178,10 +1181,11 @@ static void dsi_tx_buf_free(struct msm_dsi_host *msm_host)
 	if (!dev)
 		return;
 
-	priv = dev->dev_private;
 	if (msm_host->tx_gem_obj) {
-		msm_gem_kernel_put(msm_host->tx_gem_obj, priv->kms->aspace);
+		msm_gem_kernel_put(msm_host->tx_gem_obj, msm_host->aspace);
+		msm_gem_address_space_put(msm_host->aspace);
 		msm_host->tx_gem_obj = NULL;
+		msm_host->aspace = NULL;
 	}
 
 	if (msm_host->tx_buf)
@@ -1967,7 +1971,6 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
 	DBG("");
-	dsi_tx_buf_free(msm_host);
 	if (msm_host->workqueue) {
 		destroy_workqueue(msm_host->workqueue);
 		msm_host->workqueue = NULL;
-- 
2.39.2

