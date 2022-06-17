Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA6C5500AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 01:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382545AbiFQXYj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 19:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236761AbiFQXYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 19:24:39 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 933C66622C
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:24:37 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id d18so6194952ljc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 16:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V3CoSuB4D5qInJIqDTgQj0Rw+X+4vfSubGhWpl0S/2Q=;
        b=Z+mW8n/vzz2WwQ8BmJtwxjGoBuU8ju8kzUyG9femrn7n6qDgnDFA3Z+bHo++Qi9POf
         QRc8LwhGzFscD8ICBYEvF7Ny85JNxxMsdz5/JkWnKRtRq2x3ceFvVvyifySutuNuru7J
         7HBho3f8PuULqNWNDdrTg1PAPpChWW2NVVwqvrO8MPCXTEl36y0eUDKNBUL5ar5w6S82
         u1pWLrh/2fOPhGd2BsL85yzo5WCJl4xTZvKrpO2jeRtJucFFfe+R/+86NF1/VGUVH6dj
         /h0JW1tsZk7DgT10xNcwktf8Kes5jdTMvqaGe8mYybdcD9laT4q+MkD5kyILOuV9j3Qa
         msKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V3CoSuB4D5qInJIqDTgQj0Rw+X+4vfSubGhWpl0S/2Q=;
        b=qV491lv3nAYFoofeFU4T+cjtrwm2EWVFnQx8++2ShxIDoFPaZBMKfafJnx5nPqcvPW
         3S2Zd9yxKamLW+d31z8RhUB8CNXwh26CtVUOfvvnd8JV9JGT9czm3VvCDkST8fnolW/s
         Zrneyjydiq74CwquSlFOivXc7PHHH1fX24zIXnTyd0lswCLgRsCILoYJUslXy9KzWfqH
         EcEmPEjF0/vm0rzHSp15TqhF8FzkV+P8mK0Vbl+KpXJ5Kml2mdeIvBNMalf7jYsvmd3Q
         3gNdipQf1rWTfEBaiUnGUuBl5r4bfAcUj67gApYul5K0qAIui9oHV5KK1MuD3arhPQfD
         3E9Q==
X-Gm-Message-State: AJIora9v/2bn+hhBmGTXBmH740SXCZ5d0IqyZ3VL5dlnfnBSYSNvseCW
        RXU0288ZGAadLLwqAB96ElubZ+xOx5w2h/+Q
X-Google-Smtp-Source: AGRyM1v4Kt1s+lv2jMlNJEh5BGzkXvB/hPQ0IvYIrRfGYdlkZA6sSojphvexXEm4aRL63Bp96r/3MA==
X-Received: by 2002:a05:651c:23b:b0:259:fee:cc2a with SMTP id z27-20020a05651c023b00b002590feecc2amr6118733ljn.400.1655508275957;
        Fri, 17 Jun 2022 16:24:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a7-20020a194f47000000b00478f9517a60sm802742lfk.38.2022.06.17.16.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 16:24:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/msm/dp: remove unused stubs
Date:   Sat, 18 Jun 2022 02:24:32 +0300
Message-Id: <20220617232434.1139950-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Refactoring DP code transformed several functions into empty stubs.
Remove them.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 35 -----------------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 08e3f0b1b395..fea610793dc4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -857,11 +857,6 @@ static int dp_display_set_mode(struct msm_dp *dp_display,
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
@@ -938,11 +933,6 @@ static int dp_display_disable(struct dp_display_private *dp, u32 data)
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
@@ -1458,21 +1448,9 @@ static int dp_pm_suspend(struct device *dev)
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
@@ -1686,13 +1664,6 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
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
 
 	if (state == ST_DISPLAY_OFF) {
@@ -1706,7 +1677,6 @@ void dp_bridge_enable(struct drm_bridge *drm_bridge)
 	if (rc) {
 		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
 		dp_display_disable(dp_display, 0);
-		dp_display_unprepare(dp);
 	}
 
 	/* completed connection */
@@ -1731,7 +1701,6 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 {
 	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
 	struct msm_dp *dp = dp_bridge->dp_display;
-	int rc = 0;
 	u32 state;
 	struct dp_display_private *dp_display;
 
@@ -1750,10 +1719,6 @@ void dp_bridge_post_disable(struct drm_bridge *drm_bridge)
 
 	dp_display_disable(dp_display, 0);
 
-	rc = dp_display_unprepare(dp);
-	if (rc)
-		DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
-
 	state =  dp_display->hpd_state;
 	if (state == ST_DISCONNECT_PENDING) {
 		/* completed disconnection */
-- 
2.35.1

