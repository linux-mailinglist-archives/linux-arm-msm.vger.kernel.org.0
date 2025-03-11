Return-Path: <linux-arm-msm+bounces-51048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E286BA5CEBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 20:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7F783A4F73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E615266190;
	Tue, 11 Mar 2025 19:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ahfQ7mK0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C047265CD6
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 19:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719755; cv=none; b=GRTn2FM1CKOrm9P+/UApX54s63MD8Ca3/HB+V7SyWVexIr3NX331JAHZ1et4Si66+3RfhrNnNgzi6oH32/COjjMqYg21x9l56KE/2qEyUOibo27p70la5dcaZxYhn7vDb4zFAglk+mIxoyWKNRTMJRvH0eismvBk2+qdlPHl5vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719755; c=relaxed/simple;
	bh=ydQVVgPonZ6qPuLltGk9wSNaGdVcoqspWvQbVsOodfM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oIG27YG3xh6tXkuUaHR9SYX6m/sH6vK6i8pkkhnfKk+2xJwN7TMM+mfaLtMz/YcY/sv0xN5Sq9RyNq9kOkkbn418tj0mwiY8/HFSDbYyrcLZOEOD17xTM2wtBuL1lFGsqmS/SM1hHqcB/WBCWhBjgrq5/MxIdb85VZ4S/+zo8FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ahfQ7mK0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-391295490c8so351712f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 12:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741719751; x=1742324551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SYVsKKZXPbcsvKhlX6Fd5jgnf07udLWPUc7NV4+Tv/w=;
        b=ahfQ7mK0+AKrb5ZBnFzfKMVBogo30Vk6792RH7PjdRMLGwIITcKSJ5m/KcMuFJcUl2
         b6mv2F6ruvk0gF/LFPfp3q7m9zgEWvbQc22ls8/UdTzC4r9miE3nCV92U4Fl2SptUt8u
         zSNs94nZb0DA0ZkMuwqRy5DkfrQq/PM2iOfS8HLrfi57k6T2AV5XuCxWTCRwsbpIOPyX
         rBLnPLaaATj+Anwl0BhheXQUuhDfM+unuvlH4zGPABjCnzWewVL+fnbQI7rHTCoBuugC
         IpCpunW5Yc74bTjIciiT2XGcHVhhbmdxqyuJfGpF5jOc+XM/E8LqfwNcDWowXFwe4ULZ
         WrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741719751; x=1742324551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYVsKKZXPbcsvKhlX6Fd5jgnf07udLWPUc7NV4+Tv/w=;
        b=qiOfWSzjurowsN9v0i4Nkdyc1nvjKOEhJQ/CI9GoW3dIHfhtS/IYnCbyiJxVeX87Bb
         7KG6dffk1Frm/fAC52RGrOGPUbPASAfyJjb0BWXK/HFkz1++B3uJg42I6TucCbF9Fmae
         jhs5MUtdPgWkLInQnXuEd6bTnI2beRlj83JQpZQU7GyAcTE+1TyE+/Sb9ulWYl2ma9iW
         d8bd2qLHfv8BqWTHTHnFSi0TeJZ2ERGl071BaD0l+W8+As0MYD4G29nT1TJtP4SaZXe8
         Z4ax9a3KCp7B3hSqIxBdMtMSiyZ4t9tfJN6on1E2aC2adSDqy89VYzNZIuiu0NwZNnTI
         gnZg==
X-Gm-Message-State: AOJu0YwrB8hdPHKS3PQrUhE+UnM45cVs5pVA/q1axBaOLcmUK1wRB22f
	d8bcAvBcnUUfSel5El6p/jbfgaukYYwcPqcaZsojl0Z3UUMWRZUdfDNNCfUV1K0=
X-Gm-Gg: ASbGncteHWukeJLlx8Qtygd6XFg9IhzyDQSYKQLnQdik2h5g5A6aRjPPFnC72zHoNpv
	8WruMgCCzBtejXVEBBMHePYD5AF3BV2DQ9uU8KQb3/cSWpm+rAJ4cSJxAvI0Hq3splodAVcuM/N
	xEsZGHlreehI7r/NTmBSkI5TlIfd6WspZSi7osXpuUP5FKgVjJE3FGq4wNJCa+vy/TLcVOIiCr0
	v51g4KHfAXsDpW6J7wqPtv1jKKo4dPPRQDO9Oly/JEf6AmI1mai9f7IItqbHU7dqhLl9dApauRC
	wlOE19ldOMqTWnJONRuFxOv9jJkcDGazwyFeDqisJHU+c6xvkei8Flsrrv0=
X-Google-Smtp-Source: AGHT+IFeAj+5/SP+w+sioHObmuTMmOAxjZrAJ1qq2pGl7Cp+Hhprgf1sKwAtJrii7xugoWDGpTYx/g==
X-Received: by 2002:a5d:648a:0:b0:391:c42:dae with SMTP id ffacd0b85a97d-39263edca4emr2158682f8f.4.1741719751259;
        Tue, 11 Mar 2025 12:02:31 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 12:02:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:01:56 +0100
