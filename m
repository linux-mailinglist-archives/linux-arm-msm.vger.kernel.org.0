Return-Path: <linux-arm-msm+bounces-43959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 298B5A01E05
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 04:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E5F97A1C9D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 03:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA7E778F39;
	Mon,  6 Jan 2025 03:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="odwJDV9Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33301547E9
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 03:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736132879; cv=none; b=bFTrRD+rCI1K4OGbm+MkzTDypqf5sZxBKvO8MKNQu9XWLSceTfZFRLskmQ31VnATUrWNL3A6ooY7Rh8oFS8QN9ytn1sjYQCVIJnhvRojXdYwVikHsU0VBqY6l1QqQyjcRB9ekk5B5AnhA+ht6PiP1Qyl1GsJ/T0lYzT55zETQDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736132879; c=relaxed/simple;
	bh=pAykJVSPbhOX5dwvl8G/jrVUqtiroa+GlHDm/8cLuCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZiTp74WJjRzYAfyHIzKtT1/Q9c6ZjX6Pezu/lbUfUBL+MKukaSK7swYdt62sw+WtU0906CsNSkb+1gM9JBeCtEzqcci6n4FEbWnvQJHPPMlZhG06WqMlGDwM2WoGJ+FcWokm7oaej9nv5CCwu5SSx59q8WRVfG4jgFbDR3A/VnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=odwJDV9Z; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so14111699e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jan 2025 19:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736132876; x=1736737676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUBRF+7dphUIBvaHeuE5P4CwKEJFwHHGIe7GdZDUN/4=;
        b=odwJDV9ZJnjGypfSKpTAN4JTC1YLwuTO0V9n62xS5BNCQ1Mp8QGzRM4VVxhM2XJTYp
         /zmCgw/INOXAYHccuSQ8GTcVcaOjq71gXQhzjNo6vE1XDWberezom6D+bjkhaZLzDVJC
         ct7U0NILtWl7aSrKoina8YQJS3OyHK3Rh/XSKqcXrqT5FxDAcRi3vRg10dwFG6+yde7D
         ATBBHz85/oQTSV9zxsM55dvx8amIHy2AjiGud0DJDXUmm8+dN1dGLc1cDKGrcOriAQaL
         0xJfRN+TuKlPPeT0E8VvinunI/2/sBdLZQmHyDLaZUrIdsK+1ZYv6O/BOSVv1ZzkEQks
         3W3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736132876; x=1736737676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUBRF+7dphUIBvaHeuE5P4CwKEJFwHHGIe7GdZDUN/4=;
        b=Xo0XrN72h9YLcOTjgEzDu3aKV7oWaMW/KVu52ysy3WQqvsqHUp9eGh2xmKGXvHeaFM
         WOuZLZFhyYdbesowY8q78zX/2OVHPHH/DBXf0IKWosogYALPXxPnl3G8Zaq4RbJiRlbM
         yEOZGYkbczItPBQk5SKMm46JzmR6mXXO0bW3wAvKqP7/TATlmj8YP4zp0IOZUkwvZFLC
         tKUffrRVmArYZMg3moV5IRekepiwAEkQDtvTlwq0l2kIwj3M++rCjoJIFwTMAozswoy9
         8Ar1PLfjMNdlB7vmgoRFNSk+hJe2dDgHY6Pe286GOGvz3ur2+ZDW8PoSscgTvRyHmeno
         3R8w==
X-Gm-Message-State: AOJu0YwyT1uEaJMmmz9cUQ9abIKDdMRW9cO4JfacyB0/h1A+EdLTtweC
	7JkrBJG6CY91bxKFkJoZIYH0yLofukYYzVutrIGQeAIifDLCgxPKxl7rdkhNQqU=
X-Gm-Gg: ASbGncu6n8mZtsYwunzcEf/ECuR67VBPlQsjWqsGFymWDk0OD2z46KTd/nrf7VbWPib
	3Qb7x4nEUsGNe6lFma2r6nmV4TAt1UCYiJJgm6ugs0Rvc4Jmc5GaijlozAWRDLQGQoMWsF07yh/
	ay41Xeb57YRR1rvV3qAB3ItmfFVgqrxBhsmbx60LXpikGjMQrUQKy741rFnc21/RfdUK6atCq7E
	vBpbDDBLp7IKSGMdu7ruNE7HXjUnuWbAlgT9kKdcOMMkHQmzLHR8jmrOfa386An
