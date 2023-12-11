Return-Path: <linux-arm-msm+bounces-4229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 005CF80CEBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 15:54:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7420281B14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 14:54:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F17CB48CD6;
	Mon, 11 Dec 2023 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S9oUC3LS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A4B8C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 06:54:43 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c9ea37ac87so62335871fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 06:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702306482; x=1702911282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RgFTnt3qZJvfNWf3lL//IEKsENotxReRQKOq8qe68lI=;
        b=S9oUC3LSpvMoY1Ux9PpbHcNh+EwrWDXe9LXgWYfPFzmcD+Zp6x9mG3qfUddsDFAymN
         vORwJGrG5O6FwfWw2+zEbAGo6jGO+0+YjS3XoXBuePCVgicw9U8UfsivhMrFjVlaL6q1
         3saG82bFyqJ6HhsrqAFBv/fgNH4txEbpwDLoPhsOr/j0KzVLQtjEwmPoRaTedA6vDNAT
         22hsF/KbH+5qDljrre8I4klUg87OKgdOUr3xlhlF2OIkIO9C+Y8QzE90Wkrsa37Eq9B1
         /PlKAdKarIBaPtGPV0CWgjVuQw4vUJjJ0lbP7ns8rneI32lBCwkt0ctJv2Na2ahR/pmF
         QP7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702306482; x=1702911282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgFTnt3qZJvfNWf3lL//IEKsENotxReRQKOq8qe68lI=;
        b=JkAn7FfI+QltZ/1e/Pwy+tOvu6cmmmUziJGereOmZzUD1WU2KUhzbpnKt8QWA/CbzP
         mTxlmK+7gPjz4ve5hcv5L6MFnQyxnCW2MGkGfcsFWeoCs46yzN4jE85FqQlUIk4cU5z2
         pFfwSBwSi4oN8VIILRIdS7grTD2DDoVYfGAPoVMX5luLxD4YT8UXz1ewmdpNY2zNPzjB
         c9AYXkGTS3xPadkowhIPWUr+8/g3l35hSBzVhHzfhXqDBsNW/EGqdfnk9v+oK/hyTF13
         YL4Ezpn1N1f6B21TGhlXUNawEKYFm1gKkPA646HyTCpcySBySBZw0PKGyIX7Yn6Zbq+C
         2bcw==
X-Gm-Message-State: AOJu0Yymk9Zbr0IWkdfo6q3OgygTcviU6cHStRb0XIO1wUjRnHaHGEM7
	YRREAZ8vFVPmNdFKhoaXijss9w==
X-Google-Smtp-Source: AGHT+IGr8J6w01NY5cbDlOuF4emsiRJ9tq/klXFYiGXVOl3b/5MMkmAtpWW7+TzLdyUHXnRrH7RA7w==
X-Received: by 2002:a05:651c:990:b0:2cc:1ea9:2b9d with SMTP id b16-20020a05651c099000b002cc1ea92b9dmr1735596ljq.48.1702306481659;
        Mon, 11 Dec 2023 06:54:41 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id e5-20020a2e8ec5000000b002c9f1fdea4bsm1244272ljl.17.2023.12.11.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 06:54:41 -0800 (PST)
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
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: remove extra drm_encoder_cleanup from the error path
Date: Mon, 11 Dec 2023 17:54:40 +0300
Message-Id: <20231211145440.3647001-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drmm handler will perform drm_encoder_cleanup() for us. Moreover if
we call drm_encoder_cleanup() manually, the drmm_encoder_alloc_release()
will spawn warnings at drivers/gpu/drm/drm_encoder.c:214. Drop these
extra drm_encoder_cleanup() calls.

Fixes: cd42c56d9c0b ("drm/msm/dpu: use drmm-managed allocation for dpu_encoder_virt")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index dc24fe4bb3b0..d60edb93d4f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -586,7 +586,6 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
-			drm_encoder_cleanup(encoder);
 			return rc;
 		}
 	}
@@ -619,7 +618,6 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 	rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
 	if (rc) {
 		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
-		drm_encoder_cleanup(encoder);
 		return rc;
 	}
 
@@ -651,7 +649,6 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
 			n_formats);
 	if (rc) {
 		DPU_ERROR("dpu_writeback_init, rc = %d\n", rc);
-		drm_encoder_cleanup(encoder);
 		return rc;
 	}
 
-- 
2.39.2