Subject: [PATCH v4 06/19] drm/msm/dpu: Add missing "fetch" name to
 set_active_pipes()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-6-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ydQVVgPonZ6qPuLltGk9wSNaGdVcoqspWvQbVsOodfM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IiqfzAgIoP9umfZorOErCkdQm4O0c00MtUUw
 PWEMw/1mDmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIqgAKCRDBN2bmhouD
 10XwD/44cSmku2CjH8R6xEDkxg919YvbUcx9L4KjIhmXMt2VP2vGrRTr890lvff0+7KyBpaLMzz
 jmARiJu0porgJeiUrLpGBOi8Iv9LQzXW45mzD143grC/CXBpFnwsTxo3BBSYF6/GqmJKq3kvrEE
 Ur0nkhgBdc2cwdVWGm9AgRZaLuh9S1KZzvLe5xg1FgZ7DPsOE2qiYYMPaDJnmRxke/6NICRo/1y
 7sS20wyuzpoRCLT0jMg6WC4cCOt+36g7CAJ1zWZ1joLa+JJFMTOqJta1E5ZaSMg7PQV1BXNDrM8
 TjleUcmurjihWBkFEVl2KFRk+bpbl79tVM+fGzk9e1U29Pz0aiFx5qRejVUmlkGBmoP3qU2UWks
 zMfpZD+v/f6A7s9sBVzqjGCYl6MlgrAqcXY/qmRBIGIEhy1fFUfYv9D78HYU0rMIPMu+Lek6kIS
 Ddp69/dpbCdD5aRYNP1YEku3B65ykmTEc2/Q/tYMlRVBSJJmy0GrZ1jOXoirwTp0atdw6hdn3c4
 C/j2sPRo/+8XT2lyZ1bCpNf5xY0ENRqFW4rg7FuJuI4eVpZaNxOQSXnPECyJaxUSGjZ3b2S6+sg
 UTzPnIaMNz0ni+dtgVDDkP8hkExPCDm59aHosoi7c0YAg/ftlMsD1VHmZStmk7SsXqSKjf2cwnk
 ubNuPzr5ItQt0nw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

The set_active_pipes() callback configures CTL_FETCH_PIPE_ACTIVE and
newer DPU v12.0 comes with CTL_PIPE_ACTIVE, thus rename it to
set_active_fetch_pipes() to better match the purpose.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v2:
1. New patch
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0714936d883523e5c53bfb42f932234db76c58db..2d7af6fff2708c12520a78cc6c979b9930dffc95 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -445,9 +445,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
-	DECLARE_BITMAP(fetch_active, SSPP_MAX);
+	DECLARE_BITMAP(active_fetch, SSPP_MAX);
 
-	memset(fetch_active, 0, sizeof(fetch_active));
+	memset(active_fetch, 0, sizeof(active_fetch));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		state = plane->state;
 		if (!state)
@@ -464,7 +464,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		set_bit(pstate->pipe.sspp->idx, fetch_active);
+		set_bit(pstate->pipe.sspp->idx, active_fetch);
 		_dpu_crtc_blend_setup_pipe(crtc, plane,
 					   mixer, cstate->num_mixers,
 					   pstate->stage,
@@ -472,7 +472,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 					   &pstate->pipe, 0, stage_cfg);
 
 		if (pstate->r_pipe.sspp) {
-			set_bit(pstate->r_pipe.sspp->idx, fetch_active);
+			set_bit(pstate->r_pipe.sspp->idx, active_fetch);
 			_dpu_crtc_blend_setup_pipe(crtc, plane,
 						   mixer, cstate->num_mixers,
 						   pstate->stage,
@@ -492,8 +492,8 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		}
 	}
 
-	if (ctl->ops.set_active_pipes)
-		ctl->ops.set_active_pipes(ctl, fetch_active);
+	if (ctl->ops.set_active_fetch_pipes)
+		ctl->ops.set_active_fetch_pipes(ctl, active_fetch);
 
 	_dpu_crtc_program_lm_output_roi(crtc);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 216dfcabcb92d410ce185c0d34db69c99930d2b8..951d5dccab6faf34a519d06683514aea1ee6ef60 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -698,8 +698,8 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	}
 }
 
-static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
-	unsigned long *fetch_active)
+static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
+					      unsigned long *fetch_active)
 {
 	int i;
 	u32 val = 0;
@@ -787,7 +787,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
 	if (mdss_ver->core_major_ver >= 7)
-		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
+		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
 
 	c->idx = cfg->id;
 	c->mixer_count = mixer_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index aa560df698ed4e57a25e4a893d7333e19b065fe8..1b40d8cc92865e31e5ac4a8c3ee8fac8c5499bbd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -254,7 +254,7 @@ struct dpu_hw_ctl_ops {
 	void (*setup_blendstage)(struct dpu_hw_ctl *ctx,
 		enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg);
 
-	void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
+	void (*set_active_fetch_pipes)(struct dpu_hw_ctl *ctx,
 		unsigned long *fetch_active);
 };
 

-- 
2.43.0


