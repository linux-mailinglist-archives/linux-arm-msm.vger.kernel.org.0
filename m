Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADDE23BFA27
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 14:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231587AbhGHMbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 08:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbhGHMbd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 08:31:33 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05ED7C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 05:28:51 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id n14so14929892lfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 05:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2NpJ7aO+Jt+ovnuoQ4df+eCNMUKTUxxJ0ApMITBvevY=;
        b=i1hA8qYn02lHN59fXryMVrsz/glZorT+uR3PeKBbNchuQuiJop0XdDuvF22k6wZPHT
         wpqBh+sKQuX9qgZPW+Iw4zSPq6S3lmrILb8Cifb1eh8uqB5zR64pGv7LEVKUlUZehjAR
         WrsewfIg1+8fVQchHHVKN4uO+LwadYEiJj8s6ylrcdue6txFA0V8ylclA45Sas/P/z6K
         WFq7GEjGtROVTGuWHhRHGs4zwZq19SXJzBPqWT498t+ANRk9GqYJ/LAfjMvuTDWzvlFG
         KR4ktG8WdWe76y2wuxkV6+A4W1DuUIbAv2L1/h4ExAmCX1A6oS7qC0Kdk/Wozpb9IZNA
         pwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2NpJ7aO+Jt+ovnuoQ4df+eCNMUKTUxxJ0ApMITBvevY=;
        b=J1MeltXx5Nq+YIeT3NV45/rcqLFq9FjfPsk/xWNi3oiEeR5Vaajkrhd20zL5JBxcoO
         cwTpNNYgKUN19NrR9dg7EB60vo8IAmv6CpWINUzft9+ZnxSS7OM4u2ppMjNYLN7GRw25
         loBImzYh+fc+NlaE9nSiBUoQEcuu/7R5pgo0Bb6B+eBghU79MEqNWQLcEZjZSYtDLCOu
         zJm6JO9pD7Bp8MkV44tk/O82yWIVEm4ebuwVfslA2EExE1g9ePwmG/IbGprdpdNiS6Ga
         fV+OMBiok8w+6OQtgawBYKdzUdT2k/dDTbLpPXSivmuxCtazCx1qHjkxs8+tFqvnud8x
         heIA==
X-Gm-Message-State: AOAM530u+lYbs0uIwN0Qorx5ZI4loWscSzAE0XQ39sy54tWALa4lcZ2n
        /y69BLU7GrouDo7zNI5uxo1STA==
X-Google-Smtp-Source: ABdhPJxKdPo5abzq8Nd+N70kOUxzlBs7fbGG/FZVL7vgsfXOXK82w0NtjUnhLKVz6ywV0P/+BiVOGA==
X-Received: by 2002:ac2:4d90:: with SMTP id g16mr12625569lfe.431.1625747329399;
        Thu, 08 Jul 2021 05:28:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 05:28:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 5/7] drm/msm/dp: stop calling set_encoder_mode callback
Date:   Thu,  8 Jul 2021 15:28:31 +0300
Message-Id: <20210708122833.363451-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

None of the display drivers now implement set_encoder_mode callback.
Stop calling it from the modeset init code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

