Return-Path: <linux-arm-msm+bounces-2958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC9880151C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B07DD281C4D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:19:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2023B59B41;
	Fri,  1 Dec 2023 21:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="huxPgIYA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CCE110DA
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:18:58 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c9ee6fed3eso904271fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701465537; x=1702070337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8A2Dx7VYhQ6DejQmgmtOb7Y7Nu7+NFqerEdDyz1CvrU=;
        b=huxPgIYANgnBD03EGmWlArB3eN6IRsZ8+w4re7bSWkSZoTSSqm8CkA6uQz673FKJKI
         brUJ1KgI8BOYz4gbFQSK25Eos0EoicY7/0s0EZs753kX9qkRxVaTmUx/+vQzfYqXbFIb
         3YIj45NbS81RPyp003BCQULIFFWnQDcBH5WQq7A8tZpnk63Hn+v3/lZ4HJZTKVizufir
         aQjjYDEspsuqcQ1gHRDxMpl64ahzEa4BylUyceCrU+5n2QM+CjXjM7m6Sp6g0PAp8WTc
         FOfcnJIT2Rvii/ZGc+mz5GeiHSrMNJqbGkhfOxNt8CNG7OeTLKVrt+d1rs5UQ41ZxkyT
         dIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701465537; x=1702070337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8A2Dx7VYhQ6DejQmgmtOb7Y7Nu7+NFqerEdDyz1CvrU=;
        b=VquHSX7TLbQqLz3eqk169J28msZXOUX6i0/FAu/5i+DgnQRIAhCAAqOgby+Zn7gXuu
         mD/UOu7OaOFTyE8u4c3ABAOylG5g+bqvG769wlSkcMlcdVh7fw42kOzXWoz6Luktr0Qr
         4pUsdSC3dwc4of0x5XnO40pKhI/rxX9Ug5H0U8N1ZGQCCPU/fbiEqLq6i4bioQ9g3p26
         bRrPrAxZdiuA3GL60udZKFvvK5vMoMZLZNEHHt6U3O7Rw1UzsT/oeyv/oieX3eHzBweI
         cnd25nMO8VtmLn04l6pybOg/WM+MSNTsuaSPBF+oXYaGuvmHJCbMfPZ9fBAnTXVrKjGn
         vXRQ==
X-Gm-Message-State: AOJu0Yx6xTYhkl2pQyrQWiLzLqHV7M5eDLmD8Jm6Xq3QbMMKfrE0aymY
	GElZXqIjZLTtQs7NchSsw9b5dQ==
X-Google-Smtp-Source: AGHT+IHX6Mb2s7pu/elJO/1eGQuHMRBR48UE4DjUSn4X4bgn/+S7y3OUSxPcInJMWLtVJ/n78TIC4w==
X-Received: by 2002:a2e:9f43:0:b0:2c8:8813:2e6e with SMTP id v3-20020a2e9f43000000b002c888132e6emr1378152ljk.11.1701465536941;
        Fri, 01 Dec 2023 13:18:56 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 13:18:55 -0800 (PST)
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
Subject: [PATCH v4 08/13] drm/msm/dpu: remove QoS teardown on plane destruction
Date: Sat,  2 Dec 2023 00:18:40 +0300
Message-Id: <20231201211845.1026967-9-dmitry.baryshkov@linaro.org>
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

There is little point in disabling QoS on plane destruction: it happens
during DPU device destruction process, after which there will be no
running planes.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 20908f3d8f81..ab9f93f15536 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1214,17 +1214,10 @@ static void dpu_plane_atomic_update(struct drm_plane *plane,
 static void dpu_plane_destroy(struct drm_plane *plane)
 {
 	struct dpu_plane *pdpu = plane ? to_dpu_plane(plane) : NULL;
-	struct dpu_plane_state *pstate;
 
 	DPU_DEBUG_PLANE(pdpu, "\n");
 
 	if (pdpu) {
-		pstate = to_dpu_plane_state(plane->state);
-		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe, false);
-
-		if (pstate->r_pipe.sspp)
-			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
-
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
-- 
2.39.2


