Return-Path: <linux-arm-msm+bounces-56969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E71AAC9D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 17:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECE4A4E6C2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F037283159;
	Tue,  6 May 2025 15:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ALHlZBG3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91549283123
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 15:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546475; cv=none; b=cEP8yU4leUO+Y27la/6j+ldcrDexBAHMnUx6zKBiv4lOQElSVLoIBzi7AAdx8OPEkXKb5AsufC/0iHlFnEPbEK6tRFbMIzShjIhIR032ZUuqscF+PtU9TzA7QK5rNZDkYYUQMzKiPCpCMVbPX4BS8tleHOf4Y8DBvXqE+VjTnGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546475; c=relaxed/simple;
	bh=e+MxQIILmTfaUEYG8mRcW6giFJAkMzchKGmqQw3Zq2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ls+RwxGSVLYzLCf3XdmPpstgZX5qrB6NH4jXsOZZvi+1p0z0cjpCEB95I71SoZSSJeD3/L2xX1E2oGizfJQyrERUagraC6NllczTuxucUV1E5YCj6kxIa+Ypz98Iz9BrAt27aI2GCOrqW3Kelx0VVNaeS9s3jOYsfRcIvKP8E88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ALHlZBG3; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-309f3bf23b8so7663474a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546472; x=1747151272; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EAZqwoIR5WgNwGU/xBD+IG2xOYwT2VXmbD6p9oxdt2c=;
        b=ALHlZBG3ykLmBfuUSMScOFcItN4DJ+4RdbNdad2wSchL+9g6gVDGST0Ad8nlREnhHs
         mFPsVaqLzYMq1qROyBsGfxh0LyrYH0BlEWHqMq+Nn+M9miey5zbzKGf07k/CYaks2p1J
         a42cyWePtejaTKPIv2rcRCzPLN8HDvnxHN15umWgpYdIeJyQn1ueNIThA6R9Mnfhmctm
         FP4fcT1cUEWoH+60BzU1YaBJtXNFNBXwrIveubrGaQ7ZHuAZofVcxessxQI0i16ii/Yq
         D1Qiax2rJBafNuxhRqLlJ4wdChUip8ZyTlS1Cs2nKReb3/sRb87V7dEdb3Trwmbdi/BC
         LDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546472; x=1747151272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAZqwoIR5WgNwGU/xBD+IG2xOYwT2VXmbD6p9oxdt2c=;
        b=JBgHewK9/xAgh86iHlnkNpqH0aYE5IojyxQt2cv7LV0DnChvY00I9Z12xBi78ZQCb0
         Gd1FitcD5Zg6PIh6mkdTqPeqsmu3Ny2FYUH/A0ADlTIYE0afi7tFkb0mHLWr4DiudR/3
         CMXEjkRkNt/gPL8sbMyziuaxuXymwkDdCjnkNCf1JRTf3pNKNbMiVqSB3Rthd+GAxVEG
         xgytECFhOtUA9Di8d/Q/b6M7EVgXM6e8QncAAd0d1xRylUXi6imbqG6z/8w56G0WkzJN
         Hie8NJOWDuRSWsbrVD4PtVwLK8AGB4wbrRsCQJmcKvYQjuYGUDMswiXLlX21pJYyDdPu
         9r+A==
X-Gm-Message-State: AOJu0Yxm7V205MGIHCvK7ZJQnpZJQYY7bMs8THmNFRzAxLQE3V/4de1+
	CsFyhCPH2mkefPqDR8/umE/7tbmclICWfh0rMjQdTI2VcLo+uotodfXEE0ZnMRIe2ifrhteQDjA
	jE9RrdQ==
X-Gm-Gg: ASbGncvczpUDRvCJBrIwtQ89YKqBnr1k//WnXCoromwdbXsde1AdQkT/O7xZyctgSkU
	8cUGdsY8cf0TUlfDtJ0rXX/MoYs8wx3/0QhAX5utNmd0axSXG0fUwKGNwQrwl+mXAyEctl1SA2J
	vXSPnwEa0n6hdE2AuRpNCbWPg1ejj1u5LeSbH5SLUYWho2ryG0j8jrSE5lVmk6+0x+TEjzuLsTH
	JiA63nsL00MVX4/rlK6NJwOJT8vTFeft19QUmw3sSJ3//EVsoR5aJWh1BEvjlnnNkQVfALkXqQU
	V7ajt7qdly4OCn0OvMB04Mb8Tmp5JfeG8Qek5Q==
X-Google-Smtp-Source: AGHT+IFnRgAer2YqJDKDG8WSftGtJ1rR+zxfOuhlRqYyJ424rX57bTivAhXqIy4syKRnXc5Ylo86Kw==
X-Received: by 2002:a17:90b:2e0b:b0:309:f53c:b0a0 with SMTP id 98e67ed59e1d1-30a7c0c8b02mr5742205a91.24.1746546472392;
        Tue, 06 May 2025 08:47:52 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:47:51 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:31 +0800
Subject: [PATCH v9 01/14] drm/atomic-helper: Add crtc check before checking
 plane
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=1629;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=e+MxQIILmTfaUEYG8mRcW6giFJAkMzchKGmqQw3Zq2A=;
 b=zpOMrRtqL6iX2AnAGqg8NxcePk05uQNGAMoOqxpNJZAmmvq/T93PJYpj5MEkzyl0Fs18ufdNZ
 mXIzLx/KpGwAtrE8yNGE6pJr71Tx85cXy5Pz8Ck0WGp71qZ5JT8CS0t
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Some display controller support flexible CRTC and DMA, such as the display
controllers in snapdragon SoCs. CRTC can be implemented with several mixers
in parallel, and plane fetching can be implemented with several DMA under
umberala of a virtual drm plane.

The mixer number is decided per panel resolution and clock rate constrain
first, which happens in CRTC side. Then plane is split per mixer number
and configure DMA accordingly.

To support such forthcoming usage case, CRTC checking shall happen before
checking plane. Add the checking in the drm_atomic_helper_check_modeset().

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..5bca4c9683838c38574c8cb7c0bc9d57960314fe 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -816,6 +816,25 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			return ret;
 	}
 
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		const struct drm_crtc_helper_funcs *funcs;
+
+		funcs = crtc->helper_private;
+
+		if (!funcs || !funcs->atomic_check)
+			continue;
+
+		ret = funcs->atomic_check(crtc, state);
+		if (ret) {
+			drm_dbg_atomic(crtc->dev,
+				       "[CRTC:%d:%s] atomic driver check failed\n",
+				       crtc->base.id, crtc->name);
+			return ret;
+		}
+	}
+
+
+
 	ret = mode_valid(state);
 	if (ret)
 		return ret;

-- 
2.34.1


