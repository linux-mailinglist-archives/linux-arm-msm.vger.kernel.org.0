Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8019956FEF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 12:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiGKKdP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 06:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiGKKdB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 06:33:01 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2337EA6F2E
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:43:25 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id m18so7741854lfg.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5BhJejINWwh7igibs6sM5aWPhcjFoJdMPx606pg8Vrg=;
        b=LCAi1vbpocJFiqf2SJcm0Jg5cpuE38KR8lj42wPJK2onhcZQotcqClusC74RdEdnDn
         cZMG+70nM4oUl6Gcm+9P9f4UfgIr33vkZtYfh5iESv/EVWKVn0/A6mi1i4HBS4+m6vS4
         v2Xyqva7hf6WPQDF0QI95qxsvznXKfokTIiRz3/e5kgscxdblDbKII5uM6AyW2s7bJJJ
         pv2kohB8utmV+kH/2Vt2C3q5mEmIbxbOx/SHKSCcUEGOBsg+ZheNXu7I/jHlX8vfJs+E
         kDPNBzAlrM1tgp+7fJkVFx4sCN6x4tEUTwXhhUeUZDtxSM+5nayVypcoqhD/WmOJsFgq
         Lk0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5BhJejINWwh7igibs6sM5aWPhcjFoJdMPx606pg8Vrg=;
        b=ASt/wUzV2AT+w5U/Eq+21MNOpRjfeNmJqnsgLtGrTGrHFdganf6ALoSR2s7qWnVnIj
         1grW+jC7E6lKe2k/Nvki1PZ9UESrdMoew5yj72bQWRm19Evij049pY9EeQeKmm4cYY4x
         RfYplxKIqeEay7IBNA154MAc+T+xp/Y/JDIYJeh5gSYlsfdmCnbTTSk5UuxUFdj/kcyC
         idXJ4Pjh2Ccc2UOk9Hq07IM5cbfdtAyO5SAwha7v0JczeRHdILBaQ9oBIrAITcyO0V6W
         qbYFHSg/93tKUOgJ+g2AtDl44cmpZIg0BVSfZKa7a2k34wC1ZR7HxXsn94Gte4nUXNtT
         wUGA==
X-Gm-Message-State: AJIora88UWOMl9jz8DU7VR6Eni/ciCB4p9K6RKj2DTKWTzFBKLccf8Ae
        WtuU00u9c+ypG+pLPV0RACVJGg==
X-Google-Smtp-Source: AGRyM1voHKmiRqOs7ekptvAXypasXW4zChRytC8zL8ERd15Ooq0xd1pjw65PLpvFFaTw/+x6nq4jpA==
X-Received: by 2002:a05:6512:1028:b0:47f:a07e:6e85 with SMTP id r8-20020a056512102800b0047fa07e6e85mr10983746lfr.294.1657532603366;
        Mon, 11 Jul 2022 02:43:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i27-20020a2ea37b000000b0025d4974a12asm1639490ljn.26.2022.07.11.02.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 02:43:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/msm/dsi: fetch DSC pps payload from struct mipi_dsi_device
Date:   Mon, 11 Jul 2022 12:43:18 +0300
Message-Id: <20220711094320.368062-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711094320.368062-1-dmitry.baryshkov@linaro.org>
References: <20220711094320.368062-1-dmitry.baryshkov@linaro.org>
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

Now that struct mipi_dsi_device provides DSC data, fetch it from the
mentioned struct rather than from the struct drm_panel itself. This
would allow supporting MIPI DSI bridges handling DSC on their input
side.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index a34078497af1..fb5ab6c718c8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1686,6 +1686,17 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
+	if (dsi->dsc) {
+		struct msm_display_dsc_config *dsc = msm_host->dsc;
+
+		if (!dsc) {
+			dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), GFP_KERNEL);
+			if (!dsc)
+				return -ENOMEM;
+			dsc->drm = dsi->dsc;
+			msm_host->dsc = dsc;
+		}
+	}
 
 	/* Some gpios defined in panel DT need to be controlled by host */
 	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
@@ -2159,23 +2170,9 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
-	struct drm_panel *panel;
 	int ret;
 
 	msm_host->dev = dev;
-	panel = msm_dsi_host_get_panel(&msm_host->base);
-
-	if (!IS_ERR(panel) && panel->dsc) {
-		struct msm_display_dsc_config *dsc = msm_host->dsc;
-
-		if (!dsc) {
-			dsc = devm_kzalloc(&msm_host->pdev->dev, sizeof(*dsc), GFP_KERNEL);
-			if (!dsc)
-				return -ENOMEM;
-			dsc->drm = panel->dsc;
-			msm_host->dsc = dsc;
-		}
-	}
 
 	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
 	if (ret) {
-- 
2.35.1

