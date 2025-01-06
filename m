Return-Path: <linux-arm-msm+bounces-43954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E97A01DFF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 04:07:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0BFF1639AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 03:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD7A78F39;
	Mon,  6 Jan 2025 03:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qNDaQQn/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E92886336
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 03:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132869; cv=none; b=S7PpF2ZhYbKklKPDkdE/o4dV2xubOncR99ivs4KCXiROZxnPkrWLiDCbyFjikAbRBr3Hg57NxESZnoLTDxdPUUGT1UqzH5mfNNRze965wETfqcXbd3jKY5onj2xI/ppPTBXoOhVK0vlLaNIH4iCWW30MAV7ffB0h4YYyNtmYqyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132869; c=relaxed/simple;
	bh=e5UbVaT7LzeJrygH1gMv3eM7lgsU2vrSsGS5cybMORE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J1hfIc5jIdzhegUPFXoI7jQthLzD1LkLy7MGzgwwNtyMGeD7goih9d6ZCqkiZIuxm1ZGEb64tvLOy+cnH4sgSBhr73C7vtpx7U3gopGvBXNGNNvMuVu4jr3kRsBnYrXWat5w3kSgy8zIzW3fq/GzUE1pJamFsGyWewfjo1q/AuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qNDaQQn/; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso15092924e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 19:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736132865; x=1736737665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2frQ7frjJisKF4fY9Mlmay17Gex/iMexCWUihejiXI=;
        b=qNDaQQn/VJkOytNiq5FeZHgHwCbTZYHsNMatZr/xEKE34iSZYLDj9NyCOoJ0l3yjNE
         CPlQXx1lxWDyzKno0b3k6pQdf11rOmxJADdXW9lXGaE8jTWs3H2RbqWtNJgt4WblpDA1
         VkUf7vVJgUTbYQLkzEw3E4zrcfQ1L9z+0YtWXuqxXIKHRfRPnpc0ZnVSc8U1wmLjIUdz
         x0yEa8fcSFGNCwN0rr3PAIVBvTVHATp1oF9boSMVwGAWAfjZbxLX5KeXz0e0W1scydyz
         7XzVdWGhF0yKpA8QLhLdKtEwa3iV5Csknx4k+lX4oHvs8Rx5w62wq7WbwjJDR4aHpVtR
         hV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736132865; x=1736737665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2frQ7frjJisKF4fY9Mlmay17Gex/iMexCWUihejiXI=;
        b=clyhRZSAMLW9Yf/xStxRMoqQhZGwor2e2xzUlsp160X2NR1oVHMKPx+6AZnCu++8SS
         dBhC1Iq+Pih7zY2UxczXj0T2OmtTbE66dpqSYNL/Iuvsc0ZbhL5ScGHSGkTtGyxgbIzt
         gODFUvVAeJ64ObLBMs/y1VNKNx2UWqWF0rffBoJxanp4Hsxi2BdMgNr4F8kdIikWN5PI
         eFuiFpOU9eJBkE9MBpNWqLS37Q/3QnU07kCN0Tysh2OYI9EgGLSHGWAzKFnWoRAAisNO
         tNnA4ro48mtMpiJz9R7u9zQU1sTfpzAGQiM9OHcZ8XIMhURFlKIt8Sv2cRhSpaiAvtmQ
         xK3Q==
X-Gm-Message-State: AOJu0Yzzck/sEhntSKeCZr7/oSfIowQ6K/pTXBONZOg/eKuN7M1smL7M
	EeN0wW1dxteBOACh5n81qaan1+7D0bWo5Pk+bXuB2He9LD972HeX/J7cSK2CuBo=
X-Gm-Gg: ASbGncu2l7a70jlHBHFEh7WE5C117DqEMsuKULVqd2y5MAEn9MqlXBnICFX6VdaHSzw
	Bvxo6wi0jL5ritTZu1Y0Y4KYTB+72MXlJtfKiYCT0I8NtYcrBID8BNXETiPVB6GuFCwxF2GXmqs
	N47mwQabn7xLkadNWkDa55//udsuBW9YZZwTkqBWUiWWeTBl/r8i271kioBM+fHqaUy4WQWFYg7
	AI9GOHXnMF/4RalpAAEcaH1+A0qIwiAM/6PmAIJQGmkn2ZTShJnUHFTl8O6JfXn
X-Google-Smtp-Source: AGHT+IGoFsQl+dE5DLTgXkjBCinLyHxxWlry1wlU/1uPByNsy3ri1wr2sp6D9riVVoPCTLcSQPRJig==
X-Received: by 2002:a05:6512:1055:b0:53f:167e:390f with SMTP id 2adb3069b0e04-5422956bd7dmr17510177e87.53.1736132865280;
        Sun, 05 Jan 2025 19:07:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 19:07:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:36 +0200
Subject: [PATCH v4 2/9] drm/msm/dpu: remove duplicate code calculating sum
 of bandwidths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-2-00b248349476@linaro.org>
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
In-Reply-To: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4681;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=e5UbVaT7LzeJrygH1gMv3eM7lgsU2vrSsGS5cybMORE=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3q1x4/tO/YoBR99nD9lue3PU76Sf5M3JCip6nVdz2VpT
 LvNy1fayWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJ9D9l/ytTuOb11BL3f8uY
 ArvuJyi3NmzfasejxH5yK8e8C9rPppu5LukUe81mW/U9WWvawQk3lD5vN0g3fBdefa1Pdm7bUi0
 B0+oJsbphRxp2VeWxcFTfUJG2DDps/n7TkXTJvd26Ust+hKo9zFpVXfpt4hWBPWJ9bjxxwVW2D2
 4kVabd6G+WWFagc36qQsT5A1dDquR/hLFuDWC7/6WaxdRxQfrXDf+4PgSfVz3C1ODzVztiRdgPr
 obYrO3H2vIYZvK6++1UiNO+L7FW1f0zd0Z/qHLTlNuyH3pWLKnilLLcuemo9aPj1+4Inzhb8TY8
 bF9h25kao3o2rsCehdo2Rb/fCDR5WXKekLT8euvZN/lvAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The code in dpu_core_perf_crtc_check() mostly duplicates code in
dpu_core_perf_aggregate(). Remove the duplication by reusing the latter
function.

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


