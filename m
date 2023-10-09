Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8F57BEC1A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 22:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378055AbjJIU5e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 16:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378034AbjJIU5e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 16:57:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA7692
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 13:57:32 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-504b84d59cbso6570219e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 13:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696885051; x=1697489851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mRCiNMZCeM+Ar6Xq8Rd6MAb4ZZFbkMJC2m2U/eGMOM=;
        b=Ok5TcXhu2jpwcjNPUSbHnjmlIJnwblJxMXFl8+oWScaVhUywPLTsjmoxx9O809l60g
         +ZvUdDqSlwaukdnuMlrSUfuHomnzec5jDUo5ddJIfWq0PI0SY64Ajfe/2RjJcn1zxqmz
         9ySfdbR/aeJB0yWmW8GU+ArUcg68Xw6Xb0fxX66uhJFNEL3THXla1yLOKQMyasDLatn2
         fp38G0seilD/oF/O6AxqHo0bTFNvNvKE0kt5tQdGEICPz2dcji2s5QIvK8MRBj+vaRoh
         QMXuN6a8j5e61+MtGv1wwXnYaUEJ1eNRiINyQcGA8fizQRYIksjtwv8ewwwQ+X+moKQs
         RpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696885051; x=1697489851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mRCiNMZCeM+Ar6Xq8Rd6MAb4ZZFbkMJC2m2U/eGMOM=;
        b=ofwz6tECFFmUs9qqmPXv4xfW6/EgEPybTJvDZ08DNqsgH26HcJonBW9/OfuY5GCJfs
         n/t/TPoltkfOrOPdsWj1j2RhdeZVYArw5rQeeUoW1HQMqRz4/G9/bexss9ZhyfsW/sN+
         5ZlVkJo1V06WWb5wbQmGgUKJtTEBZ7ERB6QVFiGLM8hswrRYCpDCOZ84aLQ1k0Mj6O3g
         qCHHguynpwcBKvfZH2Kjj10a5ftO+uLFeoXblQuU282Ne2GE7j+MEJBunnIolQKg4aaq
         Md1HqJlXFiycmCh6TGG4Q+rpj0pvdS6y0haodvq9CUPJY2av1Igs/8Ox1vlc9IFC3MnN
         9e8Q==
X-Gm-Message-State: AOJu0Yy2s95bmYYjcHwdU0qwP8Epx1H/b43YEnA1Hnb/7B5yAkkYINXp
        S+W7SIVLlcgszjihm3ShD7IoFg==
X-Google-Smtp-Source: AGHT+IFU7X41OGXzJD9SvazQZs/emXDkqZ6yVTu4T54nQhn3J7EF1X9dwl5ts7ONPF9ntJ0mSqjYQg==
X-Received: by 2002:a05:6512:3993:b0:503:15a5:b368 with SMTP id j19-20020a056512399300b0050315a5b368mr14955585lfu.16.1696885050980;
        Mon, 09 Oct 2023 13:57:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f5-20020ac251a5000000b0050300e013f3sm1540844lfk.254.2023.10.09.13.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:57:30 -0700 (PDT)
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
Subject: [PATCH 2/5] drm/msm/dsi: drop msm_dsi_device_connected() function
Date:   Mon,  9 Oct 2023 23:57:24 +0300
Message-Id: <20231009205727.2781802-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
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

Since the commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order") the
DSI hosts are not bound through the component framework if the DSI
driver wasn't attached to the DSI device connected to this host.

Afterwards, if there is no bridge (including the panel bridge) created
for the DSI device then devm_drm_of_get_bridge() will return an error,
also making msm_dsi_manager_ext_bridge_init() and thus DSI modesetting
init fail.

This way there can be no 'unconnected' MSM DSI bridges. Remove the
msm_dsi_device_connected() function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         | 6 ------
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 5 -----
 2 files changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 269975002b95..b7edcb7b3ddc 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -61,12 +61,6 @@ int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_tpg_enable(void);
 
-/* msm dsi */
-static inline bool msm_dsi_device_connected(struct msm_dsi *msm_dsi)
-{
-	return msm_dsi->external_bridge;
-}
-
 /* dsi host */
 struct msm_dsi_host;
 int msm_dsi_host_xfer_prepare(struct mipi_dsi_host *host,
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 59f4728fc772..af840a1e9fc0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -305,8 +305,6 @@ static void dsi_mgr_bridge_pre_enable(struct drm_bridge *bridge)
 	int ret;
 
 	DBG("id=%d", id);
-	if (!msm_dsi_device_connected(msm_dsi))
-		return;
 
 	/* Do nothing with the host if it is slave-DSI in case of bonded DSI */
 	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
@@ -364,9 +362,6 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge)
 
 	DBG("id=%d", id);
 
-	if (!msm_dsi_device_connected(msm_dsi))
-		return;
-
 	/*
 	 * Do nothing with the host if it is slave-DSI in case of bonded DSI.
 	 * It is safe to call dsi_mgr_phy_disable() here because a single PHY
-- 
2.39.2

