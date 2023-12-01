Return-Path: <linux-arm-msm+bounces-2957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 694C0801518
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AB061C20A0A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E5C59B4A;
	Fri,  1 Dec 2023 21:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VVELb08j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD2310D7
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:18:57 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2c9d44b2919so19342471fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701465535; x=1702070335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1H+676xg8CDVHNjQH5/jgpk8ey6NbauW7LP0KObo83c=;
        b=VVELb08j7kweBa9uz4hg/3sC4qSkOiy5fy+EuisZlyqKtmjhAcK7EXTrt+NKfpe+40
         9qB58pFG/cho/HzSiGCzoLpGgmkOwTnJBrr1LBz21z+nfmGnPiJTHEG8YsS8i3Ye/jnP
         bxbz63Ldfo1mwjkjsV+dPA4IKIZYNq8Lzq5KahhkVO5ERvo4Q2D1sfr+9h3U2Ung4Jho
         6GLI+PivzmlToxtb34nhnpO8Q1qoUgDTw79eE0YGhBKiZEJiA6EEq8AAa4qJSFfhFR2l
         VVuPEfEcZ8k3SEMkKg9pgO7AIwadB/X1v6zMeSpU9SurzyWYgt9zruTNQ6QZu+/mRekP
         e05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701465535; x=1702070335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1H+676xg8CDVHNjQH5/jgpk8ey6NbauW7LP0KObo83c=;
        b=jRsOG7Y4wsu12sjZT4Jt3dw00O6YyWFUcZ1w6uGEA6D4yzx93WMXmZ0ek9Ola99Gva
         ITZ/yyVyKlN6OPeAVbjiuBOucOrhCTShxD2azy281FNBlOBqNCBB1Xt8dIo2PMb0t4CW
         FTwRBOOq0HGbqPYQRQhYD3Ejr15rXtP4xp2tArj420hem95OUJlBErXPn3Yq1oXHPcDz
         nAcsgOm96benQZlhcTVR2Xp0S1wuuAWl365YrpTdShWE2eica6HF0Ok5QbxT0XHj5BCJ
         TjgtiAq55zxGqqPJJ3avmdnXWR9QCNv4Yh4MaynmLF+hoHUNJp5tG7WBAHrsEpzYRjko
         EKUQ==
X-Gm-Message-State: AOJu0YxBcKENYJbIS0gpqDBrhm3CjZMOe+H3UU8hjFql/41Jovb3MJnZ
	lAk2d/x8SGH5zdgTSZ0NE5PwsA==
X-Google-Smtp-Source: AGHT+IGGkNLkCVz41AmhhsapBXbFIcu0JAr3c6bUqYz1hD7m28Yg9UFmCiGwD/ZlhDF50JrpIcXkmA==
X-Received: by 2002:a2e:5358:0:b0:2c9:980f:3f5a with SMTP id t24-20020a2e5358000000b002c9980f3f5amr1121148ljd.3.1701465535618;
        Fri, 01 Dec 2023 13:18:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 13:18:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v4 07/13] drm/msm/dpu: drop unused dpu_plane::lock
Date: Sat,  2 Dec 2023 00:18:39 +0300
Message-Id: <20231201211845.1026967-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field dpu_plane::lock was never used for protecting any kind of
data. Drop it now.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3eef5e025e12..20908f3d8f81 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -78,8 +78,6 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 struct dpu_plane {
 	struct drm_plane base;
 
-	struct mutex lock;
-
 	enum dpu_sspp pipe;
 
 	uint32_t color_fill;
@@ -1227,8 +1225,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		if (pstate->r_pipe.sspp)
 			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
 
-		mutex_destroy(&pdpu->lock);
-
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
@@ -1488,8 +1484,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	/* success! finalize initialization */
 	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
 
-	mutex_init(&pdpu->lock);
-
 	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
 					pipe, plane->base.id);
 	return plane;
-- 
2.39.2


