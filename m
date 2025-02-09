Return-Path: <linux-arm-msm+bounces-47265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BFAA2DA7D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 04:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3470A165C1E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 03:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1756FB0;
	Sun,  9 Feb 2025 03:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ceTvnYlL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E053FEED8
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 03:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071292; cv=none; b=HpqVZzQIO56XotyFWkVw2RSQh3+3U2ZLqcC9XjRJNcSb/O2SsiBRAr3ZhkWoZ3g8c53X2WmlNPebpYJPnOdmNysfUNoDAboWqLzO2dNuIgZvclAG/SpIznG/kTBD2oEekvqoyZ22oA79PlKHxDnVbkHKTll4p8xvc6qTrRVufGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071292; c=relaxed/simple;
	bh=VkKt7DJwj8H2cF9BwqW7u1ROLqNk4NBL0guvyk9GsSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ooGxAbquAYg8m4ko51WNvq8EC8ZnT2Oghye9+Mxcfw9YF/vqPdUIdDVAftdxVMni1dejOTvqCy8WiaHaFAEqpgluNXVAVLpAfcU27yFJf7FejoMBChuymR4nPuSK+8nhwa9xNT4RK6P6BKu1X7zL81uFx4GlT/QCuRpY+1dcvLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ceTvnYlL; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54509f46614so156760e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Feb 2025 19:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739071289; x=1739676089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L6wwW0QFPdtORCKU8NZ1/0ghy/8xuSyLBH+dFHVgBk4=;
        b=ceTvnYlLggsF58h3y5Yb0e7YPqMObNLoyHVLD4WqZX0zzV25183z27G26QG12+EzmO
         uARf5vvzHxMyrbtfJlV34xGGgWypa5leEZcI/zFJS8zNM8CR192VhXnLj7DgUjU5hKd7
         nWY3lcn/dRhUE1r2nUdphY0a7gg+detCzEMPlH4gRUUgSFPLXKVtIy1IrphUyfyRzbgL
         5J7+wmu60UmIPDCSdQm5JVAEkwhyG3C+T5DXBNahFABzmoGFpwcqtQPmsXmWhejsup7p
         XlihnK2vruVuMrCBdHeImbhOOB+OK2RR5SLsFYm0JO2wCb6GIFNB7bU/0x9qF3r0Cexm
         1aYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739071289; x=1739676089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6wwW0QFPdtORCKU8NZ1/0ghy/8xuSyLBH+dFHVgBk4=;
        b=nM9K60zzjTf6CyQklccoj7LI76ZLl/r9/IYbuhEwonTlGo01qzCsfjyWymYV6ARC3n
         zaQR6vYpmqxW9AGUqf0TJ+SnTxX0rb9DYzN0Bg8IinuXAah5zKIV9RO5K0HDp+Rg6Wcn
         d31iGgsSmFUh8Q9TTPqmVIDuRO6mzYRZ/2wBSSOCzYV0crEePV4l5dyTixT+PrhQxx50
         tWeBm1OCdz1wuZlwIRl3F8uESYLVF7dD5XfdvE815tZoJq4FeoL8o55DyJ045SqrfgW4
         FR5CAxZ1VDDvLVdl7W9DcWU5a2Rqik/MnQnAW6z84lKmH2qC1PWkj+dc0hn14cw3hKI3
         IhNg==
X-Gm-Message-State: AOJu0YwPnKW3fvDgW3ocFsxCOdqXtWJ+1KGndZ366MbAToKkEgoFGBxO
	rB4cbBJO1qWVhQEaA5eIebvWbFMStJh38wOCQbvUOUMqd6G9Rr3FrHz9enRFM9U=
X-Gm-Gg: ASbGncs7sEhoZEV3+NpfeOWjU8wsGISe0cC/36mqLn/rYh3bgYGv7Ou/udkrdRohV0H
	m51t5XdjO8kovnJO7Udp0prkckGVmm4wga8RaOL3kqMzP1vlyhk3bHPUqhiRnMwHiiLpsqIRPnT
	jHbqtjwV5zOPIQ1CG7n/9X5DzL/1KAgM8A7/HKwjAwb1h21hAOpu40JE2RsUUybC4bxK6EMEOww
	pmXbJ2Gl5/umq9Huf8pgj8mQVlBAfbOOQcsXJ6d5F8AKZYMPWu9NL8Msr40/Nnr4+o8RPg+PlVp
	GA3nWl+8btkyMAhmXZWNR20=
X-Google-Smtp-Source: AGHT+IHXUbH/9yqUmGnp3k36rb6gFBh+eJdHg9jUhlwppiog1OyIRRhSRdeufKtsyeV4etFm6mPnPg==
X-Received: by 2002:a05:6512:3051:b0:545:54b:6a0e with SMTP id 2adb3069b0e04-545054b6b1emr1242776e87.48.1739071288890;
        Sat, 08 Feb 2025 19:21:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54505e41c63sm279711e87.148.2025.02.08.19.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 19:21:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 05:21:12 +0200
Subject: [PATCH v5 2/8] drm/msm/dpu: remove duplicate code calculating sum
 of bandwidths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-dpu-perf-rework-v5-2-87e936cf3004@linaro.org>
