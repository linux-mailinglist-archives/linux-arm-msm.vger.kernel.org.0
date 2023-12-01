Return-Path: <linux-arm-msm+bounces-2961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8893A801523
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43974281C9D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0227A59B5B;
	Fri,  1 Dec 2023 21:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DjpbUMzD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0241510DF
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:19:01 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c9d3aad61fso27097361fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701465539; x=1702070339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCMvkvY8soAo2vXd/S8Bek2w5hd5WwclA/3CQcGY+Iw=;
        b=DjpbUMzD9OzK69cpSSvMGvUVmpuTwNEKfk9PZ5aVwEipVE58oyC2GMZcMe61MYEDdZ
         Hzj7gxK34jimg2vPowTeMV+8iCOar7ne6GhKxpOtbITKJ3zD7pXBXb4LCuvS7Ll0k0sr
         7idfsccMhj3IZZdGYnIRxwkBv0N5WUgrC4YDsny10s6CcoTn+yocPqUyDfGiStWX8f9E
         JRjLJULEOT2rWpQrzCar8a5cL/6CsYb8y550wXMOilMvI7OSKEG9rR4TenRDf0eHGNEt
         T0C8RDK8mfhfLV5IHC0Ic4xMFuEKRbR2dg5ljLiUflVrPUV5Jb4bl53yaZN0XdfabLW5
         Z19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701465539; x=1702070339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCMvkvY8soAo2vXd/S8Bek2w5hd5WwclA/3CQcGY+Iw=;
        b=MgYuuti/vo/oWYaqR5iQVssESdKoHyWVz1+sopAd+5J80X2CfsJVq/kGfblXbH/MPH
         La3/RXmlwdetLA04H5RIqgFdm6izumbOjg/k51JtDtEKfycyOEpxNEFIOLTONDAnxnT3
         t/M4B63djelXxszXmdQmrbmTC04CbbTnL0Lgv7aQ8HCUwkCbZ2JdWze/6KU68l5CzcGi
         p1z51QoBAoM25WWZpzpW0ZMMvynSj8t32dbcYESW6I1wQuC5ZVPWyurVjhW6qIc1zmRF
         TUGoj8wroFac4wAz/MPl+cy2kEz6/NE3J7opPu91KvSUehIuzJi17ZqufrA94DxgpSbP
         ZNlA==
X-Gm-Message-State: AOJu0YylAOUtU1jjCD1k3A5TAfM0RmMdW1XpJUwh0PkeTz2N5x36oGga
	jHTQQl2Imn39stD/DONn0BFl8g==
X-Google-Smtp-Source: AGHT+IFro+SwRHo7Nn8XoqVBAdlF1asAkKLbl397/lSbMSfEFyf1tsXIISs/xqZJaALEmo5RqOKZVg==
X-Received: by 2002:a2e:700b:0:b0:2c9:bcb7:5e33 with SMTP id l11-20020a2e700b000000b002c9bcb75e33mr1296843ljc.44.1701465539368;
        Fri, 01 Dec 2023 13:18:59 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 13:18:58 -0800 (PST)
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
Subject: [PATCH v4 10/13] drm/msm/dpu: use drmm-managed allocation for dpu_crtc
Date: Sat,  2 Dec 2023 00:18:42 +0300
Message-Id: <20231201211845.1026967-11-dmitry.baryshkov@linaro.org>
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

Change struct dpu_crtc allocation to use drmm_crtc_alloc_with_planes().
This removes the need to perform any actions on CRTC destruction.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 25 +++++++-----------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 3c475f8042b0..a798c10036e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -51,17 +51,6 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
 	return to_dpu_kms(priv->kms);
 }
 
-static void dpu_crtc_destroy(struct drm_crtc *crtc)
-{
-	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
-
-	if (!crtc)
-		return;
-
-	drm_crtc_cleanup(crtc);
-	kfree(dpu_crtc);
-}
-
 static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 {
 	struct drm_device *dev = crtc->dev;
@@ -1435,7 +1424,6 @@ static int dpu_crtc_late_register(struct drm_crtc *crtc)
 
 static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.set_config = drm_atomic_helper_set_config,
-	.destroy = dpu_crtc_destroy,
 	.page_flip = drm_atomic_helper_page_flip,
 	.reset = dpu_crtc_reset,
 	.atomic_duplicate_state = dpu_crtc_duplicate_state,
@@ -1469,9 +1457,13 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 	struct dpu_crtc *dpu_crtc;
 	int i, ret;
 
-	dpu_crtc = kzalloc(sizeof(*dpu_crtc), GFP_KERNEL);
-	if (!dpu_crtc)
-		return ERR_PTR(-ENOMEM);
+	dpu_crtc = drmm_crtc_alloc_with_planes(dev, struct dpu_crtc, base,
+					       plane, cursor,
+					       &dpu_crtc_funcs,
+					       NULL);
+
+	if (IS_ERR(dpu_crtc))
+		return ERR_CAST(dpu_crtc);
 
 	crtc = &dpu_crtc->base;
 	crtc->dev = dev;
@@ -1491,9 +1483,6 @@ struct drm_crtc *dpu_crtc_init(struct drm_device *dev, struct drm_plane *plane,
 				dpu_crtc_frame_event_work);
 	}
 
-	drm_crtc_init_with_planes(dev, crtc, plane, cursor, &dpu_crtc_funcs,
-				NULL);
-
 	drm_crtc_helper_add(crtc, &dpu_crtc_helper_funcs);
 
 	if (dpu_kms->catalog->dspp_count)
-- 
2.39.2


