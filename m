Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6DAE3C2BCA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 01:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhGIXxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 19:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhGIXxP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 19:53:15 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD109C0613E5
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 16:50:31 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id q18so26546125lfc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 16:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
        b=PIUKaE5ue2Sn7b+1bTo40616rgAAHVpNo3GCi92/h57cImN34xz3/QdWsNYnVsBlql
         VVPQbezVXdsIioe5uUPYhmW9UTmQ+unmfXPxN+GQ+VaPJgrJydYj0GyM1Oq68EcSrpIs
         citjJBPuCUUytxCDHBVPAs1j1gz/aA6vZG//W7OUNMPZyVYqizhPHufUl7nGsGF6Zhfe
         2iGGFq3H8oX91kGDTNSO8xD6bzFHp6SjFwGAncUwGuBlpXhwMTCQL+bQ2WOjIG2pBEg3
         4QF8EA14l04luXwZ0xDvfHueAPdkGdhixL+l0hadkMVg5zb6iWLiZ5rrT8+Un1xX+Zqw
         Wm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TR8ndGweFJ1zlT+mXoJoL5P2xKgyplXAag8kXZdug0c=;
        b=pjmsGVNm/A+I5DP8mZ6pI2rLlEi2wLsrtCXuSYPSnQu93RY5O0x+nvybaOaWzTtxsK
         ora1ppPww/sH24PxuYDTDqyUxnrkUSTW9MTDKCwz9GbYBXNtCzbue0f7osGV+lY0vEVF
         Y4tqn4HSaEwPhALs1zOQxT4j6NWeRLiRlUmyzc3RNRPxuq/br4KwWzAd951em467EmJt
         CTKc3pSwAHkDM6WM+r8mPhLl8iTBCRpgZROG4LkewWhmEZqGOqZqHPMEmBOu+JMukXGy
         8b9dVROMbS/Ln4y9VL3AgXj/UQrzDgI31nnNKlFLX0vtowYlyycAeRvgu7912wiGTO5e
         niSA==
X-Gm-Message-State: AOAM530rv9Mht7v1lRU2Tt0bYkMvVn0axEYbvkQegtDsKgDVEVwjz/0T
        zU7yX2E0Exdr8sTrA3Smarf/HA==
X-Google-Smtp-Source: ABdhPJxMyoUwsBZ83rVWTMY8hgakNpqW7Cdx0IP8Zq5KW+sntfIMw8Y2r+2tN3dpnqR85DuTY5E3aA==
X-Received: by 2002:a05:6512:1511:: with SMTP id bq17mr31109194lfb.341.1625874630114;
        Fri, 09 Jul 2021 16:50:30 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10sm718964ljp.20.2021.07.09.16.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 16:50:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm/msm/dp: stop calling set_encoder_mode callback
Date:   Sat, 10 Jul 2021 02:50:22 +0300
Message-Id: <20210709235024.1077888-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
References: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
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

