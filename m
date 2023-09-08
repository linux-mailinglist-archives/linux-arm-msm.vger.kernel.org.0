Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FBE67980D4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Sep 2023 05:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237040AbjIHDFy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 23:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237933AbjIHDFu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 23:05:50 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE051BF1
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 20:05:27 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2bf6b37859eso2310461fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 20:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694142326; x=1694747126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4EuRyGB2FCn8eHtdShX5HJtuBHexPXckCeOw+rDTXl8=;
        b=Az5+uW8XRiDlJX1h8q16DFEmsIAmuQjXf9wpGubNtN9PJ7PvKYshnpZQ8Lbk3reZJ1
         IbzWBT3zigdHHViIOiHF06PcWHO4mRUsqADCkzNDTjbM9+EQ1t2Di/MOLwxU8tO4kl1c
         gy4sdZPqMkdcOLpQJZYYQLXStC2izKqxJc8GnFtrLop9x1Lge+b0BHNPogBnkRWWHeiA
         vQWj9q6BWLjD4Hq/31OdbngyLvmvD3tWx70M2fmtGpMebotrcIniFitBqxgW/LIOaGo5
         irRQMnJ+1D/K6C19Y0yIB/4ACL9q2B6b7uazwwAYZpQZ1qBcLZ8YLYQlkZ64YYsLV6xI
         1NLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694142326; x=1694747126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4EuRyGB2FCn8eHtdShX5HJtuBHexPXckCeOw+rDTXl8=;
        b=GaCtfL1qdYfpAiLRbtuOkjFFgg4jy1IdEdzyzWBlcCVsTSx8HGFccXsLgAC96yRLDC
         kG8HAmCoP2YpxHLZjXPVG3G63cZVY7ls/3aq6lAJt0ZHn9UKyPJzdnXfKEp9FeEBvL5K
         k0nJjL34x2uWrRb4l4eEvS9Dy18gWJDvXq0XI8DwBZI1y8VEhQYWSRA6xvm8F131fKzO
         nW2TL6eBkQGH9XtcDJ/2+hnjcoUBLYTTR2+FwVK2pL5eWGP+oK8qtDytJniQiJmqEaW/
         vXWjNQFIg8sP4zWGCO54m6WvIZ/b8j2Cfzq1e3P5QoCY7H3Ne6wTGEaVtMU8cKWyYMXY
         iEOA==
X-Gm-Message-State: AOJu0YwG+y89sc3wQrievDYzvYytwr7x3d+V6OIQrfrnTAG4Ol8uDN+n
        DDAsVEvEEwotScKcHb/ibI497A==
X-Google-Smtp-Source: AGHT+IFb1SE2OljNZih8LbGcYPj0m1xg2/28UjpUhM0NBZt6+shhbkdtZRJ7HtZ9/1kaAYxCIHjKQw==
X-Received: by 2002:a2e:88d4:0:b0:2bc:cee6:4342 with SMTP id a20-20020a2e88d4000000b002bccee64342mr644830ljk.13.1694142326362;
        Thu, 07 Sep 2023 20:05:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z10-20020a2e8e8a000000b002b93d66b82asm128332ljk.112.2023.09.07.20.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 20:05:25 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/5] drm/msm/mdp5: drop global_state_lock
Date:   Fri,  8 Sep 2023 06:05:21 +0300
Message-Id: <20230908030521.236309-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
References: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
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

Since the commit b962a12050a3 ("drm/atomic: integrate modeset lock with
private objects") the DRM framework no longer requires the external
lock for private objects. Drop the lock, letting the DRM to manage
private object locking.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 8 --------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 4d51a736d1d0..c15fa9dafe55 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -84,11 +84,6 @@ struct mdp5_global_state *mdp5_get_global_state(struct drm_atomic_state *s)
 	struct msm_drm_private *priv = s->dev->dev_private;
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
 	struct drm_private_state *priv_state;
-	int ret;
-
-	ret = drm_modeset_lock(&mdp5_kms->glob_state_lock, s->acquire_ctx);
-	if (ret)
-		return ERR_PTR(ret);
 
 	priv_state = drm_atomic_get_private_obj_state(s, &mdp5_kms->glob_state);
 	if (IS_ERR(priv_state))
@@ -138,8 +133,6 @@ static int mdp5_global_obj_init(struct mdp5_kms *mdp5_kms)
 {
 	struct mdp5_global_state *state;
 
-	drm_modeset_lock_init(&mdp5_kms->glob_state_lock);
-
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return -ENOMEM;
@@ -626,7 +619,6 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
 	drm_atomic_private_obj_fini(&mdp5_kms->glob_state);
-	drm_modeset_lock_fini(&mdp5_kms->glob_state_lock);
 }
 
 static int construct_pipes(struct mdp5_kms *mdp5_kms, int cnt,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 29bf11f08601..70fdc0b6c7c5 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -40,7 +40,6 @@ struct mdp5_kms {
 	 * Global private object state, Do not access directly, use
 	 * mdp5_global_get_state()
 	 */
-	struct drm_modeset_lock glob_state_lock;
 	struct drm_private_obj glob_state;
 
 	struct mdp5_smp *smp;
-- 
2.39.2

