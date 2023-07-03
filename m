Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21EB5745339
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jul 2023 02:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbjGCAhz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 20:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbjGCAhy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 20:37:54 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57067E45
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 17:37:52 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6a1245542so63378891fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 17:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688344670; x=1690936670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJT3A9uNfEQ8+tvyxbze44I0KEmknlkiQGr1UM0OaH4=;
        b=d7ThNK+o9atNh//6q81rE7YgLwYJx2IHYIHa9ebgYCVF30cx9+mwklMAUJQ/oKB7d6
         dgf9EQEZdnhldn1jKZ9o2eHwSGs0a8VdK4v3LNiIjPhsc8iejAtHB29ObNh9lgQ8Zoo+
         W4Lx1WhQS/C0cDaCjZZ2KhQSmHv5VtjqhX2kfN6FO6oVkileZYVFWLgcY6dxwg4oWRgp
         oesqJxUGryi4eptwhHGLNVm2yUJ97tVhBkNS8kSgdnL2qkmb/Kots7UEpSc1Uj+MRxik
         FG2dlW7IiGAjq8JJjYNf12tHkt6ASLsqn0AQnl03j3lirSLjBdBpXqAn5CAQfR7T/Nx5
         aW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688344670; x=1690936670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJT3A9uNfEQ8+tvyxbze44I0KEmknlkiQGr1UM0OaH4=;
        b=Vj+wZ442FpsVHQ/n8k5x6dvbKO7z2NZiPSMMiGWMRtAw/MNSw3Ch//lwSozXfQRhh8
         7QmmZNrxH8OCuC7gbDQtwX+dTR8Gn4SwHLBqevOjzsw8t9xRDVi/gR/POc6fiNGxvXcR
         o9lULPmvYkM87bMA65JqGarlXmX4gBAPRcsSnvpBRXrwU+gvf14QQ1LkcjWwJZ1QJrS6
         J+qyI2P2425NHco2UGjP4V4+Xb/sHzvx9Oz9I+zziKliHnVb4Mr3HK/Kbbav3nU5aRjN
         YOLs4iUTjLhHswF2RM9vZE5veoa5psU6dKC6rWVMHB8kL7z9IdCk2YT7eNQ78INW3vtX
         w87g==
X-Gm-Message-State: ABy/qLZsql+BHC5EPu0zQsqHdzmN7dv+UKbhwekBP9+0klPeOZQ7XZsA
        /vl4gONSglmGo7wCOkOdzWn7gA==
X-Google-Smtp-Source: APBJJlEMQuY75NfZIMuHrnBLD/fH8zkaxyPk5kvE/0tWTWrL6JojSH2RFylPfgTHHTuCSKAQEYKOtg==
X-Received: by 2002:a2e:8216:0:b0:2b6:a475:2989 with SMTP id w22-20020a2e8216000000b002b6a4752989mr6001546ljg.30.1688344670741;
        Sun, 02 Jul 2023 17:37:50 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 17:37:50 -0700 (PDT)
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
Subject: [PATCH 05/13] drm/msm: remove msm_drm_private::bridges field
Date:   Mon,  3 Jul 2023 03:37:37 +0300
Message-Id: <20230703003745.34239-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
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

As all output devices have switched to devm_drm_bridge_add(), we can
drop the bridges array from struct msm_drm_private.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 4 ----
 drivers/gpu/drm/msm/msm_drv.h | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f06a06ab26fa..9fe789a546f5 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -240,10 +240,6 @@ static int msm_drm_uninit(struct device *dev)
 
 	drm_mode_config_cleanup(ddev);
 
-	for (i = 0; i < priv->num_bridges; i++)
-		drm_bridge_remove(priv->bridges[i]);
-	priv->num_bridges = 0;
-
 	if (kms) {
 		pm_runtime_get_sync(dev);
 		msm_irq_uninstall(ddev);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 6787bd302dfa..deb5ee236a2a 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -202,9 +202,6 @@ struct msm_drm_private {
 
 	struct msm_drm_thread event_thread[MAX_CRTCS];
 
-	unsigned int num_bridges;
-	struct drm_bridge *bridges[MAX_BRIDGES];
-
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
-- 
2.39.2

