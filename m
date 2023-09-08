Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D80A57980D3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Sep 2023 05:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235743AbjIHDFx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Sep 2023 23:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238449AbjIHDFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Sep 2023 23:05:49 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82FEA1BE9
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 20:05:26 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2bcbfb3705dso26792231fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Sep 2023 20:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694142325; x=1694747125; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FX3U4Kv6boSoIeXiFA0GqPmb+Xk7f6TWSY7AwcdRtXw=;
        b=pOxSDlRF9k6DA7FWLJgix4KyPK1DnXYu8UBPWQwLCDdNGF/J++ueOuHLnzrQT3ZAf+
         rf14f98tSUEj/M0qb/QjykwSTu9SUBL+jsQLhPHdnOV+p7K+gobLOJrQozYT5h1ajXc+
         /IWD4QoHRXmbVgUbWfstGKd2VHtG/R8yeAbOPpXg0Sv6DsSrrSF8aJxh19LcZMPlOZWS
         CyOzLQy8QXShAcPNe2q5BGxgaGNnGsVnm3YncWIlXiRgf71soTHwJDo0wk1t8173q4lP
         GMHUuFk36tbvbc4hyJDSHIBWU6JFCqjPWPVHH0lTzhfowHVSvsuW2oRjHiNz/54easzy
         CXfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694142325; x=1694747125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FX3U4Kv6boSoIeXiFA0GqPmb+Xk7f6TWSY7AwcdRtXw=;
        b=R/ApmTgJ2AZ6X7sphp1Y8lWUYHab4ktVx4DevZ2xqBPZXp/VQPqqB361NCNnXb2Dtf
         QdtB6qYChOg41BBhwVxnWW144zIQlixHaOrp7xnEv70gu++bDWUirOQANvk8UEjEnKqC
         wAioTkYzfgEbEx9qJLZgzgeqJvGK10yD3t6ew0kydP6DU6N3Q/MWY9pshAVzNt3gF6gU
         4W2y/AUM+cFNIVs+b/q9B5UtIFYehAO+d2LLXlsQxTyQscGZCpbwfK3fEAVUkspGY6PA
         dioSIXv3u7IDQYW1GEHQuEFBHPM1WNSKzr7bKV3URNLuBejSLjfpHKceWKkVq2Gf6GNh
         A5xA==
X-Gm-Message-State: AOJu0YykzDdZnMRna12a4ITKGs5OXPytFY8waKgBKFT5T6uurw+t5f85
        ETAF1lW1nvAnksQFk2FsCfNlMg==
X-Google-Smtp-Source: AGHT+IE1UWo6gyoG9WOKNs/u/38JmWyXkL5hWEPnw8XhwXskinhp5YUgh8TkpIKV0TF6lTqgb7Va+A==
X-Received: by 2002:a2e:97d7:0:b0:2b9:f13b:6139 with SMTP id m23-20020a2e97d7000000b002b9f13b6139mr782892ljj.20.1694142324853;
        Thu, 07 Sep 2023 20:05:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z10-20020a2e8e8a000000b002b93d66b82asm128332ljk.112.2023.09.07.20.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 20:05:24 -0700 (PDT)
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
Subject: [PATCH 3/5] drm/msm/dpu: drop global_state_lock
Date:   Fri,  8 Sep 2023 06:05:19 +0300
Message-Id: <20230908030521.236309-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
References: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index fba2294e329f..ee84160592ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -328,11 +328,6 @@ struct dpu_global_state *dpu_kms_get_global_state(struct drm_atomic_state *s)
 	struct msm_drm_private *priv = s->dev->dev_private;
 	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_private_state *priv_state;
-	int ret;
-
-	ret = drm_modeset_lock(&dpu_kms->global_state_lock, s->acquire_ctx);
-	if (ret)
-		return ERR_PTR(ret);
 
 	priv_state = drm_atomic_get_private_obj_state(s,
 						&dpu_kms->global_state);
@@ -373,8 +368,6 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 {
 	struct dpu_global_state *state;
 
-	drm_modeset_lock_init(&dpu_kms->global_state_lock);
-
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return -ENOMEM;
@@ -388,7 +381,6 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 static void dpu_kms_global_obj_fini(struct dpu_kms *dpu_kms)
 {
 	drm_atomic_private_obj_fini(&dpu_kms->global_state);
-	drm_modeset_lock_fini(&dpu_kms->global_state_lock);
 }
 
 static int dpu_kms_parse_data_bus_icc_path(struct dpu_kms *dpu_kms)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index b6f53ca6e962..ed549f0f7c65 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -84,7 +84,6 @@ struct dpu_kms {
 	 * Global private object state, Do not access directly, use
 	 * dpu_kms_global_get_state()
 	 */
-	struct drm_modeset_lock global_state_lock;
 	struct drm_private_obj global_state;
 
 	struct dpu_rm rm;
-- 
2.39.2