References: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
In-Reply-To: <20250209-dpu-perf-rework-v5-0-87e936cf3004@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4737;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VkKt7DJwj8H2cF9BwqW7u1ROLqNk4NBL0guvyk9GsSU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqB8wh6HJKbyu78/IMI06YCXqau9Jwg6s8jEuH
 rR2Fc6F4SyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6gfMAAKCRCLPIo+Aiko
 1TPcB/49BWLC7cQRm6HFzEGFU4HgjYm8aRd57tVqmsvestZ0rfSc6ldlE3TwOrteRyekalsf+8D
 ikGK1Cipbxh7Weo3N7TfuM/rtgRCX7NJIhRUlCzqY22seU2u+qYxrm0jDlVhdSv7Tp4N3MJphJx
 o59XVnEiETSkzTcsPUzwuuyBviEWrvr6/r7BPS4da0hrYbgdK8Y1upkZAX+bZAvdSZ/gwlbNjru
 M5GgsRBk6h2X7jZDmy0SSakAePkWwP/209i8iEUmtrkY8RyMljEJZQG1BD8SuErUbNYytCAh93D
 +iUPWQq2L+PkcYRr2V7OdK4pLabe2j86biKfc+KfcW1T3L56
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The code in dpu_core_perf_crtc_check() mostly duplicates code in
dpu_core_perf_aggregate(). Remove the duplication by reusing the latter
function.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 94 +++++++++++----------------
 1 file changed, 38 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index c7ac1140e79dbf48566a89fa4d70f6bec69d1d81..f0d490afb53be2f4bc706af91da05bb893a5fe34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -140,6 +140,30 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 			perf->max_per_pipe_ib, perf->bw_ctl);
 }
 
+static void dpu_core_perf_aggregate(struct drm_device *ddev,
+				    enum dpu_crtc_client_type curr_client_type,
+				    struct dpu_core_perf_params *perf)
+{
+	struct dpu_crtc_state *dpu_cstate;
+	struct drm_crtc *tmp_crtc;
+
+	drm_for_each_crtc(tmp_crtc, ddev) {
+		if (tmp_crtc->enabled &&
+		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
+			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
+
+			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
+						    dpu_cstate->new_perf.max_per_pipe_ib);
+
+			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
+
+			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
+					 tmp_crtc->base.id,
+					 dpu_cstate->new_perf.bw_ctl);
+		}
+	}
+}
+
 /**
  * dpu_core_perf_crtc_check - validate performance of the given crtc state
  * @crtc: Pointer to crtc
@@ -150,11 +174,9 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		struct drm_crtc_state *state)
 {
 	u32 bw, threshold;
-	u64 bw_sum_of_intfs = 0;
-	enum dpu_crtc_client_type curr_client_type;
 	struct dpu_crtc_state *dpu_cstate;
-	struct drm_crtc *tmp_crtc;
 	struct dpu_kms *kms;
+	struct dpu_core_perf_params perf;
 
 	if (!crtc || !state) {
 		DPU_ERROR("invalid crtc\n");
@@ -172,68 +194,28 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 	/* obtain new values */
 	_dpu_core_perf_calc_crtc(&kms->perf, crtc, state, &dpu_cstate->new_perf);
 
-	bw_sum_of_intfs = dpu_cstate->new_perf.bw_ctl;
-	curr_client_type = dpu_crtc_get_client_type(crtc);
-
-	drm_for_each_crtc(tmp_crtc, crtc->dev) {
-		if (tmp_crtc->enabled &&
-		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
-		    tmp_crtc != crtc) {
-			struct dpu_crtc_state *tmp_cstate =
-				to_dpu_crtc_state(tmp_crtc->state);
-
-			DRM_DEBUG_ATOMIC("crtc:%d bw:%llu ctrl:%d\n",
-					 tmp_crtc->base.id, tmp_cstate->new_perf.bw_ctl,
-					 tmp_cstate->bw_control);
-
-			bw_sum_of_intfs += tmp_cstate->new_perf.bw_ctl;
-		}
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
 
-		/* convert bandwidth to kb */
-		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
-		DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
+	/* convert bandwidth to kb */
+	bw = DIV_ROUND_UP_ULL(perf.bw_ctl, 1000);
+	DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
 
-		threshold = kms->perf.perf_cfg->max_bw_high;
+	threshold = kms->perf.perf_cfg->max_bw_high;
 
-		DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
+	DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
 
-		if (!threshold) {
-			DPU_ERROR("no bandwidth limits specified\n");
-			return -E2BIG;
-		} else if (bw > threshold) {
-			DPU_ERROR("exceeds bandwidth: %ukb > %ukb\n", bw,
-					threshold);
-			return -E2BIG;
-		}
+	if (!threshold) {
+		DPU_ERROR("no bandwidth limits specified\n");
+		return -E2BIG;
+	} else if (bw > threshold) {
+		DPU_ERROR("exceeds bandwidth: %ukb > %ukb\n", bw,
+				threshold);
+		return -E2BIG;
 	}
 
 	return 0;
 }
 
-static void dpu_core_perf_aggregate(struct drm_device *ddev,
-				    enum dpu_crtc_client_type curr_client_type,
-				    struct dpu_core_perf_params *perf)
-{
-	struct dpu_crtc_state *dpu_cstate;
-	struct drm_crtc *tmp_crtc;
-
-	drm_for_each_crtc(tmp_crtc, ddev) {
-		if (tmp_crtc->enabled &&
-		    curr_client_type == dpu_crtc_get_client_type(tmp_crtc)) {
-			dpu_cstate = to_dpu_crtc_state(tmp_crtc->state);
-
-			perf->max_per_pipe_ib = max(perf->max_per_pipe_ib,
-						    dpu_cstate->new_perf.max_per_pipe_ib);
-
-			perf->bw_ctl += dpu_cstate->new_perf.bw_ctl;
-
-			DRM_DEBUG_ATOMIC("crtc=%d bw=%llu\n",
-					 tmp_crtc->base.id,
-					 dpu_cstate->new_perf.bw_ctl);
-		}
-	}
-}
-
 static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 					  struct drm_crtc *crtc)
 {

-- 
2.39.5


