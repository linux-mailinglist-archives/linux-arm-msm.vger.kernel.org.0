Return-Path: <linux-arm-msm+bounces-23980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 908A19150D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47033285ECD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5418B19FA70;
	Mon, 24 Jun 2024 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jKwLHCYG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681FF19FA95
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240440; cv=none; b=mXUTRAmq42kPP9/OspmK9g9F5rNSrgir4egrwctkplxXN5qlPgzFp+7xF+kIqkaVUj488BcilumIkICReTy8mXVfAceZJwTfHlQEQouNzCgIPcNU+EP9PyDwRbG/ePBJU5R0XSRvqgdbJ2xSbGPF/h82f1FfwyMP/R5BZW8acGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240440; c=relaxed/simple;
	bh=CZE5vDwajgZiWlqIb9olYzIUdaIeeSo/h+Ci8Lw3dmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmFHTrwWkQE4mXadfTITa5Z8xZgmGWUr0TGPgMXXrwV4W1Op36skWve+arWnCd22uj48ES7NEcvoiIwTYPZ49wuOdiD1BUEAVqctB228V4L0ir9dwgwH8/ulyV0i0iueqK90Nze3uFLEJfvKuXLp3Ew2Vp42th5QH6iT+NsA3ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jKwLHCYG; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5295e488248so5026208e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240436; x=1719845236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r3jPJKGj8OxSKPS5o2ejJIGV+0itdtJDT4TJvhzbiLM=;
        b=jKwLHCYGJ/UrHGcLiDI8EzImFoeM6wtKfX/GbFA3Vv6NaYWdHkFSzPuZYA0Wt8efGJ
         AXzBRb/4XH1DWwswyZ2sxaG9j//A04661ydA6MbhanK1FXtUnKyAfipHLZlaHmSVurt7
         IFJfXjw8Vgd6sNmg1r9zvtCZVxtcBAo2UOT7nYROgkvecl2uWqTaDMkWt8ZAGNlwd7cW
         cnmPzg/ea2AFatYOQHyo8IFjGet+fuJYSuTkAC5iW0g9hA3zCiUiQCUEgV1zTQ8xo3X8
         xCDcvLaieeLDcOltk2bc4ODedz9U3HVfzWuMggup8KvdO9ozUc3kzaRN7rPDSImJIiDr
         ZUgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240436; x=1719845236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3jPJKGj8OxSKPS5o2ejJIGV+0itdtJDT4TJvhzbiLM=;
        b=xOMSVUklWrJk/v+NvxFiHxAN2F4f1SSZni8aMCXhgUAwn8VxghiyyVgDrdYDk4vqGD
         c3kQaQAb9sdLIr4hEDCuC8j2X+CjGoB+m2jokD0WolFR6XK4ikRVMmuRRqP9INXVno4f
         YyyW646ECkiuC3012U+wnCyPTnV9bejEhET6tVU9cW52YQoNREfPs5KJsWigttB5IERP
         HknWeapyFZNEkDaZzFsxlWV+I1CtASj6IXHdubGxwYVghX1H5IwvrlEyQ2g7k4R1wAh0
         jBe3mESIkT8ToQzdlB1i7PnHRgRAe3v8wb30tjMBDR+2SHIwjXxt6gNCWC43M08E07fT
         82Ww==
X-Forwarded-Encrypted: i=1; AJvYcCVBnxgGdTJ516LB5cw+dxmGYYRjmjOgnr9zKcSVViaAx61jkp93ypoObvqkVudFrQa7dZt0uyQcj2NvPNm4POnQFrN+LDQqVo0TIZHFpQ==
X-Gm-Message-State: AOJu0YzCJL5UQCzqtHR6i38PjfPxEKX62vqcZ+gNLrtHGCvB06Gx9j9Y
	kGDP83FR2n0LYBol7/nKHP/O5BT7K3FJPhFc4rwlE0EJHh47jcJEqlWIaJAY11Y=
X-Google-Smtp-Source: AGHT+IG2rVpRnuC/or1aoJ3OgIsBYkfVlsZjqYs6+9vSqSRP0WPwAHekhHe2O4QoX9mTOt+dKai73w==
X-Received: by 2002:a19:911e:0:b0:52c:de9e:194 with SMTP id 2adb3069b0e04-52ce1835b48mr2505822e87.28.1719240436733;
        Mon, 24 Jun 2024 07:47:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:10 +0300
Subject: [PATCH v4 04/16] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-4-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbv8tPawkIlNzBU4WuRY5zvu7hLWv5V80J4r
 b43g5OLjhqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG7wAKCRCLPIo+Aiko
 1aLOB/9TRPnoQotfNBwvjifZD/Pvgrbrm8iQ5GUzJNnUHUiyeYJvB1iNjVIOcXqvtv4T/QeaNQP
 Khr5m8POepERwJDFEt/ZTbPdHsaQ7l7piTZ+F7MGFvG6m6zQ01ng/NqeD8UNDju1QLGhjD9GhVK
 qyiBtOiJEfrTP6tYmBLh9fsNE9Cb9Pr7mDZW9p4x/prlW05o11nxvQvxHt4gQlbiknlb6AA6ZNQ
 JrbbDfVV1K9Whyu9HS5tdnPh5DSq6/4nHP6l1lco2dGyiz3RKPmNnbWHr7uSQaZlAbkWeuRUbcR
 cMYfWBjBS6IQpYWumvOaiyRvRTpTXHJy7ig1882+S834duvo
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


