Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D1565A92E8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Sep 2022 11:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233224AbiIAJPp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Sep 2022 05:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234102AbiIAJPf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Sep 2022 05:15:35 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 444D7A8CF1
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Sep 2022 02:15:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id v26so13255262lfd.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Sep 2022 02:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BMbeQq19sn0fA0AoYnzWmV5qecQuUrgkwG2C68BA4hc=;
        b=radD6aYjGiJPEPBluvbtUZ5aMLsaPprP8pZ78SyXCV8iyl4/S1yF3t9ZpSFxI/9mUe
         UUFVg6zUZWr265Q4HDV4brYbBeW8Gh+GOLYcY4wAXRdezEV+rrAY0lsWG0JxwvYIQJyt
         ouy8tchtOWEn7WuorHXEfRB8cfnlgXTAuf402y/N0tiIGJy+dHe/q/Ff+6eTxnqj/GZL
         dCpz80+yB67MlPVbNMpPMHkbwIGI1Xk9ahqWXgAiMvsRKCRDVROFhgCwKKO3YoKMy967
         Uw1/eozSODBheaZyUIS1R5D8bY3VrR5ZMcYhitQj9EnddlpcfOtcJGNmXcW++uiM6NV7
         r1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BMbeQq19sn0fA0AoYnzWmV5qecQuUrgkwG2C68BA4hc=;
        b=HOZPLQXjik27F14QnccJrn3FS+vgOvJ8W0D+/2S5kdOw9nGY1UyNYQEoDn17Pnp0gG
         k70fay2b30hkB2RX+HqvhFDv2pIS2QavuhQgftuXPiKBi3qI7e+QS45ZjaOsdkVsWFhc
         fV4YosK9nNnFS7vqKooA4q4vEJ30p6c3k7vhhNkfYr4IYMXvCDR4inXAv1XaYoGGEDCN
         BbnJkybYEnaqXziFPTzGZBtHo0IaROQWJW2RM6k0mMawetP4CQmbIiLKNLlA4a0q9yTA
         qRJwkd4UokQfs+dZrp6wamvP3UMbQojYJok5Q7l+lKjJYr2yHRrNCSLcH3QmXsfCgn/g
         3t8Q==
X-Gm-Message-State: ACgBeo18irg6POm6/q4F/X8BDWZt2QthosCTgOsdT6GXyVHqgmw1Nr4X
        0tJ2aCrJvvRe1bzi3A97brf+sg==
X-Google-Smtp-Source: AA6agR74ZWr0PIZ5NxMAgLXhJEsB89eCwt/udydQWWaFNZ7X4TMZk1BJ3f9j2jAKS8CjzPHFNyOafg==
X-Received: by 2002:a05:6512:12c4:b0:494:8373:5678 with SMTP id p4-20020a05651212c400b0049483735678mr2935544lfg.577.1662023731661;
        Thu, 01 Sep 2022 02:15:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t17-20020a2e2d11000000b00261b4df9ec4sm2422349ljt.138.2022.09.01.02.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 02:15:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH 3/3] drm/msm/dp: move dp_request_irq() call to dp_display_probe()
Date:   Thu,  1 Sep 2022 12:15:27 +0300
Message-Id: <20220901091527.1992208-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
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

As the MDSS registers the IRQ domain before populating child devices,
there is little point in deferring the IRQ request up to the
msm_dp_modeset_init(). Following the 'get resources as early as
possible' paradigm, move dp_request_irq() call to dp_display_probe().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 40c7f91abec9..0fb3cb773bec 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1309,6 +1309,12 @@ static int dp_display_probe(struct platform_device *pdev)
 	dp->dp_display.is_edp =
 		(dp->dp_display.connector_type == DRM_MODE_CONNECTOR_eDP);
 
+	rc = dp_display_request_irq(&dp->dp_display);
+	if (rc) {
+		DRM_ERROR("request_irq failed, ret=%d\n", rc);
+		return rc;
+	}
+
 	rc = dp_init_sub_modules(dp);
 	if (rc) {
 		DRM_ERROR("init sub module failed\n");
@@ -1600,12 +1606,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
 
-	ret = dp_display_request_irq(dp_display);
-	if (ret) {
-		DRM_ERROR("request_irq failed, ret=%d\n", ret);
-		return ret;
-	}
-
 	ret = dp_display_get_next_bridge(dp_display);
 	if (ret)
 		return ret;
-- 
2.35.1