X-Google-Smtp-Source: AGHT+IHK7ZCjCmaBz957EJ1YPzDsKQb5wVe2PN7c1gzn1PSJw+qSdoYIjT1J5sq1xrC+jKC144tETQ==
X-Received: by 2002:a05:6512:3f1a:b0:53e:350a:7298 with SMTP id 2adb3069b0e04-5422953ad7amr14156586e87.25.1736132876085;
        Sun, 05 Jan 2025 19:07:56 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301efsm4869016e87.247.2025.01.05.19.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 19:07:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 06 Jan 2025 05:07:41 +0200
Subject: [PATCH v4 7/9] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-dpu-perf-rework-v4-7-00b248349476@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3204;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pAykJVSPbhOX5dwvl8G/jrVUqtiroa+GlHDm/8cLuCk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBne0j5g8KcjDuZJxWzkiplt1Kts7LQtp6hMIPNC
 pQOAdjyzWyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ3tI+QAKCRCLPIo+Aiko
 1ePCCACRGyNBo5mLQxszxR5CuVNLwpNnrpdcVa5Xc8QZ9DQTFn8Xp6tc8z/ihv0E8VhducssM6Q
 NY/ziole3EI3iTYOmbeLbE4yDXI0Hq5KIuvlVslFoWBg32IXQj9xd/7Pm9gqkhuSXCRFa234w23
 FLXfwYSc+P+xI/ks0i6RYbpaLGnWi+R2PVR7xTbmx5ILQM0R0jtwTmV1v4VEvkNUVG+f8YMpi8M
 G3mMBvOd1XbR0om4c+jl9xp31jRJt+vTe2TPL58+xkfxaiFzTiQavjmkuCI/poo7Ru6xqcS5rtL
 4wRxIeeoNy6ZRF8flRm53V/vYs3VFmbxjNJzt9tk2xQcQspx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Move perf mode handling for the bandwidth to
_dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
and then aggregating known values.

Note, this changes the fix_core_ab_vote. Previously it would be
multiplied per the CRTC number, now it will be used directly for
interconnect voting. This better reflects user requirements in the case
of different resolutions being set on different CRTCs: instead of using
the same bandwidth for each CRTC (which is incorrect) user can now
calculate overall bandwidth required by all outputs and use that value.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 40 +++++++++++++--------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 70f43e8359caee2082f2ca9944a17a6a20aa3d49..7ff3405c6867556a8dc776783b91f1da6c86ef3f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -118,22 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
 		return;
 	}
 
-	memset(perf, 0, sizeof(struct dpu_core_perf_params));
-
-	if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
-		perf->bw_ctl = 0;
-		perf->max_per_pipe_ib = 0;
-		perf->core_clk_rate = 0;
-	} else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
-		perf->bw_ctl = core_perf->fix_core_ab_vote * 1000ULL;
-		perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
-		perf->core_clk_rate = core_perf->fix_core_clk_rate;
-	} else {
-		perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
-		perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
-		perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
-	}
-
+	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
+	perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
+	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
 	DRM_DEBUG_ATOMIC(
 		"crtc=%d clk_rate=%llu core_ib=%u core_ab=%u\n",
 			crtc->base.id, perf->core_clk_rate,
@@ -222,18 +209,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 {
 	struct dpu_core_perf_params perf = { 0 };
 	int i, ret = 0;
-	u64 avg_bw;
+	u32 avg_bw;
+	u32 peak_bw;
 
 	if (!kms->num_paths)
 		return 0;
 
-	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
+		avg_bw = 0;
+		peak_bw = 0;
+	} else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
+		avg_bw = kms->perf.fix_core_ab_vote;
+		peak_bw = kms->perf.fix_core_ib_vote;
+	} else {
+		dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
+		avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
+		peak_bw = perf.max_per_pipe_ib;
+	}
 
-	avg_bw = perf.bw_ctl;
-	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
+	avg_bw /= kms->num_paths;
 
 	for (i = 0; i < kms->num_paths; i++)
-		icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
+		icc_set_bw(kms->path[i], avg_bw, peak_bw);
 
 	return ret;
 }

-- 
2.39.5


