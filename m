Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E623C370E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jul 2021 00:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhGJWXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 18:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbhGJWW7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 18:22:59 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E0DC0613E5
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 15:20:14 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u14so4463387ljh.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 15:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
        b=fENDnaOf/UP/RMKJFYxauZAcyuS6+LC9ElBy6sBFJckE4FkoINX7w/pLhlpwRb4LoH
         XS7790rHbisHZYZ4cPkK628jgpa/blwWMmDhdysWbQfPlHl7/YMP+ESJAtaCLENjNwrJ
         Dr9YIrK5QvICN/LOqmnkhbxvYiTdRGirUbBsAtjJvY3QnQ+cGowPilRnDUQjtOma3it/
         JTeE/JLC0WsvYAgyAe44aYh7uWetQxjpzHRwxW4ig7m6/cP900djixGACrWpPId/5jys
         V3fMnGQ7vF5nmdiYsH/IVynAN8DRFh7VEAB+ZzoSWpLuCmPIgimJ0IEJaKfZ1ESTTQA/
         rV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
        b=qiklAD1q+jjMWeqit22GGHJVEeypi6RaaDw99G/J5sBMJB27JlYi1iglV7buzvh2W4
         UG+zed9VcVUUZn+wHdpnj2TkTzcGyI9G+Ts98bVibSUAKgt+l7Yna/BgJq+8LDICRgqj
         hzM1dfOEw0FteJoabi2xh7YzTJqLSJ4XGpsrAg3QtgqL+BjrzfanKLSnXOgv7JyJAY6z
         kBcLZoAMzRdhrDegRU9cBaSPUZiBUzq/TP8WIMoWsTpP1ytHZ31OC00KlfoRYN3BMvZJ
         aea24FFaMlJrtpwtU321iFAl0ReXltkoJZwYoD9k5C1Awu8GfFwD8XWiX4b+67+y4Guh
         wygA==
X-Gm-Message-State: AOAM533IetcMARgnPiyCHQA3JbFzIZvriSyHaACDMxJ5muGTvWUuF9YG
        bhxBEhos7X/Ux8ormlgRZ0EexA==
X-Google-Smtp-Source: ABdhPJz0KbTfdTPuQA7RGX6XRfCQOgs7wgEMdI9iLQdfZVyS+bMtCRlrYXKmytfRxjRqvDUwt3V3YQ==
X-Received: by 2002:a2e:9e53:: with SMTP id g19mr36997908ljk.58.1625955612418;
        Sat, 10 Jul 2021 15:20:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 15:20:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 5/7] drm/msm/dp: stop calling set_encoder_mode callback
Date:   Sun, 11 Jul 2021 01:20:03 +0300
Message-Id: <20210710222005.1334734-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
References: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
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

