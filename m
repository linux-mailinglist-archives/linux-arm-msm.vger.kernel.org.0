Return-Path: <linux-arm-msm+bounces-43956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA23A01E00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 04:07:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AFBC1636A7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 03:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B408150994;
	Mon,  6 Jan 2025 03:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FpAKCb5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBCC86335
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 03:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132873; cv=none; b=upN7IJman0bjkWc56pjfd807NRKA07ENFshrJ3LWOZ8WQ5y+tlP37byHWcO/5PREdt+7UZT9U+PKdJWOQjRMnae3QtcguTNEBc9tNmeG5Tka72U7tRJbk7FFDhtMNuncWqxyDyX9a4NQ5uISKSbmg3CO7B30g70p1w7g8GcGOf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132873; c=relaxed/simple;
	bh=JMIpMFmUuSjIWpzC5uW4TfFD57Bcj868StpQVqk4CIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mXxtZ5y4vlVl5vjt//q0pqK60fUgbmz5QCTVaGRGlSPAcT/iFk3/z/CXxPfm1po7bEYDT6PWq8ifAEnEvcOlWtNN7FcaB4lyHr/27e4Bge3z7vzyWNWO5Fc+Xj3SbzojLSWWGXdDPCrsSqE+JNkEwprowpnh+F/yzHFeouIf0A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FpAKCb5V; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54263b52b5aso3549839e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 19:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736132870; x=1736737670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZO2/JK1vJqeJvxJrlYDZUuiJ755Y2NffqKG//AhfG8=;
        b=FpAKCb5VRcwa3HGxBmRgGVPMe8M51/VgULb/I7XN6MaN5/QmOm2a/Ng8QSSB9jOkPr
         WDA5XTH6ySSO/6HF3HuK+xwXL3375ezocgkX8Cul9jMbHjQrAR6YlWXFPrLhivESoZEH
         uz+VTFRQFYVyAli9/SC/d6KjeqKgzAA0k/e8LznpVEZAVwULSAGxmVB00d3r8LXFNiXJ
         kGeYBqczLEb4G/u50NYJnNsRlBw2BR/6zwEW4MmJsXUB7oulII3Uln6vH6CsaCo6Z9C/
         9973CFi30ynutLcODwmhWKS6c9WqiLihnhzpCQgDHpAN/tKG5GFHnfSzB8ryNf1xJO1v
         5OJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736132870; x=1736737670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZO2/JK1vJqeJvxJrlYDZUuiJ755Y2NffqKG//AhfG8=;
        b=UExVsKnba68IdULauL5PfpR65bVtzsLakl1V7yPL/Lhg3/MmKezxUL07MkF3LW8PI7
         4v3c4pIBvp15U8Qp94j+GQqdiz3QJfVqOIUJhbU23ksjm/mtEt4V8C2uEpqu8BqWjDvL
         lTFeOOIBU/RN691GBqFKvPtZwE8vy0iCP1Tq++bD4lSuMVrJNNpk12eRQCiLIS9gMiAN
         z2JFGGWmN4xy2ALMnFe3Iv57X3URWwt+804zIsmiDh57bjeW2Bc4R8F5wTNlBfwzfoFk
         qTYaHoVVS2VOL24CtlCKVPCW4RaWtues75Q2BKiVvedDoec5BSF4NW2CB3eAA8u5qXBC
         +R/Q==
X-Gm-Message-State: AOJu0YxqiBwLxpWeODoW2Dxl7yOa4QXQuwGKexS6MTwXXuGbVkeP/h8X
	wOXNMYSQEnSxqaTUZcIbKKN9OIcTFjR/ZmEAzinEy3DTTDJojQufI+tE39iVr/8=
X-Gm-Gg: ASbGncsdkwx+dNMHTk3aZBzzjGK4EGdRsjLaC62WfoiS+NfrMD3YiiNRilO2tqTEHt4
	R215Vs4Ps6jjgqJiYEmNe+CUYP3z7Kh/Im0W9QxcDMI/kCXw1Xo2VybgiPBFRqGAoDUBJFz0o7F
	a5wSVE/mUEcOiB168XiO5QDgPZrx0TV5LhIQR5gfOnsG4KB5g41N10nSlHrueTt78NC/uA7IT7+
	FSbQS704hY61/PM8e38OTXafL8j9qejRLYZ1lUrQGBVq4sKMObeCyscQA8FlD1A
X-Google-Smtp-Source: AGHT+IGVNTbTo11ia3rI1vyhLprYs/ETfaR9ehq23gsHe9NwxJ01d9hxUtMjVjVfY/pmtpVerV1+Sw==
X-Received: by 2002:a05:6512:3e1e:b0:540:1d6c:f1bf with SMTP id 2adb3069b0e04-542295254a0mr16112607e87.11.1736132869972;
        Sun, 05 Jan 2025 19:07:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 19:07:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:38 +0200
Subject: [PATCH v4 4/9] drm/msm/dpu: make fix_core_ab_vote consistent with
 fix_core_ib_vote
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-4-00b248349476@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2302;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=JMIpMFmUuSjIWpzC5uW4TfFD57Bcj868StpQVqk4CIM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5yJtIKct8p9ZxKlcKTed0ff/2fXsxmYZkR
 cqjaLxugFmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1QJRB/91HLihkUTCkNJfedXqBJP7HeE1u9hlmhHKfhrQs34HNSx/8F3/rsHVSOHqMSkRKnvOGoG
 nLK6HfX8ZrPrRU7I3hD0nD4AGRkLsA9TjhY4xq3cG+icaLQAbt218LGaW7EyQmd/61/VkFY/Cu4
 iTEB7oMMawkw6Mh7PU6y0acf5owjOVOp4bRFJlm+sXdMwlevTKQIXHL62yYFA0HxfpivnfGuTai
 8Rs/rSfzKrHBJALsCt0IAS3jnkdtlnyfOVquR/lYPYiccngjOxzI5A2J5zWQW7Ww50csO1Y0qbq
 lrMwch96EW9kWy6TJ+aBv3oXAEz9az0/zppFJePMpF9NNuVF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The fix_core_ab_vote is an average bandwidth value, used for bandwidth
overrides in several cases. However there is an internal inconsistency:
fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is defined
in Bps.

Fix that by changing the type of the variable to u32 and using * 1000ULL
multiplier when setting up the dpu_core_perf_params::bw_ctl value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 7263ab63a692554cd51a7fd91bd6250330179240..7cabc8f26908cfd2dbbffebd7c70fc37d9159733 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -125,7 +125,7 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 		perf->max_per_pipe_ib = 0;
 		perf->core_clk_rate = 0;
 	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = core_perf->fix_core_ab_vote;
+		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
 		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
 		perf->core_clk_rate = core_perf->fix_core_clk_rate;
 	} else {
@@ -479,7 +479,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
 			&perf->fix_core_clk_rate);
 	debugfs_create_u32("fix_core_ib_vote", 0600, entry,
 			&perf->fix_core_ib_vote);
-	debugfs_create_u64("fix_core_ab_vote", 0600, entry,
+	debugfs_create_u32("fix_core_ab_vote", 0600, entry,
 			&perf->fix_core_ab_vote);
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index ca4595b4ec217697849af02446b23ed0857a0295..5e07119c14c6a9ed3413d0eaddbd93df5cc3f79d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -51,7 +51,7 @@ struct dpu_core_perf {
 	u32 enable_bw_release;
 	u64 fix_core_clk_rate;
 	u32 fix_core_ib_vote;
-	u64 fix_core_ab_vote;
+	u32 fix_core_ab_vote;
 };
 
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,

-- 
2.39.5


