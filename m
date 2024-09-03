Return-Path: <linux-arm-msm+bounces-30441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4B79691E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 530A01C22BD7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15051CDFB3;
	Tue,  3 Sep 2024 03:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dp3LjM9U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6581CDFC8
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333780; cv=none; b=ZuyDF3IDuKIMvsSOZLc0Jc2WUerg5NaN7RhVerGtLWnFUa3i1J00KHP0JHmKnY6mMmv//DI2GOrg1oJqL1f5mK07zLxm/+RJW/K/kAdHQ2AS9rGxC5bPI+LhnVS7RIUmgozFzNp5sv5Avf0J4oIYY0YzCdR6mc1J8nh1/2xE6rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333780; c=relaxed/simple;
	bh=pmjRO8yJThNX7l3z3gVUhe1TCXTyBOLqoZGUg4MJPFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aBTBEorA8llFwxO1esjpo3CQQS5U8mQ4l9c1SbC8HVtt+3W4nBdD+YS0PaEtyL1d4mWc6t1+actsq3+vXAV38Gjsuv10W3x2De/+1dw77TqT8feqh2e0ioXXi0ssiuBlRptlOHVJ08Ju/6dixNi1iTchFYG2SnR0qa3JWEd0c7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dp3LjM9U; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3f07ac2dcso53528341fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333777; x=1725938577; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FEeo10BRWPxe0eGwbZzKhWDPMOBcNt8ddVJ+z2RIuvo=;
        b=Dp3LjM9UOjIUkv/8kkXGXhGStidvvWRemE4BaXDLO+hOPhO96Fl+BNly3STPDgs2sQ
         dgp3JiXLfg2kaDOYtOGslq2acwO73vE2ErlNSpFzZ2ZsloyjyzXPx93uQ1Dc+cH1s9OO
         UXpGsbFttr4PepUQkTvsv/yOZDyYjpJijrVqycY62HJVoZWsus0/i74t7P41xwNS4tsJ
         1cQlGSC4w3ZO6wB5ZMu8V3IjUukTvWHv4Yris1v8o+92GfgR4geGvA5O6AwP67sbepL8
         AAP8J1rTVh1bo853zC1s7qTgE/uJQv6dWSwhggLbCVQpPBq36a9AkBN3gqY9Mv5wL+xn
         wLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333777; x=1725938577;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEeo10BRWPxe0eGwbZzKhWDPMOBcNt8ddVJ+z2RIuvo=;
        b=cWUXxAfShAeE07mBnNB4M6TUrmEwyEo5Mf8/KoRRenfURpqDvpeBtlnkI5Gal/BwuH
         jnDMndEbHsWl1mUZk8JsNiQnbYwjfNl4ptfx3/Bc/Fbi4LWi6jzDs09rLOTkONENAjN9
         4mis2TLAu5dI/nWcBiBVW+iQC5M2y3zYuK0e1LL0YtV2298QGmPxE3DDaB7dlhkDjC1/
         RnzdJb/djpW8eS8lw+A03TamgaTp5LxCnwCz1z1sSwpq21aRThEff/2yIOtwb5Jx7W5R
         Stn9DWPO1wCvGtN0n5n1mY4ToWQYvDTLXN6EdyvYzkZ2InXi+gkuIRupNR+5uJi3c3Qc
         800w==
X-Forwarded-Encrypted: i=1; AJvYcCW/ZVx2uLVsZBOTq735LXJYOi8RVAvzPecj8O90V52F8mhDlhl961eSYnjOCFrrbdrMRVOfSn3JJX/p5Mgz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+a5eZyreMwYA7/VIcOSPQuaJspR01QWFSdkMkX9Xmpxq+BpEr
	bznI0O229l2ZwmEImU5Kq2aw5LFzpqU+XcPRRCcm2lC/4A9AP9nh/sQ5B4ZHA2Q=
X-Google-Smtp-Source: AGHT+IGXj0Ycp6Qxb6XPj05g2bVPLU/ugFin4/hG5m/GbsQNUGZJ3yr87dUxf+keCpynMg8xGFEw3Q==
X-Received: by 2002:a05:651c:211f:b0:2ef:2016:2637 with SMTP id 38308e7fff4ca-2f610220cccmr116756151fa.0.1725333775771;
        Mon, 02 Sep 2024 20:22:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:22:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:46 +0300
Subject: [PATCH v6 03/15] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-3-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pmjRO8yJThNX7l3z3gVUhe1TCXTyBOLqoZGUg4MJPFA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oELev1LF4GTrHwQWUvET4afCIWSGRpfCbEmI
 cTdtY7Dt8qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCwAKCRCLPIo+Aiko
 1dmrB/9PgPcJPUTqwgXdNCCuBaC4ZqEIQTyeXB0DyaSSP1DtibF19sOhD1AUfIXeYBLqT+ScxRn
 togfAlcziaBjNbHFbhzmoB3AHNohSvaU6OX9UNrKe56JGc8V6sx9cfiGxyX6zspd7qQcDuP9Jgr
 R7ubXFT4m/apLrrxNT7go6sI4XSzT0L7iVNcMiAxuQmuZUsz1XaB9W9o3x0N0aRL6F5/FVQ3D6s
 yI1tfTVOuqCMo0o5cDuAtnbqQkIcDp2CHfg7L60Ug4JJACLHix2FzvTMTt02Zbp2DjDSbfFwa0Y
 J6NBC9Sdj9y7/rwaXxm36F/Gicj3q5q9RIoRhCtsXv9tVc6C
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
index e81feb0d67f3..db6c57900781 100644
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
@@ -1189,8 +1195,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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


