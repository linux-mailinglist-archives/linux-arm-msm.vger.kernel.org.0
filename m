Return-Path: <linux-arm-msm+bounces-3067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E69801FE2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C8D01F20FE6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C1133E9;
	Sun,  3 Dec 2023 00:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBu8hJzw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFED11A
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:05:40 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c9efa1ab7fso8362091fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701561938; x=1702166738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Dumt1dCkdFi8NtSV/s2hFPU6604xTCuNq1eJtpJNJ0=;
        b=JBu8hJzwfhN3c+gKDLaYGU04q7CY4oqYYP5sfh6R0VsvkEE7OHM94K3c9D1rmeWS56
         QOPhPkbYQtLR3We6hHRUHCDIb2g+op09r9p6MJ2+t/B6xb1ldqPMkarsVngVrw4lDOkX
         H0L6/1M/9bM8S+/U6D214UE2jcRz19Rq/a9k227+isN53p6yjw4b6qR/sz5ZXkAcbsUZ
         4Y4BQC9cY7l96LcLIz+Qx/Sv78Xl0JIc7YofUqRdMCHV3LhWABBVZayKKAoSTig8EOyV
         kYdbKWifPP0TmVCzonO5ByI87S49PuNVDuX9nHd1oZm+Sv/0KQ0UsANhtof9T6iQD2c6
         PKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701561938; x=1702166738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Dumt1dCkdFi8NtSV/s2hFPU6604xTCuNq1eJtpJNJ0=;
        b=tZ0/g1vz8QnyfgeuzxEpqxD3AA6tDe0QexTrvTawmqSws6E8KrXSB7nZTINhl5BE+5
         o/BqGqpbJk25+tMfrrvOFyWnaneYm1sfGQbcvQ1NF3wuVt4R45z9uMYyNtjAC5AOn6zg
         884HN5Jll+8DkhvLlTyfimH3jPIdh5v3yKq/f5J+UVENeB0DJeTY+N1wa7m2xXosXN7p
         j+9R4iJTIYRuFlWT1J/u8oo248Br4BwDMAC1mtRz1R1yOtBygGYItf4CtLwu99/Zj7WJ
         hqCvI4221drIs6ci14T2lPWBqLlbQmpdyFa9OP9Udodffi6abYuqHaajTamaIf3URl4v
         dqdg==
X-Gm-Message-State: AOJu0YxK45n6vCwpDVD3w5Xden25KnMzI2GfHQ6SkD+fXXoeiSATVQdW
	8m/X/Wid5GrCzCF1LQ2I5FBQIA==
X-Google-Smtp-Source: AGHT+IER/lkHM6YBgTm+oPsGjrSaaKUQgAkDiVcDNXYpjXX8xjsC9WdyApirtDFvBpmfZpCP9+ry7g==
X-Received: by 2002:ac2:4a8b:0:b0:50b:bce5:2cca with SMTP id l11-20020ac24a8b000000b0050bbce52ccamr768305lfp.61.1701561938550;
        Sat, 02 Dec 2023 16:05:38 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t2-20020a19ad02000000b0050bc5edfa45sm826273lfc.85.2023.12.02.16.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:05:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH RESEND 5/5] drm/msm/mdp5: drop global_state_lock
Date: Sun,  3 Dec 2023 03:05:32 +0300
Message-Id: <20231203000532.1290480-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
index cd46c2b0ec0c..b1d2f00974d5 100644
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
@@ -613,7 +606,6 @@ static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
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


