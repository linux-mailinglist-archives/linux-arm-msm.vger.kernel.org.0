Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78973487007
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 03:01:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345223AbiAGCBm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 21:01:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344467AbiAGCBm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 21:01:42 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E8EC061201
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 18:01:41 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id x7so10239401lfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 18:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M8SfnRamYFGQOJ4PWO6EKe5+yLLAmHFD9wjpR/2Zexc=;
        b=AowHc8AE/XeQA4r/BEYswX3hjpxJFdtwVGGIyoIzVVsiaFUmboGVrfax5nWi6ww8yY
         w9WExs9JYuJdXJtohETe4rfrEWnZI/AL+w6UNNCVMxnZtHzQEZaGRJiLbQX7tKq1tqCq
         ssk2wPAnCqbRraniOL07B2u3a+o/j1AW5/RgVGS8vrcrwJUhNKQBTZEkg1Rx/WSesVUZ
         C5CsLLk8cdfqL548AJ6d9Op8ahDQYPU4BOQf3TPNJu2e65+UQZ7N2q74JGbZZyMy8KmE
         pFTQQmYCmWPmP61Tdwh/Qkhf8rn6fKNXN70Lm697D5iuhETA164I4VdR8WWVvMgg/lMa
         pC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M8SfnRamYFGQOJ4PWO6EKe5+yLLAmHFD9wjpR/2Zexc=;
        b=gzeetsjIHlC7zcfsJ8bUIJ2WTHfIThAluLQAvnFa74wBkYfP8/Nh+7xLbE8QE2WSU7
         Kh4lavOKuz6QVNwlQRnECD2q+slaCUOTWXbe/WmyqKc9dR160h96HMvk5bZEktvlnsBc
         xyVpCVJ8cuEDo3w+vkpvFMv/7fEi0xmsMzDyTg7omp/zSW5zSI2GeKfHDHoq5NzYt/yz
         IAGjkF8Lx4oyCFWz505P9axIZG2YWqcf6+4D6EoT/fQBZ9EGQyEF/bjF7flrt92Rv9We
         gatPZcf4zYCAFa3UaQioCnSHHJJqzXSdkG1oW15XyCyXcW0RK9WZcsdLuhUnIsmxwmAd
         bMSw==
X-Gm-Message-State: AOAM5301JsBInxCuqqS2GQ+le4DOUkr0l0U1l6CZ0YY4D7mJv8Dj9twE
        L+PCjmvJqPCi3BBsV/UANqmudw==
X-Google-Smtp-Source: ABdhPJx3V2EtzcEePJMmIb8a+f6fSN6pVliCC5d+q8YJ/egr4Ol06V0QGj+JcGqUXdCQfktH4QbrXw==
X-Received: by 2002:ac2:5f55:: with SMTP id 21mr53262771lfz.283.1641520899811;
        Thu, 06 Jan 2022 18:01:39 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w12sm382837lfe.256.2022.01.06.18.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 18:01:39 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC PATCH 5/7] drm/msm/dp: remove unused stubs
Date:   Fri,  7 Jan 2022 05:01:30 +0300
Message-Id: <20220107020132.587811-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Refactoring DP code transformed several functions into empty stubs.
Remove them.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 35 -----------------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 7b4f40cb9a58..e63d6056e39d 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -841,11 +841,6 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
 	return 0;
 }
 
-static int dp_display_prepare(struct msm_dp *dp_display)
-{
-	return 0;
-}
-
 static int dp_display_enable(struct dp_display_private *dp, u32 data)
 {
 	int rc = 0;
@@ -915,11 +910,6 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
 	return 0;
 }
 
-static int dp_display_unprepare(struct msm_dp *dp_display)
-{
-	return 0;
-}
-
 int dp_display_set_plugged_cb(struct msm_dp *dp_display,
 		hdmi_codec_plugged_cb fn, struct device *codec_dev)
 {
@@ -1400,21 +1390,9 @@ static int dp_pm_suspend(struct device *dev)
 	return 0;
 }
 
-static int dp_pm_prepare(struct device *dev)
-{
-	return 0;
-}
-
-static void dp_pm_complete(struct device *dev)
-{
-
-}
-
 static const struct dev_pm_ops dp_pm_ops = {
 	.suspend = dp_pm_suspend,
 	.resume =  dp_pm_resume,
-	.prepare = dp_pm_prepare,
-	.complete = dp_pm_complete,
 };
 
 static struct platform_driver dp_display_driver = {
@@ -1565,13 +1543,6 @@ static void dp_bridge_enable(struct drm_bridge *drm_bridge)
 		return;
 	}
 
-	rc = dp_display_prepare(dp);
-	if (rc) {
-		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
-		mutex_unlock(&dp_display->event_mutex);
-		return;
-	}
-
 	state =  dp_display->hpd_state;
 
 	if (state == ST_DISPLAY_OFF)
@@ -1583,7 +1554,6 @@ static void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
 		dp_display_disable(dp_display, 0);
-		dp_display_unprepare(dp);
 	}
 
 	/* manual kick off plug event to train link */
@@ -1611,7 +1581,6 @@ static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_display(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
-	int rc = 0;
 	u32 state;
 	struct dp_display_private *dp_display;
 
@@ -1624,10 +1593,6 @@ static void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 
 	dp_display_disable(dp_display, 0);
 
-	rc = dp_display_unprepare(dp);
-	if (rc)
-		DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
-
 	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
-- 
2.34.1

