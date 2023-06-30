Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03E44744390
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 22:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbjF3Uzk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 16:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbjF3Uzi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 16:55:38 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF4CF3C1B
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:36 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so3892574e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 13:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688158534; x=1690750534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1t11zAhxsmu1Xr+UnI4uTYSo+nnvaZyAO08nB5DWEo=;
        b=Hq74wunDfzzWYPzBQ3leBAiPSoVXIxLmFpkMRRrGMIx7D8Z5b3dutbHj45guMAS4He
         aOBwgLVJzOM/A7+2rAfagheJvz0ayEsi7LAuzI8tJozpeHAFlReooCOWkfFq9RpuNfW8
         c5yH9BWPoxVlfB61pm1z84VjQ8tv4hHciLPyoY9kzFdlwXC7neauU4pHwK867ig9v3J1
         vw3ODgDROuyVpF5Pba7Q5wuXWRLQ+8Jwul3Eb7TMK1f7vy69/GYAnytvBBiF6O/PfSzH
         KG6zDTUolYfsB9EYnn3KKKgCf0lQVN5ssJYubqMDjUmt0TNjX2ouVUs9+ASiwJ4bk4WB
         KFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688158534; x=1690750534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1t11zAhxsmu1Xr+UnI4uTYSo+nnvaZyAO08nB5DWEo=;
        b=FY0FjeBpdZBsG+on3IxTc3imVGYI9laJWGAhH05ut10Y1+SyMcm/MhD8LKcD5mxjGf
         mMnvso73szcbHg42/9gr7j6qpft+AHmwnzUlaxGabZNoXaTZ4cT1aqlxe4YGC/XppbhL
         VxB0/k6ii7pP0DEFjOJ970+vePI3YdRGlRFGq5z2qKRGRVEdR/DgGFesSXkyF/ypMIg/
         lBt/6eJtC88uZsEixHR9TD82hNz/AliDru6orA0L6YLXeLS/xQvhOZmKqR0pZwTOfrlk
         qVn4OE127C3jczBD0FSkD70rXwjl/cFLs7pHtB4OLCKnzGlo50ZRD7RzPOvKLqL8lZoo
         F70g==
X-Gm-Message-State: ABy/qLY5cnT+VFczSS6kU8Ouy4X7pCi7IWhO8ESZbmALdetuwJ5vE5uO
        WZrlbzDA8G+fI7zLX0YYeVn9kw==
X-Google-Smtp-Source: APBJJlHlGcIds8zpypMpzfS+yd/bW4hKcjV5uHLhJgKrG73BIvDzu2PreJVpFq8/NahzADRUVkQ/Hg==
X-Received: by 2002:ac2:4dad:0:b0:4f8:62a6:8b2 with SMTP id h13-20020ac24dad000000b004f862a608b2mr2995237lfe.46.1688158534653;
        Fri, 30 Jun 2023 13:55:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 13:55:34 -0700 (PDT)
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
Subject: [PATCH 14/15] drm/msm/hdmi: ensure that HDMI is one if HPD is requested
Date:   Fri, 30 Jun 2023 23:55:22 +0300
Message-Id: <20230630205523.76823-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The HDMI block needs to be enabled to properly generate HPD events. Make
sure it is not turned off in the disable paths if HPD delivery is enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        | 1 +
 drivers/gpu/drm/msm/hdmi/hdmi.h        | 2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 8 +++++++-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 9 ++++++++-
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 598c8284f125..ec109255ee17 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -419,6 +419,7 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	hdmi->pdev = pdev;
 	hdmi->config = config;
 	spin_lock_init(&hdmi->reg_lock);
+	mutex_init(&hdmi->state_mutex);
 
 	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, 0, NULL, &hdmi->next_bridge);
 	if (ret && ret != -ENODEV)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 252d617939d4..e07450fbb521 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -42,6 +42,8 @@ struct hdmi {
 
 	/* video state: */
 	bool power_on;
+	bool hpd_enabled;
+	struct mutex state_mutex; /* protects two booleans */
 	unsigned long int pixclock;
 
 	void __iomem *mmio;
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index d6d57768f3dd..01630445a664 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -125,11 +125,13 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 
 	DBG("power up");
 
+	mutex_lock(&hdmi->state_mutex);
 	if (!hdmi->power_on) {
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
 	}
+	mutex_unlock(&hdmi->state_mutex);
 
 	if (hdmi->hdmi_mode) {
 		msm_hdmi_config_avi_infoframe(hdmi);
@@ -155,7 +157,10 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
 
 	DBG("power down");
-	msm_hdmi_set_mode(hdmi, false);
+
+	/* Keep the HDMI enabled if the HPD is enabled */
+	mutex_lock(&hdmi->state_mutex);
+	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
 
 	msm_hdmi_phy_powerdown(phy);
 
@@ -166,6 +171,7 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 			msm_hdmi_audio_update(hdmi);
 		msm_hdmi_phy_resource_disable(phy);
 	}
+	mutex_unlock(&hdmi->state_mutex);
 }
 
 static void msm_hdmi_bridge_mode_set(struct drm_bridge *bridge,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index f3d6cc184999..2080e7c6700c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -73,10 +73,14 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	if (ret)
 		return ret;
 
+	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, false);
 	msm_hdmi_phy_reset(hdmi);
 	msm_hdmi_set_mode(hdmi, true);
 
+	hdmi->hpd_enabled = true;
+	mutex_unlock(&hdmi->state_mutex);
+
 	hdmi_write(hdmi, REG_HDMI_USEC_REFTIMER, 0x0001001b);
 
 	/* enable HPD events: */
@@ -107,7 +111,10 @@ void msm_hdmi_hpd_disable(struct hdmi_bridge *hdmi_bridge)
 	/* Disable HPD interrupt */
 	hdmi_write(hdmi, REG_HDMI_HPD_INT_CTRL, 0);
 
-	msm_hdmi_set_mode(hdmi, false);
+	mutex_lock(&hdmi->state_mutex);
+	hdmi->hpd_enabled = false;
+	msm_hdmi_set_mode(hdmi, hdmi->power_on);
+	mutex_unlock(&hdmi->state_mutex);
 
 	pm_runtime_put(dev);
 }
-- 
2.39.2

