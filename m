Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E783CC361
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 14:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233568AbhGQMnY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jul 2021 08:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233613AbhGQMnX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jul 2021 08:43:23 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D87C061762
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:40:26 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id bn5so17584648ljb.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
        b=Th4ffsnHt9IjURUA+uuC3RwdJGkgKZaPLdGejWNpQAj+cfH3gJa1OMugKmcM2LctC+
         Km66oxxeq11JiRTjurNc6Zr0M+fEmixbNqXCGcvflQD4ZTmYXXRfNXsrdSLuOQkMl0/b
         GaS7cB9xlHJaukbHNuXM0N69E4rj9kDczZ7ygEGYXMJ1HtVsswFJBTB5MOX/0n51e5zN
         q0Ylr66lP7xwSyVPsk+talf24dz6bQegDlnhkb2BwB/XzbtJOt6tUXIg6smzzWp4fa9O
         N7hKjLxXMP/yOWojDCIg5xSoMX6c3Wl1uMb72WbpoCQKGrJt58I8u+O60BI34gKxBTcT
         r0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
        b=d1N3D7w5W+ar8OE5q5HcCvxZsvL9f/RM/eRONd7+Ir3FKKSKl4Jbw29X4tIV27GPcg
         QTfDbGXNxI4iBROBfZ9neN9oihkRBAGbjZwjqxWPr28qtSx/3BnHB7AnL63ExZHXt7MH
         0Sh408dcdiqq5hL/uR7qwFGn64vG+5n+Q/O7u8pWV9ZzOnj5jzpDQetwmmkBhaenN9VL
         K0CpDJIDQsxW9dnGb0ZhWc0tYyB2r5ZOrKfbuyr9/O0pEYrTmGcDRP4sAHTk3LfhRTrp
         6l73e53ZeJwk+woMZIQqqAM3a+VMECT68bCfHj1Ok+liEDpPDfED4aHtXkBJFGy58Z0F
         GmuQ==
X-Gm-Message-State: AOAM530bID6cbU0pHDjbP7SssUvm103jzYyz5XsUzmKnJRAhBP1a2eaN
        eSNTAMrip5cgUDeN61dlJXemAA==
X-Google-Smtp-Source: ABdhPJyCGRFdKGW7hVOWYqixrZ/N2UXw0JTNWpkLFdE6MsfOK+5iTiSkNL8O0BE1dgpyCaBf6u4yew==
X-Received: by 2002:a05:651c:160e:: with SMTP id f14mr4677849ljq.273.1626525625205;
        Sat, 17 Jul 2021 05:40:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f25sm794264ljo.126.2021.07.17.05.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 05:40:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 5/7] drm/msm/dp: stop calling set_encoder_mode callback
Date:   Sat, 17 Jul 2021 15:40:14 +0300
Message-Id: <20210717124016.316020-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

None of the display drivers now implement set_encoder_mode callback.
Stop calling it from the modeset init code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 051c1be1de7e..70b319a8fe83 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -102,8 +102,6 @@ struct dp_display_private {
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
 
-	bool encoder_mode_set;
-
 	/* wait for audio signaling */
 	struct completion audio_comp;
 
@@ -283,20 +281,6 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
 }
 
 
-static void dp_display_set_encoder_mode(struct dp_display_private *dp)
-{
-	struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	if (!dp->encoder_mode_set && dp->dp_display.encoder &&
-				kms->funcs->set_encoder_mode) {
-		kms->funcs->set_encoder_mode(kms,
-				dp->dp_display.encoder, false);
-
-		dp->encoder_mode_set = true;
-	}
-}
-
 static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 					    bool hpd)
 {
@@ -369,8 +353,6 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
 	if (dp->usbpd->orientation == ORIENTATION_CC2)
 		flip = true;
 
-	dp_display_set_encoder_mode(dp);
-
 	dp_power_init(dp->power, flip);
 	dp_ctrl_host_init(dp->ctrl, flip, reset);
 	dp_aux_init(dp->aux);
-- 
2.30.2

