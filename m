Return-Path: <linux-arm-msm+bounces-24031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BC4915885
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3101A1F24682
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1ED819AD93;
	Mon, 24 Jun 2024 21:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FURpijLj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1361A08C8
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263632; cv=none; b=tPQM8BxZgdh770gyvvNtt/3/qn4hFd4QVId3+qc9olTaI9EGtGf/McCleZf7ZeLWKl4NhLmibrdeJdsHPWM1Cl2GjyBje+BMvDX6T3mcJpa6JKyic2LP4XB20hrJN+O8bxZpFrKjbCfWRfoNMRSByd+f8e9mzAAvyHncNX+Eayk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263632; c=relaxed/simple;
	bh=CZE5vDwajgZiWlqIb9olYzIUdaIeeSo/h+Ci8Lw3dmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KEyTQRdC3z1MAy1qso2doSN1p2HMiJC22ZG3uMheed9WzGJOCQlHPIsR/ZR6eiA894O/aBkgJwCrrqq2vUAsv0gIHNL+vdxEasyCBZb08f6nfNfU4kSuweCMBWvHlFdJiUlkOrtGt07IRCt0AmnT/J0d2z67cMm45n2KkOwYUSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FURpijLj; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52cdcd26d61so2902065e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263629; x=1719868429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3jPJKGj8OxSKPS5o2ejJIGV+0itdtJDT4TJvhzbiLM=;
        b=FURpijLjrMinMCYbbrzoszDDl9xKzBkeb4JxIAY9d3CT/4864l3yKl8lgQ5VC8GLni
         Jna4E/gRRKb+3CwLN7P03TsxFIphobgwlyDemrxUue64Soq/iWU7M2KxFr0fLNpmeeVp
         rFK1WHcYmKoaRdMvnjszdLl0I7i7LqRsRapPlO9zkFlCPxgRKqCPuhp2ewGmiG/NOA7a
         hJK7Cw7zmtbik53FE6tI1FSbyqeocrKM7FBSIUWVDhxYxNqG4AevCW6PNUM1hWW6+pnU
         LMPVdWFxO/uMc5Zi8FfOwysoGy5iHXSk/PO4eJCy8NBv5hvEEzuUTVywdtMzW+L/G44D
         MKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263629; x=1719868429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3jPJKGj8OxSKPS5o2ejJIGV+0itdtJDT4TJvhzbiLM=;
        b=YBb7clAAQhE0liLquDurqH2YowoyXR6SWsiGK3zyMobKqFXzwWwIZbU4FKIKDohE0T
         m66kSb/0MsIW+XU0kpKQO2pyYKmT137iRNLgeLcUmfh2MmWA7AAsF6UuvKzHb93+CfFo
         DNglAqfy3PMJdAX1OkJZiKRhaY0I7UIjWjWvHg+8yQt3OqMMQJ8ZJIABGxOtUdzuWjGO
         pBtjFxI9PyT6M8jFZ5u0oVT3KZZyw6aoVTAa9kac+YONfNptsCwPcHHo5WwQ/gxyr8C9
         ehtLteJpx4BwpJlSBjuFAPfl3Vs2uMtlsR7cpngzW3GBURZDLxPC7nxRFxXIcqIlIzvN
         rGHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAha1Cn32Luq1cEDgNF3cpKsmgVuvFjt9BB0G5JtcX5LKuFKaYT6Ty8BorFAlwSti3TO9jhOVl8uGyAegqPYTe6Mb4hFvPq749SoghOw==
X-Gm-Message-State: AOJu0YwTQ266rLQsesIMKWOVRd1hu1CBd9I1NurPIb9wDN/i13Jj/GCh
	HHalL9u9aymqgWQ/N6AnkwJxF6okMwp/twqV6xh2OJyJif673z86GJcSo57hZB4=
X-Google-Smtp-Source: AGHT+IE2ksgrDvI2ZK/rqxLb1NZpwPHMzcv2tHAiT2lYswFBq8Xa1yemNgrnfbOYnplhOqbCASj/SQ==
X-Received: by 2002:ac2:58fa:0:b0:52c:d7d1:7398 with SMTP id 2adb3069b0e04-52ce1834ef3mr2796862e87.28.1719263629196;
        Mon, 24 Jun 2024 14:13:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:44 +0300
Subject: [PATCH v5 04/16] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-4-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CZE5vDwajgZiWlqIb9olYzIUdaIeeSo/h+Ci8Lw3dmw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGHau3jG+LHhLUbXqLeJ1OV9spwALOWi1bbP
 +1TF85YuxyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhhwAKCRCLPIo+Aiko
 1QWRCACbAk5hQzAEAVWL5uiUIL3qm2Adjsb+y+gWBdCiFk+W4IpeMiY/PzZ7ydcGwVV+z0pZb+J
 Png8NJ74FzJygTc3VAzZebSU+TgIFDJMUt3wGtzWxudsmHvICA3xbIZyMFkLucCMODBXzsQKkA1
 DkitOcOwm6y/wMxtebhTr4Z3ihVpJjcJx+oLepapyz7IhqyketyHShfRggOKW7ecCs9yn4RgL5i
 mNdnJUesMHklqHlIzJz1ILbSYrJye0jTZZ0RWW6iQeBduOh2wcrwxPV2srQOl6lCjMt7/aztwzH
 ettdNEtUkVD7CjoAF6OAKN3YU6KjbmkINCpVOj0mtqazZ2TL
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Make _dpu_crtc_setup_lm_bounds() check that CRTC width is not
overflowing LM requirements. Rename the function accordingly.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7399794d75eb..2a87dd7188b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
 	_dpu_crtc_complete_flip(crtc);
 }
 
-static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
+static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
 	struct drm_display_mode *adj_mode = &state->adjusted_mode;
 	u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
+	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	int i;
 
 	for (i = 0; i < cstate->num_mixers; i++) {
@@ -727,7 +728,12 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
 		r->y2 = adj_mode->vdisplay;
 
 		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
+
+		if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
+			return -E2BIG;
 	}
+
+	return 0;
 }
 
 static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
@@ -803,7 +809,7 @@ static void dpu_crtc_atomic_begin(struct drm_crtc *crtc,
 
 	DRM_DEBUG_ATOMIC("crtc%d\n", crtc->base.id);
 
-	_dpu_crtc_setup_lm_bounds(crtc, crtc->state);
+	_dpu_crtc_check_and_setup_lm_bounds(crtc, crtc->state);
 
 	/* encoder will trigger pending mask now */
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
@@ -1194,8 +1200,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	if (crtc_state->active_changed)
 		crtc_state->mode_changed = true;
 
-	if (cstate->num_mixers)
-		_dpu_crtc_setup_lm_bounds(crtc, crtc_state);
+	if (cstate->num_mixers) {
+		rc = _dpu_crtc_check_and_setup_lm_bounds(crtc, crtc_state);
+		if (rc)
+			return rc;
+	}
 
 	/* FIXME: move this to dpu_plane_atomic_check? */
 	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {

-- 
2.39.2


