Return-Path: <linux-arm-msm+bounces-3065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BA6801FE0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75CFF1C208C6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF928322B;
	Sun,  3 Dec 2023 00:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M+1f7goo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6AEC8
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:05:38 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50be08b8fd9so1757377e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701561937; x=1702166737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+wZcXHVwkeUQMwvuCD7bm1l/4FwKqd7nf6ZvebDIGQ=;
        b=M+1f7gooGooMI5xMJXIfwxhAuIH5KG6tyMOPRL4lCHZRdATJbu7+gDV1Kl12V2bsi1
         cBTTv72ujToHyESQBZRshQJ/YmO74SikUCCcVHGABsayU922ypeMdVCkPtOqk20x5C3a
         FvWnxyoCHSfjFeKNRei70VmvsZN1o0ixp2+UsSW+sP19O9Gz9XhF0kLi3WpCQol7SifF
         VoArEXX0p/oSZM1HjT7d2qDcNuFveGnr0RydYDhawkG7jldTzqt3fag5F7w6j/Oiiri6
         So9+x3jb2F1Gk3HP1ClB+a5kziVuih6GRDewaoxWAbo2pJJhlQg3E5htqHsyJLKt68hs
         Hbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701561937; x=1702166737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+wZcXHVwkeUQMwvuCD7bm1l/4FwKqd7nf6ZvebDIGQ=;
        b=GDOBVWBFZOvuPWJ0VmD3lg5lTmcXiLgKgNzt1oiQEAwwyY/fufuhy7mwVltAEr1iX2
         +kAzsDM3OqkuDolRItrkGm76aBJ0lFavhHBIk8dZWNBbCkbIeuAEvJZTdVxcz334VgD/
         NUvg3DkzJQuDpLGH9u6Tx/SiXL6sEyliv5Tkhv20ldoFJnJXuz+BUqZ1Jvq6VVuNGh3c
         k+7xniY/IKmOdYoWihWdnxb+IVgKA9IIYpnfIYufkGry7XJRMksMIQv6zjzZNrlBbmgW
         znRb+/+r5OW7xgGj5SM3yvug62kjbzbk67Cz4sS2lQ6f33dPSNQby6m+Wwj4hLueQvhf
         2DHw==
X-Gm-Message-State: AOJu0YwrDD8wnUcTwnsA67zUH2JBnh2q24YZOLMCyi2VeEVkffUF16Se
	bY+wzDwMfivDiiaCrn6pi0rjyA==
X-Google-Smtp-Source: AGHT+IENugRCNKbSEq35yn6WCv2d3q8Y4gd+BmrHRk5E/Q8JWVggoRvCzdt8HjHJvntRZkrSF8G87w==
X-Received: by 2002:ac2:44ba:0:b0:50b:b13f:f46a with SMTP id c26-20020ac244ba000000b0050bb13ff46amr1600759lfm.3.1701561937180;
        Sat, 02 Dec 2023 16:05:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t2-20020a19ad02000000b0050bc5edfa45sm826273lfc.85.2023.12.02.16.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:05:36 -0800 (PST)
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
Subject: [PATCH RESEND 3/5] drm/msm/dpu: drop global_state_lock
Date: Sun,  3 Dec 2023 03:05:30 +0300
Message-Id: <20231203000532.1290480-4-dmitry.baryshkov@linaro.org>
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 --------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 73f70e67cfef..26ac00f8f486 100644
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


